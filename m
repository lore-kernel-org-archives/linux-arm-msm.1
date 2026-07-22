Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF97D353A8A
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727926; cv=none; b=VC4XadH3p1Yvb6mdPtyWj/jo6GsFVkK3xTDCzv5sKPUwH+v4VOZMuNYQT+wcsneV/u/3f9fSSd33R9cMzw7HMZQ/TVkeI268Vtolfd37jJEFWFGBFTRIAtzFMKZ1fk7u4Hzt5rx1JdQm6AUY9XiiPQnHM21HdyyDqBXZck/P34k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727926; c=relaxed/simple;
	bh=tNsF/WcyC0IAprWHFH3RJbzyT2uMIAOssLEeQ33n1NI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FdRityqNCDCzXG7S/RfVQck4fFbeUH5NpbL6L0GYVb54XtUI0ROsRlrPUBud84SyO0m19Kdb0ZWpBAkDoTbI1Hd9Qc8TS49JrpxJUicL1FKSGd/LExoVpAcpqvOycEQhDuFtNPccdc2SApHjFqFukkfAsH8yads2CKg53g9KpgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sk5OT7QM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bYAkCq45; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sk5OT7QM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bYAkCq45"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWM8n646335
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	06nNTeJjyFOIPuxgya+vwS/gLIKghgHtI72YfoBDYUE=; b=Sk5OT7QMYDWzSdZ4
	mJ3GcNIyqytBXolCSM4JrlaihhM6oEtL3y5EVnLjJhL7oXzNtr51VGBGTAA5NvQQ
	7oYgma7kKMzdO18yQmz/K11IAeAgm4ZFaVBFdObo8iGKiimUqF4bkON2o84kS9tx
	p8RvqzisFqBxV/oBjbHQfxPjdqjHALCZY0U/qJ6sTYdaalGczoAVgVYD39Mga5Fu
	aR/t2CF0vNQp2QNtrcNmgQOMSOtwCKLQSlQirggplmz+CAq7Kly+utz1rQncsuec
	oqsQvwJypLUxrah7fNZtI1aSbYpOtq3iC+GHKLdg1Yf/lFXgjy35j5orX+tCCn4/
	i7WxzQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fju22939e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:45:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c01ff996dso103570561cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727922; x=1785332722; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=06nNTeJjyFOIPuxgya+vwS/gLIKghgHtI72YfoBDYUE=;
        b=bYAkCq45mGGbzW6+cZDtRMERIYnMJD6rCNMk1M2SzSwZbEkndQwcB60pWLk642KfQk
         hAhz3/Nzpb0BJaevzaCzshVanWjdnfL8FDQePDTiNdF22Y62wn7EHuhf0zFM4oIZXHEv
         WnVsWFgSTVV3yU+UyvJBq/RvE3BsMA51QT7whxvXXmkyeoLRHo7LJivSqPB7N+ApNqDj
         in5cQmXvHBpNhZFye/g+3qbi3T6WCeZlHkuxU8+wkrRQUQgLQwx/oqgG/+g4Dgioh8xV
         WLOpVAo5L4yHtzkH+fo4ZRGfgEekSniu0PRRj8cLyyemqwBB4G1pMuLbdk6wURXVbnTs
         LfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727922; x=1785332722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=06nNTeJjyFOIPuxgya+vwS/gLIKghgHtI72YfoBDYUE=;
        b=cOc6ZwewS7cIFg3icpSkQKRiimB2bgC26J13uHdmvI8Q3GOsV2prhdoF1YVqPXtkpY
         fIV113i5LzqGAaYPFw3w/LmO09Dsydb8Ady/8I8CO4E4gJPYfH5MM8Z+WC98iNLwnaWU
         FUPsLwbka9OadSuf+6H7Dd0thBNmFrRoj9ZLL2dZYu0KxTV59Wklz5zm7HDvuwcEzftY
         3PNGnkay0DAMHj2OmyOaeZqoUBw4/sh3m0PUC5Fd78U/Mz5nIRtjC5IQ2NFmXJUP77lV
         zi4Cg1/BziS8Njde9wUPZuhalN4kocekfjv5JIbKNjO1pTDDf578n8knc0DoVZKjboSt
         Iq/w==
X-Gm-Message-State: AOJu0YzaGRXRD4M3bFz4cwndE/+K1N/Ll+BX1N0lwbn8OMNPHg0H5U45
	nRcV2rUEOBEUuJ68uEs0tqkfThUxrw7MkctMxWQt2A7kXOD1+jUGxwxEs6A+RwEYs676lplCaYJ
	DGDO4xAI/a+G+Lq291MR5MK8cJzfAgEKlL8FS4+0ODSTIzv5e2uZdpeyVR+OUcJzv2sD7
X-Gm-Gg: AR+sD11lFuICNQHEqBhG5xGx0SXF0cYx8GZfNPERqXVdxVDcEmoAEUCGnUH3vlIDkNX
	YRfr+5LCyfM5+d3LsvT9EqUglni5VZVeJ/uNvKbq5MMUwvRQrdgJgkMO99f9zGwZ271nPQgFsvD
	QxGvfHEzgJM3hdQDR2j2S1UFv0jAkpv+kpblZ4z9KW6ygqke99HZbOtG2aXSihJwssf/rf0cyyx
	tyzMtL/NXGTGPu5UgnWEvAuBYl97mX7bKqy69NaffLZSy0BS+6+oFJqfaQGwOHcAOB1PE+P5K8r
	DKjEtuh+7BsuFSzMG2Ae9U2dwQeJKTxDA+21RtImqsjILfiVo/U+sT8ZWNJlUrygDL+jujy6RwF
	jLmQAmeZ0829qORlayephDtVKoPHjZ8EVqLfsGEPALeK6It1Nds0HSyruBsuaXZoMKdLgZts+Tb
	WrLp44K+fn0kcrQ5CJsLvB9noL5vYwhKNxzgif+D4qQ8QUGwCQOA==
X-Received: by 2002:a05:622a:1a9a:b0:51c:1e2f:1281 with SMTP id d75a77b69052e-5213e48b00emr222520171cf.42.1784727921291;
        Wed, 22 Jul 2026 06:45:21 -0700 (PDT)
X-Received: by 2002:a05:622a:1a9a:b0:51c:1e2f:1281 with SMTP id d75a77b69052e-5213e48b00emr222519521cf.42.1784727920559;
        Wed, 22 Jul 2026 06:45:20 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:48e:a2cc:6c4:c92a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac8c3esm111874366b.23.2026.07.22.06.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:45:19 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 15:45:15 +0200
Subject: [PATCH v6 2/7] phy: qcom: qmp-usbc: Prevent unnecessary PM runtime
 suspend at boot
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-usb-phy-fix-null-v6-2-534f7e61b9a6@oss.qualcomm.com>
References: <20260722-qcom-usb-phy-fix-null-v6-0-534f7e61b9a6@oss.qualcomm.com>
In-Reply-To: <20260722-qcom-usb-phy-fix-null-v6-0-534f7e61b9a6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=X4Bi7mTe c=1 sm=1 tr=0 ts=6a60c972 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=yoX6jHX73kXkGH752t0A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 4VXQQWZ47hqFdbj5DJoDTMnOEc4SIOiU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfX132UAwzWBDuj
 bBEMu0wBYVw7OOEtiw5A/VLkOvsbhQKKdRrs3bxUSwI1ks7dak1smOBnJyZse+/mm+gYnBs9RZn
 NLtR51Q0QLKNoMEqvyejyghfjrt1Dps=
X-Proofpoint-ORIG-GUID: 4VXQQWZ47hqFdbj5DJoDTMnOEc4SIOiU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfX25QE1Wabn/l5
 78utoh96SVrRFSwlfd0NLcQZXfWUIIoX5AScr3iDOLMQWsKXqvmU9wAon63I+ITklNYY+0fwWCF
 ODjxJGk7Pv5igeJs9bJcFfEL3m6ROCWDEJx8IY4qeKsRRZmOJbObYFRruHV8ossrTN7tqZaAcQ5
 ek3Ehm3xpyGYx/ZZTyID8wJ9uq68SzyJykaPK6ol9KhJO9V3k+bFcLkWBWid/QvrNbr5OH5sdFc
 RltD1qWknTE1YB1NbabgwXI71w/O2Nvp10h8psLK0npH+etXHyFh1F/6KkehIwDNxAaFtJxEKrU
 ZUmRk2Ie+/Y6/WL2FTMwVmZ9cF7kyrPqkPc0Zv8a6jhfPXxlHjrdYz44L9nh3+ex8/P5czcjl3U
 bgAFLUZDXCb+PETRMv6rzENHYiEE0ZnsgntQomL8wc4cPiNf9cyKPD56DQE2O1dd73MZfpitWRr
 PpxKlz+/vTbd+01NI8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220134

Runtime PM has to be enabled before creating the PHYs, since phy_create()
only enables runtime PM on the PHY devices if it is already enabled on
this parent device. This opens a small window where the device can be
runtime suspended after pm_runtime_enable() and before the later
pm_runtime_forbid(), causing an unnecessary suspend/resume cycle while
the PHYs are not yet registered.

Take a runtime PM usage reference with pm_runtime_get_noresume() before
enabling runtime PM and release it once the PHYs have been created to
prevent the device from being runtime suspended during that window.

This also makes the probe path safe independently of pm_runtime_forbid(),
which is a good preparation for potentially dropping the forbid() call in
the future and letting runtime PM be enabled by default.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index ab3055bb5b0c198832ae06dfcd04fd34395e271d..780a6b4f71eb41adf8f7011db8676c56f704b933 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -1959,10 +1959,16 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
+	/*
+	 * Enable runtime PM before creating the PHYs, phy_create() only enables
+	 * it on the PHY devices if already enabled on the parent. Hold a usage
+	 * reference so callbacks cannot run until the PHY is ready.
+	 */
+	pm_runtime_get_noresume(dev);
 	pm_runtime_set_active(dev);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
-		goto err_node_put;
+		goto err_pm_put;
 	/*
 	 * Prevent runtime pm from being ON by default. Users can enable
 	 * it using power/control in sysfs.
@@ -1971,13 +1977,13 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 
 	ret = qmp_usbc_register_clocks(qmp, np);
 	if (ret)
-		goto err_node_put;
+		goto err_pm_put;
 
 	qmp->usb_phy = devm_phy_create(dev, np, &qmp_usbc_usb_phy_ops);
 	if (IS_ERR(qmp->usb_phy)) {
 		ret = PTR_ERR(qmp->usb_phy);
 		dev_err(dev, "failed to create PHY: %d\n", ret);
-		goto err_node_put;
+		goto err_pm_put;
 	}
 
 	phy_set_drvdata(qmp->usb_phy, qmp);
@@ -1987,17 +1993,25 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 		if (IS_ERR(qmp->dp_phy)) {
 			ret = PTR_ERR(qmp->dp_phy);
 			dev_err(dev, "failed to create PHY: %d\n", ret);
-			goto err_node_put;
+			goto err_pm_put;
 		}
 		phy_set_drvdata(qmp->dp_phy, qmp);
 	}
 
+	phy_provider = devm_of_phy_provider_register(dev, qmp_usbc_phy_xlate);
+	if (IS_ERR(phy_provider)) {
+		ret = PTR_ERR(phy_provider);
+		goto err_pm_put;
+	}
+
 	of_node_put(np);
 
-	phy_provider = devm_of_phy_provider_register(dev, qmp_usbc_phy_xlate);
+	pm_runtime_put(dev);
 
-	return PTR_ERR_OR_ZERO(phy_provider);
+	return 0;
 
+err_pm_put:
+	pm_runtime_put_noidle(dev);
 err_node_put:
 	of_node_put(np);
 	return ret;

-- 
2.34.1

