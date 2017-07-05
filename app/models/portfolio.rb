class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image
  
  #Pretty much just references on how to create a custom scope. See 'How to Implement Custom Scopes in Rails 5' in section 2 for more instruction.
  def self.angular
    where(subtitle: 'Angular')
  end
  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }
  
  after_initialize :set_defaults 


    def set_defaults
    self.main_image ||= "http://placehold.jp/600x400.png"
    self.thumb_image||= "http://placehold.jp/350x200.png"
    end
end

