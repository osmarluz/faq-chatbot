class HelpService
  def self.call
    response  = "*What I know :raised_hands:* \n\n"
    response += "*Help*\n"
    response += ">List of instructions I know\n\n"
    response += "*Add to FAQ*\n"
    response += ">Add a new question to FAQ\n\n"
    response += "*Remove ID*\n"
    response += ">Remove a question using ID\n\n"
    response += "*What do you know about X*\n"
    response += ">Search by word on questions and answers list\n\n"
    response += "*Search by hashtag X*\n"
    response += ">List the questions and answers with a given hashtag\n\n"
    response += "*Questions and answers*\n"
    response += ">Show the list of questions and answers\n\n"
  end
end
