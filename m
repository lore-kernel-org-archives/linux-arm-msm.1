Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9815E313535
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727923; cv=none; b=aLoSbPg2M3mykOJVmVKujMHohRS0q/Wo0zr6k477Jt0af7fvd+ps1A4cpIUWfRLPv6n2CtgNvMdHArU6w/x2G00onoY/m/sPZGC3uVr4uzLqs4vxbLpx/0IFUBARiXSnsZ5/QtfTeGQecVNF09r+AOA3D2Us7yu4qLmH7OciaZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727923; c=relaxed/simple;
	bh=k6RUnVNYNWs6mwTgw+eJNWAUZH7oNXFOTmAPE5bsAGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kccBbiMbLhN/GCYsUmULa6StDexxhJMQNN+vIOCz0xCKqTDqO8qnHQ9i3QEJLMsr2enu0Rujyg8TuuYrh8CQWveraMig6WrU6BSb8Gk33lKOVyZx6j4Ln/tv+sStcUz4SwtsG6xuhHeI70kxCtHk1UO0HGLPrdsWxengG9/nDGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jEFVTckZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gO7SxMyU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jEFVTckZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gO7SxMyU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWsAT2030955
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hEC1L4E8qLd13ENLIAvmHH+W0DF9KXCKqgeEjB0jFPM=; b=jEFVTckZ9EEQg8V/
	a087+S+2n2EAwk7Q3uyGXrTxWnUqDS0FI3YHIOnbL8TYHOE98IijsZ6MGIHu6jjR
	FjfpznB5tOH2GaDP1K/o80l2Bq1vCswaatVjkHz+pfVQ7tUhwY81P5EqnHFCB9M7
	7t+QgZ2sO1EtMuBpTLspuywszkekHTsq45fRpOl0TRWIUjN4aQRibhUXLBzEpn2q
	hbBcvyZYKuZJ8PrWbct5wi7gFcyFXHasICrU/TyTTMsZ8+NrhbU7KEc0+4bphNmo
	Qu8n4DhuGvfjj+2xLOhBLDAxWZ1wbwjYaixMLVkrgAo2lawdD/cAnBTOfsNuVn4Y
	ii5oow==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjr839uak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:45:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-526da7e3c9dso30762681cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727920; x=1785332720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hEC1L4E8qLd13ENLIAvmHH+W0DF9KXCKqgeEjB0jFPM=;
        b=gO7SxMyUhezPcb1xMRAnTDtt1ld6pGuq5CQZ4c97gL1nXGRxrEQlDJkLH2F2Gaecep
         ORUHc/jnuvFBmLsQf1hEjMv8k4XkOQ5drc+wm2tGm6arD6IbmIdXZ9A1reoXu04cIkuq
         QxCs7hdRWPxVLeEIKOJ/qGFR/VmYGkqVhwrdTstDMbZrCjv3u1JSl+ZzoIrGtW+04ieI
         mdtBxet/PY/FZ+fwE5FWhP3tanhUcsLIdQpKOVkAiw4+H2wbojM54C9NDswPb8dVNQ2O
         8ce6+tGnGdJ1LWSygEWAWlOF8TKVNx+b2kauMW2x5CNhymQHcaHn70YVdzCcEFeQh/mB
         OtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727920; x=1785332720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hEC1L4E8qLd13ENLIAvmHH+W0DF9KXCKqgeEjB0jFPM=;
        b=NfTuXCeLEfGN8GS67LOeZTw2kFau1k4w8Wmfb0A7opLHRNUPHkKwT1nlftR2jrXCtC
         SKcEfCzwjKpav4mL3Hs39dwkzM9s3KIekayQA8JhaToJUuhtpVMhoHqa289DB18Y7ffw
         AicYeIU6O0fcbvWd7n4oZlggQ2JIjU/NjHukMJg1x76oCzU9BrfpoY28TYtEUqX9kn8B
         xU15T/YcCuJAzqh3zwWWH91bfHfk9v/oJ5+9w8HGIPpL+tELve40AsGthL/ewlfNzyE+
         Exz6MwPdR2vVRDAcL3DflYdCw4sw/F36phuTl9xJDsx1i6KtsbQpnpXkAmsHsTzhPOb4
         s8Zw==
X-Gm-Message-State: AOJu0Yx2qRtutWkkplXq7r3COXcnqeILbtn2o4oPjb2Rt3W8bPaboaww
	yOgRov/4pBoSRyNFtM6fQ+/tGHcPde4gQcmDvVHOoPNC8cIpfjNXEk8bRETecjdl7hgET6UG/yv
	cdUqZ5j816yH6cf4SzasZiADUXtYzlrxa1Fa0wPVl6VMI8LB/pxL7pCggVEIBE6B5Z2PD
X-Gm-Gg: AR+sD11eZw/lo15vN3O/Lg/LEQLwMDbX0T2iYAIbrVUnXrlGKlgN8YDFoqeFG7Pv0Ja
	G95qofX4Kc1OGkhSaJQ2D+aziQO6yS/ALaJRYMxTw63svPYgHvIPlrlvIiDJXcfQtGWS9WtOvth
	aBQD99OjAj9oJtPbuRPKk1npb2jSRmNJBovJO7alOEF58ChZv8fHIdFCLOe+0XvDd1UGEdfYwiC
	J36dmsQ+IoWJO7mh8L3gufGCQBAMI1YG0xlb3TAgOo1zz+0gH+ijQCBSXYKZ8Xh9T1DIdbM12Ue
	kFK0TByCRB1FF8KAUV5ANBxzZTv9X8j/b0y0C09IL/HFf3fRWFlAFw/BzQYLXrAcLZnkLlPo/Ax
	ukRIYICThMvokIcwOAA0B/b/7s+UxAqS1PqjflFSuAPiGkJUqDX92N52RfioRi1Pw7cZTJ7kK7S
	6o1QjQEVJVpe32RhI0csY299ybwDz3BWx3O8+qkU/UFh3lGWNFng==
X-Received: by 2002:a05:622a:598f:b0:51c:b900:5136 with SMTP id d75a77b69052e-521385d898fmr216651181cf.0.1784727919669;
        Wed, 22 Jul 2026 06:45:19 -0700 (PDT)
X-Received: by 2002:a05:622a:598f:b0:51c:b900:5136 with SMTP id d75a77b69052e-521385d898fmr216650591cf.0.1784727919076;
        Wed, 22 Jul 2026 06:45:19 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:48e:a2cc:6c4:c92a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac8c3esm111874366b.23.2026.07.22.06.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:45:18 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 15:45:14 +0200
Subject: [PATCH v6 1/7] phy: qcom: qmp-combo: Prevent unnecessary PM
 runtime suspend at boot
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-usb-phy-fix-null-v6-1-534f7e61b9a6@oss.qualcomm.com>
References: <20260722-qcom-usb-phy-fix-null-v6-0-534f7e61b9a6@oss.qualcomm.com>
In-Reply-To: <20260722-qcom-usb-phy-fix-null-v6-0-534f7e61b9a6@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: bQ0AIwEx13q4tD3b0I4lY9i72chZBZX6
X-Authority-Analysis: v=2.4 cv=VfrH+lp9 c=1 sm=1 tr=0 ts=6a60c970 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=yoX6jHX73kXkGH752t0A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: bQ0AIwEx13q4tD3b0I4lY9i72chZBZX6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfX9LGlP3bkkLI+
 sgvqG2vBC24E6QOC6wH0PQV33Lxhyv1G6iqP2M5w6zlZIKH0C6B+VoCIzsV/qX/xUsYIMX86pfc
 sw0aHvMaFpcn1Oxon021q7/s8JVs1eXF6m2q3rSwB/Zql/p7Tsyve/dGnFK2IJf+qOYmXXNVu48
 QGW+dQTDwEZ5LYpkGH9eWNOVgcLitaA8+feBwmrJVmzzaCRaD4OKTfSDkjnnule8mwfCUF+VKQv
 mMaBhvrU/ljC0irCXClrrUtoAqWOG52ogcT4WYmyZ+4ktL+jn2oW8q+LCmi6ltnRr0Ww3IlzYCV
 6vmJtzpKsnY+JlGYVz88Ksak5eMx184RI6qmwXM+fVWVWBR/zhh0wkw6/KLRQix9wN+GArxlt3a
 /HJ26y3koEzaSJvySzqUcPXl+9Yws6nZZIS8eJSjbwjmG2IIlmjOKo+Qu0/o9LeCeulGdBYmXq3
 r/xqEevTSIXByVPVGmg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfXyF5jAB9j7d+Q
 16sFMTIdMHZ0RSeUQaz6fHxveBlfTeBtvnrFcusm5FUwePSptdoGdZpjoz5WBer84JGKLIciZT6
 psOem9MmVM3hpR/p/O/C562zooMSDow=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index cdcfad2e86b1d37650c4d7b0433319837ee9c9d4..2cbe1d90662eebd5baf426dd9620cb5cc5d9256f 100644
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
@@ -4962,7 +4967,7 @@ static int qmp_combo_probe(struct platform_device *pdev)
 	if (IS_ERR(qmp->dp_phy)) {
 		ret = PTR_ERR(qmp->dp_phy);
 		dev_err(dev, "failed to create DP PHY: %d\n", ret);
-		goto err_node_put;
+		goto err_pm_put;
 	}
 
 	phy_set_drvdata(qmp->dp_phy, qmp);
@@ -4972,11 +4977,20 @@ static int qmp_combo_probe(struct platform_device *pdev)
 	else
 		phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 
+	if (IS_ERR(phy_provider)) {
+		ret = PTR_ERR(phy_provider);
+		goto err_pm_put;
+	}
+
 	of_node_put(usb_np);
 	of_node_put(dp_np);
 
-	return PTR_ERR_OR_ZERO(phy_provider);
+	pm_runtime_put(dev);
+
+	return 0;
 
+err_pm_put:
+	pm_runtime_put_noidle(dev);
 err_node_put:
 	of_node_put(usb_np);
 	of_node_put(dp_np);

-- 
2.34.1

