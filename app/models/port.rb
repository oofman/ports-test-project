class Port < ApplicationRecord

  validates :code, :presence => {:presence => true, message: "Please supply a valid code."}
  validates :name, :presence => {:presence => true, message: "Please supply a valid name."}
  validates :port_type, :presence => {:presence => true, message: "Please supply a valid port type."}

  def self._get_list_page(params)

    _page = (params[:page].present?) ? params[:page] : 1
    _port_type = (['seaport','airport'].include? params[:port_type]) ? params[:port_type] : nil

    _items = Port
    _items = _items.where("ports.name ILIKE ? OR ports.code ILIKE ? ","%#{params[:search]}%","%#{params[:search]}%") unless params[:search].nil?
    _items = _items.where(:port_type => _port_type) unless _port_type.nil?

    _items = _items.order('ports.name ASC').paginate(:page => _page, :per_page => 10)

  end

  def self._get_list_page_stats(params)
    _page = (params[:page].present?) ? params[:page] : 1
    _port_type = (['seaport','airport'].include? params[:port_type]) ? params[:port_type] : nil

    _items = Port
    _items = _items.where("ports.name ILIKE ? OR ports.code ILIKE ? ","%#{params[:search]}%","%#{params[:search]}%") unless params[:search].nil?
    _items = _items.where(:port_type => _port_type) unless _port_type.nil?
    _count = _items.count
    _offset = (10 * _page.to_i) - 10

    {
        :amount => _count,
        :page => _page,
        :total_pages => (_count/10.to_f).ceil,
        :per_page => 10,
        :str => "Viewing #{_offset+1} to #{_offset+10} out of #{_count} ports"
    }

  end

end
