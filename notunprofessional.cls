% Copyright notunrandom. All rights reserved.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notunprofessional}[2023/05/05 Custom CV class]
\LoadClass[11pt, a4paper]{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage[sfdefault]{carlito}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{graphicx}

%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\setlength{\parindent}{0cm}

\newcommand{\nupname}{NAME}
\newcommand{\nuptitle}{TITLE}
\newcommand{\nupsummary}{SUMMARY}

\newcommand{\nupprofile}[3]{
  \renewcommand{\nupname}{#1}
  \renewcommand{\nuptitle}{#2}
  \renewcommand{\nupsummary}{#3}
}

\newcommand{\makeprofile}{
  \flushleft{\LARGE{\color{Maroon}\MakeUppercase{\nupname}}}
  \flushleft{\MakeUppercase{\nuptitle}}
  \flushleft{\nupsummary}
}

\newcommand{\makesidebar}{
  \vspace{1cm}
  \center{\includegraphics[width=3cm]{br.png}}
  \flushleft{Hello world}
}

\newcommand{\makecv}{
  \colorbox{lightgray}{
    \begin{minipage}{0.3\textwidth}\makesidebar\end{minipage}
  }
  \hspace{0.5cm}
  \begin{minipage}{0.7\textwidth}\makeprofile\end{minipage}
}

\RequirePackage[left=1.5cm,top=2cm,right=1.5cm,bottom=2cm,nohead,nofoot]{geometry}
