class Struct; module Alias_Member

  module SubclassClassMethods
  
    # @return [Hash] aliasA => autonymX, aliasB => autonymY
    def aliases
      @aliases.dup
    end
    
    # @param [Symbol, String, #to_sym] name
    # @return [Symbol]
    def autonym_for_name(name)
      name = name.to_sym

      members.include?(name) ? name : @aliases.fetch(name)
    end
    
    
    # @param [Symbol, String, #to_sym, Integer, #to_int] key
    # @return [Symbol]
    def autonym_for_key(key)
      case key
      when ->v{v.respond_to? :to_sym}
        autonym_for_name key.to_sym
      when ->v{v.respond_to? :to_int}
        members.fetch key.to_int
      else
        raise TypeError
      end
    end

    # @param [Symbol, String, #to_sym] aliased
    # @param [Symbol, String, #to_sym] autonym
    # @return [Module]
    def alias_member(aliased, autonym)
      class_eval do
        aliased, autonym = aliased.to_sym, autonym.to_sym
        if @aliases.has_key?(aliased) or members.include?(aliased)
          raise Alias_Member::ArleadyDefinedError
        end
        
        @aliases[aliased] = autonym
      
        alias_method aliased, autonym
        alias_method :"#{aliased}=", :"#{autonym}="
      end
    end
  
  end

end; end
