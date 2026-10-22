Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662741;
	b=DcyYOht5cYR8BvmnXutiqg3lm1WYqswnFSRZDhn1RcXCqpB9hmzOW5etioWO5q+Vujbb
	 a4GRiz2ITwoD7/UJgiADpvphNKglPjCYyIQQjKy3ju6FgolBp6yItY87iyxnH4t+0/lIn
	 a4UJ64fst+LijXJ+ApNhG966V+M7ZDoB+zugH7Sa+M003DKGOFMINYLMAsKj7S1R4K8ia
	 z5GxQfhhRuNsaA3VNKF7bYWa9ugeRyY3ypVoY15iJbwuZfV+zFmw46FmjAvnPStFuYswn
	 vMKA3BXq7utxnxb1s4NV+MFLv1MXjyBFCDW6CsrY7BR3cLjwH/V7Xmy9FGRislqYZNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662741;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CeE7a0sNBOf2EnSB2xNlakeUL5DlkgXo0bUlGePLdQU=;
	b=FNpA5dbhnhCinm9/FRKt3ez5smTwj3UdsjFAT+QxoHWeCKFX2u7Gj7ko7dVGpjT1BlJa
	 7PvWZyKEBRd9U92z6SN5fmWItiZqKlhUzGjumF+pnvE4opqKQcIhA+S5FQdEnvuqPVE59
	 1ZPJPd5Nj/O4CyfSueWkmBe62ZnvsWP7j44NRSbTlzviXqJYHhM1026N7lTRuO/iAurQK
	 AWpbtWT7m3q0Q1h+84oGam6k1CPNK0mUvtDOtl4pr0tgDxE/JV8HdNWNNKHZxcua8Wmnd
	 acDVaeCNvDDFo9tfOA6DeyxWrqtnMZpZlVH+mL1i1ldQB7lVl1AmivExe8i76BiU0OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rl0JNQkD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OKXGpYcg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE365606A331
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:52:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE365606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rl0JNQkD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OKXGpYcg
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9mgX73968831
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:52:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CeE7a0sNBOf2EnSB2xNlakeUL5DlkgXo0bUlGePLdQU=; b=Rl0JNQkDGITPWcy0
	0Mq6IXiFOmdwUOCzHuD+vMsYHP+Pi2I9pMRMGH5/RnG44P6DqsoBIHCBmu0MaaWm
	JxbicCOp5oc7FQ//TJg8lULVZTpN+k6DJ2oqK1eXiWhZo0wHNK1TA7Q4z50lCPD6
	u5tVFbOGDZyZcxIAm00m7k49L0yHFUTFu5vkwKLdbRNvO3RwskfJ4NZEc7QrVkhX
	2KnAxs6Hp5140Az3wlYrcJa2gCR6bs+HFDTkMuihn7k5HH900481jmqUTZ1fotNB
	iGxrWKoD/dPq2JyfwFvYlnvvUCesZ2+djTRAyD/vS8lSfEnBx7wV0sBrtAT78vYQ
	LgtWZw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93c9r1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:52:19 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so4261862eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792662739; x=1793267539; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeE7a0sNBOf2EnSB2xNlakeUL5DlkgXo0bUlGePLdQU=;
        b=OKXGpYcg8ngxgRXV9ti+sIAI2yPYVNNv+uKu7XgigNwCsWDbD7vB/WxCaBqO4R+q+F
         ZSEK2O8qGoC/miRAt1ZCXwbjBQ4rK4O4l4vyvgWpzd9jEuuWAeHZYArHoSeRsMtsv+M2
         YdE42tfxq37Z4gAkGatKY7HbRq4q+oQBRLOG6e9mBh4LgGjMGu0sIMar4kFxIEuPG47W
         lT0fnTIaWU1M5Tq56vaVVc+PwFT/RutiJcIGtZ728IuemPjGMR13SZz5S6RYlcbdTZIB
         1418533Rnkm7daTaajUXepd7ifxZApRylBIKvKCaiMj0w7vS8jRLm9BG69ZOIlD9NAJl
         uASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662739; x=1793267539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CeE7a0sNBOf2EnSB2xNlakeUL5DlkgXo0bUlGePLdQU=;
        b=j1xnXqPoCLC7mfLxzfoLehoURBkoOztGG0gydaEKuh4QND/5T6wSnaq4x//jZCVpPN
         QVPosyFnfC471UzCE5rNGb4Op1c8Q/DyzL16HH1NiJ4iaB4f3FDNS8ia5JRvuaeDp+3u
         v8i+bSCsekihp2YSZg0KYFq2ziq5hlvXIgrMkBcNh5rwwTvyTVtBSRWRG6vYl0j1Dkii
         ZS9RdFq1nwHMC7ZZkGTbe5BKKfNEwJMnpBTESdt4mnEiUTlWDVPDzPsfh85W0nhzlUmr
         hIG8kE8pAPpyj25dbXwW8o9KAFVJBtEYWA5JbCXtWejmLsAiP0ZyIjTKYZBl/O/0Eg/4
         oakA==
X-Forwarded-Encrypted: i=1; AKwUvBzEeZbEv+G+HL3PFHXmBqTLRatRR5m1NYe3RC3S+LlaQLPKW9Cnnd81eWuJj1aHp12H4LCIUjdEv+NCgnXm@vger.kernel.org
X-Gm-Message-State: AFq9FYKScL5HgL51kqAPof0+C0iwhO0Aduo8MWaFlu4JO4WD/AJz7FD1
	euM7x/IVptEONtZtPlkxT33rRqZQV94ogSw9jqjDAFyWcU3FOcJRIHuJhrdwDuUAMfYazjiEImz
	YeSM99Gas6FQwLbeM9VE2bSu0MrgyDgONJp2VhZ3n0/rnEEN8TgWoZxZ6ss1v0PLBGHbN
X-Gm-Gg: AYBFou1D2RNdywltKD7BstJv6pF5xIu/tDh3O2r9TLOVObmXxF4Y35tNOo5XatprfFN
	XTg95Byf6AWxfYaGhl16gK1UemQJVP2Bau8St4l1MLXaFCHrCqHCp72jH6MIMdq7/znzdTKGQWp
	m7BRI1tRKeQ7ZjTqivc5lJyatytgrWkVz85WhXnJ0HFdMzIz+dzVsbRQn2ZJqGS+7yoiJrEdjTJ
	1+x7siqDwlBR4kzfX3yIfMD7lhiyvW5EcMpHLlfy4YcO6HNmDlVqbTmUKquRNPSnKxfmdR0uX3N
	HxZnzN3jUuzpPCpjbMr1TeSfLkV8D7Ir7ZbGUFMTnnm6tZSApmZ3QLI/LWOZWEdu4QAuYL54fmv
	6+Dl4YYctZFRRFX4WWWmJnLYsaTOWiSjE
X-Received: by 2002:a05:7300:ff48:b0:368:6e2a:af3b with SMTP id 5a478bee46e88-3686e2ac00cmr3369400eec.16.1792662738504;
        Thu, 22 Oct 2026 02:52:18 -0700 (PDT)
X-Received: by 2002:a05:7300:ff48:b0:368:6e2a:af3b with SMTP id 5a478bee46e88-3686e2ac00cmr3369368eec.16.1792662737818;
        Thu, 22 Oct 2026 02:52:17 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e153519sm15742170eec.3.2026.10.22.02.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:52:17 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 15:21:52 +0530
Subject: [PATCH 3/3] soc: qcom: ice: Add runtime PM support
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-qcom_ice_pm_enable-v1-3-f7a84086c651@oss.qualcomm.com>
References: <20261022-qcom_ice_pm_enable-v1-0-f7a84086c651@oss.qualcomm.com>
In-Reply-To: <20261022-qcom_ice_pm_enable-v1-0-f7a84086c651@oss.qualcomm.com>
To: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Eric Biggers <ebiggers@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX0e/tyvjksgre
 gdBOn+0lCAme1h5oljHuPFiPtdB//V/12Vd5oIPz6dR6tWrB6sM0l54SahIP4WwHwgJq1BotHdo
 lHZhloK9bG3YSYRoZWi4tgm7zXD37eg=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad9dcd3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=SjYACEApi-yS0jillSAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: otq94JRZ2I5vLR6JmDDtcR-27jHL9ish
X-Proofpoint-ORIG-GUID: otq94JRZ2I5vLR6JmDDtcR-27jHL9ish
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX3ZrQsfWvEm5Z
 WWrhY8xqDqZNbMmEPaBC80EYS00FU5UUIl6m8BXWo7OzBDEwT21fzhY52HO+h27ljPgjNtmgyFU
 bnpO9IX6JqAafpUqYjBHfuKLMBm0IaLW81jh2YmufsyEw5GFJJvB7/hWHzZyI8W52KCV4zjJnHz
 WlU8XpWKEkc2egEukk8TH/b+gmKva47Vg5FHgpvuSq2EUMrETHKrYYbodPpkIPu2rpcfR++LODs
 qh7SsZe/3XDXKqt+gTFpu+MZKiwZHpCZ0OS7zBalcRsZA07rezve//UFu84nmpLjJJsN/+Xj9AI
 uAa423xsOnIrw0qbYkJDwNGKS3QryGs5WqyFDZ9/pXN/aoWRerGv1LA2TmBN6UbZJXZdByYfCv8
 VYBqR5Dj/mOkCIICYRO25/h0rxNzOmaC1V1C1tkf2tVtrgzseNId0faKJ7oRb2EwQR11C19/Sm+
 JzcbOoWyeouIs4xyp+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220039

Ice driver currently enables its clocks during probe and keeps them
prepared/enabled even after probe is complete. On targets where ICE
exists as separate DT node and storage consumers reference it through
"qcom,ice", leaves ICE clock voted while the system is idle.

To mitigate this, add runtime PM callbacks to gate the core and iface
clocks. During probe, enable the clocks to read the ICE version/fuse
state, and then disable clocks and mark runtime PM state as suspended.

For legacy binding, keep clock ownership with the storage consumer
dev as it created the ICE instance.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 drivers/soc/qcom/ice.c | 139 +++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 116 insertions(+), 23 deletions(-)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index e256595b9826..f9939e2d037c 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/xarray.h>
 
 #include <linux/firmware/qcom/qcom_scm.h>
@@ -113,6 +114,7 @@ struct qcom_ice {
 	bool use_hwkm;
 	bool hwkm_init_complete;
 	u8 hwkm_version;
+	bool use_pm_runtime;
 };
 
 static DEFINE_XARRAY(ice_handles);
@@ -303,42 +305,99 @@ static void qcom_ice_hwkm_init(struct qcom_ice *ice)
 
 int qcom_ice_enable(struct qcom_ice *ice)
 {
+	bool pm_acquired = false;
+	int err;
+
+	if (ice->use_pm_runtime && pm_runtime_suspended(ice->dev)) {
+		err = pm_runtime_resume_and_get(ice->dev);
+		if (err) {
+			dev_err(ice->dev, "runtime resume failed: %d\n", err);
+			return err;
+		}
+		pm_acquired = true;
+	}
+
 	qcom_ice_low_power_mode_enable(ice);
 	qcom_ice_optimization_enable(ice);
 	qcom_ice_hwkm_init(ice);
-	return qcom_ice_wait_bist_status(ice);
+
+	err = qcom_ice_wait_bist_status(ice);
+	if (err && pm_acquired) {
+		dev_err(ice->dev, "BIST failed, ret: %d\n", err);
+		pm_runtime_put_sync_suspend(ice->dev);
+	}
+
+	return err;
 }
 EXPORT_SYMBOL_GPL(qcom_ice_enable);
 
-int qcom_ice_resume(struct qcom_ice *ice)
+static int qcom_ice_enable_clocks(struct qcom_ice *ice)
 {
-	struct device *dev = ice->dev;
 	int err;
 
 	err = clk_prepare_enable(ice->core_clk);
-	if (err) {
-		dev_err(dev, "Failed to enable core clock: %d\n", err);
+	if (err)
 		return err;
-	}
 
 	err = clk_prepare_enable(ice->iface_clk);
 	if (err) {
-		dev_err(dev, "Failed to enable iface clock: %d\n", err);
+		clk_disable_unprepare(ice->core_clk);
 		return err;
 	}
-	qcom_ice_hwkm_init(ice);
-	return qcom_ice_wait_bist_status(ice);
+
+	return 0;
 }
-EXPORT_SYMBOL_GPL(qcom_ice_resume);
 
-int qcom_ice_suspend(struct qcom_ice *ice)
+static void qcom_ice_disable_clocks(struct qcom_ice *ice)
 {
 	clk_disable_unprepare(ice->iface_clk);
 	clk_disable_unprepare(ice->core_clk);
+}
+
+static int qcom_ice_do_resume(struct qcom_ice *ice)
+{
+	int err = 0;
+
+	err = qcom_ice_enable_clocks(ice);
+	if (err)
+		return err;
+
+	qcom_ice_hwkm_init(ice);
+
+	err = qcom_ice_wait_bist_status(ice);
+	if (err) {
+		dev_err(ice->dev, "Bist failed, ret: %d\n", err);
+		qcom_ice_disable_clocks(ice);
+		ice->hwkm_init_complete = false;
+	}
+
+	return err;
+}
+
+int qcom_ice_resume(struct qcom_ice *ice)
+{
+	if (ice->use_pm_runtime)
+		return pm_runtime_resume_and_get(ice->dev);
+
+	return qcom_ice_do_resume(ice);
+}
+EXPORT_SYMBOL_GPL(qcom_ice_resume);
+
+static int qcom_ice_do_suspend(struct qcom_ice *ice)
+{
 	ice->hwkm_init_complete = false;
+	qcom_ice_disable_clocks(ice);
 
 	return 0;
 }
+
+int qcom_ice_suspend(struct qcom_ice *ice)
+{
+	if (ice->use_pm_runtime)
+		return pm_runtime_put_sync_suspend(ice->dev);
+
+	return qcom_ice_do_suspend(ice);
+}
 EXPORT_SYMBOL_GPL(qcom_ice_suspend);
 
 static unsigned int translate_hwkm_slot(struct qcom_ice *ice, unsigned int slot)
@@ -560,10 +619,11 @@ int qcom_ice_import_key(struct qcom_ice *ice,
 }
 EXPORT_SYMBOL_GPL(qcom_ice_import_key);
 
-static struct qcom_ice *qcom_ice_create(struct device *dev,
-					void __iomem *base)
+static struct qcom_ice *qcom_ice_create(struct device *dev, void __iomem *base,
+					bool use_pm_runtime)
 {
 	struct qcom_ice *engine;
+	int err;
 
 	if (!qcom_scm_is_available())
 		return ERR_PTR(-EPROBE_DEFER);
@@ -579,36 +639,54 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
 
 	engine->dev = dev;
 	engine->base = base;
+	engine->use_pm_runtime = use_pm_runtime;
 
 	/*
 	 * Legacy DT binding uses different clk names for each consumer,
 	 * so lets try those first. If none of those are a match, it means
 	 * the we only have one clock and it is part of the dedicated DT node.
-	 * Also, enable the clock before we check what HW version the driver
-	 * supports.
 	 */
-	engine->core_clk = devm_clk_get_optional_enabled(dev, "ice_core_clk");
+	engine->core_clk = devm_clk_get_optional(dev, "ice_core_clk");
 	if (!engine->core_clk)
-		engine->core_clk = devm_clk_get_optional_enabled(dev, "ice");
+		engine->core_clk = devm_clk_get_optional(dev, "ice");
 	if (!engine->core_clk)
-		engine->core_clk = devm_clk_get_optional_enabled(dev, "core");
+		engine->core_clk = devm_clk_get_optional(dev, "core");
 	if (!engine->core_clk)
-		engine->core_clk = devm_clk_get_enabled(dev, NULL);
+		engine->core_clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(engine->core_clk))
 		return ERR_CAST(engine->core_clk);
 
-	engine->iface_clk = devm_clk_get_optional_enabled(dev, "iface");
+	engine->iface_clk = devm_clk_get_optional(dev, "iface");
 	if (IS_ERR(engine->iface_clk))
 		return ERR_CAST(engine->iface_clk);
 
-	if (!qcom_ice_check_supported(engine))
+	err = qcom_ice_enable_clocks(engine);
+	if (err)
+		return ERR_PTR(err);
+
+	if (!qcom_ice_check_supported(engine)) {
+		qcom_ice_disable_clocks(engine);
 		return ERR_PTR(-EOPNOTSUPP);
+	}
+
+	if (use_pm_runtime)
+		qcom_ice_disable_clocks(engine);
 
 	dev_dbg(dev, "Registered Qualcomm Inline Crypto Engine\n");
 
 	return engine;
 }
 
+static int qcom_ice_runtime_resume(struct device *dev)
+{
+	return qcom_ice_do_resume(dev_get_drvdata(dev));
+}
+
+static int qcom_ice_runtime_suspend(struct device *dev)
+{
+	return qcom_ice_do_suspend(dev_get_drvdata(dev));
+}
+
 /**
  * of_qcom_ice_get() - get an ICE instance from a DT node
  * @dev: device pointer for the consumer device
@@ -645,7 +723,7 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
 			return ERR_CAST(base);
 
 		/* create ICE instance using consumer dev */
-		return qcom_ice_create(&pdev->dev, base);
+		return qcom_ice_create(&pdev->dev, base, false);
 	}
 
 	guard(mutex)(&ice_mutex);
@@ -738,6 +816,7 @@ static int qcom_ice_probe(struct platform_device *pdev)
 	unsigned long phandle = pdev->dev.of_node->phandle;
 	struct qcom_ice *engine;
 	void __iomem *base;
+	int err;
 
 	guard(mutex)(&ice_mutex);
 
@@ -749,13 +828,21 @@ static int qcom_ice_probe(struct platform_device *pdev)
 		return PTR_ERR(base);
 	}
 
-	engine = qcom_ice_create(&pdev->dev, base);
+	engine = qcom_ice_create(&pdev->dev, base, true);
 	if (IS_ERR(engine)) {
 		/* Store the error pointer for devm_of_qcom_ice_get() */
 		xa_store(&ice_handles, phandle, engine, GFP_KERNEL);
 		return PTR_ERR(engine);
 	}
 
+	platform_set_drvdata(pdev, engine);
+	pm_runtime_set_suspended(&pdev->dev);
+
+	err = devm_pm_runtime_enable(&pdev->dev);
+	if (err) {
+		xa_store(&ice_handles, phandle, ERR_PTR(err), GFP_KERNEL);
+		return err;
+	}
 	xa_store(&ice_handles, phandle, engine, GFP_KERNEL);
 
 	return 0;
@@ -775,12 +862,18 @@ static const struct of_device_id qcom_ice_of_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, qcom_ice_of_match_table);
 
+static const struct dev_pm_ops qcom_ice_pm_ops = {
+	RUNTIME_PM_OPS(qcom_ice_runtime_suspend, qcom_ice_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+};
+
 static struct platform_driver qcom_ice_driver = {
 	.probe	= qcom_ice_probe,
 	.remove	= qcom_ice_remove,
 	.driver = {
 		.name = "qcom-ice",
 		.of_match_table = qcom_ice_of_match_table,
+		.pm = pm_ptr(&qcom_ice_pm_ops),
 	},
 };
 

-- 
2.34.1

