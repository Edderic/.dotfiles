require_relative '../lib/commented_line'
require_relative '../lib/line'

describe 'CommentedLine' do
  describe '#uncomment' do
    describe 'HTML' do
      it 'should remove the start and end tags' do
        line = Line.new('<!-- <html></html> -->', "<!--", "-->")
        commented_line = CommentedLine.new(line)
        uncommented = commented_line.uncomment

        expect(uncommented).to eq '<html></html>'
      end
    end

    describe 'CSS' do
      it 'should remove the start and end tags' do
        line = Line.new('/* div.block#element */', '\/\*', '\*\/')
        commented_line = CommentedLine.new(line)
        uncommented = commented_line.uncomment

        expect(uncommented).to eq 'div.block#element'
      end
    end
  end

  describe 'uncomment a line from a ruby file' do
    describe '""' do
      it 'should return an empty string' do
        line = Line.new('', "#")
        commented_line = CommentedLine.new(line)
        uncommented = commented_line.uncomment

        expect(uncommented).to eq ''
      end
    end

    describe '"#"' do
      it 'should return an empty string' do
        line = Line.new('#', "#")
        commented_line = CommentedLine.new(line)
        uncommented = commented_line.uncomment

        expect(uncommented).to eq ''
      end
    end

    describe '"# hello #"' do
      it 'should return "hello"' do
        line = Line.new('# hello #', "#")
        commented_line = CommentedLine.new(line)
        uncommented = commented_line.uncomment

        expect(uncommented).to eq 'hello #'
      end
    end

    describe '"  # hello there #"' do
      it 'should return "  hello there"' do
        line = Line.new('  # hello there #', "#")
        commented_line = CommentedLine.new(line)
        uncommented = commented_line.uncomment

        expect(uncommented).to eq '  hello there #'
      end
    end

    describe '"  #hello there #"' do
      it 'should return "  hello there"' do
        line = Line.new('  #hello there #', "#")
        commented_line = CommentedLine.new(line)
        uncommented = commented_line.uncomment

        expect(uncommented).to eq '  hello there #'
      end
    end
  end

  describe 'uncomment a line from a javascript file' do
    describe 'empty string' do
      it 'should return an empty string' do
        line = Line.new('', "\/\/")
        commented_line = CommentedLine.new(line)
        uncommented = commented_line.uncomment

        expect(uncommented).to eq ''
      end
    end

    describe '"//"' do
      it 'should return an empty string' do
        line = Line.new('//', "\/\/")
        commented_line = CommentedLine.new(line)
        uncommented = commented_line.uncomment

        expect(uncommented).to eq ''
      end
    end

    describe '"// hello #"' do
      it 'should return "hello"' do
        line = Line.new('// hello #', "\/\/")
        commented_line = CommentedLine.new(line)
        uncommented = commented_line.uncomment

        expect(uncommented).to eq 'hello #'
      end
    end

    describe '"  // hello there #"' do
      it 'should return "  hello there"' do
        line = Line.new('  // hello there #', "\/\/")
        commented_line = CommentedLine.new(line)
        uncommented = commented_line.uncomment

        expect(uncommented).to eq '  hello there #'
      end
    end

    describe '"  //hello there \/\/"' do
      it 'should return "  hello there"' do
        line = Line.new('  //hello there #', "\/\/")
        commented_line = CommentedLine.new(line)
        uncommented = commented_line.uncomment

        expect(uncommented).to eq '  hello there #'
      end
    end

    describe '"// }"' do
      it 'should return "}"' do
        line = Line.new('// }', "\/\/")
        commented_line = CommentedLine.new(line)
        uncommented = commented_line.uncomment

        expect(uncommented).to eq '}'
      end
    end
  end
end
