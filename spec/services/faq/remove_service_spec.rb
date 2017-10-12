require_relative './../../spec_helper.rb'

describe FaqModule::RemoveService do
  before do
    @company = create(:company)
  end

  describe '#call' do
    it "With valid ID, remove faq" do
      faq = create(:faq, company: @company)
      @removeService = FaqModule::RemoveService.new({"id" => faq.id})
      response = @removeService.call()

      expect(response).to match("FAQ successfully deleted")
    end

    it "With valid ID, remove faq from the database" do
      faq = create(:faq, company: @company)
      @removeService = FaqModule::RemoveService.new({"id" => faq.id})

      expect(Faq.all.count).to eq(1)
      response = @removeService.call()
      expect(Faq.all.count).to eq(0)
    end

    it "With invalid ID, receive an error message" do
      @removeService = FaqModule::RemoveService.new({"id" => rand(1..9999)})
      response = @removeService.call()
  
      expect(response).to match("Invalid question, please verify if the ID is correct")
    end
  end
end
