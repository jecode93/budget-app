class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
    @investment = current_user.investments
    @total_amount = @investment.sum(:amount)
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      redirect_to groups_path, notices: 'Group created successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to @group, notices: 'Group update successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path, status: :see_other
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
