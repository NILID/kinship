require 'rails_helper'

describe PersonController do
  let(:json_response) { JSON.parse(response.body) }

  describe 'POST /person.json' do
    subject { post :create, params: params }
    let(:params) { { person: attributes_for(:person) } }

    it 'creates a person' do
      expect { subject }.to change { Person.count }.by(1)
    end
  end

  describe 'GET /person.json' do
    subject { get :index }
    let!(:person) { create(:person) }

    it 'serializes the people' do
      expect(PersonSerializer).to receive(:new).and_call_original
      subject
      expect(json_response).to include(hash_including("id" => person.id))
    end
  end

  describe 'GET /person/:id.json' do
    subject { get :show, params: { id: person.id } }
    let!(:person) { create(:person) }

    it 'serializes the person' do
      expect(PersonSerializer).to receive(:new).and_call_original
      subject
      expect(json_response['id']).to eq(person.id)
    end
  end

  describe 'PATCH /person/:id.json' do
    subject { patch :update, params: { id: person.id, person: new_params } }
    let!(:person) { create(:person) }
    let(:new_params) { { given_name: 'John Jacob', family_name: 'Jingleheimer-Schmidt' } }

    it 'updates the person' do
      subject
      person.reload
      expect(person.given_name).to eq(new_params[:given_name])
      expect(person.family_name).to eq(new_params[:family_name])
    end
  end

  describe 'DELETE /person/:id.json' do
    subject { delete :destroy, params: { id: person.id } }
    let!(:person) { create(:person) }

    it 'deletes the person' do
      expect { subject }.to change { Person.count }.by(-1)
    end
  end
end
