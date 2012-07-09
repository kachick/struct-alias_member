$VERBOSE = true

require_relative '../lib/struct/alias_member'

BankAccount = Struct.new :name, :balance do
  alias_member :money, :balance
end

ac = BankAccount.new 'John', 100
p ac.money          #=> 100
p ac[:money]        #=> 100
p ac[:money] = 999
p ac.balance        #=> 999
p ac.member? :money #=> true
p ac.aliases        #=> {:money=>:balance}
