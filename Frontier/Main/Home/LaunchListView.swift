//
//  LaunchListView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/05.
//

import SwiftUI

struct LaunchListView: View {
    
    let launches: [Launch]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(launches) { launch in
                    NavigationLink {
                        LaunchDetailView(detailFetcher: LaunchDetailFetcher(launch: launch))
                    } label: {
                        LaunchRowView(launch: launch)
                    }
                }
            }.padding(.horizontal, 8)
        }
        .background(Color.mainBackground)
    }
}

struct LaunchListView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchListView(launches: [Launch.example(), Launch.example()])
    }
}
