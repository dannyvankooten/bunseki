# Frequently Asked Questions

### How do I install Bunseki on my server?

Have a look at the [installation instructions](Installation%20instructions.md).

---

### How do I upgrade Bunseki to the latest version?

By overwriting the bunseki binary with the new version. Make sure to restart any running processes for the changes to take effect. More detailed instructions can be found here: [upgrading Bunseki](Updating%20to%20the%20latest%20version.md).

---

### What databases can I use with Bunseki?

You can use Bunseki with either Postgres, MySQL or SQLite. 


---

### How to configure Bunseki?

Create a file named `.env` in the working directory of your Bunseki process. You can [find a list of accepted configuration values here](Configuration.md).

---

### How to start tracking pageviews?

Add the tracking snippet to all pages on your site that you want to keep track of. Get your tracking snippet by clicking the gearwheel icon in your Bunseki dashboard.

---

### What data does Bunseki track?

Bunseki tracks no personally identifiable information on your visitors. 

When Bunseki tracks a pageview, your visitor is assigned a random string which is used to determine whether it's a unique pageview. If your visitor visits another page on your site, the previous pageview is processed & deleted within 1 minute. If the visitor leaves your site, the pageview is processed & deleted when the session ends (in 30 minutes).

If "Do Not Track" is enabled in the browser settings, Bunseki respects that.

---

### Bunseki is not tracking my pageviews

If you have the tracking snippet in place and Bunseki is still not tracking you, most likely you have `navigator.doNotTrack` enabled. Bunseki is respecting your browser's "Do Not Track" setting right now.
