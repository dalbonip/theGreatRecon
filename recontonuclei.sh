#!/bin/bash
nuclei --update-templates;
cat domains | nuclei -t ~/nuclei-templates/ -o result