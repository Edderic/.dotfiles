require_relative '../lib/uncommented_line'
require_relative '../lib/line'

describe 'UncommentedLine' do
  describe '#comment' do
    describe 'HTML' do
      it 'should add the start and end tags' do
        line = Line.new('<html></html>', "<!--", "-->")
        uncommented_line = UncommentedLine.new(line)
        commented = uncommented_line.comment

        expect(commented).to eq '<!-- <html></html> -->'
      end

      describe '""' do
        it 'should add the start and end tags' do
          line = Line.new('', "<!--", "-->")
          uncommented_line = UncommentedLine.new(line)
          commented = uncommented_line.comment

          expect(commented).to eq '<!-- -->'
        end
      end
    end

    describe 'CSS' do
      it 'should add the start and end tags' do
        line = Line.new('div.block#element', '\/\*', '\*\/')
        uncommented_line = UncommentedLine.new(line)
        commented = uncommented_line.comment

        expect(commented).to eq '/* div.block#element */'
      end
    end
  end
  describe '#comment with Ruby' do
    describe '""' do
      it 'should return "#"' do
        line = Line.new("","#")
        uncommented_line = UncommentedLine.new(line)
        commented = uncommented_line.comment

        expect(commented).to eq "#"
      end
    end

    describe '"  hello"' do
      it 'should return "  # hello"' do
        line = Line.new("  hello", "#")
        uncommented_line = UncommentedLine.new(line)
        commented = uncommented_line.comment

        expect(commented).to eq "  # hello"
      end
    end

    describe '"word"' do
      it 'should return "# word"' do
        line = Line.new("word", "#")
        uncommented_line = UncommentedLine.new(line)
        commented = uncommented_line.comment

        expect(commented).to eq "# word"
      end
    end

    describe '" "' do
      it 'should return "#"' do
        line = Line.new(" ", "#")
        uncommented_line = UncommentedLine.new(line)
        commented = uncommented_line.comment

        expect(commented).to eq "#"
      end
    end
  end

  describe '#comment with Javascript' do
    describe '""' do
      it 'should return "//"' do
        line = Line.new("", "//")
        uncommented_line  = UncommentedLine.new(line)
        commented = uncommented_line.comment

        expect(commented).to eq "//"
      end
    end

    describe '"  hello there"' do
      it 'should return "  // hello"' do
        line = Line.new("  hello there", "//")
        uncommented_line = UncommentedLine.new(line)
        commented = uncommented_line.comment

        expect(commented).to eq "  // hello there"
      end
    end

    describe '"word"' do
      it 'should retun "// word"' do
        line = Line.new("word", "//")
        uncommented_line = UncommentedLine.new(line)
        commented = uncommented_line.comment

        expect(commented).to eq "// word"
      end
    end

    describe '" "' do
      it 'should return "#"' do
        line = Line.new(" ", "//")
        uncommented_line = UncommentedLine.new(line)
        commented = uncommented_line.comment

        expect(commented).to eq "//"
      end
    end
  end
end
