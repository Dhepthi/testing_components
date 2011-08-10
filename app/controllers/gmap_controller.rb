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
   @markers = Map.find_by_latitude_and_longitude(params[:latitude],params[:longitude])
   @markers.destroy
   return render :json => {:error_message => "Marker Deleted From Database"}
 end

def delete_all_markers
   Map.delete_all
   if params[:button_click] == "true"
   return render :json => {:error_message => "All the Markers are Deleted"}
   else
   return render :json => {:error_message => "Please Click on Map to Create Marker"}
 end
end

end
