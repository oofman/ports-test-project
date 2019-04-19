class PortDetail
  def initialize(params)
    @params = params
    @result = {}
  end

  def list
     @result = {
        :info => Port._get_list_page_stats(@params),
        :data => Port._get_list_page(@params)
     }

    return @result
  end
end
