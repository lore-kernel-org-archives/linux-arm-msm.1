Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56784E06DD
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 16:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352690; cv=none; b=UknYtRuuQ4fvKI3J99BAZNGmx/CeyxZxei2fqkeYhfLvWGpfjktjN8bRdkfjPOnVkfH9gV6zrb/JcBuFQZ3lDAVIwc/hTUx3k0mpsVh7olmWZQIhtHqPgtT9FhprfIQzlIplHxr7YBTrZ1oRIfaNZytR+lN3c+zC+im6QxGHM4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352690; c=relaxed/simple;
	bh=4dhgjm398m/ETEt5uEgSrrj3Rc/izKTfRSl9s7ITdS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bdhcfv7Lz4BFCErV1HEPBJ9i12bT74JOuBNAcahw8SxurzHlMydXHoweb2hotqUD/Ze3yq2Ds0U6Uu9TqGMKtqfG3PfmT8uiJIR6lEaoHCAf7cSh1kZg492yFC0c2dd7izjFV2sjH55qeGX+KrzKHORkopDReCs3ltb/EG5d4yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=itgl/S2f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kEt63Hc+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="itgl/S2f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kEt63Hc+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG0gLw2515742
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 16:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JIPcTXD3grr
	fQWrBYj3DIhbI58SA8jam/6/w84NcOZA=; b=itgl/S2fHwKUtrzDR6htj9CJmzn
	9YRPaJSG6SaRPHq/aQ8Dp+jSgumVuZsB7Lji+V3TPT1YjUXvnFd2Bpi7+Btibm55
	MCn5q/wW61L7hkCVI48RHYSw8Q2ngaXGoZO4jcGKlIqIGWkd5CoQgscxjCSS5Hi+
	FXKQRnWLskEOutvBQ3yVlsa2+mw4IBzHvDOVew5DhE8tl+a0Ywz1ta6A5zc4TQVk
	KQ4p7nRScY5gIToF9jAAax+SSqG7cpqsHTEvj4fAY2tKPF5kP/TdeJ4qfhcWe5lQ
	dcDCS3iUP6UEtjtABZ7r+jSix9xfyezjFszWIu4rmcOkvbp78xjHkN5cfBg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwce7b841-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 16:11:26 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7866c4ed349so868929137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790352686; x=1790957486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIPcTXD3grrfQWrBYj3DIhbI58SA8jam/6/w84NcOZA=;
        b=kEt63Hc+Er9qQcYd9HUGuO4sKSE2eurqyO6cou9qFp/qNfbko0B1BOKrFL45OQzfH4
         Kdti/i4QgkvYYAeUxyVy2T6xRIbpc9NIMfVhSTn75gVMARXcOMOh6zUWDSEAYIATndfX
         40gzfnvfMEGPsu0Ky+Sf37DxeSLH7Hwj5l9SyIQSJrxVufWmOC1z5HmbPUTSHs+uEIFJ
         GMIiV1HWYaz37rgGYqmVt6gfd64taiZqrXzN31K3QqUX9ZElVwn/+QK7MhAI00Rtl8ls
         fh9rSiwvm06orG93HM6R6t4PvmxJFTCcs2HwnUnJ0Cjbc+cIkx/AoGo79x6sf6yRGEc1
         rZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352686; x=1790957486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JIPcTXD3grrfQWrBYj3DIhbI58SA8jam/6/w84NcOZA=;
        b=w0ZRklbodfVhOYw1A7nKwu5u61pTJCE+1y3famhYhWzCrEvqxqzMcCXnpP9TOJMCd0
         KqjhR7kHeAh0CnQ/QrMDBIhd3FUo880BDwRBfP4B8YKifTHDDXdd83iS7meZJ7Ope7DS
         wpL4yHRYV88B5qhbnCdoM4xSf7tHVo16oOIrTcVJZiPVcb1EZzMH/URmuO5vzhPywagG
         HnR7vs7KEE9H/khhatLkMUAMD/jV0kwJeF07ofOWx+NsI2dxOm9GtPBvMLGS6qz5iL0J
         jPeOLK4DsPuYwTkbwVzKEuPPsp6Y6+UtfroTV5lAu5Jd6jR7794KJqCehyp16Q06wS3g
         zezg==
X-Forwarded-Encrypted: i=1; AKwUvByjmVVKA0t95OOQYoTKZ20xbg/14ZRFl7tCYA8YCzT9RTfEopHuQmsCN9PAajx6qP2z3Lcui9H0+VVIFoJb@vger.kernel.org
X-Gm-Message-State: AFuF++mGv6rkimU56H1Q7amcDkor7AwTTw1d9ZRS6T2W7P1O9owz+4a7
	kwyu3O+fv+/Gta+gupXxnThIptKJw7AElk4AnMqwd9iz9aDQC2t6+mpGHea67KTK3+2ucF+b/yn
	YYhv+avkYcn2bGJIQkLD4pcdgHf49+Le282ug5xpC8H8CeBeW8Q5Xn9nWXjKjV3XXpOJ5
X-Gm-Gg: AYBFou3CPCmXBAqcjbe8jM513OZfwStVLG8Fg7JjxSsSwEGPRBzEzVd5eoBIIrj6Yku
	Nwu9s3uxNSYGVru/1PsqFPqIO6u2z4uYzgiBVtwiXObtRYjKIToEP/+Y0SoNr5Z2GdwfzIozXAZ
	BgIRH1PvUhnB3LeXrcBsMvMFDjMaTIxBZWL+3jpd4Mlvu2ONNix9nv6x3Qth3Un+4bTFBhAzFtM
	cLyrlGGvlKKpqIgFVYt8lb+dET9Sdbe1NrhIpiVLUhQuv7fexHjfaVq5h2dazcOb3eJ/f309AJM
	zS9zGk+ue9wJYWg1MR5WgAY1Mv5yfS3nc4svw4XxjIN5Itlb08LgrwxZdoiJno24E8fpYhQSJ58
	Ueh7hp5n/t6Dv
X-Received: by 2002:a05:6102:6411:b0:7a4:a8c4:42bf with SMTP id ada2fe7eead31-7af1e4f2df2mr2051168137.17.1790352685659;
        Fri, 25 Sep 2026 09:11:25 -0700 (PDT)
X-Received: by 2002:a05:6102:6411:b0:7a4:a8c4:42bf with SMTP id ada2fe7eead31-7af1e4f2df2mr2051141137.17.1790352685068;
        Fri, 25 Sep 2026 09:11:25 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06b4d45sm73019505e9.7.2026.09.25.09.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:11:24 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 3/7] ASoC: SDCA: expose class SoundWire probe/remove as library
Date: Fri, 25 Sep 2026 17:10:44 +0100
Message-ID: <20260925161049.758913-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925161049.758913-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260925161049.758913-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CTrcrNIenDOc4Ij7HZ3AdZd2qfVdegzX
X-Proofpoint-ORIG-GUID: CTrcrNIenDOc4Ij7HZ3AdZd2qfVdegzX
X-Authority-Analysis: v=2.4 cv=NJFAaE6g c=1 sm=1 tr=0 ts=6ab69d2e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=mVpuNYMqi7MQLQPxcREA:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2NCBTYWx0ZWRfXx44XqoK/J2qW
 x1QMNkhk8ClCjAs3sanFmRDlbk0WJlJmqtGczX9gZ4hwwDCzjUCe3Nv8oVzs84hq5nrSP3A0DyX
 1NiFopxUOSagySFZGTUWdn1Y3KhQvUFJh1xfKR6uVoAM7vBRt66mwtOcHTSkbWXvdqyANFKOt+E
 2x9IOqXH+NeyQgHNS60v/aasTBELP8FGudFC3GK13vH9A6b5oT7AB14Lv8PC3WyiXBm8mM2i9xp
 9QBaR8urRAmJttPB8VYvX3BtWI7oOq9dAtsaU4KFoZSyv+wHdBO5IPqSj+76NWOWJ6Wj6gsZXBo
 tIo1WODwZjrVZvwgAidWMJ3RHJkSsjBcUJ2IeEQ2EzzinRugBKtMDj5xOKtac6kZGl+FltYMlw/
 Sgy0k3KBA7P8d9hLRN8lVLWyh0RYtIl3QacHTFJ4TKMfV0qDY+yBGTfmxrjvMYs7sFva4l2FO8+
 EUKE9Zb/IMtlWywSA1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2NCBTYWx0ZWRfX/HXjd5mMP250
 ojelX92PD4qSV7IiffReCHXiAJSmsg4kwEJIVt+CTFyn++Cnyeco3XxTqV1d7ZUBvz/YknM0UB6
 tfhjSHP+qQxC12e068vPUjBpLMAPWjI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250064

Split the internal class_sdw_probe/class_sdw_remove functions into
caller-friendly library helpers:

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
next patches add the class_ops mechanism on top.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/sound/sdca_class.h  |  4 +++
 sound/soc/sdca/sdca_class.c | 62 +++++++++++++++++++++++++++++++------
 2 files changed, 57 insertions(+), 9 deletions(-)

diff --git a/include/sound/sdca_class.h b/include/sound/sdca_class.h
index 8a6a34a8dd4c..890c2dbd88a2 100644
--- a/include/sound/sdca_class.h
+++ b/include/sound/sdca_class.h
@@ -32,6 +32,10 @@ struct sdca_class_drv {
 	struct work_struct boot_work;
 };
 
+/* Library helpers used by codec-specific SDCA SoundWire drivers. */
+int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv);
+void sdca_class_remove(struct sdca_class_drv *drv);
+
 /*
  * PM helpers.  Codec drivers embed sdca_class_drv in their own priv,
  * own dev_set_drvdata(), and compose these into their own dev_pm_ops:
diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index a092ebaa620a..0e6dead41495 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -136,18 +136,31 @@ static void class_boot_work(struct work_struct *work)
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
@@ -159,8 +172,6 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
 	mutex_init(&drv->regmap_lock);
 	mutex_init(&drv->init_lock);
 
-	dev_set_drvdata(drv->dev, drv);
-
 	INIT_WORK(&drv->boot_work, class_boot_work);
 
 	dev_config->lock_arg = &drv->regmap_lock;
@@ -185,14 +196,47 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(sdca_class_probe, "SND_SOC_SDCA_CLASS");
 
-static void class_sdw_remove(struct sdw_slave *sdw)
+static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id)
 {
-	struct device *dev = &sdw->dev;
-	struct sdca_class_drv *drv = dev_get_drvdata(dev);
+	struct sdca_class_drv *drv;
+
+	/*
+	 * Pure-generic SDCA parts: no codec priv to embed, so allocate a
+	 * bare sdca_class_drv here and stash it in drvdata for the
+	 * built-in PM ops to fetch.
+	 */
+	drv = devm_kzalloc(&sdw->dev, sizeof(*drv), GFP_KERNEL);
+	if (!drv)
+		return -ENOMEM;
 
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

