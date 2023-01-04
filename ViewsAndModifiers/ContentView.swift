//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Yerdaulet Ismanaliyev on 04.01.2023.
//

import SwiftUI

struct GridStack<Content: View>: View{
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View{
        VStack{
            ForEach(0..<rows, id: \.self){rows in
                HStack{
                    ForEach(0..<columns, id: \.self){columns in
                        content(rows, columns)
                    }
                }
            }
        }
    }
}
struct Red: ViewModifier{
    func body(content: Content) -> some View{
        content
            .foregroundColor(.red)
    }
}
extension View{
    func red() -> some View{
        modifier(Red())
    }
}

struct ContentView: View {
    var body: some View {
        GridStack(rows: 3, columns: 3){rows, columns in
            Text("V \(rows), H \(columns)")
                .red()
                .padding()
                .background(.blue)
        }
        .bold()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
