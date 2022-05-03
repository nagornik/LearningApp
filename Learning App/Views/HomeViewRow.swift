//
//  HomeViewRow.swift
//  Learning App
//
//  Created by Anton Nagornyi on 03.05.2022.
//

import SwiftUI

struct HomeViewRow: View {
    
    var image: String
    var title: String
    var description: String
    var count: String
    var time: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
            HStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 116, height: 116)
                    .clipShape(Circle())
                Spacer()
                VStack (alignment: .leading, spacing: 10) {
                    Text(title)
                        .bold()
                    Text(description)
                        .padding(.bottom, 20)
                        .font(Font.system(size: 15))
                    HStack {
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 15)
                        Text(count)
                            .font(Font.system(size: 12))
//                        Spacer()
                        Image(systemName: "clock")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 15)
                        Text(time)
                            .font(Font.system(size: 12))
                    }
                    
                }
                Spacer()
            }
            .padding(.horizontal, 25)
        }
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRow(image: "swift", title: "Learn SwiftUI", description: "Some description", count: "20 Lessons", time: "3 Hours")
    }
}
