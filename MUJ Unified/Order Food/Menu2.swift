//
//  Menu2.swift
//  MUJ Unified
//
//  Created by Shikhar Kumar on 29/12/21.
//

import SwiftUI

struct Menu2: View {
    
    @ObservedObject var a = DataModel()
    @State var Category:String = ""
    @State var ResName:String = ""
    
    
    var body: some View {
        List(a.list3){ item in
            
            HStack{
                Text(item.id)
                Spacer()
                Button {
                    AddToCart(RName: ResName, item: item.id, amount: item.Amount)
                } label: {
                    Text("Add")
                }

            }.buttonStyle(BorderlessButtonStyle())
        }.navigationTitle(Category).onAppear {
            a.getItemData(doc1: ResName, doc2: Category)
        }.toolbar {
            NavigationLink {
                Cart(ResName:ResName)
            } label: {
                Text("Cart")
            }


        }
    }
}

struct Menu2_Previews: PreviewProvider {
    static var previews: some View {
        Menu2()
    }
}
