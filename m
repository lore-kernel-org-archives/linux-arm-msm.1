Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B274854E3
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 17:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787075894; cv=none; b=F4efY66oF6krP13pRuvUItUWJM15ci59B+mq6Pcbjv5/s/TNY57MwDdjV5RZ67IyrDHJzOwv9skXVHBqWzVgMyxGUKqAZzyQr/hSeCIwv2xGI3R1QiYBp/8rR9aCF0qRUifRZXm/9cXCc7j9xLlKKa/fj0CmbY7VVmGLq7BB8xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787075894; c=relaxed/simple;
	bh=PteXAD1DPggMcw8dT/xS22YuwTISejXEqBeq+NyzCoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lEnxcDNwoAIxiIDyJXGwrRuIysm/XboDpJ4Ey8srPT3vkJ3QXDc72Ea1ex4pZfEiEqHenF+2rr+UA/US742ppHr2Zzjxd3aeva5VqesMZkT83+ooudemT8XWCUQMXelEl6nkqc7DDqBpjzAofCr6/e9DMFU+SeOEUphhIRwmKfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PmUmLlRg; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PmUmLlRg"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d530328efbso1133785ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787075892; x=1787680692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OVwPxM1zwUuisKDv++BvBZsLlEbaJx1tUb1t0BisU8Y=;
        b=PmUmLlRgrMph6z6p9pYvFXEd3ULNL50PI0qWEnDIn9tFCOi7Sx9wGh9iBvhEVGm1E+
         Y4/LofSomCbm/St59kMy3GoYfvUjDDIlvLKUTuOn9GxUW1m2GFd4K98ko64aMPpzwEPw
         8lIF7zGTeqDTL+aTtYCyV3LLswH7ps6RPpmJwcPr3rzBdnm5jbYR+YXJ+rrNQW57ZbH5
         /d83208+aKZoKucfZTF270FF/FJbWtynkGcsDMcFKqazS04QcHxM2TAmSl9wcEFVrfpv
         azvexelKerHh/67vfLa5PxCdKgH/c1KpreXyd+KIU96C6A272WuRcXQPpt368snsrDjF
         1spA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787075892; x=1787680692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OVwPxM1zwUuisKDv++BvBZsLlEbaJx1tUb1t0BisU8Y=;
        b=hqM8rMmwrB0OdsD2vpvycRrPjGYDJfweZoIH3De/PyKP41RNadtErke95Xg6Ylz/Cy
         aFWcutA8Nr9hBZG7+qZ3v8elCTGsYhkfPt4uavjHH+zlzKaY9Mbu8pNE0pmnntn/TWA1
         BtQ0ozn6HWO/BDKBjCxt+DaX0J01PawBG+kl06yuwBucxII3I+iWWQ9v7ENmSlYIPKXv
         ViL11xyIa9Kt4Bk5beGupeiUaKc86Vef8f1tUZJ37SeKOYB/QNWR4k++O2F8PJy3+6AW
         uSYkNX4gTXna221lgMfwSb3UolJ+FlWOE86124uu7eWyWItL87tRAtcB2V1bgFeMsqY7
         vAoA==
X-Forwarded-Encrypted: i=1; AHgh+RqopRka6Qu2+BSIu2HwOp9RSC8PeAmcgiZQkrK08n6cEe7N+SuxYx7efrCP6pz10TaViAHvC6jbrcyNnHh1@vger.kernel.org
X-Gm-Message-State: AOJu0YyOILthw8WDQOU5CauaJ6iwFcl7roblVrNCD12kbK8B2QQWJVR4
	kfLeBgfVyP106xL2kqOAzqOZRlbT5igy3kvzbDupfr/BhmqWyZUR7g0tfqPdeoLgbSSoZw==
X-Gm-Gg: AR+sD11ALKM0VHy8ZAg4HYxX/cz13fLQEZCtP9udnqhWhXQ8yG0q0Ef2Gum2Ywjl0lH
	y+CZNfDUKkzMcNf5oxaS4Vd2EaMHTIX50UIUarM/pTDbemb/wGPgybigNIPf2ZPnOeDXjzSXGxi
	4rnPRWteDstOn2D80B60WZ1ztKeAco6QTS5ts3mydNQh1W5yXKmyCMcR8bEwIDfgMxovpFo5x0X
	VNH3KxOpbJnEe0OzqcrVlgGGDnUwa83+ENO1Yv1wuoPtC9+OGSS9wpBOCOxFMEx3lz18Wzs+LcW
	TJGUiTVqACUwO5T/ZLkFrVaZER0DMcd95IQrCQfaC8DWO0WgmYwzBE5lAfhdTgnEs/NL+hZGunV
	Go6z3JEEU/yVVmFOM6R2vTpG0OQcq6Sh2NVKtHSIrmaElF9/0jjrpaD0uCFnQXMp61hShBS8aPP
	Ec+JYvTsDpwSPt2ta2UsTYoqpHwoc3ZU3kTGajCzX0OjZ9AviDatbYCNAWCBZOtTuD0dgYr81o/
	b+iXwpNH3pgTeGZt/HLfb8SCWQ=
X-Received: by 2002:a17:903:388b:b0:2d0:401c:2ebb with SMTP id d9443c01a7336-2d5c4ee9c5dmr151317545ad.4.1787075891614;
        Tue, 18 Aug 2026 10:58:11 -0700 (PDT)
Received: from localhost.localdomain ([240a:4282:4801:1b98:2558:3176:8229:fc85])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e8dc12sm17420645ad.56.2026.08.18.10.58.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 18 Aug 2026 10:58:10 -0700 (PDT)
From: Liu Zhenlong <dragonliu2018@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: konrad.dybcio@oss.qualcomm.com,
	stable@vger.kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Wolfram Sang <wsa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] i2c: qcom-cci: fix device_node refcount leak in cci_probe()/cci_remove()
Date: Wed, 19 Aug 2026 01:57:50 +0800
Message-ID: <20260818175750.4205-1-dragonliu2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815140931.53297-1-dragonliu2018@gmail.com>
References: <20260815140931.53297-1-dragonliu2018@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The of_node_put() matching of_node_get() runs after i2c_del_adapter(),
whose trailing memset() zeroes adap->dev and thus adap->dev.of_node,
making the put a no-op and leaking the node on every adapter removal
and error cleanup.

Use a devm action: the pointer is captured at registration, out of
reach of that memset(), and devres runs the put once on probe failure
and detach, replacing the three manual of_node_put() calls.  The
setup loop uses the scoped iterator form so the child node is released
automatically if devm_add_action_or_reset() fails mid-loop.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Fixes: 02a4a69667a2 ("i2c: qcom-cci: don't put a device tree node before i2c_add_adapter()")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Liu Zhenlong <dragonliu2018@gmail.com>
---
Changes in v2:
- Rework the fix to use a devm action (cci_put_of_node) instead of
  caching the pointer before i2c_del_adapter(), per Konrad Dybcio.
  The pointer is captured at registration, out of reach of the
  memset() in i2c_del_adapter(); the three manual of_node_put() calls
  are removed.
- Use for_each_available_child_of_node_scoped() so the child
  reference is released if devm_add_action_or_reset() fails mid-loop.

 drivers/i2c/busses/i2c-qcom-cci.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index bdeda3979c48..d3528c7d15bd 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -497,10 +497,14 @@ static const struct dev_pm_ops qcom_cci_pm = {
 	SET_RUNTIME_PM_OPS(cci_suspend_runtime, cci_resume_runtime, NULL)
 };
 
+static void cci_put_of_node(void *data)
+{
+	of_node_put(data);
+}
+
 static int cci_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *child;
 	struct resource *r;
 	struct cci *cci;
 	int ret, i;
@@ -516,7 +520,7 @@ static int cci_probe(struct platform_device *pdev)
 	if (!cci->data)
 		return -ENOENT;
 
-	for_each_available_child_of_node(dev->of_node, child) {
+	for_each_available_child_of_node_scoped(dev->of_node, child) {
 		struct cci_master *master;
 		u32 idx;
 
@@ -537,6 +541,9 @@ static int cci_probe(struct platform_device *pdev)
 		master->adap.algo = &cci_algo;
 		master->adap.dev.parent = dev;
 		master->adap.dev.of_node = of_node_get(child);
+		ret = devm_add_action_or_reset(dev, cci_put_of_node, child);
+		if (ret)
+			return ret;
 		master->master = idx;
 		master->cci = cci;
 
@@ -604,10 +611,8 @@ static int cci_probe(struct platform_device *pdev)
 			continue;
 
 		ret = i2c_add_adapter(&cci->master[i].adap);
-		if (ret < 0) {
-			of_node_put(cci->master[i].adap.dev.of_node);
+		if (ret < 0)
 			goto error_i2c;
-		}
 	}
 
 	return 0;
@@ -617,10 +622,8 @@ static int cci_probe(struct platform_device *pdev)
 	pm_runtime_dont_use_autosuspend(dev);
 
 	for (--i ; i >= 0; i--) {
-		if (cci->master[i].cci) {
+		if (cci->master[i].cci)
 			i2c_del_adapter(&cci->master[i].adap);
-			of_node_put(cci->master[i].adap.dev.of_node);
-		}
 	}
 disable_clocks:
 	cci_disable_clocks(cci);
@@ -636,7 +639,6 @@ static void cci_remove(struct platform_device *pdev)
 	for (i = 0; i < cci->data->num_masters; i++) {
 		if (cci->master[i].cci) {
 			i2c_del_adapter(&cci->master[i].adap);
-			of_node_put(cci->master[i].adap.dev.of_node);
 			cci_halt(cci, i);
 		}
 	}
-- 
2.55.0

