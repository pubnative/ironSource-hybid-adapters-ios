//
//  Copyright © 2024 PubNative. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "ISVerveCustomAdapter.h"
#import "ISVerveUtils.h"

@implementation ISVerveCustomAdapter

- (void)init:(ISAdData *)adData delegate:(id<ISNetworkInitializationDelegate>)delegate {
       if (![ISVerveUtils isAppTokenValid:adData]) {
           if (delegate && [delegate respondsToSelector:@selector(onInitDidFailWithErrorCode:errorMessage:)]) {
               [delegate onInitDidFailWithErrorCode:ISAdapterErrorMissingParams
                                       errorMessage:@"HyBid initialisation failed: Missing app token"];
           }
       } else {
           [HyBid initWithAppToken:[ISVerveUtils appToken:adData] completion:^(BOOL success) {
               if (delegate && [delegate respondsToSelector:@selector(onInitDidSucceed)]) {
                   [delegate onInitDidSucceed];
               }
           }];
       }
}

- (NSString *)networkSDKVersion {
    return @"3.1.1";
}

- (NSString *)adapterVersion {
    return @"3.1.1.0";
}

@end
