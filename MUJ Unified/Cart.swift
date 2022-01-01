//
//  Cart.swift
//  MUJ Unified
//
//  Created by Shikhar Kumar on 01/01/22.
//

import SwiftUI

struct Cart: View {
    
    @ObservedObject var a = DataModel()
    @State var ResName : String = ""
    
    var body: some View {
        List(a.listCart){ item in
            HStack {
                Text(item.id)
                Spacer()
                Button {
                    QuantityDecrease(RName: ResName, item: item.id)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                        a.getCart(RName: ResName)
                    }
                    
                } label: {
                    Text("-")
                }
                Text("\(item.Quantity)")
                Button {
                    QuantityIncrease(RName: ResName, item: item.id)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                        a.getCart(RName: ResName)
                    }
                } label: {
                    Text("+")
                }

            }.buttonStyle(BorderlessButtonStyle())
        }.navigationTitle("Cart").onAppear {
            a.getCart(RName: ResName)
        }
    }
}

struct Cart_Previews: PreviewProvider {
    static var previews: some View {
        Cart()
    }
}
