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
\RequirePackage{enumitem}
\setlist[itemize]{leftmargin=*}
\setlength{\parindent}{0cm}

\newcommand{\nupname}{NAME}
\newcommand{\nupjobtitle}{TITLE}
\newcommand{\nupsummary}{SUMMARY}
\newcommand{\nuplocation}{LOCATION}
\newcommand{\nupemail}{EMAIL}
\newcommand{\nupmobile}{MOBILE}
\newcommand{\nuplinkedin}{LINKEDIN}
\newcommand{\nupsk}{SKILL/2}
\newcommand{\nuplang}{LANGUAGE/2}
\newcommand{\nupfpage}{}
\newcommand{\nupexp}{}
\newcommand{\nupedu}{}
\newcommand{\nupcerts}{}

\newcommand{\nuptitle}[1]{
  \vspace{0.2cm}
  {\large\nupcolor\MakeUppercase{#1} \par} 
}
\newcommand{\nupprofile}[3]{
  \renewcommand{\nupname}{#1}
  \renewcommand{\nupjobtitle}{#2}
  \renewcommand{\nupsummary}{#3}
}
\newcommand{\nupcontact}[4]{
  \renewcommand{\nuplocation}{#1}
  \renewcommand{\nupemail}{#2}
  \renewcommand{\nupmobile}{#3}
  \renewcommand{\nuplinkedin}{#4}
}
\newcommand{\nupskills}[1]{\renewcommand{\nupsk}{#1}}
\newcommand{\nuplanguages}[1]{\renewcommand{\nuplang}{#1}}
\newcommand{\nupcertificates}[1]{\renewcommand{\nupcerts}{#1}}
\newcommand{\nupfirstpage}[1]{\renewcommand{\nupfpage}{#1}}
\newcommand{\nupexperiencesection}[1]{\renewcommand{\nupexp}{#1}}
\newcommand{\nupeducationsection}[1]{\renewcommand{\nupedu}{#1}}

\newcommand{\nupexperience}[4]{
	\\ \MakeUppercase{#2} & \MakeUppercase{#3} \\
	#1 & #4 \\
}
\newcommand{\nupeducation}[4]{\nupexperience{#1}{#2}{#3}{#4}}

\newcommand{\makeprofile}{
  {\LARGE\nupcolor\MakeUppercase{\nupname} \par}
  {\MakeUppercase{\nupjobtitle} \par}
  \vspace{0.3cm}
  {\nupsummary \par} 
  \vspace{0.3cm}
}

\newcommand{\makecontact}{
  \nuptitle{Contact}
  \vspace{0.3cm}
  \begin{tabulary}{\textwidth}{CL}
    \faIcon{map-marker-alt} & \nuplocation \\
    \faIcon{at} & \nupemail \\
    \faIcon{mobile-alt} & \nupmobile \\
    \faIcon{linkedin} & linkedin.com/\nuplinkedin \\
  \end{tabulary}
}

\newcommand{\makeskills}[2]{
  \nuptitle{#1}
  \vspace{0.3cm}
  {\foreach \x\y in #2 {
    \x \hfill
    {\tiny \foreach \i in {1,2,3,4,5} {
      \ifnum\i>\y
        \faIcon[regular]{star}
      \else
        \faIcon{star}
      \fi
    }} \par}
  }
}
\newcommand{\makecertificates}{
  \nuptitle{Certificates}
  \vspace{0.3cm}
  {\nupcerts \par}
}

\newcommand{\makesidebar}{
  \linespread{1.2}
  \vspace{1cm}
  \begin{center}\includegraphics[width=3cm]{\jobname.png}\end{center}
  \vspace{1cm}
  \makecontact
  \vspace{0.5cm}
  \makeskills{Skills}{\nupsk}
  \vspace{0.5cm}
  \makeskills{Languages}{\nuplang}
  \vspace{0.5cm}
  \makecertificates
}
\newcommand{\makefirstpage}{
  \nupfpage
}

\newcommand{\makechronology}[2]{
  \\ & \large{\nupcolor\MakeUppercase{#1}} \\ 
  #2
}
\newcommand{\makecv}{
  \noindent
  \colorbox{lightgray}{
    \begin{minipage}[t][0.8\textheight]{6cm}\makesidebar\end{minipage}
  }
  \hspace{0.5cm}
  \begin{minipage}[t]{11cm}\makeprofile\makefirstpage\end{minipage}
  \newpage
  \setlength\tymin{4cm}
  \begin{tabulary}{\textwidth}{RL}
  \makechronology{Experience}{\nupexp}
  \makechronology{Education}{\nupedu}
  \end{tabulary}
}

\RequirePackage[left=1.5cm,top=2cm,right=1.5cm,bottom=2cm,nohead,nofoot]{geometry}
