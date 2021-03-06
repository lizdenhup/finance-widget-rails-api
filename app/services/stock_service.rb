class StockService 

  def fetch_stock(stock_symbol)
    @response = Faraday.get 'https://www.alphavantage.co/query?' do |req|
      req.params['function'] = 'TIME_SERIES_DAILY'
      req.params['symbol'] = stock_symbol
      req.params['apikey'] = ENV['ALPHA_VANTAGE_API_KEY']
    end
    @response.body
  end 

  def pin_stock(stockSymbol, stock_id)
    @user = User.find_by(email: params[:user][:email])
    if @user 
      @user.stocks << { stockSymbol: stockSymbol, stock_id: stock_id } 
    end 
  end 
  
end 