require 'fast_priority_queue/version'
require 'thermite/fiddle'

class FastPriorityQueue
  def initialize
    @array = [nil]
    if block_given?
      @cmp = ->(a,b) { yield a,b }
    else
      @cmp = ->(a,b) { a <=> b }
    end
  end

  def compare(a,b)
    _compare(@cmp,a,b)
  end

  def add(x)
    _add(@array,@cmp,x)
  end

  def top
    @array[1]
  end

end

toplevel_dir = File.dirname(File.dirname(__FILE__))
Thermite::Fiddle.load_module('init_fast_priority_queue',
                             cargo_project_path: toplevel_dir,
                             ruby_project_path: toplevel_dir)