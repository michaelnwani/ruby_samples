#Listing 15.1 - Using included to add a class method as part of the mix-in operation
# module M
#   def self.included(cl)
#     def cl.a_class_method
#       puts "Now the class has a new class method."
#     end
#   end
#
#   def an_inst_method
#     puts "This module supplies this instance method."
#   end
# end


#Listing 15.2 - Triggering a callback from an extend event
# module M
#   def self.extended(obj)
#     puts "Module #{self} is being used by #{obj}."
#   end
#   def an_inst_method
#     puts "This module supplies this instance method."
#   end
# end

#Listing 15.3 - Extending an object and including it into its singleton class
module M
  def self.included(c)
    puts "#{self} included by #{c}."
  end
  def self.extended(obj)
    puts "#{self} extended by #{obj}."
  end
end


