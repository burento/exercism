

class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class UnsupportedOperation < StandardError
    def initialize(msg = "This operation is not supported.")
      super(msg)
    end
  end

  def self.calculate(first_operand, second_operand, operation)
    begin 
      if (not first_operand.is_a? Numeric) or (not second_operand.is_a? Numeric)
        raise ArgumentError.new("Invalid argument")
      elsif (not ALLOWED_OPERATIONS.include? operation) or operation == nil
        raise UnsupportedOperation.new("Operation '#{operation}' is not supported.")
      end
      res = "#{first_operand} #{operation} #{second_operand}"
      res = "#{res} = #{eval(res)}"
      debug "#{res}"
      return res
    rescue ZeroDivisionError => e
      return "Division by zero is not allowed."
    end
  end
end
