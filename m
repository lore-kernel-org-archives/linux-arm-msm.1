Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653280;
	b=if8lz0w9A30i+r9YcrVNPZr+NSsznY4AyNWyHFsOUAzYG/9bk9/vuA9t+RmACUZkc3TW
	 mLE4DjIpnYeBJfIbmygXuwhDY1HBbfsZNqvKRPGAXUf8BD9mCzZIhlpwkSqmVhz28ogUq
	 EbHEskStJ7euaNX9hIqHu03rIfl4eEYI+atetUs9CS4aZ/sq8OT5xWvR+WL28/8r2ZfZH
	 Gy+tc0JYq0iWsL0KoMrQMIhlhKX5YKegKt+DAglpGLFrRbpJuLvALwz8obSWo67jaVMNK
	 +Tz2dG6KqUFYAKu+JTxXduQn9RfzC/kWsuWr4VxIK62F9lMPxJhF4vhaP4uMEaMJPvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t8ltOwjxA6KeKnGObAuyhyG+hzNLbLDdGdsDrm0q03I=;
	b=CFSNe2hIVlv+WR7gat68wYJdXfZshJAnEbRkzhMku+0Wt48G2CA6M9bljsJttWs9tIgB
	 chTp+wrB60TBnUVU43AGjZcXf50G0tpuwJzG1/FJ+Q+jzR83Qd1d5O4ovG2m7znrB8Rey
	 MrpIAzdG95Ytdm9hQ2KExRe7a4U2a6bpueHk+Ibzgym0nqyZ72VJaymG0JXhPD1Rm1RPh
	 LkSs2Z1JUZXnjKN1V2CAOFmO4LNqT5Ms9VOuN1fJAU+OOlVJqD2ct2LBbev0NXAxzwmIj
	 mHknnGTo9NsxxmTaMC8BoVE5M/GKsj1uxTWCP2fNiPyf+tbrzr2oMN4vSpTeATGi77g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CfGCSdab;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155E5606A31F
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 155E5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CfGCSdab
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1438d9363fbso506245c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 00:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792653279; x=1793258079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t8ltOwjxA6KeKnGObAuyhyG+hzNLbLDdGdsDrm0q03I=;
        b=CfGCSdab2SO2BZvAkr8SlDMq+axi7u/ywHZv15FNsOpdUqbJSQQFIzb6Tn6UrvewUd
         rz4MziqbMsrTh1X6wZx8j/7+//73PcjF/+gMRaGxDo7V8pwDJ9+qUGvtlZQ6Py7wOrp2
         Mh7GYYO7o8wk7HWI38hcCKn5vAY4Miu7HhBzf1/d3XwVdYxaDe9O0pIWE738ZabjktQF
         yTmAINEJeOO/1H+LvfTVsUNkBOu9MltCB7XTTSvzZimNurGpwYl5m4MSDCtexlJtMBcY
         5Cip6/qeuAiuvTgK97HF6bjIsBfhoafSw5RAOeKIg4KCSnaTjQL0OPQNKHr5NE1TxKO5
         Rifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792653279; x=1793258079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t8ltOwjxA6KeKnGObAuyhyG+hzNLbLDdGdsDrm0q03I=;
        b=xiIUMzA1gUW8wbYJ2H+2zfo9K2kA8qzoksjl+E90n2x9r2htTb5obQF2wPsfKjGR2v
         BDeTWnJMmd2lE9+0J4g0oRVhhTVQgzclhXe1jAKshgaICDRqebic6GITO1aWExrpiMoe
         qUB+a3o5T4YTrOlXE9aXjICYJjmweCbwLc7hG6dTe5aYkdV5ri6DWvLogVpuiyMXdnd5
         dpD7CKoyjp+eO0BfYRWFyApy4diFertRgmGY1Bco49Wz7NNJlYund0LVdWdFBSf57rhC
         7KETmsoqeKlMVuOXE0fXiBs/HooS7G/3uHq52UgOPKXSbxYaAmITf/bySANXfHT+kEAR
         M5/g==
X-Forwarded-Encrypted: i=1; AKwUvBwbh5a8i4EzQ91yYGMo6jM5aOoxztHH1w1LazXYzuUK0oNdIrzzpRbX0HQpr1c3IdD1L9RPKxowodEQBzwV@vger.kernel.org
X-Gm-Message-State: AFq9FYJnQMHUGlaTh1mQ2R9pf9A7q21WzFJMe1ZWz1zFkZ9RAmlgR7Bz
	qRd9sgD6MasWvJ9wmc9WwrzkFFCONybxfjYTRk8bbJ78B+d9/rRHUMN5
X-Gm-Gg: AYBFou2P045oZaPSkHFkjgEEk/8fmZwB+maWOBz/WE/T1D/MFD762PHrMP+kTBk0pxk
	7y8669r7cAQ+fNmOjGYA1+XycBtRTKg6lbvYcbiKqGpjLAX7PMN7T060Nef7pPW0/hCAaHXoUCb
	DmOnhkyomCnNZM5pdTb0SljAngsFFnYZjKse7+acjJLNyRzav9gKcIJoPGi0VQd3DIV2pwpxj2D
	ICof2pHYpXV3HRoNlMAioOmp3ceDB3+Hh4+AapZyNzjZ7GykMm/FEjNNgfxmJFevTo17eUKqtFu
	J9OW/TujPqYd8iik1KR6xQ+14Mx29KkLK1oqGBiUc1dnyToWURPbxgaAxR3nphlqwvBfClMLOjK
	mJBNc+Bzp3hVmkyorh6Bn21ce8LKW3d52EEg081Un3W43V9ndLe6nTCBquAID2jHpE34vib403D
	rDR5mW2P4UB48m9FSDI09/TgRFbeY8Bc0j0PicMTUC1Xzr7469G7Yet4r9xPo5iagRP8t7VWpkq
	y0heL6fAl1McIhBC2PjAkK0XAv69wHFTZ+evtGRHZIF2r8fD0YE4A==
X-Received: by 2002:a05:701b:42d3:10b0:15b:1959:15e0 with SMTP id a92af1059eb24-192f2d2203dmr2161433c88.4.1792653279017;
        Thu, 22 Oct 2026 00:14:39 -0700 (PDT)
Received: from fedora-x1e ([210.89.35.119])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bd6b7ccsm11112321c88.13.2026.10.22.00.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:14:38 -0700 (PDT)
From: Saikiran <bjsaikiran@gmail.com>
To: loic.poulain@oss.qualcomm.com
Cc: rfoss@kernel.org,
	andi.shyti@kernel.org,
	sakari.ailus@linux.intel.com,
	hansg@kernel.org,
	bod@kernel.org,
	mchehab@kernel.org,
	vladimir.zapolskiy@linaro.org,
	jishnu.prakash@oss.qualcomm.com,
	birk.skyum@pm.me,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v1 1/2] i2c: qcom-cci: Select pinctrl states during runtime PM
Date: Thu, 22 Oct 2026 12:44:17 +0530
Message-ID: <20261022071418.26895-2-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022071418.26895-1-bjsaikiran@gmail.com>
References: <20261022071418.26895-1-bjsaikiran@gmail.com>
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

The CCI runtime PM callbacks only gate the controller clocks, leaving the
bus pins in their default state while the controller is suspended. On the
Lenovo Yoga Slim 7x, this can back-power the camera sensor through SDA and
SCL after its supplies have been disabled, contributing to brownouts on
subsequent power cycles.

Select the sleep pinctrl state before disabling the clocks so that the
configured pull-downs can take effect. Restore the default state before
enabling the clocks on resume, and return to the sleep state if enabling
the clocks fails.

Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite)
Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 873e901a23d7..fba5f664eeaa 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/pm_runtime.h>
 
 #define CCI_HW_VERSION				0x0
@@ -474,6 +475,11 @@ static void cci_disable_clocks(struct cci *cci)
 static int __maybe_unused cci_suspend_runtime(struct device *dev)
 {
 	struct cci *cci = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pinctrl_pm_select_sleep_state(dev);
+	if (ret)
+		return ret;
 
 	cci_disable_clocks(cci);
 	return 0;
@@ -484,10 +490,16 @@ static int __maybe_unused cci_resume_runtime(struct device *dev)
 	struct cci *cci = dev_get_drvdata(dev);
 	int ret;
 
-	ret = cci_enable_clocks(cci);
+	ret = pinctrl_pm_select_default_state(dev);
 	if (ret)
 		return ret;
 
+	ret = cci_enable_clocks(cci);
+	if (ret) {
+		pinctrl_pm_select_sleep_state(dev);
+		return ret;
+	}
+
 	cci_init(cci);
 	return 0;
 }
-- 
2.56.0

