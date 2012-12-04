#!/usr/bin/env ruby

require 'net/http'
require 'uri'

uri = URI.parse 'http://localhost:3000/api/v1/contacts.json'
http = Net::HTTP.new uri.host, uri.port
req = Net::HTTP::Post.new uri.request_uri
req.set_form_data 'contact[first_name]' => 'api_first', 'contact[last_name]' => 'api_last',
  'contact[internal]' => 'Y', 'contact[email]' => 'api@apitest.com'
req.basic_auth 'compass-accounts-api', 'password'
res = http.request(req)
case res
when Net::HTTPSuccess then
  # Success
  puts res.body
else
  # Error
  puts res.body
end
