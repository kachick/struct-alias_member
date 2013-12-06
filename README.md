struct-alias_member
====================

[![Build Status](https://secure.travis-ci.org/kachick/struct-alias_member.png)](http://travis-ci.org/kachick/struct-alias_member)
[![Gem Version](https://badge.fury.io/rb/struct-alias_member.png)](http://badge.fury.io/rb/struct-alias_member)

Description
------------

Struct will be able to alias the members name.

Usage
------

### Overview

```ruby
require 'struct/alias_member'

BankAccount = Struct.new :name, :balance do
  alias_member :money, :balance
end

ac = BankAccount.new 'John', 100
ac.money          #=> 100
ac[:money]        #=> 100
ac[:money] = 999
ac.balance        #=> 999
ac.member? :money #=> true
ac.aliases        #=> {:money=>:balance}
```

Requirements
------------

* [Ruby 1.9.3 or later](http://travis-ci.org/#!/kachick/struct-alias_member)

Install
-------

```bash
$ gem install struct-alias_member
```

Link
----

* [Home](http://kachick.github.com/struct-alias_member)
* [code](https://github.com/kachick/struct-alias_member)
* [API](http://kachick.github.com/struct-alias_member/yard/frames.html)
* [issues](https://github.com/kachick/struct-alias_member/issues)
* [CI](http://travis-ci.org/#!/kachick/struct-alias_member)
* [gem](https://rubygems.org/gems/struct-alias_member)

License
-------

The MIT X11 License  
Copyright (c) 2012 Kenichi Kamiya  
See MIT-LICENSE for further details.
