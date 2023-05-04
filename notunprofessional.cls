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
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}
}

\titleformat{\section}
  {\Large\raggedright\color{Maroon}}
  {}{0em}
  {\MakeUppercase}
\titleformat{\subsection}
  {\large\raggedright}
  {}{0em}
  {}

\newcommand{\nupname}{NAME}
\newcommand{\nuptitle}{TITLE}
\newcommand{\nupsummary}{SUMMARY}

\newcommand{\nupprofile}[3]{
  \renewcommand{\nupname}{#1}
  \renewcommand{\nuptitle}{#2}
  \renewcommand{\nupsummary}{#3}
}

\newcommand{\makecv}{
  \flushleft{\LARGE{\color{Maroon}\MakeUppercase{\nupname}}}
  \flushleft{\MakeUppercase{\nuptitle}}
  \flushleft{\nupsummary}
}
