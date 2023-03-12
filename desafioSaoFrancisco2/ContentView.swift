//
//  ContentView.swift
//  desafioSaoFrancisco2
//
//  Created by Vitor Gomes on 11/03/23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Variables
    var states: [String : String] = [
        "RJ" : "Rio de Janeiro",
        "DF" : "Distrito Federal",
        "SP" : "Sao Paulo",
        "ES" : "Espirio Santo",
        "SC" : "Santa Catarina"
    ]
    
    var sectionTuple = ("ESTADOS", "BRASIL")
    
    var body: some View {
        Group {
            // MARK: States List
            List {
                Section(header: Text("\(sectionTuple.0) DO \(sectionTuple.1)")){
                    
                    // Working but not showing the right same sequence it was declared in the dictionary.
                    ForEach(states.sorted(by: >), id: \.key) { key, value in
                        Text("\(states[key]!)") // TODO: Should be changed to a safe unwrap.
                            .onDisappear() {
                                print("\(states[key]!) desapareceu da lista")
                            }
                    }
                }
            } .onAppear(){
                print("------- Estados -------")

                for acronym in states.keys {
                    print("\(acronym) - \(states["\(acronym)"]!)") // TODO: Should be changed to a safe unwrap.
                }
                
                print("-----------------------")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
