//
//  ContentView.swift
//  Memorize
//
//  Created by Rory Naughton on 8/23/24.
//

import SwiftUI

struct ContentView: View {
	let emojis : Array<String> = ["👹","🎃","👻","💀","👺","🕷️","🕸️","😱","🙀","☠️","🍬","😈"]
	
	@State var cardCount: Int = 4
	
	var body: some View {
		VStack {
			ScrollView {
				cards
			}
			Spacer()
			cardCountAdjusters
		}
		.padding()
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








#Preview {
    ContentView()
}
