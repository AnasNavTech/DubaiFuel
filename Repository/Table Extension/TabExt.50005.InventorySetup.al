TableExtension 50005 TabExtInveSetup extends "Inventory Setup"
{
    fields
    {
        field(50000; "Vehicle Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
    }
}

