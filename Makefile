# ==============================
# Makefile for LaTeX Notes Project
# ==============================

# 输出目录
OUTDIR	 :=	out

# 主文件
MAIN_TEX :=	main.tex
MAIN_PDF :=	$(OUTDIR)/main.pdf

# 所有章节文件
PARTS=$(wildcard part*.tex)
CHAPS=$(wildcard chap*.tex)

# ------------------------------
# 默认目标
# ------------------------------
all: $(MAIN_PDF)

# ------------------------------
# 生成 PDF
# ------------------------------
$(MAIN_PDF): $(MAIN_TEX) $(PARTS) $(CHAPS)
	latexmk -xelatex -interaction=nonstopmode -file-line-error -synctex=1 -outdir=$(OUTDIR) -pdf $(MAIN_TEX)

# ------------------------------
# 清理输出目录
# ------------------------------
clean:
	latexmk -C -outdir=$(OUTDIR) $(MAIN_TEX) $(PARTS) $(CHAPS)

# ------------------------------
# 伪目标声明
# ------------------------------
.PHONY: all clean