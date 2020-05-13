//
//  DetailViewController.swift
//  AWS-Ring
//
//  Created by Pham Hoa on 2/13/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import AWSKinesis
import AWSKinesisVideoArchivedMedia
import AWSKinesisVideo

protocol DetailViewControllerDelegate {
    func detailVCWillAppear()
    func detailVCWillBePopped()
    func detailVCStopWatching()
}

class DetailViewController: BaseViewController {

    // MARK: Interface Builder Properties

    @IBOutlet weak var videoViewContainer: UIView?

    // MARK: Public Properties
    var delegate: DetailViewControllerDelegate?

    // MARK: Private Properties

    private var videoView: UIView?
    private var videoViewConstraints: [NSLayoutConstraint] = []
    private var videoViewSize = CGSize.zero

    // MARK: Init Methods & Superclass Overriders

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Camera"
        self.delegate?.detailVCWillAppear()

        self.setupRightMenu(title: "Stop")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.isMovingFromParent {
            self.delegate?.detailVCWillBePopped()
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if let videoView = self.videoView, videoView is RTCEAGLVideoView {
            self.configureVideoViewConstraints(withSize: self.videoViewSize)
        }
    }

    override func buttonRightTapped() {
        self.delegate?.detailVCStopWatching()
    }
}

// MARK: Configure Video View

extension DetailViewController {
    func configureVideoView(_ view: UIView?) {
        if self.videoView != view {
            if self.videoViewConstraints.count > 0 {
                NSLayoutConstraint.deactivate(self.videoViewConstraints)
                self.videoViewConstraints = []
            }

            self.videoView?.removeFromSuperview()
            self.videoView = nil
        }

        if let videoViewContainer = self.videoViewContainer, let videoView = view, self.videoView != videoView {
            videoViewContainer.addSubview(videoView)
            self.videoView = videoView
            self.videoView?.translatesAutoresizingMaskIntoConstraints = false

            if let streamView = videoView as? RTCEAGLVideoView {
                streamView.delegate = self
            }

            self.configureVideoViewConstraints(withSize: self.videoViewSize)
        }
    }

    private func configureVideoViewConstraints(withSize size: CGSize) {
        guard let videoViewContainer = self.videoViewContainer, let videoView = self.videoView else {
            return
        }

        if self.videoViewConstraints.count > 0 {
            NSLayoutConstraint.deactivate(self.videoViewConstraints)
            self.videoViewConstraints = []
        }

        if videoView is RTCEAGLVideoView {
            let viewSize = self.videoViewSizeToAspectFill(videoSize: size)
            self.videoViewConstraints.append(NSLayoutConstraint(item: videoView, attribute: .centerX, relatedBy: .equal, toItem: videoViewContainer, attribute: .centerX, multiplier: 1.0, constant: 0.0))
            self.videoViewConstraints.append(NSLayoutConstraint(item: videoView, attribute: .centerY, relatedBy: .equal, toItem: videoViewContainer, attribute: .centerY, multiplier: 1.0, constant: 0.0))
            self.videoViewConstraints.append(NSLayoutConstraint(item: videoView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: viewSize.width))
            self.videoViewConstraints.append(NSLayoutConstraint(item: videoView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: viewSize.height))
        } else {
            self.videoViewConstraints.append(NSLayoutConstraint(item: videoView, attribute: .left, relatedBy: .equal, toItem: videoViewContainer, attribute: .left, multiplier: 1.0, constant: 0.0))
            self.videoViewConstraints.append(NSLayoutConstraint(item: videoView, attribute: .right, relatedBy: .equal, toItem: videoViewContainer, attribute: .right, multiplier: 1.0, constant: 0.0))
            self.videoViewConstraints.append(NSLayoutConstraint(item: videoView, attribute: .top, relatedBy: .equal, toItem: videoViewContainer, attribute: .top, multiplier: 1.0, constant: 0.0))
            self.videoViewConstraints.append(NSLayoutConstraint(item: videoView, attribute: .bottom, relatedBy: .equal, toItem: videoViewContainer, attribute: .bottom, multiplier: 1.0, constant: 0.0))
        }

        NSLayoutConstraint.activate(self.videoViewConstraints)
        videoViewContainer.updateConstraints()
        videoViewContainer.layoutIfNeeded()
    }
}

// MARK: Support Methods

private extension DetailViewController {
    func videoViewSizeToAspectFill(videoSize: CGSize) -> CGSize {
        var size = CGSize(width: 500.0, height: 500.0)

        if let videoViewContainer = self.videoViewContainer {
            let side = max(videoViewContainer.bounds.size.width, videoViewContainer.bounds.size.height)
            size = CGSize(width: side, height: side)

            if videoSize.width > 0 && videoSize.height > 0 {
                if videoSize.width < videoSize.height {
                    size = CGSize(width: side, height: ceil(videoSize.height / videoSize.width * side))
                } else {
                    size = CGSize(width: ceil(videoSize.width / videoSize.height * side), height: side)
                }
            }
        }

        return size
    }
}

// MARK: RTCEAGLVideoViewDelegate

extension DetailViewController: RTCEAGLVideoViewDelegate {
    func videoView(_ videoView: RTCEAGLVideoView, didChangeVideoSize size: CGSize) {
        if self.videoView == nil || self.videoView != videoView {
            return
        }

        #if DEBUG
        print("RTCEAGLVideoView did change video size to \(size)")
        #endif

        self.videoViewSize = size
        self.configureVideoViewConstraints(withSize: self.videoViewSize)
    }
}
