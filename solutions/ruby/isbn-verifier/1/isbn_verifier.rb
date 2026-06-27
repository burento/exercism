class IsbnVerifier
  VALID_LEN = 10
  def self.valid?(isbn)
    isbn = isbn.gsub(/\-/,'')
    size = isbn.size
    isbn = isbn.gsub(/[^0-9X]/,'')
    return false unless isbn.size == VALID_LEN and size == isbn.size
    return false unless [nil, VALID_LEN-1].include?(isbn.index('X'))
    return isbn.chars.map.with_index do |n, i|
        (VALID_LEN-i) * (n == 'X' ? VALID_LEN : n.to_i)
      end.sum % 11 == 0
  end
end