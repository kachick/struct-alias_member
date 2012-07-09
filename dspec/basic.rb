$VERBOSE = true

require_relative '../lib/struct/alias_member'
require 'declare'

Declare do

  The Struct.new(:a1, :b2){alias_member :c3, :b2} do |klass|
    
    The klass.members do
      is [:a1, :b2]
    end
    
    The klass.aliases do
      is({:c3 => :b2})
    end

    The klass.new do |instance|
      TRUTHY instance.member? :c3
      FALTHY instance.member? :d4
      
      The instance.values do
        is [nil, nil]
      end
      
      The (instance[:c3] = 'OBJ') do
        EQUAL instance[:b2]
        EQUAL instance.b2
        EQUAL instance[:c3]
        EQUAL instance.c3
      end
      
      The instance.values do
        is [nil, 'OBJ']
      end
      
      The (instance[:a1] = '123') do
        EQUAL instance.a1
      end
      
      The instance.values do
        is ['123', 'OBJ']
      end
    end
  end
  
end
