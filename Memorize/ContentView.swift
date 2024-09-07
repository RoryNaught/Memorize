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
	
	@State var cardCount: Int = 4
	@State var greetingText: String = "Memorize!"
	@State var theme: String = "Halloween"
	
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
			cardCountAdjusters
		}
		.padding()
	}
	
	func themeButton(themeName: String, color: Color) -> some View {
		Button(action: {
			theme = themeName
		}, label: {
			Text(themeName)
				.padding()
				.background(color.opacity(0.2))
				.cornerRadius(8)
				.foregroundColor(color)
		})
	}
	
	
	var cardCountAdjusters: some View {
		HStack {
			cardRemover
			Spacer()
			cardAdder
		}
		.imageScale(.large)
		.font(.largeTitle)
	}
	
	func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
		Button(action: {
			cardCount += offset
		}, label: {
			Image(systemName: symbol)
		})
		.disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
	}
	
	var cards: some View {
		LazyVGrid( columns: [GridItem(.adaptive(minimum: 120))] )  {
			ForEach(0..<cardCount, id: \.self) { index in
				cardView(content: emojis[index]).aspectRatio(2/3, contentMode: .fit)
			}
		}.foregroundColor(.orange)
	}
	
	var cardRemover: some View {
		return cardCountAdjuster(by: -1, symbol:"rectangle.stack.badge.minus.fill")
	}
	
	var cardAdder: some View {
		return cardCountAdjuster(by: 1, symbol:"rectangle.stack.badge.plus.fill")
	}
	
	var emojis: Array<String> {
		switch theme {
		case "People":
			return peopleEmojis
		case "Animals":
			return animalEmojis
		default:
			return halloweenEmojis
		}
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
				Text(content).font(.largeTitle)
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
