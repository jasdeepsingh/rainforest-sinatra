class RainforestClient

  BASE_URL = 'https://app.rainforestqa.com/api/1/'
  attr_accessor :api_token

  def initialize(api_token)
    @api_token = api_token
  end

  def get(resource)
    response = HTTParty.get(BASE_URL + resource, headers: { 'CLIENT_TOKEN' => @api_token }, verify: false)
    JSON.parse(response.body)
  end

  def sites_lookup
    sites = get('/sites')
    Hash[ sites.map { |site| [site['id'], site['name']] } ]
  end

  def test_lookup
    tests = get('/tests')
    results = []
    hsh = tests.map { |test| [ test['site_id'], results << test['result'] ] }
    Hash[hsh]
  end

  def status
    sites_lookup.map do |site_id, site_name|
      RainforestSite.new(site_name, test_lookup[site_id])
    end
  end

end