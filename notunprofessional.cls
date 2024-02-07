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
\RequirePackage{calc}

\newcommand{\nupcolor}{\color{Maroon}}
\newcommand{\nupskillstitle}{Skills}
\newcommand{\nuplangstitle}{Languages}
\newcommand{\nupcertstitle}{Certificates}
\newcommand{\nupedutitle}{Education}
\newcommand{\nupexptitle}{Experience}
\newcommand{\nupstatustitle}{Status}
\newcommand{\pageone}{{ \vfill \hfill \colorbox{lightgray}{1} 2}}
\newcommand{\pagetwo}{{ \vfill \hfill 1 \colorbox{lightgray}{2}}}
\DeclareOption{teal}{\renewcommand{\nupcolor}{\color{teal}}}
\DeclareOption{french}{
	\renewcommand{\nupskillstitle}{Compétences}
	\renewcommand{\nuplangstitle}{Langues}
	\renewcommand{\nupcertstitle}{Certifications}
	\renewcommand{\nupedutitle}{Formation}
	\renewcommand{\nupexptitle}{Expérience}
	\renewcommand{\nupstatustitle}{Etat Civil}
}
\DeclareOption{npages}{
	\renewcommand{\pageone}{}
	\renewcommand{\pagetwo}{}
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass{article}
\RequirePackage{enumitem}
\RequirePackage[hidelinks]{hyperref}

\setlist[itemize]{leftmargin=*}
\setlength{\parindent}{0cm}
\newlength{\sidebarheight}
\setlength{\sidebarheight}{25cm}
\newlength{\sidebarwidth}
\setlength{\sidebarwidth}{5cm}
\newlength{\profilewidth}
\setlength{\profilewidth}{11.5cm}
\newcommand{\addsidebarwidth}[1]{\setlength{\sidebarwidth}{\sidebarwidth + #1}}
\newlength{\chronoleftmin}
\setlength{\chronoleftmin}{3.5cm}
\newlength{\chronototalwidth}
\setlength{\chronototalwidth}{17.5cm}
\newcommand{\addexperienceleftwidth}[1]{\setlength{\chronoleftmin}{\chronoleftmin + #1}}
\pagestyle{empty}

\newcommand{\nupname}{NAME}
\newcommand{\nupjobtitle}{TITLE}
\newcommand{\nupsummary}{SUMMARY}
\newcommand{\nuplocation}{LOCATION}
\newcommand{\nupemail}{EMAIL}
\newcommand{\nupmobile}{MOBILE}
\newcommand{\nuplinkedin}{LINKEDIN}
\newcommand{\nupcitiz}{CITIZENSHIP}
\newcommand{\nuppermit}{PERMIT}
\newcommand{\nupfamily}{FAMILY}
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
\newcommand{\nupstatus}[3]{
  \renewcommand{\nupcitiz}{#1}
  \renewcommand{\nuppermit}{#2}
  \renewcommand{\nupfamily}{#3}
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
\newcommand{\makelinkedin}{
  \href{https://www.linkedin.com/in/\nuplinkedin}{linkedin.com/in/\nuplinkedin} 
}

\newcommand{\makecontact}{
  \nuptitle{Contact}
  \begin{flushleft}
  \begin{tabulary}{\textwidth}{CL}
    \faIcon{map-marker-alt} & \nuplocation \\
    \faIcon{at} & \nupemail \\
    \faIcon{mobile-alt} & \nupmobile \\
    \faIcon{linkedin} & \makelinkedin \\
  \end{tabulary}
  \end{flushleft}
}

\newcommand{\makestatus}[1]{
  \nuptitle{#1}
  \begin{flushleft}
  \begin{tabulary}{\textwidth}{CL}
    \faIcon{globe} & \nupcitiz \\
    \faIcon{stamp} & \nuppermit \\
    \faIcon{users} & \nupfamily \\
  \end{tabulary}
  \end{flushleft}
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
  \nuptitle{\nupcertstitle}
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
  \makestatus{\nupstatustitle}
  \vspace{0.5cm}
  \makeskills{\nupskillstitle}{\nupsk}
  \vspace{0.5cm}
  \makeskills{\nuplangstitle}{\nuplang}
  \vspace{0.5cm}
  \makecertificates
}
\newcommand{\makefirstpage}{
  \nupfpage
  \pageone
}

\newcommand{\makechronology}[2]{
  \\ & \large{\nupcolor\MakeUppercase{#1}} \\ 
  #2
}
\newcommand{\makecv}{
  \noindent
  \colorbox{lightgray}{
    \begin{minipage}[t][\sidebarheight]{\sidebarwidth}\makesidebar\end{minipage}
  }
  \hspace{0.5cm}
  \begin{minipage}[t][\sidebarheight]{\profilewidth}\makeprofile\makefirstpage\end{minipage}
  \newpage
  \setlength\tymin{\chronoleftmin}
  \begin{tabulary}{\chronototalwidth}{RL}
  \makechronology{\nupexptitle}{\nupexp}
  \makechronology{\nupedutitle}{\nupedu}
  \end{tabulary}
  \pagetwo
}

\RequirePackage[textwidth=18cm,textheight=26cm,centering]{geometry}
