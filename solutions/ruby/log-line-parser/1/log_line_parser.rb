class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    @line[ @line.index(']')+2, @line.size ].strip()
  end

  def log_level
    @line[ 1, @line.index(']')-1 ].downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
