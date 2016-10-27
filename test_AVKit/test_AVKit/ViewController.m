//
//  ViewController.m
//  test_AVKit
//
//  Created by felix on 2016/10/26.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "ViewController.h"
#import "CustomAVPlayer.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>


@interface ViewController ()<AVPlayerViewControllerDelegate>
@property (nonatomic) AVPlayerViewController *playerVC;
@property (nonatomic) AVPlayer *player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initVariables];
}

- (void)initVariables {
    _playerVC = [AVPlayerViewController new];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onAVPlayerClicked:(id)sender {
    
//    检查 对应的熟悉感
    _playerVC.delegate = self;
    self.playerVC.showsPlaybackControls = true;
    self.playerVC.videoGravity = AVLayerVideoGravityResizeAspect;
    CGRect bounds = self.playerVC.videoBounds;
    UIView *layView = self.playerVC.contentOverlayView;
//    BOOL pipFlag = self.playerVC.allowsPictureInPicturePlayback;
//    self.playerVC.updatesNowPlayingInfoCenter = true;
//    self.playerVC.allowsPictureInPicturePlayback = true;
    
    self.player = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:@"http://10.10.1.246:8000/movie/test.mp4"]];
    self.playerVC.player = self.player;
//    if (self.navigationController) {
//        [self.navigationController pushViewController:_playerVC animated:true];
//    }
//    else{
        [self presentViewController:_playerVC animated:true completion:nil];
//    }
    
//    CustomAVPlayer *cAVP = [[UIStoryboard storyboardWithName:@"AVPlayer" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([CustomAVPlayer class])];
//    [self.navigationController pushViewController:cAVP animated:true];
}


#pragma mark --- AVPlayerViewControllerDelegate
/*!
	@method		playerViewControllerWillStartPictureInPicture:
	@param		playerViewController
 The player view controller.
	@abstract	Delegate can implement this method to be notified when Picture in Picture will start.
 */
- (void)playerViewControllerWillStartPictureInPicture:(AVPlayerViewController *)playerViewController {
    NSLog(@"playerViewControllerWillStartPictureInPicture");
}

/*!
	@method		playerViewControllerDidStartPictureInPicture:
	@param		playerViewController
 The player view controller.
	@abstract	Delegate can implement this method to be notified when Picture in Picture did start.
 */
- (void)playerViewControllerDidStartPictureInPicture:(AVPlayerViewController *)playerViewController {
    NSLog(@"playerViewControllerDidStartPictureInPicture");
}

/*!
	@method		playerViewController:failedToStartPictureInPictureWithError:
	@param		playerViewController
 The player view controller.
	@param		error
 An error describing why it failed.
	@abstract	Delegate can implement this method to be notified when Picture in Picture failed to start.
 */
- (void)playerViewController:(AVPlayerViewController *)playerViewController failedToStartPictureInPictureWithError:(NSError *)error {
    NSLog(@"failedToStartPictureInPictureWithError");
}

/*!
	@method		playerViewControllerWillStopPictureInPicture:
	@param		playerViewController
 The player view controller.
	@abstract	Delegate can implement this method to be notified when Picture in Picture will stop.
 */
- (void)playerViewControllerWillStopPictureInPicture:(AVPlayerViewController *)playerViewController {
    NSLog(@"playerViewControllerWillStopPictureInPicture");

}

/*!
	@method		playerViewControllerDidStopPictureInPicture:
	@param		playerViewController
 The player view controller.
	@abstract	Delegate can implement this method to be notified when Picture in Picture did stop.
 */
- (void)playerViewControllerDidStopPictureInPicture:(AVPlayerViewController *)playerViewController{
    NSLog(@"playerViewControllerDidStopPictureInPicture");
}

/*!
	@method		playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart:
	@param		playerViewController
 The player view controller.
	@abstract	Delegate can implement this method and return NO to prevent player view controller from automatically being dismissed when Picture in Picture starts.
 */
- (BOOL)playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart:(AVPlayerViewController *)playerViewController {
    NSLog(@"playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart");
    return false;
}

/*!
	@method		playerViewController:restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:
	@param		playerViewController
 The player view controller.
	@param		completionHandler
 The completion handler the delegate needs to call after restore.
	@abstract	Delegate can implement this method to restore the user interface before Picture in Picture stops.
 */
- (void)playerViewController:(AVPlayerViewController *)playerViewController restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(void (^)(BOOL restored))completionHandler{
    NSLog(@"restoreUserInterfaceForPictureInPictureStopWithCompletionHandler");
    completionHandler(true);
}

@end


/*
存在疑问：
 pip 的功能是在支持的设备上才会支持，eg：ipad air 2
 
*/
