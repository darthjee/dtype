module Helpers
  module Tex
    include Helpers::Number

    def format_tex_number(number)
      "$#{format_number(number)}$"
    end

    def figure(graph)
      %Q(
        \\begin{center}
        \\begin{figure}[H]
        \\begin{center}
        \\epsfig{file=#{graph.file}, scale=1, angle=0}
        \\caption{#{graph.caption}}
        \\label{#{graph.label}}
        \\end{center}
        \\end{figure}
        \\end{center}
      )
    end
  end
end
