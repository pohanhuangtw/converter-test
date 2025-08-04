#!/bin/bash

workdir="$1"

if [ -z "$workdir" ]; then
    echo "Usage: $0 <workdir>"
    exit 1
fi

echo "== Dry-run validation for all YAML files in $workdir =="

for file in "$workdir"*.yaml; do
    # Skip if no files found
    [ -e "$file" ] || continue

    echo "---- Testing $file ----"
    kubectl apply -f "$file" --dry-run=server
    echo ""
done

