module FaqModule
  class RemoveService
    def initialize(params)
      # TODO: identify origin and set company
      @company = Company.last
      @params = params
      @id = params["id"]
    end
  
    def call
      begin
        faq = @company.faqs.find(@id)
      rescue
        return "Invalid question, please verify if the ID is correct"
      end
        
      Faq.transaction do
        faq.hashtags.each do |h|
          if h.faqs.count == 1
            h.delete
          end
        end
        faq.delete
        "FAQ successfully deleted"
      end
    end
  end
end
