//
//  CoreGraphics.swift
//  Catalog
//
//  Created by Barbara Personal on 2025-05-06.
//

import Combine
import CoreGraphics
import SwiftUI

@Observable
class CoreGraphicsViewModel {
    var spikes = 10
    private var maximumSpikes = 50
    private var minimumSpikes = 10

    var wavesAmplitude: CGFloat = 10.0
    private var maximumAmplitude: CGFloat = 50
    private var minimumAmplitude: CGFloat = 10

    private var cancellables = Set<AnyCancellable>()

    init() {
        self.spikes = spikes
        Timer.publish(
            every: 0.2,
            on: .main,
            in: .common
        )
        .autoconnect()
        .sink { date in
            // update spikes
            (self.spikes < self.maximumSpikes)
                ? (self.spikes += 1) : (self.spikes = self.minimumSpikes)

            (self.wavesAmplitude < self.maximumAmplitude)
                ? (self.wavesAmplitude += 3)
                : (self.wavesAmplitude = self.minimumAmplitude)
        }
        .store(in: &cancellables)
    }
}

struct CoreGraphics: View {

    private var viewModel = CoreGraphicsViewModel()

    var body: some View {
        ScrollView {
            VStack {
                starShape
                waveShape
                cloverShape
                spiralShape
                heartShape
                frameShape
            }
            .padding(.top, 30)
        }
    }

    private var heartShape: some View {
        HeartShape()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200)
            .foregroundStyle(.pink.opacity(0.4))
    }

    private var starShape: some View {
        StarburstShape(
            spikes: viewModel.spikes,
            innerRadiusRatio: 0.75 - (0.05 * CGFloat(viewModel.spikes))
        )
        .stroke(.yellow, lineWidth: 3)
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .padding()
        .background(
            VStack(spacing: 0) {
                Rectangle()
                    .foregroundStyle(.blue.secondary)
                Rectangle()
                    .foregroundStyle(.white)
                Rectangle()
                    .foregroundStyle(.blue.secondary)
            }
        )
        .border(.blue.secondary)
        .padding(.vertical, 50)
        .padding(.horizontal)
    }

    private var waveShape: some View {
        WaveShape(
            amplitude: viewModel.wavesAmplitude,
            frequency: 5
        )
        .fill(
            LinearGradient(
                gradient: Gradient(colors: [
                    .blue, .cyan, .purple, .yellow.opacity(0.5),
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .frame(height: 200)
        .padding()
    }

    private var spiralShape: some View {
        SpiralShape(turns: 8, spacing: 10)
            .stroke(.cyan, lineWidth: 2)
            .frame(width: 300, height: 300)
            .padding()
    }

    private var cloverShape: some View {
        CloverShape()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [.green, .mint]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .frame(width: 200, height: 200)
            .shadow(radius: 10)
    }

    private var frameShape: some View {
        Image("turtlerock_feature")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .overlay {
                MyFrame()
                    .stroke(
                        .linearGradient(
                            Gradient(colors: [.blue, .green, .white, .red]),
                            startPoint: .bottomTrailing,
                            endPoint: .topLeading
                        ),
                        style: StrokeStyle(
                            lineWidth: 20.0,
                            lineCap: .round,
                            lineJoin: .round
                        )
                    )
            }
            .padding()
    }
}

struct MyFrame: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))

        // add a heart
        return path
    }

}

#Preview {
    CoreGraphics()
}
