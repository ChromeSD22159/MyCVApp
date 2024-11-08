//
//  Accordion.swift
//  Lebenslauf
//
//  Created by Frederik Kohler on 06.11.24.
//
import SwiftUI

#Preview {
    Accordion(headerText: "String", list: Repository.schoolEducation)
}

struct Accordion: View {
    let headerText: String
    let list: [CVStation]
    
    @State var isListShown: Bool = false
    
    @State var printedList: [CVStation] = []
    
    @Namespace private var namespace
    
    init(headerText: String, list: [CVStation]) {
        self.headerText = headerText
        self.list = list
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(headerText)
                    .textCase(.uppercase)
                    .font(.footnote)
                    .padding(.leading, 5)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .rotationEffect(Angle(degrees: isListShown ? 90 : 0))
                    .animation(.easeInOut, value: isListShown)
                    .onTapGesture { toggleCollapse() }
                    .padding(.trailing, 5)
            }.padding(.horizontal, 30)
            
            ForEach(printedList, id: \.title) { item in
                ZStack {
                    Station(item: item)
                        .matchedGeometryEffect(id: item.title, in: namespace)
                }
                .transition(.opacity)
                .animation(.easeInOut(duration: 0.8), value: printedList)
             
            }
            .padding(.horizontal, 30)
        }
    }
    
    private func toggleCollapse() {
        isListShown.toggle()
        if isListShown {
            printedList.removeAll() // Initialisiere die Liste immer sauber
            
            for (index, item) in list.enumerated() {
                let delay = 0.1 * Double(index) // 0.05 Sekunden Verzögerung für jedes Element
                
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    let found = printedList.contains(where: {
                        $0.title == item.title
                    })
                    
                    if !found {
                        printedList.append(item)
                    }
                }
            }
        } else {
            printedList.removeAll()
        }
    }
}
