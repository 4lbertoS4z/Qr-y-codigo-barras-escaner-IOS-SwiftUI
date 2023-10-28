

import SwiftUI
import CodeScanner

struct ContentView: View {
   
    var body: some View {
        TabView {
            QrScannView()
                .tabItem {
                    Label("Qr Scanner", systemImage: "qrcode.viewfinder")
                }
            
            BarScannerView()
                .tabItem {
                    Label("Bar code Scanner", systemImage: "barcode.viewfinder")
                }
        }
    }
}

#Preview {
    ContentView()
}
