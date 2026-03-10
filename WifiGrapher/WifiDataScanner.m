//
//  WifiDataScanner.m
//  WifiGrapher
//
//  Created by 岩本　翔 on 2026/03/09.
//

#import "WifiDataScanner.h"

@implementation WifiDataScanner {
    CWInterface *_interface;
}

- (instancetype)initWithInterface:(CWInterface *)interface{
    self = [super init];
    if (self){
        _interface = interface;
    }
    return self;
}

- (NSArray<NSString *> *)availableSSIDs {
    NSError *error = nil;
    NSSet<CWNetwork *> *networks = [_interface scanForNetworksWithSSID:nil error:&error];
    
    if (error || networks == nil){
       return @[];
    }

    NSMutableArray *ssids = [NSMutableArray array];
    for (CWNetwork *network in networks){
        NSString *name = network.ssid;
        if(name != nil){
            [ssids addObject:name];
        }else{
            //SSIDが取得できない場合に必要な処理
        }
    }
    return [ssids copy];
}
@end
