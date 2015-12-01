module LifeEvent
  class MarriagesController < ApplicationController
    before_action :set_marriage, only: [:show, :edit, :update, :destroy]
    before_action :handle_id_and_attributes, only: [:create, :update]
    before_action :authenticate_user!
    before_action :authorize_user

    decorates_assigned :marriage

    def new
      @marriage = LifeEvent::Marriage.new(marriage_params)
    end

    def create
      @marriage = LifeEvent::Marriage.new(marriage_params)

      respond_to do |format|
        if @marriage.save
          format.html do
            redirect_to @marriage,
              notice: "#{@marriage.decorate.event_name} was successfully created."
          end
          format.json do
            render action: 'show',
              status: :created,
              location: @marriage
          end
        else
          format.html do
            render action: 'new',
              status: :unprocessable_entity,
              alert: @marriage.errors.full_messages
          end
          format.json do
            render json: @marriage.errors,
              status: :unprocessable_entity
          end
        end
      end
    end

    def edit
    end

    def update
      @marriage.update(marriage_params)

      respond_to do |format|
        if @marriage.save
          format.html do
            redirect_to @marriage,
              notice: "#{@marriage.decorate.event_name} has been updated."
            end
          format.json do
            render action: 'show',
              status: :updated,
              location: @marriage
          end
        else
          format.html do
            render action: 'edit'
          end
          format.json do
            render json: @marriage.errors,
              status: :unprocessable_entity
          end
        end
      end
    end

    private

    def set_marriage
      @marriage = LifeEvent::Marriage.find(params[:id])
    end

    def marriage_params
      params.require(:life_event_marriage).permit(
        :person_1_id,
        :person_2_id,
        :date,
        person_1_attributes: [:first_name, :last_name, :gender],
        person_2_attributes: [:first_name, :last_name, :gender]
      )
    end

    def handle_id_and_attributes
      p1_id = params[:life_event_marriage][:person_1_id]
      p2_id = params[:life_event_marriage][:person_2_id]

      if p1_id.nil? || p1_id == 'new'
        params[:life_event_marriage][:person_1_id] = nil
      else
        params[:life_event_marriage][:person_1_attributes] = nil
      end
      if p2_id.nil? || p2_id == 'new'
        params[:life_event_marriage][:person_2_id] = nil
      else
        params[:life_event_marriage][:person_2_attributes] = nil
      end
    end
  end
end