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
      app_key:             ENV['dropbox_app_key'],
      app_secret:          ENV['dropbox_app_secret'],
      access_token:        ENV['dropbox_access_token'],
      access_token_secret: ENV['dropbox_access_token_secret'],
      user_id:             ENV['dropbox_user_id'],
      access_type:         "app_folder"
    }

  # validations
  #
  #

  validates :content, :answer, :typus, presence: true
  validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg)

end
