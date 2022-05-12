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

public struct BaseView: View {
    let store: Store<Base.State, Base.Action>
    
    public var body: some View {
        WithViewStore(self.store.stateless) { _ in
            GeometryReader { (container: GeometryProxy) in
                ZStack(alignment: .bottom) {
                    if #available(macOS 12.0, *) {
                        TabView {
                            HomeView(store: store.scope(state: \.home,
                                                        action: Base.Action.home))
                            .tabItem {
                                if #available(macOS 11.0, *) {
                                    Image(systemName: "house.fill")
                                } else {
                                    // Fallback on earlier versions
                                }
                            }
                            
                            if #available(macOS 11.0, *) {
#if !os(iOS)
                                Button(action: {
                                    print("search touched")
                                }) {
                                    Image(systemName: "magnifyingglass")
                                }
                                .padding(.bottom, 20.0)
#endif
                            } else {
                                // Fallback on earlier versions
                            }
                            
                            FavoriteView(store: store.scope(state: \.home,
                                                            action: Base.Action.favorite))
                            .tabItem {
                                Image(systemName: "heart.fill")
                            }
                        }
                        .accentColor(.mint)
                    } else {
                        // Fallback on earlier versions
                    }
                    
                    #if os(iOS)
                    ToolbarView(store: store.scope(state: \.home,
                                                   action: Base.Action.toolbar))
                    #endif
                }
            }
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView(store: .init(initialState: Base.State(),
                              reducer: Base.reducer,
                              environment: .prod(environment: Base.Environment())))
    }
}
