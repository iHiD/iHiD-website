Page.create!(name:"personal",     template:"personal")
Page.create!(name:"professional", template:"professional")

Project.create!(
  name:             "belongs_to_enum",
  descriptive_name: "Belongs To Enum - Key/value enums for Rails.",
  description:      "",
  github_url:       "http://github.com/ihid/belongs_to_enum",
  template:         "belongs_to_enum"
)

Project.create!(
  name:             "super_sti",
  descriptive_name: "Super STI - Improved single table inheritance for Rails.",
  description:      "",
  github_url:       "http://github.com/ihid/super_sti",
  template:         "super_sti"
)

Project.create!(
  name:             "Simple IOS Widgets",
  descriptive_name: "Simple Widgets for IOS",
  description:      "A library of simple, lightweight IOS widgets, which either add new views (e.g. pie charts) or new functionality to existing views (e.g. auto-scaling UIWebViews).",
  github_url:       "http://github.com/ihid/simple_ios_widgets",
  template:         "simple_ios_widgets"
)