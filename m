Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270BD489880
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 16:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787846912; cv=none; b=DmnImrjP91QJnEsOXqL3MvSUtzild9Jon6XB+zSv0QOcgN+cxGo+cXvPOiroJJtxFx6dqT0rnF1FPALdGcOEKlaHNlFYIOKEh71ZcbvJfi7IPmnlXtZ6ND1RKwJgiAuu4DLppCNw0v71bqMmVUQvX2HrEeK2DkYVS5fhlHvqs9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787846912; c=relaxed/simple;
	bh=W2FvuC3UAMWOvDf9d7cUr0bHheIKwhtwrVu5Kd4enps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g4HfvRNC/mA3+5CLLomYRlPM+ruSYCgCfLzAyfD+7adGkpjxIFC2dKj/QCc7LnnPEKSODK3f4uFYwHQFli54TyV5AQuvDE1K1FeLgmmNNbBnt8DG3rkRQTiq3JI6bD4fojNUEOwxcxm75R3xZX+2xWqD32+pn0bWf0fZ3zvdsag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pK/1FkFp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BAmmouGA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pK/1FkFp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BAmmouGA"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFc2g9866777
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 16:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KYyeQjUxEAJ
	V0K1tV20w0mqSZ8OSewiwvX20cAVBov8=; b=pK/1FkFp/YuVrQVZ3XV5JhZC54Y
	VJvgzkEADr4QJ4o/F1WaTg/G9xHOXw7cAPPNP9sAfoGq8wz0Yeq0zt5NEZU/Q40d
	MSZpXTskA70VTf+iqB6i8ze8y7hxAg98ofTQdT8w6q+Q9kdusm9E5jLTX+2GvizK
	QT4iNEvcCUJRHXiQ4revxxbQAZi6cU7DKuN3WSeDMVRl3hGAumLIDDTi0bXu4cSp
	aUxqOVwXrAOvIiJ/SrRbGTv2gqRuJ811PGjoQYUjC8dIuKB1qyHRTOr+i0n+vqjL
	Rw5rOo3ftrwiNFXktzxQqK7ojYT9N3eaKD2s7P1foMYvsDI+6GwTMHW2VOg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gapgv8m76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 16:08:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-395543dc382so138824a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 09:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787846908; x=1788451708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KYyeQjUxEAJV0K1tV20w0mqSZ8OSewiwvX20cAVBov8=;
        b=BAmmouGAiJWXU1rJ72GBkEmND6IwxL6+kSZ9IpkL8aP1wSonQLAiG8PR5xLmzIVgn/
         YCQRcRJA7k4Iyj/vsDQnffHWRfub2vs+L82SBooFYaNm37qEjJCKxWKDCXlPXFngGL+h
         EzR74rOdg88WpvsF2nP9Vpuv1O+XBOhYfD5f9iohVFWbxhRNgrBJ8xuY18MDvw/TRh+U
         Dq8v1xv5ytqK82y8baMK/h3I2dHksVuRxTY8U/kg8FU6hEd3ufbBmDCW96LG3BZxUh2u
         SUWbPaHZMmJHH40zh20f0TwygLbLy3xMW2gJ6TR7okQPgw/A+D2wq/mJ4o1xnMogbwPu
         tKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787846908; x=1788451708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KYyeQjUxEAJV0K1tV20w0mqSZ8OSewiwvX20cAVBov8=;
        b=Zy2Avo5E54Xeke4bgCz8K5C/PHsnYp7zs10ucj+mf6ogVvXN/bWS5jhmtOMxwltSD6
         vY9G5+yI4XnBWHMbOTOoBLfp6fR2aqRDuEHpDeK9ZEAhS/SPSVGkoxylUJVZli0vwiCJ
         eyLVhLYlYpBsKWe5OBxLjYez5ShxGcSROdccjchM1y1OueJbcif/yNxWO+aeLLcXwHSQ
         0rppKkCzz15HWnSTBhuIXCOW47ma1k4tTNZrk4jwCQMDcOpwafrw1s9L+He6jo1noNJ0
         AyfBDflKd5qx77oEZ3HEnRYng6oDeBLtfumEsYQ19z04HaxC5ae91HgRsGiELJxTSBXi
         tfNg==
X-Forwarded-Encrypted: i=1; AHgh+Rod04trnUb/yipZPgd8WkbbWI4d4a703pe4nd2dXzmULT1TW2VPh2qMzHhIDZLH8vOoa/jFvU8/hr3EaBgx@vger.kernel.org
X-Gm-Message-State: AFuF++miDuRbbUvJAUB/fSEvloF3UE+QEZEGJYkT/5alMHGw7tDlIyWQ
	im+904Dw6tFB2Zbk6khrI5LhZ0knIj/fOsVJq60oAUbS495LOcuBdIp+25TRYBEYNkvnyaf4VQm
	9CZN1m7lRkRNziE5GSjF6emSQTinLtRxQ7g0vwWyjQsGnq1CJtearfilSdjir9/E2eJDt
X-Gm-Gg: AR+sD11Hw1WTAAiTOW2iTb7FWfOksVWfTgzFsKV9KOv/w1cuiR48B/oAamUA5CmZZgY
	wuUWG9GSJf4rkOy8RtupdRS5a1Ec/MYV5UG1Si55n5Te7UbkqqpHKq6NVHIV72/M14nWguFKtv9
	yoxGvaArUSLry1TBuvltWTBo73tk0LsutYeS3RihmF+voG1lTGmXMYqoUFCyM8M975aXGZtRnaQ
	NPsR7OYwf+u7xJ07TF8um9gXSp1k+84IFw6X1ksNA0AhgVKus00rIkd0sfD/jnJ8dz0mFC0sssZ
	gh8PlLsgVr4J2Nko029k6BcogqBzo4hpP89uqaUyB0zzB08r4TV4FuzLvgpyHcDhMXhVLV6ZEDV
	9DhXmEV45Y63DKWjagVMEggHpvRF1SRuzfH95+/HQ9QVs7Y33Zg2kQY9PBks=
X-Received: by 2002:a17:90a:e710:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-396d0fe0d0dmr523890a91.15.1787846907758;
        Thu, 27 Aug 2026 09:08:27 -0700 (PDT)
X-Received: by 2002:a17:90a:e710:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-396d0fe0d0dmr523654a91.15.1787846907116;
        Thu, 27 Aug 2026 09:08:27 -0700 (PDT)
Received: from u24-san1p10108.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd9085sm3245892a91.12.2026.08.27.09.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:08:26 -0700 (PDT)
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: ebiggers@kernel.org, axboe@kernel.dk, mst@redhat.com, jasowangio@gmail.com,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-block@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-scsi@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: neeraj.soni@oss.qualcomm.com, gaurav.kashyap@oss.qualcomm.com,
        mani@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        bvanassche@acm.org, alim.akhtar@samsung.com, avri.altman@sandisk.com,
        stefanha@redhat.com, pbonzini@redhat.com, eperezma@redhat.com,
        xuanzhuo@linux.alibaba.com, linux-kernel@vger.kernel.org
Subject: [PATCH v1 03/11] soc: qcom: crypto_virt: add support for create, prepare and import keys
Date: Thu, 27 Aug 2026 09:07:12 -0700
Message-ID: <20260827160806.1295313-4-linlin.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
References: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: EyLMqs1yIpXTVx5Hk1uz9X8UNBM0gYO5
X-Proofpoint-GUID: EyLMqs1yIpXTVx5Hk1uz9X8UNBM0gYO5
X-Authority-Analysis: v=2.4 cv=FpU1OWrq c=1 sm=1 tr=0 ts=6a9060fc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=KUJ1cKNvbcR4PWbS2kkA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDEzNiBTYWx0ZWRfX20QC1CGvKzUP
 FLW8j3UQinkbXg+nzMm0gK6MIFKiZCX8VSjwptrCSL9tERA7KZBOigtSV3GsXMhx8t+cDzzq77D
 /UmqUGbZcMzxg0Se5ZZsu25DUNu84CP9KC1Yid4Zxmo0QPHGRj21xKCOPF7K4YzkiqPdNyKyWfQ
 aB80O7h3r7lJ4pdIKY2LlZd8QoPPPnHWcZ6C2xD7e4wVjg71uXla2DDLQAa4PeWzlDSmJKhuixP
 xvnicrPrEGCvVbZA4bUNv+zDFT+HeHG/Vav85n29G4dnakn/5ZAai/BoF4jzlM/wN/MVw5sJpyk
 f5kpQ5u+Gyd9JRo2bpKwroMJHfNFpki2QoWjCFKBIGK2UW9BAu5S4KXyOCFOtZfITLOJpFTB9lg
 oEzI1AIU9h0rz8XyTiLqGREu5OLSTg/X4XH1XN+Bd2zhQmz9uBcbdntb02WM/RDHHv7xXHNTH58
 bJYINB9yK6OyyPBjq+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDEzNiBTYWx0ZWRfX9b/ArOWL0iPi
 3K06gEOsqGUWnEaCZVppJ3vevbRf51WV/oRA0Uh7d1yO9F+GIypwrD9i850WwSaKEsSzVYhJmqN
 d2wbfXcGCpB89zQ6Ga8k6SBswctWvdo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270136

From: linlzhan <linlin.zhang@oss.qualcomm.com>

The SCM interfaces used to generate, prepare and import hardware
wrapped keys require the exact wrapped key size as input. The size
is ICE hardware specific and cannot be derived by the guest.

Since the guest does not have direct access to the ICE hardware and
the information is not exposed through virtio, obtain the wrapped
key size from the "wrapped-key-size" DT property.

Convert the driver to a platform_driver matching
"qcom,crypto-virt" and initialize the wrapped-key operations during
probe. When a valid wrapped key size is provided, enable the SCM
based wrapped-key helpers:

  generate_key -> qcom_scm_generate_ice_key()
  prepare_key  -> qcom_scm_prepare_ice_key()
  import_key   -> qcom_scm_import_ice_key()

If the property is missing or invalid, the driver still probes
successfully. In that case, only wrapped-key generation,
preparation and import are unavailable, while key programming and
eviction continue to work for keys provisioned through other
mechanisms.

Signed-off-by: linlzhan <linlin.zhang@oss.qualcomm.com>
---
 drivers/soc/qcom/crypto_virt.c | 114 ++++++++++++++++++++++++++++++++-
 1 file changed, 111 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/crypto_virt.c b/drivers/soc/qcom/crypto_virt.c
index 4ee2a36af6c1..93c7993fb4a5 100644
--- a/drivers/soc/qcom/crypto_virt.c
+++ b/drivers/soc/qcom/crypto_virt.c
@@ -1,11 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/types.h>
 #include <linux/blk-crypto.h>
 #include <linux/virtio_blk_crypto_ext.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 
+static unsigned int g_wrapped_key_size;
+
 static int crypto_virt_program_key(const struct blk_crypto_key *key,
 				   unsigned int slot)
 {
@@ -17,7 +21,7 @@ static int crypto_virt_program_key(const struct blk_crypto_key *key,
 		return -EINVAL;
 	}
 
-	/* Only AES-256-XTS has been tested so far. */
+	/* Only AES-256-XTS is supported so far. */
 	if (key->crypto_cfg.crypto_mode !=
 	    BLK_ENCRYPTION_MODE_AES_256_XTS) {
 		pr_err_ratelimited("Unsupported crypto mode: %d\n",
@@ -63,24 +67,128 @@ static int crypto_virt_derive_sw_secret_key(const u8 *eph_key, size_t eph_key_si
 	return ret;
 }
 
+static int crypto_virt_generate_key(u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE])
+{
+	int ret;
+
+	if (!g_wrapped_key_size) {
+		pr_err("%s: no expected wrapped key size\n", __func__);
+		return -EINVAL;
+	}
+
+	ret = qcom_scm_generate_ice_key(lt_key, g_wrapped_key_size);
+	if (ret) {
+		pr_err("%s: generate hardware wrapped key failed: %d\n", __func__, ret);
+		return ret;
+	}
+
+	return g_wrapped_key_size;
+}
+
+static int crypto_virt_prepare_key(const u8 *lt_key, size_t lt_key_size,
+				   u8 eph_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE])
+{
+	int ret;
+
+	if (!g_wrapped_key_size) {
+		pr_err("%s: no expected wrapped key size\n", __func__);
+		return -EINVAL;
+	}
+
+	ret = qcom_scm_prepare_ice_key(lt_key, lt_key_size,
+					eph_key, g_wrapped_key_size);
+	if (ret == -EIO || ret == -EINVAL)
+		ret = -EBADMSG; /* probably invalid key */
+
+	if (ret) {
+		pr_err("%s: prepare hardware wrapped key failed: %d\n", __func__, ret);
+		return ret;
+	}
+
+	return g_wrapped_key_size;
+}
+
+static int crypto_virt_import_key(const u8 *raw_key, size_t raw_key_size,
+				  u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE])
+{
+	int ret;
+
+	if (!g_wrapped_key_size) {
+		pr_err("%s: no expected wrapped key size\n", __func__);
+		return -EINVAL;
+	}
+
+	ret = qcom_scm_import_ice_key(raw_key, raw_key_size,
+				       lt_key, g_wrapped_key_size);
+	if (ret) {
+		pr_err("%s: import hardware wrapped key failed: %d\n", __func__, ret);
+		return ret;
+	}
+
+	return g_wrapped_key_size;
+}
+
 static struct virtblk_crypto_variant_ops virtblk_crypto_qcom_vops = {
 	.owner = THIS_MODULE,
 	.program_key = crypto_virt_program_key,
 	.evict_key = crypto_virt_invalidate_key,
 	.derive_sw_secret_key = crypto_virt_derive_sw_secret_key,
+	.generate_key = crypto_virt_generate_key,
+	.prepare_key = crypto_virt_prepare_key,
+	.import_key = crypto_virt_import_key,
 };
 
-static int __init crypto_virt_init(void)
+static int crypto_virt_probe(struct platform_device *pdev)
 {
+	int ret;
+
+	ret = of_property_read_u32(pdev->dev.of_node, "qcom,wrapped-key-size",
+				    &g_wrapped_key_size);
+	if (ret)
+		dev_warn(&pdev->dev, "qcom,wrapped-key-size not found\n");
+
+	if (!g_wrapped_key_size ||
+	    g_wrapped_key_size > BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE) {
+		dev_err(&pdev->dev,
+			"invalid qcom,wrapped-key-size %u, won't support generate/import/prepare hardware wrapped key\n",
+			g_wrapped_key_size);
+		g_wrapped_key_size = 0;
+	}
+
 	virtblk_set_crypto_ops(&virtblk_crypto_qcom_vops);
 	return 0;
 }
+
+static void crypto_virt_remove(struct platform_device *pdev)
+{
+	virtblk_set_crypto_ops(NULL);
+}
+
+static const struct of_device_id crypto_virt_of_match[] = {
+	{ .compatible = "qcom,crypto-virt" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, crypto_virt_of_match);
+
+static struct platform_driver crypto_virt_driver = {
+	.probe = crypto_virt_probe,
+	.remove = crypto_virt_remove,
+	.driver = {
+		.name = "crypto_virt",
+		.of_match_table = crypto_virt_of_match,
+	},
+};
+
+static int __init crypto_virt_init(void)
+{
+	return platform_driver_register(&crypto_virt_driver);
+}
 module_init(crypto_virt_init);
 
 #if IS_MODULE(CONFIG_QCOM_CRYPTO_VIRT)
 static void __exit crypto_virt_exit(void)
 {
-	virtblk_set_crypto_ops(NULL);
+	platform_driver_unregister(&crypto_virt_driver);
 }
 module_exit(crypto_virt_exit);
 #endif
-- 
2.34.1

