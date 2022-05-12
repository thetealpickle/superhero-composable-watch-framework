/*
 +----------------------------------------------------------------------+
 | PROJECT: SUPERHERO FOUNDATION
 +----------------------------------------------------------------------+
 | Copyright (c) 2021 THETEALPICKLE LLC.
 | All Rights Reserved.
 +----------------------------------------------------------------------+
 | Author: Jessica Joseph <jessica@thetealpickle.com>
 +----------------------------------------------------------------------+
 */

import ComposableArchitecture
import SwiftUI

public struct ToolbarView: View {
    let store: Store<Home.State, Toolbar.Action>
    
    public var body: some View {
        WithViewStore(self.store) { viewStore in
            GeometryReader { (container: GeometryProxy) in
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            print("search touched")
                        }) {
                            if #available(macOS 11.0, *) {
                                Image(systemName: "magnifyingglass")
                                    .renderingMode(.template)
                                    .padding(container.size.width * 0.05)
                                    .background(Circle()
                                        .foregroundColor(.pink))
                                    .foregroundColor(.white)
                            } else {
                                // Fallback on earlier versions
                            }
                        }
                        Button(action: {
                            viewStore.send(.addAnotherHero)
                        }){
                            if #available(macOS 11.0, *) {
                                Image(systemName: "plus")
                                    .renderingMode(.template)
                                    .padding(container.size.width * 0.05)
                                    .background(Circle()
                                        .foregroundColor(.pink))
                                    .foregroundColor(.white)
                            } else {
                                // Fallback on earlier versions
                            }
                        }
                        Spacer()
                    }
                    .padding(.bottom, container.size.height * 0.025)
                }
            }
        }
    }
}
