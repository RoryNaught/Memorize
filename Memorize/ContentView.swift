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
        VStack 
        {
			Image("orange-icon")
				.resizable()
				.frame(width: 77, height: 77)
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
				.padding()
            Text("Hello, world!")
			
        }
		.font(.largeTitle)
        .padding()
		.foregroundColor(.orange)
    }
}









#Preview {
    ContentView()
}
