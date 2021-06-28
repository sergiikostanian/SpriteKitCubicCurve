//
//  SKAction+CustomTiming.swift
//  CubicCurveDemo
//
//  Created by Serhii Kostanian on 28.06.2021.
//

import SpriteKit

public extension SKAction {

    /// Adds a custom timing function.
    ///
    /// Use this method to setup a custom timing function that works with a cubic Bézier timing curve
    /// with control points that don't exceeds the `[0...1]` range.
    ///
    /// - Parameter timing: A cubic Bézier timing curve.
    func addCustomTiming(_ timing: TimingFunction) {
        timingFunction = { time in
            Float(timing.progress(at: CGFloat(time)))
        }
    }

    /// Creates an action that executes a block over a duration.
    ///
    /// Use this method to create a custom action that works with a cubic Bézier timing curve
    /// with control points that CAN exceeds the `[0...1]` range.
    ///
    /// - Parameters:
    ///   - start: A start value of the animation.
    ///   - end: An end value of the animation.
    ///   - timing: A cubic Bézier timing curve.
    ///   - progressBlock: The block to run. The block takes the following parameters:
    ///   - node: The node on which the action is running.
    ///   - value: The current value that has to be set.
    ///
    /// - Returns: A new action object.
    static func customAction(from start: CGFloat,
                             to end: CGFloat,
                             timing: TimingFunction,
                             _ progressBlock: @escaping (_ node: SKNode, _ value: CGFloat) -> Void) -> SKAction {
        let delta = end - start
        return SKAction.customAction(withDuration: TimeInterval(timing.duration)) { node, time in
            let progress = timing.progress(at: time / timing.duration)
            progressBlock(node, start + delta * progress)
        }
    }

    /// Creates an action that moves a node vertically with a specified timing function.
    ///
    /// Use this method to create a custom move action that works with a cubic Bézier timing curve
    /// with control points that CAN exceeds the `[0...1]` range.
    ///
    /// - Parameters:
    ///   - start: A start `Y` of the animation.
    ///   - end: An end `Y` of the animation.
    ///   - timing: A cubic Bézier timing curve.
    ///
    /// - Returns: A new action object.
    static func moveY(from start: CGFloat, to end: CGFloat, timing: TimingFunction) -> SKAction {
        return customAction(from: start, to: end, timing: timing) { node, value in
            node.position.y = value
        }
    }

    /// Creates an action that moves a node horizontaly with a specified timing function.
    ///
    /// Use this method to create a custom move action that works with a cubic Bézier timing curve
    /// with control points that CAN exceeds the `[0...1]` range.
    ///
    /// - Parameters:
    ///   - start: A start `X` of the animation.
    ///   - end: An end `X` of the animation.
    ///   - timing: A cubic Bézier timing curve.
    ///
    /// - Returns: A new action object.
    static func moveX(from start: CGFloat, to end: CGFloat, timing: TimingFunction) -> SKAction {
        return customAction(from: start, to: end, timing: timing) { node, value in
            node.position.x = value
        }
    }

    /// Creates an action that changes the x and y scale values of a node.
    ///
    /// Use this method to create a custom scale action that works with a cubic Bézier timing curve
    /// with control points that CAN exceeds the `[0...1]` range.
    ///
    /// - Parameters:
    ///   - start: A start scale of the animation.
    ///   - end: An end scale of the animation.
    ///   - timing: A cubic Bézier timing curve.
    ///
    /// - Returns: A new action object.
    static func scale(from start: CGFloat, to end: CGFloat, timing: TimingFunction) -> SKAction {
        return customAction(from: start, to: end, timing: timing) { node, value in
            node.setScale(value)
        }
    }
}
