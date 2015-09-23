describe 'pgt' do
  describe 'without any arguments' do
    it 'should print out Usage information' do
      # value = `../lib/pgt`
      # expect(value).to raise_error('uhhh')
      allow(STDERR).to receive(:puts).with "error: uhhh"

      `../lib/pgt`

      expect(STDERR).to have_received(:puts)
    end
  end
end
