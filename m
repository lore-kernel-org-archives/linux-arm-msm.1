Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398016;
	b=M68TsuQIleOVqDJggxja0jtbfDYxBE2o8K7xAwRJwgT2XlV9ijg4WAykWw4b/HsjB+Yc
	 r7k2yp2sxD64JKKGs9fVWLqzJOBHzJiZN/l12M38pO2vmGJ+ECNgmaj3eEDM8+GP9dB2l
	 AhRjielKwrTfleiO75arzPVEfX4xlioZoIHlYKosQEmyZ3SC4nXiXQ/HalkNLM0Le+01Q
	 Fe7fPwPRVd9xl22pjy3ndOTlQMpSy/AwaXpYI9P6T3XlC4QJeHlyTdUpOPg4syaAdNius
	 hrTb42cyYQu0Y46VrQsUpyTZSPeNHWzerURckFABNgvXUFugYP7YjJGOCjFCoBSwm6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=inO5c+2NRpGzTtQSXHFgAvhlXc9hM7LgLA83dSp1tzU=;
	b=DduZ40GXZtcZiKq8cwGV0JjzjhBSlV/AJGGmPvgTsuRl47TSAh6Vf8akRFlA+1pNtO9X
	 2UjJp3VWu0uahGtGIb1CFAfro741PtVRuQhYrrNiCpKkGJ+URP+baqkpvXFJj3rg/YWLv
	 fuOdth5GU70no5TnA63AlgiktevkkHrPdD8NVb8U8s2Eizg3dzRL7DH3h3beCTFBIGm/e
	 hbh9N0Ljo0Hjh3U96NDVJzjL+ggjHAb0dqQBNHJrZ+PPOcmzwpFW2n9nJJKwXmkuB+xO3
	 ct5SlJTno11PJeZV6rJHncrINmGmAfKtzhHep8EyH/G9BFfPxCIrF5KFvCCt0kvoTQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nR8HrPCW;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2D4606A893
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 11:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C2D4606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nR8HrPCW
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a35db2d6b3so23497155e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 03:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794398014; x=1795002814; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=inO5c+2NRpGzTtQSXHFgAvhlXc9hM7LgLA83dSp1tzU=;
        b=nR8HrPCWsXFfZTZ3yiLV7EmiUiMXM1cRx38vmcr86pa9Ymphkk1Hsa1sUVoftwdCxp
         GqvN1p2FFyC7a0rQ6azJaz1UhZVNIYKW6OdxslNAsIOzKdMX+oEuNwOTuxpBZc6FcKmB
         3uh0y8VOe8uviWTXakMG4GMHxhYaBJTIYT3kxyvetm/SeSAAEwPy3AGu7Cu81/J5lboj
         ImGHq5iej9A+f2T7pRgyGf85Gbr+8Zl+vIfe8DuPFEccDqg7CPVGa3Kp1ipQV1yGx/Ia
         EezLWnwcLNzDK4SRLubIvr2RvxWYa3lg6AF7Skt35VIS43jtd5Lq5mfc5XzAawCeTK28
         YITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398014; x=1795002814;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=inO5c+2NRpGzTtQSXHFgAvhlXc9hM7LgLA83dSp1tzU=;
        b=06BPh9eOqJRfuUcOUL1pCGRdz6xiUCPtjAOIQBHA4otbGg9BmP/H/T2b6idZEdXtE3
         v9Qaog69caFitAc6ikHRgFwLLp6jTrVLfEBTwcmCzazH32IoDsqXBfcAjsgcnt1/HRzt
         91MHCnlT7FQ8DqW2dcbvNJlBKZK/LZlNtJbJn62oxVNV4bo8XhQWR+dAMifXbhvL199t
         4ULtekGoQIE6l8C39VMeb7Ty0DyxX+E/JIX5MkO4Hsyea4eN7xc0ntzdNvWjABPo9oZV
         XJpLwAglYxR67p7VkdQ9O99ZOML90gSWMQRyvQDzWN5u4rb6gobOqSWQ3htyJWRkWpkA
         7zHA==
X-Forwarded-Encrypted: i=1; AL+hErEe5ojGl9fJAARA5qDDext/vkJHHpXlTp4AM+p1gQkdSMIqyHEvGXmpYXh9lemXUJrsI+BJgk5BinrdOkeK@vger.kernel.org
X-Gm-Message-State: APuU4Z/RlG7BC0E/Vv1c7L3LYCmxiXh1B1vEYYLgz8uaEPRYljpDtbYC
	wVpkadaHL5LUFR1de3CFO+gj2fMmcHageRQy4UQeBJRj9Bgv9HNLs0rG1gvPR9TJCvMYiRHuUA=
	=
X-Received: from wrpb11.prod.google.com ([2002:adf:f24b:0:b0:48e:1312:61f9])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:6308:b0:4a7:b304:253e
 with SMTP id 5b1f17b1804b1-4ba09381867mr42238995e9.22.1794398014308; Wed, 11
 Nov 2026 03:53:34 -0800 (PST)
Date: Wed, 11 Nov 2026 12:53:10 +0100
In-Reply-To: <20261111115303.3749380-9-ardb+git@google.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111115303.3749380-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3296; i=ardb@kernel.org;
 h=from:subject; bh=CcqzZVt/h+BPdElOQ8MZ9n76eaBY8LRWeodUS9k8nn0=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIetLuMbTrriNDJ8q5vmpbdh8aCLv8+UW3+9JfTIMCqiwn
 SX+IKqqo5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEzEw4uR4fCaaYJPGTYZCZvb
 WczKs1oh3qSUMVP0ZNX/n+fztpuekmP4X7JLd36Sxpt2LqU57YzTd1y7nSm4bN4nblY3o6AEN91 QNgA=
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261111115303.3749380-15-ardb+git@google.com>
Subject: [PATCH 6/7] platform: arm64: lenovo-yoga-c630: Disable the EC
 interrupt while suspended
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The EC interrupt handler reads the pending event from the EC over I2C. If
the interrupt fires while the system is suspending or resuming, between
the late suspend and early resume phases of the I2C controller, the
transfer fails, as runtime PM is disabled for the controller:

  geni_i2c 884000.i2c: error turning SE resources:-13

The handler then returns without having read the event, and as the
interrupt is level triggered, it fires again right away. On the Yoga C630,
this shows up as tens to thousands of these errors in about half of the
suspends.

So disable the EC interrupt when suspending, and enable it again when
resuming. Pending events are then handled once the I2C controller can be
used again.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/platform/arm64/lenovo-yoga-c630.c | 34 +++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/arm64/lenovo-yoga-c630.c b/drivers/platform/arm64/lenovo-yoga-c630.c
index cad40c58c55b..2776063bfb58 100644
--- a/drivers/platform/arm64/lenovo-yoga-c630.c
+++ b/drivers/platform/arm64/lenovo-yoga-c630.c
@@ -10,11 +10,13 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
+#include <linux/interrupt.h>
 #include <linux/irqreturn.h>
 #include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/notifier.h>
+#include <linux/pm.h>
 #include <linux/slab.h>
 #include <linux/platform_data/lenovo-yoga-c630.h>
 
@@ -216,6 +218,7 @@ static int yoga_c630_ec_probe(struct i2c_client *client)
 	mutex_init(&ec->lock);
 	ec->client = client;
 	BLOCKING_INIT_NOTIFIER_HEAD(&ec->notifier_list);
+	i2c_set_clientdata(client, ec);
 
 	ret = devm_request_threaded_irq(dev, client->irq,
 					NULL, yoga_c630_ec_thread_intr,
@@ -230,6 +233,34 @@ static int yoga_c630_ec_probe(struct i2c_client *client)
 	return yoga_c630_aux_init(dev, YOGA_C630_DEV_UCSI, ec);
 }
 
+/*
+ * Keep the EC interrupt disabled until the system has resumed. Its
+ * handler reads the pending event over I2C, which fails between the late
+ * suspend and early resume phases of the I2C controller, and as the
+ * interrupt is level triggered, it would fire over and over again until the
+ * handler gets to read the event.
+ */
+static int yoga_c630_ec_suspend(struct device *dev)
+{
+	struct yoga_c630_ec *ec = dev_get_drvdata(dev);
+
+	disable_irq(ec->client->irq);
+
+	return 0;
+}
+
+static int yoga_c630_ec_resume(struct device *dev)
+{
+	struct yoga_c630_ec *ec = dev_get_drvdata(dev);
+
+	enable_irq(ec->client->irq);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(yoga_c630_ec_pm_ops, yoga_c630_ec_suspend,
+				yoga_c630_ec_resume);
+
 
 static const struct of_device_id yoga_c630_ec_of_match[] = {
 	{ .compatible = "lenovo,yoga-c630-ec" },
@@ -246,7 +277,8 @@ MODULE_DEVICE_TABLE(i2c, yoga_c630_ec_i2c_id_table);
 static struct i2c_driver yoga_c630_ec_i2c_driver = {
 	.driver = {
 		.name = "yoga-c630-ec",
-		.of_match_table = yoga_c630_ec_of_match
+		.of_match_table = yoga_c630_ec_of_match,
+		.pm = pm_sleep_ptr(&yoga_c630_ec_pm_ops),
 	},
 	.probe = yoga_c630_ec_probe,
 	.id_table = yoga_c630_ec_i2c_id_table,
-- 
2.56.0.611.g1030f0b940-goog

