//
//  ContentView.swift
//  GettingStartedAsyncAwait
//
//  Created by Mohammad Azam on 7/9/21.
//

import SwiftUI

struct CurrentDate: Decodable, Identifiable {
    let id = UUID()
    let date: String
    
    private enum CodingKeys: String, CodingKey {
        case date = "date"
    }
}

struct ContentView: View {

    @State private var currentDates: [CurrentDate] = []
    
    
    
//    private func populateDate() async {
//
//        do{
//            guard let currentDate = try await getDate() else { return}
//
//            self.currentDates.append(currentDate)
//
//        } catch{
//            print (error)
//        }
//
//    }
    
    
    var body: some View {
        NavigationView {
            List(currentDates) { currentDate in
                Text(currentDate.date)
            }.listStyle(.plain)
            
            .navigationTitle("Dates")
            .navigationBarItems(trailing: Button(action: {
                // button action
                Task{
                    await populateDate()
                }
            }, label: {
                Image(systemName: "arrow.clockwise.circle")
            }))
            .task {
                await populateDate()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
