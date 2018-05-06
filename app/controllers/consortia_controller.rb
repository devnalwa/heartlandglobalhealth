class ConsortiaController < ApplicationController
    def index
        @consortium = Consortium.order("created_at DESC")
    end
    
    def show
        @consortium = Consortium.find(params[:id])
    end
    
    def new
        @consortium = Consortium.new
    end
    
    def create 
        @consortium = Consortium.new(consortium_params)
        if @consortium.save
            redirect_to consortia_path, notice: "The Consortium has been successfully created."
        else
            render action: "new"
        end
    end
    
    def edit 
        @consortium = Consortium.find(params[:id])
    end
    
    def update
        @consortium = Consortium.find(params[:id])
        if @consortium.update_attributes(article_params)
            redirect_to consortia_path, notice: "The Consortium has been successfully updated."
        else 
            render action: "edit"
        end
    end
    
    private
    
    def consortium_params
        params.require(:consortium).permit(:name, :sub, :date, :time, :location)
    end
end
