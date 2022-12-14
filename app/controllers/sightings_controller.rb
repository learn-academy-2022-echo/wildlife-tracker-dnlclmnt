class SightingsController < ApplicationController
    #Index
    def index
        sightings = Sighting.where(date: params[:start_date]..params[:end_date])
        render json: sightings
    end
    #Show
    def show
        sighting = Sighting.find(params[:id])
        render json: sighting
    end
    #Create
    def create
        sighting = Sighting.create(sighting_params)
        if sighting.valid?
            render json: sighting
        else
            render json: sighting.errors
        end
    end
    #Update
    def update
        sighting = Sighting.find(params[:id])
        sighting.update(sighting_params)
        if sighting.valid?
            render json: sighting
        else
            render json: sighting.errors
        end
    end
    #Destroy
    def destroy
        sighting = Sighting.find(params[:id])
        if sighting.destroy
            render json: sighting
        else
            render json: sighting.errors
        end
    end

    private
        def sighting_params
            params.require(:sighting).permit(:animal_id, :latitude, :longitude, :date, :start_date, :end_date)
        end
end
