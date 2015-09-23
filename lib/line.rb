require_relative 'uncommented_line'
require_relative 'commented_line'

class Line
  attr_accessor :start_tag, :end_tag

  def initialize(string, start_tag, end_tag = '')
    @string = string
    @start_tag = start_tag
    @end_tag = end_tag || ''
    @uncommented_line = UncommentedLine.new(self)
    @commented_line = CommentedLine.new(self)
  end

  def first_white_spaces
    @string.scan(/^\s*/).first
  end

  def to_s
    @string
  end

  def commented?
    @string.match(/^\s*#{@start_tag}/) ? true : false
  end

  def non_whitespaced?
    @string.match(/\S/) ? true : false
  end

  def toggle_comment
    commented? ? @commented_line.uncomment : @uncommented_line.comment
  end
end
