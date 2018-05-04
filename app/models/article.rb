class Article < ApplicationRecord
  validates :title, presence: true

  scope :published, -> { where(published: true) }

  # def self.published
  #   where(published: true)
  # end

  def word_count
    self.body.split(" ").count
  end
end
