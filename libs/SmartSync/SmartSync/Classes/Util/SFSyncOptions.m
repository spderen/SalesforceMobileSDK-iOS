/*
 Copyright (c) 2014, salesforce.com, inc. All rights reserved.
 
 Redistribution and use of this software in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:
 * Redistributions of source code must retain the above copyright notice, this list of conditions
 and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list of
 conditions and the following disclaimer in the documentation and/or other materials provided
 with the distribution.
 * Neither the name of salesforce.com, inc. nor the names of its contributors may be used to
 endorse or promote products derived from this software without specific prior written
 permission of salesforce.com, inc.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
 FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY
 WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "SFSyncOptions.h"

NSString * const kSFSyncOptionsFieldlist = @"fieldlist";

@interface SFSyncOptions ()

@property (nonatomic, strong, readwrite) NSArray*  fieldlist;

// true when initiazed from empty dictionary
@property (nonatomic) BOOL isUndefined;

@end

@implementation SFSyncOptions

#pragma mark - Factory methods

+ (SFSyncOptions*) newSyncOptionsForSyncUp:(NSArray*)fieldlist {
    SFSyncOptions* syncOptions = [[SFSyncOptions alloc] init];
    syncOptions.fieldlist = fieldlist;
    syncOptions.isUndefined = NO;
    return syncOptions;
}

#pragma mark - From/to dictionary

+ (SFSyncOptions*) newFromDict:(NSDictionary*)dict {
    SFSyncOptions* syncOptions = [[SFSyncOptions alloc] init];
    
    if (syncOptions) {
        if (dict == nil || [dict count] == 0) {
            syncOptions.isUndefined = YES;
        }
        else {
            syncOptions.isUndefined = NO;
            syncOptions.fieldlist = dict[kSFSyncOptionsFieldlist];
        }
    }
    return syncOptions;
}

- (NSDictionary*) asDict {
    NSDictionary* dict = self.isUndefined ? @{} : @{ kSFSyncOptionsFieldlist: self.fieldlist };
    return dict;
}

@end
