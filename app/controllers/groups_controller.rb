class GroupsController < ApplicationController
    before_action :set_group, only: %i[show edit update destroy]
    before_action :authenticate_user!

    def index 
        @groups = Group.all
        respond_to do |format|
            format.html
            format.js
        end
    end

    def show 
    end

    def new
        @group = Group.new
    end

    def create
        @groups = Group.new(group_params)
        if @groups.save
            redirect_to root_path
        else
            render :new
        end
    end

    def edit
    
    end

    def update
        respond_to do |format|
            if @groups.update(group_params)
                format.html { redirect_to group_url(@groups), notice: "Group was successfully updated."}
            else
                format.html { render :edit, status: :unprocessable_entity}
            end
        end
    end 

    def destroy
        @groups.destroy
        respond_to do |format|
            format.html { redirect_to group_url, notice: "Group was successfully destroyed."}
        end
    end
    
    private
    def set_group    
        @groups = group.find(params[:id])
    end

    def group_params
        params.require(:group).permit(:name,:users)
    end
end
