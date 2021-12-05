# Class kubernetes kube_addons
class kubernetes::kube_addons (

  String $cni_network_provider               = $kubernetes::cni_network_provider,
  Optional[String] $cni_rbac_binding         = $kubernetes::cni_rbac_binding,
  Boolean $install_dashboard                 = $kubernetes::install_dashboard,
  String $dashboard_version                  = $kubernetes::dashboard_version,
  String $kubernetes_version                 = $kubernetes::kubernetes_version,
  String $kubernetes_dashboard_url           = $kubernetes::kubernetes_dashboard_url,
  Boolean $controller                        = $kubernetes::controller,
  Optional[Boolean] $schedule_on_controller  = $kubernetes::schedule_on_controller,
  String $node_name                          = $kubernetes::node_name,
<<<<<<< HEAD
  Array $path                                = $kubernetes::default_path,
  Optional[Array] $env                       = $kubernetes::environment,
){

  Exec {
    path        => $path,
    environment => $env,
=======
){

  Exec {
    path        => ['/usr/bin', '/bin'],
    environment => [ 'HOME=/root', 'KUBECONFIG=/etc/kubernetes/admin.conf'],
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    logoutput   => true,
    tries       => 10,
    try_sleep   => 30,
    }

  if $cni_rbac_binding {
    $shellsafe_binding = shell_escape($cni_rbac_binding)
    exec { 'Install calico rbac bindings':
    environment => $env,
    command     => "kubectl apply -f ${shellsafe_binding}",
    onlyif      => 'kubectl get nodes',
    unless      => 'kubectl get clusterrole | grep calico'
    }
  }

  $shellsafe_provider = shell_escape($cni_network_provider)
  exec { 'Install cni network provider':
    command     => "kubectl apply -f ${shellsafe_provider}",
    onlyif      => 'kubectl get nodes',
<<<<<<< HEAD
    unless      => "kubectl -n kube-system get daemonset | egrep '(flannel|weave|calico-node|cilium)'",
=======
    unless      => "kubectl -n kube-system get daemonset | egrep '(flannel|weave|calico-node)'",
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
    environment => $env,
    }

  if $schedule_on_controller {

    exec { 'schedule on controller':
      command => "kubectl taint nodes ${node_name} node-role.kubernetes.io/master-",
      onlyif  => "kubectl describe nodes ${node_name} | tr -s ' ' | grep 'Taints: node-role.kubernetes.io/master:NoSchedule'"
    }
  }

  if $install_dashboard  {
    $shellsafe_source = shell_escape($kubernetes_dashboard_url)
    exec { 'Install Kubernetes dashboard':
<<<<<<< HEAD
      command     => "kubectl apply -f ${shellsafe_source}",
      onlyif      => 'kubectl get nodes',
      unless      => 'kubectl -n kube-system get pods | grep kubernetes-dashboard',
      environment => $env,
=======
      command => "kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/${dashboard_version}/src/deploy/recommended/kubernetes-dashboard.yaml",
      onlyif  => 'kubectl get nodes',
      unless  => 'kubectl -n kube-system get pods | grep kubernetes-dashboard',
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
      }
    }
}
