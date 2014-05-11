class Question < ActiveRecord::Base

  CATEGORIES = {
    "Politik"             => { title: "Politik",             color: 'blue1'   },
    "Geschichte"          => { title: "Geschichte",          color: 'blue2'   },
    "Gesellschaft"        => { title: "Gesellschaft",        color: 'blue3'   },
    "Kultur"              => { title: "Kultur",              color: 'red1'    },
    "Unterhaltung"        => { title: "Unterhaltung",        color: 'red2'    },
    "Kunst"               => { title: "Kunst",               color: 'red3'    },
    "Musik"               => { title: "Musik",               color: 'red4'    },
    "Naturwissenschaften" => { title: "Naturwissenschaften", color: 'green1'  },
    "Technik"             => { title: "Technik",             color: 'green2'  },
    "Geografie"           => { title: "Geografie",           color: 'green3'  },
    "Sport"               => { title: "Sport",               color: 'yellow1' },
    "Tratsch"             => { title: "Tratsch",             color: 'yellow2' },
    "Regionales"          => { title: "Regionales",          color: 'yellow3' }
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
  has_attached_file :image,
    styles: {
      large:  "800x800>",
      medium: "300x300>",
      thumb:  "100x100>"
    }

  # validations
  #
  #

  validates :content, :answer, :typus, presence: true
  validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg)

  # class methods
  #
  #

  def self.for(game, round, position)
    Question.find_by(game_id: game.id, round: round, position: position)
  end

  # instance methods
  #
  #

  def has_category?(title)
    self.category_mappings.collect { |cm| cm.category.title }.include? title
  end

end
