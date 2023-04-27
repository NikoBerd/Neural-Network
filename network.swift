import Foundation

// Define the neural network model
class NeuralNetwork {
    var weights: [[Double]]
    
    init() {
        weights = [
            [0.5, 0.2],
            [-0.3, 0.8]
        ]
    }
    
    func feedForward(inputs: [Double]) -> Double {
        let output = sigmoid(dotProduct(weights, inputs))
        return output
    }
    
    func train(inputs: [Double], target: Double, learningRate: Double) {
        let output = feedForward(inputs: inputs)
        let error = target - output
        
        for i in 0..<weights.count {
            for j in 0..<weights[i].count {
                weights[i][j] += learningRate * error * inputs[j]
            }
        }
    }
    
    func sigmoid(_ x: Double) -> Double {
        return 1.0 / (1.0 + exp(-x))
    }
    
    func dotProduct(_ a: [[Double]], _ b: [Double]) -> Double {
        var result = 0.0
        for i in 0..<a.count {
            var sum = 0.0
            for j in 0..<b.count {
                sum += a[i][j] * b[j]
            }
            result += sum
        }
        return result
    }
}

// Train the neural network on a simple dataset
let dataset = [
    ([0.0, 0.0], 0.0),
    ([0.0, 1.0], 1.0),
    ([1.0, 0.0], 1.0),
    ([1.0, 1.0], 0.0)
]

let learningRate = 0.1
let epochs = 10000
let network = NeuralNetwork()

for _ in 0..<epochs {
    for example in dataset {
        network.train(inputs: example.0, target: example.1, learningRate: learningRate)
    }
}

// Test the neural network on new inputs
let inputs1 = [1.0, 0.0]
let expectedOutput1 = 1.0
let output1 = network.feedForward(inputs: inputs1)
print("The neural network output for \(inputs1) is \(output1). Expected output is \(expectedOutput1)")

let inputs2 = [0.0, 0.0]
let expectedOutput2 = 0.0
let output2 = network.feedForward(inputs: inputs2)
print("The neural network output for \(inputs2) is \(output2). Expected output is \(expectedOutput2)")

let inputs3 = [0.0, 1.0]
let expectedOutput3 = 1.0
let output3 = network.feedForward(inputs: inputs3)
print("The neural network output for \(inputs3) is \(output3). Expected output is \(expectedOutput3)")




