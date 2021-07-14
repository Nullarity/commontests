// Description:
// Filters list using standard Find window
//
// Parameters:
// Where: column name. For example: Code, Description, Subject and etc.
// What: searching value. For example: 023, John and etc
// Button (default: "#FormFind"): name of button that opens Search dialog.

Click ( _.Button );
With ( "Find" );
Pick ( "#FieldSelector", _.Where );
Set ( "#CompareType", _.CompareType );
Set ( "#Pattern", _.What );
Click ( "#Find" );