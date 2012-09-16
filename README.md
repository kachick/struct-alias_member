struct-alias_member
====================

Standard Struct will be able to member aliasing.

Usage
-----

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

* Ruby - [1.9.2 or later](http://travis-ci.org/#!/kachick/struct-alias_member)

Install
-------

```bash
$ gem install struct-alias_member
```

Link
----

* [code](https://github.com/kachick/struct-alias_member)
* [API](http://kachick.github.com/struct-alias_member/yard/frames.html)
* [issues](https://github.com/kachick/struct-alias_member/issues)
* [CI](http://travis-ci.org/#!/kachick/struct-alias_member)
* [gem](https://rubygems.org/gems/struct-alias_member)

License
-------

The MIT X11 License  
Copyright (c) 2012 Kenichi Kamiya  
See the file LICENSE for further details.
