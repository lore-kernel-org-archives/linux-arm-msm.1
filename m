Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649A5432E73
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784559225; cv=none; b=DV1TXYATxsDCfPNy00CUOYI3X1oaXYHWPt5Hs1zZkI3HU8vOLd0KGmJJmna7JSNgSTnGiNMVUuJydxXCQMRgQ6k6jVanhY5qO9ZZnEGdWKAwB/uBHNHNisBIix44yftf5oHYfQIWhCNw4PqNJvW8DVrzYZu9hkhjHei++LI5KhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784559225; c=relaxed/simple;
	bh=kEFKGUoElhkuV1SIhUE3nbBGRr9taBnPmKBOso2I/E8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bvi3UGJdkpwQsM2QqjSDO5AjUShbPuaoPtJ+b5yUHmSvQFqBiKsNrbguorJxUHGxE1eMe5rclcfi44zv3kSi3PIFB7CpvXxa5qOmnsys9LFR4Ik7UNjh0/Q6RaFZrrYe+qHLdRF8wC3Gy75OvspbgNy5fA2toGRR1D5dTNUbcMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hkqBA2iw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+aOFIIT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hkqBA2iw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X+aOFIIT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDr3vu2840391
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L0DjVqpTkuQJo94lpey+cOup2FTxJcwHBbDODt+Htk0=; b=hkqBA2iwVJV91ZFM
	ht0X7DIXqERCapwkg40bDZ+vs0XyK7uXEWnCfvImyCehkDi/m9fyAIJXTvEqav07
	dcOLD9vvVL7VqcqNpwrlKY1ifyynSvWyh1D5ofYrdhKvY2wp/fz7x4rfpFpluDPJ
	E5hZ8Dku2bhA2PtkqdyDBuSiT2zBjDbPS7B4AFp2YOzI+9FMbRzDQ18GPlQvZf/m
	kh+NjjBRtL6wNJarWhDo4mDuVJNhlnQzqJfn/BAHLSWgtTtEvtUqF1ALccxiDD0A
	81UevLP1r2mAeIBMmpzjTk7M0j5eF8Rv0G2KeNDa+pn6n3kITbKAn5w8na9kokpO
	mY2x2g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfvxhsn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:53:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a236220so189571231cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 07:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784559220; x=1785164020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L0DjVqpTkuQJo94lpey+cOup2FTxJcwHBbDODt+Htk0=;
        b=X+aOFIITqEyUVdenOtrjztmj3w2oDC91jy9kPDQSa59AIehB9K2bCNSNRMneVLhB5X
         fGATBKevBclU07vAxcrvu+7qvMce5D2EncDAhB1UdL0ugeAPDBEilG3y48JJLYAv5DBM
         Oxt5ETJ5ZXUKR9Tpxnryx0fBJehfn4UoduTHcodqDwS6nJLRDz6dBjRJDslePeL1P0Gm
         FTObM8ZxKIcoW39m7jWR/CapuRNfTOq6hsQeDhRuseX5ZxlTkHQx1SKy8q8HXCiFFm+r
         zWAFeii4BhFAimHAaZaNzEgSK0hAnTcglkOrzfXr6XN3NwanTMeDla/1elkAIlRxD2ay
         RO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784559220; x=1785164020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L0DjVqpTkuQJo94lpey+cOup2FTxJcwHBbDODt+Htk0=;
        b=IroXYQxcD2OwFnVCNgIo7F1vPgu1CF90T0LHoictVCCFiJbXUt/lnXeBbSI7CpDypp
         jnXMG1c5B3ajK9FlSJxy1R+6QDsuR9Dd+32QjMKFWKtuvNn48RnPGo2FkhjNTAvOS3TH
         FxrHEEXzjs6sINxMTw96YZ3ZqkpRtDjtKA4Oyy7sTNhRfWIVz6VtkH5trLOVS3N4Eldd
         X1zj4Qd0NIdrxYLepLlRW52sRmS9ziT5ZmZz8K7Gl4jVJ42NFQeq9L2hDZ0SgsouNYfh
         NF14LYgp16yv36rvFrSnjTa5QxrdWdubQJu9ncfeHIM2W0fyv08TRnwZi6WFiURlRHpV
         Ka5Q==
X-Gm-Message-State: AOJu0YxurMx1azjLjY82mw6Y6DNVbrDC1TXRdbLPrC1fzF5SvwiFO8Bs
	5KX5qPDXGuILQMMX6RdOI4G5ey6nz9LPr1cS3flLldNKjduBgS7R/JgmqQJLQxliBy55u+2i6to
	kSrLeh8LHApzaldK3T2bPIW3jPugMfW67V07DeexbSp4ZYlw+ux0NImcJSGVBnIIsuyAc
X-Gm-Gg: AfdE7clcmHcL9hI/tGG2X3lrI7pZNelMjV/VWS1Yn/pRIutw0mRnfZ1e8ZlKhvGQ6h4
	WX2udkjat9BzyaFAIRFIMKnbvvphJGLS+ts4UQFzesyWgwskeb1StAnX7iqkhKTBIRCE5k4zIFX
	JQm0vrFjUMU06kp0DsVVEBMP3rmB7TpY9Xepd8hKhBtI8Isai1s8wklGZMW0jmToTO9Q2S4jM7g
	w7mhg891VzVQjOXRcwP5dYnaxH1vYvyJ6fj59yfp2lWnxa9OwKyX/GrQ1f2AWsqJFyEcDC7fHo+
	KVaD/b99eQMUbWKFz+ffQ4XLSX5vahVW1Bes+tQdXZF/rZaJp1aGFPG29UlG0851TpKdL5a8MZ3
	i5oUuwGiF7pyGmLIMmqdjHVxVQGSFbVTO9wLWruFDh6VFlfwyOC5B5LoaYXc7N0qlyCDdTafSDx
	F5wdtuwGHGqa2U/O/aorJ9wVb3Pa3qCSs3YwXgPkxSn8Cq4iCoXIs=
X-Received: by 2002:a05:622a:1f91:b0:516:e152:7a59 with SMTP id d75a77b69052e-5213e08256bmr137157331cf.42.1784559220282;
        Mon, 20 Jul 2026 07:53:40 -0700 (PDT)
X-Received: by 2002:a05:622a:1f91:b0:516:e152:7a59 with SMTP id d75a77b69052e-5213e08256bmr137156911cf.42.1784559219566;
        Mon, 20 Jul 2026 07:53:39 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e7000c3e2sm4800215a12.30.2026.07.20.07.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:53:37 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:53:32 +0200
Subject: [PATCH v4 3/4] phy: qcom: qmp-usb-legacy: Fix possible NULL-deref
 on early runtime suspend
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-qcom-usb-phy-fix-null-v4-3-4d2a0f06d53a@oss.qualcomm.com>
References: <20260720-qcom-usb-phy-fix-null-v4-0-4d2a0f06d53a@oss.qualcomm.com>
In-Reply-To: <20260720-qcom-usb-phy-fix-null-v4-0-4d2a0f06d53a@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=HKLz0Itv c=1 sm=1 tr=0 ts=6a5e3675 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=PcYcMbZi39MCwOMHHM8A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE2NSBTYWx0ZWRfXxeqE/5YA4X+O
 qPFNCpDRCAMIzCQYB+wHbIn/d6S6cfS7uEd2kXd6ogN/sUyb0vE39xM8C8vOOJpOi+Uq0h38wIo
 s89kuxjmfTtOeUdc6f58OlUKWGwmAFA=
X-Proofpoint-GUID: dUKXkz5dkK46LO5WaQynX08tFR1IAeJ6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE2NSBTYWx0ZWRfXyuFCLheBIy/O
 6XRytDuz3Wm88TgHUQ2RWGjg1iRrjMAjVvbVhF/SO+WWfELusyR35fZRXwPgeUWmFaqB0HilT6k
 3G1/doBDhkvnMQ0g/EzhjohU1W7F9R3AG1DFt3TN2jdkBpnc/29Yj75mlOeB+l1D0WLLYT8sXjk
 5QS5JeLjrZiiKZVMJ1PXOLjHq40bjOK/CJW/yg8St74szk/2bFmu3Uag21FxaVvhojSKNB+RKuq
 OFFctFYy285jI3Dx9ENqk/AqGNfB6JM5XEmSSc/XvrXQCHEPLfI7LSFEXS7YATU66TspL/HiuuI
 gfVWcE7Wb2cnfV1apTW4dOIh4gI4RqBemoaMaIN51ejSrq2FqCaeohy/AYSYsOrxkVaEBhtIM5v
 hFhyh/kyXdnlA+FncdS4JloAFEndsolDVLO8amHkFKlGPChVyMPsscx3quW9GaXhD+5QEmtu/uI
 PeQpo/4jjCz2ejs5ZMg==
X-Proofpoint-ORIG-GUID: dUKXkz5dkK46LO5WaQynX08tFR1IAeJ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200165

Runtime PM has to be enabled before creating the PHY, since phy_create()
only enables runtime PM on the PHY device if it is already enabled on
this parent device. However, the runtime suspend/resume callbacks
dereference the qmp->phy pointer, which is only assigned by
devm_phy_create(), later in probe:
        `if (!qmp->phy->init_count) {`

There is thus a small window where the callback may run after
pm_runtime_enable() but before qmp->phy is set, dereferencing a NULL
pointer. This can also happen if user re-enables runtime-pm via the
sysfs attribute before qmp phy is initialized.

Take a runtime PM usage reference with pm_runtime_get_noresume() before
enabling runtime PM and release it once qmp->phy has been created, so
that no runtime suspend can run while the phy pointer is still
uninitialized.

Fixes: e464a3180a43 ("phy: qcom-qmp-usb: split off the legacy USB+dp_com support")
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
index 8bf951b0490cfd811635df8940de1b789e21b46c..8b91eec0b5eee0c76b64e2c2b7a15f0169ce4b09 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
@@ -1277,10 +1277,16 @@ static int qmp_usb_legacy_probe(struct platform_device *pdev)
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
@@ -1289,23 +1295,27 @@ static int qmp_usb_legacy_probe(struct platform_device *pdev)
 
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
 
+	pm_runtime_put(dev);
+
 	of_node_put(np);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 
 	return PTR_ERR_OR_ZERO(phy_provider);
 
+err_pm_put:
+	pm_runtime_put_noidle(dev);
 err_node_put:
 	of_node_put(np);
 	return ret;

-- 
2.34.1

