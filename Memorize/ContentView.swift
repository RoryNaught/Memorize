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
	var isFaceUp: Bool = false
	var body: some View
	{
		ZStack
		{
			if isFaceUp
			{
				RoundedRectangle(cornerRadius:33).foregroundColor(.white)
				RoundedRectangle(cornerRadius:33).strokeBorder(lineWidth: 2)
				Text("🍊").font(.largeTitle)
			} else
			{
				RoundedRectangle(cornerRadius:12)
			}
		}
	}
}








#Preview {
    ContentView()
}
