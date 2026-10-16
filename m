Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA11B423E9E
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162178; cv=none; b=pZamabaYbBOcnkemgkcPRBola+fOyXd2MxrGriL+mip+YKPZG6Za5hjBRMrZ7nG7TyvNdmSI+cEorJKxxMJDQvfqqDrDGeDhHyabpe8aAkKyAyL5Ytdj2UPL8XNPZUvEDjuXlxHBWJV0HTQEsoeYYDOOdXDYDkVJ+Y9zd0IGBcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162178; c=relaxed/simple;
	bh=T05qU3QP38O2C/gkrcm6SRVlPYdACpGqdMD1WnF8jI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rLFec9aX8B3BAg6qgza8CkY3SZC6kx29Iyicp7z/u6GE+frNtcWdWdiXo3Wx2bvrle+lGrPfID7KYsRa881B26FlLBOFAc4XX6TlUFOeZEOJZj+Ka0w7HHUVHq7mmAPAa/++2b5kKi7WRhZF8SphblstSWKjpfuLTd6LK7B0Ha4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RuVPFjSZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XZio2uU2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RuVPFjSZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XZio2uU2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5ieX1910949
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ApuLXzOKhLv
	eYlVUddCl2eITtzV0C5lAoBiRTgJqkhY=; b=RuVPFjSZF6CJUsorkPJiQTaPeqA
	tGEqXf56xAjvgqbEHyj17OvF5qmM2rZtllkE41OUxY+PXSdhmQCoYIK+MmF4nwrk
	l1Eieodkpcpd6C662EJT/dAJOUs2Ykd6Lpi5SyK0QsvN+6GUfSZI3pA+o5b2IngM
	PQhCuVikJVGsAnefM8dyx3H2R6ly43sVilyTFCK+bpFRWz4x0zLiOcVCWTLY8tCz
	LmA4VaL1cp/32KehOUagTGnOm/RRlVTlWL0XYwbTKIahyMY00cUELPlXpbYJmzrV
	QSyHg67+XYU9UYZyhMeg4us3QXM5OExs20T95ftef1Svgvnn21ABFIBqKoA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbjmf8u5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:49:36 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-351788121cfso15679268eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 07:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792162175; x=1792766975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ApuLXzOKhLveYlVUddCl2eITtzV0C5lAoBiRTgJqkhY=;
        b=XZio2uU2x3OLmZOqRR0HQoQOpMCHwxz+SBc1UoWScaCKp+CmabNrJkxMPCepzM8AKi
         EK+79MlHkYwnRpqV+pwdWUfsOH+hOWjtZllrGVc7r4YAh0N7kjBHQdYHhDmim7yd9xCF
         z1rHcqznGYEjdFGCp7oTm4Jy40j9kmYmafYqae/ivIXcautmZsmlgDaKnf0jTHWzmVUP
         Q7H2pwqgHy/t8SUhkj7rqLUcSKoUmUDL6+p5AWEarh1nqPN7fxpf2haZOwLrlAyNEmyB
         2q9ROf01+aiCjyeie5RaT9YEmQYHUYmSy/NFmUqXGYeRI8jxvJC153hmexIBSMfEnnuh
         yQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162175; x=1792766975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ApuLXzOKhLveYlVUddCl2eITtzV0C5lAoBiRTgJqkhY=;
        b=oXYu8YeYzfWnrm5/PAnzAAzUuCI+5o/dXPIUmN5jJcNuivFoZ9NeTndcqiPEK5LY2c
         XzU/a9yuID8Y89BzrqDLV2s8I1nDCy1ClzqxIfsr4Giut0GrVEF8tMxwlrZW9Doh4Szu
         2dF2OMMGH/pNp4oxz2V0kots53XZoP33a9ZbI5m3zjnTpAC7rTe4i9jme+Oun8aiZH5C
         3dqkg7W3g5bIhiAmM2WlYXkBQYX0lUEvx7maZA2asY6D+j8Oxou0g4iMMaVTuXggxoMM
         TL+l2NI9Va/DFdDDz+LqRv9LQvX28ZQf2L5pprE2gRYv8TUMGkkcCN4Vt5gShwaUnjaC
         hMQA==
X-Forwarded-Encrypted: i=1; AKwUvBzZjfxwG53vBrQ03INee5mWI1UsGjG6mRX4ahPij3Sv7PxTyg2ZNlizTF0UQUASriLB+FqC9zTfKXQqZj1k@vger.kernel.org
X-Gm-Message-State: AFq9FYLQ7W8TS5HlNUjU+uWBW8Cvi4VfDolwF2AoHVrGdwgGXcUSGyoi
	7/VyXI4pFjBKmDjSPSRkmGiJdFPev7993Gf+D/HSV6Lb6BvLTPoxYPtxVCuE++dLyiqYIpLKIs/
	/z4OHWJ9PU/ex45tmNj9UPkKU2dCx/Xhlqp+UZgubSry+HmIcJtn0QkI33iYUa/52BFq+8EgyGe
	HHWz8=
X-Gm-Gg: AYBFou3wWHU9O1gaSDQWp8B5DENcmIa0R/7ZIOgsgrlXcA13Qp6ouM4vxR60ZTlZKc/
	5KH9wLmpcIH/qjwjmoSXceyIXUP/1MZQDDjoT5qdtki5YC235q1ZK8AD/Wm4sNVb7qHuVlYCWbW
	nJw+ehrf9+LtpLHmvrPrZS0LuS75Yp1bvKJszTE7bm9vqXaT0i/+SaF+2wdh0snesG6xakYJhKf
	SQh173ieUjUTdaneodDkWbJYIWrQIKI+ccf4Nt2SeJaET0Y+3qZpFHDOYlNJXvSph+sXvF74Gg/
	IRu9n2LKklLLiv6aLu8EqlqgfWomk2Khg2qLy2ob8Eaq7T6NQJEzciUxXgb5tv17nw3Ow3pxKXw
	xsgyqqX0F13KUklSdQ9NctT1biZvgKh9xLOQIrnP3IZDsAuwqIHNAGIsOmps=
X-Received: by 2002:a05:7022:170d:b0:145:287:ce91 with SMTP id a92af1059eb24-18511ad88b6mr195215c88.14.1792162175186;
        Fri, 16 Oct 2026 07:49:35 -0700 (PDT)
X-Received: by 2002:a05:7022:170d:b0:145:287:ce91 with SMTP id a92af1059eb24-18511ad88b6mr195172c88.14.1792162174544;
        Fri, 16 Oct 2026 07:49:34 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm7765337c88.0.2026.10.16.07.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:49:34 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 1/2] gpio: shared-proxy: Fix race between concurrent first users
Date: Fri, 16 Oct 2026 22:49:18 +0800
Message-ID: <20261016144919.1362846-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016144919.1362846-1-shengchao.guo@oss.qualcomm.com>
References: <20261016144919.1362846-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: doPhFKKvaEOmbmS5aa11WHTHrflDawM0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1OCBTYWx0ZWRfX6BWfdm8zLJ1w
 qErRhf8/84Oz6VvS0Xp7+PK3QbMxWAmK/3+4/wFAxB0V6GwPzRAZkqcq1FllWxniRGqYRFaol39
 5sPEOrCC2h7oxPe47eZagtOPdhLWrPg=
X-Authority-Analysis: v=2.4 cv=SrAFe/O0 c=1 sm=1 tr=0 ts=6ad23980 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Sp4Y3lbv4_CS8mIV0RQA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: doPhFKKvaEOmbmS5aa11WHTHrflDawM0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1OCBTYWx0ZWRfXz4bBrVSqhmGv
 qufg7tecuz+gu3IL7WtxC689QPZ/H99ZNkLWm3B5Ojk9InwX9F1AVinhgcElAt6cUDv/tS84c0t
 ObgTdtMp5x1E1tRaMDaXSZvSNY9p031TuGT2qvA2EmvTQKyOOAaCt+cwddokAhQe7GVA8x0DRce
 pd1/bOzwi4fa0kh2gjmlcxg5zFvo+bsfCsKv4ab1RmRq3wa5AlDopntYfWhEIgaObCF+0EkJHZs
 eiQ9iZA+6p/UiIQPXc3gH8oYpNdiZsGDUzj914nVtnFB4qfmY1tD22zO0zl1apERs7YzD7uAnTO
 uoFvnMh71250JL7NfLcf9mafa1U0uxZnbJGm2VD4pHd3SL9dVOEjW/vsh+MTO8/hVmEeNlpk7A+
 4O3Q4vXqM10/nxQyKlxiWP9Uu1pYPfzXfKZxJ4UsaSZZmOAikKm8g5YdchKtw+AtvernNjPgDA1
 Hl0Jve7ej2JW3ZooAvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160058

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

