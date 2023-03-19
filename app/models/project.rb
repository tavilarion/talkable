# frozen_string_literal: true

# == Schema Information
#
# Table name: projects
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string           not null
#  status      :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Project < ApplicationRecord
  STATUSES = {
    0 => 'On hold',
    1 => 'In review',
    2 => 'Completed'
  }.freeze

  default_scope { order(created_at: :desc) }

  validates :name, presence: true
  validates :status, presence: true

  has_many :comments

  def status
    STATUSES[super]
  end
end
