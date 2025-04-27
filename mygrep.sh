#!/bin/bash

print_usage() {
  echo "Usage: $0 [-n] [-v] search_string filename"
  echo "Options:"
  echo "  -n    Show line numbers"
  echo "  -v    Invert match (show lines that do NOT match)"
  echo "  --help Show this help message"
}

show_line_number=false
invert_match=false

while [[ "$1" == -* ]]; do
  case "$1" in
    -n) show_line_number=true ;;
    -v) invert_match=true ;;
    --help) print_usage; exit 0 ;;
    -*) 

      optstring="${1#-}"
      for (( i=0; i<${#optstring}; i++ )); do
        case "${optstring:$i:1}" in
          n) show_line_number=true ;;
          v) invert_match=true ;;
          *) echo "Unknown option: -${optstring:$i:1}"; print_usage; exit 1 ;;
        esac
      done
      ;;
  esac
  shift
done

search_string="$1"
filename="$2"

if [[ -z "$search_string" || -z "$filename" ]]; then
  echo "Error: Missing search string or filename."
  print_usage
  exit 1
fi

if [[ ! -f "$filename" ]]; then
  echo "Error: File '$filename' does not exist."
  exit 1
fi

line_number=0
while IFS= read -r line; do
  ((line_number++))
  if echo "$line" | grep -qi "$search_string"; then
    match=true
  else
    match=false
  fi

  if $invert_match; then
    match=$(! $match && echo true || echo false)
  fi

  if $match; then
    if $show_line_number; then
      echo "${line_number}:$line"
    else
      echo "$line"
    fi
  fi
done < "$filename"
