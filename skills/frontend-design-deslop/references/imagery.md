# Imagery, illustration, and graphic devices

Imagery is where AI-generated UI most loudly announces itself: stock people pointing at laptops, glossy isometric tech illustrations, gradient blobs and floating orbs, corporate-Memphis figures, default Midjourney renders. Imagery is also where a committed direction differentiates fastest, because almost no one art-directs it. Treat imagery as a system with rules, the same as type and color. Named brands are inspiration to transpose one move from, never to copy.

## Contents

1. Art direction as a layer
2. Photography direction
3. The AI and stock image fingerprint
4. Real product imagery beats stock
5. Illustration systems
6. The illustration slop tells
7. Graphic devices and texture
8. Specifying imagery in the design system
9. Imagery slop tells
10. Inspiration library (imagery and illustration)

## 1. Art direction as a layer

Art direction is the strategic layer above graphic design: it decides the single visual point of view (lighting, composition, color grading, subject treatment, environment, pacing) so that different people produce work that feels like one mind made it. Graphic design executes; art direction decides. Build an imagery direction during the system phase, with reference images and do/don't pairs, not as a last-minute search for a hero picture. For motion imagery, art direction also governs rhythm, transition, and pacing.

## 2. Photography direction

A photography direction specifies, in words and references: lighting (hard vs soft, direction, warmth), composition (tight vs environmental, rule-of-thirds vs centered, negative space), color treatment (graded to the brand palette, duotone, desaturated, high-contrast), subject treatment (candid vs posed, people vs product vs abstract, how people are framed), and post-processing (grain, overlay, crop ratios). The test: two photos from different shoots should look like the same brand. Always regrade stock or third-party photography toward the brand palette so it does not read as bought. When imagery sits behind text, guarantee contrast with an overlay or by lowering the image contrast, never by hoping.

## 3. The AI and stock image fingerprint

AI-generated images carry recognizable tells: too-perfect lighting, plastic or over-manicured skin, slightly wrong hand and finger proportions, indecipherable background text, implausible reflections and details, and an overall averageness because the model outputs the statistical mean of visual culture. Stock-photo clichés are their own slop: people pointing at laptops, the generic diverse team in an open-plan office, handshakes, glossy isometric server-and-cloud illustrations, abstract 3D gradient blobs and floating orbs. All of these read as filler that any competitor could have used. If imagery could belong to any brand in the category, it is slop.

## 4. Real product imagery beats stock

For software, the strongest hero is the product itself: a real, well-composed interface screenshot or a short product demo, not stock or abstract decoration. The best current SaaS sites lead with real product visuals and let the interface carry the credibility. Custom imagery that explains (how data flows, how pieces connect, what the product actually does) beats decorative imagery that fills space. When you cannot show the product, commission illustration with a point of view rather than reaching for a 3D blob.

## 5. Illustration systems

An illustration system defines a repeatable style so commissioned or generated art carries identity: pick a lane (flat, line, isometric, editorial, textured/grain, spot vs full-scene) and specify stroke weight, fill behavior, outline treatment, palette, level of detail, degree of naivety, and whether human figures appear and how. Distinctiveness comes from the specifics: a particular line weight, a grain overlay, a constrained palette, an unusual perspective. Editorial and spot illustration (single conceptual images, like a magazine) differentiate strongly because they are clearly authored.

## 6. The illustration slop tells

- **Corporate Memphis / "Alegria"**: flat figures with bendy limbs, tiny heads, oversized hands, non-representational skin colors. Created for a big-tech brand and then mass-replicated through component packs until it became shorthand for soulless startup. The defensible critique is not flat-art-itself but undifferentiated, replication-optimized flat art that represents everyone and speaks to no one.
- **Default Midjourney aesthetic**: the recognizable hyper-rendered, slightly-uncanny generative look used raw.
- **Generic gradient mesh and 3D blobs**: decorative abstraction with no meaning. Flat illustration is not banned; undifferentiated flat illustration is. If a custom style has a clear, specific hand, it is the opposite of slop.

## 7. Graphic devices and texture

Graphic devices are the non-photographic, non-illustrative marks that carry identity: a structural grid or dot pattern, noise and grain, halftone, ASCII, generative or p5.js fields, custom SVG patterns. They are also the main antidote to flat-slop, which is partly a texture problem. Grain over a flat color or gradient adds depth and a tactile, intentional feel (SVG `feTurbulence` plus a contrast/brightness filter, or a noise PNG overlay at low opacity). A faint background grid or dot field (popularized by developer-tool sites) implies structure; note it is now widely copied, so use it as one element of a larger system rather than the whole identity. A repeated motif (a specific shape, a halftone, a generative pattern with a per-page seed) used consistently becomes ownable. Texture and a signature device are often a faster route off the flat AI default than any color or type change.

## 8. Specifying imagery in the design system

Write the imagery section of DESIGN.md with: the chosen mode (product screenshots, photography, illustration, abstract device, or a defined mix), the rules for each (lighting and grading for photos, style spec for illustration, technique for devices), at least one do and one don't, and the contrast guarantee for text-over-image. State explicitly what to avoid (the category's stock clichés, the AI fingerprint, corporate-Memphis) so the negative space is as clear as the positive direction.

## 9. Imagery slop tells

- Stock people pointing at laptops, generic office teams, handshakes.
- Glossy isometric tech illustrations; 3D gradient blobs and floating orbs.
- Corporate-Memphis / Alegria figures.
- Raw default-Midjourney or default-generative renders.
- Stock photography that has not been regraded to the palette.
- Decorative imagery that explains nothing, where a real product shot would.
- Flat color everywhere with no texture, when grain or a device would add depth and intent.

## 10. Inspiration library (imagery and illustration)

Transpose the named move. Inspiration only.

- **Stripe**: custom gradient plus real, embedded product UI; imagery that demonstrates rather than decorates. Transpose product-as-hero and the bespoke gradient treatment.
- **Linear**: dark surfaces that make interface screenshots pop; motion proving speed. Transpose the contrast-for-screenshots dark treatment.
- **Vercel**: structural grid as a graphic device; an animated build log as hero imagery. Transpose the background grid device and motion-as-demo.
- **Apple**: full-bleed product photography with dramatic lighting and vast negative space. Transpose the lighting discipline and product-as-subject.
- **Gumroad / neobrutalist sites**: flat fills with thick outlines and a naive editorial-cartoon hand that is clearly authored. Transpose the specific, ownable illustration hand (the opposite of generic flat).
- **Developer-tool and terminal sites**: grain, dot grids, ASCII, monospace marks. Transpose a single consistent texture or device.
- Sources to mine for current, distinctive imagery direction: Awwwards, Godly, SiteInspire, Land-book, Brutalist Websites, and for type-in-the-wild Typewolf and Fonts In Use.
