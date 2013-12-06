# coding: us-ascii

class Struct; module Alias_Member
  
  module SubclassInstanceMethods
  
    # @param [Symbol, String, #to_sym, Integer, #to_int] key
    def [](key)
      super self.class.autonym_for_key(key)
    end
    
    # @param [Symbol, String, #to_sym, Integer, #to_int] key
    # @return value
    def []=(key, value)
      super self.class.autonym_for_key(key), value
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
