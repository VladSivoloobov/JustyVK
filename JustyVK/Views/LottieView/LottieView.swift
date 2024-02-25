import Foundation
import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable{
    let animationView = LottieAnimationView();
    var filePath: String;
    var loop: Bool = false;
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView();
                
        LottieAnimation.loadedFrom(url: URL(string: filePath)!){animation in
            animationView.animation = animation;
            animationView.contentMode = .scaleAspectFit;
            animationView.loopMode = loop ? LottieLoopMode.loop : LottieLoopMode.playOnce;
            animationView.play();
            
            animationView.translatesAutoresizingMaskIntoConstraints = false;
            
            view.addSubview(animationView);
            
            NSLayoutConstraint.activate([
                animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
                animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
            ]);
        };
        
        return view;
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}
