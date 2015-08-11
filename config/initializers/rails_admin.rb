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

  config.model "User" do
    list do 
      field :id
      field :username
      field :email
      field :admin
      field :created_at
      field :deleted_at
      field :banned
    end
    show do
      field :id
      field :username
      field :email
      field :admin
      field :created_at
      field :deleted_at
      field :banned
      field :posts
      field :builds
      field :current_sign_in_ip
    end
    edit do
      field :admin
      field :banned
      field :username
      field :email
      field :password
      field :password_confirmation
      field :confirmed_at
      field :locked_at
      field :slug
      field :user_info
      field :current_build
      field :contact_details
      field :builds
      field :posts
      field :comments
    end
  end


  config.model "Post" do
    list do
      field :id
      field :title
      field :category
      field :tags
      field :published
      field :tweeted
      field :created_at
    end
      
  end

  config.model "Build" do
    list do
      field :id
      field :name
      field :b_type
      field :user do
        pretty_value do
          value.username
        end
      end
      field :published
      field :tweeted
      field :created_at
    end
  end

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
  
  config.model "Tag" do
    field :id
    field :name
    field :created_at
  end
  
  config.model "Tagging" do
    list do
      field :id
      field :post
      field :tag
      field :created_at
    end
  end
  
  config.model "Category" do
    field :id
    field :name
    field :created_at
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
