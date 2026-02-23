SVD_RELEASE := 2024-05-09
SVD_FILE := esp32h2.svd
SVD_URL := https://github.com/espressif/svd/releases/download/$(SVD_RELEASE)/$(SVD_FILE)

SKETCHES := sketch1 sketch2

.PHONY: all clean $(SKETCHES) svd

all: $(SKETCHES)

$(SKETCHES):
	$(MAKE) -C $@

clean:
	for dir in $(SKETCHES); do \
		$(MAKE) -C $$dir clean; \
	done

svd: $(SVD_FILE)

$(SVD_FILE):
	curl -L -O $(SVD_URL)
