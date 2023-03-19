describe ProjectsController do
  let(:project) { create(:project) }

  context 'index - #GET /projects' do
    before { get :index }

    it 'renders the project list page' do
      expect(response.status).to eq 200
    end
  end

  context 'edit - #GET /projects/:id/edit' do
    before { get :edit, params: { id: project.id } }

    it 'renders the edit page' do
      expect(response.status).to eq 200
    end
  end

  context 'show - #GET /projects/:id' do
    before { get :show, params: { id: project.id } }

    it 'renders the show page' do
      expect(response.status).to eq 200
    end
  end

  context 'update - #PATCH /projects/:id' do
    context 'when status is valid' do
      subject { patch :update, as: :turbo_stream, params: { id: project.id, project: { status: 1 } } }

      it 'updates project status and creates a system comment' do
        expect { subject }.to change { project.comments.count }.by(1)
        expect(project.reload.status).to eq Project::STATUSES[1]
      end
    end

    context 'when status is invalid' do
      it 'returns 422 - Unprocessable entity' do
        patch :update, params: { id: project.id, project: { status: -1 } }

        expect(response.status).to eq 422
      end
    end
  end
end
