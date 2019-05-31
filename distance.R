library(dslabs)
data("tissue_gene_expression")
dim(tissue_gene_expression$x)
table(tissue_gene_expression$y)
d <- dist(tissue_gene_expression$x)
as.matrix(d)[1,2]
as.matrix(d)[39,40]
as.matrix(d)[73,74]
