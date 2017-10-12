require_relative './spec_helper.rb'
require_relative '../app.rb'

RSpec.describe App  do
  it 'get sinatra response' do
    get '/'
    expect(last_response).to be_ok
  end
end
