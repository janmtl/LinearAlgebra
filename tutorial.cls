\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{tutorial}[2014/09/08 v1.0 Macros by Jan Florjanczyk]

\LoadClass[11pt, reqno]{amsart}
\setlength{\parindent}{0in}
\setlength{\parskip}{0.07in}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        usepackages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage[left=24mm,top=2cm,right=24mm,bottom=3cm, footskip=1cm]{geometry}
\usepackage{graphicx}
\usepackage[usenames,dvipsnames]{color}
\usepackage{amsmath, amssymb, amsthm}  
\usepackage{dsfont, times}
\usepackage{array, arydshln}
\usepackage{enumitem, multicol}

\renewcommand{\@maketitle}{\begin{center} \textbf{\textsc{\@title}} \par \small{\@date} \end{center}}

\newtheoremstyle{problem}% name of the style to be used
  {3pt}% measure of space to leave above the theorem. E.g.: 3pt
  {3pt}% measure of space to leave below the theorem. E.g.: 3pt
  {}% name of font to use in the body of the theorem
  {}% measure of space to indent
  {\scshape}% name of head font
  {:}% punctuation between head and body
  { }% space after theorem head; " " = normal interword space
  {}% Manually specify head
\theoremstyle{problem}
\newtheorem{prob}{Problem}
\renewcommand*{\proofname}{Solution}

%polices
\newcommand{\msf}{\mathsf}
\newcommand{\mrm}{\mathrm}
\newcommand{\mbf}{\mathbf}
\newcommand{\mbb}{\mathbb}
\newcommand{\mcal}{\mathcal}
%polices

%shortcuts
\def\di{\partial}
\def\lp{\left(}
\def\rp{\right)}
\def\ls{\left[}
\def\rs{\right]}
\def\lb{\left\{}
\def\rb{\right\}}
%shortcuts

%mathbb's
\newcommand{\mbA}{\mathbb{A}}
\newcommand{\mbB}{\mathbb{B}}
\newcommand{\mbC}{\mathbb{C}}
\newcommand{\mbD}{\mathbb{D}}
\newcommand{\mbE}{\mathbb{E}}
\newcommand{\mbF}{\mathbb{F}}
\newcommand{\mbG}{\mathbb{G}}
\newcommand{\mbH}{\mathbb{H}}
\newcommand{\mbI}{\mathbb{I}}
\newcommand{\mbJ}{\mathbb{J}}
\newcommand{\mbK}{\mathbb{K}}
\newcommand{\mbL}{\mathbb{L}}
\newcommand{\mbM}{\mathbb{M}}
\newcommand{\mbN}{\mathbb{N}}
\newcommand{\mbO}{\mathbb{O}}
\newcommand{\mbP}{\mathbb{P}}
\newcommand{\mbQ}{\mathbb{Q}}
\newcommand{\mbR}{\mathbb{R}}
\newcommand{\mbS}{\mathbb{S}}
\newcommand{\mbT}{\mathbb{T}}
\newcommand{\mbU}{\mathbb{U}}
\newcommand{\mbV}{\mathbb{V}}
\newcommand{\mbW}{\mathbb{W}}
\newcommand{\mbX}{\mathbb{X}}
\newcommand{\mbY}{\mathbb{Y}}
\newcommand{\mbZ}{\mathbb{Z}}
\newcommand{\mE}[1]{\mcal{E}(#1)}
\newcommand{\mO}[1]{\mcal{O}(#1)}

%greek letters
\def\a{\alpha}
\def\b{\beta}
\def\g{\gamma}
\def\d{\delta}
\def\e{\epsilon}
\def\ve{\varepsilon}
\def\z{\zeta}
\def\h{\eta}
\def\t{\theta}
\def\k{\kappa}
\def\m{\mu}
\def\n{\nu}
\def\x{\xi}
\def\p{\pi}
\def\r{\rho}
\def\s{\sigma}
\def\ta{\tau}
\def\u{\upsilon}
\def\ph{\varphi}
\def\c{\chi}
\def\ps{\psi}
\def\o{\omega}
\def\G{\Gamma}
\def\D{\Delta}
\def\T{\Theta}
\def\L{\Lambda}
\def\X{\Xi}
\def\P{\Pi}
%\def\S{\Sigma}
\def\U{\Upsilon}
\def\Ph{\Phi}
\def\Ps{\Psi}
\def\O{\Omega}
%greek letters

\newcommand{\col}[2]{\text{col}_{#2} \lp #1 \rp}
\newcommand{\row}[2]{\text{row}_{#2} \lp #1 \rp}
