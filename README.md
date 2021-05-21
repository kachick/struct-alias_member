struct-alias_member
====================

* ***This repository is archived***
* ***No longer maintained***
* ***All versions have been yanked from https://rubygems.org/ for releasing valuable namespace for others***

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

* Ruby 2.5 or later

License
-------

The MIT X11 License  
Copyright (c) 2012 Kenichi Kamiya  
See MIT-LICENSE for further details.
