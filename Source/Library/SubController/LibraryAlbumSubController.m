/*
 Copyright (C) 2006-2008  Patrik Weiskircher
 
 This program is free software; you can redistribute it and/or
 modify it under the terms of the GNU General Public License
 as published by the Free Software Foundation; either version 2
 of the License, or (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program; if not, write to the Free Software
 Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, 
 MA 02110-1301, USA.
 */
#import "LibraryAlbumSubController.h"
#import "LibraryIdFilter.h"
#import "SQLController.h"

@implementation LibraryAlbumSubController
- (void) addRequiredFilters:(NSMutableArray *)filters {
	BOOL allAlbumsSelected = NO;
	NSArray *albums = [self getSelected:&allAlbumsSelected];
	
	if (allAlbumsSelected == NO && [albums count] > 0) {
		LibraryIdFilter *filter = [[[LibraryIdFilter alloc] initWithType:eLibraryIdFilterAlbum andIds:albums] autorelease];
		[filters addObject:filter];
	}
}

- (void) requestFilteredItems:(NSArray *)filters {
	[[self libraryDataSource] requestAlbumsWithFilters:filters];
}

- (NSString *) getDisplayTitleOfAllItem {
	return [NSString stringWithFormat:@"All (%d Album%s)", [mItems count], [mItems count] == 1 ? "" : "s"];
}

- (NSString *)liveSearchColumn {
	return @"Album";
}
@end