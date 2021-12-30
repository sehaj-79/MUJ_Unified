//
//  Menu.swift
//  MUJ Unified
//
//  Created by Shikhar Kumar on 29/12/21.
//

import SwiftUI

struct Menu: View {
    
    @ObservedObject var a = DataModel()
    @State var ResName : String = ""
    
    var body: some View {
        List(a.list2){ item in
            NavigationLink {
                Menu2(Category: item.id, ResName: ResName)
            } label: {
                Text(item.id)
            }
        }.navigationTitle(ResName).onAppear {
            a.getMenuData(doc: ResName)
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu(ResName: "Dialog Café")
    }
}
