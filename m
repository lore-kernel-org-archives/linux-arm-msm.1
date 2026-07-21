Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD0C33F597
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784639154; cv=none; b=Bhy99oX4W6kKyawPGqK3PGYZIn8lC50z3t/1MyWxfjpV9fO4X56NeHmkWvTLf4uwWCLdlRo97ZBZv4GaK30gFib8rNPvhCcdR/iaNMQTpRNuBSe7DU1OpFaMjgnTRiUSUANVYUtihkYNJVfiB3AsTi2a2qRbST2HjpyVgGl/zvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784639154; c=relaxed/simple;
	bh=0fg/0n8jqlk1rTqLof5aMrLhYmwz4Lkt27r4G+FR9W8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pr/2ACbtaWd427vFXixKt7tB9a4qUc29xxTy8Sb8V9NCJMiaOmnNFZ3V4ZNrGUnKGxsj9fER8OZE8pq+TnxFz7oEMiBpZLgkz/akLqcLR7dk6Spf95J86s5nqk9pfic8OZ1cPBGbYbZtI+pVMp0ZrWUlPGdXjtqAFKgGM2NlApQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PCmwzvjZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RsmfE7rx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PCmwzvjZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RsmfE7rx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LD5i1K1853473
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0C9IgCI2fyKGPwADUG81tMOL7Xd+RLAneLurfpmZbVM=; b=PCmwzvjZJsGmSwHV
	GJjJJjGLkb4McjKi/J5CJfZeEjpDCBucAKtPx5c0yL87LUVSXFz2wggQNV6c6pw5
	xYVrWJPengSkHx0T29xVbWbyXDvMNB/kypXUrb1AFQb71ptRfXMuc5ow0DEF53MA
	bKvK9J1BOqjAuVZa96oNvQPCa9nokb1xretPhtDQxeupRqEGlbks1mcDsUApfU8f
	BC+CmXtH/1k8Hqj30RBN7QIbKU8AJMqlaVgbVNHbxfGpF210U9aSGKcaMYmpCe08
	RiDCSD1lGqnDYFfEU7uOsXHFpKAi1gZ1JjUPe7Y2TeEoaDuaGgTToIQo6ADwwQOM
	4lUXiA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bs801g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:05:52 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-744c204396cso8602842137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784639151; x=1785243951; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0C9IgCI2fyKGPwADUG81tMOL7Xd+RLAneLurfpmZbVM=;
        b=RsmfE7rxkijFljplvI8vIh0WY8fLdNKveIgMwTPOswzaxsB1Ek99jTCr6VJX8UD78D
         6fuFYCIwwHMGvAqtD0QtPZtFf0HekBrD+M3bt32l9T+0nqX3z3256YtZOZGn0eWjwHN1
         S94VVTN3t+Kc4V6qCcJDN/Rzy+UtimvRJzLMSnkTKkzY+qqJsDg+/WTFWbcNhslrjY/w
         uDHrrq2mzVEJ32IDWEr6PNONtdF5vkMtUox6CUjPXwxOzTMiB5Kee5UZS/x8UzYdauWf
         P+YxyYqprGnRnauAGG/XYsvWJdaxG9y/VKnB9jnySKNXi1fLFFqZ1Ut1juDizUR9AcaX
         +nIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784639151; x=1785243951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0C9IgCI2fyKGPwADUG81tMOL7Xd+RLAneLurfpmZbVM=;
        b=VD36Iavrywz80LCTqCFH8STg34x3MtW8FV/0Lmwhb0CkSnrsVT1sP82w4MWfnkUzs2
         +e6sX8NG7L48EnvAc0YLgU1gPFPj7IXySXd5dE1P17lWLkR0rDk/8iw7i7OVsWNqBjtO
         k/IQwGf/PmEYZlhXG5RJD3I0zbxKfSwTCEAsyYDxz7u/ftLrviHJ4tt207hD5E3tCrib
         bKwovM9K1ULN6mXZWyjyTRxMGYQVCuhWNMpMm6/hlh4SHKUzxyYzXu317PPA8c2P4O70
         Ceal1NDAE2mv06c0pyXRf6Ct+bmPmnI/Y+fIghEoQZZDfr1fxHK84Kpo4GTsmr2+DgPW
         MiDA==
X-Gm-Message-State: AOJu0Yzk3QW4We9gb8yiU1LGub+izZ6vxyc/+jX7P1hEqFv1fctiB0Z+
	kqZB1pg3eLAM9vJKZAkSvo6zulyZK7YqbaCaIrWXrDGuczkXGXh2PKzuE3wMHFkaHS9mE5eTYFZ
	hSgxTcokeb4q8XS9svcKNRKsH2bw377VdKCTFUOpQQA1TYeJf/Lj3ws2rBu9zvOrl5p4J
X-Gm-Gg: AR+sD10MfNhMY//NoUslNtjkQ+8j/Cm6Os5djvnIhOXPgNEGNMAnxLnbhGrNYzxzV57
	2CHLrHydS216puv2yU+d6sHoK3dEZzatTJsJyNpPUlyLqeEpd6KN4nOXTNrENeG7r0fGAiIiuZA
	Lbn0JS66raa9t3i8r+N0NU0iidtSqKtshz0kvwYrvgVRZ9vKcCMC+0aPINjPUC2jR0hbZ/NDc8O
	qxRcSC91YrLtD7gDrGYde4RsqaTiWYraZX9zfGeAAqUzEbv6AP3RGKxV45vB3KXFNuM2DSKORE2
	75jOrnN3G+UPTiRHl1d4sGr27umx5WkiV6oUYqZfdxFWlFCRxtxC1H3af2wj59NLmJ6EhConKSl
	ueADfcb/BxhEFdUaFugYgjnSB2wPC1yf+7Z5sJwhUqvSQAF9qWdRYHyI8XBUxdPZqjIMclmnY4l
	oM9bxnYcjdXC+eYEfsBw/XLHscoEf0y0WApGHiAZDwr0zntuqgf94=
X-Received: by 2002:a05:6102:3f13:b0:745:6b08:c338 with SMTP id ada2fe7eead31-747534ca994mr7023287137.10.1784639151146;
        Tue, 21 Jul 2026 06:05:51 -0700 (PDT)
X-Received: by 2002:a05:6102:3f13:b0:745:6b08:c338 with SMTP id ada2fe7eead31-747534ca994mr7023246137.10.1784639150566;
        Tue, 21 Jul 2026 06:05:50 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009ae04bsm591898066b.8.2026.07.21.06.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:05:49 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:05:45 +0200
Subject: [PATCH v5 1/5] phy: qcom: qmp-combo: Prevent unnecessary PM
 runtime suspend at boot
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-usb-phy-fix-null-v5-1-a181e2adbd2d@oss.qualcomm.com>
References: <20260721-qcom-usb-phy-fix-null-v5-0-a181e2adbd2d@oss.qualcomm.com>
In-Reply-To: <20260721-qcom-usb-phy-fix-null-v5-0-a181e2adbd2d@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: t0F5ENKIcDrq35cJtf7SXk3atFEZzQEb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEzOCBTYWx0ZWRfX63JBAyV/KdyA
 eFk09dj9ivKUqvobBdXhewu9YgjaFK2J1JtGOSGRpslKWB0/3rnxYF4a4To/nO5crkNC2t8WjxV
 IsLmnEPtJxO+8yQaxPx/kJq/l17TLbOC3bFYo3/NH+Alf+4dQHLrvSdSKxGaHvWdw5lljApyNWP
 tO9CVOR+vg1GRI1eXSW1z6oRxoCVbjZtm228FIIx3Wl9pPwRisoTPomp9nbfICXn7lzuneCBayl
 ab7pqId/fnoLJ6C+u7Niwgzx9YiGrqIgYjqW8+NmldBxRvBRdmmGUwukeSDCoxyabAWV4epkAv6
 0/jEH7x7vrv5xjV5oG5KKmLHrR2ikYEjlzCFjsD/cWTNkps1BRMYTVZmNQqvRk67nVaUd1fIslw
 Tak/LvhYO87uf97sy6HyRbKIw+efI+Vzh7hl658eO7FAFrUh8XFgKcr6fCnumEe5tfpgo3WLhKf
 XD4poK2z/rcElAZrqOg==
X-Proofpoint-GUID: t0F5ENKIcDrq35cJtf7SXk3atFEZzQEb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEzOCBTYWx0ZWRfX6rPteNiUmKNZ
 VO1reXZMZZZSxI8gbzNZmTREOuhf5TfEA/Fdu3lQ2EDnbXM+lE5ZSEzMmxrZXT7fv3M5BZLGw5z
 7iodIls3/6455TXSAexJNs72Jm6RA+s=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a5f6eb0 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=PcYcMbZi39MCwOMHHM8A:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210138

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

