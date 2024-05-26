class RegistrationsController < ApplicationController
    def new
        @user = User.new
    end
    def create
        puts "#{params[:user]}  😀😀"
        @user = User.new(user_params)
        if @user.save
           session[:user_id] = @user.id
            redirect_to root_path ,notice: "Successfully created User"
        else
            
            render :new ,notice: "not able to "
        end
    end
    
      
    #   def update
    #     respond_to do |format|
    #       if @freind.update(freind_params)
    #         format.html { redirect_to freind_url(@freind), notice: "Freind was successfully updated." }
    #         format.json { render :show, status: :ok, location: @freind }
    #       else
    #         format.html { render :edit, status: :unprocessable_entity }
    #         format.json { render json: @freind.errors, status: :unprocessable_entity }
    #       end
    #     end
    #   end
    
      # DELETE /freinds/1 or /freinds/1.json
    #   def destroy
    #     @freind.destroy!
    
    #     respond_to do |format|
    #       format.html { redirect_to freinds_url, notice: "Freind was successfully destroyed." }
    #       format.json { head :no_content }
    #     end
    #   end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        # def set_freind
        #   @freind = Freind.find(params[:id])
        # end
    
        # Only allow a list of trusted parameters through.
        def user_params
          params.require(:user).permit(:email, :password, :password_confirmation)
        end
    
    
end