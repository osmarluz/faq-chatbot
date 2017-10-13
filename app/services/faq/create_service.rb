module FaqModule
  class CreateService
    def initialize(params)
      # TODO: identify origin and set company
      @company = Company.last
      @question = params["question-original"]
      @answer = params["answer-original"]
      @hashtags = params["hashtags-original"]
    end
  
    def call
      if @hashtags.nil? or @hashtags.empty? 
        return "Hashtag is a mandatory param"
      end

      begin
        Faq.transaction do
          faq = Faq.create(question: @question, answer: @answer, company: @company)
          @hashtags.split(/[\s,]+/).each do |hashtag|
          faq.hashtags << Hashtag.create(name: hashtag)
          end
        end
        "FAQ successfully created"
      rescue
        "An issue happened while creating the FAQ"
      end
    end
  end
end
