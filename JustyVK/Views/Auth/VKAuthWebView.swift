//
//  VKAuthWebView.swift
//  SwiftyVKTest
//
//  Created by Vladislav on 07.06.2023.
//

import Foundation
import SwiftUI
import WebKit

struct VKAuthWebView: UIViewRepresentable{
    @EnvironmentObject var userInfo: UserInfo;
    
    func makeUIView(context: Context) -> some UIView {
        let webView = WKWebView();
        webView.navigationDelegate = context.coordinator;
        
        var url = URLComponents();
        
        url.scheme = "https";
        url.host = "oauth.vk.com";
        url.path = "/authorize";
        
        url.queryItems = [
            URLQueryItem(name: "client_id", value: "2685278"),
            URLQueryItem(name: "redirect_uri", value: "http://oauth.vk.com/blank.html"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "scope", value: "[friends, messages, video, audio, stories, pages, status, wall, ads, offline, docs, groups, notifications, stats, email, phone_number]")
        ]
        
        let req = URLRequest(url: url.url!);
        webView.load(req);
        
        return webView;
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
    func makeCoordinator() -> VKDelegate {
        VKDelegate{ token in
            userInfo.token = token;
        }
    }
}

class VKDelegate: NSObject, WKNavigationDelegate{
    var token: (String) -> ()
    
    init(token: @escaping (String) -> Void){
        self.token = token;
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void){
        guard let url = navigationResponse.response.url,
                url.path == "/blank.html",
              let fragment = url.fragment()
        else{
            decisionHandler(.allow);
            return;
        }

        let params = fragment.components(separatedBy: "&")
            .map{$0.components(separatedBy: "=")}
            .reduce([String:String]()) { res, param in
                var dict = res;
                let key = param[0];
                let value = param[1];
                dict[key] = value;

                return dict;
            }

        if let accessToken = params["access_token"]{
            // TODO: Изменить этот способ сохранения токена на keychain
            UserDefaults.standard.set(accessToken, forKey: "accessToken");
            token(accessToken);
            SwiftVKSingletone.setToken(token: accessToken);
        }
        
        decisionHandler(.cancel);
    }
}
