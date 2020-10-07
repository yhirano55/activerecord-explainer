# frozen_string_literal: true

require 'spec_helper'
require 'activerecord/explainer/subscriber'

RSpec.describe ActiveRecord::Explainer::Subscriber do
  before(:context) do
    ActiveRecord::Explainer.config.logger = Logger.new(File::NULL)
    ActiveRecord::Explainer::Subscriber.attach_to(:active_record)
  end

  context 'When a model using optimistic locking' do
    let(:user) { User.create!(username: 'John') }

    it 'should not reset affected_rows' do
      expect { user.update!(username: 'Jane') }.not_to raise_error
    end
  end
end
