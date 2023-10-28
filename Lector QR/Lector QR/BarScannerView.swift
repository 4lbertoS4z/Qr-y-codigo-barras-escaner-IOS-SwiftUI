import SwiftUI
import CodeScanner

struct BarScannerView: View {
    
    @State var isBarCode = false
    @State var scannedCode: String = ""
    
    var body: some View {
        
        VStack(spacing: 10) {
            Text("Código barras Escaner")
                .font(.title)
            Spacer()
            Text("Codigo escaneado: \(scannedCode)")
            Button("Escanear Codigo barras") {
                self.isBarCode = true
            }
            Spacer()
            .sheet(isPresented: $isBarCode){
                CodeScannerView(codeTypes: [.code128, .code39, .ean13], completion: { result in
                    if case let .success(code) = result {
                        self.isBarCode = false
                        self.scannedCode = code.string
                        
                    }
                })
            }
        }
        .padding()
    }
}

struct BarScannerView_Previews: PreviewProvider {
    static var previews: some View {
        BarScannerView()
    }
}
