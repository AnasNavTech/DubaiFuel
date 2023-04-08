TableExtension 50015 TabExtSalesCommentLine extends "Sales Comment Line"
{
    fields
    {
        field(50000; "Print on Order"; Boolean)
        {
        }
    }
    keys
    {
        key(Key1001; "Document Type", "No.", "Line No.")
        {
        }
    }
}

