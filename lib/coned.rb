require 'httparty'

class Coned
  include HTTParty

  base_uri "http://apps.coned.com"
  format :json
  attr_reader :reponse, :directory

  def fetch
    @directory = self.class.get("/stormcenter_external/stormcenter_externaldata/data/interval_generation_data/metadata.xml", :format => :xml).parsed_response['root']['directory']
    url = "/stormcenter_external/stormcenter_externaldata/data/interval_generation_data/#{@directory}/report.js"
    @response = self.class.get(url, :format => :json).parsed_response
  end
end
