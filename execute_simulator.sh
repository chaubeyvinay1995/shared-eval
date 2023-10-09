#!/bin/sh

set -e

echo "\n[Shell]: Running script.py"
python script.py

echo "\n[Shell]: Creating necessary directories"
mkdir -p logs_data/interactive_plots logs_data/metadata logs_data/plots logs_data/summary

echo "[Shell]: Running log_summarizer.py\n"
DIR=$(ls -td ./simulation_logs/*/*| head -1)
python analyzer/log_summarizer.py $DIR

echo "[Shell]: Running visualizer.py\n"
SUMMARY_FILE=$(ls -t ./logs_data/summary/*/* | head -1)
python analyzer/visualizer.py $SUMMARY_FILE