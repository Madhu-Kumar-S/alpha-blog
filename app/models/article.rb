class Article < ApplicationRecord
    # to validate
    # validates :fieldWhichYouWantToValidate, presence: true
    validates :title, presence: true, length: { minimum: 1, maximum: 50}
    validates :description, presence: true, length: { minimum: 1, maximum: 50}
end