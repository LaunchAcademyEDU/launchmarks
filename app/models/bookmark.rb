class Bookmark < ActiveRecord::Base
  belongs_to :author,
    foreign_key: :author_id,
    class_name: 'User',
    inverse_of: :bookmarks

  validates_presence_of :title
  validates_presence_of :url

  validate :url_properly_formed

  class << self
    def mass_assignable_attrs
      [:title, :url, :description]
    end
  end

  protected
  def url_properly_formed
    begin
      uri = URI.parse(url)
      if !uri.kind_of?(URI::HTTP)
        errors.add(:url, 'is invalid')
      end
    rescue URI::InvalidURIError
      errors.add(:url, 'is invalid')
    end
  end
end
