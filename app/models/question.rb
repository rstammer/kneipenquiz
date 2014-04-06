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

  # validations
  #
  #

  validates :content, :answer, :typus, presence: true

  # meta programming
  #
  #

  acts_as_taggable

end
