Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26C53438BD
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784639163; cv=none; b=RaYPJ0mz2dEVU6g5iOkW8pMqvNIiYo5xU1we3cddAy0frT6XE2Iih737AP8pLJ1j0bNBdFPBHyA7+cL4RkLRUzkBxBreal6f/4GJV3BRw2cwFqlyOjQWgO3iwzKp+uKF0ItTyCoCvuok9ydGMp0dX2Yq8aOymSP7LZtOyF8LhOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784639163; c=relaxed/simple;
	bh=hB43yDM5wPsZ0p8kCzuf9vWRzlFYjXS4Z9sUYHruMMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T0n23PZN1DCOdPeyl3QIJhXsgZJnYa6zPJgXivxQhnWO0r/6x6IdA7/VGGLfJNdlcXqndwts4sgbTV8DuMHFiIJiBUZlLB0IIFeDwEmhpci6djAq3TAZ3ooAxKA3djzcjEwuKpLKTCMTBOpduB6YMhgVsKT0CGfsze0L1ViZPIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jszkDaJf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gJWB2nwc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jszkDaJf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gJWB2nwc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARfcg1516883
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GXJHlTlWI9rdZAlQlDTbUDpfcsl4EJSlpJT6KPqMdqk=; b=jszkDaJfDaNZQX+G
	vLXRqKgoclNXEm8JrFbRzkROKZXEQidCi9/1RwolO0KKUQkBaGclbwDlblIWNqak
	MaM1ZGHU0VwexiDod8Afoiej3LvJF05gVb1eFryupAGqiX8eTA5VVjuJid/Rcohq
	gKWQ9WVzanQwbgCBBdsRs0Wuy9W91PwB7C0VRcqRztDPOaGp+WE8J2U+AzB7q0Yg
	f/4L81f9i14u5/ZCm3qfEJxGKzALx2TXm1RyZwa+gNidzGbLwqnAQGDiakfA09QN
	yEpljJyTLfxCmadIYz++1Goex0vwPimuhxUq3v+VI2IlqLX0YTdtkzkkNw/10LvX
	dfiF8Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6860wcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:06:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a23afcbso98748171cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784639160; x=1785243960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GXJHlTlWI9rdZAlQlDTbUDpfcsl4EJSlpJT6KPqMdqk=;
        b=gJWB2nwcRkm4jCoKabS0dtSS+l8iKmZoQaqwS91/pXsyQZBgRdZiVxhc6iQdbw4Q3w
         liG21BTzvnXKEfDqrKo8wY8Tw351HQMa8GocEr5oy9pUOGlQrcBGXSxZUuBgPO9gt+Y8
         h0yrIZ3eIp5g/RA2MiZODaXUnRkj2XQDdu0c0Xpfn0Oi4XyjmKW3Q12nGXf+OULYqmZt
         uebKRBBLQIFi/LTBN+unmQCdTB5dGqmokBqiEASoWbXpTp7w6B2H0E+7kwDSqQWxl4U2
         BtsFXLp7VUFIINnbGsiEG/fS8wwikHHJ8twvE+iu0usZxV+uKQ8/qVZ2QqJRY7ITzR9B
         EPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784639160; x=1785243960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GXJHlTlWI9rdZAlQlDTbUDpfcsl4EJSlpJT6KPqMdqk=;
        b=O6mrhM5D81fQ0erqG8PR9ZMCanTNbQMnHC3+A28ay6OXLYhEqD04rnGK8f+aa5JB6R
         80am7TiwwCZ1kJpgot070E9kbkzsFzJ6R4McmUL/VBMKALL/PresppWbQk0bl5qdnYk5
         MzU+YMvpE9UW0ZvOZQ37fEFrcU5nKE4nuWOzH5jr8o3TJzBYXTaOwtdE9ebD86+QwnVE
         eBmi6HGEWp1vCnBXqeAySTALGaijKcOiXW/tUEoZzd3OSA/dtGTUZd2/LHUAm0FbqPvY
         Ny0iqHaWx27WAtvsdhwwjrAg2hfoH8K/0dxv0qRctG2j2qUTcn0ozfiRYaLgPpTocajG
         PbHw==
X-Gm-Message-State: AOJu0YydffpHR/Y4r5h/hS2EdeV25vcCoQ+llwcukWLSDLwJshroPRQc
	fH0S+b9d12avA0T2tucTWT1e3Ok0ajxQfSI8PpsIkaGL4A5DcxubrZ5BD4LkfYpe3NUlgN7Ctgu
	mO3o6GLfTSGf7mfXAMP/agbgaM1NAE6kjOPDyj4lg43lyCZJyVBvMhL0RYVjirJ/NgAn0
X-Gm-Gg: AfdE7ckISXos2jacw4MGn4FVptMDk/eIf7iRwCsM+g2nbrptw3ZbTTilshudxyn6AEH
	OuXlm31CoLRRbBpqwGrEZlGw6J0DkKGmE0Y6AwHMLlDApyLbJhzpU4/5M+t/srO0gFe059mR94v
	lkSPRJxttZ+c7HOJs1mKPOJOhKOeR8Rp/0040gwSwwTn4UjWngSKmvEahThhRGdz+y+hWcQ3cQt
	Hy8tvcWzk4RTM2IYfSK0Ma381oy01RkZvJdY4c4D+sjIcRnOGsyph3ntiRlKy/JG8oqzlq5Yob9
	FfOyDIR+s3cdYkUPpZPM9h4l1BWgXy4WEbpQC3ufaK32ycUaJCdhjmiHQHw3xP7X0/OAucHNz8h
	WErYao22xVfw4vWQMewZxVXnqBeQ7QZUxt+cxaDdczDg3n1+OyERJtwb3Ewa1qRkaLF7l6VzkND
	ol3W0eSju2xAdpV4qqoDUv1KR87sBihYus2+O+lGlyX98hRbnYdh4=
X-Received: by 2002:a05:622a:228a:b0:517:5e32:af1e with SMTP id d75a77b69052e-5213c10a757mr161124571cf.8.1784639159689;
        Tue, 21 Jul 2026 06:05:59 -0700 (PDT)
X-Received: by 2002:a05:622a:228a:b0:517:5e32:af1e with SMTP id d75a77b69052e-5213c10a757mr161123831cf.8.1784639159021;
        Tue, 21 Jul 2026 06:05:59 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009ae04bsm591898066b.8.2026.07.21.06.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:05:58 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:05:49 +0200
Subject: [PATCH v5 5/5] phy: qcom: snps-femto-v2: Fix possible NULL-deref
 on early runtime suspend
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-usb-phy-fix-null-v5-5-a181e2adbd2d@oss.qualcomm.com>
References: <20260721-qcom-usb-phy-fix-null-v5-0-a181e2adbd2d@oss.qualcomm.com>
In-Reply-To: <20260721-qcom-usb-phy-fix-null-v5-0-a181e2adbd2d@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEzOCBTYWx0ZWRfXxkK2LxBKF4y1
 QUPDBpPxaHLhkxlfFFK45E4T/SKJHemCcSoMFCp9A/+kP+5dcBHeJx+/A9Ok1pUHvRmwDpBvMJe
 ogBf8K8iImNVnobFU+z1ws/0wHCa6fc=
X-Proofpoint-ORIG-GUID: oBdyqYX3u6BLfdIRW12HbnO3aLNrMpsF
X-Proofpoint-GUID: oBdyqYX3u6BLfdIRW12HbnO3aLNrMpsF
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a5f6eb8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=PcYcMbZi39MCwOMHHM8A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEzOCBTYWx0ZWRfX0Ii9TrfzTUbN
 UddWhmOqmkRckotBNcyUub35pVgfMijbQVXx0maDK22wHBbLYnqy+/EG95AMIahwHvAyQH/LmOY
 //Jhbv54UV9aOmWNoDU4zWzDTurnFQvOyj2znQ6FOuYCby3IVYMZBXJIV9fHHY1wXtMg0EzH5EH
 bm3PGC0+cnKsnKOpn19MKJAlAJ0zdxEpe27kKV9H6zLDzMiML6Xs4TwXucmDqac121Al6CRpPoN
 YBjHn9ZtKEyBoDgnBQgGyEAEbuWbc1yGH7jJJijMM/bsq6sMxGQM9ijUAi4NCTAQVJBwW6KU9m3
 HqraynsZARNapPlS7z3j3kuFSg+YOXoAN34CN+QdyYCkbAOKa2a+c8f79/Leq8zcRn+FnswVPx0
 VLbDoymNRhitD4swnlKpgyKtptiOo4YfANmJp2cnJrecmUWAJLPE6IN+x2YtlV7V833GQ9Wuj4i
 2qiUMNuN6h+7iPbOIhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210138

Runtime PM must be enabled before creating the PHY, since phy_create()
only enables runtime PM on the PHY device if it is already enabled on
this parent device. However, the runtime PM callbacks dereference the
hsphy instance, which is not yet ready, leaving a window where a suspend
callback may trigger a NULL pointer dereference.

Take a runtime PM usage reference with pm_runtime_get_noresume() before
enabling runtime PM and release it once the PHY has been created, so that
no runtime suspend can run before the PHY is ready. This also prevents a
short window where an unnecessary runtime suspend can occur.

Use the devres-managed version to ensure PM runtime is symmetrically
disabled during driver removal for proper cleanup.

Fixes: 0d75f508a9d5 ("phy: qcom-snps: Add runtime suspend and resume handlers")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index eb0b0f61d98e03963bf92e5c822334f52636abe7..b1a85518fed0a7a35516d16da3ebf69afe760e40 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -599,8 +599,18 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "failed to get regulator supplies\n");
 
+	/*
+	 * Enable runtime PM before creating the PHY, phy_create() only enables
+	 * it on the PHY device if already enabled on the parent. Hold a usage
+	 * reference so callbacks cannot run before the PHY is ready.
+	 */
+	pm_runtime_get_noresume(dev);
 	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret) {
+		pm_runtime_put_noidle(dev);
+		return ret;
+	}
 	/*
 	 * Prevent runtime pm from being ON by default. Users can enable
 	 * it using power/control in sysfs.
@@ -611,6 +621,7 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 	if (IS_ERR(generic_phy)) {
 		ret = PTR_ERR(generic_phy);
 		dev_err(dev, "failed to create phy, %d\n", ret);
+		pm_runtime_put_noidle(dev);
 		return ret;
 	}
 	hsphy->phy = generic_phy;
@@ -622,8 +633,8 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 	if (!IS_ERR(phy_provider))
 		dev_dbg(dev, "Registered Qcom-SNPS HS phy\n");
-	else
-		pm_runtime_disable(dev);
+
+	pm_runtime_put(dev);
 
 	return PTR_ERR_OR_ZERO(phy_provider);
 }

-- 
2.34.1

