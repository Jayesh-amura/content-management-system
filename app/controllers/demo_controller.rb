class DemoController < ApplicationController
  layout false
  def index
  	#render(:template => "demo/hello")
  	#render("demo/hello")
  	#render("hello")#render => just setting the template to use
  end
  def hello
  	#render("index")
    @array = [1,2,3,4,5]
    @id = params['id'].to_i
    @page = params[:page].to_i
  end

  def other_hello
  	redirect_to(:controller => 'demo', :action => 'index')
  end

  def lynda
  	redirect_to("https://mail.google.com/mail/#inbox")
  end

end
