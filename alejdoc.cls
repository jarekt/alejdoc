\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{alejdoc}[2020/07/12 Alej document template]

\newif\if@seminarka
\@seminarkafalse
\newif\if@onesided
\@onesidedtrue

\DeclareOption{seminarka}{\@seminarkatrue}%add newif a \subject
\DeclareOption{twoside}{\PassOptionsToClass{\CurrentOption}{report} \@onesidedfalse}
\DeclareOption{twocolumn}{\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions*

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{datetime2}
\RequirePackage{lmodern}

\LoadClass[12pt, a4paper, onecolumn]{report}


\newcommand*{\schoolyear}[1]
{
    \gdef\@schoolyear{#1}
}
\newcommand*{\class}[1]
{
    \gdef\@class{#1}
}
\newcommand*{\subject}[1]
{
    \gdef\@subject{#1}
}

\renewcommand*{\@title}
{
    \textbackslash title\{\}
}

\renewcommand*{\@author}
{
    \textbackslash author\{\}
}

\newcommand*{\@schoolyear}
{
    \textbackslash schoolyear\{\}
}

\newcommand*{\@class}
{
    \textbackslash class\{\}
}

\newcommand*{\@subject}
{
    \textbackslash subject\{\}
}

\renewcommand*{\maketitle}
{
    \thispagestyle{empty}
    \begin{center}
        {\large Gymnázium, Praha 6, Nad Alejí 1952}\par
        \vspace{36pt}
        \includegraphics[width=10cm, keepaspectratio]{alejlogo.pdf}\par
        \vspace{24pt}
        \if@seminarka
        {\large SEMINÁRNÍ PRÁCE\par\vspace{12pt} z předmětu \par\vspace{12pt} \@subject}\par\vspace{36pt}
        \else
        {\large \par\vspace{12pt} \par\vspace{12pt}}\par\vspace{36pt}
        \fi
        {\Huge \@title}
    \end{center}
    \vfill
    \begin{flushleft}
        \@author\par
        \@class , 
        \@schoolyear\par
        Rev. \DTMnow
    \end{flushleft}
}


\fancypagestyle{plain}{
   \fancyhf{}
    \fancyfoot{}
    \if@onesided
        \rhead{{\@author} - {\@title} - {\thepage}/\pageref{LastPage}}
    \else
        \fancyhead[LE,RO]{{\@author} - {\@title} - {\thepage}/\pageref{LastPage}}
    \fi
}
\pagestyle{plain}
