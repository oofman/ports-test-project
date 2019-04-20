require 'rails_helper'

RSpec.describe PortDetail, type: :service do

  describe "Do a basic search" do
    it 'Check for empty response' do

      params = {
          search: 'Test Dont find',
          port_type: 'airport'
      }

      device_index = PortDetail.new(params).list

      expect(device_index[:info][:amount]).to eql(0)

    end

  end

end
