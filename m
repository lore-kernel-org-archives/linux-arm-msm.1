Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A1951B165
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067286; cv=none; b=bAgR+QXz9IoNns9oYDUZeW3kuPl+fvct+AHtNbk3MnV91WN+Iicbdb6KU+nBjF/CWNxsKq5VZCj7CKvqBrRcWG35eS8LWXFb//wOJcGKGDRxXns6cbPZssNUpU9hQf8kDJGRU7YHegQ7GabDaVY4UcddC0faSdL+9lwx97IeZ+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067286; c=relaxed/simple;
	bh=vran+OpfJM2PZIrnH54mmVpNHHTv4PfUqJT7y9SsR8c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TkoW1z9a3wxksj4oLjIG7am2Kd9kTJkL7/WOCeEGWqFm5l17PvBAkADh4mR94Vhf/NpjT1nfBXdGtXT1QA1/TBH1CmkV7EqcPmNOcShHnU3KHyY4M3TImZQ+c8eCAtpWfw4O80OphBeNBiMzpROtb3m0YkycYnL+zulAh/oG5qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TGh3iqJE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a4WN9FN0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TGh3iqJE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a4WN9FN0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jYUm2966398
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=H86NpSzFpRGKvjCwaNyeNi/MQuD7SkAcaC0
	WhWl0CdQ=; b=TGh3iqJE7cELOXn3ZNoA6LyOV9S9Np9XSr0Gw+u9ecq7EQxiv5Y
	q4RCRd7V7P4dR9+zOrEtJ4z75+v1ZiRvKR+THq5pBI1i5Afzx3xa3hh2UDtjGs7N
	KbRekCKV916o0EzHvzZHskX+1iwjGOL3oJVoK2rOja13BR+mGVBMz2g5sdhjQhI8
	VkRjEt6Jjd+QcXktQ0hlIW5WZBVTE5hEDHiZMCPlGVnuZL+9zJnNBcDLsTyxeWpE
	xiNaVHcCW8Qa3yQ6uf42B758cLvkWjO1fBilspbYOBv1ke1X2utAOvUvxDfrpGpr
	qLEdv28d2TfB+29SW8CEmdUTSd5Y/3sB7uw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wv0gy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:28:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso6302936a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 05:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792067283; x=1792672083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H86NpSzFpRGKvjCwaNyeNi/MQuD7SkAcaC0WhWl0CdQ=;
        b=a4WN9FN0Pmlp2KAdfMOhvonakL1BudQn4gecowQ5OgyBHY0SA+ND9nPZfgp17yAele
         zoLDNgVisGqotI4Lqse/AkT2w3V5yGfb3vgtwvkbiXBSEbBThfcWHSad+xtwnfMCVfyJ
         JgNv22GtaXcNHXU4+WvcurBaMUdUZF0KecyYLF+o6FPL9DfxolfTQWPxUoy+CMAAT1N6
         gs613C3aiVS2eMVWKLlbtle5gNpHhvpDdzEhbwi2px9xKKG9IUZLbBZjFArKIDEQgMX/
         9/Pe3pnbNV0ncix8oZ91FLtNeNml/9XQ2VkFW9TlwnNYaidmNTGymF6ndd4ptHlpIb3T
         OGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792067283; x=1792672083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H86NpSzFpRGKvjCwaNyeNi/MQuD7SkAcaC0WhWl0CdQ=;
        b=LSsLPhXi+8hYlAiprFHd1uxdfji6/fKDQqzDF+rggkRh51s9SaHexT0S/Ur2A4otxm
         dszxi6dt07/rVaVsvtUPGxOrSDn8oBR+ZJskLxhVJrspZvxAs4qSrHQRj+JgoRfD43FD
         +Oj3Gp6H+9AtuLXMFzUHYRPW+jsocdywmi4Vfy8XkSsi7KIw5+TAfqcDgoWN0M1aQzfc
         BAkfg6WMtBz3tR9SffPdtw2lNlvm+HbhkiWdBCVqADusgybEtHHE9g0YnPi/Rh+lsese
         rYUN3a9+nBqqOXvpKSqegeR2rOS/R+RSnGvRr3EOq/GAEAJJ+aZAUmQ5u57PyCzoupyU
         7qPw==
X-Forwarded-Encrypted: i=1; AKwUvBx5clkdS8Eft3NufX5FAcKyEmJCdx6/3P8UbwPRfyt8KQNNwdgv8dBfcBIC2BPTtfX9EunmpH7ucdEmGC+7@vger.kernel.org
X-Gm-Message-State: AFq9FYL0Iqrpw0nTTet0wnQMlbyvN3B+ejuVVzGLKCGxkSzonNSH+0yc
	sI5rowk4FD2aShwdi1e+Md7yMV35QJnYYGwCXHgLjcS3ODE6xaijjZLLda5QoHGpr0QwSnfqVjX
	wjS9/lswXYQda93RLc+zjmDCBOj3dGOCB00KtfxbSI4sO187E2DEqqOSrxRuU6Qty82ChlHGBOH
	ZM
X-Gm-Gg: AYBFou37yKfhueRXo7cY54dsa+PFAWMJVlPTatxecW3CCsX7g8G7vWVlUnbahkezYZW
	qagDgb1IP365fwEFtX7gE66eZefC+D2PNZcO5brEpn26dGzCpvG4NHzGRy+YTi//jNcJEhLVFjW
	8E27KtQrXwvlnyDJkKwVGlwNVSdOuS1aABRSWO/w3jGUQdd1GbH++ns8s9TpBb0qkVDDeHuBoY/
	G/FDrBZJmWUvWFOqZqdO/TPnQsAwyJdbpEzRlfEg/1OxEq/Nu/5iDVP1LqAfk7nubsAh+xg0yYj
	ft1InaYieQ7PJw64vGVGvTUD6f1PhtMewQKYxFPplYIcfqZ8tj5Ss5xPbrEXRvxT9H0Rk01HdbL
	WVv88FZSc0s2lGaEtRUqBHzmgF/W851A5+s3KI5ml5tHYkB2HOpQquYuw5zY=
X-Received: by 2002:a17:90b:1806:b0:3ac:9a03:20bc with SMTP id 98e67ed59e1d1-3ac9a03275cmr2169576a91.47.1792067282958;
        Thu, 15 Oct 2026 05:28:02 -0700 (PDT)
X-Received: by 2002:a17:90b:1806:b0:3ac:9a03:20bc with SMTP id 98e67ed59e1d1-3ac9a03275cmr2169452a91.47.1792067280289;
        Thu, 15 Oct 2026 05:28:00 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd635c937adsm1202315a12.19.2026.10.15.05.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:27:59 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] gpio: shared-proxy: Fix race between concurrent first users
Date: Thu, 15 Oct 2026 20:27:40 +0800
Message-ID: <20261015122740.971792-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0OSBTYWx0ZWRfX6bDEW/fbAXxY
 GfnoORxTs+LHNuLUvUJm7NM1vRk0OntVZ6ogo+NHRPJExl8kwsnpp1i3Z0NFMXX6dNnEEPJgDTu
 VRyCKdMgSTGHYJyep2lLfovifw+wKRg=
X-Proofpoint-ORIG-GUID: O_TLkntP8-fZqQttGMqJ4GxeJfafD5Uf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0OSBTYWx0ZWRfX2DDQ6lH+OO13
 rQi8pupcpBZ79tKivHZ2Bi+6u0rV8Ht3zhXZDBT8uczhMKvJDQrF8ESnXqMcQBuo6FzUbyPxSTX
 7yVJKO8040MqCmK5h61r/Sm4e/CON/+T1qxY/NxvoKam/rGzLrdCtjAAv7q09abLj0dE051KJ0G
 tCp+9xllexPpU9HVlCEsGPyJWAp+wj2LOkRvd4t2YjRCzGukFeUspX3+3LQLRvC0Qhho4rm7E1P
 OT9Lraw4krN+uIBvVPa1Nnyh7IEM7xl8N8dSlsjJUk/bznnVkdGSWGYXkE9xeaQ0jpYH++COFPN
 HQJDEGgux+OUz1RKaZkhqosXGuKe2htVgbhzF5TsIBu/Pyw7qO3NI0MWM2cixsqGgNDqaqtg4KN
 EWWc7Ho+q15/p9wzqeZ4wGfy2ZxPJTr/vJ8s9ASmIfFWDoV66rJkUgJl8s17KZmn64DwHuDT5dP
 aLM+3+LySu2k/rTRceQ==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad0c6d4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Sp4Y3lbv4_CS8mIV0RQA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: O_TLkntP8-fZqQttGMqJ4GxeJfafD5Uf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150049

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
 drivers/gpio/gpio-shared-proxy.c | 72 ++++++++++++++++++++++++++++----
 drivers/gpio/gpiolib-shared.h    |  1 +
 2 files changed, 65 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index bc69b8729d19..0d9ef98a4229 100644
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

