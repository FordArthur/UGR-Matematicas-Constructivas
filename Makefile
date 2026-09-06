SRC_DIR   = src
BUILD_DIR = latex
IMG_DIR   = img

TARGET    = Main

AGDA       = agda
AGDA_FLAGS = --cubical --safe --without-K -i src

.PHONY: agda latex clean push

agda:
	$(AGDA) $(AGDA_FLAGS) $(SRC_DIR)/$(TARGET).lagda.tex

latex:
	$(AGDA) $(AGDA_FLAGS) --latex --latex-dir=$(BUILD_DIR) $(SRC_DIR)/$(TARGET).lagda.tex
	TEXINPUTS="../$(IMG_DIR):../$(SRC_DIR):" latexmk -xelatex -cd $(BUILD_DIR)/$(TARGET).tex

clean:
	rm -rf $(BUILD_DIR)
	rm -f $(SRC_DIR)/*.agdai
