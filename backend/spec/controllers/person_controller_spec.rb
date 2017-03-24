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
    let!(:person) { create(:person) }
    subject { get :index }

    it 'serializes the objects' do
      expect(PersonSerializer).to receive(:new).and_call_original
      subject
      expect(json_response).to include(hash_including("id" => person.id))
    end
  end

  pending 'GET /person/:id.json' do
    subject { get :index }
  end

  pending 'PATCH /person/:id.json' do
    subject { get :index }
  end

  pending 'DELETE /person/:id.json' do
    subject { get :index }
  end
end
