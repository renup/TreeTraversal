//
//  ContentView.swift
//  TreeTraversal
//
//  Created by renupunjabi on 7/19/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            ForEach(viewModel.result, id: \.self) { item in
                Text("\(item)")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
