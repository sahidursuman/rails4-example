# == Schema Information
#
# Table name: devise_usage_logs
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  user_ip    :string(255)
#  role       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  username   :string(255)
#  action     :string(255)
#

require 'spec_helper'

describe DeviseUsageLog do
  # pending "add some examples to (or delete) #{__FILE__}"
end
