# ABPP Data Analysis Workflow

This repository contains R scripts for analyzing ABPP data, including data filtering, pathway enrichment, volcano plot visualization, and active site matching. These scripts can be used to process and analyze protein data with specific criteria.

## Features

### Data Filtering and Preprocessing:
Filter data based on conditions such as PSM, abundance, and p-value.
Separate duplicate proteins in the Master Protein Accessions column.
### Pathway Enrichment and Visualization:
Perform pathway enrichment analysis.
Generate volcano plots for differential protein expression.
### Active Site Matching:
Extract active site information from UniProt and combine it with protein data.
Match and filter consistent active sites with extracted protein sites.
### IPA Data Preparation:
Expand overlapping protein data for IPA analysis.
## Scripts Overview

### Script Name	Description
#### Separate repeat protein Screening repeat protein.R	Splits duplicate proteins in the Master Protein Accessions column.
#### Protein binding volcano map.R	Generates volcano plots for protein data.
#### uniprot downloads active-site extraction code.R	Extracts active site information from UniProt files.
#### The extracted protein point of tb and dy.R	Processes and combines TB and DY protein sites.
#### The extracted protein point of gd and y.R	Processes and combines GD and Y protein sites.
#### Screening repeat protein.R	Filters proteins with consistent active site positions.
#### active-site was combined with the extracted binding protein site code.R	Combines active site data with extracted protein site information.
#### ipa data processing.R	Expands overlapping protein data for IPA analysis.
## Usage

### Step 1: Data Filtering and Preprocessing
#### Filter data where PSM > 5.
#### Use Separate repeat protein Screening repeat protein.R to split duplicate proteins in the Master Protein Accessions column.
#### Apply additional conditions:
#### abundance < 0.5 (apply log2 transformation).
#### p-value < 0.05 (apply -log10 transformation).
#### Allow up to one NA in found in simple across three replicates.
#### Ensure at least one DBIA1 cysteine-binding site is present.
### Step 2: Pathway Enrichment and Volcano Plot Analysis
#### Use Protein binding volcano map.R to create volcano plots for filtered data.
### Step 3: Active Site Matching
#### Download active site data from UniProt.
#### Use uniprot downloads active-site extraction code.R to extract active site numbers.
#### Process filtered protein data using:
#### The extracted protein point of tb and dy.R or The extracted protein point of gd and y.R for extracting sites.
#### Protein Site Extraction and Merging with p-value and Abundance.R if abundance and p-value are needed.
#### Combine active site data with protein site information using active-site was combined with the extracted binding protein site code.R.
### Step 4: Final Filtering
#### Use Screening repeat protein.R to retain only consistent proteins.
### Step 5: IPA Data Preparation
#### Use ipa data processing.R to expand overlapping proteins in IPA data.
## Citation

If you use these scripts in your research, please cite the corresponding publication: [Insert Your Article Citation Here]

## License

This repository is licensed under the MIT License.
