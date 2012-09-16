class Struct; module Alias_Member
  
  module InstanceMethods
  
    # @param [Symbol, String, #to_sym, Fixnum] key
    def [](key)
      case key
      when Symbol, String
        super self.class.autonym(key)
      else
        super key, value
      end
    end
    
    # @param [Symbol, String, #to_sym, Fixnum] key
    # @return value
    def []=(key, value)
      case key
      when Symbol, String
        super self.class.autonym(key), value
      else
        super key, value
      end
    end

    # @see [ClassMethods#aliases]
    # @return [Hash]
    def aliases
      self.class.aliases
    end
    
    # @param [Symbol, String, #to_sym] name
    def member?(name)
      name = name.to_sym

      members.include?(name) || aliases.has_key?(name)
    end

  end

end; end
