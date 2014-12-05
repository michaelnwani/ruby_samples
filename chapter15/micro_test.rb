#Listing 15.9 - MicroTest, a testing class that emulates some MiniTest functionality
require_relative 'stacktracing' #i.e. callertools.rb

class MicroTest
  def self.inherited(c)
    c.class_eval do
      def self.method_added(m) #m is a symbol, not a method fyi
        if m =~ /^test/
          obj = self.new
          if self.instance_methods.include?(:setup)
            obj.setup
          end
          obj.send(m)
        end
      end
    end
  end
  
  def assert(assertion)
    if assertion
      puts "Assertion passed"
      true
    else
      puts "Assertion failed:"
      stack = CallerTools::Stack.new
      failure = stack.find {|call| call.meth !~ /assert/} # !~ i.e. "does not match this expression"
      puts failure
      false
    end
  end
  
  def assert_equal(expected, actual)
    result = assert(expected == actual)
    puts "(#{actual} is not #{expected})" unless result
    result
  end
  
end