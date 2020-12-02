\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{prova}[2017/08/01 Modelo de prova]
\LoadClass[a4paper]{article}

%
% pacotes necessarios
%
\RequirePackage{graphicx}  % requerido para usar \includegraphics
\RequirePackage{booktabs}  % requerido para usar tabela
\RequirePackage{forloop}   % requerido paara usar um loop for

%
% define as margens da pagina
%
\setlength{\textwidth}{16cm}
\setlength{\textheight}{24cm}
\setlength{\topmargin}{-1cm}
\setlength{\leftmargin}{1.2cm}
\setlength{\rightmargin}{1.2cm}
\setlength{\oddsidemargin}{0cm}
\setlength{\evensidemargin}{0cm}

%
% altera o \end{document} incluindo o texto "boa prova"
%
\let\fim\enddocument
\def\enddocument{%
	\vfill{}
	\begin{flushright}
		\vspace{1cm}
		\textit{Boa Prova!}
	\end{flushright}
	\fim
}

%
% cria o ambiente questionario
%
\newenvironment{questionario}
	{\begin{enumerate}}
	{\end{enumerate}}
	
%
% cria os comandos para declarar as questoes
% cada comando usa um espacamento vertical diferente
%
\newcommand{\q}[1]{%
	\vspace{0.5cm}
	\item #1
}
\newcommand{\qq}[1]{%
	\vspace{0.2cm}
	\item #1
}
\newcommand{\qqq}[1]{%
	\item #1
}

%
% define as variaveis do cabecalho
%
\def\professor#1{\def\@professor{#1}}
\def\disciplina#1{\def\@disciplina{#1}}
\def\avaliacao#1{\def\@avaliacao{#1}}
\def\curso#1{\def\@curso{#1}}
\def\data#1{\def\@data{#1}}

%
% escreve o cabecalho
% o parametro indica o numero de quadros na tabela de notas
%
\newcommand{\cabecalho}[1]{%
	\thispagestyle{empty}
	\hspace{-0.6cm}
	\begin{minipage}{0.14\linewidth}
		\includegraphics[width=0.9\linewidth]{../../../ufgd.png}
	\end{minipage}
	\begin{minipage}{0.7\linewidth}
	\begin{tabular}{c}
	\toprule{}
	{{\bf UNIVERSIDADE FEDERAL DA GRANDE DOURADOS}}\\
	{{\bf \@disciplina\ --- Avalia\c{c}\~{a}o \@avaliacao}}\\
	{{\bf \@professor}}\\
	\midrule{}
	\@curso\hfill{}\@data \\
	\bottomrule{}
	\end{tabular}
	\vspace{-0.45cm}
	\end{minipage}
	\begin{minipage}{0.15\linewidth}
	\begin{flushright}
	\def\arraystretch{1.2}
	\begin{tabular}{|c|c|}
	\hline
	\newcounter{i}
	\forLoop{1}{#1}{i}{%
		\arabic{i} & \hspace{1cm} \\
		\hline
	}
	{\small Nota}&  \hspace{1cm} \\
	\hline
	\end{tabular}
	\end{flushright}
	\end{minipage}
	\vspace{0.5cm}

	{\bf Aluno(a):}\dotfill{}
	\vspace{0.5cm}
}
