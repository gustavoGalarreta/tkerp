class Person < ActiveRecord::Base
  acts_as_paranoid

  has_one :contact
  has_one :collaborator
  has_many :relationships
  has_many :collaborators, through: :relationships

  accepts_nested_attributes_for :contact, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :collaborator, reject_if: :all_blank, allow_destroy: true

  enum civil_status: [:single, :married, :widower, :divorced]
  enum gender: [:male, :female]

  validates :first_name, :last_name, presence: true
  validates_format_of :phone, :mobile, with: /\A(([ \)])[0-9]{1,3}([ \)]))?([\(][0-9]{1,3}[\)])?([0-9 \.\-]{1,9})\Z/, allow_blank: true
  validates_format_of :extension, with: /\A(([ \)])[0-9]{1,3}([ \)]))?([\(][0-9]{1,3}[\)])?([0-9 \.\-]{1,9})\Z/, allow_blank: true

  def name
    "#{first_name} #{last_name}"
  end
  alias_method :full_name, :name

end
