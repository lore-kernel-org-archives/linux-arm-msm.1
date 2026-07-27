Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590C2353A60
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 20:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785182492; cv=none; b=G9ylP/GyZG+RR6cK9LLpduTriJgDdSP2rAxBCc8tJ2BOsJxBeVfV+lEhizP0dsvN2vkCeHgDdTABUaMsn7rB7qtv1M3YEFKIfe+XPFtyag0mktd0T4RdG04xy10leLuW6CgT4Mlhaw1/ZhPletbX1u59obmGhOFgjl7haqPBzto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785182492; c=relaxed/simple;
	bh=x9wI1VhuHoglFAPUmIWp8IlI6VwblIlCQ9uzVed5WYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ky/TGHBWCfo7gJGZIrFdlke2N667OaDYK2XXVz2cjWeV1BbOzekEJojX7j+heoYs7Y35PTZwooRdVY+Kgr4kzUDcY1usjGVzXczkG+KA/Jr6oBOBRbJ5P38JwiQ7xtCeNfk31ayRyvdBgPRbepYPWQQSReHla4AzsYAYVaMMLNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eCVi/W9L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IqZFCfIn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eCVi/W9L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IqZFCfIn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RIC6wM530907
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 20:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8l5ezXlO4Zjl3tBEkU63eD9TLTLE3Wiv3DL1gqIbkCo=; b=eCVi/W9LTZf/V8o4
	9yhTz7XXQ8wfY2uRtqGhYq7FDY5+LS3tBUwklgtWy0uPyk/AURduAZOAY6GCcb4U
	lk+1TmfLea0ywV1CqDe2NAVMqgtReHUqS4PI6jZ5KHwCS2jDxndcvWPGH+GrpMUt
	/GVXgodxOBduMo/PsDdfjax8einUxcVm7zu5NacIRz6O2c47gg4kThxuacBJ9zD8
	Q5gsf5FTjEElBNg1BQbewYX68qaTzUQy82y/oqXAyyl1zCbR0Mpq0geFICvGOj02
	ruMYzQKnekatz5MoMp87GHCh+bY//j2jvTJuMh+dmfkwJI8Z/n5LumrrO3iPrvBt
	Rz3PzA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mrtq2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 20:01:30 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9776c59435dso430888241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 13:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785182489; x=1785787289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8l5ezXlO4Zjl3tBEkU63eD9TLTLE3Wiv3DL1gqIbkCo=;
        b=IqZFCfInWuctCFhbeu3QTCSvvdSRXKeXDLck1ULIQl7Ksw/DSb8o/jnltQMX4T0urz
         90lttxprZqMK9D07FvA9CQejE4WVvkpolok5y6hNS9aRw8DuSFGKQPI2+g4ea395Sbll
         eiS+t0VpXUCMD5Yb3JDH7jV33tZHxvkIpg1KkNbxGZYvGtcYmVxoCIBqCelu70OznELf
         Lw+WLkuNMhxiIfs00g1/ND1XQyie9uMgy2vqs5woHY3a8cU29Ooh5YkVDcoiPaOJ0XMM
         5o+1j9X+9J4HwDLaebPIHSqz/BphN/ysqwcW5HTO0NfHwu+blj5zbAZ/t8afjpNlg4wC
         QP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785182489; x=1785787289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8l5ezXlO4Zjl3tBEkU63eD9TLTLE3Wiv3DL1gqIbkCo=;
        b=PwE+ifj/2LV73T4Mo64DDW8bAjQ6v82T457oRDbzQrpMybSY2JwiAQo9YUSfdzQg/w
         /UTxTOXF4Y39XLkw9JZgqWKDUd321VfnZAb4uHEnOIIm9cPp+mTQZRyOclZf1BTvnwme
         j9dGLwPXMveo7idK47OJo0U3xxxV9Az/olpyU3vh072M3a1Oek3evWaBjYHA/pAyAxA2
         K6Iymo6aFr3E7X4yZmB6xgf1/U3deY/zCXIfmaBLdhAg8SrCTetSaa5sqrjJ65pj5miK
         G50NgDDrWAv8FVl61lub9a1S0AnKBStMYUZoI09fMiSyf43MqUyHfK29FiZCwwuJU03c
         KMvg==
X-Forwarded-Encrypted: i=1; AHgh+RoeEdWQ2ixRmKPheC1BlqIRAo7N3QmFstpnMBIlhDNW/xHPuM+YwFW3TygK5Yn7HNx8Eh1Djbd7K2umuNVn@vger.kernel.org
X-Gm-Message-State: AOJu0YyaWlJGlLVux4oQBV9mNWojAzLkfeO8tyqumPsuUdlGhVnaFMXY
	1D1UXEZeUcunwaIVFbZ8B2khxFGLCKM7QQb4pKByF/kkBdFKxDfkUrBUfn7UOrTFuhhOEPgMBu/
	5kSf7X65NdnUh2cTd1nWsJXYZhM8A0Bs1K33GQd1c1sxDS5Pyt0Necz1xrYJDRcqxuOoS
X-Gm-Gg: AR+sD137SjAYichi+uw0jo1m1JC+WplEsoUwASsr3pWclTeUhfw8ATJkeWZYhTnj7Fu
	8tAbpdKXZxfdwnZs/d1Yizi9sJ2giYB84Hk7o/Ldd99119Wage6A9nqZ5Bj1j8ct6xqcALMrAVQ
	QEJuYGvipy6snVaZV014zZBv6Rwnm5MlP6GKYFimnqLUw03PArvCfRC0Kkpiu1fmOu8/RwV4Uhn
	5zoHejulq/EfHE6X112RfTWSFLff0uvJ7yX/5TZT9bqK4OAUHKittPl4mBexTO9y6DQMqhHZFzA
	OVOHP7eSdjKiBJnNS09OVwPaYP2I9gxzDnXnk4qcvzo2gHi1//3VAIEfr23KFf+39vbZJxzG9Pi
	As8NFjFnv27hvgANsw+I/nD8f
X-Received: by 2002:a05:6102:418e:b0:74a:992e:84f6 with SMTP id ada2fe7eead31-7503e66d3f5mr5461375137.10.1785182489502;
        Mon, 27 Jul 2026 13:01:29 -0700 (PDT)
X-Received: by 2002:a05:6102:418e:b0:74a:992e:84f6 with SMTP id ada2fe7eead31-7503e66d3f5mr5461348137.10.1785182489100;
        Mon, 27 Jul 2026 13:01:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c44a91ebsm17923935e9.3.2026.07.27.13.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:01:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 22:01:20 +0200
Subject: [PATCH v2 1/3] irqchip/qcom: Enable compile testing for QCOM_PDC
 and QCOM_MPM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-irqchip-qcom-defaults-v2-1-466f3c407937@oss.qualcomm.com>
References: <20260727-irqchip-qcom-defaults-v2-0-466f3c407937@oss.qualcomm.com>
In-Reply-To: <20260727-irqchip-qcom-defaults-v2-0-466f3c407937@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=917;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=x9wI1VhuHoglFAPUmIWp8IlI6VwblIlCQ9uzVed5WYs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZ7kTSQbZEooKCBG24hJx6nOFnyYj09iIs2Weg
 5oBFwdUjUCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCame5EwAKCRDBN2bmhouD
 19teD/4qg25G8o46IcJNIOOilXIgjCY+0rbdQaTZKYFc12CorNbnqYn7iJHzD4LATiBWl/AAQ4F
 fBkwmONa8J9vg9AkmMNuKWnZd/yIrBI8Mn3T+PjJ82Te/1H+tMhk03hQHsoNg7sDvi3kK0pS93N
 Lg9iSN1lqH3VTc6rcpRStyP3HHbbC2WAK/tU7x4Cwm5KQB6GqSeQzMOh2gXd0dgUttQ4cRXMq00
 LNWRej17vebsXt/dBa1Q/SfsaGwuLpa4up+TwY6gqEp1s64+mo+pY2zzU6t/kweCTXtVI1YqXMY
 kM2GPRJ8L0naLP46d49jPCQt8en0pecjBOm5o+nUihkiOBWBFwpUi0v39EDsU9FmwE8NJS6IotR
 DMwo4U7axDvnJ9q7A6WdxigEhDaKrzPBMC5wacB9JReYfDjFB8B0X09cXu10caSSMQ3erVgjajr
 KBLwN4yistJafcGqZc/V3bSdK95xWbQxTrwTIIbY6HnDFeu95ZEkuI/3fxTL6GVbtgNrvl2POu1
 y9gioBGJkERDEPgAjgHh3LPKbClcEB6jNgnyeu6pEVJjM9RkfvXLtYl7gSfGGwQzivj23kD4Kr1
 D9Ow2h7B+Lfp6MA3RgutD6pMeEY2tmLFHaQ1CecFo9FQoLUEo/EXQ1CQ4x1ID5yU+XZT/ia2EbK
 SzwQy/KJel+kHEA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE3OSBTYWx0ZWRfXy4c/jy91kRvq
 bnsemFCEhqsH1ZhLqP48BkRercApOZIEBwIxbUGBMTVcK5B1ACv1SK2Nq5DLJWmdXPOYOC720e0
 mAMO+U++nBRdmsB32Oz6Mda+YkLY8j4=
X-Authority-Analysis: v=2.4 cv=UYBhjqSN c=1 sm=1 tr=0 ts=6a67b91a cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=US7q-9K7P2JNy3WQzUAA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: XzDB1CrCfvner4Ql4cUK9l8KjkcdR3P_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE3OSBTYWx0ZWRfX7JiBZL6/wWtT
 jkvGXLRSe9THserqL20s2Vknh/sugLT69qvJdVG7pSfk0sILT/uhWepCkQa98buvHxMd8YOMAS6
 Rinl9uxj2c+pj6nk6iDGOvumCeU39TEpzR7cysG92dB9dzvzbOOesB4rx1lJt6QDDM9S5qZVmjY
 qfepFz0K5t7oNT+6JzfS0R1JxIl+yQoTbVHChoaPXVYORaRWqrKPDI4sRnFpWUvHj77aYeGr6tH
 iGvVXYgfoHCzlJFZA64p9+lehgffcyO4Y/Ho6zbdHs38p0rIZ4kw1wv54EEEPQS4F9hYTyEHoES
 8DtrpaBHYT71o8+cBQu0CnRFkYHHcN2jD5RtDEpLvC0LY37vBEj5xm7CewwRiJ5Izg/2sSEDQUK
 FBIKPV1AzyWbREpIZDOfMQ45eqzQv/8YTBA9MJs2GdyQlG53aP9EqNAkEuvjBODPIx0jBIP4KR2
 jh6bQ7OS0Q/rb8/jxzw==
X-Proofpoint-ORIG-GUID: XzDB1CrCfvner4Ql4cUK9l8KjkcdR3P_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_05,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270179

QCOM_PDC and QCOM_MPM do not reference any architecture code, thus
should be compile-testable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/irqchip/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 20b77fbc51ee..5a881ddfa3ab 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -522,7 +522,7 @@ config GOLDFISH_PIC
 
 config QCOM_PDC
 	tristate "Qualcomm PDC"
-	depends on ARCH_QCOM
+	depends on ARCH_QCOM || COMPILE_TEST
 	select IRQ_DOMAIN_HIERARCHY
 	help
 	  Power Domain Controller driver to manage and configure wakeup
@@ -530,7 +530,7 @@ config QCOM_PDC
 
 config QCOM_MPM
 	tristate "Qualcomm MPM"
-	depends on ARCH_QCOM
+	depends on ARCH_QCOM || COMPILE_TEST
 	depends on MAILBOX
 	select IRQ_DOMAIN_HIERARCHY
 	help

-- 
2.53.0

