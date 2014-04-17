class Question < ActiveRecord::Base

  CATEGORIES = {
    "politics"      => "Politik",
    "history"       => "Geschichte",
    "society"       => "Gesellschaft",
    "culture"       => "Kultur",
    "entertainment" => "Unterhaltung",
    "art"           => "Kunst",
    "music"         => "Musik",
    "science"       => "Naturwissenschaften",
    "tech"          => "Technik",
    "geography"     => "Geografie",
    "sports"        => "Sport",
    "gossip"        => "Tratsch",
    "regional"      => "Regionales"
  }

  TYPES = [
    'normal', 'Multiple-Choice', 'Schätzfrage',
    'Worträtsel', 'Bilderrätsel', 'Musik'
  ]

  # associations
  #
  #

  belongs_to :game
  has_many :category_mappings

  # meta programming
  #
  #

  acts_as_taggable
  has_attached_file :image, :styles => { :large => "800x800>", :medium => "300x300>", :thumb => "100x100>" }

  # validations
  #
  #

  validates :content, :answer, :typus, presence: true
  validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg)

end
