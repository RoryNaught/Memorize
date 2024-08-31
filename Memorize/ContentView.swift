//
//  ContentView.swift
//  Memorize
//
//  Created by Rory Naughton on 8/23/24.
//

import SwiftUI

struct ContentView: View 
{
	let emojis : Array<String> = ["👹","🎃","👻","💀","🎃"]
	
    var body: some View
    {
		HStack
		{
			ForEach(emojis.indices, id: \.self) { index in
				cardView(content: emojis[index])
			}
		}
		.foregroundColor(.orange)
		.padding()
    }
}

struct cardView: View 
{
	let content: String
	@State var isFaceUp = true
	
	var body: some View
	{
		ZStack
		{
			let base = RoundedRectangle(cornerRadius:13)
			if isFaceUp
			{
				base.foregroundColor(.white)
				base.strokeBorder(lineWidth: 2)
				Text(content).font(.largeTitle)
			} else
			{
				RoundedRectangle(cornerRadius:13)
			}
		}
		.onTapGesture
		{
			isFaceUp.toggle()
		}
	}
}








#Preview {
    ContentView()
}
