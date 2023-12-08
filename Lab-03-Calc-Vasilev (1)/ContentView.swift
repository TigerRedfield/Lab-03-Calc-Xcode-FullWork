//
//  ContentView.swift
//  Lab-03-Calc-Vasilev
//
//  Created by user on 29.11.2023.
//  Copyright © 2023 KITMobile. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var a: String = "0"
            @State var b: String = "0"
            @State var fnc: String = ""
            
            var body: some View {
                ZStack {
                    Color("Background")
                    VStack{
                     Spacer()
                        Text(fnc.count == 0 ? a : b).font(.system(size: 80)).frame(width: UIScreen.main.bounds.width, alignment: .trailing)
                        
                        HStack(spacing: 1) {
                            Button(action:  {
                                self.a = "0"
                                self.b = "0"
                                self.fnc = ""
                                
                            })
                            {
                                ZStack{
                                Color("ButSpecial")
                                    Text("AC")
                                }
                            }
                            Button(action:  {
                                if(self.fnc != "")
                                {
                                    self.b = String(-(Float(self.b) ?? 0))
                                }
                                else {
                                    self.a = String(-(Float(self.a) ?? 0))
                                }
                            })
                            {
                                ZStack{
                                Color("ButSpecial")
                                    Image(systemName: "plusminus")
                                }
                            }
                            Button(action:  {
                                if(self.fnc != "") {
                                    self.b = String((Float(self.a) ?? 0) * (Float(self.b) ?? 0) / 100)
                                }
                                else {
                                    self.a = String((Float(self.a) ?? 0) / 100)
                                }
                 
                            })
                            {
                                ZStack{
                                Color("ButSpecial")
                                Text("%")
                                }
                            }
                            Button(action:  {
                                self.fnc = "/"
                            })
                            {
                                ZStack{
                                Color("ButAct")
                                    Image(systemName: "divide")
                                }
                            }
                        }.frame(height: UIScreen.main.bounds.width / 4)

                        HStack(spacing: 1) {
                            Button(action:  {
                                self.limitDigit("7")
                            })
                            {
                                ZStack{
                                Color("ButDigit")
                                    Text("7")
                                }
                            }
                            Button(action:  {
                                self.limitDigit("8")
                            })
                            {
                                ZStack{
                                Color("ButDigit")
                                Text("8")
                                }
                            }
                            Button(action:  {
                                self.limitDigit("9")
                                
                            })
                            {
                                ZStack{
                                Color("ButDigit")
                                Text("9")
                                }
                            }
                            Button(action:  {
                                self.fnc = "X"
                            })
                            {
                                ZStack{
                                Color("ButAct")
                                Image(systemName: "multiply")
                                }
                            }
                        }.frame(height: UIScreen.main.bounds.width / 4)

                        HStack(spacing: 1) {
                           Button(action:  {
                            self.limitDigit("4")
                            
                           })
                           {
                               ZStack{
                               Color("ButDigit")
                               Text("4")
                               }
                           }
                           Button(action:  {
                            self.limitDigit("5")
                           })
                           {
                               ZStack{
                               Color("ButDigit")
                               Text("5")
                               }
                           }
                           Button(action:  {
                            self.limitDigit("6")
                            
                           })
                           {
                               ZStack{
                               Color("ButDigit")
                               Text("6")
                               }
                           }
                           Button(action:  {
                            self.fnc = "-"
                           })
                           {
                               ZStack{
                               Color("ButAct")
                                Image(systemName:  "minus")
                               }
                           }
                       }.frame(height: UIScreen.main.bounds.width / 4)

                         HStack(spacing: 1) {
                              Button(action:  {
                                self.limitDigit("1")
                              })
                              {
                                  ZStack{
                                  Color("ButDigit")
                                  Text("1")
                                  }
                              }
                              Button(action:  {
                                self.limitDigit("2")
                                
                              })
                              {
                                  ZStack{
                                  Color("ButDigit")
                                  Text("2")
                                  }
                              }
                              Button(action:  {
                                self.limitDigit("3")

                                
                              })
                              {
                                  ZStack{
                                  Color("ButDigit")
                                  Text("3")
                                  }
                              }
                              Button(action:  {
                                self.fnc = "+"
                              })
                              {
                                  ZStack{
                                  Color("ButAct")
                                   Image(systemName:  "plus")
                                  }
                              }
                          }.frame(height: UIScreen.main.bounds.width / 4)

                 HStack(spacing: 1) {
                   
                          Button(action:  {
                            self.limitDigit("0")
                          })
                          {
                              ZStack{
                              Color("ButDigit")
                              Text("0")
                              }
                          }.frame(width: UIScreen.main.bounds.width / 2 - 0.5)
                          Button(action:  {
                            if(self.fnc.isEmpty){
                                self.limitDecimalPoint(&self.a)
                            }
                            else {
                                self.limitDecimalPoint(&self.b)
                            }
                          })
                          {
                              ZStack{
                              Color("ButDigit")
                              Text(".")
                              }
                          }
                          Button(action:  {
                            var x:Float = Float(self.a)!
                            var y:Float = Float(self.b)!
                            
                            if(self.fnc == "/")
                            {
                                if(self.a != "0" && self.b != "0")
                                {
                                self.a = String(x/y)
                                }
                                else
                                {
                                    self.a = String("Don't Null!")
                                }
                            }
                            else if(self.fnc == "X")
                            {
                                self.a = String(x*y)
                            }
                            else if(self.fnc == "-")
                            {
                                self.a = String(x-y)
                            }
                            else if (self.fnc == "+")
                            {
                                self.a = String(x+y)
                            }

                            self.b = "0"
                            self.fnc = ""
                          })
                          {
                              ZStack{
                              Color("ButAct")
                               Image(systemName:  "equal")
                              }
                          }
                 }.frame(height: UIScreen.main.bounds.width / 4)
                        }.foregroundColor(.white).font(.system(size: 25))
                }
            }
    private func limitDigit(_ digit: String){
        if(self.fnc.count == 0){
            if(self.a == "0" || self.a.count < 7) {
                self.a = self.a == "0" ? digit : self.a + digit
            }
        }
            else {
                if(self.b == "0" || self.b.count < 7) {
                    self.b = self.b == "0" ? digit : self.b + digit
                }
        }
    }
    
    private func limitDecimalPoint (_ value: inout String){
        if(!value.contains(".")){
            value += "."
        }
    }
        }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
