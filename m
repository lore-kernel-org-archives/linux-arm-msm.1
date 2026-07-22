Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BECB357CF4
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727933; cv=none; b=H0dZ6mynld11XsCiAtNJha5ZqVyiMrXWeg5aSW+ruew4fh3THWDyU5UyBTmxEW4ADCGnhyIfdnGB0/LMA3D7xHebxBDHaXOAvaKKZUraO+6K/cdp9gotDETNGiIvS1CQBBVOY8c+yWo/GKRg79ILh8baiHAErvR/oB8GA300+GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727933; c=relaxed/simple;
	bh=96oek73EEHpVilZpkgDTZ+JL8kRU8jBNVSIJAzbuxbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XWAjP82TVyBUmPRmZ+MuqguojXjYR+u2VnEn4gFK8ms6IpnJVDS2W0CLEcVcJ81TP0lOVEAggQcCDyMJY/EQyzZ+Q0FyQiVunF3bHrVgEdaHVIy1M/gnOTGh2Xkz+WRuW5rqGb08YAjqREq041n6SPjAjrOhoeqvXcl5mYI5mXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cODaShmP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oik+38n4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cODaShmP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oik+38n4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDXBZ4975332
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zn8YobeKzJmI2eL3M+DT+dtbtruKgWpxef+/c+xHz1w=; b=cODaShmPdCJx+gMV
	8m+M1ORMyrE+w6Xd+G/s0Ta+atd9JE5UX8cR1O8/kE4QyEhg4u3cqftcem5OojE5
	qwWiqEjSHw2Z70Bz/xO9Ghuv/SXu8G7KRSaYJqsRu4lWP5Epk7D6I8VuU+YvSJlP
	Vtc7XCbIzCH5ecXU3CRKrp8Qi0w1CTzhdBXx7lzriVuBYQOop6vslTuWibuYDTLt
	7znHW7fYMhxnw7Ib033/ohF/qyFbiZH+XYKW2rX7Wq2n22tM4+cLbjpNIK2GFXVK
	dkIl0RzDnYcT6qwXMBEMoZD2t2wZ0a0+4iuVF6gjrNV3CILjjdfbcr1KmrUyW9sH
	aOTgCg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjuu78s40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:45:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c12e43b98so246007351cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727928; x=1785332728; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zn8YobeKzJmI2eL3M+DT+dtbtruKgWpxef+/c+xHz1w=;
        b=Oik+38n4xK3Cvz65lmWC+9K38TMUNGFj/yfOFwRLGhi/W9+GX+gMmgU8vRfOvjeVYm
         KAwIY6LiSCZ7wTyB9ypQ45B7IkHi2nu+a6nh7Q6ZUdQWhq1zJJiQSrWJNfLoakzIK2AU
         QTc/wNkVTnyiX6WZ/E5WIKBb9G5G9lfepqwAYaCUd01LUZawispS5sOuj26Z3T6dApyc
         0VITYOTkClaUR7njGy3xH8wY3hvO3wpOnh2A5bWPm4qki+9U46vGrDU5bEF9B+UCN7Vs
         Xtnxo/3YALc3iMOZZGwckmMlmM7qB9p6/8Hffu4MTYd39+yhqj95SKZeM9dP7kixsvln
         CMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727928; x=1785332728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zn8YobeKzJmI2eL3M+DT+dtbtruKgWpxef+/c+xHz1w=;
        b=IWxK6mILmZ4ZT57sMrfeUaCTUfdumVmga2UalQ3pxcd1V9xo9N5Hc5h3jCBzgcztYY
         dLqxfjbFLhqDOW70Cjyc/pg4BW212jlJTOgRHBOgxPcnmocqh/N0aufSffIWO8r0GafG
         w8TfVt0REIjgCuzUPlb7A6znTCikdwO8fR6WwGB/uASkUus3mjYON6C9/Bez4m1vj1Qc
         u5u5UX+YGZK7sJOmFG3ekbCcsEuxRV75pBCPsBl4JP4yad/pqHcGt+68gsvbRcuAOcIG
         zpHzZH4gLmqSuTmrl6oSnrHWYvY6NYGl2//O9nlpOt5x+0yMH1h+znZfl0oOWSaxcR1S
         bwBQ==
X-Gm-Message-State: AOJu0YzCxCmIwxPj0Gu1zAkZiZKXdizlMdVSKY1ys8d27ck6NZP11vLf
	zYD3/0xe1VO99wepiM4x5RMmHv97/txqSXBnl4uW2Qza+yZw7zXd6WQSQl0/g0yPVeDrrjjdvr0
	Xww9vawRHn5r00QowvRCX1TVqQx7FsRWfwErePfDPxJ+e3NI/MVT8k/EROCNkRCUbjLiF
X-Gm-Gg: AR+sD12mGmP10aaLTr0mXJZlIpsG+qmjtqm0GDUFikwU+dHT78ICdvoH14xuvtyx2Qj
	o76Njqk+sHemSwbBCqU8jwnxZIoLB8DsIl66yWs5tTpQsftQ7AW3cChtkDRCUitjxmd6ioxlcrV
	H89Set6K7KA6m+HQrZO07TY+WdH8t0f5HqpdNPAYnHljgP86An0UttwzpmveB6GT2LGcKSNaNJt
	B/RxBLNwJ2NV3Vzq7liR6YDOWTmaw6wC4LPcILaEvQ4Kua4sMTXhLXf3o0CcJXbhgK+8VgASsPm
	xhM5u4f9uVsZIKQEBzl8CaHyt07y3Z+bKEglK4T0IjP2rCDvAiSWyQHj3V/bVoNxyxkMa/ht9/L
	fr/wYog8XhqOx6HxAEsJP4xmsmEq6kvZ/8B5XwetUoouTqtW/nsmM7eVBJx3HlKkKtbRSwWunWg
	pP0SQfpxfu7+4USoq6rjwxQj1QFu288DxO7+p44bkXdiGW78TYZg==
X-Received: by 2002:a05:622a:1313:b0:51c:1e69:bcc9 with SMTP id d75a77b69052e-5213c013f36mr221287041cf.12.1784727928078;
        Wed, 22 Jul 2026 06:45:28 -0700 (PDT)
X-Received: by 2002:a05:622a:1313:b0:51c:1e69:bcc9 with SMTP id d75a77b69052e-5213c013f36mr221286431cf.12.1784727927389;
        Wed, 22 Jul 2026 06:45:27 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:48e:a2cc:6c4:c92a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac8c3esm111874366b.23.2026.07.22.06.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:45:26 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 15:45:18 +0200
Subject: [PATCH v6 5/7] phy: qcom: snps-femto-v2: Fix possible NULL-deref
 on early runtime suspend
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-usb-phy-fix-null-v6-5-534f7e61b9a6@oss.qualcomm.com>
References: <20260722-qcom-usb-phy-fix-null-v6-0-534f7e61b9a6@oss.qualcomm.com>
In-Reply-To: <20260722-qcom-usb-phy-fix-null-v6-0-534f7e61b9a6@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: y_eeP-H1qGyttoj6ycRbnJRg4tNrOuDp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfX7oMq6V8+BASs
 CPDrpnPd6FLaoiPuNHrhK54RMqhen5I6uJDygugbNHByKxESUKggxA7iiigF1zmHmqQCCU5AlD1
 GJQlxqAANNKtoNSpzBhACqKIstJIrWM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfX+ip+s//oJ+jJ
 tL+ONkauGb9h3VKj2GkR/+eP3/O8nVG2kTCBgIHbjJfrCl2FJwSSJIY81XTIgoArnvCAxWKvdMX
 iA9AcEdDaJ88Wv6MpiqNz46p7TunwfcLHpWPBlkDSh4KdWOfKlwzlmpXIR0/AJOREPHKxsivnUN
 v+j+C1MbEE/6s7TDb2d2LmPaeTpaeFvfkLCZqC0Apv60Gw04E4HvzSQGbletdHeT81coCJeoZKd
 YZn7mZq6XtYnCgPMie5v7Qx3VyYqeSX5kAcE7Y2+mV4qiOM/BuaZbDwlLTBgJ9dsdkxjz+Hs6fe
 86OuyTYejhkLg6dIzcMHt/KfVprlPgeO0B+cWhUsIGQ0SWqBX4+iWocWcw35YCjjd8qM9n782wd
 938/R4MvkgUPVwOJhz5mYR5I01S2DINkuVgcc+y76CC460CJAzE+sLPSk5LQE7xMR8Q0pTl4C0M
 vX1lYVAcXz/BZa1C8EA==
X-Proofpoint-GUID: y_eeP-H1qGyttoj6ycRbnJRg4tNrOuDp
X-Authority-Analysis: v=2.4 cv=JuTBas4C c=1 sm=1 tr=0 ts=6a60c978 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=yoX6jHX73kXkGH752t0A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220134

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
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index eb0b0f61d98e03963bf92e5c822334f52636abe7..980ad1fb1e2e3cb6ab0b29df12ec8278ab1ceafd 100644
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
@@ -620,12 +631,15 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 	qcom_snps_hsphy_read_override_param_seq(dev);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
-	if (!IS_ERR(phy_provider))
-		dev_dbg(dev, "Registered Qcom-SNPS HS phy\n");
-	else
-		pm_runtime_disable(dev);
+	if (IS_ERR(phy_provider)) {
+		pm_runtime_put_noidle(dev);
+		return PTR_ERR(phy_provider);
+	}
 
-	return PTR_ERR_OR_ZERO(phy_provider);
+	dev_dbg(dev, "Registered Qcom-SNPS HS phy\n");
+	pm_runtime_put(dev);
+
+	return 0;
 }
 
 static struct platform_driver qcom_snps_hsphy_driver = {

-- 
2.34.1

