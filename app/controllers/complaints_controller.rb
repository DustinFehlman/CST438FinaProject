class ComplaintsController < ApplicationController
    def allComplaints
        complaints = Complaint.order('updated_at DESC').all
        puts complaints
        render json: build_res(nil, complaints)
        return  
    end
    
    def submitComplaint
    end
    
    
    def build_res(error, data)
    return {
      :error => error ? error : nil,
      :data => data ? data: nil
    }
    end
end