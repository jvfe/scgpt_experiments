library(Seurat)
library(dplyr)
library(sceasy)

use_condaenv("sceasy")

load("sc_qc_GSM5102900_SCT_clusters.rda")

sce <- as.SingleCellExperiment(sc_qc_GSM5102900_sct)

convertFormat(sce, from="sce", to="anndata", outFile='sce.h5ad')

blood_atlas <- readRDS("blood_atlas_with_symbols.rds")
blood_atlas[["RNA"]] <- as(blood_atlas[["RNA"]], Class="Assay")
sce <- as.SingleCellExperiment(blood_atlas)

convertFormat(sce, from="sce", to="anndata", outFile='blood_atlas_with_symbols.h5ad')
