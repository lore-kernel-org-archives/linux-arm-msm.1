Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80F436A34D
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 10:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785753994; cv=none; b=G/e9WKonUqcr1jGsQ3Ckr66ED/GV8CCWnzkH+Ee00vlRuNycnNyf1yzoXBBTnlMZHg2D+katkr58VO44wB6yN4cEpELlQsI0hKoKsuN94WWiXBodUV+oCeuA4GdvvX3JrEqtuU+BtwJV6Zk8IOmr4m5YG5eizn8yZPZDdcZzn5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785753994; c=relaxed/simple;
	bh=IbwG9kHZnawTbsgRLjU97u4gzWRHSSuxX21hSvKDT5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j8O202qU3gmKV6uzgkPZqlEAwXhz6JNKhwdiDJ75dLYZ9e7C8qw/8qJqmzT/XPRLS/sD9djsMkH6Z+In1/Ujhm26jmFIvaNytRr9P2XB59RZGuDAjlDl8tB+hCnbpIwl8okLhd8f2Kkg4/LpNNvLo2CJs4xYOZu1AeUfqZyMaZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DJiFIaIr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RS9Y1ODR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DJiFIaIr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RS9Y1ODR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736SQcp052493
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 10:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TZZ9yrQc+ehot+ZdvZIBeZ57GDuCcRUeTsq9WWzRl78=; b=DJiFIaIreUdz4ZTB
	IqNBDkRCNiOEmz6yOIouneaiIerJ+rLTc012EvpL3ajSBKngg1BmhFpZ9+elYbcP
	vy40320NkaeF9xFv0y3g7UmZszdUrur/1kLumbXXTq93+PvinpNIgvqL+uVgA1FR
	DnUDoLSRwVO9aZdrtKCfOKAK7Mwz32dJXxZ9JGwaM+mN+Zryr0H6b5tM4n3lOLzH
	23FB0W4857wUeukPD01nMB0Vtj0QNbM/T0PZqPDVDZ+lH6bM8P7Q7kdhyckFgAI7
	VDzKMdiC4/ZlPXzMguWNnBVx+wSVvF807szA3TeyzrCNFOs+FJA3IqUTf5MFNiut
	M6EQXQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrb93h1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 10:46:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so2117458a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 03:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785753990; x=1786358790; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TZZ9yrQc+ehot+ZdvZIBeZ57GDuCcRUeTsq9WWzRl78=;
        b=RS9Y1ODRGrVKfWRa2i+RHFaO3ptC/mnD8SjN2hnEfKnpjT+lU5g4lnfkljegU52kZT
         nHbKf7JlKbLhRcrHGjKIiDRNz5OE7cqMQAb05YpbOOnXtC73AKpekFBbefnclCThRbbP
         9KODzSJe+zwaXg5rkG/dvoOEGFiqULv3Q7aVG4El+On2PVVEPxYy16RPygO6+aRFjDly
         9qqsbR3t5x+53DYN7tKbdw35jadGASvryQK+TwX5BefwVj2sbRTj1iDIw6o2YVNoZ9H8
         AyldilV3M15nZ2l5zSDh4DAniOPXIColM08jbm6mGQDu0FzFpISMQ8zmz2KeZZNHFRnc
         uF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785753990; x=1786358790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TZZ9yrQc+ehot+ZdvZIBeZ57GDuCcRUeTsq9WWzRl78=;
        b=mIIxlOyKCCAGBKyGsX/apOhdiya4bEVgvOvcx5KIgMW0qtwGQ12PsvO1hEO75cFiTb
         zT3qzav422NEDDjBhWSIUCXIoHHJZcqltBKR/5rO+Rq/bhXuKLw2Itx6nTkOdO8Li6B1
         cydWNY+BojtC+F2l9gHsxQdzqhLtSVr6502MhEn3Fio9pcfn4sVkP+4SiMWIHCrF2sRm
         xZtu9BucfgfKKbjkWS6EiUHWxlg157n9RxoSjbXmbKn/0fTpX4BUOiKdZunNQ+uG3Qv1
         Kyn4phR0IagStGX3l1iw9zehTqPUAGDphS+2CZ8JFdSP7IsGLGt2rVm7zii3kSAi6Uek
         Lrvg==
X-Gm-Message-State: AOJu0YzhnROLLehJwYgfgh1wzVWIMHwcos8W69NPcFkRJ2ROnlHF0kcL
	GW/1f7Bag754UFLZaXcDqYAjH5KLdmYcVS6/wJgMgnVYHJO9eAz4rPJXaD6gpw3qzHjzVi2Gh4q
	440X2YoYR7XcbjmbKMbdotAUQMUy4/Qo9+hZ8DkY3O3o9Uhj4qtXPAoinIy6TPxSKpy/g
X-Gm-Gg: AR+sD12bzdQ4HYzPBT+5/NMLa9sX3fi8hRkmpfZ/nWaOupB98rCCGLoIgHmE+6oUw1y
	nWCCB8WYaxm6kSLidO+iIMptKMQdqJlFnZuWA2Oos7s3ZLk9j9iAVJra2mUIAVHsqC1tS6eZTmB
	3WROxj1xJ22SvntMWzAhkXpB2p4RVCOAo6SVUkRtgBPeoV/INQ/WJ1TRj4rMz2xPfYsjB8/v9dy
	RgS9aGjGMuVO7VEbCr0+uHxZuLhQhb3O5hDKpjaVuRzKRPDvtPoh9uBnr/7ZeEwX70SQyZIPXAr
	n2uMv8I3JK5w0rwvyhDiHkcefDKk992p5ub64a2PRQ/9vwxcyBgGMDljmESPYC2oreSYrsZ8c5k
	XXnzbP8oHeMA7Sc5+J+GQvz4PuLVK6OSvsbcB7rihrlnTAs5OCJZf4zG97TprHYGnn2SGCY5jMX
	6OI49rzMxsiE6akGkFIP0ij9cgoiOS1A==
X-Received: by 2002:a17:90b:5143:b0:37f:9ce2:348f with SMTP id 98e67ed59e1d1-38fbc506b07mr8368080a91.32.1785753990350;
        Mon, 03 Aug 2026 03:46:30 -0700 (PDT)
X-Received: by 2002:a17:90b:5143:b0:37f:9ce2:348f with SMTP id 98e67ed59e1d1-38fbc506b07mr8368057a91.32.1785753989966;
        Mon, 03 Aug 2026 03:46:29 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm29993730c88.13.2026.08.03.03.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:46:29 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:16:07 +0530
Subject: [PATCH v14 1/9] firmware: qcom_scm: ipq5332: add support to pass
 metadata size
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-rproc-v14-1-a1f87b0b0ad2@oss.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
In-Reply-To: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX8s6QGtoIa0yx
 n47sOPqMAwGcikn1PadliTRXShOkBft+b3HN/jwtBP1dVZjvNpQImufLuYgPBhPscCs2aI3dpcG
 eLFay3H53SV69l5JQR7XHg7X7sReZy4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfXzMgLbsiDyiDP
 uRFkmlpT+udYdTVCnr8cHXD4y0OepuDAsTQjbGh7hmzD88d8SMCpxJrsNEBt0CYitwdRWFxkBDT
 8yhjDAcMl+wfFHv9//A9QnsX8P6WIoVHbCkVnwhPgkItPVRXVkMAyzGrDd8IYNQfg1+tpoOA+5y
 KVjAvaKod1TyDvacF68hGRGvX+eGTr8YT1A4EOmNMMOodlWaPwIis8vMtLkAK+p6FwOBo5p8dYv
 8xpsTFZoZmJgEHedo2KF1CdHdbz1qrppcAqhzV9I/sEYtLsdCfe2WJb+j3BmxwlqcE8WigrKZAE
 tYJKZmtE9g8CqyVry7AcSnss68asfighvBfCm8Z0E83MJsq9akbOwY6MQ9+AO6hriXei0kXWiik
 siQJfUk+7Sf5q4SsnKv4lUCFbCrCDqEPvJTLPHNYbAiENX9sKvQfLh4ye2masj8I1zl4cd86viL
 rjpLccanuXq4dN2sU3A==
X-Authority-Analysis: v=2.4 cv=RNSD2Yi+ c=1 sm=1 tr=0 ts=6a707187 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Hho1wTqgLjreKoR7ChkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: uPBOBjYQPuhHgxANjAYbhgjo6op5rih1
X-Proofpoint-ORIG-GUID: uPBOBjYQPuhHgxANjAYbhgjo6op5rih1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030096

From: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>

IPQ5332 security software running under trustzone requires metadata size.
With new command support added in TrustZone that includes a size parameter,
pass metadata size as well.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 16 ++++++++++++----
 drivers/firmware/qcom/qcom_scm.h |  1 +
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 3eaa4c9ccf3c..8902c445cf19 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -598,7 +598,7 @@ EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_alloc);
 
 static int __qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
 				     dma_addr_t mdata_phys,
-				     struct qcom_scm_res *res)
+				     struct qcom_scm_res *res, size_t size)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_PIL,
@@ -619,6 +619,14 @@ static int __qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
 
 	desc.args[1] = mdata_phys;
 
+	if (__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
+					 QCOM_SCM_PIL_PAS_INIT_IMAGE_V2)) {
+		desc.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE_V2;
+		desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_VAL, QCOM_SCM_RW,
+					     QCOM_SCM_VAL);
+		desc.args[2] = size;
+	}
+
 	ret = qcom_scm_call(dev, &desc, res);
 	qcom_scm_bw_disable();
 
@@ -644,7 +652,7 @@ static int qcom_scm_pas_prep_and_init_image(struct device *dev,
 	memcpy(mdata_buf, metadata, size);
 	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
 
-	ret = __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &res);
+	ret = __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &res, size);
 	if (ret < 0)
 		qcom_tzmem_free(mdata_buf);
 	else
@@ -683,7 +691,7 @@ static int __qcom_scm_pas_init_image2(struct device *dev, u32 pas_id,
 
 	memcpy(mdata_buf, metadata, size);
 
-	ret = __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res);
+	ret = __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res, size);
 	if (ret < 0 || !ctx) {
 		dma_free_coherent(dev, size, mdata_buf, mdata_phys);
 	} else if (ctx) {
@@ -2528,7 +2536,7 @@ static void qcom_scm_gunyah_wdt_init(struct qcom_scm *scm)
 	gunyah_wdt_dev = platform_device_register_simple("gunyah-wdt", -1,
 							 NULL, 0);
 	if (IS_ERR(gunyah_wdt_dev)) {
-		dev_err(scm->dev, "Failed to register Gunyah watchdog device: %ld\n",
+		dev_err(scm->dev, "Failed to register Gunyah watchdog device: %pe\n",
 			PTR_ERR(gunyah_wdt_dev));
 		return;
 	}
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index cf90a565fdfb..e58c76aba45c 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -105,6 +105,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
 #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
 #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
 #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
+#define QCOM_SCM_PIL_PAS_INIT_IMAGE_V2	0x1a
 #define QCOM_SCM_PIL_PAS_GET_RSCTABLE	0x21
 
 #define QCOM_SCM_SVC_IO			0x05

-- 
2.34.1

