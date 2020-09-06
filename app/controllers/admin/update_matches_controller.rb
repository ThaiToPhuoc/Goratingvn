class Admin::UpdateMatchesController < ApplicationController
    def new
        @update = UpdateMatches.new
    end

    def create
        update = UpdateMatches.new(allowed_params)
        update.data = JSON.generate({})
        update.save!
        redirect_to admin_update_matches_path
      end
    
    def index
        @update_matches = UpdateMatches.all
      end
    
    private

    def allowed_params
        @allowed_params ||= params.require(:update_matches).permit(:file)
    end
end
