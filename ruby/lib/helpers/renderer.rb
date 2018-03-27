module Helpers::Renderer
  def render(file_path)
    Utils::Template.new(
      Utils::FilesLoader.file(file_path)
    )
  end
end
