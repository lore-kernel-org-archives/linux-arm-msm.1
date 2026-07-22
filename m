Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303C0355055
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727929; cv=none; b=jf06XMQ3CP3fpghJXDWTxuNE/FqZHEZvpNRKfkM0fFxLowMUgb3rTrSrAK+vL5TAFxnRGGuj8On5XTUzgFWkQzj6Z01mgO6c2a572pK/ajJICaeoeWNsAXXGWpg2X5Pj+258ON4fA6TZtP6QTf1gAPOmMW6CT1lRAjqNo8pVTjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727929; c=relaxed/simple;
	bh=RnXrSiqUbjwwVh0fjK8iSpP2LVrDFGf1j0mxbQZTxGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bW9JIMOIwgfeY6VtqRcVmqpUlnpfMjMLiWqi5rppHkaH7L4mPrkR+8sv6WK+XeDE6uSl+CelQQ/JhV6ztZUMpNTaGc2/TaTUBKhSfr3g/BbDf5vA/A57+vK9d6ptKq8QjM9pJMRANA1QBl8bZB+BZV4JlJQeelbXyS8o3Xp3UvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mm5A8wbz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N8yjIS2M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mm5A8wbz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N8yjIS2M"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWqdK755415
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:45:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	70IOUuaW7cw8k4RLr+fSBXr1xu6M0q9hq91f5W2ss5A=; b=mm5A8wbz15Zm5rWs
	SWLaEV7kow3N7GdqvMxexsiAwATiBtS/i/F4tWtXg2hf/g4D3Lt9LxpAOrObd72K
	5P4nGhTEXOPw8zKDC+4RMdnpOYRjk+NXVQKgEm+sNkmOMChcRvXc8ETA4FWglTj6
	o4HMrRZ5ImDvrk+NmxebDvJS9YdkDTrRMc60ylFwoqz0za8h3TArzUqcSWzxAunb
	k0/6BYQul5xAST4T70e5kgVXCNwzmhCe6xBsP5Bj4doBgt/ZgAyZ5ogVyjz4uaWk
	IRsIajHtOOSq7HvdW7NDWlfOQ1CKZOJz0n+h5uP3Kx3zS5gnzle2DUa1sTaJX2c7
	UNFj+Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjnu4td83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:45:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c01ff996dso103571711cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727926; x=1785332726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=70IOUuaW7cw8k4RLr+fSBXr1xu6M0q9hq91f5W2ss5A=;
        b=N8yjIS2MIqMDZ/9IkNoA3TdFY7W3LxJDwplx0hSqaT2yju1oJ9zgjrLthp4OyfxiuI
         nbjix987fwaDscIJN13vKxftvXwzBKJHkRXnYm8RrGw18HOCamV328Ykp0PDFYYs64EO
         ZO71MbMmEhZe7Or8kuWjXSOt1tE6ymyHp41eWdZN8bux8o8Kg/xUggltFvpiuNNDVp9f
         zJKj1vJc+WNRS5GEypQWXE6vgJuvLuq7bkP3miIxf65k+Y8/2FWE+gbQewVcY5wzlIyz
         ToDKAqTKoKkZXhvIOV2STjbSjBx8IzBwHePsvh62qHlg9ugP75TBGqE43g0XOXHUDjZb
         TTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727926; x=1785332726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=70IOUuaW7cw8k4RLr+fSBXr1xu6M0q9hq91f5W2ss5A=;
        b=A/OUP606Y2lP4DQ++pULLXwx9p8HCCoGetUPp8eA/YShTnaW4z+k94/eEZ1WfqTcuV
         KvMYkZQBGBMHDjBZcyW7an406L44O2VTZTffNzjfBLEfPHLIZG4djb15pzXBlSwdUk0W
         QyjK8vl1NPgMuFywERTGZrCXmkaDvRcZ9VdCth/r1Ra0i0z3trJd/itcnbtuvWmKwrAX
         GOOfefdffPL/Idi07JlXbH++XoulNb/p6Ld0TJo3LD5Y30ZwY+FV74oXXtH2rsBX9q9s
         F9VSIJSZFl0KVh0IQaFXZjn7DmgmM4t33tGwOqRQLwR59+I3oMcILhzOSV5Xf1q6Y8ns
         LT2w==
X-Gm-Message-State: AOJu0YwmLrfgxhZZx9ypUAjt/RsJjztXir1rUpTfQg6wMRIuReFfjIvK
	KI+nVUhdT1aUp6WdDGRXODaTp7qNMEzgfbAZj8osLguWAMPSmR+7XUZGo+uzKxdnCD70BeWt4fg
	6WBRkNjTZOaTJqGazaDPNLPMsKbYnIMj3VmcHlJj1LU/0Zy/LPUlKK/N8cjUI2AE5qflB
X-Gm-Gg: AR+sD12T3/fE3QmxKjZTBWe8BR3i7PPJD7InzaQ9SXmiz1n7eKTtZdzfcf25mbJmiCY
	uHM088rH8gNt+M1Rj/B7fWedr2xnjG6NKmvP3wWbZW4rQPLQo+ZJPu+XvMqYv2ZTNrdM99t75QR
	e40CseRfRHnGphJu0fGzsADOcDm0dEVpxbjp4r+LrgwG4uiyWYvy7QnrajULO1htNcGiIBF0PUS
	fb+RMTE74ZtSscOJVRCTOxls7Ek0xGU+gAwQQ6odfYW1mTJfdPgF42nPZ1TDSZjGtDXAUgKkFJH
	V3Q0SR83t2NSv/1xr5olUZJbSyC1BvnlpApNGs7EiO7hGzq6iyEtfK4LCEiWDRY6aYf+FP3+Ivu
	ztbFY7zFNMDu+XZfKiv2I7et7nLlyPwtgwA0HU+t/xenpV15VlvJs+F2NeC/pVFOHgjTu7p6za1
	b74LG9CDW1++gSLlVZviqBD809Udflu5fHM1323ACMoSEd+v8ZjA==
X-Received: by 2002:a05:622a:4d43:b0:517:9206:10fd with SMTP id d75a77b69052e-5213c10a855mr222837631cf.16.1784727926171;
        Wed, 22 Jul 2026 06:45:26 -0700 (PDT)
X-Received: by 2002:a05:622a:4d43:b0:517:9206:10fd with SMTP id d75a77b69052e-5213c10a855mr222837031cf.16.1784727925598;
        Wed, 22 Jul 2026 06:45:25 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:48e:a2cc:6c4:c92a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac8c3esm111874366b.23.2026.07.22.06.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:45:24 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 15:45:17 +0200
Subject: [PATCH v6 4/7] phy: qcom: qmp-usb-legacy: Prevent unnecessary PM
 runtime suspend at boot
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-usb-phy-fix-null-v6-4-534f7e61b9a6@oss.qualcomm.com>
References: <20260722-qcom-usb-phy-fix-null-v6-0-534f7e61b9a6@oss.qualcomm.com>
In-Reply-To: <20260722-qcom-usb-phy-fix-null-v6-0-534f7e61b9a6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: QC2mBP9PIHu2y2DsxQBqnxKzYLXZY1ZN
X-Authority-Analysis: v=2.4 cv=KLhqylFo c=1 sm=1 tr=0 ts=6a60c977 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=PcYcMbZi39MCwOMHHM8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfX4eaUQp6wc5lE
 7HouvysCV/L8wd0TQfvS2zq/Te8IBlBmlICX736HXzOO17bSsA1Xvm7qrMeN9d/zZ1QhtV40Aco
 07o1/xrAMqkooy81vmkOfLWCgXyycso73mvS97Ng46owxdVGdg6LhAN6Vpr/VB5b/FDzEFAPweJ
 nQggN2xlALERHJzs299JtYG4hkmYBnfy4LepWZrEbAG2Cu4ZcSX4e9zHvti6y4w92/sI5/V2ULn
 OVUliOEMNKGQIeuvy+qqa84VNzLzxG8TtSw+6ZTwjEqY2XYfRhkGScby96DUTLk2N6jcKfFeyi7
 477IdmWvfAESXE+TX7YQi1hlCYUcOV7nXB40sTwfnhomSj1OUFg0BebjglBdhFcErOpZIaL214B
 JhOhDba2Lxl0ADCALFFqsQOp0YsAPKm4yvltg1LGVVNQcRMX99+0fl0d1rB3tILgFLn+mBsZkxl
 GbPWWC4z7u/EDMKDUcA==
X-Proofpoint-ORIG-GUID: QC2mBP9PIHu2y2DsxQBqnxKzYLXZY1ZN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfX2ddiO9fE9RBu
 CdAgWLcgJKdo/fZeS6njs3ZAT3unIYP0fLc2J+t7ZzWYKulmGNFLnpfVtB9Dgi6zRUav91u5/kF
 c2lCapngICPEUW/5Zk5ZkqBdB2EtczY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220134

Runtime PM has to be enabled before creating the PHY, since phy_create()
only enables runtime PM on the PHY device if it is already enabled on
this parent device. This opens a small window where the device can be
runtime suspended after pm_runtime_enable() and before the later
pm_runtime_forbid(), causing an unnecessary suspend/resume cycle while
the PHY is not yet registered.

Take a runtime PM usage reference with pm_runtime_get_noresume() before
enabling runtime PM and release it once the PHY has been created to
prevent the device from being runtime suspended during that window.

This also makes the probe path safe independently of pm_runtime_forbid(),
which is a good preparation for potentially dropping the forbid() call in
the future and letting runtime PM be enabled by default.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
index fc490589c8e4888770807a60170905a1c7610421..c5160cb89207950361e96edd47a0d15ba590d1bb 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
@@ -1285,10 +1285,16 @@ static int qmp_usb_legacy_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
+	/*
+	 * Enable runtime PM before creating the PHY, phy_create() only enables
+	 * it on the PHY device if already enabled on the parent. Hold a usage
+	 * reference so callbacks cannot run before qmp->phy is assigned.
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
@@ -1297,23 +1303,31 @@ static int qmp_usb_legacy_probe(struct platform_device *pdev)
 
 	ret = phy_pipe_clk_register(qmp, np);
 	if (ret)
-		goto err_node_put;
+		goto err_pm_put;
 
 	qmp->phy = devm_phy_create(dev, np, &qmp_usb_legacy_phy_ops);
 	if (IS_ERR(qmp->phy)) {
 		ret = PTR_ERR(qmp->phy);
 		dev_err(dev, "failed to create PHY: %d\n", ret);
-		goto err_node_put;
+		goto err_pm_put;
 	}
 
 	phy_set_drvdata(qmp->phy, qmp);
 
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(phy_provider)) {
+		ret = PTR_ERR(phy_provider);
+		goto err_pm_put;
+	}
+
 	of_node_put(np);
 
-	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
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

