# Copyright (C) 2012 Kenichi Kamiya

class Struct
  
  module Alias_Member
    
    VERSION = '0.0.1'.freeze
    
    class ArleadyDefinedError < RuntimeError; end
    
  end

end

require_relative 'alias_member/classmethods'
require_relative 'alias_member/instancemethods'
require_relative 'alias_member/core_ext'
