//
//  OffsetTab.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/02.
//

import SwiftUI

struct OffsetTab<Content: View>: UIViewRepresentable{
    
    var content: Content
    @Binding var offset: CGFloat
    
    func makeCoordinator() -> Coordinator {
        return OffsetTab.Coordinator(parent: self)
    }
    
    init(offset: Binding<CGFloat>,@ViewBuilder content: @escaping ()->Content){
        self.content = content()
        self._offset = offset
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        let scrollview = UIScrollView()
        
        let hostview = UIHostingController(rootView: content)
        hostview.view.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
        
            hostview.view.topAnchor.constraint(equalTo: scrollview.topAnchor),
            hostview.view.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor),
            hostview.view.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor),
            hostview.view.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor),
            hostview.view.heightAnchor.constraint(equalTo: scrollview.heightAnchor)
        
        ]
        
        
        scrollview.addSubview(hostview.view)
        scrollview.addConstraints(constraints)
        //Enabling paging
        scrollview.isPagingEnabled = true
        scrollview.showsVerticalScrollIndicator = false
        scrollview.showsHorizontalScrollIndicator = false
        //setting delegate
        scrollview.delegate = context.coordinator
        
        return scrollview
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        let currentOffset = uiView.contentOffset.x
        
        if currentOffset != offset{
            uiView.setContentOffset(CGPoint(x:offset,y:0), animated: true)
        }
    }
    
    class Coordinator: NSObject,UIScrollViewDelegate{
        var parent: OffsetTab
        
        init(parent:OffsetTab){
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offset = scrollView.contentOffset.x
            
            parent.offset = offset
        }
    }
}

struct OffsetTab_Previews: PreviewProvider{
    static var previews: some View{
        OnboardingView()
    }
}
