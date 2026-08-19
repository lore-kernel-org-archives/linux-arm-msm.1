Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09745392C3D
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 05:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787117457; cv=none; b=Yvh18vBo/ettpYXqatrsgTP5sl5uljxodIGcvOCZrve6ryZbUCt8OfBM5uB8J3cmgZ4LOXcHJGj65FZ1mxQee98/kEosXNx5QqjFJbFm9Oi2JXTyyZI7l/OHEP0GypxjrfcrIfAdVMWKGZUon6KMReKtI76llrDtc1kFB93GyhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787117457; c=relaxed/simple;
	bh=e2VGds5X/xfzMLSQ5PCs6zLcnqNPR99m7+/78W47KFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=InB5rrm3Zsn26y9EhETzKresbLb+uJUi63KjPeSMkYJSKuNFLUEDE275Dlr580H9oGCWb+EvpMyW66P0nO0b56hIoKAejW5YpPCL1sh0AG8se6z6qOSOjuZo/9o1P/ISX8hXTJSE+JU2zNQEu2n/ELGn/GzFBo1496mnnbK5tj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hV2DdeL2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ctvvgFtw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hV2DdeL2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ctvvgFtw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J5I36O3518397
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 05:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Iz/k6daqN3MTzD7Fc8HPs7
	D5ldtsQ3zRn+5/COHyddc=; b=hV2DdeL2AnOpADX8lLcpW9NFttq1AV79/AQ7t2
	B+1XVN3ZwBVPaufgji/1nIDWeZflWSE6wMvCjvlUp+jzuXL+TVyKXEDBDsxSsQkl
	dxEAVyIZQ1fAQasN4BTKh12FdCez+3vBeQLTaA0aGP8BMvCfB/17yqK1vUNNYYsX
	42o5aFD0817XS09z+XGyWs7ao+6dOPWN8NjO+YtHrw75y6NYw0oP2cxrQXbK0T4r
	i45/HqTHsAh3DmobIkUcHAzO383Zze2RdFNEAcRDym9BaFYkgmiBYgXIK6Xu20DV
	cShetdRJkGLfZOL+S5jANUx6bgAtVLPFu8Regl9uDw2g5dvQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfk9gcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 05:30:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb6823efcso5719195ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 22:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787117454; x=1787722254; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Iz/k6daqN3MTzD7Fc8HPs7D5ldtsQ3zRn+5/COHyddc=;
        b=ctvvgFtwgs6kLfLj5z2wlCAgAbw05Vbxd5+03TgOG5z07enbHmNW23qy1sC+X0jA8e
         uJQoCOMECwClssMJNxAROZmGgln0HLLemBDrvHRnhOv8F3yoA+mPKzZsywTiL3W8AqAI
         Cum+uCpXMSFflYOTbcRrPrttETs+OGTOuEvmsctei04xfScz661C69+1NkLkRaFFoadt
         Yr4tqtNX1YL8oVgnSDeDOvl9xxVgU1u9CnzXiKFl+Pmjlf+/CBYifC0GygxC9g3nIRE2
         zgFq0Fx6URoXUTzRAT7rgZcnmnyCfbzgcrXcITho618knXFf6d3RakhqdKWycihaYu+n
         NSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117454; x=1787722254;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Iz/k6daqN3MTzD7Fc8HPs7D5ldtsQ3zRn+5/COHyddc=;
        b=kjrQ0meXIX6f4clo5zWvOQ9pZqNI8PZPouZyjfMBehwbqhTyJPdczr5pUY/HvXqc/m
         +UnjSt32qHh2+7Ey8JRpV0w4aJg4qbEIM2e/UEFwPTjKJ5rCZIRg+O/WzKZQnwz/9xVZ
         sL7B6g1YsaAAmgwKsQo/v4I3nnpFHCXCC8xueZlOn5onnwl+pA31GTMwoI65MIBwkWxu
         Lp9c1Ltzko0htQfrl7LGJcgNmnRHd54wbYmsrgrukgPOLp/b+prmfe29VLMPf03fSE2k
         CD/D+jvGSL3euWXJfElJTVbRclPqOjKm5BoJ1Kzad6rSec8QcPn1zqRGY04h0zkYUg7V
         Hedg==
X-Gm-Message-State: AOJu0Yyi+ZvyxbkxUJ2qkkrP088360qtv7H3NojVSyWBKSOv/3F0EHKK
	Q1N7nB1opzZ7oRsadCtmmeZ74EjjFGctR2zuS294PAlWTEBUt6gfFe8DHqpmNJucw5McVvM01tE
	dqBbpv4rMP/KxBgAqg3NxqvvFpJRped0HDSArPEYYdK/16A96Zq23OAIcyn+sekO+b/GC
X-Gm-Gg: AR+sD13T3XsZmKpI5JQh8P1duXbnjNx4qxbobLtBiqWaoPiEyjYAlpu51ClLCaIY19Q
	0BPpKzOCiw882u6gkzqY0dcjCpu+HMZf3gG4PyMvs5pfljLBI6n3DxH716AfZMwILKAk8almdX1
	qMPrOcK5PY98TwMQE3ykaPJDx0smCHYWH0YpKkDH4fLTfRDz68hmaTu9Z6mengtW1t5oSwABs1M
	9HuWsnEDWuUU0pi1+bshgRhkWHZ/9jxPLnANbRlJEfSG4y1BkdRgGn8zUzLHp41AukpF7hpE8h5
	rAK+JSYv6e5NwuFBynpvE7Y5JYsTORu7pQOYBXnMuV5JkRHzneQWG9okR1+wC7HDd4PgGrNauc5
	u7tLnBg8axeWLG829jQKRV0j5mQ9g6k6GsU4sUYWL6GOC29EiS2rlyK/vpssj7L4xMhrwTdB4UE
	4xf/B2zFVA1zRGPVx1H9f8UTA/F2Ztww==
X-Received: by 2002:a17:902:ccc8:b0:2cc:ae2b:b6d2 with SMTP id d9443c01a7336-2d601c7c8edmr39916905ad.15.1787117453920;
        Tue, 18 Aug 2026 22:30:53 -0700 (PDT)
X-Received: by 2002:a17:902:ccc8:b0:2cc:ae2b:b6d2 with SMTP id d9443c01a7336-2d601c7c8edmr39916095ad.15.1787117453406;
        Tue, 18 Aug 2026 22:30:53 -0700 (PDT)
Received: from hu-viswanat-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb4dfe6dsm23345275ad.18.2026.08.18.22.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:30:53 -0700 (PDT)
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 11:00:30 +0530
Subject: [PATCH] remoteproc: qcom_q6v5_pas: Fix error masking in
 qcom_pas_stop()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-rproc_dtb_fix-v1-1-cb6be7f93bc9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHU/hWoC/yXM3QpAQBCG4VvRHNua9bPJrUiyazAO0CxScu8Wh
 89X33uBJ2HyUEYXCB3seZkDdByBG9t5IMVdMCSYGCx0oWSVxTXdZpueT2Wwz9FkFk2qIXxWoTB
 /var+7Xc7kdveCNz3A/I4DZVxAAAA
X-Change-ID: 20260818-rproc_dtb_fix-60f5064b0631
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787117449; l=2097;
 i=vignesh.viswanathan@oss.qualcomm.com; s=20260518;
 h=from:subject:message-id; bh=e2VGds5X/xfzMLSQ5PCs6zLcnqNPR99m7+/78W47KFo=;
 b=iF15ADwIcNNuvnx9f+fsBgEsfR8d4lhDCD8e7vDqtvNGh4a7nWEn5dLHehdckns45CAf91Qg5
 JkbBs67pyZGBBxMCm5DSLNtzbAxzLcURaX7qDfB5r4I4ZNMJe1iS3EM
X-Developer-Key: i=vignesh.viswanathan@oss.qualcomm.com; a=ed25519;
 pk=/lHspsTTqZQg546ZudgrbywCsk3Whx/C0XNVUevaKNk=
X-Proofpoint-GUID: ZhL1FJidbLxEIye5otfcNsuIKp0uYRke
X-Proofpoint-ORIG-GUID: ZhL1FJidbLxEIye5otfcNsuIKp0uYRke
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDAzOSBTYWx0ZWRfX9310nrmNCU/3
 O9n1uv+vZ1aPC6XVuDGpMobUEJnjysHtX3436NHPxb/erUyecFivbUmTmgOuDJdZcVfQvpS6bCq
 qofdzRZ17tgeCb7Kd7DfCkoEjMemLBIWNDhjnliPNAc8vww3TjeRBaGPum8ysGPIGEyjt5cXlfN
 D5XIuW4KFGxlI1NExmTSiMdxKiS+VS3yzRDpCBAvKhBslOeONExQsqjftP42deGCHTy5CLW+eFz
 eqemN943o3xxLLCOMSYRscfEsKw5YR/kc45IlM4ZPYmwveZf+Mw5dbEoHmhoiOpzYw0drXGcsW7
 JTGoT7Qs/pQoD9uVF3fifgMTJE6ZxLX20D0cqlIUbjbzTqUMJ/J7cnC30MY7MG3/IQQdu0+LmEe
 J/n6ZDYVwQzP+8908PFro/Z+Bm1eHQSYmK6eQ98Jjx6UV8gvJGlhX4IQb+9c78Epmj7uNSjOHLF
 81vUWBrGHgK3sgLj9lg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDAzOSBTYWx0ZWRfX/4D79TEVBo8M
 80MBF87exvK7+9vQW7fZVOQpnr0DcswKIawGBu2o3auN0duDjS9I33HF/pekmULrufxSW/ZI+m9
 PXSIFSSt8kytnplo3DyRhiIPhpQjJg8=
X-Authority-Analysis: v=2.4 cv=fvfsol4f c=1 sm=1 tr=0 ts=6a853f8e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=nI7rSZthmJYPCuEtDAYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190039

In qcom_pas_stop function, return value of qcom_pas_shutdown for pas_id
is overwritten by the return value of qcom_pas_shutdown for dtb_pas_id.
This causes errors seen on qcom_pas_shutdown failures for pas_id to be
masked to the caller. This might lead to issues where the memory regions
locked by PAS, as part of qcom_pas_auth_and_reset, are not released for
access by linux and rproc_coredump flow will end up accessing the locked
memory, leading to an access violation.

Fix this by using a separate variable for the dtb_pas_id shutdown call
and only overriding the main return value if the pas_id shutdown succeeded
but dtb_pas_id shutdown failed.

Fixes: 29814986b82e ("remoteproc: qcom_q6v5_pas: add support for dtb co-firmware loading")
Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ca8e61254c44..40e8f3e32aa9 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -405,6 +405,7 @@ static int qcom_pas_stop(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
 	int handover;
+	int dtb_ret;
 	int ret;
 
 	ret = qcom_q6v5_request_stop(&pas->q6v5, pas->sysmon);
@@ -419,9 +420,12 @@ static int qcom_pas_stop(struct rproc *rproc)
 		dev_err(pas->dev, "failed to shutdown: %d\n", ret);
 
 	if (pas->dtb_pas_id) {
-		ret = qcom_pas_shutdown(pas->dtb_pas_id);
-		if (ret)
-			dev_err(pas->dev, "failed to shutdown dtb: %d\n", ret);
+		dtb_ret = qcom_pas_shutdown(pas->dtb_pas_id);
+		if (dtb_ret)
+			dev_err(pas->dev, "failed to shutdown dtb: %d\n", dtb_ret);
+
+		if (!ret && dtb_ret)
+			ret = dtb_ret;
 
 		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
 	}

---
base-commit: e6664f2b33db9b6811eb4cec109f06cb2b4f458d
change-id: 20260818-rproc_dtb_fix-60f5064b0631

Best regards,
--  
Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>

