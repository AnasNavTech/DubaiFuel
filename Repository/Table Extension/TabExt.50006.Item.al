TableExtension 50006 TabExtItem extends Item
{
    fields
    {
        field(50000; "Sales Commn. Applicable"; Boolean)
        {
        }
        field(50001; "Default Inventory Location"; Code[10])
        {
            TableRelation = Location where("Use As In-Transit" = const(false));
        }
        field(50010; "QA Mandatory"; Boolean)
        {
        }
    }
}

