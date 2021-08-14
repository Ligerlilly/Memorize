//
//  ContentView.swift
//  Memorize
//
//  Created by Jason Lane on 8/14/21.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["✈️","🚗","🚐","🚜","🚁","🛶","🚀","⛵️","🎠","🚠","🚑","🛸"]
    @State var emojiCount = 4
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self, content: { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    })
                }
                .foregroundColor(.red)
            }
           
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
        }
        
        .padding(.horizontal)
       
    }
    
    var add: some View {
        Button(action: {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        }, label: {
            VStack {
                Image(systemName: "plus.circle")
            }
        }).padding()
    }
    var remove: some View {
        Button(action: {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        }, label: {
            VStack {
                Image(systemName: "minus.circle")
            }
        }).padding()
    }
}

struct CardView: View {
    var content: String
   @State var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let shape =  RoundedRectangle.init(cornerRadius: 20)
            if isFaceUp {
                shape.foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.foregroundColor(.red)
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
