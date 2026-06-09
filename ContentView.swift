import SwiftUI

struct ContentView: View {

    @StateObject private var viewModel = HuntViewModel()

    var body: some View {

        NavigationStack {

            VStack(spacing: 16) {

                // MARK: - Header Section
                VStack(spacing: 12) {

                    HStack(alignment: .center, spacing: 12) {

                        Image("cityLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 55, height: 55)

                        VStack(spacing: 2) {

                            Text("City Scavenger Hunt")
                                .font(.title)
                                .fontWeight(.bold)

                            Text("Explore • Discover • Win")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }

                        Spacer()
                    }

                    // Description
                    Text("Support local businesses, find hidden items, and win prizes!")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)

                    // Progress Counter
                    Text(viewModel.progressText)
                        .font(.headline)
                        .padding(.top, 4)
                }
                .padding(.horizontal)
                .padding(.top)

                // MARK: - Progress Bar
                ProgressView(
                    value: Double(viewModel.foundCount),
                    total: Double(viewModel.items.count)
                )
                .padding(.horizontal)

                // MARK: - Hunt Items List
                List {

                    ForEach(viewModel.items) { item in

                        NavigationLink(
                            destination: HuntDetailView(
                                item: item,
                                viewModel: viewModel
                            )
                        ) {

                            HuntCardView(item: item)
                        }
                    }
                }
                .listStyle(.plain)

                // MARK: - Submit Results Button
                Button {

                    viewModel.submitResults()

                } label: {

                    Text("Submit Results Online")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            viewModel.foundCount >= 5
                            ? Color.green
                            : Color.blue.opacity(0.6)
                        )
                        .foregroundStyle(.white)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 16)
                        )
                }
                .padding(.horizontal)
                .padding(.bottom)
                .disabled(viewModel.foundCount < 5)

            }
            .navigationBarHidden(true)

            // MARK: - Photo Alert
            .alert(
                "Photo Saved",
                isPresented: $viewModel.showCameraAlert
            ) {

                Button("OK", role: .cancel) { }

            } message: {

                Text("Picture captured successfully and item marked as found.")
            }

            // MARK: - Submission Alert
            .alert(
                "Results Submitted",
                isPresented: $viewModel.showSubmitAlert
            ) {

                Button("OK", role: .cancel) { }

            } message: {

                Text(viewModel.discountMessage)
            }
        }
    }
}

#Preview {
    ContentView()
}
