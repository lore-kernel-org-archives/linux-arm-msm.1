Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1681394470
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 02:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792205032; cv=none; b=TK7igfYbOFRtNa//TCHAWPUKbscD4antW3Lke/PXHVug0TtcBnlb2ag+tZ4fkZdxVexHAg9ylIf3f72eBaed7xdneRO60Hfyl+qloOm8eR3f13UMtO1eX8O+FUSBKwYu4xLD+X622naa3DdeOsoRoSO5ymyaWR7UdO9PHfKoReY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792205032; c=relaxed/simple;
	bh=T05qU3QP38O2C/gkrcm6SRVlPYdACpGqdMD1WnF8jI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kIHcD+m8wfZbPFSbDOjxzqiLEkznzh+7DeIlcpymEyL6iBCgIqTQ7MAQFBFSj82BwTwwPkthj7czBOK/JSLLpbwuAyBwo+0vef501qkGoz+Vb4JvQ03sX0ar+pMSBRpIMz0EkUI7sS2FLwBwdrPS+H5GkoM8uzZbrrCkeDPEBJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c7rsUPdD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cY95WotD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c7rsUPdD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cY95WotD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GNGFuw2618289
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 02:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ApuLXzOKhLv
	eYlVUddCl2eITtzV0C5lAoBiRTgJqkhY=; b=c7rsUPdDBlW95UGFIAPOMyK3TS2
	wd5CIPLG7EWXxibnODp7PNWgkcv6tDlFmVfPFetwY7WljcIaVm9lMEdtjYZ6iV0k
	TI9B1F8FIp4Wvx6JZtKxmnXu4d/tAablJYh4HD3O/609ZMNzoPs+6eggHSp/WTHp
	WdNQEjYCm4hV+FRdCGLn7/iIwi1dInFAmWQXeN4oA4hyO/DADQmxZYJMn7XAR0Sg
	gUetp0T3GTLa4Bxm/T5YpKMfzbobDniSh+45luO++Q+7boXgahv9Tv4JkTD7Nqfl
	Kf1Vu4WjwTIt0fjhQJSE7cq6ejVdogUj8jCEMDhBvdeNYVEBNdy6uUDe9gg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbhur347k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 02:43:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3552883bd19so1621655eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 19:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792205028; x=1792809828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ApuLXzOKhLveYlVUddCl2eITtzV0C5lAoBiRTgJqkhY=;
        b=cY95WotD/kRsnE/lyCRv34ApBBXMvMLqntcqinHIgTsaTAaHG91lr6od3LP62gUo9g
         7jWbgAU4nNJI3FeYD/cj2ABR1xhA+B2YFvR6DgFoLdVHxXAJUTB5Jf9yr0gX+wXnuJAQ
         VDswZaqq196Azzm2fuNPN9J34WQDE4YW62B8z+S1aZDKhvt8pnlCmqlBaHNtfmsX40J6
         W22TofxQLcidvl72m1qq+3BOSvTjso8Bv6djz5hK8nQxV291PoVFzmeXxjHvpp/gGAGB
         QpodSAdTaTD4NgCmcsM6pEoYEtyt6GFNEDKjo43VC3ATmsn0T5OuWPXamX44f1IK3+KM
         pzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792205028; x=1792809828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ApuLXzOKhLveYlVUddCl2eITtzV0C5lAoBiRTgJqkhY=;
        b=y8A4glLBiQ2PfXmX1vkef7GER9FotTD8eftLXvCJBGrWDyDpLcwRlgghwk3EZ1sVB1
         yEaOW/WqSsmff7gZoFEMtnlkcCT6GDMkEimLB629EdypZO2hiIsimjA9YRnLZBSH9zii
         Ek0TReosOW8tRDWG2bPhmlSbZ4mG4eDdb5LkR0sffKh+9MqUnagEyXQXlDCTVg/TCU//
         KLRFI9ANI5j+zsGKrlJaBD26yDe/iKBXAduaBMjcgPs1UcKC1zXMa6vRvLlaftXZB88G
         caDW9DYTaVGN6JtRggF18mDO7GaVWRnCCaFRa4TFSzd31QsQ26S3WDXYAAL5dkW3SOgK
         DsSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGYG/A0HxxK13an0IYHPWbL+mURCMlQTnGXXoL6VUU7PyS28bz7Zm34VRCEQM+Fd54LCXOzxgE2pkc6TZk@vger.kernel.org
X-Gm-Message-State: AFq9FYJ83tLceWZPWRqbmoVWTCPa6MVkiXYYcJDT+N2nuP/ett/STcL+
	lZ6SlEKeKTuAdDEAozHXs3agRuD3Lu+HeVDYR6UpSb7twynJkG66htGitVaUuVG8kVGrgacDbTR
	6FqrjAmhkKaWSguwkNKG3SG+6VGomwjamE8TrIJR+g9uGEL1fo+13S/WPLXhXLt6Yh/GF
X-Gm-Gg: AYBFou1//6I4jCnxS/LwuMD4sMeD0JEtmnPDktc693B23ceIRHNiQhouD5uA2lTxDv3
	Gfcs8M92Y1nyC1/UJ1lH8xKxpEdUN01gm7U5Mhl3HJAngy7iIu2EjOxFDH93VNimm6EzkOApDTf
	FfTcQzWS2KLlCb+CIhz6M8RdxLG1GtvuyYOqoZGq3CF8Yo7ErGNdu6s6SPCbGRPW2i4GMoeHhHk
	F+C4xKqJPMHOTKkj4Yy415Zh44/T4663HZPyPHgo67AYNqvBLBbxP84leX0Jn2ikjwsMoOoFmXv
	kQX/RYclKN0jSTISu0RdwcC+D91bKkLX1VJRDhYoEsh8f8Jmo3t5SE9TxuxkVxvo95kcdpkp9So
	035Diw4vbGUvKjsYlcIvFF+tmEAlJhB0BFJ1dBm6JzJ1Ay+W1dWvN9Z9gTgE=
X-Received: by 2002:a05:7300:8187:b0:351:6f5c:5d16 with SMTP id 5a478bee46e88-361a1e4e978mr2582283eec.22.1792205027387;
        Fri, 16 Oct 2026 19:43:47 -0700 (PDT)
X-Received: by 2002:a05:7300:8187:b0:351:6f5c:5d16 with SMTP id 5a478bee46e88-361a1e4e978mr2582247eec.22.1792205026737;
        Fri, 16 Oct 2026 19:43:46 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm13066829eec.3.2026.10.16.19.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 19:43:46 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 1/3] gpio: shared-proxy: Fix race between concurrent first users
Date: Sat, 17 Oct 2026 10:43:33 +0800
Message-ID: <20261017024335.1432020-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017024335.1432020-1-shengchao.guo@oss.qualcomm.com>
References: <20261017024335.1432020-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxMCBTYWx0ZWRfX0U0pAIdc5TeB
 d/s+Zacr07bgc5bpDwF09BUgboyS48/FY6usrQe8i/NW/6z6bDIE6oSHO4m602HnM9B3ddymt2N
 7flwy4O/zAefPDdvwJZXkeiecxRJE22WrxfGW45msyj4teVMvyrS0oB9lc4RRUOiB4VFPfX/e4Y
 bTO1nsNFyZBnjuWZAV8fxRTayFXzmIzm0oEh/Ul0efO2sfg1+3WvS78+ZUbxG0U0QoAptpnMxsF
 U+kZchV9GiexkYjsqEq9yJoXZAOS5hBhUO0sbBjAZWY6dnNxz7D/0TaqZkrl1jr0lckoEhlcUSM
 Jb7HWxPr+9G9O5Z1ua/l/14aCGFZMoRAQMbmwTfPOyxaeMY7mmLvKARfbY1UZSNzUGQ4bRvAne8
 e+qVy5BcM2W5JFPiXmfWeYk6GOm1AgSsPqKWMi8pD8N+KmoklyI3sJsXPSTnMM3BQ1eVaOtWILq
 LhRs33lSzlNWeQXwC+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxMCBTYWx0ZWRfX1Cg8iB5jIYY6
 MudBFGYpwwG3VUciE38OX+Yu0B4inEw14hL+CpzOZEKi9dQEP4KANfMzstRRdAxAbE0qeIiJs7b
 fjzFNOs+fXKUCaD+r2fSxL9UNnSjSEo=
X-Authority-Analysis: v=2.4 cv=PqsG/AM3 c=1 sm=1 tr=0 ts=6ad2e0e4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Sp4Y3lbv4_CS8mIV0RQA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: uiqwYN1TL5cXbEU3_uwquvCopL6caM_o
X-Proofpoint-GUID: uiqwYN1TL5cXbEU3_uwquvCopL6caM_o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170010

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

