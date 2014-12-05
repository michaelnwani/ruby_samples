#Listing 15.5 - Beginning of the CallerTools module, including the Call class

module CallerTools
  class Call
    CALL_RE = /(.*):(\d+):in `(.*)'/
    attr_reader :program, :line, :meth
    
    def initialize(string)
      @program, @line, @meth = CALL_RE.match(string).captures
    end
    
    def to_s
      "%30s%5s%15s" % [program, line, meth]
    end
  end
  
  #Listing 15.6 - CallerTools::Stack class
  
  class Stack
    def initialize
      stack = caller
      @backtrace = stack.map do |call|
        Call.new(call)
      end
    end
    
    def report
      @backtrace.map do |call|
        call.to_s
      end
    end
    
    def find(&block)
      @backtrace.find(&block)
    end
  end
  
end