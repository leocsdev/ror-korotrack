# == Schema Information
#
# Table name: members
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(TRUE), not null
#  first_name :string           not null
#  kapisanan  :string
#  last_name  :string           not null
#  voice_part :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_members_on_active  (active)
#
class Member < ApplicationRecord
  KAPISANAN = %w[buklod kadiwa binhi].freeze
  VOICE_PARTS = %w[soprano alto tenor bass].freeze

  has_many :attendances, dependent: :restrict_with_error

  validates :first_name, :last_name, presence: true
  validates :kapisanan, inclusion: { in: KAPISANAN }
  validates :voice_part, inclusion: { in: VOICE_PARTS }

  scope :active, -> { where(active: true) }

  def full_name
    "#{first_name} #{last_name}"
  end
end
