require_relative './../spec_helper.rb'

describe HelpService do
  describe '#call' do
    it "Response has the main commands" do
      response = HelpService.call()
      expect(response).to match('Help')
      expect(response).to match('Add to FAQ')
      expect(response).to match('Remove ID')
      expect(response).to match('What do you know about X')
      expect(response).to match('Search by hashtag X')
      expect(response).to match('Questions and answers')
    end
  end
end
