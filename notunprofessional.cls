% Copyright notunrandom. All rights reserved.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notunprofessional}[2023/05/05 Custom CV class]
\LoadClass{article}

\RequirePackage[sfdefault]{carlito}
\RequirePackage{xcolor}
\RequirePackage{titlesec}
\titleformat{\section}
  {\Large\raggedright\color{red}}
  {}{0em}
  {\MakeUppercase}
  [\titlerule]
\titleformat{\subsection}
  {\large\raggedright}
  {}{0em}
  {}

