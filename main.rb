require 'sinatra'
require 'sinatra/reloader'
require 'active_support/all'

get '/' do
  erb :index
end

=begin
* PEST
# Politics
Politics

# Economics
Economics

# Society
Society

# Technology
Technology

=end
post '/convert' do
  result = ''
  flg = {Politics: false,Economics: false,Society: false,Technology: false}
  params[:section_1_result_id].lines do |pest|
    p = pest.chomp

    # insert title
    result << p if p == '# PEST'
    return erb :index if result.blank?

    # insert sub title
    if p == '# Politics'
      result << p
      flg[:Politics] = true
    elsif p == '# Economics'
      result << p
      flg[:Economics] = true
    elsif p == '# Society'
      result << p
      flg[:Society] = true
    elsif p == '# Technology'
      result << p
      flg[:Technology] = true
    end

    # insert content

  end

  @section_1_result = result
  erb :index
end
