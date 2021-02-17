require 'rails_helper'

RSpec.describe ContentsController, type: :controller do
  describe 'POST #create' do
    context 'When the content does not exists in our database' do
      it 'returns a 201' do
        post :create, params: attributes_for(:content)

        expect(response).to have_http_status(:created)
      end

      it 'saves the correct expires_at value' do
        content = attributes_for(:content)

        post :create, params: content

        expect(Content.last.expires_at).to eq Time.zone.at(content[:expires_at].to_i)
      end
    end

    context 'When the content already exists for the same provider' do
      it 'returns a status of 422' do
        create(:content, expires_at: Time.current)
        content = attributes_for(:content)

        post :create, params: content

        expect(response).to have_http_status(:unprocessable_entity)
      end
      it 'should not save the content' do
        create(:content, expires_at: Time.current)
        content = attributes_for(:content)

        post :create, params: content

        expect(Content.count).to eq 1
      end
    end
  end

  describe 'GET #show' do
    context 'When the content exists' do
      it 'returns a 200 status code' do
        content = create(:content, expires_at: Time.current)

        get :show, params: { id: content.id }

        expect(response).to have_http_status(:ok)
      end

      it 'updates the content\'s watched to true' do
        content = create(:content, expires_at: Time.current)

        get :show, params: { id: content.id }

        expect(json['watched']).to be_truthy
      end

      context 'and the expires_at time is minor than the current datetime' do
        it 'returns expired as true' do
          content = create(:content, expires_at: (Time.current - 1.hour))

          get :show, params: { id: content.id }

          expect(json['expired']).to be_truthy
        end
      end
    end

    context 'When the id passed through url does not exist' do
      it 'returns a 404 status code' do
        get :show, params: { id: 2 }

        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'PUT #update' do
    context 'When the data passed is valid' do
      it 'returns a 204 status code' do
        content = create(:content, expires_at: Time.current)

        put :update, params: { id: content.id, content: { name: 'My talk' } }

        expect(response).to have_http_status(:no_content)
      end

      it 'returns a 204 status code' do
        content = create(:content, expires_at: Time.current)

        put :update, params: { id: content.id, name: 'My talk' }

        expect(Content.last.name).to eq 'My talk'
      end

      it 'changes the watched field to false' do
        content = create(:content, expires_at: Time.current, watched: true)

        put :update, params: { id: content.id, name: 'My talk' }

        expect(Content.last.watched).to be_falsy
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'retrns a 204 status code' do
      content = create(:content, expires_at: Time.current)

      delete :destroy, params: { id: content.id }

      expect(response).to have_http_status(:no_content)
    end
  end
end
