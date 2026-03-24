# Substack Algorithm & Growth Reference

## Table of Contents

1. How the Algorithm Works
2. Notes Ranking Signals
3. The Recommendations System
4. Growth Levers (ranked by impact)
5. Monetization Math
6. The Level-by-Level Growth Plan

---

## 1. How the Algorithm Works

Source: PubStack Success interview with Mike Cohen, Substack's head of ML and architect of the Notes algorithm.

**Optimization target**: Subscriptions and paid conversions. Not engagement, not time spent, not clicks. Substack takes a cut of paid subscriptions, so their incentive is to surface content that converts readers into paying subscribers.

**User representation**: The algorithm builds a numerical representation of each user based on:

- Location and language
- Current subscriptions
- Followed creators
- Stated interests during onboarding
- Interaction history

**Content matching**: It matches content to users using these representations. The core mechanism is **audience overlap**. If your audience overlaps with larger publications, the algorithm shows your content to those publications' non-subscribed readers.

**The "natural next step" model**: The rebuilt algorithm (2025) asks "What would be the natural next step for this reader in this moment?" rather than "What does this person usually like?" This means it rewards **publishing momentum** (pieces that build on each other, consistent themes) rather than one-off viral hits.

**Why this matters for writers**: Because the algorithm optimizes for subscription conversion (not engagement), the strategies that work on ad-supported platforms (outrage, engagement bait, hot takes) don't work here. What works: content so good that readers want to subscribe for more.

---

## 2. Notes Ranking Signals

From the Mike Cohen interview:

**Primary signal**: Likes. This is the strongest ranking factor for Notes.

**Secondary signals**:

- Restacks (amplify reach to the restacker's audience)
- Replies (signal depth of engagement)
- Time between Note publication and first engagement

**Content neighborhood**: The algorithm learns your "content neighborhood" from Notes interactions. If your Notes attract engagement from readers of Publication X, the algorithm starts showing your content to more of Publication X's audience.

**Subscriber weighting**: Notes from writers you subscribe to are weighted higher in your feed.

**What doesn't work on Notes**:

- Thread-style content (Notes aren't threads; save that for Twitter)
- Promotional posts ("check out my latest article") without standalone value
- Vague motivational content
- Content that reads like a tweet transplanted without adaptation

**What works on Notes**:

- Genuine questions that invite discussion
- Surprising data points or observations
- Short, specific takes (1-3 sentences) on industry developments
- Behind-the-scenes of your writing process (meta-content works on a writing platform)

---

## 3. The Recommendations System

**Fully human-curated, not algorithmic.** Writers manually select who they recommend. This is a crucial distinction: you can't "game" recommendations through algorithmic signals.

**When recommendations appear**: During the subscribe flow, at the moment of highest engagement (the reader just decided to subscribe). This makes recommendations extremely high-converting.

**How to get recommended**:

1. Write quality content in a related niche (prerequisite)
2. Engage genuinely with the recommender's content over time
3. Build a relationship (comment, restack, respond to Notes)
4. If appropriate, reach out and suggest a mutual recommendation
5. Or: write content good enough that they find and recommend you organically

**Recommendation swaps**: Two writers of similar size recommending each other. Effective for growth, but only if audiences genuinely overlap. Irrelevant recommendations annoy new subscribers and increase churn.

---

## 4. Growth Levers (ranked by impact)

Based on data from top performers: Gergely Orosz (Pragmatic Engineer, 400k+ subs), Lenny Rachitsky (Lenny's Newsletter, 1M+ subs), and aggregated practitioner reports.

### Tier 1: Highest impact

**Recommendations from larger publications**

- 70% of Gergely Orosz's free subscriber growth came from Recommendations + Discover
- High-converting because they appear at the subscribe moment
- Substack reported 32M new subscribers from within the platform in 3 months (2025)

**Consistent, high-quality publishing**

- The algorithm rewards topic and cadence consistency
- Quality compounds: each good piece improves the algorithm's audience model
- Word of mouth remains the single biggest lever at scale (Lenny Rachitsky's primary driver)

### Tier 2: High impact

**Notes as testing pipeline**

- Post 3-5 Notes/week as idea validation
- Write long-form versions of Notes that get engagement
- Active Notes usage increases visibility in the recommendation engine

**Cross-promotion partnerships**

- Guest posts on complementary newsletters
- Mutual recommendation swaps at similar scale
- Natural cross-references within content

### Tier 3: Moderate impact

**External traffic**: Twitter/X, LinkedIn, podcast appearances, SEO (slow but durable — particularly effective for web posts, which accumulate long-tail search traffic over months; newsletter issues are ephemeral in search)

**Homepage + welcome email optimization**:

- Welcome email has the highest open rate you'll ever send
- Pinned "Start Here" post
- Clear, specific homepage description

### Tier 4: Low impact at small scale

**Substack's Boost** (paid promotion within platform) **Cross-posting to Medium or dev.to** (reach vs. cannibalization tradeoff)

---

## 5. Monetization Math

**Average free-to-paid conversion**: ~3% (industry baseline) **Excellent conversion**: 4-5% **Top performers**: Pragmatic Engineer and Lenny's Newsletter both charge $150/year, convert at ~4-5%

**Revenue projections at 3% conversion, $10/month pricing**:

- 500 free subs -> ~15 paid -> $150/month
- 1,000 free subs -> ~30 paid -> $300/month
- 5,000 free subs -> ~150 paid -> $1,500/month
- 10,000 free subs -> ~300 paid -> $3,000/month
- 50,000 free subs -> ~1,500 paid -> $15,000/month

**At $15/month**: multiply by 1.5x **At $150/year ($12.50/month)**: similar to $12.50/month but annual billing reduces churn

**Substack's cut**: 10% of paid subscriptions + Stripe fees (~3%)

**Practitioner consensus on revenue sources** (highest return per subscriber):

1. Coaching/consulting (one client at $500/month > 50 subs at $10/month)
2. Courses/products sold via the newsletter
3. Sponsorships (viable at >5K subscribers)
4. Paid subscriptions (best at scale, poor at small scale)

**Double-monetization model**: Some newsletters combine a Products section with Founding Member upsells. Newsletter as growth engine, products as revenue engine.

**Strategic implication**: At < 1,000 subscribers, don't paywall anything. Focus all energy on growth. The paid tier math only works at scale.

---

## 6. The Level-by-Level Growth Plan

From Landon Poburan (107.6% growth in 6 months following this system):

**Level 1: Foundation** (0-100 subscribers)

- Commit to one weekly newsletter
- Focus on building the habit, not optimization
- Tell everyone you know

**Level 2: Notes** (100-500 subscribers)

- Add 3-5 weekly Notes
- Use Notes to test topics before committing to long-form
- Track which Notes get engagement

**Level 3: Community** (500-2,000 subscribers)

- Engage with other writers in your niche
- Comment, restack, respond to Notes
- Build relationships that lead to recommendations

**Level 4: Optimization** (2,000-10,000 subscribers)

- Optimize homepage copy
- Craft the welcome email
- Create a pinned "Start Here" post
- Analyze which issue types drive the most subscriptions (not just opens)

**Level 5: Monetization** (10,000+ subscribers)

- Introduce paid tier
- Add products or services
- Consider sponsorships
- Multiple revenue streams reduce risk

Critical caveat: writers writing about writing on Substack have a built-in massive audience on the platform. Their growth numbers may not transfer to technical niches. Filter all advice through your actual niche's dynamics.
