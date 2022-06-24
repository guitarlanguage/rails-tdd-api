require 'rails_helper'


RSpec.describe Article, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "tests article object" do 
    # expect(1).to be_positive #be_positive => 1.positive? == true
    # exect(5).to be > 3
    # article = Article.create({title: "Sample Article", content: "Sample Content"})
    article = FactoryBot.create(:article)
    expect(article.title).to eq("Sample Article")
  end
end
