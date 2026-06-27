class Complement
  def self.of_dna(strand)
    rna = ''
    strand.size.times do |c|
      case strand[c]
      when 'G' then rna << 'C'
      when 'C' then rna << 'G'
      when 'T' then rna << 'A'
      when 'A' then rna << 'U'
      end
    end
    rna
  end
end