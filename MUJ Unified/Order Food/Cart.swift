//
//  Cart.swift
//  MUJ Unified
//
//  Created by Shikhar Kumar on 01/01/22.
//

import SwiftUI

public var showAlertGlobal : Bool = false
public var billAmount : Int = 0

struct Cart: View {
    
    @ObservedObject var a = DataModel()
    @State var ResName : String = ""
    @State var showAlert : Bool = false
    @State var showOrderPlaced : Bool = false
    @State var showPlaceOrder : Bool = false
    @State var ItemRemove : String = ""
    
    var body: some View {
        List(a.listCart){ item in
            HStack {
                Text(item.id)
                Spacer()
                Button {
                    QuantityDecrease(RName: ResName, item: item.id)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                        a.getCart(RName: ResName)
                        if showAlertGlobal==true{
                            ItemRemove = item.id
                            self.showAlert = true
                        }
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
                
            }.alert("Alert", isPresented: $showAlert) {
                Button("Remove",role: .destructive){ QuantityRemove(RName: ResName, item: ItemRemove)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                        a.getCart(RName: ResName)
                    }
                }
                Button("No",role: .cancel){
                    showAlertGlobal = false
                }
            } message: {
                Text("Do You want to Remove \(ItemRemove) ?")
                
            }.alert("Place Order",isPresented: $showPlaceOrder){
                Button("Cancel",role: .cancel){}
                Button("Order"){
                    PlaceOrder(RName: ResName)
                    showOrderPlaced = true
                }
            } message: {
                Text("Bill Amount is ₹\(billAmount)")
            }.alert("Order Placed",isPresented: $showOrderPlaced){
                Button("OK"){}
            } message: {
                Text("Order will be delivered shortly")
            }.buttonStyle(BorderlessButtonStyle()).toolbar {
                Button {
                    CalcBill(RName: ResName)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                        showPlaceOrder = true
                    }
                } label: {
                    Text("Order")
                }
                
            }
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
