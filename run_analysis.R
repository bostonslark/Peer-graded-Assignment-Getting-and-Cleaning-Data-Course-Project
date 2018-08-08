library(dplyr)

# Read data tables from text files
feature <- read.table('features.txt', col.names = c('id', 'feature'))
activity <- read.table('activity_labels.txt', col.names = c('label', 'activity'))
test_subject <- read.table('test/subject_test.txt', col.names = 'subject')
test_x <- read.table('test/X_test.txt', col.names = feature$feature)
test_y <- read.table('test/Y_test.txt', col.names = 'label')
train_subject <- read.table("train/subject_train.txt", col.names = "subject")
train_x <- read.table("train/X_train.txt", col.names = feature$feature)
train_y <- read.table("train/Y_train.txt", col.names = "label")

# Merge data tables by common labels
test_y_label <- left_join(test_y, activity, by = 'label')
test_tidy <- cbind(test_subject, test_y_label, test_x)
test_tidy <- select(test_tidy, -'label')
train_y_label <- left_join(train_y, activity, by = "label")
train_tidy <- cbind(train_subject, train_y_label, train_x)
train_tidy <- select(train_tidy, -'label')

# Create a tidy data set with summary
tidy_all <- rbind(test_tidy, train_tidy)
tidy_sub <- select(tidy_all, contains('mean'), contains('std'))
tidy_sub$subject <- as.factor(tidy_all$subject)
tidy_sub$activity <- as.factor(tidy_all$activity)
tidy <- tidy_sub %>% group_by(subject, activity) %>% summarise_all(funs(mean))
