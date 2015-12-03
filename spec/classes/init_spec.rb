require 'spec_helper'
describe 'osad' do

  context 'with defaults for all parameters' do
    it { should contain_class('osad') }
  end
end
