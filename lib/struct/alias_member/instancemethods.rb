# Copyright (C) 2012 Kenichi Kamiya

class Struct; module Alias_Member
  
  module InstanceMethods
  
    def [](key)
      case key
      when Symbol, String
        super self.class.autonym(key)
      else
        super
      end
    end
    
    # @return [value]
    def []=(key, value)
      case key
      when Symbol, String
        super self.class.autonym(key), value
      else
        super
      end
    end

    # @return [Array<Symbol>]
    def aliases
      self.class.aliases
    end
    
    def member?(name)
      name = name.to_sym
      members.include?(name) || aliases.has_key?(name)
    end

  end

end; end
