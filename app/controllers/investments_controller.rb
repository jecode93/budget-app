class InvestmentsController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @investments = @group.investments.order(id: :desc)
    @total_amount = @group.investments.sum(:amount)
  end

  def show; end

  def new
    @group_options = current_user.groups.all.map { |u| [u.name, u.id] }
    @investment = Investment.new
    @investment.group_investments.build
  end

  def create
    @investment = current_user.investments.new(investment_params)

    if @investment.save
      redirect_to group_investments_path, notices: 'Transaction add successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def destroy; end

  private

  def investment_params
    params.require(:investment).permit(:name, :amount, group_ids: [])
  end
end
