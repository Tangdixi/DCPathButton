Pod::Spec.new do |s|

  s.name         = "DCPathButton"
  s.version      = "2.0"
  s.summary      = " A beautiful button copy from Path® "

  s.description  = <<-DESC
			DCPathButton is a menu button, design by an famous App Path®.
			Since Path® 4.0, it return to use a tab bar instead of a side bar,
			and also change the menu button. So I try to implement it and then 
			the DCPathButton born :)  
                   DESC

  s.homepage     = "https://github.com/Tangdixi/DCPathButton" 

  s.license      = { 
	:type => 'MIT', 
	:text => 'The DCPathButton use the MIT license' 
  }

  s.author             = { "Tangdixi" => "Tangdixi@gmail.com" }

  s.platform     = :ios, '7.0'

  s.source       = { 
	:git => "https://github.com/Tangdixi/DCPathButton.git", 
	:tag => "v2.0"
  }

  s.source_files  = 'DCPathButton/Classes/*.{h,m}'

  s.resources  = ["DCPathButton/Sounds/*"]

  s.frameworks = 'QuartzCore','AudioToolBox'

  s.requires_arc = true

end

