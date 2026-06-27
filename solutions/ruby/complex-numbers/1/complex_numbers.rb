class ComplexNumber
  attr :real, :imaginary
  
  def initialize(real, imaginary = 0)
    @real, @imaginary = real, imaginary
  end

  def +(other)
    ComplexNumber.new( @real + other.real, @imaginary + other.imaginary)
  end

  def -(other)
    ComplexNumber.new( @real - other.real, @imaginary - other.imaginary)
  end

  def *(other)
    ComplexNumber.new( ((@real * other.real) - (@imaginary * other.imaginary))\
                     , ((@imaginary * other.real) + (@real * other.imaginary)))
  end

  def /(other)
    ComplexNumber.new((((@real * other.real)+(@imaginary * other.imaginary)).to_f\
                          / (other.real**2 + other.imaginary**2))\
                      ,(((@imaginary * other.real)-(@real * other.imaginary)).to_f\
                          / (other.real**2 + other.imaginary**2)))
  end

  def ==(other)
    return (@real.to_f == other.real.to_f and @imaginary.to_f == other.imaginary.to_f)
  end

  def abs
    Math.sqrt(@real**2 + @imaginary**2)
  end

  def conjugate
    ComplexNumber.new(real, -1*@imaginary)
  end

  def exp
    ComplexNumber.new( Math.exp(@real) * Math.cos(@imaginary) \
                    , (Math.exp(@real) * Math.sin(@imaginary)).round(1) )
  end
end
