require 'httparty'
require 'json'
require 'hashie'

class Coned
  include HTTParty

  base_uri "http://apps.coned.com"
  format :json
  attr_reader :data, :brooklyn

  def fetch
    @directory = self.class.get(
      "/stormcenter_external/stormcenter_externaldata/data/interval_generation_data/metadata.xml", 
      :format => :xml).parsed_response['root']['directory']
      
    url = "/stormcenter_external/stormcenter_externaldata/data/interval_generation_data/#{@directory}/report.js"
    response = JSON.parse( self.class.get(url, :format => :text).parsed_response )
    @data = Hashie::Mash.new( response ).file_data.curr_custs_aff.areas.first
  end

  def bronx
    @data.areas[0]
  end

  def brooklyn
    @data.areas[1]
  end

  def manhattan
    @data.areas[2]
  end

  def queens
    @data.areas[3]
  end

  def staten_island
    @data.areas[4]
  end

  def westchester
    @data.areas[5]
  end

end
