#!/bin/bash

set -e  # zatrzymaj skrypt przy błędzie

# 1. Stwórz folder 'data' jeśli nie istnieje
mkdir -p data
cd data

# Nazwa pliku, który nas interesuje
TARGET="glove.6B.100d.txt"

# Sprawdź, czy plik już istnieje
if [ -f "$TARGET" ]; then
    echo "$TARGET już istnieje – pomijam pobieranie."
    exit 0
fi

echo "$TARGET nie znaleziono – pobieranie..."
wget -c https://nlp.stanford.edu/data/glove.6B.zip

echo "Rozpakowywanie..."
unzip -q glove.6B.zip

echo "Czyszczenie..."
find . -name 'glove.6B.*' ! -name "$TARGET" -delete

echo "Usuwanie archiwum..."
rm glove.6B.zip

echo "Gotowe! Plik: data/$TARGET"
