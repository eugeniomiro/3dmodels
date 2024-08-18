/*
 * Customizable Fan Cover - https://www.thingiverse.com/thing:4837562
 * remixed by OutwardB - https://www.thingiverse.com/outwardb/about
 * original by Dennis Hofmann - https://www.thingiverse.com/mightynozzle/about
 * created 2018-02-22/2021-04-20
 * updated 2021-05-04
 * version v2.8.9
 *
 * Changelog
 * --------------
 * V2.9
 *      - Added 'centre_item_enabled' value for patterns (replaces text_replace_centre value)
 *      - Added Patterns
 *          --Half-Rings
 *          --CrossHex
 *          --CrossTri
 *          --Cross-Rings
 *          --Cross-Circles
 *
 * V2.8.9
 *      - Added Rounded Brick pattern
 *      - Fixes for multi-color export
 *
 * V2.8.8
 *      - Mutli-Color export options. If using a flat grill, easily add extra height to the text or SVG objects for change-at-layer-height multi-color printing
 *      - Small fix for camera options if using OpenSCAD to customize
 *      - Updated Brick pattern to give more control whilst using number_of_support_lines
 * 
 * V2.8.7
 *      - Added brick wall pattern
 *
 * V2.8.6
 *      - Text/SVG no longer rotates for flat frame type
 *
 * V2.8.5
 *      - Split up custom height and custom fan size settings so height can easily be changed whilst using preset values
 *      - More options for exporting SVG/text to print multi-color
 *
 * V2.8.4
 *      - Script now works in Thingiverse customizer. Added some stuff to make customization easier
 *      - Even more fixes and optimization
 *
 * V2.8.3
 *      - More multi-color testing
 *      - Fixed SVG import - I broke it in the last update :(
 *
 * V2.8.2
 *      - More script fixes and optimization
 *      - Re-worked preset values
 *
 * V2.8.1
 *      - Added Screw Count option. Can now select 2 or 4 holes/tabs
 *
 * V2.8
 *      - Re-arranged a load of values/settings to make customization easier (hopefully?)
 *      - Re-worked circular frame so that the screw mount now respect the min-border value! Looks much better for larger frame sizes IMO.
 *      - Fixed an issue with the domed grill so the grill should now be level with the outer cover
 *      - Reduced frame space now uses preset cover heights rather than a static value
 *      - Started playing with multi-colored text options. You can now export text on it's own
 *
 * V2.7.4
 *      - Re-worked 'none' pattern so SVGs/Text can now be used without a pattern
 *
 * V2.7.3
 *      - New frame option - reduced frame space
 *
 * V2.7.2
 *      - SVG Import is done
 *
 * V2.7.1
 *      - More text options, you can now have multiple lines of text
 *      - Frame space value (for flat grill)
 *
 * V2.7
 *      - Massive text overhaul
 *      - Outlined text is now much faster  to render
 *      - Dome twist option now works with text
 *      - More script optimization
 *
 * V2.6.7
 *      - Text transform tools. Move and rotate text
 *
 * V2.6.6
 *      - Added patterns - bahtinov01, windmill
 *      - Line Pattern now uses Number Of Support Lines value
 *      - Re-worked Square patern
 *      - Optimized a few patterns
 *      - Fixed an issue with the dot pattern
 *
 * V2.6.5
 *      - Fixed an small issue with text when using projection/dome settings
 *
 * V2.6.4
 *      - Spiral2 pattern, fixed a small issue with circular frame
 *
 * V2.6.3:
 *      - Carey pattern
 *      - Fixed cross pattern (now 45 deg and 0 support lines is an option)
 *
 * V2.6.2:
 *      - Cross pattern
 *
 * V2.6.1:
 *      - Bahtinov Pattern
 *      - More optimization and fixes
 *
 * V2.6:
 *      - SVG Import Preview
 *      - Added blank pattern good for logo cut outs
 *      - Preview now rotates if text is on the bottom
 *      - More Optimization & a bug fix (Fixed small gap in domed grills)
 *      - Started to properly label script - anyone wanting to learn from this should now have a much easier time of it
 *
 * V2.5.3:
 *      - More text options! Set text_thickness to 0 for a block item (useful for logos).
 * 
 * V2.5.2:
 *      - Bio-Hazard Pattern
 *      - More optimization and bug fixes
 * 
 * V2.5.1:
 *      - Re-arranged some values to make customization easier
 *      - Optimization and bug fixes
 *
 * V2.5:
 *      - Added a protector feature for circular & full frame types (W.I.P)
 *
 * V2.4.6:
 *      - Added Spiral Pattern. 
 *
 * V2.4.5:
 *      - Added Atom Pattern. 
 *
 * V2.4.4:
 *      - Added Tear Drop Pattern. 
 *      - Teardrop & aperture patterns have an option to remove the centre item if using text
 *
 * V2.4.3:
 *      - Added custom cover height presets for domed options
 *
 * V2.4.2:
 *      - Updated text - it now is generated upside down when using a flat grill
 *
 * V2.4.1:
 *      - Fized patterns - fancy, fancy1, fancy2
 *
 * V2.4:
 *      - Added patterns - web, fancy, fancy1, fancy2 based on upload by Sislar (https://www.thingiverse.com/sislar/about)
 *
 * V2.3:
 *      - Merged projection by agnoia (https://www.thingiverse.com/agnoia/about)
 * 
 * V2.2:
 *      - Merged text generator by elopus001 (https://www.thingiverse.com/elopus001/about)
 * 
 * V2.1:
 *      - Merged patterns - random, zigzag & none by agnoia (https://www.thingiverse.com/agnoia/about)
 *      - Added patterns - trihole, pentagon
 * 
 * V2:
 *      - Added circular style frame option
 * --------------
 *
 * This work is licensed under the Creative Commons - Attribution - Non-Commercial - ShareAlike license.
 * https://creativecommons.org/licenses/by-nc-sa/3.0/
 */


 // Parameter Section //
//-------------------//

/* [General] */
// How are you customizing this thing? This will set the default font and camera options
What_app_are_you_using = "Thingiverse Customizer"; //[Thingiverse Customizer,OpenSCAD]


/* [Frame] */
// Choose between presets of known and common fan sizes
fan_preset = "40"; //[25:25mm,30:30mm,40:40mm,50:50mm,60:60mm,70:70mm,80:80mm,92:92mm,120:120mm,140:140mm]

// Select a frame style
frame_option = "circular"; //[full,reduced,circular]

// Select a frame type (Reduced frame style will not work with the Domed options!)
frame_type = "reduced"; //[flat,bladeSpace,reducedSpace,domedFull,domed,domedTwist]

// How many Screw Tabs/Holes
screw_count = 4; //[2,4]

// If you need countersunk holes, you can activate it here
screw_hole_chamfer = "no"; //[no,top,bottom,top_and_bottom]

// Minimum Outer Border Size. I recommend to use two/four/six... times of your line width setting of your slicer. Simplify3D uses 0.48mm line width by default if you are using a 0.4mm nozzle. Cura uses 0.4mm line width
min_border_size_in_millimeter = 2; //[0.1:0.1:15]


/* [Pattern] */
// Choose between a grill pattern
grill_pattern = "windmill"; //[aperture,atom,bahtinov,bahtinov01,bio,brick,brick-rounded,carey,cross,crosshair,crosshex,crosstri,cross-rings,dot,fancy,fancy1,fancy2,grid,half-rings,honeycomb,line,pentagon,random,spiral,square,teardrop,triangle,trihole,web,windmill,zigzag,blank,none,svg]

// Only for some patterns, spiral, teardrop, crossheirs/hex/tri patterns - no will remove the centre item
centre_item_enabled = "no"; //[yes,no]

// Set the angle of the pattern around the center of the cover
grill_pattern_rotation = 0; //[0:5:360]

// Size of the pattern lines. I recommend to use two/four/six... times of your line width setting of your slicer. Simplify3D uses 0.48mm line width by default if you are using a 0.4mm nozzle. Cura uses 0.4mm line width.
line_size_in_millimter = 0.8; //[0.3:0.02:4]

// Space between two lines of your pattern. If you choose aperture pattern, this value set the size of the center octagon.
line_space_in_millimeter = 2; //[1:0.1:50]

// number of straight lines supporting some patterns (e.g. spiral, crosshair, square, etc ).
number_of_support_lines = 6;  //[0:1:36]


/* [Text] */
// Text to add into the grill. Pro-Tip: You can use logo-fonts to add a logo!
grill_text = "";

// Second line - leave empty if un-needed
grill_text_02 = "";

// Font for the grill text. (Be careful not to create an un-printable file!)
grill_text_font = "";

// Font size of the grill text.
grill_text_size = 8; //[0.5:0.5:100]

// Thickness of text outline, set to 0 for a block item, 1 or more for an outline
text_thickness = 0.5; //[0:0.1:10]

/* [Text - Advanced Settings] */

// Move text left/right
grill_text_x_nudge = 0;

// Move text up/down
grill_text_y_nudge = 0;

// Rotate text (Inverted if using a flat grill)
grill_text_rotate = 0; //[-180:0.1:180]

// Extra space between text line 1 & 2
grill_text_space = 1; //[0:0.1:50]


/* [Import SVG] */
// Set to yes to enable (Must be using OpenSCAD, will not work in Thingiverse customizer!)
svg_import_enabled = "no"; //[yes,no]

// Select the file to import (must be a SVG | set pattern type to svg to use as a cut out. E.G. C:\TempFolder\File.SVG)
file_to_import = "";

// Scale the SVG
file_scale = 0.2; //[0.001:0.001:50]

// Thickness of SVG outline, set to 0 for a block item, 1 or more for an outline
svg_thickness = 0; //[0:0.1:10]

// Move SVG left/right
svg_x_nudge = 0;

// Move SVG up/down
svg_y_nudge = 0;

// Rotate SVG
svg_rotate = 0; //[-180:0.1:180]


/* [MultiColor Text/SVG] */
// Only works with a flat frame types!
multicolor_objects = "no"; //[yes,no]

// Extra height of the text/svg (use a multiple of the layer height you plan to print at)
other_items_export_height = 0.4; //[0:0.1:5]

/* [Advanced | MultiColor Text/SVG] */
// "Layer Height" will add extra height to the objects | "Bottom Layer" will allow you to export the text seperately and print the text flush with the grill - This only works if the thickness of the objects is more than zero
multicolor_type = "layer height"; //["layer height","bottom layer"]

// 
Read_This = "The Rest are only required if using Bottom_Layer multicolor type";

// Set to other to export the text/svg without the frame 
part_to_export = "frame"; //[frame,other]

// Only required if using "bottom layer" type | This will offset the export/text smalled to allow for tolerance
other_items_offset_value = 0; //[-0:0.1:1]

// Only required if using "bottom layer" type | If set to yes, a skirt will be exported
multicolor_export_skirt = "yes"; //[yes,no]

// Only required if using "bottom layer" type | Use the layer height setting you'll be slicing with
skirt_height = 0.2; //[-0:0.1:50]

// Only required if using "bottom layer" type | Use your line width setting of your slicer. Simplify3D uses 0.48mm line width by default if you are using a 0.4mm nozzle. Cura uses 0.4mm line width
skirt_width = 0.4; //[-0:0.1:50]



/* [Ring Protector] */
// Height of protector (0 to disable) Currently only works with basic flat grills
protector_height = 0;

// Width of protector, careful not to cover the screw holes!
protector_width = 2;


/* [Advanced | Frame Setting ] */
// Activate or deactivate rounded corners. The radius will be automatically calculated (only for full & reduced frames)
rounded_corners = "yes"; //[yes,no]

// Change thickness of mounting tabs (Only for circluar frame)
screw_tab_buffer = 0; //[-10:0.1:50]

// Change height of mounting tabs (Only for reduced_space frame type)
frame_space_mm = 0; //[-10:0.1:50]


/* [Advanced | Custom Height Settings ] */
// Select to enable the custom frame & grill height values (Only working with Flat frame styles!)
enable_custom_height = "no"; //[yes,no]

// Height of the outer frame
cover_height_in_millimeter = 3;

// Height of the grill
grill_pattern_height_in_millimeter = 1;


/* [Advanced | Custom Fan Size] */
// Select  to enable the custom frame sizes
custom_fan_size_enable = "no"; //[yes,no]

// Cover size. E.g. 80 for a 80mm Fan 
cover_size_in_millimeter = 40;

// E.g. 2.9 for M2.5, 3.3 for M3, 4.4 for M4
screw_hole_diameter_in_millimeter = 3.3;

// 25mm fan: 20 | 30mm fan: 24 | 40mm fan: 32 | 50mm fan: 40 | 60mm fan: 50 | 70mm fan: 61.5 | 80mm fan: 71.5 | 92mm fan: 82.5 | 120mm fan: 105 | 140mm fan: 126 
screw_hole_distance_in_millimeter = 32;


/* [Advanced | Dome Settings] */
To_Enable_These_Options_ = "select domedTwist frame type";

// Scale of projection (default setting is 1.5)
projection_scale = 1.5;

// Twist of projection, set this and Twist (default setting is 25)
projection_twist = 25;

// Slices of projection (default setting is 20)
projection_slices = 20;



/* [Hidden] */

// Use a comment to set preview value for Thinigiverse Customizer
// preview[view:south, tilt:top diagonal]

/// Set default text fonts based on Program Used value
grill_text_font_val = grill_text_font == "" ? What_app_are_you_using == "Thingiverse Customizer" ? "Allerta Stencil" : "Stencil" : grill_text_font;

/// Convert values to shorter lengths for easier coding
min_border_size = min_border_size_in_millimeter;
line_size = line_size_in_millimter;
line_space = line_space_in_millimeter;

/// Projection Settings
projection = frame_option != "reduced" && (frame_type == "domed" || frame_type == "domedTwist" || frame_type == "domedFull") ? "yes" : "no";
projection_type = frame_type == "domedTwist" || frame_type == "domedFull" ? "full" : "reduced";
projection_twist_enable = frame_type == "domedTwist" ? "yes" : "no";

/// Projection Values
projection_scale_val = (projection_twist_enable == "yes") ? projection_scale : 1;
projection_twist_val = (projection_twist_enable == "yes") ? projection_twist : 0;
projection_slices_val = (projection_twist_enable == "yes") ? projection_slices : 1;

/// Rotation angle for screw holes/tabs
screw_count_rotate = 360 / screw_count;

/// Preset Fan Cover Sizes
/// [ COVER SIZE | SCREW HOLE DIA | SCREW HOLE DISTANCE | COVER HEIGHT | GRILL HEIGHT ]
set_25  = [25,  2.9, 20,   2,   1];
set_30  = [30,  3.3, 24,   2.5, 1.1];
set_40  = [40,  3.3, 32,   2.7, 1.2];
set_50  = [50,  4.4, 40,   2.9, 1.3];
set_60  = [60,  4.4, 50,   3,   1.3];
set_70  = [70,  4.4, 61.5, 3,   1.4];
set_80  = [80,  4.4, 71.5, 3.2, 1.5];
set_92  = [92,  4.4, 82.5, 3.5, 1.6];
set_120 = [120, 4.4, 105,  4,   1.8];
set_140 = [140, 4.4, 126,  4.5, 2];
set_custom = [cover_size_in_millimeter, screw_hole_diameter_in_millimeter, screw_hole_distance_in_millimeter, cover_height_in_millimeter, grill_pattern_height_in_millimeter];


 // Program Section //
//-----------------//
/// Get value set based on fan_preset value
value_set = custom_fan_size_enable == "yes" ? set_custom :    fan_preset == "25" ? set_25 :    fan_preset == "30" ? set_30 :    fan_preset == "40" ? set_40 :    fan_preset == "50" ? set_50 :    fan_preset == "60" ? set_60 :  fan_preset == "70" ? set_70 :    fan_preset == "80" ? set_80 :    fan_preset == "92" ? set_92 :    fan_preset == "120" ? set_120 :    fan_preset == "140" ? set_140 : set_custom;

/// Set Sizes Based on set values
cover_size = value_set[0];
screw_hole_dia = value_set[1];
screw_hole_distance = value_set[2];
cover_h = enable_custom_height == "yes" ? cover_height_in_millimeter : (protector_height != 0) || (frame_type != "bladeSpace") ? value_set[4] : value_set[3];  // If no space between grill and blades, set cover height to grill height value
grill_pattern_h = enable_custom_height == "yes" ? grill_pattern_height_in_millimeter : value_set[4];



/// Set corner size, corner radius & screw posistion varibles
corner_size = cover_size - screw_hole_distance;
corner_r = rounded_corners == "yes" ? corner_size / 2 : 0;
screw_pos = (cover_size - corner_size) / 2;
screw_hole_length = sqrt(((exp(ln(screw_pos)*2)))+((exp(ln(screw_pos)*2))));

/// Make the cover - Rotate preview if text is on the bottom
color("DodgerBlue") if((What_app_are_you_using == "OpenSCAD" && ($preview == true)) && (((grill_text != "") || ( svg_import_enabled == "yes" )) && ((frame_type == "bladeSpace" || frame_type == "reducedSpace")))){ 
    rotate([0,180,0]) fan_cover();
} else {
    fan_cover();
}


 // Module Section //
//----------------//

/// Create the full cover
module fan_cover() {
    frame_space_mm_val = frame_type != "reducedSpace" ? 0 : frame_space_mm;
    if(part_to_export == "frame"){
        /// FRAME
        difference(){
            union() {
                fan_cover_frame();
                /// GRILL
                fan_cover_grill();

                /// PROTECTOR
                if((frame_option != "reduced") && (protector_height != 0)){
                    protector();
                }
            }
            /// SCREW HOLES
            screw_holes(cover_size, screw_hole_dia, screw_hole_distance, cover_h + frame_space_mm_val + 0.001);
        }
        if((multicolor_objects == "yes")) {
            if(multicolor_type == "bottom layer"){
                linear_extrude(height = grill_pattern_h-other_items_export_height, convexity = 20){
                        grill_text();
                        if(svg_import_enabled == "yes") { grill_svg(); }
                };
            } else {
                // Change at Layer Height
                translate([0,0,grill_pattern_h]) {
                    linear_extrude(height = other_items_export_height, convexity = 20){
                            grill_text(text_thickness);
                            if(svg_import_enabled == "yes") { grill_svg(svg_thickness); }
                    }
                }
                
            } 
        }
    } else {
        /// Testing Multi-color text
        if(multicolor_export_skirt == "yes"){
            linear_extrude(height = skirt_height) translate([-cover_size,0]) ring(cover_size, skirt_width);
        } 
        linear_extrude(height = other_items_export_height){
            offset(r = -other_items_offset_value) {
                grill_text();
                if(svg_import_enabled == "yes") { grill_svg(); }
            }
        }
    }
}


/// Screw hole
module screw_hole(cover_h, screw_hole_dia) {
    cylinder(h = cover_h + 4 + 0.001, d = screw_hole_dia, $fn = 16);
    if(screw_hole_chamfer == "bottom" || screw_hole_chamfer == "top_and_bottom") {
        translate([0, 0, 2.9 - screw_hole_dia]) {
            cylinder(h = screw_hole_dia, d1 = screw_hole_dia * 4, d2 = screw_hole_dia);
        }
    }
    if(screw_hole_chamfer == "top" || screw_hole_chamfer == "top_and_bottom") {
        translate([0, 0, cover_h + screw_hole_dia/4]) {
            cylinder(h = screw_hole_dia, d2 = screw_hole_dia * 4, d1 = screw_hole_dia);
        }
    }
}

/// Screw holes
module screw_holes(cover_size, screw_hole_dia, screw_hole_distance, cover_h){
    corner_size = cover_size - screw_hole_distance;
    corner_r = rounded_corners == "yes" ? corner_size / 2 : 0;
    screw_pos = (cover_size - corner_size) / 2;
    screw_hole_length = sqrt(((exp(ln(screw_pos)*2)))+((exp(ln(screw_pos)*2))));
    for(rot=[45:screw_count_rotate:315]){
        rotate(rot){
            translate([screw_hole_length,0,-2]){
                if((frame_type == "reducedSpace") && (projection == "no")) {
                    screw_hole(value_set[3]-grill_pattern_h+frame_space_mm, screw_hole_dia);
                } else {
                    screw_hole(cover_h, screw_hole_dia);
                }
            }
        }
    }
}

/// Frame
module fan_cover_frame() {
    /// START OF FRAME
    union() {
        linear_extrude(height = cover_h, convexity = 20) {
            
            /// difference between outside/inside of frame
            difference() {
                offset(r=corner_r, $fn = ceil(corner_r * 8)) {
                    offset(r=-corner_r) {
                        // if circular frame
                        if(frame_option == "circular") {
                            /// Draw outer circle
                            circle(d = cover_size , $fn = cover_size*2);
                        /// if not circular frame
                        } else {
                            /// Draw outer square (full & reduced frames)
                            square([cover_size, cover_size], center = true);
                            ///

                        }

                    }
                }
                
                /// Inner Square (reduced)
                if(frame_option == "reduced") {
                    offset(r=corner_r, $fn = ceil(corner_r * 8)) {
                        offset(r=-corner_r) {
                            square([cover_size - min_border_size*2, cover_size - min_border_size*2], center = true);
                        }
                    }
                }
                
                /// Inner Circle (full and circular)
                if((frame_option == "circular") || (frame_option == "full")) {
                    circle(d = cover_size - min_border_size * 2 -0.1, $fn = cover_size*2);
                }
            } /// END OF DIFFERENCE


            /// If reduced frame, create the circles around the screw holes
            if(frame_option == "reduced") {
                for(rot=[45:screw_count_rotate:315]){
                    rotate(rot){
                        translate([screw_hole_length,0,0]){
                            circle(d = corner_size, $fn = ceil(corner_r * 8));
                        }
                    }
                }
            }



            /// If circular frame, create the screw tabs
            /// If circular frame, create the screw tabs
            if(frame_option == "circular") {
                
                /// Create the screw tab circles
                for(rot=[45:screw_count_rotate:315]){
                    rotate(rot){
                        translate([screw_hole_length,0,0]){
                            circle(d = screw_hole_dia+(min_border_size*2)+screw_tab_buffer, $fn = ceil(corner_r * 8));
                        }
                    }
                }
                
                // Use pythagoras to work out the distance between the inside circle, and the middle of the screw holes
                screw_tab_length = screw_hole_length-(cover_size/2);
                
                // Create the screw tab squares
                for(rot=[45:screw_count_rotate:315]){
                    rotate(rot){
                        translate([cover_size/2+screw_tab_length/2-min_border_size/2,0,0]){
                            square(size = [screw_tab_length+min_border_size,screw_hole_dia+(min_border_size*2)+screw_tab_buffer], center = true);
                        }
                    }
                }
                                
            }
            
            
            
        }
        
        /// If using reduced frame SPACE, add the extra height to the screw mount
        if((frame_type == "reducedSpace") && (projection == "no")) {
            translate([0,0,grill_pattern_h])
            linear_extrude(height = value_set[3]-grill_pattern_h+frame_space_mm, convexity = 20) {
                for(rot=[45:screw_count_rotate:315]){
                    rotate(rot){
                        translate([screw_hole_length,0,-2]){
                            if(frame_option == "circular") {
                                circle(d = screw_hole_dia+(min_border_size*2)+screw_tab_buffer, $fn = ceil(corner_r * 8));
                            } else {
                                circle(d = corner_size, $fn = ceil(corner_r * 8));
                            }
                        }
                    }
                } 
            }
        }
    }
}

/// Protector
module protector(){
    translate([0,0,cover_h]){
        linear_extrude(height = protector_height, convexity = 20) {
            difference() {
                circle(d = cover_size - min_border_size * 2 + protector_width, $fn = cover_size * 2);
                circle(d = cover_size - min_border_size * 2 -1, $fn = cover_size * 2);
            }
        }
    }
}

/// Select Pattern
module pattern_select(){
    rotate(grill_pattern_rotation) {

        if(grill_pattern == "honeycomb") {
            honeycomb_pattern(cover_size, line_size, line_space);
        }

        if(grill_pattern == "grid") {
            grid_pattern(cover_size, line_size, line_space);
        }

        if(grill_pattern == "line") {
            translate([-cover_size/2,0,0]) line_pattern(line_size,line_space,cover_size);
        }

        if(grill_pattern == "triangle") {
            triangle_pattern(cover_size, line_size, line_space);
        }

        if(grill_pattern == "crosshair") {
            crosshair_pattern(cover_size, line_size, line_space);
        }

        if(grill_pattern == "square") {
            square_pattern(line_size, line_space, cover_size*2);
        }

        if(grill_pattern == "dot") {
            dot_pattern(cover_size, line_size, line_space);
        }

        if(grill_pattern == "aperture") {
            aperture_pattern(cover_size, line_size, line_space);
        }

        if(grill_pattern == "random") {
            random_pattern(cover_size, line_size, line_space);
        }
        
        if(grill_pattern == "zigzag") {
            shape_pattern(cover_size, line_size, line_space,4);
        }      

        if(grill_pattern == "trihole") {
            shape_pattern(cover_size, line_size, line_space,3);
        }      
        
        if(grill_pattern == "pentagon") {
            shape_pattern(cover_size, line_size, line_space,5);
        }

        if(grill_pattern == "web") {
            spider_web(line_space,cover_size,line_size,number_of_support_lines);
        }

        if(grill_pattern == "fancy1") {
            circle_lattice(cover_size, line_size, line_space, 4);
        }
        
        if(grill_pattern == "fancy2") {
            circle_lattice(cover_size, line_size, line_space, 8);
        }
        
        if(grill_pattern == "fancy") {
            circle_lattice(cover_size, line_size, line_space, 40);
        }

        if(grill_pattern == "teardrop"){
            rotate(45){tear_drop_pattern(cover_size, line_size, line_space/2);}
        }
        
        if(grill_pattern == "atom") {
            atom(cover_size, line_size, number_of_support_lines);
        }

        if(grill_pattern == "spiral"){
            spiral(cover_size, line_size);
        }

        if(grill_pattern == "bio"){
            if(frame_option == "reduced") {} else {
                bio_hazard_pattern(cover_size-(min_border_size_in_millimeter*2)+1,60); // (size, $fn value)
            }
        }
        
        if(grill_pattern == "blank"){
            circle(cover_size);
        }
        
        if(grill_pattern == "svg"){
            difference(){
                circle(cover_size);
                scale([file_scale,file_scale]){import(file_to_import, center = true);};
            }
        }
        
        if(grill_pattern == "bahtinov"){
            bahtinov_pattern(line_size, line_space, cover_size);
        }
        
        if(grill_pattern == "carey"){
            carey_pattern(line_size, line_space, cover_size*2);
        }
        
        if(grill_pattern == "cross"){
            cross_pattern(line_size, line_space, cover_size*2);
        }
        
        if(grill_pattern == "bahtinov01"){
            bahtinov01_pattern(line_size, line_space, cover_size);
        }
        
        if(grill_pattern == "windmill"){
            windmill_pattern(line_size, line_space, cover_size);
        }
        
        if(grill_pattern == "none"){
            translate([cover_size,cover_size,0]) square(1);
        }
        
        if(grill_pattern == "brick"){
            brick_pattern();
        }
        
        if(grill_pattern == "brick-rounded"){
            brick_pattern("rounded");
        }
        
        if(grill_pattern == "half-rings"){
            half_loop_pattern(line_size, line_space, cover_size);
        }
        
        if(grill_pattern == "cross-rings"){
            if (centre_item_enabled == "no"){
                cross_rings(line_size, line_space, cover_size, "yes");
            } else {
                cross_rings(line_size, line_space, cover_size);
            }
        }
        
        
        if(grill_pattern == "crosshex") {
            crosshex_pattern(cover_size, line_size, line_space);
        }
        
        if(grill_pattern == "crosstri") {
            crosstri_pattern(cover_size, line_size, line_space);
        }
        
    }
}

/// Grill Pattern 2D
module grill_pattern(){
    intersection() {
                if(frame_option == "circular") {
                    circle(d = cover_size - min_border_size * 2, $fn = cover_size);
                } else {
                    ////////////////////////
                    offset(r=corner_r, $fn = ceil(corner_r * 8)) {
                        offset(r=-corner_r) {
                            square([cover_size, cover_size], center = true);
                        }
                    }
                }
        pattern_select();
    }
}

/// Draw Text (2D)
module grill_text_lines(){
    if (grill_text_02 == ""){
        text(text = grill_text, valign = "center", halign = "center", size = grill_text_size, font = grill_text_font_val);
    } else {
        translate([0,grill_text_size/2+grill_text_space,0]) text(text = grill_text, valign = "center", halign = "center", size = grill_text_size, font = grill_text_font_val);
        translate([0,-grill_text_size/2-grill_text_space,0]) text(text = grill_text_02, valign = "center", halign = "center", size = grill_text_size, font = grill_text_font_val);
    }
}

/// Transform Text (2D)
module grill_text(text_thickness = 0){
    flip_val = (projection == "yes" || frame_type == "flat") ? 0 : 180;
    rotate([0,flip_val,0]) translate([grill_text_x_nudge,-grill_text_y_nudge,0]) rotate(grill_text_rotate){
        if(text_thickness == 0){
            grill_text_lines();
        }else  {
            offset_shell(thickness = text_thickness){
                grill_text_lines();
            }
        }
    }
}


/// Draw and Transform SVG (2D)
module grill_svg(svg_thickness = 0){
    flip_val = (projection == "yes" || frame_type == "flat") ? 0 : 180;
    rotate([0,flip_val,0]) {
        translate([svg_x_nudge,-svg_y_nudge,0]) rotate(svg_rotate){
            if(svg_thickness == 0){
                scale([file_scale,file_scale]){
                    import(file_to_import, center = true);
                }
            } else  {
                offset_shell(thickness = svg_thickness){
                    scale([file_scale,file_scale]){
                        import(file_to_import, center = true);
                    }
                }
            }
        }
    }
}

/// Grill Pattern With Text/SVG 2D
module grill_pattern_with_text(){
    union(){
        if((text_thickness != 0) || (svg_thickness != 0)){
            difference(){
                grill_pattern();
                
                if(text_thickness == 0){ 
                    grill_text();
                } else {
                    grill_text();
                }
                
                if(svg_import_enabled == "yes") {
                    if(svg_thickness == 0){ 
                        grill_svg();
                    } else {
                        grill_svg();
                    }
                }
            }
            grill_text(text_thickness);
            if(svg_import_enabled == "yes") {
                grill_svg(svg_thickness);
            }
        } else {
            grill_pattern();
            grill_text(text_thickness);
            if(svg_import_enabled == "yes") {
                grill_svg(svg_thickness);
            }
        }
    }
}


/// 3D Complete Grill
module fan_cover_grill(){

    /// GRILL PATTERN
    // Projection
    if(projection == "yes"){
        // scale intersection (projection) with the sphere
        scale([1,1,0.2]) intersection() {
            if(projection_type == "full"){
                sphere(d=cover_size - min_border_size);
            } else {
                difference() {
                    sphere(d=cover_size - min_border_size);
                    sphere(d=cover_size - min_border_size * 3);
                }
            };
            // add cover_size to original linear_extrude height
            linear_extrude(height = grill_pattern_h+cover_size, convexity = 20, scale = projection_scale_val, twist = projection_twist_val, slices = projection_slices_val) {
                if((grill_text != "") || (svg_import_enabled == "yes")){
                    grill_pattern_with_text();
                } else {
                    grill_pattern();
                }
            }
        }
    } else {
        // No Projection
        linear_extrude(height = grill_pattern_h, convexity = 20) {
            difference() {
                if((grill_text != "")|| (svg_import_enabled == "yes")){
                    grill_pattern_with_text();
                } else {
                    grill_pattern();
                }
            }
        }
    }
}

/// Offset shell (for text/svg outline)
module offset_shell(thickness = 0.5) {
  difference() {
    render() {
      minkowski() {
        children();
        square([2 * thickness, 2 * thickness], center= true);
      }
    }
    translate([0, 0, -5 * thickness]) scale([1, 1, 100])
      children();
  }
}

//////// Original Patterns (from pre-remix)
module grid_pattern(size, line_size, line_space) {
    num = ceil(size / (line_size + line_space) * 1.42);
    for(x = [floor(-num / 2) : ceil(num / 2)]) {
        translate([x * (line_size + line_space), 0]) {
            square([line_size, num *(line_size + line_space)], center= true);
        }
        rotate(90) {
            translate([x * (line_size + line_space), 0]) {
                square([line_size, num *(line_size + line_space)], center = true);
            }
        }
    }
}

module triangle_pattern(size, line_size, line_space) {
    num = ceil(size / (line_size + line_space) * 1.42);
    for(x = [floor(-num / 2):ceil(num / 2)]) {
        translate([x * (line_size + line_space), 0]) {
            square([line_size, num *(line_size + line_space)], center = true);
        }
        rotate(60) {
            translate([x * (line_size + line_space), 0]) {
                square([line_size, num *(line_size + line_space)], center = true);
            }
        }
        rotate(120) {
            translate([x * (line_size + line_space), 0]) {
                square([line_size, num *(line_size + line_space)], center = true);
            }
        }
    }
}

module crosshair_pattern(size, line_size, line_space) {
    line = (line_size + line_space) * 2;
    num = ceil(size / line * 1.42);
    if(centre_item_enabled == "yes"){
        circle(d = line, $fn = ceil(line + line_size * 2));
    }
    for(n = [1:num]) {
        difference() {
            circle(d = n * line + line_size * 2, $fn = ceil(n * line + line_size * 2));
            circle(d = n * line, $fn = ceil(n * line + line_size * 2));
        }
    }
    for(rot=[0:90 / number_of_support_lines * 2:180]) {
        rotate(rot + 45) square([size * 2, line_size], center = true);
    }
}


module crosshex_pattern(size, line_size, line_space) {
    new_line_size = line_size * sin(90)/sin(60);
    new_line_space = line_space * sin(90)/sin(60);
    
    line = (new_line_size + new_line_space) * 2;
    num = ceil(size / line * 1.42);
    
    if(centre_item_enabled == "yes"){
        circle(d = line + new_line_size, $fn = 6);
    }
    for(n = [1:num]) {
        difference() {
            circle(d = n * line + new_line_size * 2, $fn = 6);
            circle(d = n * line, $fn = 6);
        }
    }
    // Support Bars
    x = centre_item_enabled == "yes" ? -size : -size -new_line_space -new_line_size;
    for(rot=[0:60:300]) {
        rotate(rot) translate([x,0,0]) square([size * 2, line_size], center = true);
    }
}

module crosstri_pattern(size, line_size, line_space) {
    new_line_size = line_size * sin(90)/sin(30);
    new_line_space = line_space * sin(90)/sin(30);
    
    line = (new_line_size + new_line_space) * 2;
    num = ceil(size / line * 3);
    
    if(centre_item_enabled == "yes"){
        circle(d = line + new_line_size * 2, $fn = 3);
    }
    for(n = [1:num]) {
        difference() {
            circle(d = n * line + new_line_size * 2, $fn = 3);
            circle(d = n * line, $fn = 3);
        }
    }
    // Support Bars
    x = -size -new_line_space -new_line_size;
    for(rot=[0:60:300]) {
        rotate(rot) translate([x,0,0]) square([size * 2, line_size], center = true);
    }
}


module honeycomb_pattern(size, line_size, line_space) {
    min_rad = (line_space / 2 * sqrt(3)) / 2 + line_size / 2;
    y_offset = sqrt(min_rad * min_rad * 4 - min_rad * min_rad);
    num_x = ceil(size / min_rad / 2) * 1.42;
    num_y = ceil(size / y_offset) * 1.42;
    difference() {
        square([size * 1.42, size * 1.42], center = true);
        for(y = [floor(-num_y / 2) : ceil(num_y / 2)]) {
            odd = (y % 2 == 0) ? 0 : min_rad;
            for(x = [floor(-num_x / 2) : ceil(num_x / 2)]) {
                translate([x * min_rad * 2 + odd, y * y_offset]) {
                    rotate(30) {
                        circle(d=line_space, $fn=6);
                    }
                }
            }
        }
    }
}

module dot_pattern(size, line_size, line_space) {
    rad = line_space / 2;
    y_offset = sqrt((rad + line_size / 2) * (rad + line_size / 2) * 4 - (rad + line_size / 2) * (rad + line_size / 2));
    num_x = ceil(size / rad / 2) * 1.42;
    num_y = ceil(size / y_offset) * 1.42;
    difference() {
        square([size * 1.42, size * 1.42], center = true);
        for(y = [floor(-num_y / 2) : ceil(num_y / 2)]) {
            odd = (y % 2 == 0) ? 0 : rad + line_size / 2;
            for(x = [floor(-num_x / 2) : ceil(num_x / 2)]) {
                translate([x * (rad + line_size / 2) * 2 + odd, y * y_offset]) {
                    rotate(30) {
                        circle(d=line_space,$fn = 30);
                    }
                }
            }
        }
    }
}

module aperture_pattern(size, line_size, line_space) {
        if((grill_text == "") || (centre_item_enabled == "no")) { 
    circle(d = line_space, $fn = 8);
        }
    for(rot = [1:2:15]) {
        rotate(360 / 16 * rot) {
            translate([line_space / 2 * cos(360 / 16) - line_size, -line_size]) {
                square([line_size, size]);
            }
        }
    }
}

//////// Shape Patterns
module random_pattern(size, line_size, line_space) {
    diff = (line_space / 10);
    seed=17;
    min_rad = (line_space / 2 * sqrt(3)) / 2 + line_size / 2;
    y_offset = sqrt(min_rad * min_rad * 4 - min_rad * min_rad);
    num_x = ceil(size / min_rad / 2) * 1.42;
    num_y = ceil(size / y_offset) * 1.42;
    difference() {
        square([size * 1.42, size * 1.42], center = true);
        for(y = [floor(-num_y / 2) : ceil(num_y / 2)]) {
            odd = (y % 2 == 0) ? 0 : min_rad;
            for(x = [floor(-num_x / 2) : ceil(num_x / 2)]) {
                translate([x * min_rad * 2 + odd, y * y_offset]) {
                    rotate(30) {
                        single_rand = rands(4,9,1)[0];
                        circle(d=line_space-diff, $fn=single_rand);
                    }
                }
            }
        }
    }
}

module shape_pattern(size, line_size, line_space, fn_pattern) {
    diff = (line_space / 10);
    min_rad = (line_space / 2 * sqrt(3)) / 2 + line_size / 2;
    y_offset = sqrt(min_rad * min_rad * 4 - min_rad * min_rad);
    num_x = ceil(size / min_rad / 2) * 1.42;
    num_y = ceil(size / y_offset) * 1.42;
    difference() {
        square([size * 1.42, size * 1.42], center = true);
        for(y = [floor(-num_y / 2) : ceil(num_y / 2)]) {
            odd = (y % 2 == 0) ? 0 : min_rad;
            for(x = [floor(-num_x / 2) : ceil(num_x / 2)]) {
                translate([x * min_rad * 2 + odd, y * y_offset]) {
                    rotate(30) {
                         circle(d=line_space-diff, $fn=fn_pattern);
                   }
                }
            }
        }
    }
}

//////// Spider web pattern 
module star(radius, wedges){
    //
	angle = 360 / wedges;
	difference() {
		circle(radius, $fn = wedges);
		for(i = [0:wedges - 1]) {
			rotate(angle / 2 + angle * i) translate([radius, 0, 0]) 
			    scale([0.8, 1, 1]) 
				    circle(radius * sin(angle / 2), $fn = 24);
		}
	}
}

module spider_web(ipWebSpacing, strands, ipThickness, wedges) {
    wedges = wedges < 6 ? 6 : wedges;
	for(i = [0:strands - 1]) 
    {
        difference() {
            star(ipWebSpacing * i, wedges);
            offset(r = -ipThickness) star(ipWebSpacing * i, wedges);
        }
	}

	angle = 360 / wedges;
	for(i = [0:wedges - 1])
    {
		rotate(angle * i) translate([0, -ipThickness / 2, 0]) 
			square([ipWebSpacing * strands, ipThickness]);
	}    
}

//////// Fancy Patterns
module circle_lattice(size, line_size, line_space, FN)  {
    for(i = [0,90,180,270]){
        rotate([0,0,i]){
            intersection() {
              square([size,size]); 
              union() {
                for (x=[-line_space:line_space:100+line_space]) {
                  for (y=[-line_space:line_space:100+line_space]){
                     difference()  {
                           translate([x+line_space/2, y+line_space/2]) circle($fn = FN, r=line_space*0.75);
                           translate([x+line_space/2, y+line_space/2]) circle($fn = FN, r=(line_space*0.75)-line_size);
                        }
                    }   // end for y        
                }  // end for x
               } // Union
            }
        }
    }
}

//////// Tear Drop pattern
module tear_drop(r=10){
    union(){
        circle(r=r,$fn=120);
        square([r,r]);
    }
}

module tear_drop_ring(od=10,t=1,so="no"){
  difference(){
    tear_drop(r=od/2);
    if(so){
    }else{
        tear_drop(r=od/2-t);
    }
  }
}

module tear_drop_pattern(size, line_size, line_space) {
    line = (line_size + line_space) * 2;
    num = ceil(size / line * 1.42);
    
    if((grill_text == "") || (centre_item_enabled == "no")) { 
        for(n = [0:1]) {
                tear_drop_ring(n * line, 2, "yes");
        }
    }
    
    for(n = [2:num]) {
        difference() {
            tear_drop_ring(n * line + line_size * 2, 2);
            tear_drop_ring(n * line, 2);
        }
    }
    for(rot=[0:90 / number_of_support_lines * 2:180]) {
        rotate(rot + 45) square([size * 3, line_size], center = true);
    } 
}

//////// Atom Pattern
module atom_loop(size, line_size) {
    difference() {
        scale([1.0,0.3]) circle(size,$fn=120);
        scale([1.0,0.3]) circle(size-line_size,$fn=120);
    }
};

module atom(size, line_size, number_of_support_lines) {
    number_of_support_lines = number_of_support_lines < 3 ? 3 : number_of_support_lines;
    deg = 360/number_of_support_lines;
    for(n = [0:deg:360]) {
        rotate ([0,0,n]) atom_loop(size/2, line_size);
    };
}

//////// Spiral Pattern
module ring (size, line_size){
    $fn = 90;
    translate([size,0]){
        difference(){
            circle(size);
            circle(size-line_size);
        }
    }
};

module ring_slice (size, line_size){
    difference(){
        ring(size, line_size);
        translate([size,0]){
            for(i = [180:90:360]) {
                rotate([0,0,i]){
                    square(size);
                }
            }
        }
    }
}


module spiral(size, line_size){
    if(centre_item_enabled == "no") { 
        difference(){
            circle(size/10);
            circle(size/10-line_size);
        }
    } else {
        circle(size/10);
    }
    deg = (360/number_of_support_lines);
    for(n = [0:deg:360]) {
        rotate([0,0,n]){
            translate([-size/10,0]) ring_slice (size/2, line_size);
        }
    }
}

//////// Bio Hazard Pattern
module bio_hazard_pattern(size, fn) {
    
    $r1 = (size / 3.33);
    $r2 = (size / 5);

    $fn = fn;    
    
    difference() {
        union() {

            // inner circle (ring)
            difference() {
                circle(r = size / 4 );
                circle(r = size / 5.5 );
            }

            // create the biohazard shape by removing the small circles from the larger ones
            difference() {
                large_circles();
                small_circles();
            }
        }

        // punch a hole in the middle
        circle(r = (size / 18) );
    }

}

module large_circles() {
    // 3 circles offset by 120 degrees to make the biohazard outline
    rotate([0, 0, 0]) large_circle();
    rotate([0, 0, 120]) large_circle();
    rotate([0, 0, 240]) large_circle();
}

module large_circle() {
    // large circle of radius r1
    translate([0, $r2])
    circle(r = $r1 );
}

module small_circles() {
    // 3 smaller holes to make the biohazard cutouts
    rotate([0, 0, 0]) small_circle();
    rotate([0, 0, 120]) small_circle();
    rotate([0, 0, 240]) small_circle();
}

module small_circle() {
    // circle of radius r2
    translate([0, $r2])
    translate([0, ($r2 / 2)]) circle(r = $r2 );
}

//////// Bars module
module bars(line_size, line_space, size, num=5) {
    num = round(num);
    for (i=[-num:num]) {
        translate([size/4,i*2*line_space]) square([size/2,line_size], center= true);
    }
    
}

//////// Line Pattern (New Version)
module line_pattern(line_size, line_space, size) {
    
    // Vertical Support Lines
    numBarsVert = size/(number_of_support_lines+1);
    for(i = [numBarsVert:numBarsVert:size-0.001]) {
        translate([i,0]) square([line_size,size], center= true);
    }
    
    // Horizontal Support Lines
    numBars = size/2 / line_space / 2 -1;
    bars(line_size, line_space, size*2, numBars);
}

//////// Bahtinov Pattern
module bahtinov_pattern(line_size, line_space, size) {
    size_double = size * 2;
    rotate([0,0,90]) square([size_double, line_size], center= true);
    rotate([0,0,0]) square([size_double, line_size], center= true);
    numBars = size / line_space / 2 -1;
    // +X +Y bars
    intersection() {
        rotate([0,0,30])
            bars(line_size, line_space, size_double, numBars);
        square([size_double, size_double], center= false);
    }
    // +X -Y bars
    intersection() {
        rotate([0,0,-30])
            bars(line_size, line_space, size, numBars);
        translate([0,-size_double])
        square([size_double, size_double], center= false);
    }
    // -X bars
    rotate([0,0,180])
        bars(line_size, line_space, size_double, numBars);
}

//////// Bahtinov Alt Pattern
module bahtinov01_pattern(line_size, line_space, size) {
    number_of_support_lines = number_of_support_lines < 1 ? 1 : number_of_support_lines;
    size_double = size * 2;

    for(rot=[90:90:180]) {
        rotate(rot) square([size_double * 3, line_size], center = true);
    } 

    numBars = size / line_space / 2 -1;
    for(i = [0:180:180]) {
        rotate(i){
            // +X +Y bars
            intersection() {
                rotate([0,0,45]) bars(line_size, line_space, size_double, numBars);
                square([size_double, size_double], center= false);
            }
            // +X -Y bars
            intersection() {
                bars(line_size, line_space, size_double, numBars);
                translate([0,-size_double]) square([size_double, size_double], center= false);
            }
        }
    }
}

////////// Carey Pattern
module carey_pattern (line_size, line_space, size) {
    rotate([0,0,90]) square([size, line_size], center= true);
    numBars = size/2 / line_space / 2 -1;
    
    for(i = [0:180:180]) {
        rotate(i){
    
            // +X +Y bars
            intersection() {
                rotate([0,0,10]) bars(line_size, line_space, size, numBars);
                difference(){
                    square([size, size], center= false);
                    rotate([0,0,10]) translate([0,-size-line_size]) square([size, size], center= false);
                }
            }
            // +X -Y bars
            intersection() {
                rotate([0,0,-10]) bars(line_size, line_space, size, numBars);
                difference(){
                    translate([0,-size]) square([size, size], center= false);
                    rotate([0,0,-10]) translate([0,line_size]) square([size, size], center= false);
                }
            }
        }
    }
}

//////// Cross Pattern
module cross_pattern(line_size, line_space, size) {
    number_of_support_lines = number_of_support_lines > 2 ? 2 : number_of_support_lines;
    if(number_of_support_lines != 0){
        for(rot=[0:90 / number_of_support_lines * 2:180]) {
            rotate(rot) square([size * 3, line_size], center = true);
        } 
    }
    numBars = size/2 / line_space / 2 -1;
    for(i = [0:90:270]) {
        rotate(i){
            intersection() {
                rotate([0,0,45])
                    bars(line_size, line_space, size, numBars);
                square([size, size], center= false);
            }
        }
    }
}

//////// Square (New Version)
module square_pattern(line_size, line_space, size) {
    number_of_support_lines = number_of_support_lines < 1 ? 1 : number_of_support_lines;

    for(rot=[90:90:180]) {
        rotate(rot) square([size * 3, line_size], center = true);
    } 

    numBars = size/2 / line_space / 2 -1;
    for(i = [0:90:270]) {
        rotate(i){
            // +X +Y bars
            intersection() {
                rotate([0,0,-45]) translate([-size/4,0]) bars(line_size, line_space, size, numBars);
                square([size, size], center= false);
            }
        }
    }
}

//////// Windmill Pattern
module windmill_pattern(line_size, line_space, size) {
    
    number_of_support_lines = (number_of_support_lines/2==round(number_of_support_lines/2)) ? number_of_support_lines : number_of_support_lines - 1;
    
    number_of_support_lines_val = number_of_support_lines < 4 ? 4 : number_of_support_lines;
    
    angle_val = 360 / number_of_support_lines_val;

    size_double = size * 2;
    
    // Support Lines
    for(rot=[angle_val:angle_val:360]) {
        rotate(rot) square([size_double * 3, line_size], center = true);
    } 
    
    // Pattern
    numBars = size / line_space / 2 -1;
    for(i = [angle_val:angle_val:360]) {
        rotate(i){
            // +X +Y bars
            intersection() {
                rotate([0,0,0]) bars(line_size, line_space, size_double, numBars);
                //square([size, size], center= false);
                hull(){
                    translate([line_size/2,-line_size]) square([size_double, line_size]);
                    rotate(-angle_val) translate([size/4,line_size/2]) square([size/2, line_size]);
                }
            }

        }
    }
}


//////// Brick Pattern

module brick(brick_width, shape){
    if(shape == "square"){
        square([brick_width,line_space], "yes");
    } else {
        hull(){
            fn_val = line_space < 8 ? 20 : line_space*2;
            translate([(-brick_width/2)+(line_space/2),0,0]) circle(line_space/2,$fn = fn_val);
            translate([(brick_width/2)-(line_space/2),0,0]) circle(line_space/2,$fn = fn_val);
        }
    }
}

module brick_line(number_of_support_lines, brick_width, shape){
    val = ((brick_width) + line_size); // X Loop
    val01 = (line_space+line_size)*2; // Y Loop
    numbar = ceil(cover_size/4);
    
    for (x=[-numbar*val:val:numbar*val], y=[-numbar*val01:val01:numbar*val01]) 
        translate([x,y,0])
            brick(brick_width, shape);
}

module brick_pattern(shape="square"){
    number_of_support_lines = number_of_support_lines < 2 ? 1 : number_of_support_lines/2;
    brick_width = line_space * number_of_support_lines;
    difference(){
        square([cover_size,cover_size], center = true);
        union(){
            brick_line(number_of_support_lines, brick_width, shape);
            translate([((brick_width) + line_size)/2, line_space+line_size, 0]) brick_line(number_of_support_lines, brick_width, shape);
        }
    }
}

////////////// Half Loop
module half_loop(line_size, line_space){
    intersection(){
        translate([-line_space/2,0,0]) square(line_space);
        difference(){
            circle(line_space/2, $fn = line_space*4);
            circle(line_space/2 -line_size, $fn = line_space*4);
        }
    }
}


module half_loop_pattern(line_size, line_space, size){
    line_space = line_space*10;
    space = (line_space-line_size);
    num = ceil(size / space);
    for (i = [ -num * space : space : num * space ] , n = [ -num * space/2 : space/2 : num * space/2 ] ){
        translate([i,n*2,0]) half_loop(line_size, line_space);
        translate([space/2 + i, space/2 + n*2,0]) half_loop(line_size, line_space);
    }
}



////////////// Cross Ring
module cross_ring_loop(line_size, line_space){
    difference(){
        circle(line_space/2, $fn = line_space*4);
        circle(line_space/2 -line_size, $fn = line_space*4);
    }
    for (r=[0:90:90]) rotate(r) translate([0,line_space - line_size/2,0]) square([line_size,line_space],center= true);
}

module cross_ring_circle(line_size, line_space){
    circle(line_space/2, $fn = line_space*4);
    for (r=[0:90:90]) rotate(r) translate([0,line_space - line_size/2,0]) square([line_size,line_space],center= true);
}

module cross_ring_cross(line_size, line_space){
    difference(){
        circle(line_space/2, $fn = line_space*4);
        circle(line_space/2 -line_size, $fn = line_space*4);
    }
    for (r=[0:90:90]) rotate(r) translate([0,line_size/2,0]) square([line_size,line_space*2],center= true);
}


module cross_rings(line_size, line_space, size, mod="no"){
    space = line_space*2 - line_size;
    num = ceil(size/space);
    for (i = [ -num * space : space : num * space ] , n = [ -num * space : space : num * space ] ){
        if(mod == "no"){
            translate([i,n,0]) cross_ring_circle(line_size, line_space);
        } else {
            translate([i,n,0]) cross_ring_loop(line_size, line_space);
        }
    }
}