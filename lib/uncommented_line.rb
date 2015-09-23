class UncommentedLine
  def initialize(line)
    @line = line
    @start_tag = strip_backslashes(line.start_tag)
    @end_tag = strip_backslashes(line.end_tag)
  end

  def comment
    if @line.non_whitespaced?
      "#{left_tag} #{meat}#{right_tag}"
    else
      "#{@start_tag}#{right_tag}"
    end
  end

  private

  def left_tag
    "#{@line.first_white_spaces}#{@start_tag}"
  end

  def meat
    @line.to_s.scan(/\S.*/).first
  end

  def right_tag
    unless @end_tag == ""
      " #{@end_tag}"
    else
      ""
    end
  end

  def strip_backslashes(line)
    line.gsub(/\\/, '')
  end
end
