computeMatrix reference-point -S /sharedFolder/Data/5_CutTagAce/220607_JT10123_MN00260_trimmed_DMSO.bw /sharedFolder/Data/5_CutTagAce/220607_JT10123_MN00260_trimmed_Taze.bw /sharedFolder/Data/5_CutTagAce/220607_JT10123_MN00260_trimmed_Vale.bw -R /sharedFolder/Data/refGene.gtf --referencePoint TSS --beforeRegionStartLength 6000 --afterRegionStartLength 6000 --skipZeros -o matrix.mat.gz --missingDataAsZero
plotHeatmap -m matrix.mat.gz -out Ace_6k.png  --colorMap Oranges \
      --zMin 0 \
      --zMax 2 
      
computeMatrix reference-point -S /sharedFolder/Data/5_CutTagAce/220607_JT10123_MN00260_trimmed_DMSO.bw /sharedFolder/Data/5_CutTagAce/220607_JT10123_MN00260_trimmed_Taze.bw /sharedFolder/Data/5_CutTagAce/220607_JT10123_MN00260_trimmed_Vale.bw -R /sharedFolder/Data/refGene.gtf --referencePoint TSS --beforeRegionStartLength 5000 --afterRegionStartLength 5000 --skipZeros -o matrix.mat.gz --missingDataAsZero
plotHeatmap -m matrix.mat.gz -out Ace_5k.png  --colorMap Oranges \
      --zMin 0 \
      --zMax 2 
      
computeMatrix reference-point -S /sharedFolder/Data/5_CutTagAce/220607_JT10123_MN00260_trimmed_DMSO.bw /sharedFolder/Data/5_CutTagAce/220607_JT10123_MN00260_trimmed_Taze.bw /sharedFolder/Data/5_CutTagAce/220607_JT10123_MN00260_trimmed_Vale.bw -R /sharedFolder/Data/refGene.gtf --referencePoint TSS --beforeRegionStartLength 3000 --afterRegionStartLength 3000 --skipZeros -o matrix.mat.gz --missingDataAsZero
plotHeatmap -m matrix.mat.gz -out Ace_3k.png  --colorMap Oranges \
      --zMin 0 \
      --zMax 2 