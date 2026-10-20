import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
}

struct ItemBasedAlertsView: View {
    @State private var activeAlert: AlertItem?
    @State private var activeConfirmation: AlertItem?

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Button("Show Item-based Alert") {
                    activeAlert = AlertItem(title: "Hello!", message: "This alert is triggered by an item binding.")
                }
                .buttonStyle(.borderedProminent)

                Button("Show Item-based Confirmation") {
                    activeConfirmation = AlertItem(title: "Are you sure?", message: "This is a confirmation dialog triggered by an item binding.")
                }
                .buttonStyle(.bordered)
            }
            .padding()
            .navigationTitle("Item Binding Alerts")
            .alert(item: $activeAlert) { item in
                Alert(
                    title: Text(item.title),
                    message: Text(item.message),
                    dismissButton: .default(Text("OK"))
                )
            }
            .confirmationDialog("",
                                item: $activeConfirmation) { item in
                Button("Yes, delete") {
                    print("Deleted")
                    activeConfirmation = nil
                }
                Button("Cancel", role: .cancel) {
                    activeConfirmation = nil
                }
            } message: { item in
                Text(item.message)
            }
        }
    }
}

#Preview {
    ItemBasedAlertsView()
}
