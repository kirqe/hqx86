require 'rails_helper'

RSpec.describe Build, type: :model do
  it { should belong_to(:user) }
end
