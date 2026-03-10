//
//  WifiDataScanner.h
//  WifiGrapher
//
//  Created by 岩本　翔 on 2026/03/09.
//

#import <Foundation/Foundation.h>
#import <CoreWLAN/CoreWLAN.h>

@interface WifiDataScanner : NSObject
- (instancetype)initWithInterface:(CWInterface *)interface;
- (NSArray<NSString *> *)availableSSIDs;
@end
