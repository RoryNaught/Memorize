//
//  ContentView.swift
//  Memorize
//
//  Created by Rory Naughton on 8/23/24.
//

import SwiftUI

let halloweenEmojis : Array<String> = ["👹","🎃","👻","💀","👺","🕷️","🕸️","😱","🙀","☠️","🍬","😈"]
let peopleEmojis: Array<String> = ["👮‍♂️","👨‍⚕️","👨‍🍳","👨‍🌾","👨‍🏫","👨‍🏭","👨‍🔧","👨‍🔬","👩‍🚀","👩‍🎨","👨‍🚒","👨‍💻"]
let animalEmojis: Array<String> = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🐯","🦁"]

struct ContentView: View {
	
	@State var greetingText: String = "Memorize!"
	@State var theme: String = "Halloween"
	@State var shuffledEmojis: [String] = []
	
	var body: some View {
		VStack {
			Greeting(content: greetingText)
			
			// Theme Buttons
			HStack {
				themeButton(themeName: "Halloween", color: .orange)
				themeButton(themeName: "People", color: .blue)
				themeButton(themeName: "Animals", color: .green)
			}
			
			ScrollView {
				cards
			}
			
			Spacer()
		}
		.padding()
		.onAppear() {
			shuffledEmojis = createPairs(from: halloweenEmojis, pairs: 8)
		}
	}
	
	func themeButton(themeName: String, color: Color) -> some View {
			Button(action: {
				theme = themeName
				switch themeName {
				case "People":
					shuffledEmojis = createPairs(from: peopleEmojis, pairs: 9)
				case "Animals":
					shuffledEmojis = createPairs(from: animalEmojis, pairs: 10)
				default:
					shuffledEmojis = createPairs(from: halloweenEmojis, pairs: 8)
				}
			}, label: {
				Text(themeName)
					.padding()
					.background(color.opacity(0.2))
					.cornerRadius(8)
					.foregroundColor(color)
			})
		}
	
	func createPairs(from emojiArray: [String], pairs: Int) -> [String] {
		   let selectedEmojis = Array(emojiArray.prefix(pairs))
		   let pairedEmojis = selectedEmojis + selectedEmojis  // Create pairs
		   return pairedEmojis.shuffled()  // Shuffle the array to randomize the order
	}
	
	

	var cards: some View {
		LazyVGrid( columns: [GridItem(.adaptive(minimum: 120))] )  {
			ForEach(0..<shuffledEmojis.count, id: \.self) { index in
				cardView(content: shuffledEmojis[index]).aspectRatio(2/3, contentMode: .fit)
			}
		}.foregroundColor(.orange)
	}
	

	
}

struct cardView: View {
	let content: String
	@State var isFaceUp = true
	
	var body: some View {
		ZStack {
			let base = RoundedRectangle(cornerRadius:13)
			Group {
				base.foregroundColor(.white)
				base.strokeBorder(lineWidth: 2)
				Text(content).font(.system(size: 50))
			}
			.opacity(isFaceUp ? 1 : 0)
			base.fill().opacity(isFaceUp ? 0 : 1)
		}
		.onTapGesture {
			isFaceUp.toggle()
		}
	}
}

struct Greeting: View {
	let content: String
	
	var body: some View {
		
		ZStack {
					// Outline layer: Repeated Text with an offset
					Text(content)
						.font(.largeTitle)
						.fontWeight(.bold)
						.foregroundColor(.black)  // Color for the outline
						.offset(x: 1, y: 1)       // Slight offset for the outline
					Text(content)
						.font(.largeTitle)
						.fontWeight(.bold)
						.foregroundColor(.black)
						.offset(x: -1, y: -1)
					Text(content)
						.font(.largeTitle)
						.fontWeight(.bold)
						.foregroundColor(.black)
						.offset(x: 1, y: -1)
					Text(content)
						.font(.largeTitle)
						.fontWeight(.bold)
						.foregroundColor(.black)
						.offset(x: -1, y: 1)
					
					// Main Text layer: The main text with the desired color
					Text(content)
						.font(.largeTitle)
						.fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
						.foregroundColor(.orange)  // Main text color
				}
	}
}





#Preview {
    ContentView()
}
