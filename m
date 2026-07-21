Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FC534107F
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784639159; cv=none; b=NOLpmTmTlkBVhlT8w2nxgXA4vxLOm56WxC5ivTQky68V7NbJniYHEkVsFDsW0agCZfMe9rz478kX/Mjj4FsJLGjCzysdbIo4sk+oQdWVT//rkbkNbDmmdfIBnDvQ27lKrR7Hhq+v+n50XZq/dgPkEwA3I5rk/tbOc2WDrkLtkQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784639159; c=relaxed/simple;
	bh=1uCSE9pS0uK8c8rmwdqjcZn44CXrmRxmSQbFF1quomQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b0+Zsu7ghKXp6/WVuFeJje3y/TSHxIHLXG1GB8i3lfxgXzWnM31TbwS0gnq9CUQL1yy4h3wWpMQSB0qQMVLF6ZVmhxK+7iPnys3iNUTRTVUUXAbksZbNLCEA5pXnuzg3iGVGyU+DQ5fCVZgLcMnaUAX1HtuUyg64aj0MHG5qW84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GyFacerb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XEUOi928; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GyFacerb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XEUOi928"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LAR5Df1349379
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w1VnrF5mL82CPISYHMNOBYhwf3W9zInAag1/ZxJRFrs=; b=GyFacerbsu+7NaWF
	PA6zCWDW9/Z2oximPkP3NhvZeOLrSkdd5rwtoa+SmYmnzqSSIcprdvf61lpGvqUC
	s8J4xAjWdLXRtom04ClRv7zoN4OPMBYFBuZl8Rcq283F4XaLfzd45q7N/rJYxQrG
	SgeJnSkUt0R+US+ooe1GADTDM8ugUMcZzlEfGcSSZsPLaxinmzB7snBNF3rSjx71
	F/wvZCbH7wESDGTyVqKmTgyT09/4xHY114+v7kpSI+l2qZ2EXciB0hrvQw7kS4et
	UmAgEK/Ia0uDG+rVgt84gP+g6yqUp1rzsTwvv1oSsnOCokrALq8ehWwAQbyCMAuf
	xqVdiA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6pa8sx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:05:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0199faafso171925531cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784639156; x=1785243956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w1VnrF5mL82CPISYHMNOBYhwf3W9zInAag1/ZxJRFrs=;
        b=XEUOi9282MwGwcspi9PVM0lTiYYTSQsnmr5L1Fh+uZwJE+pM0i0X0kMSBmpwJQS1gc
         OTi1RVmqpifN8rjs/SdW5lht3cBeDLDACpGdVGlSWdgIQ1MMCTfxVV3JywjbYogwKfjb
         kGfdnKJFbUUU9PDKunzxAI6WTKyBSEmHu1xLNNXAgK4OK9cpzzCqQpntn+d1DziJIrTP
         +P4TUv69hgPUMO6vYDyYKVfhEyn6JAtXYWPAMM0d8YW3a9gYJawFo7WryUgQDV+ghxnA
         PVdVt5RbhS2jR+CnIN3AOi4mewm5cmLvMtEIzRs+4MwLe6zZh6NvCwRXxAcAITNwEy1h
         DCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784639156; x=1785243956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1VnrF5mL82CPISYHMNOBYhwf3W9zInAag1/ZxJRFrs=;
        b=R6ltGcjXKf4ZT0QG5sjCP7IafKp3mnb90UzXIW6/Vuxv3TcrYhMgub5t4rJJPpYUn5
         bMiVH4lWKfdO27DVEbj8tzTOzgLH8UktSjuGhZa5iogKaefQIpkGDLgGuM5Q6ZSpbbY1
         3gCGB+7VB3sa1E1GnVJzCppKLtWC9uqeQXCvpGOh4gqMXNGy4ST7rEhoFe9OWXEe9K/k
         wP1MhmBmNw+Qf7zGZOG/RdMKkrAiCqYsqB8ioWqovyefiJNR0aL6QLEtBOG4vjV3oR5E
         gzrv9v5GSIoLaAOdkEZYcatfNvOy4fBMx2bWUWcnkGfNsOSvqUgMsyUT3sN32Zr59RQM
         InGg==
X-Gm-Message-State: AOJu0Yz4UASXqDZEyZ7E+F+I8wQ57Q/06E2V9+qrBIgZlo8rCQqzNtPT
	JfJimqSl6a1J9qSiTMf47Tz1r8u8QxsiPoDVqDPJr6QvGIJHnymujyt6A70MtsJHz7QfXIpRH5+
	8l0EfhdwkD6qfjwoEFJLMM0IRRRvQtxGkNLaGwSubtUro3DscDv4Qm6tk4e6KhApuFpSbGsHccI
	zm
X-Gm-Gg: AfdE7cl29d56RrPpfjLwuaEBhzyKpC/KFWDmXGvqo2POCWThwrWON/NqMVH73O8xA4B
	eWhzkIS6WQPa9DV8Y7LCZ1Z0LmcuQskmvdEL618aT9BTjg0sYDj/mkg0npZWiw9snw01Wk8Gz3R
	gwVnMkr90mQXKXYhKc1+msy9VSENdafVpk0l5EIqaSSwusETSpDFBHBIk1aCxfkoQ7/gnu+liiN
	fBaWSMelTpzNq4OO4U23w1TJtFmZlKzwbsRz0HsyWvCiB0FvYjnfOqlDjGct9kkSqTSi52Y3Aer
	toRmxuXT57q/pX6INh8lSxxfRMaxhFKg3vliiJIjUjtb0+wbpqcqqJUVBKtzzZvEoDOWs+zqpV1
	cm6QF8beZs4PcUMR2a8+Zt7gHBt4qsIp7M95k87OvGnG/Y20PFqxQG08K5jrRoWsActK56erTw0
	KOXE6QpcLM4TmAu8hikw9v58/iHCqHnJrpcaYQCKVJ2rmMYZda5QY=
X-Received: by 2002:a05:622a:110c:b0:51c:167d:b346 with SMTP id d75a77b69052e-5213c5f3a9emr164339761cf.23.1784639155497;
        Tue, 21 Jul 2026 06:05:55 -0700 (PDT)
X-Received: by 2002:a05:622a:110c:b0:51c:167d:b346 with SMTP id d75a77b69052e-5213c5f3a9emr164337661cf.23.1784639153460;
        Tue, 21 Jul 2026 06:05:53 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009ae04bsm591898066b.8.2026.07.21.06.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:05:52 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:05:47 +0200
Subject: [PATCH v5 3/5] phy: qcom: qmp-usb-legacy: Fix possible NULL-deref
 on early runtime suspend
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-usb-phy-fix-null-v5-3-a181e2adbd2d@oss.qualcomm.com>
References: <20260721-qcom-usb-phy-fix-null-v5-0-a181e2adbd2d@oss.qualcomm.com>
In-Reply-To: <20260721-qcom-usb-phy-fix-null-v5-0-a181e2adbd2d@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: rPE8Akl4_iA9Yy_0I-jVlY2bUQmj7laj
X-Proofpoint-ORIG-GUID: rPE8Akl4_iA9Yy_0I-jVlY2bUQmj7laj
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5f6eb4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=QCvEx_dtP_Vb2dzgXhUA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEzOCBTYWx0ZWRfXyfLszqgpu3BZ
 w/rapfJT4qlwwksNTahcaptCu5mWtgipFEU6KurjZlOTuL0h4MooZlVGNyqf3YZqgPOALShfK1J
 O0dg5SVzxjKQYpWp2Lk5Se1Bm7tA23pQTxNL6iN8KXhGq204JNskt/mviZowU46grCApzWZOg+H
 ky9qG8f9BtlDn5zoYcXm1UaRktNVB2LlIhUcQUuSLPxASn1rsZyEcej/85JVLuv2nxqoXcEB+QD
 ZJWn8UwpfxKPmmxBYvsKYSftlKgUyOHQ6wRWBJd5iTdIZPX7B6eXdz6CvpgRcMyzOTMXGPnBXaw
 hxEvqECMahs9oMHFDC/44ZGuE19JfHPkMRKjC765ULrK79R6NfEn94kE3qZlg+eAqxK269MNFyj
 JpbWVgmkhnX/9U01BWpNb8Q4G3PyfvWJqncLlMjw5a30JpFgi+z8QljsC/jWuMRBkZKkbCvmoSr
 uakQ/tsT2IvffUa+aFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEzOCBTYWx0ZWRfX/+LSEbP05Aso
 RCDuByWV2o2uXSqrWNo4Cd/xVK+dhGRWGZxFJKNOJBaMPWiZdi92+WuH1oJ6zP6yEY6qbZvBLTy
 JFwOEjqbJ2N4bewAcV1nL0wim85zxRA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210138

There is a small window where the runtime suspend callback may run
after pm_runtime_enable() and before pm_runtime_forbid(). In this
case, a crash occurs because runtime suspend/resume dereferences
qmp->phy pointer, which is not yet initialized:
        `if (!qmp->phy->init_count) {`

This can also happen if user re-enables runtime-pm via the sysfs
attribute before qmp phy is initialized.

Similarly to other qcom phy drivers, introduce a qmp->phy_initialized
variable that can be used to avoid relying on the possibly uninitialized
phy pointer.

Fixes: e464a3180a43 ("phy: qcom-qmp-usb: split off the legacy USB+dp_com support")
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
index 8bf951b0490cfd811635df8940de1b789e21b46c..fc490589c8e4888770807a60170905a1c7610421 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
@@ -542,6 +542,8 @@ struct qmp_usb {
 
 	enum phy_mode mode;
 
+	bool phy_initialized;
+
 	struct phy *phy;
 
 	struct clk_fixed_rate pipe_clk_fixed;
@@ -895,6 +897,7 @@ static int qmp_usb_legacy_power_off(struct phy *phy)
 
 static int qmp_usb_legacy_enable(struct phy *phy)
 {
+	struct qmp_usb *qmp = phy_get_drvdata(phy);
 	int ret;
 
 	ret = qmp_usb_legacy_init(phy);
@@ -904,14 +907,19 @@ static int qmp_usb_legacy_enable(struct phy *phy)
 	ret = qmp_usb_legacy_power_on(phy);
 	if (ret)
 		qmp_usb_legacy_exit(phy);
+	else
+		qmp->phy_initialized = true;
 
 	return ret;
 }
 
 static int qmp_usb_legacy_disable(struct phy *phy)
 {
+	struct qmp_usb *qmp = phy_get_drvdata(phy);
 	int ret;
 
+	qmp->phy_initialized = false;
+
 	ret = qmp_usb_legacy_power_off(phy);
 	if (ret)
 		return ret;
@@ -988,7 +996,7 @@ static int __maybe_unused qmp_usb_legacy_runtime_suspend(struct device *dev)
 
 	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->phy->init_count) {
+	if (!qmp->phy_initialized) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
@@ -1009,7 +1017,7 @@ static int __maybe_unused qmp_usb_legacy_runtime_resume(struct device *dev)
 
 	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->phy->init_count) {
+	if (!qmp->phy_initialized) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}

-- 
2.34.1

