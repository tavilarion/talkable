describe CommentsController do
  let(:project) { create(:project) }

  context 'new - #GET /projects/:id/comments/new' do
    before { get :new, params: { project_id: project.id } }

    it 'renders the new page' do
      expect(response.status).to eq 200
    end
  end

  context 'create - #POST /projects/:id/comments' do
    context 'with valid parameters' do
      let(:comments_params) { { author: 'Test', content: 'Content' } }
      subject { post :create, as: :turbo_stream, params: { project_id: project.id, comment: comments_params } }

      it 'creates a new comment' do
        expect { subject }.to change { project.comments.count }.by(1)
      end
    end

    context 'with invalid parameters' do
      it 'returns 422 - Unprocessable entity' do
        post :create, params: { project_id: project.id, comment: { author: '', content: '' } }

        expect(response.status).to eq 422
      end
    end
  end
end
