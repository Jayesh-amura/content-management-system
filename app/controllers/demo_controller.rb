class DemoController < ApplicationController
  layout false
  def index
  	#render(:template => "demo/hello")
  	#render("demo/hello")
  	render("hello")#render => just setting the template to use
  end
  def hello
  	render("index")
  end
end
