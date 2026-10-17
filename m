Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FFB3B95F8
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 04:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792211801; cv=none; b=nikjejww6sMi3XiQ496e3qVfQ665TNDKUh0GRPqpx76wKf4c2vWtgyQRFLI7rqmM/1bl2wPnn5hsfJqD0tON8WdRrS20rnBFgbhs0tm+frxgmv2EUyoAC4gjjU6Ea/+SIgB1ZmytLAVcXV0G8SURrdX8+a/sK4JNz/mJN3JJNcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792211801; c=relaxed/simple;
	bh=T05qU3QP38O2C/gkrcm6SRVlPYdACpGqdMD1WnF8jI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s3XL+tgQKPxXmoDsm8FmiM1036k7pFfkv/CyOM2rTKTB7z3J/BT/1816RDM7ln/UbD3g/leUkmvRd5U5fErnqcHQLrWcwdkC+IAVVh+gxsRED+ONadxXm51RgTmOWjQwIAGC7cQ4sQhc301pLLGzodMwSh4oIT3SZ6zcCjP9vUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+Fa2E54; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O4nVzH6X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+Fa2E54";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O4nVzH6X"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30OxP942389
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 04:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ApuLXzOKhLv
	eYlVUddCl2eITtzV0C5lAoBiRTgJqkhY=; b=O+Fa2E54y5xOUlqS72RXOq6R7x5
	9uVTSXGVvj++suz5ZwLv510fnwOgxc6jx25xhDr6F2cWzV/x2WtdShzr0v1xtKuz
	amJLLJnrNbXufAj7Abcugd70G9RMrPMxbF3bhFWCgfuvF8GUvvGNMVivA+db+W6w
	PGQ8ADNhcEGQtxRu1JMAHZTlfPAppCWS2mN+a/egXzzYwucIvlVmPjmpqz2xrwd+
	7umj/CQVDS4s26UKJft5VlTuUFlHw+m+sNdnZZcClIzvNzdnGmigUcyH4NdNkFt6
	yDiqUBAG6T06G4iwHMbDQLX3kBL6WOnT8R23vbXx5cehCSHUi4y0r+St1Dg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbyys087r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 04:36:39 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-154e9d2d94fso1635436c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 21:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792211798; x=1792816598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ApuLXzOKhLveYlVUddCl2eITtzV0C5lAoBiRTgJqkhY=;
        b=O4nVzH6XvOaKzu88AzAccer45ucJEHXBrGMijRdXfzPNo0wSMKJG3l1XGDIKkFfF0v
         +Vn/jeaurUwwz047qfyEXVNrkRO8PsxvmrBaCqo2xGpkFsYCuwqFj9p+/DcE3voZJ8rn
         Bea124KfOpUBGsCx7CpkGMs6JNcoocvz7aU8B13osq0RN9M+3ljeNfQzoqVCArDfUw1o
         X52i8h9d15pFaPEyb2cTqfihLWP3JaeuDf9lYuz/3WThRFE7tYHOyosZJQCmz0ssmaIc
         ZOM4J+6rWM+/LjP4kj238bEe4EStASH0z7FNqYfvi6mE7Lk/BsWqjF3JP/H3s+X1pqNm
         2P9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792211798; x=1792816598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ApuLXzOKhLveYlVUddCl2eITtzV0C5lAoBiRTgJqkhY=;
        b=OwqUNIePzXe509rzHPAWPBbScql1sdLc4FwSNp3iKCNmB9fQp3DA2LgvwhSdJYysJ2
         1WR+I4dopv9QvhlMyRjYbiq5N9NtPwLX4RTJZ+xzWu4XIKku3+4+pQf3zucrPQXdIxfF
         u6Wuj7Bv4JjmPUBA63smrE70PzxjgCHQBduW7EsXYTJUkzNOcx0xJbdqWbN+tgi63UPp
         aGNAdGCt6ZHkzvzpjKb6bAyzFRaYbhwVs3ldpq7Wqu6tbUyP+V0mCeifdfrxp9+xVqhm
         AJcfwTZGLSv+COVtExLC68rR6V+iB4JOXurf7v287lWXjvQyP/BVgCswx8oCJth9ZQn3
         EE4w==
X-Forwarded-Encrypted: i=1; AKwUvBzMVeqr2MtyyxQcKXiARNl37BdSlM7ZfNFMrP74WQMVzhpSZoLWW7eVGcY5L/JuQPt8Swh0bYjC9KSwEd2d@vger.kernel.org
X-Gm-Message-State: AFq9FYI/x8bKnRtcyXwDNtyVs3Z6lidEVcYdUHWP27zcYP+RrWut/bNZ
	GnZWxh2SC33deigaC3xigGwNCLo9s5DaSu77itc+Cl+PdKcxD6EPqSa/rabWzmSSBDvMmNxjsXI
	9IAfpB0pJNEOMDC8cF1w5KjEqEDRcafbr4iTvi/MowfZqwLid/k+0K1Y1TywMWfGEGZTL
X-Gm-Gg: AYBFou1ZDvwEYG47G6tNnTh39esyfSslqJx5A1+U7aPs4MVpWwvHzQQiHMlY8DjRcVn
	n6M9I8Ao8zkmagSNgajmHuWU1vilrfNUf1MPc8gU4aMApjAosOA/7TEAmLxqHuDiQfLbZ8sNw/K
	ubv2Hl17BNGpmFXFPgYP4e94kZ0JyBTPS/BMg8sulSzjLWU2rz7GKjeucFu4ftqA3Nm/HdnpM7n
	yO75U6L6nhYInOV+IUPrSpJPW8mV5C+mErjKFV0HIcxyGJwXiVL1bOK7dwpG0vTdqgiHSLtmYwZ
	bwXL59fpqYT/gjJICMxS5WXIGbTFdI0DlATASgAB7dMxGxsmlyifmy2mjimns5/xTyZr38+T0MF
	XRYHOEzSBBvXgruKtn1aEBYP3Dcfkhb8SXGZ0a5HH70yLk83AVuf48WrkCwg=
X-Received: by 2002:a05:701b:458e:10b0:151:5d01:9316 with SMTP id a92af1059eb24-18512f1d08bmr2587187c88.23.1792211798432;
        Fri, 16 Oct 2026 21:36:38 -0700 (PDT)
X-Received: by 2002:a05:701b:458e:10b0:151:5d01:9316 with SMTP id a92af1059eb24-18512f1d08bmr2587074c88.23.1792211795982;
        Fri, 16 Oct 2026 21:36:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm9771425c88.5.2026.10.16.21.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:36:35 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4 1/4] gpio: shared-proxy: Fix race between concurrent first users
Date: Sat, 17 Oct 2026 12:36:02 +0800
Message-ID: <20261017043605.1503563-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com>
References: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxOCBTYWx0ZWRfXzmKfpMO746Jv
 rvGA7Nq1hQrw+t8zgl59Lpgm6OrpXfu2paKZfT+GKW6DZkGzeb2UMdPFB3KtV6aNHt5cRz8M1an
 1sghETXfwX7gk6GraA5SQADArDZFNPIANxrmvyeR2AsSNUTzflmZS5J40hmQUFz6jYYKGHwWnoT
 oeoWopxnCG0jeiRB+QKr6CJtOppA53TFPs7CYLkaKcT+hPu5TlZ+eGbRhwN+1kKTJyJeWfOpwSb
 3/WMq/vzcU17uUJpUfC3VIcoy6RRLutPw8/XvOHkbVw7rp1Zro8S0reCF++26UdAmGbRaHDVB3T
 n4EYIxOhWiBNWhnmocAE8ZdHlfQjVQ6ipTrqKta1vB1+WFS3CtaugWAF3ojzTCgFsFWNR6B4qUr
 Ovlr1uCUljBNc+c9KBrcwsQXonx6yruGi0M/H6P+Z4hPk6AxP9zIZipxL1R8B09I9W54OgwQW1B
 DVz0p+ddSLBkehdu5pA==
X-Authority-Analysis: v=2.4 cv=W4WtxhWk c=1 sm=1 tr=0 ts=6ad2fb57 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Sp4Y3lbv4_CS8mIV0RQA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: piXQIHCkUWUokEhLuuPCL7qJAxUG0SfM
X-Proofpoint-GUID: piXQIHCkUWUokEhLuuPCL7qJAxUG0SfM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxOCBTYWx0ZWRfX4mSquiibujsl
 TePkb7Qv8G/RABzTfRFRolCOAW7AP63EJq4BXFmv7AK37LfAs9nV8SmliKJ6EOa/tjI6RnsQlcL
 sIXqigqs/4l1O8NPdn/qSeTV0P5ZjrA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170018

The proxy lets a consumer set the line direction and reset the
default value and vote tally only when usecnt == 1, i.e. when it is
the sole requester. But request() and direction_output() take the
descriptor mutex separately. When two consumers probe concurrently,
both request the line before either configures it, both see
usecnt == 2, both fall into the shared path, read back the still
unconfigured direction (input) and fail with -EPERM.

On Nord RRD the two DAC supplies are reg-fixed-voltage regulators
sharing tlmm GPIO 41. They probe asynchronously and intermittently
both fail, leaving the codecs without supplies:

  reg-fixed-voltage regulator-3p3-dac: setup of GPIO (default) failed: -1
  reg-fixed-voltage regulator-5p0-dac: setup of GPIO (default) failed: -1

Requesting the line is not evidence that a consumer has claimed it.
Instead, count proxies that have actually configured the line (set its
direction or voted for a value) in a new cfgcnt, with a per-proxy
configured flag, and allow (re)initialization only while no other
proxy has done so. A consumer obtained with GPIOD_ASIS that votes via
gpiod_set_value() without ever setting the direction counts as
configured, so a later user can never reset def_val/votecnt behind its
vote. The count is dropped when the proxy frees the line.

Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/gpio/gpio-shared-proxy.c | 74 ++++++++++++++++++++++++++++----
 drivers/gpio/gpiolib-shared.h    |  1 +
 2 files changed, 66 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index bc69b8729d19..0d1d724a6a37 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -21,9 +21,33 @@ struct gpio_shared_proxy_data {
 	struct gpio_chip gc;
 	struct gpio_shared_desc *shared_desc;
 	struct device *dev;
+	bool configured;
 	bool voted_change;
 };
 
+/*
+ * A proxy may (re)initialize the line - set its direction and reset the
+ * default value and the vote tally - only while no other proxy has set the
+ * direction or voted for a value. Requesting the line is not enough: consumers
+ * may request concurrently, so counting requests lets every one of them
+ * conclude that it is not first.
+ */
+static bool gpio_shared_proxy_may_init(struct gpio_shared_proxy_data *proxy)
+{
+	unsigned int cfgcnt = proxy->shared_desc->cfgcnt;
+
+	return !cfgcnt || (cfgcnt == 1 && proxy->configured);
+}
+
+static void gpio_shared_proxy_mark_configured(struct gpio_shared_proxy_data *proxy)
+{
+	if (proxy->configured)
+		return;
+
+	proxy->configured = true;
+	proxy->shared_desc->cfgcnt++;
+}
+
 static int
 gpio_shared_proxy_set_unlocked(struct gpio_shared_proxy_data *proxy, int value)
 {
@@ -117,6 +141,11 @@ static void gpio_shared_proxy_free(struct gpio_chip *gc, unsigned int offset)
 
 	proxy->shared_desc->usecnt--;
 
+	if (proxy->configured) {
+		proxy->configured = false;
+		shared_desc->cfgcnt--;
+	}
+
 	dev_dbg(proxy->dev, "Shared GPIO freed, number of users: %u\n",
 		proxy->shared_desc->usecnt);
 }
@@ -131,7 +160,7 @@ static int gpio_shared_proxy_set_config(struct gpio_chip *gc,
 
 	guard(mutex)(&shared_desc->mutex);
 
-	if (shared_desc->usecnt > 1) {
+	if (!gpio_shared_proxy_may_init(proxy)) {
 		if (shared_desc->cfg != cfg) {
 			dev_dbg(proxy->dev,
 				"Shared GPIO's configuration already set, accepting changes but users may conflict!!\n");
@@ -155,15 +184,21 @@ static int gpio_shared_proxy_direction_input(struct gpio_chip *gc,
 	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
 	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
 	struct gpio_desc *desc = shared_desc->desc;
-	int dir;
+	int ret, dir;
 
 	guard(mutex)(&shared_desc->mutex);
 
-	if (shared_desc->usecnt == 1) {
+	if (gpio_shared_proxy_may_init(proxy)) {
 		dev_dbg(proxy->dev,
-			"Only one user of this shared GPIO, allowing to set direction to input\n");
+			"No other user configured this shared GPIO, allowing to set direction to input\n");
 
-		return gpiod_direction_input(desc);
+		ret = gpiod_direction_input(desc);
+		if (ret)
+			return ret;
+
+		gpio_shared_proxy_mark_configured(proxy);
+
+		return 0;
 	}
 
 	dir = gpiod_get_direction(desc);
@@ -176,6 +211,8 @@ static int gpio_shared_proxy_direction_input(struct gpio_chip *gc,
 		return -EPERM;
 	}
 
+	gpio_shared_proxy_mark_configured(proxy);
+
 	return 0;
 }
 
@@ -189,18 +226,20 @@ static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
 
 	guard(mutex)(&shared_desc->mutex);
 
-	if (shared_desc->usecnt == 1) {
+	if (gpio_shared_proxy_may_init(proxy)) {
 		dev_dbg(proxy->dev,
-			"Only one user of this shared GPIO, allowing to set direction to output with value '%s'\n",
+			"No other user configured this shared GPIO, allowing to set direction to output with value '%s'\n",
 			str_high_low(value));
 
 		ret = gpiod_direction_output(desc, value);
 		if (ret)
 			return ret;
 
+		/* Only this proxy can have voted, so the tally is ours to reset */
 		shared_desc->def_val = value;
 		shared_desc->votecnt = 0;
 		proxy->voted_change = false;
+		gpio_shared_proxy_mark_configured(proxy);
 
 		return 0;
 	}
@@ -215,7 +254,13 @@ static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
 		return -EPERM;
 	}
 
-	return gpio_shared_proxy_set_unlocked(proxy, value);
+	ret = gpio_shared_proxy_set_unlocked(proxy, value);
+	if (ret)
+		return ret;
+
+	gpio_shared_proxy_mark_configured(proxy);
+
+	return 0;
 }
 
 static int gpio_shared_proxy_get_cansleep(struct gpio_chip *gc,
@@ -230,10 +275,21 @@ static int gpio_shared_proxy_set_cansleep(struct gpio_chip *gc,
 					  unsigned int offset, int value)
 {
 	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
+	int ret;
 
 	guard(mutex)(&proxy->shared_desc->mutex);
 
-	return gpio_shared_proxy_set_unlocked(proxy, value);
+	/*
+	 * A GPIOD_ASIS consumer may vote without ever setting the direction;
+	 * count it as configured so a later user can't reset its vote.
+	 */
+	ret = gpio_shared_proxy_set_unlocked(proxy, value);
+	if (ret)
+		return ret;
+
+	gpio_shared_proxy_mark_configured(proxy);
+
+	return 0;
 }
 
 static int gpio_shared_proxy_get_direction(struct gpio_chip *gc,
diff --git a/drivers/gpio/gpiolib-shared.h b/drivers/gpio/gpiolib-shared.h
index 618756f6c6aa..ae10506b7029 100644
--- a/drivers/gpio/gpiolib-shared.h
+++ b/drivers/gpio/gpiolib-shared.h
@@ -41,6 +41,7 @@ struct gpio_shared_desc {
 	struct gpio_desc *desc;
 	unsigned long cfg;
 	unsigned int usecnt;
+	unsigned int cfgcnt;
 	unsigned int votecnt;
 	int def_val;
 	struct mutex mutex; /* serializes all proxy operations on this descriptor */
-- 
2.43.0

