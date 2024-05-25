library(Seurat)
library(dplyr)
library(sceasy)

use_condaenv("sceasy")

harmony <- readRDS("data/harmony_integration.rds")

convertFormat(harmony, from="sce", to="anndata", outFile='data/harmony.h5ad')

cca <- readRDS("data/cca_integration.rds")

convertFormat(cca, from="sce", to="anndata", outFile='data/cca.h5ad')

rpca <- readRDS("data/rpca_integration.rds")

convertFormat(rpca, from="sce", to="anndata", outFile='data/rpca.h5ad')

jointpca <- readRDS("data/jointpca_integration.rds")

convertFormat(jointpca, from="sce", to="anndata", outFile='data/jointpca.h5ad')

blood_atlas <- readRDS("blood_atlas_with_symbols.rds")
blood_atlas[["RNA"]] <- as(blood_atlas[["RNA"]], Class="Assay")
sce <- as.SingleCellExperiment(blood_atlas)

convertFormat(sce, from="sce", to="anndata", outFile='blood_atlas_with_symbols.h5ad')
