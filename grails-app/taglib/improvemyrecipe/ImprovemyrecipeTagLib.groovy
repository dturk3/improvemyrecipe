package improvemyrecipe

class ImprovemyrecipeTagLib {
	def dailyFacts = {

		def facts = [
[headline:
	"""Why are the login and signup forms crooked?""",
content: 
	"""
Because we want you to remember us for something. Studies show that when a layout is structured in such a way, it keeps you from falling asleep
while you visit us, and makes you pay attention. That's not a bad thing, but maybe that study is completely made up. Regardless of what our 
interfaces attempt to look like, you have much to gain by joining the <strong>improvemyrecipe.com</strong> community:
<br>
<ul/>
<li>The privilege of contributing your recipes to our collection</li>
<li>The luxury of having thousands of users improve your creation</li>
<li>The pure excitement of watching your precious recipe inch towards perfection</li>
<li>The glory of having your recipe trend and gain popularity before your eyes</li>
<li>... and of course, the bliss of eventually eating a masterpiece after it has been tweaked by hundreds of keen followers!</li>
</ul>
<br/>
What are you waiting for? Join our community for FREE today. This is a terrific daily distraction that will benefit you in something you participate
in at least three times daily.
	"""],
[headline:
	"""What's with the three panels on every page?""",
content:
	"""
Because this approach is not as common as it should be. Isn't it nice to see everything on your page without having to scroll? Isn't it also nice to 
see a few things at once without having to go to a bunch of different pages? It's simple, predictable, you gives you a sense of stability during 
your visits. We call it a fluke. But regardless of whether or not you care, have still have much to gain by joining the <strong>improvemyrecipe.com</strong> community:
<br>
<ul/>
<li>The privilege of contributing your recipes to our collection</li>
<li>The luxury of having thousands of users improve your creation</li>
<li>The pure excitement of watching your precious recipe inch towards perfection</li>
<li>The glory of having your recipe trend and gain popularity before your eyes</li>
<li>... and of course, the bliss of eventually eating a masterpiece after it has been tweaked by hundreds of keen followers!</li>
</ul>
<br/>
What are you waiting for? Join our community for FREE today. This is a terrific daily distraction that will benefit you in something you participate
in at least three times daily.
	"""],
[headline:
	"""What's with the three panels on every page?""",
content:
	"""
Because this approach is not as common as it should be. Isn't it nice to see everything on your page without having to scroll? Isn't it also nice to 
see a few things at once without having to go to a bunch of different pages? It's simple, predictable, you gives you a sense of stability during 
your visits. We call it a fluke. But regardless of whether or not you care, have still have much to gain by joining the <strong>improvemyrecipe.com</strong> community:
<br>
<ul/>
<li>The privilege of contributing your recipes to our collection</li>
<li>The luxury of having thousands of users improve your creation</li>
<li>The pure excitement of watching your precious recipe inch towards perfection</li>
<li>The glory of having your recipe trend and gain popularity before your eyes</li>
<li>... and of course, the bliss of eventually eating a masterpiece after it has been tweaked by hundreds of keen followers!</li>
</ul>
<br/>
What are you waiting for? Join our community for FREE today. This is a terrific daily distraction that will benefit you in something you participate
in at least three times daily.
	"""],
[headline:
	"""What's with the three panels on every page?""",
content:
	"""
Because this approach is not as common as it should be. Isn't it nice to see everything on your page without having to scroll? Isn't it also nice to 
see a few things at once without having to go to a bunch of different pages? It's simple, predictable, you gives you a sense of stability during 
your visits. We call it a fluke. But regardless of whether or not you care, have still have much to gain by joining the <strong>improvemyrecipe.com</strong> community:
<br>
<ul/>
<li>The privilege of contributing your recipes to our collection</li>
<li>The luxury of having thousands of users improve your creation</li>
<li>The pure excitement of watching your precious recipe inch towards perfection</li>
<li>The glory of having your recipe trend and gain popularity before your eyes</li>
<li>... and of course, the bliss of eventually eating a masterpiece after it has been tweaked by hundreds of keen followers!</li>
</ul>
<br/>
What are you waiting for? Join our community for FREE today. This is a terrific daily distraction that will benefit you in something you participate
in at least three times daily.
	"""],
[headline:
	"""What's with the three panels on every page?""",
content:
	"""
Because this approach is not as common as it should be. Isn't it nice to see everything on your page without having to scroll? Isn't it also nice to 
see a few things at once without having to go to a bunch of different pages? It's simple, predictable, you gives you a sense of stability during 
your visits. We call it a fluke. But regardless of whether or not you care, have still have much to gain by joining the <strong>improvemyrecipe.com</strong> community:
<br>
<ul/>
<li>The privilege of contributing your recipes to our collection</li>
<li>The luxury of having thousands of users improve your creation</li>
<li>The pure excitement of watching your precious recipe inch towards perfection</li>
<li>The glory of having your recipe trend and gain popularity before your eyes</li>
<li>... and of course, the bliss of eventually eating a masterpiece after it has been tweaked by hundreds of keen followers!</li>
</ul>
<br/>
What are you waiting for? Join our community for FREE today. This is a terrific daily distraction that will benefit you in something you participate
in at least three times daily.
	"""]
 ]

		def fact = facts[new Random().nextInt(facts.size())]		
		out << 
"""		<p>${fact.headline}</p>
		${fact.content}
"""
	}
}
