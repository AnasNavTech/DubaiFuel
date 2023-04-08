TableExtension 50016 TabExtPurchaseLine extends "Purchase Line"
{
    fields
    {
        field(50145; Cancelled; Boolean)
        {
            Description = '//GTFSDFPC1.00-Biswajit-03.05.11';
        }
        field(50146; "Vehicle Code"; Code[20])
        {
            Description = '//GTFSDFPC1.00-Biswajit-08.05.11';
            TableRelation = Vehicle."No.";
        }
        field(50147; "Driver No."; Code[20])
        {
            Description = '//GTFSDFPC1.00-Biswajit-08.05.11';
            TableRelation = Resource."No." where(Type = const(Person));

            trigger OnValidate()
            begin
                Resource.Get("Driver No.");
                "Driver Name" := Resource.Name;
            end;
        }
        field(50148; "Driver Name"; Text[50])
        {
            Description = '//GTFSDFPC1.00-Biswajit-08.05.11';
        }
    }
    keys
    {
        key(Key1001; "No.", Type)
        {
        }
    }


    var
        Resource: Record Resource;
}

