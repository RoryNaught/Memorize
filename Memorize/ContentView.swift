//
//  ContentView.swift
//  Memorize
//
//  Created by Rory Naughton on 8/23/24.
//

import SwiftUI

struct ContentView: View 
{
    var body: some View 
    {
		HStack
		{
			cardView(isFaceUp: true)
			cardView()
			cardView()
			cardView()
		}
		.foregroundColor(.orange)
		.padding()
    }
}

struct cardView: View 
{
	@State var isFaceUp = false
	
	var body: some View
	{
		ZStack
		{
			let base = RoundedRectangle(cornerRadius:13)
			if isFaceUp
			{
				base.foregroundColor(.white)
				base.strokeBorder(lineWidth: 2)
				Text("🍊").font(.largeTitle)
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
