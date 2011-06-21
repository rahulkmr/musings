// Multiline strings are a pain in js.
var data = [
"{{pp-semi-vandalism|expiry=May 10, 2011|small=yes}}{{pp-move-indef}}",
"{{Infobox film",
"| name = Harry Potter and the Deathly Hallows",
"| image = HP7part1poster.jpg",
"| caption = ''Part 1'' Theatrical Poster",
"| director = [[David Yates]]",
"| producer = [[David Heyman]]<br />[[David Barron (film producer)|David Barron]] <br />[[J. K. Rowling]]",
"| screenplay = [[Steve Kloves]]",
"| based on = {{based on|''[[Harry Potter and the Deathly Hallows]]''|[[J. K. Rowling]]}}",
"| starring = [[Daniel Radcliffe]]<br />[[Rupert Grint]]<br />[[Emma Watson]]<br />[[Ralph Fiennes]]<br />[[Alan Rickman]]<br /> [[Helena Bonham Carter]]",
"| music = <!--Please do not add rumours, Wikipedia is not rumour mill-->[[Alexandre Desplat]]<br />{{small|'''Orchestrator:'''}}<br />[[Conrad Pope]]<br />{{small|'''Themes:'''}}<br />[[John Williams]]",
"| editing = [[Mark Day (editor)|Mark Day]]",
"| studio = [[Heyday Films]]",
"| distributor = [[Warner Bros.|Warner Bros. Pictures]]",
"| released = {{small|'''Part 1:'''}}<br />{{Film date|df=y|2010|11|18|International<ref>{{cite web|url=http://www.hoyts.com.au/Movies/details/Harry_Potter_and_the_Deathly_Hallows_Part_1.aspx?cs=1| title=Harry Potter & the Deathly Hallows Part 1| publisher=Hoyts| date=18 November 2010| accessdate=22 November 2010}}</ref>|2010|11|19|United Kingdom)<br />(United States<ref name=\"comingsoon1\"/>}}<br />{{small|'''Part 2:'''}}<br />{{Film date|df=y|2011|7|15|}}",
"| runtime = {{small|'''Part 1:'''}}<br />146 minutes<ref>{{cite web|url=http://www.bbfc.co.uk/BFF270749| title=BBFC issue runtime, 146mins| publisher=BBFC| date=| accessdate=6 December 2010}}</ref>",
"| country = {{Film UK}}<br />{{Film US}}<!--Do not change this; see http://en.wikipedia.org/w/index.php?title=Talk:Harry_Potter_and_the_Order_of_the_Phoenix_%28film%29&oldid=126871681#What_makes_a_film_from_a_certain_country.3F for consensus.-->",
"| language = English",
"| budget = $250&nbsp;million<ref>{{cite news| last=Frankel| first=Daniel| title=Get Ready for the Biggest 'Potter' Opening Yet| work=[[The Wrap]]| date=17 November 2010| url=http://www.thewrap.com/movies/article/get-ready-biggest-potter-opening-yet-22607| accessdate=21 November 2010}}</ref>",
"| gross = {{small|'''Part 1:'''}}<br />$954,501,070<ref name=\"BOM (HP7)\"/>",
"}}",
"",
"'''''Harry Potter and the Deathly Hallows''''' is a 2010/2011 two-part [[epic film|epic]] [[fantasy film]] directed by [[David Yates]], written by [[Steve Kloves]] and based on the [[Harry Potter and the Deathly Hallows|novel of the same name]] by [[J. K. Rowling]]. The film is produced by Rowling along with [[David Heyman]] and [[David Barron (film producer)|David Barron]]. The two parts form the seventh and final <!--This article uses the British variant-->instalment<!--This article uses the British variant--> in the [[Harry Potter (film series)|Harry Potter film series]], with the story following [[Harry Potter (character)|Harry Potter]] on a quest to find and destroy [[Lord Voldemort]]'s secret to immortality â the [[Horcrux]]es. The film stars [[Daniel Radcliffe]] in his final performance as Harry Potter, alongside [[Rupert Grint]] and [[Emma Watson]] as Harry's best friends, [[Ron Weasley]] and [[Hermione Granger]]. The film also features [[Ralph Fiennes]], [[Helena Bonham Carter]] and [[Alan Rickman]].",
];
data = data.join("\n");

// Extracs the `info` section from abstract.
// Returns `start` and `end` index of `info` section.
function extractInfo(data) {
    var beginIntro = data.indexOf('{{Infobox');
    if (beginIntro == -1) return null;

    var endIntro = null;
    var inBlock = 0;
    var endIdx = data.length - 1;
    var i;
    for (i = beginIntro + 2; i < (endIdx - 1) && !endIntro; ++i) {
        if (data[i] == '{' && data[i+1] == '{')
            ++inBlock;
        else if (data[i] == '}' && data[i+1] == '}') 
            if (inBlock)
                --inBlock;
            else
                endIntro = i + 2;
    }
    if (endIntro)
        return [beginIntro, endIntro];
    else
        return null;
}

var introBlock = "";
var indices = extractInfo(data);
if (indices) {
    introBlock = data.slice(indices[0], indices[1]);
    data = data.slice(indices[1] + 1);
}

console.log("\nIntro" + introBlock);
console.log("\nData" + data);
