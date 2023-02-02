//
//  CurrentDateListViewModel.swift
//  GettingStartedAsyncAwait
//
//  Created by u633168 on 02/02/2023.
//

import Foundation

@MainActor
class CurrentDateListViewModel : ObservableObject {
    
    @Published var currentDates: [CurrentDateViewModel] = []
    
    func populateDates() async  {
        do{
            let currentDate = try await Webservice().getDate()
            
            if let currentDate = currentDate{
                let currentDateViewModel = CurrentDateViewModel(currentDate: currentDate)
                currentDates.append(currentDateViewModel)
            }
        } catch{
            print(error)
        }
    }
}


struct CurrentDateViewModel {
    let currentDate: CurrentDate
    
    var id: UUID {
        currentDate.id
    }
    
    var date: String{
        currentDate.date
    }
}
