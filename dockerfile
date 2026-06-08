FROM alpine:3.23.4

# Pin package versions
RUN apk add --no-cache \
  pandoc=3.8.2.1-r0 \
  tectonic=0.15.0-r5 \
  font-liberation

# 2. Force Tectonic to pre-download the core LaTeX bundle during build time
RUN mkdir /tmp/warmup && \
  printf '\\documentclass[a4paper,11pt]{report}\\usepackage{graphicx}\\usepackage{geometry}\\usepackage{microtype}\\usepackage{hyperref}\\usepackage{xcolor}\\usepackage{tocbibind}\\usepackage{indentfirst}\\usepackage{lettrine}\\usepackage{fontenc}\\usepackage{amssymb}\\usepackage{amsmath}\\begin{document}Warmup\\end{document}\n' > /tmp/warmup/warmup.tex && \
  tectonic /tmp/warmup/warmup.tex && \
  rm -rf /tmp/warmup

WORKDIR /data

