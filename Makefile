SCHWARZ=$(shell cat NAME)

INPUT_SCSS=${SCHWARZ}.sass
OUTPUT_CSS=${SCHWARZ}.css
MIN_CSS=${SCHWARZ}.css.min

all: clean vim build miniclip cat

build:
	@sass ${INPUT_SCSS} ${OUTPUT_CSS}
	@minify ${OUTPUT_CSS} > ${MIN_CSS}

clean:
	-@rm -f ${OUTPUT_CSS}
	-@rm -f ${OUTPUT_CSS}.map
	-@rm -f ${MIN_CSS}

clip:
	-@cat ${OUTPUT_CSS}|xclip -i  -selection clipboard

miniclip:
	-@cat ${MIN_CSS}|xclip -i  -selection clipboard

test:
	@sass -c ${INPUT_SCSS}

vim:
	@vim ${INPUT_SCSS}

cat:
	-@cat ${OUTPUT_CSS}
