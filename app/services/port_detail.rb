class PortDetail
  def initialize(params)
    @params = params
    @result = {}
  end

  def list
    @result = {
      info: Port._get_list_page_stats(@params),
      data: Port._get_list_page(@params)
    }

  end

  def import
    @result = process_csv

  end

  private

  def process_csv

    file = @params[:file]
    return { error: 'file content type not accepted' } unless file.content_type == 'text/csv'

    counter = 0
    counter2 = 0
    CSV.foreach(file.path) do |row|

      #exclude heading row
      next if row[0].to_s.downcase == 'id' && row[1].to_s.downcase == 'name' && row[2].to_s.downcase == 'code'

      port_params = {
        code: row[2],
        name: row[1],
        city: row[3],
        latitude: row[5],
        longitude: row[6],
        big_schedules: row[7],
        port_type: row[10],
        hub_port: ((row[11].to_s.downcase == 'true') ? true : false),
        oi_code: row[4],
        oi: row[12]
      }

      port = Port.where(:code => row[2]).first
      if !port
        port = Port.new(port_params)
        if port.save
          counter += 1
        end
      else
        counter2 += 1
      end

    end

    { info: "imported #{counter} ports, #{counter2} duplicates found" }

  end

end
