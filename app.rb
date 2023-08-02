require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:new_square_calc)
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("number").to_f
  @the_result = @the_num ** 2 

  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end


get("/square_root/results") do
  @the_num = params.fetch("number").to_f
  @the_result = Math.sqrt(@the_num)

  erb(:square_root_results)
end

get("/payment/new") do
  erb(:new_payment_calc)
end

get("/payment/results") do
@interest = ((params.fetch("apr").to_f / 100) / 12)
@years = params.fetch("num_year").to_i * 12
@amount = (params.fetch("num_amount").to_f)

@numerator = @interest * @amount
@denominator = 1 - ((1 + @interest) ** -@years)

@payment = @numerator / @denominator

@display_apr = (params.fetch("apr").to_f).round(5).to_fs(:percentage)
@display_year = params.fetch("num_year")
@display_amount = (params.fetch("num_amount").to_f).to_fs(:currency)
@display_payment = (@numerator / @denominator).to_fs(:currency)
erb(:payment_results)
end

get("/random/new") do
  erb(:new_random_calc)
end

get("/random/results") do
  @min = params.fetch("min").to_f
  @max = params.fetch("max").to_f

  @random = rand(@min..@max)
  erb(:random_results)
end
