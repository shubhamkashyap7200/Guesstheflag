//
//  ContentView.swift
//  Guesstheflag
//
//  Created by Shubham on 1/12/25.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State private var totalQuestions = 8
    @State private var userScore = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    struct FlagImageView: View {
        var imgStr: String
        var body: some View {
            Image(imgStr)
                .clipShape(.capsule)
                .shadow(radius: 5)
        }
    }
    
    // MARK: - Views
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)],
                           center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                Spacer()
                Text("Score: \(userScore)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
                
                VStack(spacing: 15) {
                    
                    Text("Guess a flag of")
                        .foregroundStyle(.white)
                        .font(.subheadline.weight(.heavy))
                    
                    Text(countries[correctAnswer])
                        .foregroundStyle(.secondary)
                        .font(.largeTitle.weight(.semibold))
                    
                    
                    VStack {
                        ForEach(0..<3) {number in
                            Button {
                                flagTapped(number)
                            } label: {
                                FlagImageView(imgStr: countries[number])
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                
                Spacer()
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button {
                askQuestion()
            } label: {
                if totalQuestions > 1 {
                    Text("Continue")
                } else {
                    Text("Restart game")
                }
            }

        } message: {
            Text("Your score is \(userScore)")
        }
    }
}

extension ContentView {
    // MARK: - Methods
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore += 1
        } else {
            scoreTitle = "Wrong tha's the flag of \(countries[number])"
            userScore -= 1
        }
        
        if userScore < 1 { userScore = 0 }
        showingScore = true
    }
    
    func askQuestion() {
        if totalQuestions > 1 {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            totalQuestions -= 1
        } else {
            restartGame()
        }
    }
    
    func restartGame() {
        userScore = 0
        totalQuestions = 8
        askQuestion()
    }
}

#Preview {
    ContentView()
}






// Practise Code

//        Button("Show alert") {
//            showingAlert = true
//        }
//        .alert("Important message here", isPresented: $showingAlert) {
//            Button("Cancel", role: .cancel) {}
//            Button("Delete", role: .destructive) {}
//        } message: {
//            Text("Please read this message carefully")
//        }



//        Button {
//            print("Edit button was tapped")
//        } label: {
//            Label("Edit", systemImage: "pencil")
//                .padding()
//                .foregroundStyle(.white)
//                .background(.red)
//        }
//
//
//        Button("Edit", systemImage: "pencil") {
//            print("Edit button was tapped")
//        }
//
//        Button {
//            print("Edit button was tapped")
//        } label: {
//            HStack {
//                Text("Edit")
//                Image(systemName: "mail.fill")
//            }
//            .font(.system(size: 30))
//
//        }


//        Image(systemName: "pencil")
//            .font(.system(size: 72))

//        Button {
//            print("Adding")
//        } label: {
//            Text("Press me!")
//                .padding()
//                .foregroundStyle(.white)
//                .background(.indigo)
//        }
//
//        VStack {
//            Button("Button 1") { }
//                .buttonStyle(.bordered)
//            Button("Button 2", role: .destructive) { }
//                .buttonStyle(.bordered)
//            Button("Button 3") { }
//                .buttonStyle(.borderedProminent)
//                .tint(.mint)
//            Button("Button 4", role: .destructive) { }
//                .buttonStyle(.borderedProminent)
//        }


//        Button("Add something", role: .cancel ,action: executeAddition)

//        Text("Your Content")
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .foregroundStyle(.white)
//            .background(.indigo.gradient)

//        AngularGradient(colors: [.red,.indigo], center: .center)

//        RadialGradient(colors: [.red, .indigo], center: .center, startRadius: 25, endRadius: 200)

//        LinearGradient(
//            stops: [Gradient.Stop(color: .red, location: 0.45), Gradient.Stop(color: .blue, location: 0.45)], startPoint: .top, endPoint: .bottom
//        )

//        ZStack {
//            VStack(spacing:0) {
//                Color.red
//                Color.indigo
//            }
//
//            Text("Your content")
//                .foregroundStyle(.secondary)
//                .padding(50)
//                .background(.ultraThinMaterial)
//        }
//        .ignoresSafeArea()

//        VStack {
//            ForEach(1..<4) {_ in
//                HStack {
//                    Rectangle()
//                        .foregroundStyle(Color.red)
//                    Rectangle()
//                        .foregroundStyle(Color.blue)
//                    Rectangle()
//                        .foregroundStyle(Color.green)
//                }
//            }
//        }
//        .frame(width: 200, height: 200)
//        .padding()
//        .background(Color.black)

//        ZStack(alignment: .leading) {
//            Text("Hello, world!")
//            Text("This is inside a stack")
//        }



//        VStack(alignment: .leading, spacing: 20) {
//            Spacer()
//            Text("This is name of a person")
//            Spacer()
//            Text("This is age of a person")
//            Spacer()
//            Text("This is height of a person")
//            Spacer()
//        }
//        .background(Color.orange)
//        .padding()
