class ComplaintsController < ApplicationController

    def allComplaints
        complaints = Complaint.order('updated_at DESC').all
        render json: build_res(nil, complaints)
        return  
    end
    
    def submitComplaint
        begin
            permitted = comaplaints_params
          
            if(!has_submit_username(permitted))
                render json: build_res("Missing username param.", nil)
                return
            end
            if(!has_submit_text(permitted))
                render json: build_res("Missing complaint text.", nil)
                return
            end
            if(!session[:id])
                render json: build_res("No user logged in. Uable to submit", nil)
                return
            end
            
            authedUser = User.where(id: session[:id]).first
            
            if(!authedUser)
                render json: build_res("Invalid user.", nil)
                return
            end
            
            if(authedUser.username != permitted[:username])
                render json: build_res("Passed username does not match logged in user.", nil)
                return
            end
            
            if(!validTextLength(permitted[:text]))
                render json: build_res("Invalid complaint length", nil)
                return
            end
            
            complaint = Complaint.new(userID: authedUser.id, text: permitted[:text])
            complaint.save
           
            rescue StandardError => e
                render json: build_res(e.to_s, nil)
                return
            end

        render json: build_res(nil, "Comaplint submitted")
    end
    
    private
    def comaplaints_params
      params.permit(:username, :text)
    end
    
    def has_submit_username(permitted)
        permitted.has_key?(:username)
    end
    
    def has_submit_text(permitted)
      return permitted.has_key?(:text)
    end

    def build_res(error, data)
    return {
      :error => error ? error : nil,
      :data => data ? data: nil
    }
    end
    
    def validTextLength(text)
        return text.length > 80 && text.length <= 500 ? true : false 
    end
end