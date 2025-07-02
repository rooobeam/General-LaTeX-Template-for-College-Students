# 大学生LaTeX 报告模板

本模板适用于撰写**大作业报告**，基于成都理工大学（CDUT）的报告格式规范进行修改，包含完整的文档结构（标题页、摘要、目录、章节、参考文献、附录等），页面和英文字体设置遵循一个英国项目规范Research_Project_Guide.pdf，并提供了详细的使用说明。


## 📁 文件结构
以下是模板的文件结构及各文件用途说明：

```
├── main.tex               # 主文档文件（整合所有子文件，编译入口）
├── titlepage.tex          # 标题页模板（包含标题、作者、日期等）
├── abstract.tex           # 摘要部分（中英文摘要）
├── chapter1.tex           # 第一章内容（可扩展为chapter2.tex、chapter3.tex等）
├── reference.tex          # 参考文献部分（引用bib数据库）
├── appendix.tex           # 附录部分（补充数据、代码等）
├── backpage.tex           # 封底页（可选）
├── manual.tex             # 使用手册（详细说明公式、图片、表格等插入方法）
├── ref.bib                # 参考文献数据库（BibTeX格式，需与reference.tex关联）
├── Research_Project_Guide.pdf   # 一个英国项目的规范指导书
├── configuration/         # 配置文件夹（格式、字体、自定义命令）
│   ├── CDUTReport.cls     # 核心类文件（定义页面布局、章节格式等）
│   ├── Mycommand.sty      # 自定义命令（快捷插入图片、表格等）
│   ├── Font set.tex       # 字体设置（使用Fandol系列中文字体）
│   ├── Title set.tex      # 标题格式设置（标题页、章节标题样式）
│   └── Fandol*.otf        # Fandol字体文件（黑体、宋体、楷体，需安装或保留）
├── figs/                  # 图片文件夹（存放文档中使用的所有图片）
└── README.md              # 本说明文件
```


## 🚀 使用说明
### 1. 环境要求
- **LaTeX 编译器**：需使用 **XeLaTeX**。
- **字体依赖**：configuration文件夹中的Fandol字体（`FandolHei-Bold.otf`、`FandolSong-Regular.otf`等）需保留，或安装到系统字体目录。

### 2. 编译步骤
1. **克隆仓库**：
   ```bash
   git clone https://github.com/rooobeam/General-LaTeX-Template-for-College-Students.git
   ```
2. **编译主文档**（需多次运行以确保交叉引用和参考文献正确）：
   - 第一步：`xelatex main.tex`（生成辅助文件）
   - 第二步：`bibtex main`（编译参考文献，若使用`ref.bib`数据库）
   - 第三步：`xelatex main.tex`（更新参考文献引用）
   - 第四步：`xelatex main.tex`（确保所有交叉引用正确）

### 3. 内容填充
- **标题页**：修改`titlepage.tex`中的标题、作者、日期等信息。
- **摘要**：在`abstract.tex`中填写中英文摘要。
- **章节内容**：在`chapter1.tex`、`chapter2.tex`等文件中撰写章节内容，可通过`\input{chapter1}`在`main.tex`中引用。
- **参考文献**：将文献条目添加到`ref.bib`文件中，使用`\cite{key}`在文档中引用，`reference.tex`会自动生成参考文献列表。
- **图片**：将图片放在`figs`文件夹中，使用`\includegraphics{figs/figure1.png}`引用（需加载`graphicx`包，模板已包含）。


## ⚙️ 配置说明
### 1. 类文件（CDUTReport.cls）
定义了报告的核心格式，包括：
- 页面布局（A4纸、页边距、页眉页脚）；
- 章节样式（标题字体、编号格式）；
- 目录生成（自动提取章节标题）。
如需修改格式，可编辑此类文件，但建议**先备份**。

### 2. 自定义命令（Mycommand.sty）
提供了快捷命令，简化重复操作，例如：
- `\fig{path}{caption}`：插入图片并添加说明；
- `\tab{label}{caption}{table content}`：插入表格并添加标签；
- `\code{language}{code content}`：插入代码块（使用`listings`包）。
可根据需要添加或修改自定义命令。

### 3. 字体设置（Font_set.tex）  
`Font_set.tex` 是模板的**核心字体配置文件**，定义了中文、西文、章节标题及表格的字体样式，确保文档符合学术规范且显示清晰。以下是关键配置说明（详细使用示例请参考 `manual.tex` 中的 **1.8 字体** 章节，第3页）：


#### （1）基础字体选择  
模板使用常见西文字体(Arial)并搭配Fandol系列中文字体（需保留 `configuration` 文件夹中的 `.otf` 字体文件），具体如下：  
- **中文字体**：  
  - 主字体（默认正文）：`FandolSong-Regular.otf`（宋体），加粗时自动切换为 `FandolSong-Bold.otf`，斜体时使用 `FandolKai-Regular.otf`（楷体）；  
  - 无衬线字体（用于标题/强调）：`FandolHei-Regular.otf`（黑体），加粗时使用 `FandolHei-Bold.otf`；  
  - 等宽字体（用于代码/数据）：`FandolHei-Regular.otf`（黑体），加粗时使用 `FandolHei-Bold.otf`。  
- **西文字体**：  
  - 主字体/无衬线字体：`Arial`（系统默认安装，确保西文显示清晰）；  
  - 正式西文字体（用于表格/公式）：`Times New Roman`（通过 `\timesnewroman` 命令调用）。


#### （2）自定义字体快捷命令  
为方便切换字体，模板定义了以下常用命令（在 `manual.tex` 中有详细示例）：  
- `\songti`：切换为**宋体**（中文正文默认字体，适合大段文字）；  
- `\heiti`：切换为**黑体**（用于章节标题、重点内容，增强视觉层次感）；  
- `\kaishu`：切换为**楷体**（用于引用、注释或需要区分的内容，风格更正式）。


#### （3）章节标题字体设置  
通过 `titlesec` 包优化了章节标题的格式，确保层级清晰：  
- **章节（section）**：黑体、16pt、加粗、居中显示，标题前自动添加“第X章”（如“2. Problem Restatement”）；  
- **小节（subsection）**：黑体、14pt、加粗，左侧显示小节编号（如“2.1 Problem Background”）；  
- **子小节（subsubsection）**：黑体、12pt、加粗，左侧显示子小节编号（如“1.1.1 abcd”）。


#### （4）表格字体配置  
表格内容默认使用**Times New Roman 10pt**字体（符合学术文档的严谨风格），通过重定义 `tabular` 和 `tabularx` 环境实现，无需手动设置。


#### （5）注意事项  
- **字体安装**：若系统未安装Fandol字体，需将 `configuration` 文件夹中的字体文件（如 `FandolHei-Bold.otf`、`FandolSong-Regular.otf` 等）复制到系统字体目录（如 Windows 的 `C:\Windows\Fonts`）；  
- **西文字体依赖**：Arial 是大多数系统的默认字体，若未安装需手动添加；  
- **修改字体**：若需调整字体样式（如增大标题字体），可编辑 `Font_set.tex` 中的 `\titleformat` 或 `\setCJKmainfont` 命令，但建议先备份原文件。


通过以上配置，模板确保了文档的**字体一致性**和**学术规范性**，同时提供了灵活的字体切换功能，满足不同场景的需求。如需更详细的字体使用说明，请参考 `manual.tex` 中的 **1.8 字体** 章节（第3页）。


## 📖 示例与手册
`manual.tex`是详细的使用手册，包含以下内容：
1. 文件结构  
2. 插入公式
3. 插入图片
4. 插入表格
5. 插入伪代码  
6. 粘贴代码  
7. 引用 
8. 字体 
9. 添加脚注并设置链接

建议用户先查看`manual.tex`，学习如何使用模板的各项功能。


## ⚠️ 注意事项
1. **编译环境**：必须使用XeLaTeX编译，否则中文字体可能无法正确显示。
2. **图片路径**：所有图片请放在`figs`文件夹中，使用相对路径引用（如`figs/figure1.png`），避免绝对路径导致的问题。
3. **参考文献**：`ref.bib`文件需为BibTeX格式，并在`reference.tex`中使用`\bibliography{ref}`引用。
4. **自定义命令**：修改`Mycommand.sty`前请备份，避免误操作导致模板无法编译。
5. **交叉引用**：使用`\label{chapter1}`为章节添加标签，使用`\ref{chapter1}`引用，编译时需多次运行XeLaTeX以确保引用正确。


## 📞 联系方式
若有问题或建议，可通过以下方式联系作者：
- GitHub Issues：https://github.com/rooobeam/General-LaTeX-Template-for-College-Students.git/issues
- Email：rooobeam@uir.edu.cn


# LaTeX Template for College Students' Reports  

This template is suitable for writing **term paper reports**. It is modified based on the report format specifications of Chengdu University of Technology (CDUT) and includes a complete document structure (title page, abstract, table of contents, chapters, references, appendices, etc.). The page and English font settings adhere to the British project specification *Research_Project_Guide.pdf*, and detailed usage instructions are provided.  


## 📁 File Structure  
The following is the file structure of the template and explanations of each file's purpose:  

```
├── main.tex               # Main document file (integrates all subfiles, compilation entry point)  
├── titlepage.tex          # Title page template (includes title, author, date, etc.)  
├── abstract.tex           # Abstract section (Chinese and English abstracts)  
├── chapter1.tex           # Chapter 1 content (can be extended to chapter2.tex, chapter3.tex, etc.)  
├── reference.tex          # References section (cites the bib database)  
├── appendix.tex           # Appendix section (supplementary data, code, etc.)  
├── backpage.tex           # Back cover page (optional)  
├── manual.tex             # User manual (details on inserting equations, images, tables, etc.)  
├── ref.bib                # Bibliography database (BibTeX format, must be linked to reference.tex)  
├── Research_Project_Guide.pdf   # British project specification guide  
├── configuration/         # Configuration folder (format, fonts, custom commands)  
│   ├── CDUTReport.cls     # Core class file (defines page layout, chapter styles, etc.)  
│   ├── Mycommand.sty      # Custom commands (quick insertion of images, tables, etc.)  
│   ├── Font set.tex       # Font settings (uses Fandol series Chinese fonts)  
│   ├── Title set.tex      # Title format settings (title page, chapter title styles)  
│   └── Fandol*.otf        # Fandol font files (Hei, Song, Kai; must be retained or installed)  
├── figs/                  # Image folder (stores all images used in the document)  
└── README.md              # This instruction file  
```


## 🚀 Usage Instructions  
### 1. Environment Requirements  
- **LaTeX Compiler**: **XeLaTeX** is required.  
- **Font Dependencies**: Fandol fonts in the `configuration` folder (e.g., `FandolHei-Bold.otf`, `FandolSong-Regular.otf`) must be retained or installed to the system font directory (e.g., `C:\Windows\Fonts` for Windows).  

### 2. Compilation Steps  
1. **Clone the Repository**:  
   ```bash  
   git clone https://github.com/rooobeam/General-LaTeX-Template-for-College-Students.git  
   ```
2. **Compile the Main Document** (run multiple times to ensure correct cross-references and references):  
   - Step 1: `xelatex main.tex` (generate auxiliary files)  
   - Step 2: `bibtex main` (compile references if using `ref.bib`)  
   - Step 3: `xelatex main.tex` (update reference citations)  
   - Step 4: `xelatex main.tex` (ensure all cross-references are correct)  

### 3. Content Filling  
- **Title Page**: Modify the title, author, date, and other information in `titlepage.tex`.  
- **Abstract**: Fill in the Chinese and English abstracts in `abstract.tex`.  
- **Chapter Content**: Write chapter content in `chapter1.tex`, `chapter2.tex`, etc., and reference them in `main.tex` using `\input{chapter1}`.  
- **References**: Add bibliographic entries to `ref.bib` and cite them in the document using `\cite{key}`. The `reference.tex` file will automatically generate the references list.  
- **Images**: Place images in the `figs` folder and reference them using `\includegraphics{figs/figure1.png}` (the `graphicx` package is included in the template).  


## ⚙️ Configuration Instructions  
### 1. Class File (CDUTReport.cls)  
Defines the core format of the report, including:  
- Page layout (A4 paper, margins, header/footer);  
- Chapter styles (title fonts, numbering format);  
- Table of contents generation (automatically extracts chapter titles).  
To modify the format, edit this file, but **backup first**.  

### 2. Custom Commands (Mycommand.sty)  
Provides shortcut commands to simplify repetitive operations, e.g.:  
- `\fig{path}{caption}`: Insert an image with a caption;  
- `\tab{label}{caption}{table content}`: Insert a table with a label;  
- `\code{language}{code content}`: Insert a code block (uses the `listings` package).  
Add or modify custom commands as needed.  

### 3. Font Settings (Font_set.tex)  
`Font_set.tex` is the **core font configuration file** of the template, defining the font styles for Chinese, Western text, chapter titles, and tables to ensure the document complies with academic standards and displays clearly. Below are key configuration explanations (for detailed usage examples, refer to Section **1.8 Fonts** in `manual.tex`, Page 3):  

#### (1) Basic Font Selection  
The template uses common Western fonts (Arial) paired with Fandol series Chinese fonts (retain the `.otf` files in the `configuration` folder):  
- **Chinese Fonts**:  
  - Main font (default body text): `FandolSong-Regular.otf` (SimSun), automatically switches to `FandolSong-Bold.otf` when bold, and uses `FandolKai-Regular.otf` (KaiTi) for italics;  
  - Sans-serif font (for titles/emphasis): `FandolHei-Regular.otf` (HeiTi), switches to `FandolHei-Bold.otf` when bold;  
  - Monospace font (for code/data): `FandolHei-Regular.otf` (HeiTi), switches to `FandolHei-Bold.otf` when bold.  
- **Western Fonts**:  
  - Main/sans-serif font: `Arial` (preinstalled on most systems, ensures clear Western text display);  
  - Formal Western font (for tables/equations): `Times New Roman` (called via `\timesnewroman`).  

#### (2) Custom Font Shortcut Commands  
To facilitate font switching, the template defines the following common commands (examples in `manual.tex`):  
- `\songti`: Switch to **SimSun** (default Chinese body text, suitable for long passages);  
- `\heiti`: Switch to **HeiTi** (for chapter titles, key content, enhances visual hierarchy);  
- `\kaishu`: Switch to **KaiTi** (for quotes, annotations, or differentiated content, more formal style).  

#### (3) Chapter Title Font Settings  
Optimizes chapter title formats using the `titlesec` package for clear hierarchy:  
- **Section**: HeiTi, 16pt, bold, centered, automatically adds "Chapter X" before the title (e.g., "2. Problem Restatement");  
- **Subsection**: HeiTi, 14pt, bold, left-aligned with subsection number (e.g., "2.1 Problem Background");  
- **Subsubsection**: HeiTi, 12pt, bold, left-aligned with subsubsection number (e.g., "1.1.1 abcd").  

#### (4) Table Font Configuration  
Table content uses **Times New Roman 10pt** by default (complies with academic document rigor), implemented by redefining the `tabular` and `tabularx` environments—no manual setting required.  

#### (5) Notes  
- **Font Installation**: If Fandol fonts are not installed, copy the font files (e.g., `FandolHei-Bold.otf`, `FandolSong-Regular.otf`) from the `configuration` folder to the system font directory (e.g., `C:\Windows\Fonts` for Windows);  
- **Western Font Dependencies**: Arial is a default font on most systems—install manually if missing;  
- **Modifying Fonts**: To adjust font styles (e.g., increase title font size), edit the `\titleformat` or `\setCJKmainfont` commands in `Font_set.tex`, but **backup first**.  

Through the above configurations, the template ensures **font consistency** and **academic规范性** (academic standardization) while providing flexible font switching to meet different needs. For more detailed font usage instructions, refer to Section **1.8 Fonts** in `manual.tex` (Page 3).  


## 📖 Examples and Manual  
`manual.tex` is a detailed user manual covering the following content:  
1. File Structure  
2. Insert Equations  
3. Insert Images  
4. Insert Tables  
5. Insert Pseudocode  
6. Paste Code  
7. Citations  
8. Fonts  
9. Add Footnotes and Set Links  

It is recommended to read `manual.tex` first to learn how to use the template's features.  


## ⚠️ Notes  
1. **Compilation Environment**: XeLaTeX must be used for compilation—otherwise, Chinese fonts may not display correctly.  
2. **Image Path**: All images must be placed in the `figs` folder and referenced using relative paths (e.g., `figs/figure1.png`) to avoid issues with absolute paths.  
3. **References**: The `ref.bib` file must be in BibTeX format and referenced in `reference.tex` using `\bibliography{ref}`.  
4. **Custom Commands**: Backup `Mycommand.sty` before modifying to avoid template compilation failures due to incorrect operations.  
5. **Cross-References**: Use `\label{chapter1}` to add labels to chapters and `\ref{chapter1}` to cite them—run XeLaTeX multiple times to ensure correct cross-references.  


## 📞 Contact Information  
For questions or suggestions, contact the author via:  
- GitHub Issues: https://github.com/rooobeam/General-LaTeX-Template-for-College-Students.git/issues  
- Email: rooobeam@uir.edu.cn
