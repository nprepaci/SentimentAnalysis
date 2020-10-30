import Cocoa
import CreateML

let data = try MLDataTable(contentsOf: URL(fileURLWithPath: "/Users/nicholasrepaci/Desktop/Programming/iOS Development/SentimentAnalysis/twitter-sanders-apple3.csv"))

//.8 = 80% training data, 20% testing data
//Seed is unique key for random split, if i need to use this exact split again use seed 5
//trainingData is the random 80% split
let (trainingData, testingData) = data.randomSplit(by: 0.8, seed: 5)


//class column and text columns are inside the csv file
let sentimentClassifier = try MLTextClassifier(trainingData: trainingData, textColumn: "text", labelColumn: "class")

let evaluationMetrics = sentimentClassifier.trainingMetrics
print(evaluationMetrics)

let evauationAccuracy = (1.0 - evaluationMetrics.classificationError) * 100

let metadata = MLModelMetadata(author: "NRepaci", shortDescription: "a model trained to classify web data", version: "1.0")


try sentimentClassifier.write(to: URL(fileURLWithPath: "/Users/nicholasrepaci/Desktop/Programming/iOS Development/SentimentAnalysis/TweetSentimentClassifier.mlmodel"))

try sentimentClassifier.prediction(from: "@apple is a bad company")

try sentimentClassifier.prediction(from: "what an awesome day")
