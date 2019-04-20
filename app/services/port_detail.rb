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
    file_size = (file.size.to_f / (1000 * 1000))

    return { error: 'file content type not accepted' } unless file.content_type == 'text/csv'
    return { error: '5MB is the max file size.' } unless file_size <= 5

    counter = 0
    counter2 = 0

    ports = Port.select('DISTINCT code').all
    _port_codes = ports.map(&:code)
    _ports = []

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


      if !_port_codes.include? row[2]
        _ports.push(port_params)
        counter += 1
      else
        counter2 += 1
      end

    end

    if _ports.length > 0
      Port.transaction do
        _ports.each do |_port|
          Port.create!(_port)
        end
      end
    end

    { info: "imported #{counter} ports, #{counter2} duplicates found" }

  end

end
