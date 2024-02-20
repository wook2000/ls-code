require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

# require_relative 'cash_register'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(15)
    @input = StringIO.new('30\n')
    @output = StringIO.new
    # @transaction.amount_paid = 20
  end

  def test_prompt_for_payment
    @transaction.prompt_for_payment(input: @input, output:@output)
    assert_equal(30, @transaction.amount_paid)
  end
end