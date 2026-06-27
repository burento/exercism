class Nucleotide
  attr :seq
  BASE = { "A" => 0, "C" => 0, "G" => 0, "T" => 0}

  def initialize(seq)
    @seq = seq.chars.tally
  end
  
  def self.from_dna(seq)
    size = seq.size
    seq = seq.gsub(/[^AGCT]/,'')
    raise ArgumentError if seq.size != size
    self.new(seq)
  end

  def histogram
    @seq.merge(BASE) { |_, t, b| t + b }
  end
end