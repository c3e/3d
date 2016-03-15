form(50, 30, 1.6, 12);

module form(width, height, wallwidth, funnelheight) {
    translate([wallwidth, wallwidth, 0]) {
      cube([width, width, wallwidth], false);
    }
    module wall() {
        cube([width + wallwidth * 2, wallwidth, height + wallwidth]);
    }

    module walls() {
        wall();

        translate([0,width + wallwidth,0]) {
            wall();
        }
    }

    walls();
    translate([(width + wallwidth * 2), 0, 0]) {
        rotate([0, 0, 90]) {    
            walls();
        }
    }

    module funnel() {
     cylinder($fn=360, funnelheight, width / 2 - ((width * 10) / 100), 2, false);
    }

    translate([width / 2 + wallwidth, width / 2 + wallwidth, wallwidth]) {
        funnel();
    }
}