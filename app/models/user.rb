# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord

  has_many :questions, :foreign_key => "question_id", inverse_of: :asker
  has_many :answers, :foreign_key => "user_id",   inverse_of: :answerer

end
