library(ggplot2)
library(GenomicRanges)
# Carica i dati dei file BED
print("bonjovy")
tss_file <- "/sharedFolder/Data/mm9_site_TSS.bed"
tss_file=read.table(tss_file,header=FALSE,sep="\t")
colnames(tss_file)=c("chrom", "start", "end", "gene", "score", "strand")
tss_gr <- GRanges(seqnames = tss_file$chrom, IRanges(start = tss_file$start, end = tss_file$end))


all_data <- data.frame()


for(junctions_file in list.files("/sharedFolder/Data/1_HTGTS/3_JunctionPaper/junction_pooled/"))
{
#junctions_file=list.files("/sharedFolder/Data/1_HTGTS/3_JunctionPaper/junction_pooled/")[1]
junctions_file=paste("/sharedFolder/Data/1_HTGTS/3_JunctionPaper/junction_pooled/",junctions_file,sep="")

junctions=read.table(junctions_file,header=FALSE,sep="\t")
colnames(junctions)=c("chrom", "start", "end", "junction", "score", "strand")
junctions_gr <- GRanges(seqnames = junctions$chrom, IRanges(start = junctions$start, end = junctions$end))

# Carica i dati BED come tabelle

# Definisci la distanza massima di 8000 bp dal TSS
max_distance <- 8000
filtered_junctions_gr <- findOverlaps(junctions_gr, promoters(tss_gr, upstream = max_distance, downstream = max_distance))
distances <- start(junctions_gr[queryHits(filtered_junctions_gr)]) - start(tss_gr[subjectHits(filtered_junctions_gr)])

rpm=log2(((countOverlaps(promoters(junctions_gr[queryHits(filtered_junctions_gr)],upstream=1000,downstream=1000),junctions_gr)/length(junctions_gr))*1000000)+1)


cycle_data <- data.frame(distance = distances, rpm = rpm, cycle = basename(junctions_file))
all_data <- rbind(all_data, cycle_data)

}
all_data=as.data.frame(all_data)
print("finito")
ggplot(all_data, aes(x = distance, y = rpm, color = cycle)) +
geom_smooth(method = "loess", formula = y ~ x, se = FALSE, linewidth = 1.5) +
labs(x = "Distanza dal TSS", y = "RPM", title = "Distribuzione dei Log(RPM) rispetto al TSS per cicli") +
  theme_minimal() +
  theme(legend.position = "top")
ggsave("nome_del_file.png", plot = last_plot(), width = 8, height = 6, units = "in", dpi = 300)
