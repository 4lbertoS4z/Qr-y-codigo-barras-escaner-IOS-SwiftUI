

import SwiftUI
import CodeScanner

struct QrScannView: View {
    @State var isQrCode = false
    
    var scannerSheet: some View{
        CodeScannerView(
            codeTypes:[.qr],
            completion:{ result in
                if case let .success(code) = result{
                    self.isQrCode = false
                    if let url = URL(string: code.string), UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
            }
        )
    }
    var body: some View {
        VStack {
            Text("Código barras Escaner")
                .font(.title)
            Spacer()
            Text("Escanea un Qr valido para ver su contenido:")
            Button("Escanear QR"){
                self.isQrCode = true
            }
            Spacer()
            .sheet(isPresented: $isQrCode){
                self.scannerSheet
            }
        }
    }
}

#Preview {
    QrScannView()
}
