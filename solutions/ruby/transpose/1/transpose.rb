class Transpose
  def self.transpose(lines)
    max  = lines.split("\n").map(&:size).max
    lines.split("\n")
      .map { |s| s.gsub(" ", "~").ljust(max).chars }
      .transpose
      .map { |s| s.join.rstrip.gsub("~", " ") }
      .join("\n")
  end
end