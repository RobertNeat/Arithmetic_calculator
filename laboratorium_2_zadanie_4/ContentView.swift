import SwiftUI

struct ContentView: View {
    @State private var firstNumber: String = ""
    @State private var secondNumber: String = ""
    @State private var operationIndex: Int = 0
    @State private var result: String = ""
    
    let operations = ["+", "-", "*", "/"]
    
    var body: some View {
        VStack {
            TextField("Pierwsza liczba", text: $firstNumber)
                .keyboardType(.numberPad)
                .padding()
            TextField("Druga liczba", text: $secondNumber)
                .keyboardType(.numberPad)
                .padding()
            Picker(selection: $operationIndex, label: Text("Działanie")) {
                ForEach(0..<operations.count) {
                    Text(self.operations[$0])
                }
            }.pickerStyle(SegmentedPickerStyle())
            Button(action: {
                self.calculate()
            }) {
                Text("Oblicz")
            }.padding()
            Text(result)
                .padding()
        }
    }
    
    func calculate() {
        guard let first = Int(firstNumber), let second = Int(secondNumber) else {
            result = "Niepoprawne dane wejściowe"
            return
        }
        
        switch operations[operationIndex] {
        case "+":
            result = String(first + second)
        case "-":
            result = String(first - second)
        case "*":
            result = String(first * second)
        case "/":
            if second == 0 {
                result = "Nie można dzielić przez zero"
            } else {
                result = String(format: "%.2f", Double(first) / Double(second))
            }
        default:
            result = "Niepoprawne dane wejściowe"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
