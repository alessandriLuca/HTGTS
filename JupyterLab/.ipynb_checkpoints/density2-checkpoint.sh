computeMatrix reference-point -S /sharedFolder/Data/4_cutTagMet/scratch_DMSO.bw /sharedFolder/Data/4_cutTagMet/scratch_Taze.bw /sharedFolder/Data/4_cutTagMet/scratch_Vale.bw -R /sharedFolder/Data/refGene.gtf --referencePoint TSS --beforeRegionStartLength 6000 --afterRegionStartLength 6000 --skipZeros -o matrix_MET.mat.gz --missingDataAsZero
plotHeatmap -m matrix_MET.mat.gz -out MET_Greens6K.png --colorMap Greens \
      --zMin 0 \
      --zMax 2 
plotHeatmap -m matrix_MET.mat.gz -out MET_Blues6K.png --colorMap Blues \
      --zMin 0 \
      --zMax 2 

computeMatrix reference-point -S /sharedFolder/Data/4_cutTagMet/scratch_DMSO.bw /sharedFolder/Data/4_cutTagMet/scratch_Taze.bw /sharedFolder/Data/4_cutTagMet/scratch_Vale.bw -R /sharedFolder/Data/refGene.gtf --referencePoint TSS --beforeRegionStartLength 5000 --afterRegionStartLength 5000 --skipZeros -o matrix_MET.mat.gz --missingDataAsZero
plotHeatmap -m matrix_MET.mat.gz -out MET_Greens5K.png --colorMap Greens \
      --zMin 0 \
      --zMax 2 
plotHeatmap -m matrix_MET.mat.gz -out MET_Blues5K.png --colorMap Blues \
      --zMin 0 \
      --zMax 2 
      
      
computeMatrix reference-point -S /sharedFolder/Data/4_cutTagMet/scratch_DMSO.bw /sharedFolder/Data/4_cutTagMet/scratch_Taze.bw /sharedFolder/Data/4_cutTagMet/scratch_Vale.bw -R /sharedFolder/Data/refGene.gtf --referencePoint TSS --beforeRegionStartLength 3000 --afterRegionStartLength 3000 --skipZeros -o matrix_MET.mat.gz --missingDataAsZero
plotHeatmap -m matrix_MET.mat.gz -out MET_Greens3K.png --colorMap Greens \
      --zMin 0 \
      --zMax 2 
plotHeatmap -m matrix_MET.mat.gz -out MET_Blues3K.png --colorMap Blues \
      --zMin 0 \
      --zMax 2 