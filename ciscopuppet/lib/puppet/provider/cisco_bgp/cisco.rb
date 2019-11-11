# July, 2015
#
# Copyright (c) 2015-2016 Cisco and/or its affiliates.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'cisco_node_utils' if Puppet.features.cisco_node_utils?
begin
  require 'puppet_x/cisco/autogen'
rescue LoadError # seen on master, not on agent
  # See longstanding Puppet issues #4248, #7316, #14073, #14149, etc. Ugh.
  require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..',
                                     'puppet_x', 'cisco', 'autogen.rb'))
end

begin
  require 'puppet_x/cisco/cmnutils'
rescue LoadError # seen on master, not on agent
  # See longstanding Puppet issues #4248, #7316, #14073, #14149, etc. Ugh.
  require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..',
                                     'puppet_x', 'cisco', 'cmnutils.rb'))
end
Puppet::Type.type(:cisco_bgp).provide(:cisco) do
  desc 'The cisco bgp provider.'

  confine feature: :cisco_node_utils
  defaultfor operatingsystem: [:ios_xr, :nexus]

  mk_resource_methods

  # Property symbol array for method auto-generation.
  #
  # NOTE: For maintainability please keep this list in alphabetical order and
  # one property per line.
  BGP_NON_BOOL_PROPS = [
    :cluster_id,
    :confederation_id,
    :confederation_peers,
    :event_history_cli,
    :event_history_detail,
    :event_history_errors,
    :event_history_events,
    :event_history_objstore,
    :event_history_periodic,
    :disable_policy_batching_ipv4,
    :disable_policy_batching_ipv6,
    :graceful_restart_timers_restart,
    :graceful_restart_timers_stalepath_time,
    :maxas_limit,
    :reconnect_interval,
    :route_distinguisher,
    :router_id,
    :timer_bestpath_limit,
    :timer_bgp_keepalive,
    :timer_bgp_holdtime,
  ]
  BGP_BOOL_PROPS = [
    :bestpath_always_compare_med,
    :bestpath_aspath_multipath_relax,
    :bestpath_compare_routerid,
    :bestpath_cost_community_ignore,
    :bestpath_med_confed,
    :bestpath_med_missing_as_worst,
    :bestpath_med_non_deterministic,
    :disable_policy_batching,
    :enforce_first_as,
    :fast_external_fallover,
    :flush_routes,
    :graceful_restart,
    :graceful_restart_helper,
    :isolate,
    :log_neighbor_changes,
    :neighbor_down_fib_accelerate,
    :nsr,
    :shutdown,
    :suppress_fib_pending,
    :timer_bestpath_limit_always,
  ]

  BGP_ALL_PROPS = BGP_NON_BOOL_PROPS + BGP_BOOL_PROPS

  PuppetX::Cisco::AutoGen.mk_puppet_methods(:non_bool, self, '@bgp_vrf',
                                            BGP_NON_BOOL_PROPS)
  PuppetX::Cisco::AutoGen.mk_puppet_methods(:bool, self, '@bgp_vrf',
                                            BGP_BOOL_PROPS)

  def initialize(value={})
    super(value)
    asn = @property_hash[:asn]
    vrf = @property_hash[:vrf]
    @bgp_vrf = Cisco::RouterBgp.routers[asn][vrf] unless asn.nil?
    @property_flush = {}
  end

  def self.properties_get(asn, vrfname, instance)
    debug "Checking bgp instance, #{asn} #{vrfname}"
    current_state = {
      name:   "#{asn} #{vrfname}",
      asn:    asn,
      vrf:    vrfname,
      ensure: :present,
    }
    # Call node_utils getter for each property
    BGP_NON_BOOL_PROPS.each do |prop|
      current_state[prop] = instance.send(prop)
    end
    BGP_BOOL_PROPS.each do |prop|
      val = instance.send(prop)
      if val.nil?
        current_state[prop] = nil
      else
        current_state[prop] = val ? :true : :false
      end
    end
    debug current_state
    new(current_state)
  end # self.properties_get

  def self.instances
    bgp_instances = []
    Cisco::RouterBgp.routers.each do |asn, vrfs|
      vrfs.each do |vrfname, bgp_instance|
        bgp_instances << properties_get(asn, vrfname, bgp_instance)
      end
    end
    bgp_instances
  end # self.instances

  def self.prefetch(resources)
    bgp_instances = instances
    resources.keys.each do |name|
      provider = bgp_instances.find do |vrf|
        vrf.asn.to_s == resources[name][:asn].to_s &&
        vrf.vrf == resources[name][:vrf]
      end
      resources[name].provider = provider unless provider.nil?
    end
  end # self.prefetch

  def exists?
    @property_hash[:ensure] == :present
  end

  def create
    @property_flush[:ensure] = :present
  end

  def destroy
    @property_flush[:ensure] = :absent
  end

  def properties_set(new_vrf=false)
    BGP_ALL_PROPS.each do |prop|
      next unless @resource[prop]
      if new_vrf
        # Set @property_flush for the current object
        send("#{prop}=", @resource[prop])
      end
      next if @property_flush[prop].nil?
      # Call the AutoGen setters for the @bgp_vrf
      # node_utils object.
      @bgp_vrf.send("#{prop}=", @property_flush[prop]) if
        @bgp_vrf.respond_to?("#{prop}=")
    end
    # Set methods that are not autogenerated follow.
    timer_bgp_keepalive_hold_set
    timer_bestpath_limit_set
  end

  # Custom setters.
  # The following properties are setters and cannot be handled
  # by PuppetX::Cisco::AutoGen.mk_puppet_methods.
  def timer_bgp_keepalive_hold_set
    return unless
      @property_flush[:timer_bgp_keepalive] ||
      @property_flush[:timer_bgp_holdtime]

    if @property_flush[:timer_bgp_keepalive]
      keep = @property_flush[:timer_bgp_keepalive]
    else
      keep = @bgp_vrf.timer_bgp_keepalive
    end

    if @property_flush[:timer_bgp_holdtime]
      hold = @property_flush[:timer_bgp_holdtime]
    else
      hold = @bgp_vrf.timer_bgp_holdtime
    end
    @bgp_vrf.timer_bgp_keepalive_hold_set(keep, hold)
  end

  def timer_bestpath_limit_set
    return unless
      @property_flush[:timer_bestpath_limit] ||
      @property_flush[:timer_bestpath_limit_always]

    if @property_flush[:timer_bestpath_limit]
      limit = @property_flush[:timer_bestpath_limit]
    else
      limit = @bgp_vrf.timer_bestpath_limit
    end

    if @property_flush[:timer_bestpath_limit_always]
      always = @property_flush[:timer_bestpath_limit_always]
    else
      always = @bgp_vrf.timer_bestpath_limit_always
    end
    @bgp_vrf.timer_bestpath_limit_set(limit, always)
  end

  def legacy_image?
    utils = PuppetX::Cisco::Utils
    fd = Facter.value('cisco')
    image = fd['images']['system_image']
    image[/7.0.3.I2|I3|I4/] || utils.product_tag[/n(5k|6k|7k|9k-f)/]
  end

  def event_history_default?(prop)
    @property_hash[prop.to_sym] == @bgp_vrf.send("default_#{prop}")
  end

  def event_history_false?(prop)
    @property_hash[prop.to_sym] == 'false'
  end

  def event_history_cli
    case resource[:event_history_cli]
    when 'default'
      return 'default' if event_history_default?('event_history_cli')
    when 'true'
      return 'true' if event_history_default?('event_history_cli')
    when 'size_disable'
      return 'size_disable' if
        event_history_false?('event_history_cli') && !legacy_image?
    end
    @property_hash[:event_history_cli]
  end

  def event_history_cli=(should_value)
    should_value = @bgp_vrf.default_event_history_cli if
      should_value == 'default' || should_value == 'true'
    should_value = should_value.to_sym unless should_value =~ /\A\d+\z/
    @property_flush[:event_history_cli] = should_value
  end

  def event_history_detail
    case resource[:event_history_detail]
    when 'default'
      return 'default' if event_history_default?('event_history_detail')
    when 'size_disable'
      return 'size_disable' if
        event_history_default?('event_history_detail') && !legacy_image?
    end
    @property_hash[:event_history_detail]
  end

  def event_history_detail=(should_value)
    should_value = @bgp_vrf.default_event_history_detail if
      should_value == 'default'
    should_value = @bgp_vrf.default_event_history_detail if
      should_value == 'size_disable' && !legacy_image?
    should_value = should_value.to_sym unless should_value =~ /\A\d+\z/
    @property_flush[:event_history_detail] = should_value
  end

  def event_history_events
    case resource[:event_history_events]
    when 'default'
      return 'default' if event_history_default?('event_history_events')
    when 'true'
      return 'true' if event_history_default?('event_history_events')
    when 'size_disable'
      return 'size_disable' if event_history_false?('event_history_events')
    when 'size_large'
      return 'size_large' if event_history_default?('event_history_events') &&
                             !legacy_image?
    end
    @property_hash[:event_history_events]
  end

  def event_history_events=(should_value)
    should_value = @bgp_vrf.default_event_history_events if
      should_value == 'default' || should_value == 'true'
    should_value = 'false' if should_value == 'size_disable' && !legacy_image?
    should_value = 'true' if should_value == 'size_large' && !legacy_image?
    should_value = should_value.to_sym unless should_value =~ /\A\d+\z/
    @property_flush[:event_history_events] = should_value
  end

  def event_history_periodic
    case resource[:event_history_periodic]
    when 'default'
      return 'default' if event_history_default?('event_history_periodic')
    when 'true'
      return 'true' if event_history_default?('event_history_periodic') &&
                       legacy_image?
    when 'size_disable'
      return 'size_disable' if
        event_history_default?('event_history_periodic') && !legacy_image?
    end
    @property_hash[:event_history_periodic]
  end

  def event_history_periodic=(should_value)
    should_value = @bgp_vrf.default_event_history_periodic if
      should_value == 'default'
    should_value = @bgp_vrf.default_event_history_periodic if
      should_value == 'true' && legacy_image?
    should_value = @bgp_vrf.default_event_history_periodic if
      should_value == 'size_disable' && !legacy_image?
    should_value = should_value.to_sym unless should_value =~ /\A\d+\z/
    @property_flush[:event_history_periodic] = should_value
  end

  # confederation_peers requires a custom getter and setter because we are
  # working with arrays.  When the manifest entry is set to default,
  # puppet creates an array with the symbol default. [:default].
  # The net result is the getter needs to return [:default] and
  # the setter must check the array for symbol :default.
  def confederation_peers
    return @property_hash[:confederation_peers] if @resource[:confederation_peers].nil?
    if @resource[:confederation_peers][0] == :default &&
       @property_hash[:confederation_peers] == @bgp_vrf.default_confederation_peers
      return [:default]
    else
      @property_hash[:confederation_peers]
    end
  end

  def confederation_peers=(should_list)
    should_list = @bgp_vrf.default_confederation_peers if should_list[0] == :default
    @property_flush[:confederation_peers] = should_list.nil? ? nil : should_list.flatten
  end

  def flush
    if @property_flush[:ensure] == :absent
      @bgp_vrf.destroy
      @bgp_vrf = nil
    else
      if @bgp_vrf.nil?
        # Currently we can only configure a single BGP asn.
        new_vrf = true
        @bgp_vrf = Cisco::RouterBgp.new(@resource[:asn], @resource[:vrf])
      end
      properties_set(new_vrf)
    end
    puts_config
  end

  def puts_config
    if @bgp_vrf.nil?
      info "Vrf=#{@resource[:asn]} is absent."
      return
    end

    # Dump all current properties for this interface
    current = sprintf("\n%30s: %s", 'asn', @bgp_vrf.asnum)
    current.concat(sprintf("\n%30s: %s", 'vrf', @bgp_vrf.vrf))
    BGP_ALL_PROPS.each do |prop|
      current.concat(sprintf("\n%30s: %s", prop, @bgp_vrf.send(prop)))
    end
    debug current
  end # puts_config
end