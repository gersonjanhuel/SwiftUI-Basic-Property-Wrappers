//
//  SwiftUIViewGame.swift
//  PropertyWrapperPuzzleExercise
//
//  Created by Gerson Janhuel on 05/04/23.
//

import SwiftUI

struct SwiftUIViewGame: View {
    @State private var date = Date()
    @State private var slider = 0.75
    @State private var stepper = 0
    @State private var textField = ""
    @State private var prize = "dua"
    @State private var toggle = true
    var prizes = ["iPhone", "Apple Watch", "Airpods"]
    @State private var selectedPrize = "iPhone"
    @State private var showingSheet = false
    
    // 19 April 2023
    let submissionDate = Date(timeIntervalSince1970: 1681837200)
    
    var body: some View {
        NavigationView {
            VStack {
                
                Form {
                    
                    HStack {
                        TextField("Apply by April 19", text: $textField)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.vertical, 10)
                        
                        ExtractedView(isCorrect: (textField.lowercased() == "swift student challenge"))
                    }
                    
                    
                    HStack {
                        DatePicker(selection: $date, displayedComponents: .date) {
                            Text("🏁")
                        }
                        .datePickerStyle(.compact)
                        .padding(.vertical, 10)
                        
                        ExtractedView(isCorrect: (Calendar.current.isDate(date, inSameDayAs: submissionDate)))
                    }

                    
                    HStack {
                        Text("📁")
                            .padding(.trailing, 5)
                        
                        Slider(value: $slider)
                            .padding(.vertical, 10)
                        
                        Text("\(Int(slider*100))MB" )
                        
                        ExtractedView(isCorrect: (Int(slider*100) <= 25 && Int(slider*100) >= 1))
                    }
                    
                    
                    HStack {
                        
                        Picker("🎁", selection: $selectedPrize) {
                            ForEach(prizes, id: \.self) {
                                Text($0)
                            }
                        }
                        
                        ExtractedView(isCorrect: (selectedPrize.lowercased() == "airpods"))
                    }
                    
                    
                    HStack {
                        Stepper(value: $stepper, in: 0...50) {
                            Text("2022 🏅 =  \(stepper)")
                        }
                        .padding(.vertical, 10)
                        
                        ExtractedView(isCorrect: (stepper == 11))
                    }
                    
                    HStack {
                        Toggle(isOn: $toggle) {
                            Text("🧑‍🎓")
                        }
                        .padding(.vertical, 10)
                        
                        ExtractedView(isCorrect: (!toggle))
                    }
                    
                    
                }
                .font(.title2)
                .scrollContentBackground(.hidden)
                
                
                Button {
                    
                    openTheBox()
                    
                } label: {
                    Text("Open")
                        .padding(.horizontal, 50)
                        .padding(.vertical, 10)
                        .font(.title)
                        .fontWeight(.bold)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .padding(.top, 50)
                .disabled(isButtonDisable())
                
            }
            .background(Color.white)
            .navigationTitle("WWDC23 Puzzle!")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $showingSheet) {
                        SheetView()
                    }
        }
    }
    
    private func isButtonDisable() -> Bool {
        return !((textField.lowercased() == "swift student challenge") && (Calendar.current.isDate(date, inSameDayAs: submissionDate)) && (selectedPrize.lowercased() == "airpods") && (Int(slider*100) <= 25 && Int(slider*100) >= 1) && (stepper == 11) && (!toggle))
    }
    
    private func openTheBox() {
        showingSheet.toggle()
    }
}

struct SheetView: View {
    //@Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            ConfettiView()
            
            VStack {
                Text("🎉")
                    .font(.system(size: 150))
                
                Text("Congrats!\nWish you luck with the submission! 🙌🏻")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
            }
            .font(.title)
            .padding()
        }
    }
}

struct ExtractedView: View {
    var isCorrect: Bool = false
    
    var body: some View {
        ZStack {
            
            Circle()
                .foregroundColor((isCorrect) ? .green : .black)
                .frame(width: 40, height: 40)
                .padding(.leading, 10)
            
            Image(systemName: (isCorrect) ? "lock.open" : "lock")
                .padding(.leading, 10)
                .foregroundColor(.white)
        }
        
    }
}

struct SwiftUIViewGame_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewGame()
    }
}
