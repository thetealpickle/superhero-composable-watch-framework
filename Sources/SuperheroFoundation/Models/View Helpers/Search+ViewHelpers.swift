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

extension Search {
    // MARK: - Environment
    public struct Environment {
        var request: (JSONDecoder) -> Effect<Home.APIResponse, APIError>
    }
    
    // MARK: - State
    public struct State {
        var apiResponse: Home.APIResponse?
        var viewModel: ViewModel?
    }
    
    // MARK: - View Model
    public struct ViewModel {
        var objects: [Superhero]
    }
    
    // MARK: - Static Properties
    // MARK: Reducer
    public static var reducer = Reducer<State, Action, SystemEnvironment<Search.Environment>> { (state, action, environment) in
        switch action {
            case .searchHomeTriggered, .searchFavoriteTriggered:
                return .none
        }
    }
}
