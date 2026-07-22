Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC1F35E1D9
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727935; cv=none; b=FlIXAAhP+OSzcuZeCasFJMH3AElCHy5lLsaHIVQ5B00PcVUgRSzums22GqCgIzVym/ozidI+TIKOK8TzDkLmYR1td5of0OYu3em0au/iXZLEu+E04hkyLhlmJ5x3TQxaGoNblfO9AMsN+ZgkEUZFxdBQw9LqtL1Qf/TKBOYzKWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727935; c=relaxed/simple;
	bh=auASHDRv0pcx5O/KPtg+3uP0S+HjwSkPmOudIwJImvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QcpEewZbcER8QsDIcGBKUFypAIx4kFi/OUgTKph1qpqKaVoG+PmW2IoCLvFK1f71x7qLF5qvSVVgmTmd9+8Q6Fd6kbjd6SUu7NFm7ncO8G9D1hBkaTor+0LjvNo7D817dsx/WyT9GOgf1JRL4QzNCVaVGCDZ/ZL96xFgLZyVpJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZF7AS5I9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CNQI+KNi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZF7AS5I9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CNQI+KNi"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWOKw2029964
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BYEpALra3wQvxDTz/+9CDY4cEEc59ITruLKAOEg7+3E=; b=ZF7AS5I9BrH4Z8U5
	8VCfSpgav/8iZDnQ6PJmG+PcnjGyYu4tZuGnQDZTyWKW+rFoG1WFyjcAmVMYaU6R
	dgY0LzUX+Qp2EnzlxLCyrzOWV5KDtaQcqdzmBciRVB6vK03feG+AxLlBG3+Dr+Yw
	nEK6E/ugQCt0swgP5J55plFd5MKoV7zgryybbTVJfF4IAuXM7ENtdcb0+upl3pGi
	7Yp4TO8GIMIfBu4Q+tJkpLWfX0XWN45XOv5K55FZIirkSVlMmKb15aoW2Jmw+oMk
	SObfAYJmjd7McgN9xjMz+bghHf7vFra5C2VvLpb6jwJkR/JIIgMAQ76C6J1jvBN6
	3+6IsA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjr839ube-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:45:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d30035dso159764611cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727931; x=1785332731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BYEpALra3wQvxDTz/+9CDY4cEEc59ITruLKAOEg7+3E=;
        b=CNQI+KNipvphlBDiLEJl2MDPMhHT07hznf/3yAcIBQssvbIdrPWhknhTdsahk7n71P
         gFEH/P5EaV5QQLw9EYu5XEcIs4jEkOoq5n1TmEVhCoSRlSqTXIUN0mOpGBGGjn9CEhz5
         78vDEqQS+IOT8mIGZ+AJyUG1lvm3WhvuI0Jhhl+QzXXOvNjTHgsilFgBOaWDbHZx/Q58
         eg7nkiirWmqJfha36a16dexhRUDK9N6QTJ/uHA6f13PH/1V0z37RHvB3m4NTLJgQBzCY
         U/SRzwJlnr1kl/xG0/9fJlMLg7GkP749vjaU8cUWcW7/Ku5xM4K7UApwbUTYiQO4AiqN
         g87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727931; x=1785332731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BYEpALra3wQvxDTz/+9CDY4cEEc59ITruLKAOEg7+3E=;
        b=QdjITz99idMPdB5xMlhokfBMGFECh+/MTG5hV3rPsAEfZRctWjpZYw4KboKqLk83bH
         z3nRilGGU1V1sOlGSPZmM8cBJIFTbRoXO8NlDV6ITY8n5QQtJssIy2LBjLIBtl8jOrFU
         a1Q0MCxF+/vNsVMbRUn/e3jqOYB+V3PEMaF70+Umo3aOSpDo8UPY2sSsekCGZPJQWe7L
         ckBP2ZyrLJkR/x1TESbBnHSrouASoe66lm6y4x0KUgf/876M5DiTman3wdsQnc16e6An
         fcBwfE0EMtgrJRl1rTzl0xIennixKtlTcd6kEIOqwj0Qfh+cpY8UHpvrAgT9d2V48BLz
         ScSA==
X-Gm-Message-State: AOJu0YweoLxxibNfBhHCb6GgdWDpj1F/ZiZiqvoJU6ymQL5fM7XsadIx
	tw4qEDlFZ2psChS88SYS5AS4WfzN6WwKV68MJG5g83qIefaicqRlqxOvyZZvLD2dvBQnGgG1RAl
	tx95XDtZq1sgT9cy7wcApTdc7Ol1n1n6MbqO6T6F+2EPqcRDHnOwZT29qjAUfi8MZlVXq
X-Gm-Gg: AR+sD11ww8fmxn4/dyNgGhGGYGFVNbtTwmeUCOkWRGdvVfoZaXbYP0NXUerm5wEO3r0
	HGf6PGc1dqpwl+68FIy1YndZ/RhbPWoS0snP0kIhfzqKpQ+ffdZybrKex+2hm38LtGDopTuUZJx
	6nc5qbzztznGJbeBMaQVq3syZrMUVNKOMAxw97Pjfz24fC9bgBIzVGDqI+K8VRsSRa3PPiONS62
	+trmECfK+oUgb1OHVn7NMRir8ftWoh6ojrmEq4lDM5bw0cpZK8sMh8oYNrJjoTXSyIT/e2eVt63
	2BTwQVwggfoNfXFsc/PlrjLXVEQ9Rk7Zmjv+eVyl58gaN5YFEYdRY9Q0DDx4bTRPgR2GmlJe9FB
	0y+gwmDYnDxdKTVAVQY5UqGOkEUY3MWVEk/ELNuO7SYEcYK9k/jjV5M3THR7SKC2ytDMBqNaM+Y
	T1rv5mwvQlogMzZlgssMkjx29BUrxUX/VLuMEhFrmZcq3B5QUCfA==
X-Received: by 2002:a05:622a:302:b0:51c:7b12:600b with SMTP id d75a77b69052e-5213e889af0mr216086391cf.87.1784727931373;
        Wed, 22 Jul 2026 06:45:31 -0700 (PDT)
X-Received: by 2002:a05:622a:302:b0:51c:7b12:600b with SMTP id d75a77b69052e-5213e889af0mr216085861cf.87.1784727930749;
        Wed, 22 Jul 2026 06:45:30 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:48e:a2cc:6c4:c92a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac8c3esm111874366b.23.2026.07.22.06.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:45:29 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 15:45:20 +0200
Subject: [PATCH v6 7/7] phy: qcom: qmp-usb: Prevent unnecessary PM runtime
 suspend at boot
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-usb-phy-fix-null-v6-7-534f7e61b9a6@oss.qualcomm.com>
References: <20260722-qcom-usb-phy-fix-null-v6-0-534f7e61b9a6@oss.qualcomm.com>
In-Reply-To: <20260722-qcom-usb-phy-fix-null-v6-0-534f7e61b9a6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: nU7CO0b0wxT3P3WPBkLAMi_xnlSIC52n
X-Authority-Analysis: v=2.4 cv=VfrH+lp9 c=1 sm=1 tr=0 ts=6a60c97c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=PcYcMbZi39MCwOMHHM8A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: nU7CO0b0wxT3P3WPBkLAMi_xnlSIC52n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfX7pmdtt1pg6NF
 DIbBtUljLotPDXl1u5cXAfZjHJklD7Iq5ys9FjKW2snu24UZwCIQzHa3/1whz7V3cP/X3UAdtS2
 ExflF2ME0OoSC/6KbCi5OzoRSma97219CGToaD+zxsMsVDXzv5X+/jBzmDNqx+cpOqr+O8JbXm0
 GSqvDbtXfDSwoIGFPGpOrxkRJHLtMGv010Xhv7LDeitEJ3Tx/CjOqXki7UuakWU32/kUr5zs9uL
 Ff9cJOfAP1+NKRC98B5ku8Jbxloe9auKF7SmvRx3yN2TQQNbOyIVxVEvwLAlHFIhiNHBymPBv4R
 TUuxrQbfgXwsl3kC6F3o3A9HAivD90STlRsyYXNSfhbdbvw/PE9EqQho++VREXtdT+ZjvJb3GdY
 xTwG2zv4uLCZj/uNoANwi8Nwk6hs0wA0BsvwVdJVk+X1FovHhGX/Q2QX5BiZjZIoqQBe7SCMddS
 NteYNvMyLO3PDCk5FCg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfX/+C6VfOogjWE
 jZvFtEG9F3uTeTrjlWL3MyRsUw67tbNDj+2hoUAGc+hR1h+TVrc3H+LAnQGFGlFqd8omiXKEgLk
 p+URmosxJYUqPCO696lUjHhxB/g2AJQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
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

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index bb905c437a01e3b898b7259abe3e49df4756fc5b..b0790bcf0bc86459d0658ea1290888273c4ff391 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -2419,10 +2419,16 @@ static int qmp_usb_probe(struct platform_device *pdev)
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
@@ -2431,23 +2437,31 @@ static int qmp_usb_probe(struct platform_device *pdev)
 
 	ret = phy_pipe_clk_register(qmp, np);
 	if (ret)
-		goto err_node_put;
+		goto err_pm_put;
 
 	qmp->phy = devm_phy_create(dev, np, &qmp_usb_phy_ops);
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

