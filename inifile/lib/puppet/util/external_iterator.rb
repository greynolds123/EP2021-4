<<<<<<< HEAD
module Puppet::Util
  #
  # external_iterator.rb
  #
=======
module Puppet
module Util
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
  class ExternalIterator
    def initialize(coll)
      @coll = coll
      @cur_index = -1
    end

    def next
<<<<<<< HEAD
      @cur_index += 1
=======
      @cur_index = @cur_index + 1
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
      item_at(@cur_index)
    end

    def peek
      item_at(@cur_index + 1)
    end

    private
<<<<<<< HEAD

=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    def item_at(index)
      if @coll.length > index
        [@coll[index], index]
      else
        [nil, nil]
      end
    end
  end
end
<<<<<<< HEAD
=======
end
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
