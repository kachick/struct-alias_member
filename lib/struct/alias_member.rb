# Copyright (C) 2012 Kenichi Kamiya

class Struct
  
  module Alias_Member
    
    VERSION = '0.0.1'.freeze
    
    class ArleadyDefinedError < RuntimeError; end
  
  end

  class << self
    
    # @return [Array<Symbol>]
    def aliases
      @aliases.dup
    end
    
    # @param [Symbol, String] name
    # @return [Symbol]
    def autonym(name)
      name = name.to_sym
      members.include?(name) ? name : (@aliases[name] || raise(KeyError))
    end
    
    # @param [Symbol, String] aliased
    # @param [Symbol, String] source
    # @return [Module]
    def alias_member(aliased, source)
      class_eval do
        aliased, source = aliased.to_sym, source.to_sym
        if @aliases.has_key?(aliased) or members.include?(aliased)
          raise Alias_Member::ArleadyDefinedError
        end
        
        @aliases[aliased] = source
      
        alias_method aliased, source
        alias_method :"#{aliased}=", :"#{source}="
      end
    end
    
    private
    
    def inherited(klass)
      super
      klass.class_eval do
        
        @aliases = {}
        
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
    end
    
  end

end