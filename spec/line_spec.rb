require_relative '../lib/line'

describe 'Line' do
  describe '#to_s' do
    it 'should give us the line' do
      string = "hallo"
      start_tag = "#"
      line = Line.new(string, start_tag)

      expect(line.to_s).to eq string
    end
  end

  describe '#first_white_spaces' do
    describe '""' do
      it 'should return ""' do
        string = ""
        start_tag = "#"
        line = Line.new(string, start_tag)
        first_white_spaces = line.first_white_spaces

        expect(first_white_spaces).to eq ""
      end
    end

    describe '"  # hello world"' do
      it 'should return ""' do
        string = "  # hello world"
        start_tag = "#"
        line = Line.new(string, start_tag)
        first_white_spaces = line.first_white_spaces

        expect(first_white_spaces).to eq "  "
      end
    end
  end

  describe '#commented?' do
    describe '("hello", "#")' do
      it 'should return false' do
        string = "  hello"
        start_tag = "#"
        line = Line.new(string, start_tag)

        expect(line).not_to be_commented
      end
    end

    describe '("# hello", "#")' do
      it 'should return false' do
        string = "  # hello"
        start_tag = "#"
        line = Line.new(string, start_tag)

        expect(line).to be_commented
      end
    end
  end

  describe '#has_nonwhitespace' do
    describe '" #"' do
      it 'should return true' do
        string = " #"
        start_tag = "#"
        line = Line.new(string, start_tag)

        expect(line).to be_non_whitespaced
      end
    end

    describe '""' do
      it 'should return false' do
        string = ""
        start_tag = "#"
        line = Line.new(string, start_tag)

        expect(line).not_to be_non_whitespaced
      end
    end
  end

  describe '#toggle_comment' do
    describe 'when commented' do
      describe '" # hello"' do
        it 'should uncomment' do
          commented_line = double('CommentedLine')
          uncommented_line = double('UncommentedLine')
          allow(commented_line).to receive(:uncomment)
          allow(uncommented_line).to receive(:comment)
          allow(UncommentedLine).to receive(:new).and_return(uncommented_line)
          allow(CommentedLine).to receive(:new).and_return(commented_line)

          lineString = ' # hello'
          tag = '#'
          line = Line.new(lineString, tag)

          line.toggle_comment

          expect(commented_line).to have_received :uncomment
          expect(uncommented_line).not_to have_received :comment
        end
      end

      describe '"#"' do
        it 'should uncomment' do
          commented_line = double('CommentedLine')
          uncommented_line = double('UncommentedLine')
          allow(commented_line).to receive(:uncomment)
          allow(uncommented_line).to receive(:comment)
          allow(UncommentedLine).to receive(:new).and_return(uncommented_line)
          allow(CommentedLine).to receive(:new).and_return(commented_line)

          lineString = '#'
          tag = '#'
          line = Line.new(lineString, tag)

          line.toggle_comment

          expect(commented_line).to have_received :uncomment
          expect(uncommented_line).not_to have_received :comment
        end
      end
    end

    describe 'when uncommented' do
      describe '"  hello"' do
        it 'should comment' do
          commented_line = double('CommentedLine')
          uncommented_line = double('UncommentedLine')
          allow(commented_line).to receive(:uncomment)
          allow(uncommented_line).to receive(:comment)
          allow(UncommentedLine).to receive(:new).and_return(uncommented_line)
          allow(CommentedLine).to receive(:new).and_return(commented_line)

          lineString = '  hello'
          tag = '#'
          line = Line.new(lineString, tag)

          line.toggle_comment

          expect(uncommented_line).to have_received :comment
          expect(commented_line).not_to have_received :uncomment
        end
      end
    end
  end
end
