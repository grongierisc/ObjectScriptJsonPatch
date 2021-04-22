Class Grongier.JSON.Bench Extends %RegisteredObject
{

/// Description
ClassMethod Test() As %Status
{
    Set sc = $$$OK
    #define posix ##class(%Library.PosixTime).CurrentTimeStamp()

    s tTest ={     "comment": "A.2.  Adding an Array Element",     "doc": {   "foo": [ "bar", "baz" ]   },     "patch": [   { "op": "add", "path": "/foo/1", "value": "qux" }   ],     "expected": {   "foo": [ "bar", "qux", "baz" ]   }   }
    s tDoc = tTest.doc
    s tPatch = tTest.patch


    set timeIn = $$$posix
    do ##class(Grongier.JSON.Utils).PatchPython(tDoc,tPatch)
    set time = $$$posix-timeIn
    zw "        PatchPython ="_time

    set timeIn = $$$posix
    do ##class(Grongier.JSON.Utils).Patch(tDoc,tPatch)
    set time = $$$posix-timeIn
    zw "        Patch ="_time

    Return sc
}

}
