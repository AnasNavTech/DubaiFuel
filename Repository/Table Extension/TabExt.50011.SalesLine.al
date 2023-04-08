TableExtension 50011 tabExtSalesLine extends "Sales Line"
{
    fields
    {
        field(50000; "Close SO"; Boolean)
        {
        }
        field(50001; Cancelled; Boolean)
        {
            Description = '//GTFSDFPC1.00-Biswajit-03.05.11';
        }
        field(50020; "Customer Type"; Option)
        {
            OptionMembers = " ",Bunker,Commercial;
        }
        field(50021; "Vehicle Code"; Code[20])
        {
            Description = '//GTFSDFPC1.00-Biswajit-08.05.11';
            TableRelation = Vehicle."No.";
        }
        field(50022; "Driver No."; Code[20])
        {
            Description = '//GTFSDFPC1.00-Biswajit-08.05.11';
            TableRelation = Resource."No." where(Type = const(Person));

            trigger OnValidate()
            begin
                Resource.Get("Driver No.");
                "Driver Name" := Resource.Name;
            end;
        }
        field(50023; "Driver Name"; Text[50])
        {
            Description = '//GTFSDFPC1.00-Biswajit-08.05.11';
        }
    }
    keys
    {
        key(Key1001; "Document Type", "Bill-to Customer No.", "Shipment Date")
        {
        }
        key(Key2001; "No.", Type)
        {
        }
    }


    var
        Resource: Record Resource;
}

