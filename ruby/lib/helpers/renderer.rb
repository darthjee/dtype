module Helpers::Renderer
  def render(file_path, **variables)
    Utils::Template.new(
      Utils::FilesLoader.file(file_path),
      variables
    )
  end
end
