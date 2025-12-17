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
require "test_helper"

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
