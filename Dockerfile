FROM nginx:1.27-alpine

WORKDIR /usr/share/nginx/html

COPY . /usr/share/nginx/html/

RUN if [ ! -f /usr/share/nginx/html/index.html ] && [ ! -f /usr/share/nginx/html/index.htm ]; then \
      printf '%s\n' \
      '<!doctype html>' \
      '<html lang="en">' \
      '<head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>test-pages</title></head>' \
      '<body><main><h1>test-pages</h1><p>Container smoke test passed.</p></main></body>' \
      '</html>' > /usr/share/nginx/html/index.html; \
    fi

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
