% Copyright notunrandom. All rights reserved.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notunprofessional}[2023/05/05 Custom CV class]

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[sfdefault]{carlito}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{tikz}
\RequirePackage{fontawesome5}
\RequirePackage{tabulary}

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
\newcommand{\nupsk}{SKILL/2}

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
\newcommand{\nupskills}[1]{\renewcommand{\nupsk}{#1}}

\newcommand{\makeprofile}{
  \flushleft{\LARGE{\nupcolor\MakeUppercase{\nupname}}}
  \flushleft{\MakeUppercase{\nuptitle}}
  \flushleft{\nupsummary}
}

\newcommand{\makecontact}{
  \begin{flushleft}
  \large{\nupcolor\MakeUppercase{Contact}}\\
  \vspace{1em}
  \begin{tabulary}{\textwidth}{CL}
      \faIcon{map-marker-alt} & \nuplocation \\
      \faIcon{at} & \nupemail \\
      \faIcon{mobile-alt} & \nupmobile \\
      \faIcon{linkedin} & linkedin.com/\nuplinkedin \\
    \end{tabulary}
  \end{flushleft}
}

\newcommand{\makeskills}{
  \begin{flushleft}
    \large{\nupcolor\MakeUppercase{Skills}}\\
    \vspace{1em}
    \foreach \x\y in \nupsk {
      \x\hfill\small
      \foreach \i in {1,2,3,4,5} {
        \ifnum\i>\y
          \faIcon[regular]{star}
        \else
          \faIcon{star}
        \fi
      }\\ 
    }
  \end{flushleft}
}
\newcommand{\makesidebar}{
  \linespread{1.2}
  \vspace{1cm}
  \center{\includegraphics[width=3cm]{\jobname.png}}\\
  \vspace{1cm}
  \makecontact
  \vspace{0.5cm}
  \makeskills
}

\newcommand{\makecv}{
  \colorbox{lightgray}{
    \begin{minipage}[t][0.8\textheight]{0.3\textwidth}\makesidebar\end{minipage}
  }
  \hspace{0.5cm}
  \begin{minipage}[t]{0.7\textwidth}\makeprofile\end{minipage}
}

\RequirePackage[left=1.5cm,top=2cm,right=1.5cm,bottom=2cm,nohead,nofoot]{geometry}
