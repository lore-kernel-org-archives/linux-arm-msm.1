Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88B73EC686
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787555174; cv=none; b=aAFgAQxc+7kZyookvLix+YEQ+clvu7zvNVacJXlu5FCEktB9ZwqjNdNbtlNdEbMf0iau43ls+9gj1ZbitSLJ7IaQDtnacyq0BChqohzLhArUgbyn3DNmN92mo3gZvboxM4krMszF72PnJiaQsBawrq+kFi7ZpQ3LWGMsLKBCbpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787555174; c=relaxed/simple;
	bh=fFbBdZsBn9cYbR38sV1mk2Del8rxzLUumOQEDYuzHUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GABP5yYSdphrzUOijON3bHlb12HPYrwxybE5YhN4UJZwXSu0i40QFrvpd0IoGWs9TEP3hEfHE10T9w437UoDXhvhBdmF8wfwg+QRA1Uc4P+GNwtUaZBlsNUtCnBA8FcyHqBR4JAzjr5NYaoa+Y+5eBocumR+MG3sDb/L1CXhVdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SVb73bNJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=atEN52uS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SVb73bNJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="atEN52uS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RBCi1937642
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G8PGqfABGUV1c9BbZPowg1NQDNpEwLnOTxCBQoBl8Uw=; b=SVb73bNJdegVvLfs
	LhG9ra4PJbsTkynGUShSV674zHzovCqAB87jZspJBVe0GKGmLXt8C2fMtP0eujAD
	Qv5iZr8xntMuJjAuy2Mvs4+VYl02dxNbay54Z8Ks1+9h7IqN4iFmeyCUxNgx0GkO
	E2iZIwOD+6n6M0e6kpqL/UooJCyZxWDudW2BLLatCwEyUt4vRvwHOBFewoZso3hV
	cqu9qURLrtBkwK9B9uZOiG6d3wF5BfujOg+Ip/dXiC/Dbc49YjOla9iz66PhqCxD
	RYSMaGfP0iSCMF1YZolFTUSLn7pS1xrdi76TiDarr0zWNLZIPALSfMYh4WygZMH1
	2uR6Rg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g741qwv6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:06:07 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc18ced1a5aso2398931a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 00:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787555163; x=1788159963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8PGqfABGUV1c9BbZPowg1NQDNpEwLnOTxCBQoBl8Uw=;
        b=atEN52uSoirGs5uZ+3QLb01PFC7x4V76BusrZNINDYS2PFrqcJ7Eb+jhggGIgYsN5C
         F+TNB7o3P56uHg0MFwTmhqoF2SoghAzTic7NBKxp471Az7ta3boVefIbFknrUWLlGHsw
         +WEUmLqJFAKTBEh2PSDp1Y16r0v+nyiLse9KJRlB5W8YpBTm+W4Lh4oi48QXC2c4s7Ay
         6OCiTaoV20yN5wKgI2YB2gbE5tLZUhQKZdqxTrxPKt/GrQ3t6BN72dVKOg/fdjWsIjNH
         iFVHR15LRCCiIQOo9bYDQrE40t0pszO8S0B5jgouZsLf7o/raQQhiXZx7rH29Aod7d0l
         fJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787555163; x=1788159963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G8PGqfABGUV1c9BbZPowg1NQDNpEwLnOTxCBQoBl8Uw=;
        b=kiJDYFWa86HFNG4jN9dYQ7G0ZlM0GfRZ+b+7I7EVWUntz5Xd7nLSgnkDH6BgOcMSHq
         Cn4WixwH3svuIOCWjFhmBLgZzrGb6KeC6g97eFBo4WP+AzVneq1tlAsVhNHQ6yEzuLqF
         HCy6fh/yUhWs6YStR/0va8ReJZ4Drjvgc4ybuDlCuSQVSHLPN1+PEjBZ7blM99N5fj2d
         gSEetzLiHwWnTqr1oyHvcUnXGjmcOgm1gazZrh+pvJum6bp1iVqI8RaC3PyG88jBYg0c
         6Ass5bSu2Xc+EkJz3KvZ2qpnx4m7D7Em3AYufkvDauIVRhNrxThaCLdMBXPlRbfhj4wP
         Gkhg==
X-Forwarded-Encrypted: i=1; AHgh+RobZNvUDdG2utqg5OZ9evIVIt6+ev6jFrtD9WC2gQ0GGN+P1SUpLYqSHO2ONsMPBMURSY5mrsCRpKzgp934@vger.kernel.org
X-Gm-Message-State: AFuF++mwhtBR5kfe9inznUhtPdElo61WDL+kPAS1pn/0uVymiu1cigUm
	POhOUauWw/mvGWXXlM/QwmcuStGwO+X2sBn1i1N3rCKZ/UA+Ivna7xHfaIyWFXfHImHgGaYYezv
	1/rZ3B4NdrjcdlDWnlE2W0LbWOVNhxu/8FC0RlVdYyRuCqBHoCWX3rAZHY0oIi2M9XCme
X-Gm-Gg: AR+sD13rigFaikxNdKzgN0BhNSk2HX0z+9Nne58uQMqFHL25wTh0Vcctyh+ACVaeKAE
	goIapSkdvyLbpcg+SAtm/HWmy1V3vI0FgyjaYMgJqYV6ivNk1wRWSd9L48ncmZkRRSMKF6MA8Bu
	kkxF/wn4A9rZZS1QPhbE9I3wl41ucTL1cKbdVZVa+nHZ+BstIYHnRDYCSgXT7o4XVe8IpLK0Oza
	Lfpi60+4Zyubd8UavamAOsT91BignEYE0peZ8+GqCpPUomnk72p5Wpz0rKtlacUyM4cL5Svjv58
	7vq/PPCDmKbrnKhHJ63rYuJgByrPuXrzyd1VDFOLzJkXOAYQ/lkJLJ8shyupCAT0aCbuD+KLbWp
	WW1Ar4ChW7SDc9R9n0oEqqkxueIZOLprClvlfCsGOdHnvDfCCfv6b4/E=
X-Received: by 2002:a05:6a00:348b:b0:848:4424:2b8e with SMTP id d2e1a72fcca58-851f9a8fb96mr41712159b3a.3.1787555163553;
        Mon, 24 Aug 2026 00:06:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:348b:b0:848:4424:2b8e with SMTP id d2e1a72fcca58-851f9a8fb96mr41712115b3a.3.1787555163244;
        Mon, 24 Aug 2026 00:06:03 -0700 (PDT)
Received: from hu-chunkaid-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f149ef3sm1642178b3a.41.2026.08.24.00.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:06:02 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 00:05:54 -0700
Subject: [PATCH v2 2/2] rpmsg: glink: Request the RX interrupt already
 enabled
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-rpmsg-glink-split-protocol-start-v2-2-362d7c233f66@oss.qualcomm.com>
References: <20260824-rpmsg-glink-split-protocol-start-v2-0-362d7c233f66@oss.qualcomm.com>
In-Reply-To: <20260824-rpmsg-glink-split-protocol-start-v2-0-362d7c233f66@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, chris.lew@oss.qualcomm.com,
        tony.truong@oss.qualcomm.com, tao.zhang1@oss.qualcomm.com,
        peter.chen@oss.qualcomm.com,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787555157; l=3818;
 i=chunkai.deng@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=fFbBdZsBn9cYbR38sV1mk2Del8rxzLUumOQEDYuzHUQ=;
 b=5z5pW4rjQaHMBrdo6p5ssrK1OewbqZ1Mrgw+rWaYrun3losyapT8VYc1DKhFckVRHJKONFJtf
 CCM7Uo3pIFUDjxpEt+LMjyagPqVD0Ukn+/2TkrDxY9Pf7pLjq9M3OeG
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=wWxCpsJRKQeVRzpZ8GLRnUX6ozLMowqE3hiz/j+j9O8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2MCBTYWx0ZWRfX0880dYT6H92D
 9g7nMzaYHv4YIJfztU0QXv+S8+H/owx1QUxlcdxB47j4c2dGVmFJ8D1Q2OoDydeUO10sixy88aa
 8sEgbIoBtcw+AN4ZgUSzpHq0JPUuIS6m2zPlXNoqfLHkW37TmwxX6BdiqVDETEnNRWo9bagk3rI
 Kl4jtNojj6wvqWoe72MRNoaFEwNX0W4/HXrSyuBtVj0/vOEysvbHh48OYxZTdJN/0//OqcXZX/C
 X20ZHRAqmcecd9NwbUY66Gwydgq/+PnAuWnoWPCSDJXZaXC87xZUsRRNcEga+3+aiEqqMZqkDFP
 uZfwk0rLRQ/4YQZMGJrPgKX4wkAi3QmP8mx6qktIiTvqG8bWw6HO9mI81EIarpWxdr3ktysZ6lo
 sQu72FxdcKdCV25lEU0Udpsi7rtQPwM29Mi09dgx5y35FLh8J5NkPqW0534Tcnxu5HYes3ZYJQv
 4eORf14Rcu+X68TzQOw==
X-Authority-Analysis: v=2.4 cv=GvNyPE1C c=1 sm=1 tr=0 ts=6a8bed5f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ubEyju5v012Ajf4tItQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: loLyPThXYctkmU1-b96P7dXUs38C2r4d
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2MCBTYWx0ZWRfX3OsWz3J6FrsG
 EURj5v7qHxvaX5ooxyMSGxh4QzrKCJZYlUwzlJelZqkaXqyDkehNqQeFykwoSWvcfNxh9vAllL3
 ZFc9tGjHK3ddYSZwDWgtO4dG5lE6OfQ=
X-Proofpoint-GUID: loLyPThXYctkmU1-b96P7dXUs38C2r4d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240060

The receive interrupt is requested masked early in probe and enabled
further down, once the glink instance has been stored in the transport.
Now that the version command is no longer sent from
qcom_glink_native_probe(), nothing needs to happen between those two
points.

Request the interrupt where it used to be enabled, and drop
IRQF_NO_AUTOEN along with the enable_irq() call. The RPM error path
becomes a set of labels, the way SMEM already unwinds.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-5
---
 drivers/rpmsg/qcom_glink_rpm.c  | 34 ++++++++++++++++++----------------
 drivers/rpmsg/qcom_glink_smem.c | 19 +++++++++----------
 2 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_rpm.c b/drivers/rpmsg/qcom_glink_rpm.c
index 34f18c3e58c8..a85d78f8283e 100644
--- a/drivers/rpmsg/qcom_glink_rpm.c
+++ b/drivers/rpmsg/qcom_glink_rpm.c
@@ -316,15 +316,6 @@ static int glink_rpm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	rpm->irq = of_irq_get(dev->of_node, 0);
-	ret = devm_request_irq(dev, rpm->irq, qcom_glink_rpm_intr,
-			       IRQF_NO_SUSPEND | IRQF_NO_AUTOEN,
-			       "glink-rpm", rpm);
-	if (ret) {
-		dev_err(dev, "failed to request IRQ\n");
-		return ret;
-	}
-
 	rpm->mbox_client.dev = dev;
 	rpm->mbox_client.knows_txdone = true;
 	rpm->mbox_chan = mbox_request_channel(&rpm->mbox_client, 0);
@@ -356,17 +347,28 @@ static int glink_rpm_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, rpm);
 
-	enable_irq(rpm->irq);
-
-	ret = qcom_glink_native_start(glink);
+	rpm->irq = of_irq_get(dev->of_node, 0);
+	ret = devm_request_irq(dev, rpm->irq, qcom_glink_rpm_intr,
+			       IRQF_NO_SUSPEND, "glink-rpm", rpm);
 	if (ret) {
-		disable_irq(rpm->irq);
-		qcom_glink_native_remove(glink);
-		mbox_free_channel(rpm->mbox_chan);
-		return ret;
+		dev_err(dev, "failed to request IRQ\n");
+		goto err_glink_remove;
 	}
 
+	ret = qcom_glink_native_start(glink);
+	if (ret)
+		goto err_disable_irq;
+
 	return 0;
+
+err_disable_irq:
+	disable_irq(rpm->irq);
+
+err_glink_remove:
+	qcom_glink_native_remove(glink);
+	mbox_free_channel(rpm->mbox_chan);
+
+	return ret;
 }
 
 static void glink_rpm_remove(struct platform_device *pdev)
diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 28f6cfda6352..2d6fa2d3a99b 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -304,15 +304,6 @@ struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
 		goto err_put_dev;
 	}
 
-	smem->irq = of_irq_get(smem->dev.of_node, 0);
-	ret = devm_request_irq(&smem->dev, smem->irq, qcom_glink_smem_intr,
-			       IRQF_NO_SUSPEND | IRQF_NO_AUTOEN,
-			       "glink-smem", smem);
-	if (ret) {
-		dev_err(&smem->dev, "failed to request IRQ\n");
-		goto err_put_dev;
-	}
-
 	smem->mbox_client.dev = &smem->dev;
 	smem->mbox_client.knows_txdone = true;
 	smem->mbox_chan = mbox_request_channel(&smem->mbox_client, 0);
@@ -346,7 +337,13 @@ struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
 
 	smem->glink = glink;
 
-	enable_irq(smem->irq);
+	smem->irq = of_irq_get(smem->dev.of_node, 0);
+	ret = devm_request_irq(&smem->dev, smem->irq, qcom_glink_smem_intr,
+			       IRQF_NO_SUSPEND, "glink-smem", smem);
+	if (ret) {
+		dev_err(&smem->dev, "failed to request IRQ\n");
+		goto err_glink_remove;
+	}
 
 	ret = qcom_glink_native_start(glink);
 	if (ret)
@@ -356,6 +353,8 @@ struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
 
 err_disable_irq:
 	disable_irq(smem->irq);
+
+err_glink_remove:
 	qcom_glink_native_remove(glink);
 
 err_free_mbox:

-- 
2.43.0

