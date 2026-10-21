Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792552360;
	b=MtubeOHGOAAIogT/OkXgNdOJLRA223QXjBqMl9gT87jGqpAsF2A6iYrwdrfzxpb7W8XP
	 M2xvNhaJMf253Fd9yW+fUZGxmpPaEvQqCpimiZX+duSt6h7l4ZMFJZLpXaYtxhoWJaxmW
	 g+NOIyXLMiA0JSJ9gRvzCddTEZ0u4oP6usHoqArW97uP0yF0zsUr0+yMK1UzJxuGR47C5
	 Oe72utQoXU6y9I//7tk0FBkw7TCI6J+5+Kbr6s3q4ygR1T8YNTUDtwH66I41eI6zoIF4k
	 ZV6QzSnEwJCs7YGau2dEKygQ7EYrZms5ICogJoZXQN9po7IKI2EYwGaAPied0LsBrjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792552360;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MfRkPM22ZaiSo4hToB8MNzjEQGDixsa8Pt0dtjpR+tE=;
	b=QTB0UdO0G3cy2mOidBMGmy9AA1Ne2pzVbfbdz67vbnfh1oMUrh3UnuLhJEgbLdNRDqG5
	 OJUIYxuzwagKSfx1UmXGz3OV4FStm+v7ess5Hx+ie9X+GgGZ1SH3g4qOOIuQRg7xREF2m
	 do4gwHSkfbdHI/qSEEJkqRP16yonTJqlxRCziE9KX1dIL98DJkX1xczxrYu+yQEEdnT2w
	 T6yCdlqFao5OJlTUkCRFzjW6Mp+NgJXBhDCMyLxxntS9249BVeABGbGjpD105V3vv0+Vx
	 9S5xxK9iejNag4IMYycOuNgcbQLYdyNyzrFiqt9Qg+J9YussrlgRf2ggxoz0cXBIkrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="TW/c3KC2";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kcRlWfwk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E049E606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E049E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TW/c3KC2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kcRlWfwk
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2UwwU3457250
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MfRkPM22ZaiSo4hToB8MNzjEQGDixsa8Pt0
	dtjpR+tE=; b=TW/c3KC2RXH+WX8/W8l6bonpOlRiIOTiIeM7mZdbTYw82wG+osM
	NdY8A4jMC5DqCrN6ZR9NgDZFyCLKllr4b4u4qs4cD1gW9MDgsFNiungu4EuvJe1w
	yqnVJdYYzjJHOri/Xsqq//dGlfA6aeBx0aLSergksdcHZ9mt3BChahMNGOFmoj2l
	no9vhTEXKyNRVNmNIfWuG4hXDzo5QtmoAgWKs1dj3D0bRD0Z7q7n9pCKl6lvKtaY
	jOnh8uv/8eqZsABuisLVIq8nmIMHHciQj23B7EkjF4OUr1c+Vvis/WLIfSKgFcS3
	K8oxWvSI3Rk6twyakkCZtzTrXgDlE6N0Opg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r0txb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:12:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3662e7a9299so1115775eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 20:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792552358; x=1793157158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MfRkPM22ZaiSo4hToB8MNzjEQGDixsa8Pt0dtjpR+tE=;
        b=kcRlWfwkRAvsCeiNTLIdRIElZBNcg+DbzmW62dUkSwnaUJA27lhrltUO998ZOWvgay
         CV8xg4zvu9c0SKHsy+SsA3kdQw3ty1LPpeGyelgPq+xvDCH9DpgS+XnKfMrXzIgN4K2L
         do9kBEjujwi3HU25pFC+Q/VsGskkqieRdQTopwtDxYmtDJXv7arTqx08aSBkUgu7zzf1
         xH+ubV7ST3T5aGU76bUi2q1Y57ul4t5ShLdnH4lV6Agl3WWhIiVqWhFxuf8jD/bEq+0J
         qsuQqO5ahTDB/h8TRhSC87xTSZOngtuT3mXo0cJUht3m6HoOEPy+TrhfphXz2tdopLEb
         gDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792552358; x=1793157158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MfRkPM22ZaiSo4hToB8MNzjEQGDixsa8Pt0dtjpR+tE=;
        b=U8izKmBU4A+40RI1vsf7mFli12zuG/M9ytOPb7V0qFeB6bGp71Y5GS/RW1EYdO3GBX
         +hex+4dbq5Em5peNZf2C7Sb0tAAtjmexumjfDOqoLWkOtI6sop/Xd2deYcNZOs8lUVJz
         HWvhCfxsWkZu2toAn92Nw/PMY0Amt6AXb9onKcOBWUP5XZJnGfkCyU5wCZeGxNm+V3lg
         lZqUIy1oFznP1wzapMydTmOmn38g7qm20f9cc7drPlNbAIuLnglgECdiWjazDGzAbT3b
         5wG8PzithmEi6jwuRNYECsgRZ2+1U/LUMXz6reVQFE8P2wIKAKo2/1VZ7me5Ya1FpJo9
         KYRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNqCCz9pJEXpx9kYSjr8bYYe2cIE7xHarbbxa5XC5f4GD/FEOEHzqUnh2Az7E1/MMa+ZVgtgS+qCoJksVi@vger.kernel.org
X-Gm-Message-State: AFq9FYIVfJ/VJIXTg/og/GJDhpnHDF4NqeereklnfN2SNsHz9EiFrPk1
	4BYyMNPlEOyffunAIDTzgGLJtLTeaOs+BRnV9lzLyIeu9+STlvDEZYMI73Y4+Xe//MRWpzFZb1i
	WYJzujyqqxy/AFGUXzwZV7oeIEMxfs5on/MtKnBBAmL+91McTLTATSzis0Nl5HerFS9g3
X-Gm-Gg: AYBFou25nKNCEaQ2Uo9VIEpZyb1n9HiOKhNDcgKYWD1y89uSjTnTyKfr/gFZnaaIK6/
	4pvszj6D3+elQrc09XSvReexT8xS+CV5B2V3vo6ynApV8iUhsClPJk1j3UufXfeKh1X1WtHCyG8
	+yxbCgD9LDKIgkHsV9ACA7L7e1BF7R3h1bTP6YMlmHxZaH26hKYH2a8kC1OQuHUTlpnIUMPEbCZ
	L2GzQgVoEr13KB3L51ybK2+D07E6zTCK/dZIDHFE/4iO0n2/enZqx3hX5gFE24cpH/uc3stBEp8
	XELTXcezgrDkQe4G2gp/IgZ48w0dqeFPnPy14Bip9mT5CPE9ocIoViOsp0CkJ7bXsgoPPsHi6VC
	kOc0YJWdMZGGmMzO92x0PxyZ/M1tEgK1V3CJ0qZuSRE3dCILVKi+jwjo6UdA=
X-Received: by 2002:a05:7022:698c:b0:17b:fed6:7449 with SMTP id a92af1059eb24-190a7c21166mr1390126c88.47.1792552357407;
        Tue, 20 Oct 2026 20:12:37 -0700 (PDT)
X-Received: by 2002:a05:7022:698c:b0:17b:fed6:7449 with SMTP id a92af1059eb24-190a7c21166mr1390070c88.47.1792552356642;
        Tue, 20 Oct 2026 20:12:36 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a180adasm2517518c88.8.2026.10.20.20.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 20:12:36 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Shenghao Ding <shenghao-ding@ti.com>,
        Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
        Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] ASoC: codec: pcm1681: Acquire sck when bound to a card
Date: Wed, 21 Oct 2026 11:12:28 +0800
Message-ID: <20261021031228.2074402-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad82da6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=7YZ_7jEC5wYdKgbzYxcA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: fJ6Z6gNGqHrSCw0N0pH_tCy319zAJWCu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX6hy3gTqe+Wx0
 3IbrLNTTetxOandFC3JwlSege9dbCTwtnZsMovCr0OmJJUXrYN+GwLCNwyHm5k1pySoWkHrLx/y
 MT3T24O9UxClMGCQy1C4DNCrncZRzI7YMyVp8t0+WtRwT1YF0EQH5dsMF9B1wBTeRkU9KoDoWEk
 fpf6WSCbHFHgyunf1s30tAN+gikD6OXpbSIg+v2+I0hKYz56XjakuNgmDAfpNIt9ZwD454JAahk
 vuRrzZ91W2PqJ0Y7E6e9QNO+Jd+RfrHK6voch3GxG+PHn/E3E/d8TYGsh52dQWfqBKIcyzRWpV3
 AP5VBeLGLeTnWFJ7XWJaErXfNtalr8UkCyP/nL1CKKCMvTkWe9Fkona0WgNfO1fvoq3wcGmC4hh
 nBDTMdENztA0et16+1w2XQDE3XbRGC5vKVqOjPxFOccAVTlMY2MPbBqo/A1qmi7W+DgF/R5Xsej
 rWxS5T3NzfbKbERsrfg==
X-Proofpoint-GUID: fJ6Z6gNGqHrSCw0N0pH_tCy319zAJWCu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfXxiT6AK67IFja
 jIvAZDeIa4c8JnpUR5EnOMO5JmOSGlKWk3BrfbQ3Wwor7IpVXXjghC4Ny2WcX6uXRjbo+pYthnB
 CtHqYzbrAd2u7iE4s9tW1nqLz+XIC7w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210012

The sck clock is taken once at i2c probe and held for the lifetime of
the device. On Qualcomm boards it is an LPASS clock exported by the
q6prm clock controller, which lives on the DSP and is unregistered and
registered anew whenever the ADSP is stopped and restarted. fw_devlink
cannot tie pcm1681 to that provider, since the provider node only gets
a device once the DSP is up, so it falls back to the remoteproc device,
which stays bound across a DSP restart. pcm1681 is therefore never
unbound and keeps a clk handle to the dead provider.

After an ADSP restart the first runtime resume fails with:

  pcm1681 0-004c: Failed to enable sck: -6

and there is no playback through the DAC. Even with a fresh handle the
DAC stays silent: the new provider registers its clocks at their
default rate (19.2 MHz), while assigned-clock-rates (12.288 MHz) was
only applied by the i2c core at probe time.

The sound card, however, is torn down and re-created on a DSP restart.
Move sck handling into the component probe/remove callbacks: get the
clock, re-apply the assigned clock rates and enable it each time the
component is bound, and release it on removal. The i2c probe now only
sets up supplies and the regmap, keeping the cache in cache-only mode
until the clock is running, and the cache is synced once sck is up.
Runtime PM is enabled and disabled together with the clock.

Fixes: 8987e9a24f45 ("ASoC: codec: pcm1681: Add optional SCK clock and runtime PM support")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 sound/soc/codecs/pcm1681.c | 122 ++++++++++++++++++++++++++-----------
 1 file changed, 88 insertions(+), 34 deletions(-)

diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
index 6002da3a5666..2cc34561aa83 100644
--- a/sound/soc/codecs/pcm1681.c
+++ b/sound/soc/codecs/pcm1681.c
@@ -13,6 +13,7 @@
 #include <linux/regmap.h>
 #include <linux/of.h>
 #include <linux/clk.h>
+#include <linux/clk/clk-conf.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <sound/pcm.h>
@@ -321,7 +322,87 @@ static const struct regmap_config pcm1681_regmap = {
 	.cache_type		= REGCACHE_MAPLE,
 };
 
+/*
+ * sck may come from a DSP-hosted clock controller that is torn down and
+ * re-registered when the DSP restarts, which also rebinds the card. A clk
+ * handle kept across that would point at the dead provider, so only hold
+ * sck while the component is bound to a card.
+ */
+static int pcm1681_component_probe(struct snd_soc_component *component)
+{
+	struct pcm1681_private *priv = snd_soc_component_get_drvdata(component);
+	struct device *dev = component->dev;
+	int ret;
+
+	priv->sck = clk_get_optional(dev, "sck");
+	if (IS_ERR(priv->sck)) {
+		ret = PTR_ERR(priv->sck);
+		priv->sck = NULL;
+		return dev_err_probe(dev, ret, "Failed to get sck\n");
+	}
+
+	/*
+	 * A re-registered provider comes back at its default rate, and the
+	 * driver core applied assigned-clock-rates only once, at i2c probe.
+	 */
+	ret = of_clk_set_defaults(dev->of_node, false);
+	if (ret) {
+		dev_err(dev, "Failed to set assigned clock rates: %d\n", ret);
+		goto err_put;
+	}
+
+	ret = clk_prepare_enable(priv->sck);
+	if (ret) {
+		dev_err(dev, "Failed to enable sck: %d\n", ret);
+		goto err_put;
+	}
+
+	pcm1681_sck_settle(priv);
+
+	/* The DAC lost its state if sck went away while unbound */
+	regcache_cache_only(priv->regmap, false);
+	regcache_mark_dirty(priv->regmap);
+	ret = regcache_sync(priv->regmap);
+	if (ret) {
+		dev_err(dev, "Failed to sync regcache: %d\n", ret);
+		goto err_disable;
+	}
+
+	/* The clock is on, so hand the now-active device over to runtime PM */
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_idle(dev);
+
+	return 0;
+
+err_disable:
+	clk_disable_unprepare(priv->sck);
+err_put:
+	clk_put(priv->sck);
+	priv->sck = NULL;
+	return ret;
+}
+
+static void pcm1681_component_remove(struct snd_soc_component *component)
+{
+	struct pcm1681_private *priv = snd_soc_component_get_drvdata(component);
+	struct device *dev = component->dev;
+
+	pm_runtime_disable(dev);
+	/* Runtime PM may already have gated the clock */
+	if (!pm_runtime_status_suspended(dev)) {
+		regcache_cache_only(priv->regmap, true);
+		clk_disable_unprepare(priv->sck);
+	}
+	pm_runtime_set_suspended(dev);
+
+	clk_put(priv->sck);
+	priv->sck = NULL;
+}
+
 static const struct snd_soc_component_driver soc_component_dev_pcm1681 = {
+	.probe			= pcm1681_component_probe,
+	.remove			= pcm1681_component_remove,
 	.controls		= pcm1681_controls,
 	.num_controls		= ARRAY_SIZE(pcm1681_controls),
 	.dapm_widgets		= pcm1681_dapm_widgets,
@@ -359,11 +440,6 @@ static int pcm1681_i2c_probe(struct i2c_client *client)
 		return dev_err_probe(dev, ret,
 				     "Failed to enable supplies\n");
 
-	priv->sck = devm_clk_get_optional(dev, "sck");
-	if (IS_ERR(priv->sck))
-		return dev_err_probe(dev, PTR_ERR(priv->sck),
-				     "Failed to get sck\n");
-
 	priv->regmap = devm_regmap_init_i2c(client, &pcm1681_regmap);
 	if (IS_ERR(priv->regmap)) {
 		ret = PTR_ERR(priv->regmap);
@@ -371,53 +447,31 @@ static int pcm1681_i2c_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	/* No sck until the component is bound, serve access from the cache */
+	regcache_cache_only(priv->regmap, true);
+
 	/* Must be set before runtime PM is enabled, the callbacks use it */
 	i2c_set_clientdata(client, priv);
 
-	ret = clk_prepare_enable(priv->sck);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to enable sck\n");
-
-	pcm1681_sck_settle(priv);
-
-	/* The clock is on, so hand the now-active device over to runtime PM */
+	/* Runtime PM is enabled from component probe, once sck is running */
 	pm_runtime_set_autosuspend_delay(dev, 100);
 	pm_runtime_use_autosuspend(dev);
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
-	pm_runtime_idle(dev);
 
 	ret = devm_snd_soc_register_component(dev,
 					      &soc_component_dev_pcm1681,
 					      &pcm1681_dai, 1);
 	if (ret) {
 		dev_err(dev, "Failed to register component: %d\n", ret);
-		goto err_pm;
+		pm_runtime_dont_use_autosuspend(dev);
+		return ret;
 	}
 
 	return 0;
-
-err_pm:
-	pm_runtime_dont_use_autosuspend(dev);
-	pm_runtime_disable(dev);
-	if (!pm_runtime_status_suspended(dev))
-		clk_disable_unprepare(priv->sck);
-	pm_runtime_set_suspended(dev);
-
-	return ret;
 }
 
 static void pcm1681_i2c_remove(struct i2c_client *client)
 {
-	struct pcm1681_private *priv = i2c_get_clientdata(client);
-	struct device *dev = &client->dev;
-
-	pm_runtime_dont_use_autosuspend(dev);
-	pm_runtime_disable(dev);
-	/* Runtime PM may already have gated the clock */
-	if (!pm_runtime_status_suspended(dev))
-		clk_disable_unprepare(priv->sck);
-	pm_runtime_set_suspended(dev);
+	pm_runtime_dont_use_autosuspend(&client->dev);
 }
 
 static int pcm1681_runtime_suspend(struct device *dev)
-- 
2.43.0

