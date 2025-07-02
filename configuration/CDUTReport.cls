\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CDUTReport}[2023 Undergraduate Internship Report of Space Science and Technology, CDUT]

\LoadClass[oneside]{book}
\RequirePackage{xeCJK}  % 使用xeCJK
\RequirePackage{CJKnumb}

% 引入AMS
\RequirePackage{amsmath}
\RequirePackage{amssymb}

\RequirePackage{float}  % 支持调整图片位置
\RequirePackage{emptypage}  % 支持插入空页
\RequirePackage{graphicx}  % 支持插入图片
\RequirePackage{pdfpages}  % 支持直接引入 PDF 页面
\RequirePackage{setspace}  % 设定适于中文排版的行距
\RequirePackage[ruled,linesnumbered]{algorithm2e}  % 支持伪代码
\RequirePackage{tabularx}  % 用于绘制有文字换行的表格
\linespread{1.3}  % 设置中文行距
\RequirePackage[colorlinks=true, allcolors=blue]{hyperref}  % 设置链接颜色
\RequirePackage{tikz}  % 支持绘图

% \RequirePackage[
%     backend=bibtex,
%     style=alphabetic,
%     citestyle=authoryear
%     ]{biblatex}  % 使用bib管理引用

\usepackage[
   backend=biber, % 推荐使用biber而非bibtex（更好支持中文）
   style=ieee,    % IEEE风格的数字引用
   sorting=none,  % 按引用顺序排列
   backref=true   % 添加反向引用（可选）
]{biblatex} % 使用bib管理引用

\addbibresource{ref.bib}

%\RequirePackage{indentfirst}
\setlength{\parindent}{0em}	% 设置适合于嘤语排版的段落缩进

%--------------- 主代码 ----------------------
%  分别导入字体设置，标题设置，自定义命令
\input{configuration/Font_set.tex}
\input{configuration/Title_set.tex}
\input{configuration/Mycommand.sty}

\newenvironment{cnabstract}  % 摘要环境
    {
        \begin{center}
            \heiti\Large{abstract}
        \end{center}
        \normalsize\songti
        \par\vskip 2.5ex
    }{\par\vskip 2.5ex}

\newcommand\dlmu[2][4cm]{\hskip1pt\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3pt}  % 用于绘制封面横线所需

% 打印封面内容所需
\def\Shixileixing{生产实习}
\def\Biaoti{空间资料处理综合实习}
\def\Xueyuan{地球物理学院}
\def\Zhuanye{空间科学与技术}
\def\Xingming{??}
\def\Xuehao{??}
\def\Daoshi{??}
\def\Didian{??}
\def\Shixishijian{Completion Date: July 2025}
\newcommand{\shixileixing}[1]{\def\Shixileixing{#1}}
\newcommand{\biaoti}[1]{\def\Biaoti{#1}}
\newcommand{\xueyuan}[1]{\def\Xueyuan{#1}}
\newcommand{\zhuanye}[1]{\def\Zhuanye{#1}}
\newcommand{\xingming}[1]{\def\Xingming{#1}}
\newcommand{\xuehao}[1]{\def\Xuehao{#1}}
\newcommand{\daoshi}[1]{\def\Daoshi{#1}}
\newcommand{\didian}[1]{\def\Didian{#1}}
\newcommand{\shixishijian}[1]{\def\Shixishijian{#1}}

% 汉化figure和table环境 
\renewcommand{\figurename}{Figure}
\renewcommand{\tablename}{Table}

\AtEndPreamble{
    % 设置页边距
    \RequirePackage{geometry}
    \geometry{
        paper=a4paper,
        left=2.54cm,
        right=2.54cm,
        top=1.5cm,
        bottom=1.75cm
    }

    % =============  此处修改代码高亮 ==================
    \RequirePackage{listings}
    \lstset{
    language=Python,
    basicstyle=\ttfamily,
    breaklines=true,
    frame=l,
    breaklines=true,
    keywordstyle=\bfseries,
    showstringspaces=false,
    columns=fixed,
    numbers=left,
    stepnumber=2
    }
    % =============  此处修改代码高亮 ==================
    
    \pagestyle{plain}  %设置页脚显示页码
    \renewcommand{\contentsname}{Table of Contents} %更改目录标题为中文
}

