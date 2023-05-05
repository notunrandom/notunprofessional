% Copyright notunrandom. All rights reserved.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notunprofessional}[2023/05/05 Custom CV class]

\RequirePackage[utf8]{inputenc}
\RequirePackage[sfdefault]{carlito}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{graphicx}
\RequirePackage{fontawesome5}

\newcommand{\nupcolor}{\color{Maroon}}
\DeclareOption{teal}{\renewcommand{\nupcolor}{\color{teal}}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass{article}

\setlength{\parindent}{0cm}

\newcommand{\nupname}{NAME}
\newcommand{\nuptitle}{TITLE}
\newcommand{\nupsummary}{SUMMARY}
\newcommand{\nuplocation}{LOCATION}
\newcommand{\nupemail}{EMAIL}
\newcommand{\nupmobile}{MOBILE}
\newcommand{\nuplinkedin}{LINKEDIN}

\newcommand{\nupprofile}[3]{
  \renewcommand{\nupname}{#1}
  \renewcommand{\nuptitle}{#2}
  \renewcommand{\nupsummary}{#3}
}
\newcommand{\nupcontact}[4]{
  \renewcommand{\nuplocation}{#1}
  \renewcommand{\nupemail}{#2}
  \renewcommand{\nupmobile}{#3}
  \renewcommand{\nuplinkedin}{#4}
}

\newcommand{\makeprofile}{
  \flushleft{\LARGE{\nupcolor\MakeUppercase{\nupname}}}
  \flushleft{\MakeUppercase{\nuptitle}}
  \flushleft{\nupsummary}
}

\newcommand{\makecontact}{
  \flushleft{\large{\nupcolor\MakeUppercase{Contact}}}\vspace{1em}
  \flushleft{\faIcon{map-marker-alt} \nuplocation}
  \flushleft{\faIcon{at} \nupemail}
  \flushleft{\faIcon{mobile-alt} \nupmobile}
  \flushleft{\faIcon{linkedin} linkedin.com/\nuplinkedin}
}

\newcommand{\makesidebar}{
  \vspace{1cm}
  \center{\includegraphics[width=3cm]{\jobname.png}}
  \vspace{1cm}
  \makecontact
}

\newcommand{\makecv}{
  \colorbox{lightgray}{
    \begin{minipage}[t][0.8\textheight]{0.3\textwidth}\makesidebar\end{minipage}
  }
  \hspace{0.5cm}
  \begin{minipage}[t]{0.7\textwidth}\makeprofile\end{minipage}
}

\RequirePackage[left=1.5cm,top=2cm,right=1.5cm,bottom=2cm,nohead,nofoot]{geometry}
