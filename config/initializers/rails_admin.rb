RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration


  config.model "Comment" do
    list do
      field :id
      field :commentable
      field :user do
         pretty_value do
           value.username
         end
       end      
      field :body
      field :created_at
      field :updated_at
    end
    
    show do
      field :commentable
      field :user do
        pretty_value do
          value.username
        end
      end
      field :body
      field :created_at
      field :updated_at
    end  
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
