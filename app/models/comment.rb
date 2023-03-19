# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  author     :string           not null
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :bigint
#  project_id :bigint           not null
#
# Indexes
#
#  index_comments_on_parent_id   (parent_id)
#  index_comments_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (parent_id => comments.id)
#
class Comment < ApplicationRecord
  belongs_to :project
  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :replies, foreign_key: 'parent_id', class_name: 'Comment', dependent: :destroy

  default_scope { order(created_at: :desc) }
  scope :top_level, -> { where(parent_id: nil) }

  validates :author, presence: true
  validates :content, presence: true
end
