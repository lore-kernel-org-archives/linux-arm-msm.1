Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692D84FD279
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 13:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737586; cv=none; b=d2NQ6ZR9F871eLGR8zifjSFlFZ8AiA38PHEnyU1nQjwdyjdajRyKlRDrHzCxm7brmoP+yq+0IYmk4Btk7eeRmrRdWLzHVj3KzbDtn/6dpbUgeSenUxNxD33zInYNPrsZ861/mAbChhmr1ulxCyClVNWveajbNvJIzdtCBGqz4PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737586; c=relaxed/simple;
	bh=sTtAcC6DTgTsyia/QnLhKcG49gomKemayk5z0N7ppgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=um/qRKDc0XdvCMC2na9VxrCm/qXx8Ir6Z5IsF3cULNDoqYw8mg/tT3Kn5nl0OEIe7meCukkBdG0/ZGDGD4JwNXKWCAvHpFlFUShtC7zGOUvieGzI7S+uW2G6+wPYhIr/V6gCBxfcj9vTyDiuOug1xgXpDwdzTBEQtMypwlvuCPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TEHxDQUS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SGgyEiKr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TEHxDQUS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SGgyEiKr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ICudOD955377
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 13:19:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xB2gDVEaK5Q
	aG7cBbuSlX5M4RqhKQThd1pOV5mauDU4=; b=TEHxDQUSuk8pVqu2FLWz+zV9Co2
	fBsy7HYnK+E036ypihcHZTaaHUF9I33nQI9FdBm+aDcFfPNtGpCRjVNEE4sigIxk
	Rl4e3Ubyx2ImRffUkjlfk/Y9PQujLU41MyQnp5sYP1nkkfGmIHyp1+NZYEdumpqA
	xovUI33QjdoA6rfd/gJ1ZFdNaKgiW4NcjxOVCqMCGrjIBJ10laR4WQ4+fPbm3Rmd
	2B9NnT/iKICeEjHSHkudwAO1bzAglIr844ue3dDtvD21N6AHDgGiBHP+G+p7rTDN
	6SRh2vPfiIt9L+gxni+3fHY2svCh8+b5amez2wKGmbwf3N79xZDrJqtTEtg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grnqec3t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 13:19:42 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97cb18cfa04so435576241.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 06:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789737582; x=1790342382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xB2gDVEaK5QaG7cBbuSlX5M4RqhKQThd1pOV5mauDU4=;
        b=SGgyEiKrEvkpgCTb5ul16eBqG7VRJ6QJtz7pa9zPln2eJ8oANeJcWU9VP57CButJIh
         ggUBJJ71Ni+hfz1uVKZa88sa+WKFzGUxwczeQEslhOyV0Irf9wT3A7UTv8JZwst4sHiW
         r1etdKnBYNtK4Z/IsZF/2OD2V3spUXs9LY3ewU/jgrsTiU5q5lbnIW2xmRyCR2QKwJpM
         1qhvWUX+7CmnRLpEpzQEQlp9NmYlmProE/QDmeJhXLwisFFbcDgwRIzPoqoNw3222ZSw
         lc5+jyFsg2EUlInpAmk1sZx4UOWjtZghpM/p/UUGQDosGbMXMpyp7PYuK9AbSghtNdwA
         pKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737582; x=1790342382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xB2gDVEaK5QaG7cBbuSlX5M4RqhKQThd1pOV5mauDU4=;
        b=UP+anqTpP3rbVp2eIEv/cfzF25YfsRoln9ku5uINI+mHRmUmgPjoeh+Ov1b1AX57jo
         MeHZAZEEZz9UMgNYNH+3JBH1U2KswDjZP3gLMv/Dsgc70xJhWB6EKjjuZhd7N0BV0JYb
         aRHkjeF0b1veKaAMUyUfvrd6YjOPZSm2PzMj2kQtY9Fd42s6aLnpEV08Cw8cTrIU0zqV
         3vYUE/Y80Mlv6BQa4bPcrABdE3pma1ZoV67oTgmypn3XCldCvzEJSZ0R8owUlJ5LN1Nt
         uN5Xc4fL2NuFt4hDZyhtiVGCOqkqDUZmGl9YrgDZqDHYF2H1fs+LZsbMP3Z/xJY5bxpz
         zSxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeY2hgbQlFUzGwDYzvsVT1OXQxP7hoLJdzH+WP95pFEfT2VBsN3iFsL4RSJhm+ln4CVLkko3G38qpGsx7C@vger.kernel.org
X-Gm-Message-State: AFuF++nxa2uRV4ekKnS6Spy3DJjOST+hojGCwu5erhezG7sCwvoNLJlw
	q+dfzBwY3/XDjeMTk5QFGTP0XMjEQGoGdvpxDpJ6mDJqZ2DZPGrpk0kOVvpSU7FZge109i24W0G
	xW658tzHYypSXO2Nt0TlRUoyr47uVsRIHOk/wtFRzbvQrRaJvNncQzD3mQvpadD2d56UC
X-Gm-Gg: AYBFou02+f5qCWYvTUuQ8dyOXd9VJRJuDKzbdjam+lDGy9FzKljN3vRipqRCyCxHzhz
	2SbtS2m863bZmD6VkUwwLSWc/m9LFiXA9aeu5xVl/RcQYSXTorUOBLLLUniCHtcg2ES4zFNebiy
	Z6KH6jN/6+1t4GAwHSb09XbfUA8rcYAlh03yubK1CpYp2Lfe1jSX7rTwp/td1gjWEXLOX2Hcy98
	V6tVDJncQosMW8wu0OeZrnObbwES82feV9MOmEjzUmthCmzHE5l41aBPK0JRoFEAzPospMaeV9+
	xkMnpW5TgUwE1s2DKFou995Io42tIzJqiY1b51lIA+mByB9/EeVxf3xPVmYZXGj/ztzXDCZ0OWD
	2K5kuopNJSk9WPw==
X-Received: by 2002:a05:6102:54a4:b0:79e:221f:704 with SMTP id ada2fe7eead31-7a55ad375b7mr1085442137.7.1789737582311;
        Fri, 18 Sep 2026 06:19:42 -0700 (PDT)
X-Received: by 2002:a05:6102:54a4:b0:79e:221f:704 with SMTP id ada2fe7eead31-7a55ad375b7mr1085296137.7.1789737574250;
        Fri, 18 Sep 2026 06:19:34 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7cebae2sm48254015e9.8.2026.09.18.06.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:19:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 4/8] ASoC: SDCA: add class_ops with populate_function
Date: Fri, 18 Sep 2026 14:19:09 +0100
Message-ID: <20260918131914.681588-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9EXzDzlGfsja7ZKkx7mWfYQ9RnFuP_RZ
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6aad3a6e cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=RDHKc21CrRhZfFRGvR4A:9 a=O8hF6Hzn-FEA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: 9EXzDzlGfsja7ZKkx7mWfYQ9RnFuP_RZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4OSBTYWx0ZWRfX2GeWVVe5hV0B
 xU00XyU1eAeRFbWeWt9PysZZ7W8cozqMmKTq9ztY/Obf2okw8ZDwTQWtWLhKJJE+8eg99ABkCDy
 FPtfUZPocKnrBrWCzeustf3xi1WtIryLeIxolc52P7CUdX35M6EgVvho+fgceuqBtdJFlUGQO3f
 obWqEtCV/YUtkClfkuFxkgjDhxttL6x89b92T42Jtll5uJb2O8t/n4V13ViRMIHkGc6JIMn065Z
 ZGPo3GecNmGwdMUkrMehy/EaynM/2qifv40yet354MoyruJx2b/7P+D4hGz2pHkL21TpXyeSRMz
 +7wPkncOgTzTCfaRNo1zMKKky6/IKdp7K2f6mbaE/bVXx5HraM6hUfZFNcjuKicAd94FBNC+RgS
 ng0B/yBoiYDblD4fzVqj44pMpoNwePSEMDHWwOBAZtxHqx0Qq2j4BHCbiVZ6mJybIMLuYw+iuQE
 txvbYlIfM31Z3seu4VA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE4OSBTYWx0ZWRfX0WaFNcjkKOkA
 ddNS8DG/im9teVokbYdr6Qxcq0eAwXpeQGRHCEXJHUXx1n0JGHyqEEMVSjddoqlG1v3+QyROFsP
 ch3nOI8dt+VL546+ujsamvG9cqJpTiY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180189

Add struct sdca_class_ops with a populate_function callback that lets
codec drivers supply the SDCA topology (entities, clusters,
init_table, ...) from static tables in place of sdca_parse_function()
on DT/non-DisCo platforms. The callback is a pure data source and
performs no bus I/O.

Codec drivers embed sdca_class_drv in their own priv and register
their populate_function through class_ops passed to
sdca_class_probe().

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/sound/sdca_class.h           | 18 +++++++++++++++++-
 sound/soc/sdca/sdca_class.c          |  9 +++++++--
 sound/soc/sdca/sdca_class_function.c |  9 ++++++++-
 3 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/include/sound/sdca_class.h b/include/sound/sdca_class.h
index 9e6b0eab8a0e..90af5b914ba3 100644
--- a/include/sound/sdca_class.h
+++ b/include/sound/sdca_class.h
@@ -20,6 +20,18 @@ struct regmap;
 struct sdw_slave;
 struct sdca_function_data;
 
+/**
+ * struct sdca_class_ops - optional codec-provided class callbacks
+ * @populate_function: fill @function (entities, clusters, init_table, ...)
+ *           from static tables in place of sdca_parse_function() on
+ *           DT/non-DisCo platforms.  Pure data source; performs no
+ *           bus I/O.  Return 0 on success or a negative errno.
+ */
+struct sdca_class_ops {
+	int (*populate_function)(struct sdw_slave *slave,
+				 struct sdca_function_data *function);
+};
+
 struct sdca_class_drv {
 	struct device *dev;
 	struct regmap *dev_regmap;
@@ -27,6 +39,8 @@ struct sdca_class_drv {
 
 	struct sdca_interrupt_info *irq_info;
 
+	const struct sdca_class_ops *ops;
+
 	struct mutex regmap_lock;
 	/* Serialise function initialisations */
 	struct mutex init_lock;
@@ -34,7 +48,9 @@ struct sdca_class_drv {
 };
 
 /* Library helpers used by codec-specific SDCA SoundWire drivers. */
-int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv);
+int sdca_class_probe(struct sdw_slave *sdw,
+		     struct sdca_class_drv *drv,
+		     const struct sdca_class_ops *ops);
 void sdca_class_remove(struct sdca_class_drv *drv);
 
 /*
diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index 0e6dead41495..79fdb672be1d 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -144,6 +144,8 @@ static void class_boot_work(struct work_struct *work)
  *       allocation and sets its own dev_set_drvdata() -- the framework
  *       does not touch drvdata.  Typically embedded in the codec's own
  *       priv struct so codec drivers can keep per-slave state.
+ * @ops: optional codec-provided class callbacks (may be NULL for
+ *       pure-generic SDCA parts that need no quirks)
  *
  * Codec-specific SoundWire drivers call this from their .probe after
  * allocating a struct sdca_class_drv (usually embedded in their own
@@ -151,7 +153,9 @@ static void class_boot_work(struct work_struct *work)
  * sdca_class_drv fields, sets up the class regmap, and queues the
  * deferred boot work.
  */
-int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv)
+int sdca_class_probe(struct sdw_slave *sdw,
+		     struct sdca_class_drv *drv,
+		     const struct sdca_class_ops *ops)
 {
 	struct device *dev = &sdw->dev;
 	struct regmap_config *dev_config;
@@ -169,6 +173,7 @@ int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv)
 
 	drv->dev = dev;
 	drv->sdw = sdw;
+	drv->ops = ops;
 	mutex_init(&drv->regmap_lock);
 	mutex_init(&drv->init_lock);
 
@@ -213,7 +218,7 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
 
 	dev_set_drvdata(&sdw->dev, drv);
 
-	return sdca_class_probe(sdw, drv);
+	return sdca_class_probe(sdw, drv, NULL);
 }
 
 /**
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 411e3d717bb6..d83be8474e7b 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -329,7 +329,14 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 	drv->core = core;
 	drv->function = &sdev->function;
 
-	ret = sdca_parse_function(dev, drv->function);
+	if (core->ops && core->ops->populate_function) {
+		ret = core->ops->populate_function(core->sdw, drv->function);
+	} else if (drv->function->desc->node) {
+		ret = sdca_parse_function(dev, drv->function);
+	} else {
+		dev_err(dev, "no firmware node and no populate_function hook\n");
+		return -ENOENT;
+	}
 	if (ret)
 		return ret;
 
-- 
2.53.0

