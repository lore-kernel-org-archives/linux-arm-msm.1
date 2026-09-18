Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E726F4F4CFD
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 13:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737577; cv=none; b=PwHgueuRlaHwvDjDyXDIoP2hZF8i4dd5ECk1uHkst0UfQ6jzA/l5Ws4m6luSQ6KIVc9/dNfqilpJdSY8p+G9f7pvAjdAtllNlzpPOzd4+iTkEvRG3sutnXt2eQgGAy673lgdbi63UJbOdxVtz/yhUP470+3UTpbs7bRM80/cFjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737577; c=relaxed/simple;
	bh=DX/k2+cTu6rvPz9eR+rvoARBCOb7oGx3eJBOQvcqBx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qnVveAuItNVghKEfj0x49ItUeQPzbehJLVW/0aS1naO1JktGwxXJRDBArhChPKd45jIZyGV4OmwKsvEBu4mANGwSsYHOXy3gQ5W2pUddGYBdkNptoC+sAY1mW9/Hv9FXPD2GPNLfU+Tp08mHKhFlvOgEt908GWG48qyOqZQCisA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nii4CUWj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DE19lT6c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nii4CUWj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DE19lT6c"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ICtxsb3584218
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 13:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AAXGraH2Q+c
	EaofkWeUO4doE1Ao8y1Vg8kmDtzDBeow=; b=nii4CUWj8WbCxPkAWdf2bEU/VoF
	rg7eX/S4pZUEiT56LBWT5LxSliMJ/QiPyswGFaUSHXxEhKhzUEmsN1cLbFs7Og+n
	GJ8rkGQOyQfpITChxvWPfJ9PQUEj+kyWsSMBU8iZav8FnE5gMXdbtPX51hNLj0F9
	KGLZt9sja3q11iIf9oLl5Ji6FwjR62xK95IbwAEsVdq+s3GwD7FmTgD4ySGbrYiq
	PB/D2mOqzbcdh03tDbP0JbQy6El0HjWrzwk8uQfWzRTTMwCs1S9t8NiODwDA0g0W
	kbrmj92hcjyGAZOHP7joCcYVwMSEUmElGh2JWr/bt3JQ1mybvPltnXyvxeg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs37dgpr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 13:19:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so141533785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 06:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789737572; x=1790342372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AAXGraH2Q+cEaofkWeUO4doE1Ao8y1Vg8kmDtzDBeow=;
        b=DE19lT6cNXK7HufNih5FhK0EbHhluLxlhm2G2TnDNEz/+rqqZLTPmT6FpDpflgeL6x
         ztn3FErRkGuSVhmFmaT78tZbHDUmoaSA1X9KqI+qPIYUHOxMyN1MTacYkqjsVzEK2RWj
         Yn1108MWhaPD67Sw7QAMk8nv3FIkh22YdeunwnFrcDvLY5lxYOLun1+5RgNduiFeUP9+
         +ATajoD0CmnAFoiinVgL0/8/VAfqtrR1faZWSZtpP0n276jloT83RHWLazCFsM1PF9hy
         SrMdLvpAVuQY8KSydiKYreGg3qDDEzhHtKEntIEDXhMMFn7M7SemCRYxQ1nulgSCiM+v
         itfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737572; x=1790342372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AAXGraH2Q+cEaofkWeUO4doE1Ao8y1Vg8kmDtzDBeow=;
        b=ExbdppXT0reX8lZY9BHXEr7z9ses5p7EY7M8PHv0u4trRN2TUB9wOBlwh1kedyFV6n
         O77oq7yBfm/5LcJJvMFmBFAJ3qtJPW3bczRA0X5WENjGB0RQgFEjlkoO5VkynCr1W81P
         8G58Wej0O1NxzqBubNwZKb7MPyKwNTGR75ITW5iSQk1jJ8G2pijgkhz7P6TyTwubt15P
         FawmvQvJjHAIZ2GUiOb7KVg5BEuXklBrVCu2RMRBWL2nelK3ohu1xcv85IHHe8oNalqk
         TlCfmKc5DENmJfuMDL+oNfpSmKqhdRWRMq7MoOI3aJc/clxw9x10fOlADvy5BWthDtD6
         02og==
X-Forwarded-Encrypted: i=1; AKwUvByIcVpxx4yzA3i+twCdA4jrUOGsE9mi0gIx6JBo6phomtDbbl8OyHP92pW86i3Jmy6rOV+JeZTqJhw6ty63@vger.kernel.org
X-Gm-Message-State: AFuF++mObePRuOcu3VBnN8qNr3JXz6EvtL5rPM62F/r771x2rfYgmeyc
	yyfr88fS+aNOLrt8WyB6bi0SyF/NpeKGGaR+Zs/SetNOHdMUQeCoPWdlWBefmzGneyJ5A1cVj73
	FHTI6IFV5o9GyeTv6DKMBU9yOcLe5erASOaRUgdDNMs18as50fgDpBJM3CuYm4rU7lBdAU+5RNy
	26
X-Gm-Gg: AYBFou0xYhhzmE3nWgzgTuYBBoSpb0SN+HrCNVSfrokC9DaafYWLTpDtq9D//10Bwzd
	lrNZxjtCh4wRSra8KAWh7B6q6rmnKUVBXvt4m536wgRdiC6XnVy14TtwDh0b0YB2up1KwXCk+UJ
	avOnT4SylVxKxqMRmDpIoM4JF5TrHqojj65ufT+JLd/HIHejVI/V670GfW286lAp2ybdR+gmzSl
	rpnYDMGLTKskeBTdV9XO1EQHyvkuZUl7rCkNGhMpEiAfh2ggP/T3MAJe6gvPAJz8F5bigsmSWL7
	Es+MbtjI/TQGsC3LkDeFq9EkSrfaaWGNEK4s3lYKN1nW6yCtPtKbfqJrScm1zMg1+Kn1oO/XBbu
	IhygoDJDm8O5PFQ==
X-Received: by 2002:a05:620a:268d:b0:939:abe1:ed1b with SMTP id af79cd13be357-93bdc468cd5mr318317485a.0.1789737571774;
        Fri, 18 Sep 2026 06:19:31 -0700 (PDT)
X-Received: by 2002:a05:620a:268d:b0:939:abe1:ed1b with SMTP id af79cd13be357-93bdc468cd5mr318310885a.0.1789737571204;
        Fri, 18 Sep 2026 06:19:31 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7cebae2sm48254015e9.8.2026.09.18.06.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:19:30 -0700 (PDT)
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
Subject: [PATCH v4 2/8] ASoC: SDCA: export PM helpers keyed on sdca_class_drv
Date: Fri, 18 Sep 2026 14:19:07 +0100
Message-ID: <20260918131914.681588-3-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE4OSBTYWx0ZWRfX8TqLqxhu1HHJ
 b3DdVrEU90tTD8TavmIJJod2FDbzpzuQHV3FnYXjdzmedkU6TT95vtNV8aCXKFRCRRbwSWIREFc
 4wJ67hO0o6LjEJJ16b0T8OOUdwtTSc4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4OSBTYWx0ZWRfXwi/FhzfQc+1b
 Qpn08Nhkp0hllUZEk0upziGaZCI0INR0qYLWqd96Gj7xpx/f+5lgDILti6Ua6qFkf4UXtgTp0Ds
 tmDd259nDJpg+U0u3apHW8ebfk1xp0UIU+Omf3K7UVPt1/FFfgIWLgk1p2XTVCDTPleIQ4xcnMC
 o+/N6FXgCiPFur+OFlu+sqbt070t2Lbc07MOHfLHUM1KhxJIRjR9cp8zmeBvfxDdGqvwjrQl+tn
 mtVEZ4bxkAYeF2OtcILe4fe4NMjy3GUv5Xvdn/NOFmcy+Tq+guAwzZmzmWGDQtVRZSazgaP8q7C
 42ntY5XEs5SBcISPXEJoSFn8HdSf5BpsKmFyOg+n79dj4iAyzxsNWQC/k+HzXSmid+4k5dEInxA
 6GmISJdpxA1nAAN3xvmPWq86AYGBaXQlXATfAhekGZjk4HZLmnbcL0WpRBzo7srB/pijuNw0Y6R
 oimzno5BX+NVMbKlL6A==
X-Proofpoint-GUID: 3d6hmpQPXHHfOGgcWxT7mOHk6bWJ2y7x
X-Proofpoint-ORIG-GUID: 3d6hmpQPXHHfOGgcWxT7mOHk6bWJ2y7x
X-Authority-Analysis: v=2.4 cv=R+mWitRX c=1 sm=1 tr=0 ts=6aad3a64 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=3PQulrMEHypX3zRcvmEA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180189

The class PM callbacks pull sdca_class_drv out of drvdata, so the
built-in class_sdw_driver owns the drvdata slot.  That works for the
generic case but blocks codec drivers that want to embed
sdca_class_drv in their own private struct -- they need drvdata for
their codec priv.

Split the four callbacks into exported helpers that take a
struct sdca_class_drv * directly:

  sdca_class_system_suspend()
  sdca_class_system_resume()
  sdca_class_runtime_suspend()
  sdca_class_runtime_resume()

Codec drivers can now compose these into their own dev_pm_ops without
going through drvdata.

For the built-in class_sdw_driver, add small dev_pm_ops wrappers that
fetch drv from drvdata, wire them into sdca_class_pm_ops, and export
the ops so any generic SDCA slave can pick them up as-is.

No functional change: the built-in class_sdw_driver keeps the same PM
semantics; only the internal plumbing shifts to operate on
sdca_class_drv instead of struct device *dev.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../soc/sdca => include/sound}/sdca_class.h   | 15 ++++
 sound/soc/sdca/sdca_class.c                   | 81 ++++++++++++++-----
 sound/soc/sdca/sdca_class_function.c          |  2 +-
 3 files changed, 79 insertions(+), 19 deletions(-)
 rename {sound/soc/sdca => include/sound}/sdca_class.h (57%)

diff --git a/sound/soc/sdca/sdca_class.h b/include/sound/sdca_class.h
similarity index 57%
rename from sound/soc/sdca/sdca_class.h
rename to include/sound/sdca_class.h
index 57f7f8d08f49..ce2ed5f33e7a 100644
--- a/sound/soc/sdca/sdca_class.h
+++ b/include/sound/sdca_class.h
@@ -15,6 +15,7 @@
 #include <linux/workqueue.h>
 
 struct device;
+struct dev_pm_ops;
 struct regmap;
 struct sdw_slave;
 struct sdca_function_data;
@@ -32,4 +33,18 @@ struct sdca_class_drv {
 	struct work_struct boot_work;
 };
 
+/*
+ * PM helpers.  Codec drivers embed sdca_class_drv in their own priv,
+ * own dev_set_drvdata(), and compose these into their own dev_pm_ops:
+ *
+ *	static int wcd_runtime_suspend(struct device *dev) {
+ *		struct wcd_priv *priv = dev_get_drvdata(dev);
+ *		return sdca_class_runtime_suspend(&priv->class);
+ *	}
+ */
+int sdca_class_runtime_suspend(struct sdca_class_drv *drv);
+int sdca_class_runtime_resume(struct sdca_class_drv *drv);
+int sdca_class_system_suspend(struct sdca_class_drv *drv);
+int sdca_class_system_resume(struct sdca_class_drv *drv);
+
 #endif /* __SDCA_CLASS_H__ */
diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index d7444f442c71..a092ebaa620a 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -20,7 +20,7 @@
 #include <sound/sdca_function.h>
 #include <sound/sdca_interrupts.h>
 #include <sound/sdca_regmap.h>
-#include "sdca_class.h"
+#include <sound/sdca_class.h>
 
 #define CLASS_SDW_ATTACH_TIMEOUT_MS	5000
 
@@ -194,30 +194,41 @@ static void class_sdw_remove(struct sdw_slave *sdw)
 	cancel_work_sync(&drv->boot_work);
 }
 
-static int class_suspend(struct device *dev)
+/**
+ * sdca_class_system_suspend - SDCA class system suspend helper
+ * @drv: caller-owned sdca_class_drv.
+ *
+ * Codec drivers compose this into their own dev_pm_ops.  Disables the
+ * SoundWire interrupt and forces runtime suspend of the underlying
+ * class regmap.
+ */
+int sdca_class_system_suspend(struct sdca_class_drv *drv)
 {
-	struct sdca_class_drv *drv = dev_get_drvdata(dev);
 	int ret;
 
 	disable_irq(drv->sdw->irq);
 
-	ret = pm_runtime_force_suspend(dev);
+	ret = pm_runtime_force_suspend(drv->dev);
 	if (ret) {
-		dev_err(dev, "failed to force suspend: %d\n", ret);
+		dev_err(drv->dev, "failed to force suspend: %d\n", ret);
 		return ret;
 	}
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(sdca_class_system_suspend, "SND_SOC_SDCA_CLASS");
 
-static int class_resume(struct device *dev)
+/**
+ * sdca_class_system_resume - SDCA class system resume helper
+ * @drv: caller-owned sdca_class_drv.
+ */
+int sdca_class_system_resume(struct sdca_class_drv *drv)
 {
-	struct sdca_class_drv *drv = dev_get_drvdata(dev);
 	int ret;
 
-	ret = pm_runtime_force_resume(dev);
+	ret = pm_runtime_force_resume(drv->dev);
 	if (ret) {
-		dev_err(dev, "failed to force resume: %d\n", ret);
+		dev_err(drv->dev, "failed to force resume: %d\n", ret);
 		return ret;
 	}
 
@@ -225,11 +236,14 @@ static int class_resume(struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(sdca_class_system_resume, "SND_SOC_SDCA_CLASS");
 
-static int class_runtime_suspend(struct device *dev)
+/**
+ * sdca_class_runtime_suspend - SDCA class runtime suspend helper
+ * @drv: caller-owned sdca_class_drv.
+ */
+int sdca_class_runtime_suspend(struct sdca_class_drv *drv)
 {
-	struct sdca_class_drv *drv = dev_get_drvdata(dev);
-
 	/*
 	 * Whilst the driver doesn't power the chip down here, going into runtime
 	 * suspend lets the SoundWire bus power down, which means the driver
@@ -239,10 +253,14 @@ static int class_runtime_suspend(struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(sdca_class_runtime_suspend, "SND_SOC_SDCA_CLASS");
 
-static int class_runtime_resume(struct device *dev)
+/**
+ * sdca_class_runtime_resume - SDCA class runtime resume helper
+ * @drv: caller-owned sdca_class_drv.
+ */
+int sdca_class_runtime_resume(struct sdca_class_drv *drv)
 {
-	struct sdca_class_drv *drv = dev_get_drvdata(dev);
 	int ret;
 
 	ret = sdw_slave_wait_for_init(drv->sdw, CLASS_SDW_ATTACH_TIMEOUT_MS);
@@ -265,10 +283,37 @@ static int class_runtime_resume(struct device *dev)
 
 	return ret;
 }
+EXPORT_SYMBOL_NS_GPL(sdca_class_runtime_resume, "SND_SOC_SDCA_CLASS");
+
+/*
+ * Convenience dev_pm_ops used by the built-in class_sdw_driver, which
+ * stashes its sdca_class_drv in drvdata directly.  Codec drivers that
+ * embed sdca_class_drv in their own priv compose their own dev_pm_ops
+ * using the sdca_class_*_suspend/resume helpers above.
+ */
+static int class_pm_system_suspend(struct device *dev)
+{
+	return sdca_class_system_suspend(dev_get_drvdata(dev));
+}
+
+static int class_pm_system_resume(struct device *dev)
+{
+	return sdca_class_system_resume(dev_get_drvdata(dev));
+}
+
+static int class_pm_runtime_suspend(struct device *dev)
+{
+	return sdca_class_runtime_suspend(dev_get_drvdata(dev));
+}
+
+static int class_pm_runtime_resume(struct device *dev)
+{
+	return sdca_class_runtime_resume(dev_get_drvdata(dev));
+}
 
-static const struct dev_pm_ops class_pm_ops = {
-	SYSTEM_SLEEP_PM_OPS(class_suspend, class_resume)
-	RUNTIME_PM_OPS(class_runtime_suspend, class_runtime_resume, NULL)
+static const struct dev_pm_ops sdca_class_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(class_pm_system_suspend, class_pm_system_resume)
+	RUNTIME_PM_OPS(class_pm_runtime_suspend, class_pm_runtime_resume, NULL)
 };
 
 static const struct sdw_device_id class_sdw_id[] = {
@@ -282,7 +327,7 @@ MODULE_DEVICE_TABLE(sdw, class_sdw_id);
 static struct sdw_driver class_sdw_driver = {
 	.driver = {
 		.name		= "sdca_class",
-		.pm		= pm_ptr(&class_pm_ops),
+		.pm		= pm_ptr(&sdca_class_pm_ops),
 	},
 
 	.probe		= class_sdw_probe,
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 1d7fd6603882..411e3d717bb6 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -26,7 +26,7 @@
 #include <sound/soc-component.h>
 #include <sound/soc-dai.h>
 #include <sound/soc.h>
-#include "sdca_class.h"
+#include <sound/sdca_class.h>
 #include "sdca_function_device.h"
 
 struct class_function_drv {
-- 
2.53.0

