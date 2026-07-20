Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD57C432BD9
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784559219; cv=none; b=QX9ZL82w4mstLk+m1bmEO6pWEcsoweSAy79b+rF6jYUbH+baRVAUo8UVYNRkT7oLNuQ63QzDpDlLzz4fkOSeTIzWOaohJDqE5/LXApSZYkhQLf5TZ8NQRDRGXf+lDKOjGkyBmXzkD5mbo1uelDDgvzPBhlHsm366XhqKwfWmblU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784559219; c=relaxed/simple;
	bh=0fg/0n8jqlk1rTqLof5aMrLhYmwz4Lkt27r4G+FR9W8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T80DVWVlzcupLgj/3+n3HiYOqHD3ibSpBXUdnICwsrDssOBZ7W1QQH81fkqU6qT8oMpO+tk22byfnrLYCHg2L4s7v6NAofJXHgmxZk8DhYVlD1LsbUNf5vONyW8X8IeR5qVFMFvCrbsODaxuznKYqojEXSyh3MvqAZzHTHw0ilA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GSCuJsAV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JIPVw22r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GSCuJsAV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JIPVw22r"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDqbSi2962875
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0C9IgCI2fyKGPwADUG81tMOL7Xd+RLAneLurfpmZbVM=; b=GSCuJsAVYE1K8vDn
	OVNGFExSsfoLCrFtgzJFwhMMtO6HkPpbSJu1PoiI+pDpyAyFCakj+X4esPeSB0uZ
	L/UKIB4GrJiwZrFmSpv6+WPxp2AwGE6vvKHI+7xowzNP7nSnZPP+Dq6sgvDHiSOz
	gOFaaNKFRw/KBqO/xwEC6C/05pggELsSB6IXh4WUT03NnS9CyIOuww6729SXe3HL
	GL3y6e8ynO3JKpa+ca0FTAG7+tRp1P5UB4gFMUc0A6X3b/3GFdrP+FIq4lvXVqcM
	YguHeeLu1GMhfP57sRDzGudRrf+CDYJISz3xSRzaQZ4Wwl130LGL4oiZOQeqbNlM
	Q54hkA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfdchwc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:53:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c110a3b6aso110509331cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 07:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784559216; x=1785164016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0C9IgCI2fyKGPwADUG81tMOL7Xd+RLAneLurfpmZbVM=;
        b=JIPVw22r8JSuq43WIrveNv+PHhQi2MQ3HPSrEgGhX7tLhjCQrSjszKCW1Sgo0sJoB/
         4Z+akTMRHSYyt0QnKYoHTBprAVgBMDSkEpN6xT0nzGEaStf1fllv013lnLxhXkHEsO9L
         4fjrzxpGLxTQZMCQmhfSYUkphMJx0GKFjnSaO6+dOKjEJLbapjlWI8IsfeRn1CAHpvzM
         O4JcYlEGzx9eqqLsB9TdRC2ULp8Wl7+Eh5QHuG29KXNIYQQk4xR413kDNcqeiZSKBdr2
         buU7M5Sh8ScXxxcQ6wBZBhpA0IL6pKIasBa+36LEhGi8kP3iGZYePfbw7TRfUzP/FrL5
         bhpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784559216; x=1785164016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0C9IgCI2fyKGPwADUG81tMOL7Xd+RLAneLurfpmZbVM=;
        b=HlQSmTultteGCNx55Nf8FAqSNa61AViHiqjA3oAeHQOsigWPVEaReye1XMcTwWr63u
         0DhZwonOhXasBD95bHfDpnLrQ64X9rnGUdwvQ0NgwOzg3Lz3VhZWQj8no/+xrVgBgZrH
         Iq2+WYfqKZm8H5VbODUOYTMk76ycnsu9OKAeY+bDEoPjxVhbCYAFFUTVGs5V/57Qxju5
         YSZCydhk2cy7sFiwclonEGB5CfyrI6jyF2jNkgNE2EIPjINFP5cqPDEr6VAxdSU05cg4
         7hPsBr9uE/P7vUKSiGnuuxzEXa73uYWpJsoUx0jhY0dV4KIgQVDBYFZgJonyEoITnI7g
         WysQ==
X-Gm-Message-State: AOJu0Ywup0ioOmSblSIc+earfkGJA9/zro3JYbRPnc2r3Id8wNYmmtlz
	Z6jongunk9NOyYUdQtxRBKYCc2hndrR8qbvjVxr223ScU1uDhnnCr/QRSPBrdivRcFNrzd5ODy4
	yh48xrIkMOnRpg2XL7c0FazfbYyxS3Giyeu3X1zNgs9rrbsWF4iKsWz36nlcwjO/aNjzr
X-Gm-Gg: AfdE7cmobYQsx5U1i9jykfTVm8AO8xQgZXu2SxmUjcXEyIuW0b4xUnXaAlEhuy3L4Ch
	CiEABcm6FiF1hoTZ9WNgvjekppPArv6EBKZtGHSWpDgU1rWVbJ1iNuwF2MwyYU8WbPrgjxjIKTY
	HIqIxv4zM37CX/RBjYTRDEDlkQlNqRpAOBPW/FnjjQxYMhJqL/Ha1bh+lbOT7pA6BORNZQrz0Yj
	BjF5M/CB/DHFfoSbrV0uesHkC4X9oiC39fNmjZ1YuIjy/74olY216tV+RnLC9U02ZIl1xPwjhm4
	irRom7gQe7F9dnH1iXW/IbAMQeLVXyiDcMEp841CW81247Gt3csWLMVyraKttG8q6QFPovYuVw9
	TgFnLveJyDKRl/PLL6362Xl7eVbVcOCn4gTqfIhnqp4c7pW9pWgTi6GOzWa+ve3P6GJPWhwvRBl
	sGJi2jqdMChcy4RNtGwQOZBJSOWhqHhSs5Q9VV3hOObFU0Sxao0eU=
X-Received: by 2002:a05:622a:4110:b0:51a:8b64:69e0 with SMTP id d75a77b69052e-5213d2b7109mr134941971cf.11.1784559215708;
        Mon, 20 Jul 2026 07:53:35 -0700 (PDT)
X-Received: by 2002:a05:622a:4110:b0:51a:8b64:69e0 with SMTP id d75a77b69052e-5213d2b7109mr134941511cf.11.1784559215166;
        Mon, 20 Jul 2026 07:53:35 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e7000c3e2sm4800215a12.30.2026.07.20.07.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:53:33 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:53:30 +0200
Subject: [PATCH v4 1/4] phy: qcom: qmp-combo: Prevent unnecessary PM
 runtime suspend at boot
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-qcom-usb-phy-fix-null-v4-1-4d2a0f06d53a@oss.qualcomm.com>
References: <20260720-qcom-usb-phy-fix-null-v4-0-4d2a0f06d53a@oss.qualcomm.com>
In-Reply-To: <20260720-qcom-usb-phy-fix-null-v4-0-4d2a0f06d53a@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: _5ae-OI-c9_JgnW7GcR-5tOu-48zjakD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE2NSBTYWx0ZWRfXxPHGN7RALocR
 I1Z4WYbRwCKen/xBFTyQDF+ePgwh9r7wOOl4hBeUafLnPCHrJe+YzTQssMfMSQSDfte8l4lZBh/
 /qg1E1rJfTKdoo/zRLXEJSoG9k8T3N3p0tRymyoBL2fuYbp9JUXu9V3aYP4YA4Xh4+/FfPjStIG
 nIr7891uBfU2qb+9opfWUjR7dKrcti9lTc0FRvbHVLJ7nYR4CwX7l5G27IfFeLwnnQUNav+yd+h
 R091ZB5UgVdkvIoVyis4lF9U8yv3t1brPpfyiNyL6M9E6BcNVbeBEZzBdlmr8ynBSOulK8gCrhn
 pnk54Gy7n2NI7KNdTkAHCaFvDCVB+MAVoYCD12Kn3OP7B8oO7Le9sdC07vxCcKyB58unRqDbjq/
 doABLSxK2cdxoPc7l5A6/oNLHcNW9da1AMuvUdMb4OsS4M3B8LcktduOIX3h6Z7oND1o87a5AfT
 2NENUYiqHPWgODErVuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE2NSBTYWx0ZWRfXzm+JmfuhGNcT
 y21mKDSOUl+dNXCR/kd+Bbd6gu5k5OxP+Z2d9Ujq9eOlj1WAf0ZQcs74zNbkwrFJD7MR2b8BRkp
 iiJ1nezc/7boKW7Mc8O8mWJ1myaD3v8=
X-Proofpoint-GUID: _5ae-OI-c9_JgnW7GcR-5tOu-48zjakD
X-Authority-Analysis: v=2.4 cv=bv58wkai c=1 sm=1 tr=0 ts=6a5e3670 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=PcYcMbZi39MCwOMHHM8A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200165

Runtime PM has to be enabled before creating the PHYs, since phy_create()
only enables runtime PM on the PHY devices if it is already enabled on
this parent device. This opens a small window where the device can be
runtime suspended after pm_runtime_enable() and before the later
pm_runtime_forbid(), causing an unnecessary suspend/resume cycle while
the PHYs are not yet registered.

Take a runtime PM usage reference with pm_runtime_get_noresume() before
enabling runtime PM and release it once the PHYs have been created to
prevent the device from being runtime suspended during that window.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index cdcfad2e86b1d37650c4d7b0433319837ee9c9d4..affc8e040bb968a5b9d0b6f6fc2694c471368729 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -4934,10 +4934,16 @@ static int qmp_combo_probe(struct platform_device *pdev)
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
@@ -4946,14 +4952,13 @@ static int qmp_combo_probe(struct platform_device *pdev)
 
 	ret = qmp_combo_register_clocks(qmp, usb_np, dp_np);
 	if (ret)
-		goto err_node_put;
-
+		goto err_pm_put;
 
 	qmp->usb_phy = devm_phy_create(dev, usb_np, &qmp_combo_usb_phy_ops);
 	if (IS_ERR(qmp->usb_phy)) {
 		ret = PTR_ERR(qmp->usb_phy);
 		dev_err(dev, "failed to create USB PHY: %d\n", ret);
-		goto err_node_put;
+		goto err_pm_put;
 	}
 
 	phy_set_drvdata(qmp->usb_phy, qmp);
@@ -4962,11 +4967,13 @@ static int qmp_combo_probe(struct platform_device *pdev)
 	if (IS_ERR(qmp->dp_phy)) {
 		ret = PTR_ERR(qmp->dp_phy);
 		dev_err(dev, "failed to create DP PHY: %d\n", ret);
-		goto err_node_put;
+		goto err_pm_put;
 	}
 
 	phy_set_drvdata(qmp->dp_phy, qmp);
 
+	pm_runtime_put(dev);
+
 	if (usb_np == dev->of_node)
 		phy_provider = devm_of_phy_provider_register(dev, qmp_combo_phy_xlate);
 	else
@@ -4977,6 +4984,8 @@ static int qmp_combo_probe(struct platform_device *pdev)
 
 	return PTR_ERR_OR_ZERO(phy_provider);
 
+err_pm_put:
+	pm_runtime_put_noidle(dev);
 err_node_put:
 	of_node_put(usb_np);
 	of_node_put(dp_np);

-- 
2.34.1

