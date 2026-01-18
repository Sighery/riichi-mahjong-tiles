SVG_DIRS := Regular Black
EXPORT_DIR := Export

SVG_FILES := $(foreach dir,$(SVG_DIRS),$(wildcard $(dir)/*.svg))
PDF_FILES := $(patsubst %.svg,$(EXPORT_DIR)/%.pdf,$(SVG_FILES))

.PHONY: all
all: $(PDF_FILES)

$(EXPORT_DIR)/Regular/%.pdf: Regular/%.svg
	@mkdir -p $(dir $@)
	inkscape "$<" --export-type=pdf --export-filename="$@"

$(EXPORT_DIR)/Black/%.pdf: Black/%.svg
	@mkdir -p $(dir $@)
	inkscape "$<" \
		--export-type=pdf \
		--export-background=black \
		--export-background-opacity=1 \
		--export-area-page \
		--export-filename="$@"

.PHONY: clean
clean:
	rm -f $(EXPORT_DIR)/Regular/*.pdf
	rm -f $(EXPORT_DIR)/Black/*.pdf
