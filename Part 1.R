#Ques 1) Downloading the data of "gene_expression.tsv"

download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part1_files/gene_expression.tsv",
              destfile = "gene_expression.tsv")
# read into R and making gene accession number as the row number
 x <- read.table("gene_expression.tsv", header = TRUE, row.names = 1)
head(x) 
str(x)

#Ques 2) Making other column with mean of first six genes
x$mean <- rowMeans(x)
head(x)
str(x)

#Ques 3) List of 10 genes with highest mean expression
order(-x$mean)
ord <- x[order(-x$mean),]
head(ord, 10)

#Ques 4) genes with mean less than 10
subset(x, mean<10)

#Ques 5) histogram of mean
hist(x$mean, main ="Histogram of mean values", xlab = "Mean values")

#Ques 6) Download the data of "growth_data.csv"
download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part1_files/growth_data.csv",
              destfile = "growth_data.csv")
#read into R and give specific column names
y <- read.csv("growth_data.csv", sep = "," , header = TRUE, stringsAsFactors = FALSE)
head(y)
str(y)
colnames(y)

#Ques 7) Calculate mean and sd of tree circumference at start and end of both sites
#subset of northeast(ne) in trees growth
subset(y, Site == "northeast")
ne <- subset(y, Site == "northeast")
head(ne)
str(ne)
#Calculation of mean and sd at start of northeast
mean(ne$Circumf_2004_cm)
sd(ne$Circumf_2004_cm)
#calculation of mean and sd at end of northeast
mean(ne$Circumf_2019_cm)
sd(ne$Circumf_2019_cm)
#subset of southwest(sw) in trees growth
subset(y, Site == "southwest")
sw <- subset(y, Site == "southwest")
head(sw)
str(sw)
#calculation of mean and sd at start of southwest 
mean(sw$Circumf_2004_cm)
sd(sw$Circumf_2004_cm)
#calculation of mean and sd at end of southwest
mean(sw$Circumf_2019_cm)
sd(sw$Circumf_2019_cm)

#Ques 8) Boxplot of tree circumference at start and end at bothsites
#at start and end of northeast site
boxplot (ne$Circumf_2004_cm, ne$Circumf_2019_cm, main = "Boxplot of circumference of tree at northeast site",
         ylab = "Circumference of tree", names = c("ne_2004", "ne_2019"))
#at start and end of southwest site
boxplot(sw$Circumf_2004_cm, sw$Circumf_2019_cm, main = "Boxplot of circumference of tree at southwest site", 
        ylab = "Circumference of tree", names = c("sw_2004", "sw_2019"))

#Ques 9) mean growth at each site over past 10 years
#at northeast site
a <- ne$Circumf_2019_cm - ne$Circumf_2009_cm
mean(a)
head(ne)        
str(ne)
#at southwest site 
b <- sw$Circumf_2019_cm - sw$Circumf_2009_cm
mean(b)
head(sw)
str(sw)

#Ques 10) perform tests to estimate p-value
#t.test
t.test(a, b)
#wilcox.test
wilcox.test(a, b)
