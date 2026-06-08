alias b := build
alias co := compile
alias c := clean

default:
    @just --list

[unix]
compile:
    docker compose run --rm -w /data/ compiler tectonic main.tex

# Build or rebuild the underlying Docker image
[unix]
build:
    docker compose build

# Clean up temporary build artifacts and logs across all directories
[unix]
clean:
    docker compose run --rm -w /data/ compiler find . -type f \( -name "*.aux" -o -name "*.fdb_latexmk" -o -name "*.fls" -o -name "*.log" -o -name "*.out" -o -name "*.toc" -o -name "*.synctex.gz" \) -delete
