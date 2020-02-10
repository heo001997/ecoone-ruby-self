module Survey::Contract
  class Create < Reform::Form
    property :title
    property :description
    property :image
  end
end