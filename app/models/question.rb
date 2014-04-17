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
  has_attached_file :image,
    :styles => { :large => "800x800>", :medium => "300x300>", :thumb => "100x100>" },
    :storage => :dropbox,
    #:dropbox_credentials => Rails.root.join("config/dropbox.yml")

    :dropbox_credentials => {
      app_key:             ENV['DROPBOX_APP_KEY'],
      app_secret:          ENV['DROPBOX_APP_SECRET'],
      access_token:        ENV['DROPBOX_ACCESS_TOKEN'],
      access_token_secret: ENV['DROPBOX_ACCESS_TOKEN_SECRET'],
      user_id:             ENV['DROPBOX_USER_ID'],
      access_type:         "app_folder"
    }

  # validations
  #
  #

  validates :content, :answer, :typus, presence: true
  validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg)

end
