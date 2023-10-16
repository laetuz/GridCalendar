//
//  ContentView.swift
//  GridCalendar
//
//  Created by Ryo Martin on 16/10/23.
//

import SwiftUI

struct ContentView: View {
    let layout = [
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        ScrollView {
            ScrollView(.horizontal) {
                //Lazy Horizontal Grid implementation
                LazyHGrid(rows: layout, pinnedViews: [.sectionHeaders]){
                    ForEach(year, id: \.name){
                        month in Section(header: Text(verbatim: month.name).font(.headline)) {
                            ForEach(month.days) {
                                day in Capsule()
                                    .overlay(Text("\(day.value)").foregroundColor(.white))
                                    .foregroundColor(.blue)
                                    .frame(width: 40)
                            }
                        }
                    }
                }.padding()
            }
            Divider()
            //Lazy Vertical Grid implementation
            LazyVGrid(columns: layout, pinnedViews: [.sectionHeaders]){
                ForEach(year, id: \.name){
                    month in Section(header: Text(verbatim: month.name).font(.headline)) {
                        ForEach(month.days) {
                            day in Capsule()
                                .overlay(Text("\(day.value)").foregroundColor(.white))
                                .foregroundColor(.blue)
                                .frame(height: 40)
                        }
                    }
                }
            }.padding()
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
