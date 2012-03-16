require "ril_text/version"
require 'net/https'
require 'uri'

module RilText
  extend RilText

  API_DOMAIN = 'text.readitlaterlist.com'
  API_VERSION = 'v2'

  def get(url)
    https = Net::HTTP.new(API_DOMAIN, 443)
    https.use_ssl = true
    https.verify_mode = OpenSSL::SSL::VERIFY_NONE

    params = { :apikey => 'yourapikey', :url => url }

    result = Hash.new

    https.start do |access|
      response = access.get(request_uri(params))
      result[:text] = response.body
      response.each_header do |k, v|
        case k
        when 'x-title'
          result[:title] = v
        when 'x-resolved'
          result[:resolved] = v
        when 'x-image'
          result[:image] = v
        end
      end
    end

    result
  end

  private
  def request_uri(params)
    query_string = params.map{ |k, v| "#{URI.escape(k.to_s)}=#{URI.escape(v.to_s)}" }.join('&')
    "/#{API_VERSION}/text" + '?' + query_string
  end
end
