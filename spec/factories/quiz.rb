FactoryBot.define do
  factory :quiz do
    title { '元気ですか？'}
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/images/pocchi1.png'))}
    request_answer_on { "#{Date.current}" }
  end
end