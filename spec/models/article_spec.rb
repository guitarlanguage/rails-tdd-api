require 'rails_helper'


RSpec.describe Article, type: :model do
  describe '#validations' do
    let(:article) { build(:article) }
    let(:slug) { build(:slug) }
    it "tests article object" do 
      # expect(1).to be_positive #be_positive => 1.positive? == true
      # exect(5).to be > 3
      # article = Article.create({title: "Sample Article", content: "Sample Content"})
      
      expect(article).to be_valid
    end
    it 'tests that factory is valid' do
      expect(article).to be_valid # article.valid? == true
      article.save!
      another_article = build(:article)
      expect(another_article).to be_valid
    end
    it 'has an invalid title' do
      article.title = ''
      expect(article).not_to be_valid
      expect(article.errors[:title]).to include("can't be blank")
    end
    it 'has invalid content' do
      article.content = ''
      expect(article).not_to be_valid
      expect(article.errors[:content]).to include("can't be blank")
    end
    it 'has an invalid slug' do
      article.slug = ''
      expect(article).not_to be_valid
      expect(article.errors[:slug]).to include("can't be blank")
    end
    # it 'does not have a unique slug' do
    #   article.slug = 'sample-article'
    #   expect(article).not_to be_valid
    #   expect(article.errors[:slug]).to include("slug must be unique ")
    # end
    it 'validates the uniqueness of the slug' do
      article1 = create(:article)
      expect(article1).to be_valid
      article2 = build(:article, slug: article1.slug)
      expect(article2).not_to be_valid
      expect(article2.errors[:slug]).to include('has already been taken')
    end
  end
end
