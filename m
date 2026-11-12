Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511649;
	b=XC5+qImOmjcMc1JlNuGAazs2L1JFQow7Xo3RlYs3Am0tSb+2IQMEjN9RCguqAIdTVMHs
	 Hx1TBl0OjEYgzgk5EFBGFSzvYo8BvUk/0rMX3EFrwAEyVLHiiSlLQfZ+8XW1lKcBG7bYq
	 PWxncELGMR67lnLIYB4928f2B9CIz1dgn1IN6yntbaCBNv43NqZnXM96Fv6QguHLNGhBj
	 z0PIPY6KWKfsGmbNfWVJjXaKo4AVZ9jYNHIKC0OIdGDyiLs8gPot8Lc+1Alxyc7qs07Gr
	 U8oHInJgnQs+rxa+OObwBR2ACFoFgJBYTvGvzjeAxSS3Xp56VNOWAuC68873hGWTjzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WK76SX0nrcCBNXP9LIGbyNxGyxl1rLl1GLyCozITqPY=;
	b=ZcrIbRJdVpqNCwGX6vyD/cZJDZPlK+iapRNLp0JB4fHgpjFhYby5AXHwh8pO90dj3Xoj
	 h8vS/zZkGnNnEwvOnR9soGBisdAxs9ZabeS9CkskGL1nsV6S8xqhLplee/ZDi7PjM1YpT
	 3YqRCOjD1XprBMIX3OF7tEm5cCnQw51q/yJ+vO0hp64cGC2N227EDuxDr+O2NW413U+vC
	 i2ybdF0RBYmdEOWaZRIoO8PYe3fIdI0xRfGp8UScErcbpubFGVVOMy4XyMNzIgeTtjUO7
	 mH+fOkPXNqI3xb0tmgQeYmiGuMyHlfuLJxvArYM+AVPF9TcV8oAXPRufgdtJsB2pGQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WG5ACeJA;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55C5606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 19:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D55C5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WG5ACeJA
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so99987c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 11:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794511648; x=1795116448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WK76SX0nrcCBNXP9LIGbyNxGyxl1rLl1GLyCozITqPY=;
        b=WG5ACeJAfsAqI/SNo4EQzMNroNtqgr9YtZsBgMQPriWcH3f0MVw5r34UoB/ls3CUCi
         0AINdQ6584CpYLZwc6rxWtc2SykkFLUSRQ8b19368uBwvvXS3rvFLB6wIQXXm0MOuc75
         RyXvi3kaJ2XdVHBEH3p8FNm6KFDkv60AA6ftw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511648; x=1795116448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WK76SX0nrcCBNXP9LIGbyNxGyxl1rLl1GLyCozITqPY=;
        b=gj7pEu7Hpda8jWog7N5F3fNsPvk8HwxBAIVdqZwJkjv3p2UY6h48dS+5ztSQJzAnRX
         By5AR5sfhc4AJSlYYkxe/DlAKp5CN4AzDU1opkHL1fb8nTGhuUgz/YfBp7wpy0mohYck
         qdBh6EQCGHzv3RbuVsx+GVGLtkj9zD9yHIdo01kbueb/kVYapLEAU+RdELvnDskcsDoR
         3UTgy+E5dJ0Vu7QrhET/ZEHUs50HhzREDJkGswACj0hLwU4jUxjElUI9l043n3KHTCTW
         JaOukmWYBuFK+DkA5ZReRXQ6nDoaMlic3ZpxhU3VCzN+PpWkc6LRdNJcPDZN312lDLzT
         YwKw==
X-Forwarded-Encrypted: i=1; AL+hErE5s3DoSdUvzy/tCVX19U9Ux2H719uSMdYAACOw1wl5dPv34nQEZdXTN+t5UCdzpFO82kU9csK6GOWkmns0@vger.kernel.org
X-Gm-Message-State: APuU4Z/+NlmEoO4/RFn7AL1XGzZkRxOLSk2RaMNvUi9DLP46fORb1Lyq
	kPf8EJp7JfYvZtZLQ5mfSreZxvgiWYF5OucW3yDio3oKkw2Y8xTpieJdD/PO4R9N2Q==
X-Gm-Gg: AYBFou1MNog6f1yQ25jwXQwsCs7R+hS27hZA5Zjn4AvGfdLXlOs4Qgu2RCyLO2d9XVc
	N9nr7EbrdomZipVEOscDF/PcNumd1Ivj9VrYSf/d6/Mr4E/3VpC8Bucvetv0DYtZFJ0yF+PfhZu
	WZrc8/I35CkVuLA8ucuS0cpl4kf4N6NpUKqUIIEgdWfPoPBR68yk4p+fh1LpPiVPQtNno2SxXfP
	51nMGrHF7OIfLF1x/gOBpWxD5DnAvjoltGkbjPLCKl8ivXvMhM7SWCfQ9PVwp989vvvdC5wJRpg
	l+CmDtuGUADouQBv6hQ7ZCl1B29DAlNlTCDRbQICzkxNcYztqamRLUz9BqmyQ69QXMx1i/bSO9R
	tAo/AAuszpcXA9rSaEgrWW5x3YxIrf+4gvgEAJge/8xkix6cUNDzXpLAb8f+xbWfqeevPrEIOe0
	DAkyjre0rDgY4pwXbexJhKHVjSZUGmfLkdjncYn4nA4Q1ejxVaw/LF9nfpSrrTvtw2hZJtbxoOa
	1oTnGrjiB4fe8EszMRo3yd7hsSbYEeYtHuWrQMYKyfz6WoDHAbpj+VFxW7Mi0GxNsjxkgIPdKQ+
	8EDczYOtBWEmjZy7v1fN3TT03fslUZ55+ju7fmsD6w85l1rLhQqE9FHcaggUeEiByLWf5tpNTMw
	Wb6WxypeMHXWpj/k=
X-Received: by 2002:a05:7022:3704:b0:189:d6bf:7eaa with SMTP id a92af1059eb24-1b5030d404cmr428948c88.16.1794511647718;
        Thu, 12 Nov 2026 11:27:27 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:5446:563c:ac92:43a8])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b5031bc518sm886774c88.15.2026.11.12.11.27.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 11:27:27 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH] media: venus: Discard pm_runtime_put_autosuspend() return values
Date: Thu, 12 Nov 2026 11:26:50 -0800
Message-ID: <20261112112650.1.I574fc3def9965f603755a968ae88309aafdfa285@changeid>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Propagating the pm_runtime_put_autosuspend() return value to callers is
not particularly useful.

Returning an error code from pm_runtime_put_autosuspend() merely means
that it has not queued up a timer or work item to check whether or not
the device can be suspended and there are many perfectly valid
situations in which that can happen, like after writing "on" to the
device's runtime PM "control" attribute in sysfs for one example.

Accordingly, update the Venus vdec and venc drivers to simply discard
the return value of pm_runtime_put_autosuspend().

This will facilitate a planned change of the
pm_runtime_put_autosuspend() return type to void in the future, similar
to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
type to void").

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
This patch was originally sent as part of a larger series here:
https://lore.kernel.org/all/20261006161337.4.I574fc3def9965f603755a968ae88309aafdfa285@changeid/

I expect it should be merged by subsystem maintainers, and we can make
the return type change later.

 drivers/media/platform/qcom/venus/vdec.c | 10 ++++------
 drivers/media/platform/qcom/venus/venc.c | 10 ++++------
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 6a43ea191da1..35c1b6ec1f9f 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -644,12 +644,12 @@ static int vdec_pm_put(struct venus_inst *inst, bool autosuspend)
 {
 	struct venus_core *core = inst->core;
 	struct device *dev = core->dev_dec;
-	int ret;
+	int ret = 0;
 
 	mutex_lock(&core->pm_lock);
 
 	if (autosuspend)
-		ret = pm_runtime_put_autosuspend(dev);
+		pm_runtime_put_autosuspend(dev);
 	else
 		ret = pm_runtime_put_sync(dev);
 
@@ -671,7 +671,7 @@ static int vdec_pm_get_put(struct venus_inst *inst)
 		if (ret < 0)
 			goto error;
 
-		ret = pm_runtime_put_autosuspend(dev);
+		pm_runtime_put_autosuspend(dev);
 	}
 
 error:
@@ -1200,9 +1200,7 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 		if (ret)
 			goto put_power;
 
-		ret = vdec_pm_put(inst, true);
-		if (ret)
-			goto error;
+		vdec_pm_put(inst, true);
 
 		ret = vdec_start_output(inst);
 	}
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 79acf7c1ec9a..3c7c24dd7159 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -617,12 +617,12 @@ static int venc_pm_put(struct venus_inst *inst, bool autosuspend)
 {
 	struct venus_core *core = inst->core;
 	struct device *dev = core->dev_enc;
-	int ret;
+	int ret = 0;
 
 	mutex_lock(&core->pm_lock);
 
 	if (autosuspend)
-		ret = pm_runtime_put_autosuspend(dev);
+		pm_runtime_put_autosuspend(dev);
 	else
 		ret = pm_runtime_put_sync(dev);
 
@@ -644,7 +644,7 @@ static int venc_pm_get_put(struct venus_inst *inst)
 		if (ret < 0)
 			goto error;
 
-		ret = pm_runtime_put_autosuspend(dev);
+		pm_runtime_put_autosuspend(dev);
 	}
 
 error:
@@ -1275,9 +1275,7 @@ static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
 	if (ret)
 		goto put_power;
 
-	ret = venc_pm_put(inst, true);
-	if (ret)
-		goto error;
+	venc_pm_put(inst, true);
 
 	ret = venc_set_properties(inst);
 	if (ret)
-- 
2.56.0.611.g1030f0b940-goog

