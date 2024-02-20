require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(500)
    @transaction = Transaction.new(15)
    @total_money = 500
    @transaction.amount_paid = 20
  end

  def test_accept_money
    test_amount = @total_money + 20
    assert_equal(test_amount, @register.accept_money(@transaction))
  end

  def test_change
    test_amount = 20 - 15
    assert_equal(test_amount, @register.change(@transaction))
  end

  def test_give_receipt
    test_output = "You've paid $15.\n"
    assert_output(test_output) { @register.give_receipt(@transaction) }
  end
end
