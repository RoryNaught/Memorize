//
//  ContentView.swift
//  Memorize
//
//  Created by Rory Naughton on 8/23/24.
//

import SwiftUI

let vehicleEmojis : Array<String> = ["🚗","🚕","🚙","🚌","🛻","🚚","🚛","🚜","🏎️","🚓","🚒","🚐"]
let peopleEmojis: Array<String> = ["👮‍♂️","👨‍⚕️","👨‍🍳","👨‍🌾","👨‍🏫","👨‍🏭","👨‍🔧","👨‍🔬","👩‍🚀","👩‍🎨","👨‍🚒","👨‍💻"]
let animalEmojis: Array<String> = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🐯","🦁"]

struct ContentView: View {
	
	@State var greetingText: String = "Memorize!"
	@State var theme: String = "Vehicles"
	@State var shuffledEmojis: [String] = []
	
	var body: some View {
		VStack {
			Greeting(content: greetingText).padding(1)
			
			// Theme Buttons
			HStack {
				themeButton(themeName: "Vehicles", symbolName: "truck.pickup.side.fill", color: .orange)
				themeButton(themeName: "People", symbolName: "person.3.fill", color: .blue)
				themeButton(themeName: "Animals", symbolName: "pawprint.fill", color: .green)
			}
			
			ScrollView {
				cards
			}
			
//			Spacer()
		}
		.padding(12)
		.onAppear() {
			shuffledEmojis = createPairs(from: vehicleEmojis, pairs: 8)
		}
	}
	
	func themeButton(themeName: String, symbolName: String, color: Color) -> some View {
			Button(action: {
				theme = themeName
				switch themeName {
				case "People":
					shuffledEmojis = createPairs(from: peopleEmojis, pairs: 12)
				case "Animals":
					shuffledEmojis = createPairs(from: animalEmojis, pairs: 12)
				default:
					shuffledEmojis = createPairs(from: vehicleEmojis, pairs: 12)
				}
			}, label: {
				VStack {
					Image(systemName: symbolName) // Use the SF symbol
						.font(.system(size: 27, weight: .light, design: .default))        // Adjust size of the symbol
						.foregroundColor(color)   // Symbol color
					Text(themeName)               // Text below the symbol
						.font(.caption)           // Adjust font size for the text
						.foregroundColor(color)   // Text color
				}
				.padding(7)
				.background(color.opacity(0.2))   // Background color with opacity
				.cornerRadius(6)
			})
		}
	
	func createPairs(from emojiArray: [String], pairs: Int) -> [String] {
		   let selectedEmojis = Array(emojiArray.prefix(pairs))
		   let pairedEmojis = selectedEmojis + selectedEmojis  // Create pairs
		   return pairedEmojis.shuffled()  // Shuffle the array to randomize the order
	}
	
	

	var cards: some View {
		LazyVGrid( columns: [GridItem(.adaptive(minimum: 77))] )  {
			ForEach(0..<shuffledEmojis.count, id: \.self) { index in
				cardView(content: shuffledEmojis[index]).aspectRatio(2/3, contentMode: .fit)
			}
		}.foregroundColor(.orange)
	}
	

	
}

struct cardView: View {
	let content: String
	@State var isFaceUp = false
	
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
//						.system(size: 27, weight: .light, design: .default))
						.fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
						.foregroundColor(.orange)  // Main text color
				}
	}
}





#Preview {
    ContentView()
}
