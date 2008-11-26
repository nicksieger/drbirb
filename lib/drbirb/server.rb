require 'irb'
require 'drb'

module IRB
  def IRB.start_with_io_procs input_proc=nil, output_proc=nil
    irb = Irb.new nil, RemoteReadlineInputMethod.new(input_proc),
    RemoteOutputMethod.new(output_proc)

    @CONF[:IRB_RC].call(irb.context) if @CONF[:IRB_RC]
    @CONF[:MAIN_CONTEXT] = irb.context

    trap("SIGINT") do
      irb.signal_handle
    end

    catch(:IRB_EXIT) do
      irb.eval_input
    end
  end

  class RemoteReadlineInputMethod < ReadlineInputMethod
    attr_accessor :callback
    def initialize callback
      @callback = callback
      super()
    end

    def readline prompt, ignore
      callback[prompt]
    end
  end

  class RemoteOutputMethod < OutputMethod
    attr_accessor :callback
    def initialize callback
      @callback = callback
      super()
    end

    def print(*args)
      callback[args * '']
    end
  end

  class RemoteService
    def initialize
      # i was getting e2mmap redefinition warnings,
      # so moved this out of start_with_io
      IRB.setup nil
    end

    def irb_start input_proc=nil, output_proc=nil
      IRB.start_with_io_procs input_proc, output_proc
    end
  end

  # patch a (IMO) bug in IRB - output methods are ignored?
  class Irb
    def print(*args)
      context.instance_variable_get(:@output_method).print(*args)
    end

    def printf(*args)
      context.instance_variable_get(:@output_method).printf(*args)
    end
  end
end
