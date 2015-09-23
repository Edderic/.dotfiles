class CommentedLine
  def initialize(line)
    @line = line
    @start_tag = @line.start_tag
    @end_tag = @line.end_tag
  end

  def uncomment
    if @line.commented?
      @line.first_white_spaces + meat
    else
      ""
    end
  end

  private

  def meat
    strip_end_tag(strip_start_tag(@line.to_s))
  end

  def strip_start_tag(line)
    line.sub(/^\s*#{@start_tag}\s?/, '')
  end

  def strip_end_tag(line)
    line.sub(/\s*#{@end_tag}\s*$/, '')
  end
end
