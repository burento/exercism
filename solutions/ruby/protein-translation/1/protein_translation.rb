class InvalidCodonError < StandardError
  def initialize(msg='Invalid codon')
    super(msg)
  end
end

class Translation
  SEQ = {AUG: "Methionine", UUU: "Phenylalanine", UUC: "Phenylalanine", UUA: "Leucine", 
         UUG: "Leucine", UCU: "Serine", UCC: "Serine", UCA: "Serine", UCG: "Serine",
         UAU: "Tyrosine", UAC: "Tyrosine", UGU: "Cysteine", UGC: "Cysteine",
         UGG: "Tryptophan", UAA: "STOP", UAG: "STOP", UGA: "STOP"}
  
  def self.of_rna(strand)
    proteins, ix, stopped = [], 2, false
    while ix <= strand.size 
      protein = SEQ[strand[ix-2..ix].to_sym]
      if protein == 'STOP'
        stopped = true
        break
      elsif protein == nil
        raise InvalidCodonError
      end
      proteins << protein
      ix += 3
    end
    raise InvalidCodonError if proteins.size > 0 and !stopped and (strand.size > ix-2)
    proteins    
  end
end  