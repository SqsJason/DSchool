//
//  api.h
//  ShipWarning
//
//  Created by sunjason on 15/5/6.
//
//

#define SERVER_TEST

#ifdef SERVER_TEST
#define RootURL @"http://120.26.126.94:80/ServiceHost/ShipMonitorService.asmx/%@"

#else
#define RootURL @"http://120.26.126.94:80/ServiceHost/ShipMonitorService.asmx/%@"

#endif

#define APIRequestTimeout 10.0


////////////////////////////////////////////////////
//Method

#define methodPost                  @"POST"
#define methodPut                   @"PUT"
#define methodDelete                @"DELETE"


////////////////////////////////////////////////////

#define preC                        @"MobileApp"
#define preCV                       @"2.4.3"


#define API_URL(api) [NSString stringWithFormat:RootURL, api]
/// API

//login
#define aLogin                      @"Login"
#define aGetOrderList               @"GetOrderList"
#define aGetCustomerList            @"GetCustomerList"
#define aGetImage                   @"GetImage"

//profile

#define aProfile                    @"profile" // POST ; profile/(id) GET,PUT,DELETE

#define aProfileImage               @"profileImage" //DELETE
#define aProfileMatches             @"profileMatches" //GET

//image
#define anImgOfPrimaryProfileImage  @"attachment"   //GET
#define createImageProfile          @"profileImage" //POST



//date idea
#define aDateIdea                   @"dateIdea" //GET,PUT,DELETE
#define aProfilePhoneNumber         @"profile/updateMobileNumber"
#define aProfileAppRating           @"profile/appReview"




//Attachment
//POST attachment/nil : "* uploading with a nil parameter will create a new file.
/////////////////////////* to replace an existing file, replace nil with the attachmentId.
/////////////////////////* server will delete the provided attachmentId before saving a new one and returning a new id"
//GET attachment/(attachmentId) : "* an attachment represents a file from S3.
///////////////////////////////////* a profile_image has a field called attachmentId"

#define aAttachment                 @"attachment"

// Conversations

#define aConversation               @"conversation/list" //method GET //(id)
#define aQuestionAnswers            @"questionCategories" //method GET //(id)
#define aLocations                  @"dateActivities" //method GET //(id)
#define aDateProposals              @"dateProposals" //method GET //(id)


//points history

#define aRecalculate                @"pointsHistory/recalculatePoints" /// GET .../(profileId)

// points Buy
#define aBuyPoints                  @"pointsHistory/buyPoints" //  POST.

//unlock view passed reasons

#define aViewedPassedReasons        @"pointsHistory/deductPoints/viewedPassedReasons" // /(profileMatchId)/(profileId)


//unlock view additional photos

#define aViewedAdditionalPhotos     @"pointsHistory/deductPoints/viewedAdditionalPhotos" // /(profileMatchId)/(profileId)

//Profile Device

#define aRegisterDevice             @"profileDevice/register"  //POST : /(profileId)/(platform)/(tokenId) * platform: iOS, Android

#define aUnregisterDevice           @"profileDevice/unregister" //POST : /(profileId)/(tokenId)

// Check if profile match is active

#define aProfileMatchIsActive       @"profileMatch/isActive" // GET : /(profileMatchId)

// Retrieve active profile

#define aActiveProfile              @"profileMatch/active"  //GET : /(profileId)

// Respond to match (like / pass)

#define aProfileMatchResponse       @"pointsHistory/deductPoints/profileMatchResponse" //POST : /(status)/(profileMatchId)/(profileId)?(param)
//"* status: liked, passed
//* if liked, param: message=XXXX
//* if passed, param: reasons=XXXX"


//Update facebook auth key

#define aUpdateThirdPartyAuthKey    @"user/updatethirdPartyAuthorizationKey"  //POST : /(token)

// Register location

#define aRegisterLocation           @"profile/registerLocation" // POST : (profileId)/(lng)/(lat)/     * pls remember the / at the end of the URL

// Group search

#define aGroupSearch                @"group/search"  // POST : /(search key)   * pls remember to URL encode the search key

// Create new group

#define aCreateNewGroup             @"group" // POST

// Propose
#define aDatePropose                @"dateProposal" //POST
#define aDateProposeFeedback        @"dateProposalFeedback" //POST
#define aDateProposeQuickFeedback   @"quickFeedback" //POST

// Delete a group

#define aDeleteGroup                @"profileGroup" // DELETE


// Try to join locked group

#define aGroupInvite                @"profileGroupInvite" // POST


//Confirm join existing group

#define aConfirmJoinGroupExisting   @"profileGroup/createAll" //POST : /(profileId)?groupIds=(groupIds)   * groupIds: a list of valid group ids that are returned from search, separated by commas

// Verigy group code

#define aVerifyCode                 @"profileGroup/verifyCode"  //POST : (groupId)/(profileId)/(code)

//confirm friend invitation

#define aConfirmFriendInvitation    @"profileFacebookFriendInvite/createAll"  // POST : (profileId)?friendThirdPartyIds=(friendThirdPartyIds)   * friendThirdPartyIds: a list of FB IDs separated by commas

#define aFAQ                  @"etc/faq"  //FAQ
#define aBlog                 @"etc/blog"  //Blog


#define kClientID        @"3VAEJNELTOKX0JF42N01JGGCXMKWV1UHLN0BQGTTHPIO35NH"  //FOURSQUARE_CLIENT_ID
#define kCLientSECRET    @"UYHAWNPBHYB0AZCMNRR3UMGAQSLXXTNMQVPVK0I102CSRCMZ"  //FOURSQUARE_CLIENT_SECRET
