//
//  RemoteImage.swift
//  BreakingBad
//
//  Created by Nick Raptis on 12/30/20.
//

import SwiftUI

struct RemoteImage: View {
    
    private enum LoadState {
        case loading, success, failure
    }

    private class Loader: ObservableObject {
        var image: UIImage?// = Data()
        var state = LoadState.loading

        init(URLString: String) {
            
            guard let url = URL(string: URLString) else {
                self.state = .failure
                self.objectWillChange.send()
                return
            }
            
            DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
                
                guard let data = try? Data(contentsOf: url) else {
                    self.state = .failure
                    self.objectWillChange.send()
                    return
                }
                
                guard let image = UIImage(data: data) else {
                    self.state = .failure
                    self.objectWillChange.send()
                    return
                }
                
                self.image = image
                
                DispatchQueue.main.async {
                    self.state = .success
                    self.objectWillChange.send()
                }
            }
        }
    }

    @StateObject private var loader: Loader
    var loading: Image
    var failure: Image

    var body: some View {
        selectImage()
            .resizable()
    }
    
    init(url: String, loading: Image = Image(systemName: "bolt.heart.fill"), failure: Image = Image("test_image")) {
        _loader = StateObject(wrappedValue: Loader(URLString: url))
        self.loading = loading
        self.failure = failure
    }

    private func selectImage() -> Image {
        switch loader.state {
        case .loading:
            return loading
        case .failure:
            return failure
        default:
            if let image = loader.image {
                return Image(uiImage: image)
            } else {
                return failure
            }
        }
    }
}
