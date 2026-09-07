Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF43442397
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 08:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770315; cv=none; b=rUXek4DAKdPDhPewkAkp4YL3Lp4VpWNYd0tDHPrh3BYUfI7swfV7yW/lqBAtLuRWJ5rVvIrULu7lEX4ptYKMZH4fAMa2vfxkj4e8ZTUUOUitJwhhImLuuucffAtXry5gJpWwAjlHlY50he4NvGlSFfQPvJ7/bcdArcTIeeDP1Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770315; c=relaxed/simple;
	bh=cYyZuliuvTTA0LecfvBO89TbFhpv37LsqPXiOd2CHoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nI4zu5if728ZiQit7TuK7Qh9ynZDbK5HFw/z5rW4be8kshVefRv4g1AKuCQ8wK+2W4ZQZ5FHmvibpWv3sefpfHjbqZT9uKowtQbPu/ca2KOCE7i5CNvIkpL641LcCZ6kzUySK+MaC7/SyZEyEjT2C5nqKbuAtK761peTp7ubJtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mtG//AzY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ao5ossfQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mtG//AzY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ao5ossfQ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6877p2xR3657584
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 08:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kDEMgO+fxBh
	eFl09Qo2A2eotuWYnf9xrAwMlkX76HAE=; b=mtG//AzYesa++hDIOnEFaPVK+G5
	rLO4MsYlnwe8o+3+3P8n1XeP2bjPd0Zf/LnB1vSRHqdKnry2/JPULaqaDlyD6/eP
	h5UxRTF26S6XP0UB/NJTdbghuM75EnPz3vOBUwnRxQVFhLkjgkDQBDlgYGiTlTHw
	B7S45qnMEZIA1mvjHB+9k6JklMIyfYhQi50cleJA6FnK6sizYujYdsgBkOSIhyha
	Utn5GcT5f0YF0ydngeiaF+bb8wk5nBlsnxPsxZq9i6K7r5lOORfbi/ZUVjYy6OU0
	sGe35pvCcRwcKn8xmAJXwKAMa0XyBxc4Ow4KmqOKH9j1i0SFaSLs8+7pCKw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghs86r6pv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 08:38:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9396e0515dcso167803385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 01:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770311; x=1789375111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kDEMgO+fxBheFl09Qo2A2eotuWYnf9xrAwMlkX76HAE=;
        b=Ao5ossfQ5fGWj7NkCr8NbJKkAgD7N5qbEJCfXt2bR+5YfsXuR/IpHdb6tqTByX3+hA
         sRrIcJtiP4vmIzt+Pkf+R0tKusnvoujvTjFPPnD6ygA1F6kR4fuDDQIQitU5O9S8ZWLF
         Y9B1QjjLdO9HcjQlSTlcRZa3749QAgJIiNxBrNARKgqiIVG0xqb0Uz8AbNK5cwEYZDUa
         OJKF1Bigo1mx9eHE3/f7CQ8igC2w6VFTBsE2VshgmQ7IvE0xM8RW8/JGIB3P4/Tz6ApF
         j0zr0NhqefT+sk9Xe0nhrO46XcgI7Hyi4KMSaBDljjG5LI1cmiwUXFgOxZKzphamRfc8
         6sUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770311; x=1789375111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kDEMgO+fxBheFl09Qo2A2eotuWYnf9xrAwMlkX76HAE=;
        b=KX9Ockr81U2lxKUUZETdk0uMkJtqSiGAR4OVs7SQbX9t0ShefzohTYVuqyFUpM2E7h
         QQ4KHpOZywMHKI0cGLwX0yPFIeL0qgn0+qEYsSGRHMquCbOq5PQdIQbvAstDW+XuqN2Q
         +TBTC2og2OwZFmNtUCDaZdqqpAzNEABIOmRNTeR+UHf7XmjeVD+mKHx27ryZIe8kGmP4
         NSUPleTE26SwYgd37DMAKWaGiTR3/N9DJHvkBViYwGmSIauG/rGjkodphg2uqNyc4Qc3
         w5iyoeghPHTNKSMOReOeCM+GpmBqlTEUZ7pYeeBPGFyB9jgmP6dVGyUZDJ330Sg4JW+/
         D9oQ==
X-Forwarded-Encrypted: i=1; AKwUvBxk79nGyGTsxvT3/FUqsEu87gig9NoxwSzwyFKM62QodtySzyNu/2tX5gRfNdm9qJDsp+rDoZOtpgdEG9Ni@vger.kernel.org
X-Gm-Message-State: AFuF++k5hvRLGa3lF1IgFlkFOvRd9572VxFtaCM46g6WFlm4/fade3LG
	QWyGJwC+dUbVoHThHZ8Jlnyazxmrc0qYZGJoXKlgWksqM6U0AY3DVFdheMalYxDk4DUCG1oNrA/
	t0eVX91ERX0HedmvQ/uKoxJgNxf3yFAjxAwnxY54CVPfGAGCBIM34BzFNWc6aaDh9t83f
X-Gm-Gg: AYBFou1boB2AJGKLQAA1nqjx++ijKewWJaXh8wDkyDiKe57YzyGrJcnsmrfUtpAQ4pu
	UGt2eBmjuL9/ZQWvCeFS5uXQD/mRIvII83dp0xcm6/5eQ7E3F0JicMAr1fbuZ/LTGOOoNtLwraX
	Sp1P90gWSGfYMU1f2ZOuuld4S8nPcGFqCqjuxm2jdMYKdZvhSrBVa7M859rCdwsS9qUEGc4a+ty
	h+yJgfDYXiao4i4ZKrEfwPWtAkLMEDIu8f3XjuhijauV5pNomcJ/tTNErmXW7VtyG3zzRKgBejy
	61+nHwDQTohix/+qL/gtHX7TsMzbPaktVDbYDWk3VOrSc5ndkJ5ljYg1uV9UBc0quNGzqABQ5w3
	OLM6NMXxKsavSAQ==
X-Received: by 2002:a05:620a:1493:b0:937:1538:6b93 with SMTP id af79cd13be357-9398053a24amr1528625785a.40.1788770311481;
        Mon, 07 Sep 2026 01:38:31 -0700 (PDT)
X-Received: by 2002:a05:620a:1493:b0:937:1538:6b93 with SMTP id af79cd13be357-9398053a24amr1528622285a.40.1788770310950;
        Mon, 07 Sep 2026 01:38:30 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm30852179f8f.25.2026.09.07.01.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:38:30 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 03/11] ASoC: SDCA: expose class SoundWire probe/remove/read_prop as library
Date: Mon,  7 Sep 2026 09:37:17 +0100
Message-ID: <20260907083727.733705-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ql_mT5vLaYPI8Zi5DqJ-pPZ-2LhiBb0X
X-Proofpoint-ORIG-GUID: ql_mT5vLaYPI8Zi5DqJ-pPZ-2LhiBb0X
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfXy/o+Bi3FFI+/
 7Cel6yYZhtnPFnFLSXOAW6o3rq9lbkB4bewBGh3alK3bn7OUQoOAyQtzuf8yv13sjoymEosfMC5
 oualuhhk6geHOuwilo3MgzsgPhyXfik=
X-Authority-Analysis: v=2.4 cv=LseiDHdc c=1 sm=1 tr=0 ts=6a9e7808 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=8jLOb54Wr6f81qLreb0A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX7ZZCVuo4RMpE
 D3ZjbplPjPLabo4KtKlYgzU42jR0G9tQYStUKJOeyZA5riiCiaaOBHO2oR3cal/yiCT1I1iruUs
 7WrbIPfFK8iRQ1EguXR/o2LCK3w9TAQzIP/4vpfoCDgE5MG7eem9PtMLyqllv39kv/dSl/qY6Bf
 1rzsjKYgMycWaiUGeolzuF6BYyFGZx+ERtgkiRYPX5dK0zkJqn+TGrAWb6mMzY3nyZ5QSff4A9o
 wz3/uLk6F/gmT0IIr5M7xlE19GyR3Dl4T8Xd85fcA7L7Euh9oUGrSdtm4OfE8Q+hkwSdhZdB81x
 H9vLtf6m8I3wqDHTZrUg6+rZve/lYCi1iy1P0gqT5igo+odpCaGFvX8KIqpbC5ByUAI3kDEpLhT
 hB/0DD7NlzA11qs96u+sQ9+eCRZ5HZ3SpCwo353u5IkpzZAqvWn1Ebbm9ouyBUmcy6wCv+A5tET
 RQ/mCB9fYjT9E+aRvvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070093

Split the internal class_sdw_probe/class_sdw_remove/class_read_prop
functions into caller-friendly library helpers:

  sdca_class_read_prop(sdw)
  sdca_class_probe(sdw, drv)
  sdca_class_remove(drv)

The class_sdw_probe/class_sdw_remove callbacks of the built-in
class_sdw_driver are now thin wrappers that allocate a bare
sdca_class_drv, stash it in drvdata, and defer to the exported
helpers.

The exported sdca_class_probe() takes a caller-owned struct
sdca_class_drv * so codec-specific SoundWire drivers can embed the
class state in their own priv struct, own dev_set_drvdata() themselves,
and avoid a second allocation.  No functional change for the built-in
driver.

This lays the groundwork for codec-specific SDCA SoundWire drivers
that want to compose the class-side probe with their own quirks; the
next patches add the hw_ops mechanism on top.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/sound/sdca_class.h  |  5 +++
 sound/soc/sdca/sdca_class.c | 75 +++++++++++++++++++++++++++++++------
 2 files changed, 69 insertions(+), 11 deletions(-)

diff --git a/include/sound/sdca_class.h b/include/sound/sdca_class.h
index 15a180385202..c6063f22be7a 100644
--- a/include/sound/sdca_class.h
+++ b/include/sound/sdca_class.h
@@ -33,6 +33,11 @@ struct sdca_class_drv {
 	struct work_struct boot_work;
 };
 
+/* Library helpers used by codec-specific SDCA SoundWire drivers. */
+int sdca_class_read_prop(struct sdw_slave *sdw);
+int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv);
+void sdca_class_remove(struct sdca_class_drv *drv);
+
 /*
  * PM helpers.  Codec drivers embed sdca_class_drv in their own priv,
  * own dev_set_drvdata(), and compose these into their own dev_pm_ops:
diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index 88a29116a334..b952fa6eb802 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -24,7 +24,15 @@
 
 #define CLASS_SDW_ATTACH_TIMEOUT_MS	5000
 
-static int class_read_prop(struct sdw_slave *sdw)
+/**
+ * sdca_class_read_prop - fill SDCA-common SoundWire slave properties
+ * @sdw: SoundWire slave
+ *
+ * Exported so codec-specific SoundWire drivers can invoke the SDCA
+ * common property setup from their own sdw_slave_ops.read_prop, and
+ * then apply codec-specific overrides inline.
+ */
+int sdca_class_read_prop(struct sdw_slave *sdw)
 {
 	struct sdw_slave_prop *prop = &sdw->prop;
 
@@ -36,9 +44,10 @@ static int class_read_prop(struct sdw_slave *sdw)
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(sdca_class_read_prop, "SND_SOC_SDCA_CLASS");
 
 static const struct sdw_slave_ops class_sdw_ops = {
-	.read_prop	= class_read_prop,
+	.read_prop	= sdca_class_read_prop,
 };
 
 static void class_regmap_lock(void *data)
@@ -136,18 +145,31 @@ static void class_boot_work(struct work_struct *work)
 	pm_runtime_put_sync(drv->dev);
 }
 
-static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id)
+/**
+ * sdca_class_probe - SDCA class SoundWire slave probe helper
+ * @sdw: SoundWire slave
+ * @drv: caller-allocated sdca_class_drv storage.  The caller (a codec
+ *       driver, or the built-in class_sdw_driver in this file) owns the
+ *       allocation and sets its own dev_set_drvdata() -- the framework
+ *       does not touch drvdata.  Typically embedded in the codec's own
+ *       priv struct so codec drivers can keep per-slave state.
+ *
+ * Codec-specific SoundWire drivers call this from their .probe after
+ * allocating a struct sdca_class_drv (usually embedded in their own
+ * priv) and setting drvdata to their priv.  The framework fills in the
+ * sdca_class_drv fields, sets up the class regmap, and queues the
+ * deferred boot work.
+ */
+int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv)
 {
 	struct device *dev = &sdw->dev;
 	struct regmap_config *dev_config;
-	struct sdca_class_drv *drv;
 	int ret;
 
 	sdca_lookup_swft(sdw);
 
-	drv = devm_kzalloc(dev, sizeof(*drv), GFP_KERNEL);
 	if (!drv)
-		return -ENOMEM;
+		return -EINVAL;
 
 	dev_config = devm_kmemdup(dev, &class_dev_regmap_config,
 				  sizeof(*dev_config), GFP_KERNEL);
@@ -159,8 +181,6 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
 	mutex_init(&drv->regmap_lock);
 	mutex_init(&drv->init_lock);
 
-	dev_set_drvdata(drv->dev, drv);
-
 	INIT_WORK(&drv->boot_work, class_boot_work);
 
 	dev_config->lock_arg = &drv->regmap_lock;
@@ -185,14 +205,47 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(sdca_class_probe, "SND_SOC_SDCA_CLASS");
 
-static void class_sdw_remove(struct sdw_slave *sdw)
+static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id)
 {
-	struct device *dev = &sdw->dev;
-	struct sdca_class_drv *drv = dev_get_drvdata(dev);
+	struct sdca_class_drv *drv;
 
+	/*
+	 * Pure-generic SDCA parts: no codec priv to embed, so allocate a
+	 * bare sdca_class_drv here and stash it in drvdata for the
+	 * built-in PM ops to fetch.
+	 */
+	drv = devm_kzalloc(&sdw->dev, sizeof(*drv), GFP_KERNEL);
+	if (!drv)
+		return -ENOMEM;
+
+	dev_set_drvdata(&sdw->dev, drv);
+
+	return sdca_class_probe(sdw, drv);
+}
+
+/**
+ * sdca_class_remove - SDCA class SoundWire slave remove helper
+ * @drv: caller-owned sdca_class_drv (the one handed to sdca_class_probe()).
+ *
+ * Cancels the deferred boot work so devres can safely free @drv and the
+ * embedding codec priv without racing class_boot_work.  Codec-specific
+ * SoundWire drivers that call sdca_class_probe() must call this from
+ * their .remove with the same drv pointer they passed to probe.
+ */
+void sdca_class_remove(struct sdca_class_drv *drv)
+{
 	cancel_work_sync(&drv->boot_work);
 }
+EXPORT_SYMBOL_NS_GPL(sdca_class_remove, "SND_SOC_SDCA_CLASS");
+
+static void class_sdw_remove(struct sdw_slave *sdw)
+{
+	struct sdca_class_drv *drv = dev_get_drvdata(&sdw->dev);
+
+	sdca_class_remove(drv);
+}
 
 /**
  * sdca_class_system_suspend - SDCA class system suspend helper
-- 
2.53.0

