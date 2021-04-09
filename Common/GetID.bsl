StandardProcessing = false;

value = Int ( ( CurrentUniversalDateInMilliseconds () / 1000 ) % 1000000000 );
return Conversion.DecToHex ( value );
