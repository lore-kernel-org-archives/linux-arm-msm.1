Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB50342514
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784639161; cv=none; b=CJaMqp/BE9Wk5BNGGjtaqQrmn1rZ/8MhbyGhiSOVbxQpnCQzVEMYJPOmUeyxHUakhKsmd1dbio5vVzqJ39pf4HHJP3LYZoSXE+/CoWVx9YgQQXFFl+UzWssnjZ5ZkEHbznRsVAUskmEGvfTZYOODOosJyOoiWbgEj7mQ5erTm9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784639161; c=relaxed/simple;
	bh=mvZuz4R68MDpMBJuL25COqTuukLaTsnYTOOzX6VHfJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KvG/7IPL+DTKD0RyC8xM7SVyGm9FnWfdOyJvMKovlyTBy9WcwAx1g2q21Da8YpKIUDgx4/CjHZTrooiLK15Dbgodcyw37SCJBU0I8gdbtBWPt2mCA6Vv73QMwRijpyavS74L9zoJCzx3RnCDnr0gRLZhfWabKGPxUseUhmOrEAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZTjFUZZA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g4J9wgdo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZTjFUZZA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g4J9wgdo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LAR8XQ1134534
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+31G3iNyhTEkeua3PfRYEfavCmIUVylJgJKWF0Z+7JU=; b=ZTjFUZZA0SBpYMNR
	HFOBjb8j4jgjl38hdsS+/YUwxVvgoYksr3E4Q1QHd5TUuhIeEEaCt8u/HI28bJzp
	kDVKZfbRmzkQdGSdX6+xKtibdVgenuNfWGW720Ewsfkgv86KH6STmPVPe5Zr7RR8
	lno5SWG6Nb8wGZoHFWrVjGIAmyKDkgIM3R8ozYifxgW/JeNHo2kTPRnHeXoHNDsj
	NtKXc9hPiLgJEHs61RFXeF9bBvDMNQxz6CR5jpp7etYUUM7FmtkerN+q5h6S/G58
	b06fbuoKFmjqpAUQVIKoZ3g12CXi9YzewDw2/H4wPojZJLdME6a/ZfaVpQIJgvEs
	Xqxf7Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj0as2v27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:05:58 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963d24c3886so6926707241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784639158; x=1785243958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+31G3iNyhTEkeua3PfRYEfavCmIUVylJgJKWF0Z+7JU=;
        b=g4J9wgdoekp1lsNWz3Jvw3gIt360O/yBEAR3AXiiIy7ujDbFRsLpgsgSGMHSFcdMUd
         sm/haJUa0kGyFJzdExvfO4Ygm06jec0DPVhDL0CHl4bPRTfELzRVkQfCSLMKKDM6Q7mj
         DKQmnuFsjwEuVJR8ev7LoGjXUa9/FEC9OJt5xvHv+fRQke8IodVFIMzb6I1rDn4hmi2u
         3z0CAwoQuch6sfMKHAXYk/0gWhNrB0NF0xFHJvK2ftVqaVg/4c3p8Wsv5O2BvWb8wBoH
         55e+HcNFVnm6XQW/MgtBUVmc3XiUAElS/wuwbOfZiI6C/pTXscQHR2xpCMkDVFsL5IdQ
         pncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784639158; x=1785243958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+31G3iNyhTEkeua3PfRYEfavCmIUVylJgJKWF0Z+7JU=;
        b=qhhZ0YiNBv3Hg08A6idOJWleyo8pybZcqqTRyH66ntaY6GLBBQGRgGl2DtyAAdrt3u
         cFVBHhy62Fdicd8KEzlOchrKmDDZwag4mdZyG6d7qUNu7zEqWFIl2csrF/cTOpMw9mIm
         mBXVfGi11Z4cEPpUzJ2FGmzKVMrX1YIkujIs4nk6mhkO4Z8gM0p+QJ4gHSIta6dfZfdU
         4O9RTR2OfMjyROgIM5cQKDPMVd8GcwS+fuOx4RbmWQkiEZaUOf7wRtCVC2+N7XMM7ddN
         HAcPiBF2pr5S3EVKwEM/+dhfDOETManP8Newlu6nPSUJpdXd33uLtVMVn3Zos5WOVh1I
         pb/Q==
X-Gm-Message-State: AOJu0YxNvVwunSeGPCOws9cWREW+FWaciFIlMrbCcKWzyfXslD6nxpyX
	E3vXni2wDHx2/JmhTugtr/RRsQB1f0qBNgwDXNEPKVQIgVTK6FXvJ9X+Ln7PlrYhmdPwiE7kAUJ
	uPIVEkhl8TH8OsNwXba0M/g+Gnv/1SnklrBHK315oqmTUUBjZrQJJ/tFLLvyMMizIo4Xa
X-Gm-Gg: AR+sD11eFq5HDjeaUP5Tb/dOdrlVwm3p2qqokqc6E+NNlGCxmEGV7qthWVNy4BGjuRv
	q4yGdi2XG32ip4vcp7t3/t2H6/0K0OJTKxcZymCmB95cSnYOURTkftKXqPjJMDKZI01be5v12xp
	ARgM2lmfoXUJEYmq7LBEoccnNrE2rSEo47cvjh5QljyArVdJvMEFGtJX6JrImJTRj5S9pDXu9Ou
	Vw1Tcq1cnISPy07ri5tAHYOA6vgrASUlW83ky1j9xLbfrcxY41gbAZCqmgpzpgfvIi0D+27vwN+
	zgbYOpxdSg03WYkWdtvE5AUkCfjXfrxeOqXb2PIrBOHt4lAZ/voSog/1zFps3L1w+1Ll90H6q1m
	GP3XJ+c3WMfDVGncP/u5hZfMuFDhLr5saghTLeG7EwyMMVDmfNm30/8MXAsBTnJvDfL2mqdd1rn
	W6cyH+nyWaAsvUNNpqo4K04MfGRinRtyNosM926w8GB43bqNOtaog=
X-Received: by 2002:a05:6102:1612:b0:6e7:5c89:3fc0 with SMTP id ada2fe7eead31-7475374957emr6867624137.25.1784639157980;
        Tue, 21 Jul 2026 06:05:57 -0700 (PDT)
X-Received: by 2002:a05:6102:1612:b0:6e7:5c89:3fc0 with SMTP id ada2fe7eead31-7475374957emr6867500137.25.1784639155104;
        Tue, 21 Jul 2026 06:05:55 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009ae04bsm591898066b.8.2026.07.21.06.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:05:54 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:05:48 +0200
Subject: [PATCH v5 4/5] phy: qcom: qmp-usb-legacy: Prevent unnecessary PM
 runtime suspend at boot
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-usb-phy-fix-null-v5-4-a181e2adbd2d@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEzOCBTYWx0ZWRfXxLdz2BszO/a9
 nXZZxXjq39s/6HuctUJ7Ql5LYg/EnBIR/KLaE25ovaS1NsfTNSvi7yfoI7wMLjI0wD4+bDgkXzu
 g6WQs0XBOstjQj3yW2lnqN23sZ7+dU7yl+nZOcSw9npra7weztfwl8WSlMG/n+r4oHcU2DqR6D/
 p2iHbvHzWR9ejv6PE46Y3iP0sgeuU4AjDMZmn7u7IOgycHT2E5SZ5rqXd/XOrRwdy4Z9/Z2oSOo
 xna22TyXzn+R0i/qcKIbGe/XJflYVHvfK8VsAB7+8DhPTVB6CLKBUdZD0AVwsPmfTifTfa+HReL
 K+uAgpcqQ3iLYTHmMuf0m710Elsi1rJNIVUd5LEaEM6DDtumyUmoF8oPrm6FH00m6lhFeOxW1zk
 2qx9N/XdeEUeZ6O7GWm+IKl9HWAvEMdvlqSJzrHrWANr8xFHLb7M9L0RcSmmEEqRWzw8473D0Gp
 ZJPuSK/yzdhsqzejfiw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEzOCBTYWx0ZWRfXzGVa4ToIlEgl
 +oC5XN0v3U+rypax2CuAXCT34Z2RHuEgfPdG/+UTGs3FU+xL1okjwX2CQBYskSPfpqRaVz+qWnr
 LMXSS1JZA0hWzqK1o9vp+nH+f0WylxI=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a5f6eb6 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=PcYcMbZi39MCwOMHHM8A:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: j0tKbQmhJN-jy10D9N9Lcvmxi7iomNMt
X-Proofpoint-ORIG-GUID: j0tKbQmhJN-jy10D9N9Lcvmxi7iomNMt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210138

Runtime PM has to be enabled before creating the PHY, since phy_create()
only enables runtime PM on the PHY device if it is already enabled on
this parent device. This opens a small window where the device can be
runtime suspended after pm_runtime_enable() and before the later
pm_runtime_forbid(), causing an unnecessary suspend/resume cycle while
the PHY is not yet registered.

Take a runtime PM usage reference with pm_runtime_get_noresume() before
enabling runtime PM and release it once the PHY has been created to
prevent the device from being runtime suspended during that window.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
index fc490589c8e4888770807a60170905a1c7610421..eb1826fb26f0868f7758245b0cbe1a0590fea9a3 100644
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
@@ -1297,23 +1303,27 @@ static int qmp_usb_legacy_probe(struct platform_device *pdev)
 
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

