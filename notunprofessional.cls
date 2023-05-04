% Copyright notunrandom. All rights reserved.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notunprofessional}[2023/05/05 Custom CV class]
\LoadClass{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[sfdefault]{carlito}
\RequirePackage[dvipsnames]{xcolor}
\setlength{\parindent}{0cm}
\RequirePackage{titlesec}
\titleformat{\section}
  {\Large\raggedright\color{Maroon}}
  {}{0em}
  {\MakeUppercase}
\titleformat{\subsection}
  {\large\raggedright}
  {}{0em}
  {}

\newcommand{\nupname}[1]{
	\flushleft{\LARGE{\color{Maroon}\uppercase{#1}}}
}
\newcommand{\nuptitle}[1]{
	\flushleft{\normalsize{\uppercase{#1}}}
}

\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}
}
