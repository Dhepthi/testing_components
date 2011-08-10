class GmapController < ApplicationController

def save_marker
   @markers = Map.new(params[:markers])
   if @markers.save
     return render :json => {:error_message => "Markers Saved in DataBase"}
  else
    return render :json => {:error_message => "Failed in Saving the Data"}
  end
 end

 def delete_marker
   @markers = Map.find_by_marker_name(params[:marker_name])
   @markers.destroy
   return render :json => {:error_message => "Marker Deleted From Database"}
 end

end
