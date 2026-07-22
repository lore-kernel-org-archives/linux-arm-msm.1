Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE1345D5F7
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 23:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784763760; cv=none; b=apnHnUtNHbhrQ3MJdh+5sz9ZOFuy83dHxN40saaOXPTkaisVzND4L+rI+MLWZNFnxXzXi2zUuWSqsxnr50rrRkJ6j37iC1Yo5/7JALi1qiUWV6zS0YGFCWmL9Sjo6IBEyCYsKMwVHeuknpu/4cDCgUIN63qdzA2z9l6cJ84ZGAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784763760; c=relaxed/simple;
	bh=j684rOsac2Qt79mUicIQGsRWvKVbjXmufFgdE3NdzzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oJup9KAAdRGjjFlYc6Yl6QMUFvVrGDTnHv/JQllD62NPupx/+SUUjAvdTVmumeX+EjwDl74j6MbfMInE3qDDmHNJWvMR4Mx7q2S7S6kKZp2L/BtSZ25LBUQ4vJthrH4tniGdFMVm5PuGu5C6nsNAn6uB7bSLF67YUe14ZMrNZ2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HbkoFwYU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gF9mYwmm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HbkoFwYU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gF9mYwmm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MMni5o2141731
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 23:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j0kOWh2iDvE
	MA3XAs4O2/Bne0RHCbtocGHBN4QE9SHM=; b=HbkoFwYU8FND+ztPsT0vo1CFIWQ
	gmjLWSoLfPdF2Y/JCcsdi7jygROGgFUWTI+Oj5b1VXr6gTKKkb2Wkh6GzU2lQw6e
	0WFvTIR1oJjISwTFCQ3Qd1rUkQYH9mds6e0szFa7Q8gF5eyp06AKzlNaXrg1Bgt9
	5O5FMQKiR+wyOhPg/DZhP+BJA2JB0fvRMDNupZXX8fmS6Zf7/10NT3qTdGn6qynV
	WxOnIUGdHYraecrY/Wserx6QHh4yJdnLzkE499LnskP0U5H35G+S/Qm7lY67VJ7W
	jvitV9YXrtK1ebqbvdQdf/AzkoPeimMMDxcRDakKTWU7S+dLWAwQNBvx5Dg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28vhc2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 23:42:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a9764f0so569101cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 16:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784763754; x=1785368554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j0kOWh2iDvEMA3XAs4O2/Bne0RHCbtocGHBN4QE9SHM=;
        b=gF9mYwmmm8Khvu8XQuCKAHCIpfugTilcY+5CMUEX6agpZrl87/VX6Co03eNnxysj8k
         ZEjG6p6Vd+MB5uWnsvU6Q9IiQkOOXJ/TYrO774zuXLJ0h3Cutg5U2qJ7mT2FacYpmQUT
         RVqKXZXczrpj5MgL0yFvwKK/pkqqqmIxUAWVuprhwLDcFol5Rb/cxQOz6X3TtFpbDwBk
         rVkN2eiAjnHcHX2+WZTpeGNtrxNJWbk8SsdzTR5WqMDSbWbZ0GVLFqBjq8Ox7w68uQZK
         92ObUR/uarBxgfx+3AJvBoFM063P+jOKPowXtk+6YKhao11DYdQRx1F3/U+OrP67OPAW
         RYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763754; x=1785368554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j0kOWh2iDvEMA3XAs4O2/Bne0RHCbtocGHBN4QE9SHM=;
        b=JohSgFifvh0dLN37DqmqOpro7tqZuwrno6gKkh6DxVxdLJShlcAhjMIxCs2mz3PLOy
         icPdZHtIqDhIP1osHwBFsf8WRD+2ZjrHVrh4e5Yr2Li9o7em4nHJPibtDEuBOkuqkmXJ
         Y9iNiUwz9puKnOWlp0fgECJN69xdDhnTIbullW6L0UmkCbp+bCfRhqnsGHs7kMWO1pCD
         imnepqZSxxq4ZOyBRt5GXQx1vjHHaSp4ZYz7Kuot/Xh0Yv13q3qewCJfLDRJyk4krZga
         FCST2G/hEdMJSXtC1rXszTtyhc8dj7UtgoEjq61qnootZI35i0qgVd+VwDjvV0CM+Xtj
         2jPQ==
X-Forwarded-Encrypted: i=1; AHgh+RpkBCiJRETKXskINXsIYPW+wxaKx1ZWJdakeCqeTw7kUQcBU6O+L1XAIsl60TF1//3SI5H3bc+bwWWkW+xF@vger.kernel.org
X-Gm-Message-State: AOJu0YyH7HQ4NwdS8j4v+TrumPForD5W8y9drf5c3WvSkEEOmVtnw9JJ
	9+H3cK6XTnOQEvH/O6/i7PbAgmfTyuZL1SNvFqKdXRB9grImC18GHuYbxpFvoqBs18OFYUFfUpM
	qbT6p9VqNgVkF94uc+y4x0mUPyLwE/+5+PJRDVqEO/67jxONwhO+DR5ja1XeaL7y3SnMD
X-Gm-Gg: AR+sD12TNwJvR6WRBoxBZPFM/Mt/TvSVPryReIukp/bLzGqFp3hnyaRy8nZ6KCUxSAB
	yD/USpR8faLKrWh8LbZ6TcQXzkXYY2q82e/nZuC/vVn4FzmAdpQ+eRVDGqxSI9ogyJ9Elp75aCR
	H65Z1dPVC7404A13OHue1fDJVGzWQi1WSqjEOlsdHLsN+A8iMJTlkvORr6FVHOJ6Zoxa8dfHk9R
	GC6ucQY+lPXXJ/lqPJTl+TpADIyX/hE/Z/0inmXIG3MZWwfSCB/WI7RmCnCNo4gHlsfYQb+Wsfm
	ldNTijtMH76TwfGZGxI2FxNmpFzpaGoCP8ilEoGYa48Gx9niABM55XdHDM7TS+ffJk4mMwVChZ7
	2zEd8FoNEvclsTQ==
X-Received: by 2002:ac8:5c8b:0:b0:51c:844f:28da with SMTP id d75a77b69052e-5283ddb1862mr7978321cf.5.1784763753604;
        Wed, 22 Jul 2026 16:42:33 -0700 (PDT)
X-Received: by 2002:ac8:5c8b:0:b0:51c:844f:28da with SMTP id d75a77b69052e-5283ddb1862mr7977971cf.5.1784763752999;
        Wed, 22 Jul 2026 16:42:32 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a4aae16sm101796345e9.0.2026.07.22.16.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:42:32 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 3/8] ASoC: SDCA: expose class helpers with hw_ops for non-DisCo platforms
Date: Thu, 23 Jul 2026 00:42:13 +0100
Message-ID: <20260722234221.884765-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDIzMyBTYWx0ZWRfXyLjmto5dMOVs
 nMA4eMKA38G1PYf1zvJMpaTtKikU5GZV2iLUUQURYyN9gHKP61htONV+RH/aueuDs7uStvS/g5+
 pCVfXPCbPRpM74xOt5ZppiO9K/Y4kPQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDIzMyBTYWx0ZWRfX1GkGh5dVe6EO
 JUG9Jhb2liSOS7mEEN95925gIP6/TWHDFjaXf/cbzhpBls7gzNtruUxP5ZKlmrzgzUr3Lg+TGNx
 Y72NOsYc+dCTq8wo8jnREOSTC5CWLLeo3GuNABhCiJj+iZzb1sxTFe3tFgvwp8q0Y1Puxh3YOJI
 si4+807bspErJOpjIzJaq8MbP8md+TvoSiWgRmnR91wn/sbJ4O+j2jw4C1rhZF0EP6vkgF8GEcU
 VdMeeq0k3lWr8eO82rLxyjfefYxmfI8YAca5qIhjjmG+GbtewuR2wO7s/hXTaN3SY44oaerMzsM
 taXh9K+33MnZNFfid8M7FJdWqegenPLiq/eqYCwTR64/z4vIgw8i1U4RDQxrD3Az4qyPuiNxPj4
 o8qZ36tNXV33DWCze2Yhb72KFMSqO3/KzYrjXXIKa484KV2bxA/orAjduRR5SOy00e0hDCUk7Ur
 /9VSKP+3RgqJamsS8ug==
X-Proofpoint-ORIG-GUID: K0PlumwUBpeTb0n9LfSUzVoLbGJbBWdE
X-Proofpoint-GUID: K0PlumwUBpeTb0n9LfSUzVoLbGJbBWdE
X-Authority-Analysis: v=2.4 cv=D4V37PRj c=1 sm=1 tr=0 ts=6a61556a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=vdTmw_I4eXCyo6tFA2sA:9 a=O8hF6Hzn-FEA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220233

On ARM/DT platforms without ACPI/DisCo, sdca_lookup_functions() is a
no-op and num_functions stays 0.  Introduce struct sdca_class_hw_ops
with hw_init and get_function_data callbacks so codec drivers can
supply pre-populated sdca_function_data and toggle supplies/reset at
probe time.

Convert the class SoundWire probe into an exported library helper
sdca_class_probe(sdw, hw_ops) and export sdca_class_read_prop() and
sdca_class_pm_ops.  Codec-specific SoundWire drivers can register their
own sdw_driver and call these helpers from their probe.  The built-in
class_sdw_driver stays for generic SDCA parts that need no per-device
quirks (hw_ops = NULL).

For non-DisCo boots, the class helper injects the driver-supplied
function descriptors into sdca_device_data so sdca_dev_register_functions()
can create the auxiliary devices, and the auxiliary function driver uses
get_function_data() as a fallback source of per-entity data when the
firmware node is absent.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_class.c           | 83 +++++++++++++++++++++++++--
 sound/soc/sdca/sdca_class.h           | 30 ++++++++++
 sound/soc/sdca/sdca_class_function.c  | 40 ++++++++++++-
 sound/soc/sdca/sdca_function_device.c |  2 +-
 4 files changed, 146 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index 8d7b007a068f..c9a4cce77557 100644
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
@@ -136,9 +145,23 @@ static void class_boot_work(struct work_struct *work)
 	pm_runtime_put_sync(drv->dev);
 }
 
-static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id)
+/**
+ * sdca_class_probe - SDCA class SoundWire slave probe helper
+ * @sdw: SoundWire slave
+ * @hw_ops: optional device-specific hw_ops (may be NULL for pure-generic
+ *          SDCA parts that need no quirks)
+ *
+ * Exported so codec-specific SoundWire drivers can call this from their
+ * own sdw_driver.probe.  For codecs with quirks, pass the codec's
+ * sdca_class_hw_ops so hw_init, DT function injection, and PDE hooks
+ * are wired up.  For pure-generic SDCA parts (used by the built-in
+ * class_sdw_driver in this file), pass NULL.
+ */
+int sdca_class_probe(struct sdw_slave *sdw,
+		     const struct sdca_class_hw_ops *hw_ops)
 {
 	struct device *dev = &sdw->dev;
+	struct sdca_device_data *data = &sdw->sdca_data;
 	struct regmap_config *dev_config;
 	struct sdca_class_drv *drv;
 	int ret;
@@ -156,11 +179,47 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
 
 	drv->dev = dev;
 	drv->sdw = sdw;
+	drv->hw_ops = hw_ops;
 	mutex_init(&drv->regmap_lock);
 	mutex_init(&drv->init_lock);
 
 	dev_set_drvdata(drv->dev, drv);
 
+	/*
+	 * On ARM platforms without ACPI/DisCo tables, sdca_lookup_functions()
+	 * is a no-op and num_functions stays 0. Inject the function descriptors
+	 * from the device-specific static data so sdca_dev_register_functions()
+	 * can create the auxiliary devices.
+	 */
+	if (data->num_functions == 0 && hw_ops && hw_ops->get_function_data) {
+		struct sdca_function_data *fdata;
+		unsigned int num = 0;
+		unsigned int i;
+
+		fdata = hw_ops->get_function_data(&num);
+		if (!fdata || num == 0 || num > SDCA_MAX_FUNCTION_COUNT)
+			return -EINVAL;
+
+		for (i = 0; i < num; i++) {
+			if (!fdata[i].desc)
+				return -EINVAL;
+			data->function[i].type = fdata[i].desc->type;
+			data->function[i].adr  = fdata[i].desc->adr;
+			data->function[i].name = fdata[i].desc->name;
+			data->function[i].node = NULL;
+		}
+		data->num_functions = num;
+
+		dev_info(dev, "no DisCo/ACPI functions found, injected %u descriptor(s)\n",
+			 num);
+	}
+
+	if (hw_ops && hw_ops->hw_init) {
+		ret = hw_ops->hw_init(sdw);
+		if (ret)
+			return dev_err_probe(dev, ret, "hw_init failed\n");
+	}
+
 	INIT_WORK(&drv->boot_work, class_boot_work);
 
 	dev_config->lock_arg = &drv->regmap_lock;
@@ -185,6 +244,13 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(sdca_class_probe, "SND_SOC_SDCA_CLASS");
+
+static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id)
+{
+	/* Pure-generic SDCA parts: no per-device hw_ops. */
+	return sdca_class_probe(sdw, NULL);
+}
 
 static void class_sdw_remove(struct sdw_slave *sdw)
 {
@@ -266,11 +332,18 @@ static int class_runtime_resume(struct device *dev)
 	return ret;
 }
 
-static const struct dev_pm_ops class_pm_ops = {
+const struct dev_pm_ops sdca_class_pm_ops = {
 	SYSTEM_SLEEP_PM_OPS(class_suspend, class_resume)
 	RUNTIME_PM_OPS(class_runtime_suspend, class_runtime_resume, NULL)
 };
+EXPORT_SYMBOL_NS_GPL(sdca_class_pm_ops, "SND_SOC_SDCA_CLASS");
 
+/*
+ * Built-in class driver for SDCA parts that need no per-device quirks.
+ * Codecs that need hw_ops (hw_init, DT function injection, PDE / jack
+ * hooks, etc.) register their own sdw_driver and call
+ * sdca_class_probe(slave, &their_hw_ops) from their .probe.
+ */
 static const struct sdw_device_id class_sdw_id[] = {
 	SDW_SLAVE_ENTRY(0x01FA, 0x4245, 0),
 	SDW_SLAVE_ENTRY(0x01FA, 0x4249, 0),
@@ -282,7 +355,7 @@ MODULE_DEVICE_TABLE(sdw, class_sdw_id);
 static struct sdw_driver class_sdw_driver = {
 	.driver = {
 		.name		= "sdca_class",
-		.pm		= pm_ptr(&class_pm_ops),
+		.pm		= pm_ptr(&sdca_class_pm_ops),
 	},
 
 	.probe		= class_sdw_probe,
diff --git a/sound/soc/sdca/sdca_class.h b/sound/soc/sdca/sdca_class.h
index 57f7f8d08f49..74db9d4ce4a2 100644
--- a/sound/soc/sdca/sdca_class.h
+++ b/sound/soc/sdca/sdca_class.h
@@ -15,10 +15,32 @@
 #include <linux/workqueue.h>
 
 struct device;
+struct dev_pm_ops;
 struct regmap;
 struct sdw_slave;
 struct sdca_function_data;
 
+/**
+ * struct sdca_class_hw_ops - optional device-specific hardware callbacks
+ * @hw_init: called during probe to enable supplies, toggle reset GPIO, etc.
+ * @get_function_data: called when no DisCo/ACPI firmware node is available
+ *             (e.g. DT/ARM platforms) to supply pre-populated static function
+ *             data in place of sdca_parse_function().  Returns a pointer to
+ *             an array of struct sdca_function_data and stores the number
+ *             of entries in @num (must be > 0 and <= SDCA_MAX_FUNCTION_COUNT).
+ *             May be NULL.
+ *
+ * Codec-specific SoundWire drivers pass a pointer to this struct to
+ * sdca_class_probe() from their sdw_driver.probe.  Codec-specific
+ * SoundWire slave property overrides live directly in the codec's
+ * sdw_slave_ops.read_prop, which should call sdca_class_read_prop() to
+ * fill the SDCA-common bits first.
+ */
+struct sdca_class_hw_ops {
+	int  (*hw_init)(struct sdw_slave *slave);
+	struct sdca_function_data *(*get_function_data)(unsigned int *num);
+};
+
 struct sdca_class_drv {
 	struct device *dev;
 	struct regmap *dev_regmap;
@@ -26,10 +48,18 @@ struct sdca_class_drv {
 
 	struct sdca_interrupt_info *irq_info;
 
+	const struct sdca_class_hw_ops *hw_ops;
+
 	struct mutex regmap_lock;
 	/* Serialise function initialisations */
 	struct mutex init_lock;
 	struct work_struct boot_work;
 };
 
+/* Library helpers used by codec-specific SDCA SoundWire drivers. */
+int sdca_class_read_prop(struct sdw_slave *sdw);
+int sdca_class_probe(struct sdw_slave *sdw,
+		     const struct sdca_class_hw_ops *hw_ops);
+extern const struct dev_pm_ops sdca_class_pm_ops;
+
 #endif /* __SDCA_CLASS_H__ */
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 1496a15f7d2a..905c96ed6172 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -329,9 +329,43 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 	drv->core = core;
 	drv->function = &sdev->function;
 
-	ret = sdca_parse_function(dev, core->sdw, drv->function);
-	if (ret)
-		return ret;
+	if (drv->function->desc->node) {
+		ret = sdca_parse_function(dev, core->sdw, drv->function);
+		if (ret)
+			return ret;
+	} else if (core->hw_ops && core->hw_ops->get_function_data) {
+		/*
+		 * No DisCo/ACPI firmware node available (e.g. DT/ARM platform).
+		 * Use pre-populated static function data supplied by the
+		 * device-specific hw_ops instead of sdca_parse_function().
+		 * The callback returns an array of function_data entries;
+		 * pick the one matching this auxdev's function type.
+		 */
+		struct sdca_function_data *fdata;
+		unsigned int num = 0;
+		unsigned int i;
+
+		fdata = core->hw_ops->get_function_data(&num);
+		if (!fdata || num == 0)
+			return -EINVAL;
+
+		for (i = 0; i < num; i++) {
+			if (fdata[i].desc &&
+			    fdata[i].desc->type == sdev->function.desc->type) {
+				*drv->function = fdata[i];
+				drv->function->desc = sdev->function.desc;
+				break;
+			}
+		}
+		if (i == num) {
+			dev_err(dev, "no matching function data for type 0x%x\n",
+				sdev->function.desc->type);
+			return -EINVAL;
+		}
+	} else {
+		dev_err(dev, "no firmware node and no get_function_data hook\n");
+		return -EINVAL;
+	}
 
 	ndefaults = sdca_regmap_count_constants(dev, drv->function);
 	if (ndefaults < 0)
diff --git a/sound/soc/sdca/sdca_function_device.c b/sound/soc/sdca/sdca_function_device.c
index b5ca98283a88..9fecfcfdbb6d 100644
--- a/sound/soc/sdca/sdca_function_device.c
+++ b/sound/soc/sdca/sdca_function_device.c
@@ -46,7 +46,7 @@ static struct sdca_dev *sdca_dev_register(struct device *parent,
 	auxdev = &sdev->auxdev;
 	auxdev->name = function_desc->name;
 	auxdev->dev.parent = parent;
-	auxdev->dev.fwnode = function_desc->node;
+	auxdev->dev.fwnode = function_desc->node ?: dev_fwnode(parent);
 	auxdev->dev.release = sdca_dev_release;
 
 	sdev->function.desc = function_desc;
-- 
2.53.0

