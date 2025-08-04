#!/bin/bash

echo "== Dry-run validation for all YAML files =="

for file in *.yaml; do
    echo "---- Testing $file ----"
    kubectl apply -f "$file" --dry-run=server
    echo ""
done

