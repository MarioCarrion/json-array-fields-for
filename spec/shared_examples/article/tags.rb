# frozen_string_literal: true
shared_examples :concerns_article_tags do
  it { is_expected.to respond_to(:tags) }

  describe '#tag_attributes=' do
    let(:attributes) do
      {
        '0' => { 'name' => '1' },
        '1' => { 'name' => '2' },
        '2' => { 'name' => '3' }
      }
    end

    it 'saves the values' do
      subject.tags_attributes = attributes

      expect(subject.tags.map { |x| x.name }).to match(%W(1 2 3))
    end
  end # tag_attributes=
end
