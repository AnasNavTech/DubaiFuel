TableExtension 50025 TabExtItemjounalbatch extends "Item Journal Batch" 
{
    fields
    {
        field(50000;"Internal Consumption";Boolean)
        {
            Description = '//GTFSDF1.00-Biswajit-02.05.11';
        }
        field(50001;"G/L Account No.";Code[10])
        {
            TableRelation = "G/L Account"."No.";
        }
    }
}

