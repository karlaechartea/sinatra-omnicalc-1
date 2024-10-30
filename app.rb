require "sinatra"
require "sinatra/reloader"

get("/square/new") do
    erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 2

  erb(:square_results)
end


get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
@the_num = params.fetch("users_number").to_f

@the_result = @the_num ** 0.5

erb(:square_root_results)
end


get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
@apr_num = params.fetch("users_apr").to_f
@apr = @apr_num.to_fs(:percentage, {:precision => 4})
@apr_calc = @apr_num.to_f/100/12

@years = params.fetch("users_years").to_f
@periods = @years.to_i * 12

@principal_num = params.fetch("users_principal").to_f
@principal = @principal_num.to_fs(:currency)

@numerator = @apr_calc * @principal_num
@denominator = 1 - (1+@apr_calc) ** -@periods
@payment = ((@numerator / @denominator).round(2)).to_fs(:currency)

erb(:payment_results)
end


get("/random/new") do
  erb(:random)
end

get("/random/results") do
@min = params.fetch("users_min").to_f
@max = params.fetch("users_max").to_f

@num = rand(@min..@max)

erb(:random_results)
end
