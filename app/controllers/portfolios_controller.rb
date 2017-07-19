class PortfoliosController < ApplicationController
    
    layout 'portfolio'
    
    def index
        @portfolio_items = Portfolio.all
    end
    #DO NOT WORRY IF YOU DO NOT HAVE AN ANGULAR DEF HERE. Unless it causes issues it was just an extra file that wasn't really needed.
    #If it turns out I'm wrong and future me does need this, see Section 2, 'How to Implement Custom Scopes in Rails 5' at 11:50.
    def new
        @portfolio_item = Portfolio.new
        3.times { @portfolio_item.technologies.build }
    end
    
  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end
  
  def edit
      @portfolio_item = Portfolio.find(params[:id])
  end
  
  def update
      @portfolio_item = Portfolio.find(params[:id])
      
      respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @portfolio_item = Portfolio.find(params[:id])
  end
  
  def destroy
    #Perform the lookup
    @portfolio_item = Portfolio.find(params[:id])
    
    #Destroy/delete the record
    @portfolio_item.destroy
    
    #Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was removed.' }
    end
  end
  
  private
  
  def portfolio_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle,
                                      :body, 
                                      technologies_attributes: [:name]
                                     )
  end  
end

