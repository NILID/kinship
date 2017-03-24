class PersonController < ApplicationController
  def index
    render json: Person.all
  end

  def show
    render json: person
  end

  def create
    person = Person.create(person_params)

    render json: person
  end

  def update
    person.update(person_params)

    render json: person
  end

  def destroy
    person.delete

    render json: person
  end

  private

  def person
    @person ||= Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:given_name, :family_name)
  end
end
