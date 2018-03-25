class Tex::Graph
  attr_reader :file, :label, :caption

  def initialize(file:, caption: nil, label: nil)
    @file = file
    @label = label
  end

  def to_s
    %Q(
\\begin{center}
\\begin{figure}[H]
\\begin{center}
\\epsfig{file=#{file}, scale=1, angle=0}
\\caption{#{caption}}
\\label{#{label}}
\\end{center}
\\end{figure}
\\end{center}
    )
  end
end
