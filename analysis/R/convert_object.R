library(Seurat)
library(dplyr)
library(sceasy)

use_condaenv("sceasy")

harmony <- as.SingleCellExperiment(readRDS("data/harmony_annotated.rds"))

convertFormat(harmony, from="sce", to="anndata", outFile='data/harmony.h5ad')

cca <- as.SingleCellExperiment(readRDS("data/cca_annotated.rds"))

convertFormat(cca, from="sce", to="anndata", outFile='data/cca.h5ad')

rpca <- as.SingleCellExperiment(readRDS("data/rpca_annotated.rds"))

convertFormat(rpca, from="sce", to="anndata", outFile='data/rpca.h5ad')

jointpca <- as.SingleCellExperiment(readRDS("data/jointpca_annotated.rds"))

convertFormat(jointpca, from="sce", to="anndata", outFile='data/jointpca.h5ad')

blood_atlas <- readRDS("blood_atlas_with_symbols.rds")
blood_atlas[["RNA"]] <- as(blood_atlas[["RNA"]], Class="Assay")
sce <- as.SingleCellExperiment(blood_atlas)

convertFormat(sce, from="sce", to="anndata", outFile='blood_atlas_with_symbols.h5ad')
