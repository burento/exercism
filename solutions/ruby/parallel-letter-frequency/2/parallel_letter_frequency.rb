module ParallelLetterFrequency
  def self.count(texts)
    ret_val = Hash.new(0)
    return ret_val if texts.empty?
    threads = texts.map do |text|
      Thread.new do
        format_text = text.downcase.gsub(/[^\p{L}a-z]/, '')
        format_text.each_char { |char| ret_val[char] += 1 }
      end
    end
    threads.each(&:join)
    ret_val
  end
  # def self.count(text)
  #   text = text.join if text.is_a?Array
  #   workers = (text.size >= 6000 ? 3 : 1)
  #   batch_size = (workers == 1 ? text.size : text.size/3)
  #   threads = []
  #   workers.times do |i|
  #     tstart = i*batch_size
  #     tend = (i+1 == workers ? text.size : tstart+batch_size)
  #     threads << Thread.new { self.read_text(text[tstart...tend]) }
  #   end
  #   results = {}
  #   threads.each do |thr|
  #     thr.join
  #     results = results.merge(thr.value) { |_, r, t| r + t }
  #   end
  #   results 
  # end

  # def self.read_text(text)
  #   text.gsub(/[[:punct:]0-9\s]/, "").downcase.chars.tally
  # end
end