# app/controllers/api/v1/users_controller.rb

module Api::V1
  class BudgetsController < ApiController
  	# before_action :authenticate_user!
  	before_action :set_budget, only: [:update, :destroy]
  	def index 
  		render json: Budget.all
  	end
  	def show 
  		render json: Budget.find(params[:id])
  	end
    # GET /v1/users
    def new
		# render json: User.all
		@budget = Budget.new 
    end

    def create
    	@budget = Budget.new(budget_params)
    	# @budget.user = User.find_by(api_key: token)
    	@budget.user = User.find_by(email: "eugenio@nuva.rocks")
    	# @budget.user = authenticate

    	if @budget.save 
    		# render :show, status: :created, location: @budget
    		render json: @budget
    	else
    		render json: @budget.errors, status: :unprocessable_entity
    	end
    end

    def update 
    	if @budget.update(budget_params)
    		render :show, status: :ok, location: @budget
    	else
    		render json: @budget.errors, status: :unprocessable_entity
    	end
    end

    def destroy 
    	@budget.destroy
    end

    private
    	def set_budget 
    		@budget = Budget.find(params[:id])
    	end 
    	def budget_params 
    		params.require(:budget).permit(:name, :total)
    	end

  end
end
