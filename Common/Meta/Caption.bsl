caption = _.ExtendedListPresentation;
if ( caption = "" ) then
	caption = _.ListPresentation;
	if ( caption = "" ) then
		caption = _.Synonym;
	endif;
endif;
return caption;