computeMatrix reference-point -S /sharedFolder/Data/3_gro_seq/BW/DMSO.bw /sharedFolder/Data/3_gro_seq/BW/Taze.bw /sharedFolder/Data/3_gro_seq/BW/Vale.bw -R /sharedFolder/Data/refGene.gtf --referencePoint TSS --beforeRegionStartLength 3000 --afterRegionStartLength 3000 --skipZeros -o matrix.mat.gz --missingDataAsZero
plotHeatmap -m matrix.mat.gz -out pos.png  --colorMap Oranges \
      --zMin 0 \
      --zMax 2 

