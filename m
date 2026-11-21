Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795260972;
	b=3vycJIgMRbL00H6fG5TS9xHDI62SEeinoxSbXBzBpqaS07v2RvbT94X72fC0oorrBbtN
	 8Fl6mIYl+9Lm9qjCREcagu4zwMmC52SCKy5r1/1q9WzWREp3m1u6JqN0X/q8OhzsHdZ8l
	 03FpgESaRdi5AZUJ+pzLML4fS06O/vp7m6G6QAo5HogrgVjBfincXDFV7/VV0+QKXQqck
	 46m4LCQNBTTo1hlYRI6mtUx//5Ngs5dKJkjgxRIscS6OQfbplj7/deaeu19EjCN8SI0pt
	 I9GaOvJ8CIOD7cac1gNQC0DRGfJYFcbqbV2jj8LuCORM2NmOVkACw83UE+ftu/6/Dqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795260972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:User-Agent;
	bh=LKBzOKHK/YHBaF8etDq4KAgni0fdo2bMsyHuAXRHKOk=;
	b=K1GkwV8xmxVQWOdZWbxseXQv/U8h61Q78vAEZFhfaYKy/g3B7Wd0+rdAK+Njvxg0fpZc
	 jAvPkQRy06W8/JCnpLDJrNtzbXgZ32AqyT8eKU4a8eUiupS/Bw+B8So5VUm0JaBmgmjoC
	 3UfDsqRbXHhJlf+m8GZABVWXBxNyqCOD8cO2CSeahuxgASs5B0xwfbZY55nndhMtkOJLG
	 jPiuBlGauyNwasJEEyPDm4tL1fUNystTY7955GnprZul0H+JQ4x2IngDvoAlOU348E+bF
	 NqwNNJIqfvlnXa506nKdP3W9QmmMGh2cjLdOJWzTg69DgNi610PPqztYnat6mxZEVgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GWv3LZRE;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0D4606A32A
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 11:36:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E0D4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GWv3LZRE
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-385d8a00598so2198679eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 03:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795260971; x=1795865771; darn=vger.kernel.org;
        h=user-agent:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LKBzOKHK/YHBaF8etDq4KAgni0fdo2bMsyHuAXRHKOk=;
        b=GWv3LZREavFLjqR8gwxbTur2esUqQGjpWycnNAs/dTuQVKiBzv8ndJGuZyJOebKrIZ
         u9I9R/4ZlaHfv4SQZgAGh+2wZYBS6db4MlP6ZKlMzWEssZz0Am/hmSfMk2zUruqQju1u
         lj4K9HRXBZP3C1wLQ9ZiLfiQGjjTLymDs7gv80Cv1njpL0ncfaMk3UslYsHNuHkTbzxd
         t3kelo8xFVL03g38Mzj+7ua0Uv5FYX6XG3otdBUvFZpcmzzBLqvxAVbmSFOo/pBP8ror
         3I8LQrFVEiGsFtRiptAm7sZFwwSRegECiwSGibwHgB8YC0yhgG/Ky8q2K/fSVTaHyHHr
         5zLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795260971; x=1795865771;
        h=user-agent:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LKBzOKHK/YHBaF8etDq4KAgni0fdo2bMsyHuAXRHKOk=;
        b=0zphlE19bNsKhZcwhYz5kS/J+yvkmnDCbQaTvhiK0rW1uBh5tc4BcYzJF+6WoHsqN2
         TNezbXSlsOcJjxIMp5E0yT2ZFQmj05PqY2KbNPNIJHaFZJhe6lxQNLEDAuIb1NB/Q3+d
         nP3ZgIC28OPFFDhi16/QAIWt+8F5/EPEnDib+kZSGQAQdIBQmqSgJ9q1FiX4SYWnbjLJ
         fb22VcVsLzIXtFQbRe0TVe/HhW2Ty+BDbKsnCQDAS7DcUf/TPidKuRwmiA4hklxnwJLk
         EbU3fnIA4TvIn0M7tW0RULYY08UJZrQDalsBvOoyhyvDJHWxzi8AEQfq2VuXrfNSS8K3
         DwFA==
X-Forwarded-Encrypted: i=1; AL+hErFIbeFrwNU+YlgZvT2hpYHzrPQnI3Z0qluCthpHpP+T9rXZyXtgmyIhgwF+KH5en7l8ni/x+5uApIbvOCIU@vger.kernel.org
X-Gm-Message-State: APuU4Z+fCm/38zP4+TONEsETeulNUwGIyc/Dxr4CI0rKOv3TEL7tfwF3
	c+1hL6hKZFZi06iq8zPwHeHtbWPWNYFfho7zrAPdQNoeGNGnWMXbVZk/
X-Gm-Gg: AZFdTZcRe4/hoEglwEeSRWhvWMotaTKeHoR0I2az29HudJLrgDs06fyW+4OhNZOio77
	XHttuWqiA0uAEsUT3PKP0NJqn61n6OA84Tw2DGOVz8lkOA5vMYxgPRiQMUx5qTBKEJmSkJfGbT8
	32ovbkEQADwKKDfLDsM2KYODHapYm5/wCkucx/J315B5w6HFQ3X1DWKP1cixH6acYCHKm7LUTFk
	aNS+1KHoTMsDMwx7HszBLNukzqTQZOhML8F5D9m0N1hZc2nPeUSpU1ycKxefl1cSk+X8FfI795d
	8FnChWRGTemBNt8ZkpXRBANSL2NGff8zBg2TfY/CbER2caQtNW4LppLB9keZwAlKCCFKfxtq6l+
	0Y7AQTKivCYeO+NzFI1JGLH1PPUHGsH0LN8CmuTPo6mCEGayqzYYJ+jQTQKhICfEAey94o2gvhr
	FWsJFrajv7sZLhv3q/kwKjQ2S3/zYm1z7V/pUCFimzEWpquJvn0DR+Llmf+WpMgrXH2Z911L6jV
	Dx7+ywim/EGm2x1+Z3zi0dmJ4zcZSI/qhRZZhSU+fzJphDCuIk6s/FkeamuYsG5/vTphHiwq3wm
	vrXtg/kvvqM8g47XGvLPKxeJK53GmbKAgzf0S8BA1IZcZXWOEQl7e/5NKQxcWZZ6aEvFoQAKsG8
	BH+/+T6mTbfogD1j/
X-Received: by 2002:a05:693c:8951:20b0:384:ce59:5e19 with SMTP id 5a478bee46e88-3856f257bd6mr5663214eec.6.1795260971016;
        Sat, 21 Nov 2026 03:36:11 -0800 (PST)
Received: from asus-ux3405ca ([140.213.140.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm18512805eec.28.2026.11.21.03.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 03:36:10 -0800 (PST)
Date: Sat, 21 Nov 2026 18:36:05 +0700
From: Muhammad Huda Nugroho <mhudan21@gmail.com>
To: Amit Kucheria <amitk@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] thermal/drivers/tsens: Drop __init from functions
 reachable from probe
Message-ID: <20261121113605.jDNtw%mhudan21@gmail.com>
User-Agent: mail v14.9.25
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list

tsens_probe() calls priv->ops->init(priv), and every .init member in
this driver points at a function marked __init: init_common() in
tsens.c, init_8952(), init_8956() and init_tsens_v1_no_rpm() in
tsens-v1.c, init_tsens_v2_no_rpm() in tsens-v2.c, and init_8226(),
init_8909(), init_8939() and init_9607() in tsens-v0_1.c.

Nothing guarantees that probe runs before the init sections are freed.
A deferred probe, or a platform where the tsens node is probed late,
calls into freed text and oopses.

Two independent reproductions on unrelated hardware:

 - On an IPQ5018 board the machine oopses roughly 9.4 s into boot
   inside init_tsens_v1_no_rpm(), reliably. The only way to reach
   userspace was to disable the tsens node in DT, which leaves the SoC
   with no thermal sensing at all.

 - Reported separately against a Galaxy A5 SD, where the driver is
   built modular and resumes a deferred probe after its module init
   section has been freed.

Different triggers, one root cause: callbacks living in an init section
that is released while the ops table still points at them.

Drop the annotation from all nine. Fixing only the entry points is not
enough while the init_common() they call is still annotated. The
declaration of init_common() in tsens.h never carried __init, so it
needs no change.

The brace placement on init_8939() and init_8956() is corrected as
well, since those lines are being touched anyway and checkpatch wants
the brace on its own line.

Signed-off-by: Muhammad Huda Nugroho <mhudan21@gmail.com>
---
Notes for reviewers, not for the commit message:

Resent: the first attempt was rejected by linux-pm for containing an HTML
part, so the list never saw it. Apologies to the few of you who got that
copy directly - this is the same patch, nothing has changed.

Against mainline master as of 2026-11-21. Not tested on the Galaxy A5 SD;
the IPQ5018 reproduction is mine, and it was on a 6.18 kernel, where eight
of these nine carry the annotation. init_8952() is newer than that tree and
is included here because it has the same problem, not because I hit it.

The second reproduction is samcday's, found and fixed independently with
the same mechanism:

  https://github.com/samcday/linux/pull/13

I have not added a Reported-by: or Co-developed-by: for it, because I have
neither their address nor their agreement to be listed. If they would like
a trailer, say so and I will add it in v2 - the prior work is theirs as
much as mine and I would rather credit it properly than silently.

Neither version appears to have been sent to the list before this.

No Fixes: tag: the annotations predate the ops indirection in several of
these files and I could not identify a single commit that introduces the
bug rather than inherits it. Happy to add one if you can point at it.

 drivers/thermal/qcom/tsens.c      |  2 +-
 drivers/thermal/qcom/tsens-v0_1.c |  9 +++++----
 drivers/thermal/qcom/tsens-v1.c   |  7 ++++---
 drivers/thermal/qcom/tsens-v2.c   |  2 +-
 4 files changed, 11 insertions(+), 9 deletions(-)

--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -929,7 +929,7 @@
 	.reg_stride	= 4,
 };
 
-int __init init_common(struct tsens_priv *priv)
+int init_common(struct tsens_priv *priv)
 {
 	void __iomem *tm_base, *srot_base;
 	struct device *dev = priv->dev;
--- a/drivers/thermal/qcom/tsens-v0_1.c
+++ b/drivers/thermal/qcom/tsens-v0_1.c
@@ -207,7 +207,7 @@
 	return 0;
 }
 
-static int __init init_8226(struct tsens_priv *priv)
+static int init_8226(struct tsens_priv *priv)
 {
 	priv->sensor[0].slope = 2901;
 	priv->sensor[1].slope = 2846;
@@ -219,7 +219,7 @@
 	return init_common(priv);
 }
 
-static int __init init_8909(struct tsens_priv *priv)
+static int init_8909(struct tsens_priv *priv)
 {
 	int i;
 
@@ -240,7 +240,8 @@
 	return init_common(priv);
 }
 
-static int __init init_8939(struct tsens_priv *priv) {
+static int init_8939(struct tsens_priv *priv)
+{
 	priv->sensor[0].slope = 2911;
 	priv->sensor[1].slope = 2789;
 	priv->sensor[2].slope = 2906;
@@ -255,7 +256,7 @@
 	return init_common(priv);
 }
 
-static int __init init_9607(struct tsens_priv *priv)
+static int init_9607(struct tsens_priv *priv)
 {
 	int i;
 
--- a/drivers/thermal/qcom/tsens-v1.c
+++ b/drivers/thermal/qcom/tsens-v1.c
@@ -145,7 +145,7 @@
 	[TRDY] = REG_FIELD(TM_TRDY_OFF, 0, 0),
 };
 
-static int __init init_8952(struct tsens_priv *priv)
+static int init_8952(struct tsens_priv *priv)
 {
 	priv->sensor[0].p1_calib_offset = 2;
 	priv->sensor[0].p2_calib_offset = -1;
@@ -173,7 +173,8 @@
 	return init_common(priv);
 }
 
-static int __init init_8956(struct tsens_priv *priv) {
+static int init_8956(struct tsens_priv *priv)
+{
 	priv->sensor[0].slope = 3313;
 	priv->sensor[1].slope = 3275;
 	priv->sensor[2].slope = 3320;
@@ -189,7 +190,7 @@
 	return init_common(priv);
 }
 
-static int __init init_tsens_v1_no_rpm(struct tsens_priv *priv)
+static int init_tsens_v1_no_rpm(struct tsens_priv *priv)
 {
 	int i, ret;
 	u32 mask = 0;
--- a/drivers/thermal/qcom/tsens-v2.c
+++ b/drivers/thermal/qcom/tsens-v2.c
@@ -220,7 +220,7 @@
 	return 0;
 }
 
-static int __init init_tsens_v2_no_rpm(struct tsens_priv *priv)
+static int init_tsens_v2_no_rpm(struct tsens_priv *priv)
 {
 	struct device *dev = priv->dev;
 	int i, ret;
-- 
2.51.0
