# coding: us-ascii

$VERBOSE = true

require 'test/declare'
require_relative '../lib/struct/alias_member'

The Struct.new(:a1, :b2){alias_member :c3, :b2} do |klass|    
  The klass.members do
    is [:a1, :b2]
  end
  
  The klass.aliases do
    is({:c3 => :b2})
  end
  
  The klass.new do |instance|
    ok {instance.member? :c3}
    ng {instance.member? :d4}
    
    CATCH KeyError do
      instance[:e5]
    end
    
    The instance.values do
      is [nil, nil]
    end
    
    The(instance[:c3] = 'OBJ') do
      same instance[:b2]
      same instance.b2
      same instance[:c3]
      same instance.c3
    end
      
    The instance.values do
      is [nil, 'OBJ']
    end
    
    The(instance[:a1] = '123') do
      same instance.a1
    end
    
    The instance[0] do
      same instance.a1
    end

    The instance[1] do
      same instance.b2
    end

    CATCH IndexError do
      instance[2]
    end

    The instance.values do
      is ['123', 'OBJ']
    end
  end
end
