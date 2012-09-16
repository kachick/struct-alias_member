class Struct; module Alias_Member

  module ClassMethods
    
    private
    
    def inherited(cls)
      super
      
      cls.class_eval do
        extend Alias_Member::SubclassClassMethods
        include Alias_Member::SubclassInstanceMethods        
        @aliases = {}
      end
    end
    
  end

end; end
