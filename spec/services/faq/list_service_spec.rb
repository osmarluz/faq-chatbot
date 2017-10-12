require_relative './../../spec_helper.rb'

describe FaqModule::ListService do
  before do
    @company = create(:company)
  end

  describe '#call' do
    it "Using list command with zero faqs, return nothing was found message" do
      @listService = FaqModule::ListService.new({}, 'list')

      response = @listService.call()
      expect(response).to match("Nothing was found")
    end

    it "Using list command with two faqs, find questions and answers in response" do
      @listService = FaqModule::ListService.new({}, 'list')

      faq1 = create(:faq, company: @company)
      faq2 = create(:faq, company: @company)

      response = @listService.call()

      expect(response).to match(faq1.question)
      expect(response).to match(faq1.answer)

      expect(response).to match(faq2.question)
      expect(response).to match(faq2.answer)
    end

    it "Using search command with empty query, return nothing was found message" do
      @listService = FaqModule::ListService.new({'query' => ''}, 'search')

      response = @listService.call()
      expect(response).to match("Nothing was found")
    end

    it "Using search command with valid query, find question and answer in response" do
      faq = create(:faq, company: @company)

      @listService = FaqModule::ListService.new({'query' => faq.question.split(" ").sample}, 'search')

      response = @listService.call()

      expect(response).to match(faq.question)
      expect(response).to match(faq.answer)
    end

    it "Using search_by_hashtag command with empty hashtag, return nothing was found message" do
      @listService = FaqModule::ListService.new({'query' => ''}, 'search_by_hashtag')

      response = @listService.call()
      expect(response).to match("Nothing was found")
    end

    it "Using search_by_hashtag command with valid hashtag, find question and answer in response" do
      faq = create(:faq, company: @company)
      hashtag = create(:hashtag, company: @company)
      create(:faq_hashtag, faq: faq, hashtag: hashtag)

      @listService = FaqModule::ListService.new({'query' => hashtag.name}, 'search_by_hashtag')

      response = @listService.call()

      expect(response).to match(faq.question)
      expect(response).to match(faq.answer)
    end
  end
end
