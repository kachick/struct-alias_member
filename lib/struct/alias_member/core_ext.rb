# Copyright (C) 2012 Kenichi Kamiya

class Struct

  extend Alias_Member::ClassMethods

  class << self
    
    private
    
    def inherited(klass)
      super
      
      klass.class_eval do
        
        @aliases = {}
        
        include Alias_Member::InstanceMethods
      end
    end
    
  end

end