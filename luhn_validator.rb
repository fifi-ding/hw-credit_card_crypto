# frozen_string_literal: true

# CreditCard Validator
module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)
    # # TODO: use the integers in nums_a to validate its last check digit
    check_digit = nums_a.pop # Extract the last digit

    # Reverse the remaining digits and apply Luhn transformation
    sum = nums_a.reverse.each_with_index.sum do |digit, index|
      value = index.even? ? digit * 2 : digit
      value > 9 ? value - 9 : value
    end

    # Compute the total sum and determine validity

    ((sum + check_digit) % 10).zero?
  end
end
