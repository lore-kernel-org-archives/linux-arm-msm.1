Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF9451A74D
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 11:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792064428; cv=none; b=nwclrauqUZbz5Ek+8QkJ3TpcwbPS5He0MviOa5QXZn3mz+z/kBDYpm68p7It3A6Z7dUOjEkTLPuz4aS5rRfGHYUAFE+0fTjA5ZpIhltSAZ1ZHHAW4xDtvwJtTZ7puJVy3DtUYl0pIMx2b0uG7heXAY0c/+wcClOaAIeSaxq7A68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792064428; c=relaxed/simple;
	bh=qDDal9GJ8g6Ikut3T7wcy/AIpZjwo/GMmoItp1TdU54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X+3JEAvdTum7VT2Mo3TjRWhT2xqtxZbfsf3D62dIyDJDDFzzMNkdNJmONDKpUO86fHTYE+9/sXYDkbSpWpSSWUOi8B9N5JrS8tWZC0Vvph82pYS4flJaMikSqvFMqqiWIO0JqX7G/BJlraPTJQx0rd8SEeJt2N+JNowyLrmqL+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fccRvl3q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fcgrXFD0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fccRvl3q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fcgrXFD0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jODi2114144
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 11:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sv2K6+0+MUtgDlrDif2dTZr7/lGThf5F9lPAXQqHnjo=; b=fccRvl3q5BxB0woB
	nKbTJz/u6hBKEKfzNruWtx9hvX9Ha6CuYHJLlKRVIwR1WM82MBSVTl8LTR6bJYKJ
	bUQi2C1N4hWZUz3TP1z52TG3ChLZe3aOQA0FRZavomV00PmszB/X5eQ9WsSJ1h66
	CIiU7fYbankI5D3iC4kfq8/qMKkchaWIxJZF1IseAzA27KFQsITgtPAlL3Kq9Lv5
	rMzyw3XcMuen44/K5u9U3k3CPI+l5etpeymKg7fiolrTlvw6dmEAMMuMsFBn/sQl
	BXpplSx4SF50gSlKTFZdRQQcKq06sj7P+Jo5oI5AfG7ds5tEIF0F9FMPhZbDOTW0
	rqZ69g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmyaucw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 11:40:24 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35cbea41088so2971406eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 04:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792064424; x=1792669224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sv2K6+0+MUtgDlrDif2dTZr7/lGThf5F9lPAXQqHnjo=;
        b=fcgrXFD0eyfqdOBzrtuuOL73MePFxYiC+Dk9CE9Xi8OcZeXSAlyU7yopTgTzXgMZxI
         OwIne85HM9E8O56Dlldj4DlbZb+sAxhb60SHmwqU9w+gNyq0xupFw2DZbN/r0XiwVa6z
         m/hxlM3Rn/GE+Sli0iQRTKMxOSt1oBQORaD18uizU6sgkRC14YOoMmmrxfO6tjoSkRte
         fPGWgrgZMYyF/8h7fTIkDmCOmxKn30zd5dn4FWY+BP0XVLcf/K70BeB96+OJ1iG1hxPE
         bGb3ShceCFw3q9WF6j0c4w/KkAtHOMNjGzVUqYM8iAYsXrYXnqo3YUWU//2yX2gG9dZ/
         Jv8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792064424; x=1792669224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sv2K6+0+MUtgDlrDif2dTZr7/lGThf5F9lPAXQqHnjo=;
        b=j7FCoLYYDKpxq0nG0qDJeqwYDgGKw9EGEuiGIclGv8v94yiixbkG2yFb+2FYIaLesd
         8Ehhbqfr3epoViChZX8B/4U1gVvfOzC7UQ2cuR1OQRN8/K9x86CinKqy3NotDuL5xYZv
         HeRUZvFeN+ClQ2hK7e/P3JcOuHON/onAlG4nVkkLyHQwKAYndcRCPimVZtKumMF+3/XL
         Ng2BzDX8zaGu7xNX6SDnRauJUsmh+0nGLDhZCPApdx9uC+Lk2KX0ivxr0BEFhJ1N1Yao
         9R/s/UOk0jFv1S5DhgIw8h/WVpCw7MjyaQeO5J+0/DxeXv0gY72iEL30pKjvDW472mjg
         dkhw==
X-Forwarded-Encrypted: i=1; AKwUvBx6O/Q5dcEnYfSYRX6f7UQ5bu/jVpsGhOdKwmzxEy0zcy2FuVd8mWaFXbn+4VZYiPcxSh+iDWvOdvZZJgiJ@vger.kernel.org
X-Gm-Message-State: AFq9FYIzkN/O7PzhtqgxCRt5+IqYMyFO+D5bllQJFwsriU25VJY/wDkL
	xI69AuIQDADGiFXhltSKin/lqbabH3FSiO2y41fJXWQGmAhonikyMLoDcoYfAouaL3YAJgkSuiK
	2vOQBcO5LOeg/hr4BFm5n4eLWCupBMkxxoDENn8Ti7nxKibIa8Cyzdd9LVjzUB9dlB6Wx
X-Gm-Gg: AYBFou0fmZOgx4jSVh0EKV7DOuo/nBbOOsRkXwjwF7/1PtyeaVX2AgaCSmUglCQEjMY
	SGNoG6lSF1Rn+AAat7d0NVJu6wMnzXhXcf9LKi3KOrFLFWI+Z2REXB14pb0xdIckhgmn8cdC8kl
	vKEsz80VkQaG8LPDGVicZca3a0FI2JZtKzg+gRGOKp41dqhcTQe/U/VG6+AD2ka0Pm34jIfWyWT
	yl4nN82PfH+K9iMnLvYvUmGXurNopcId5J9pJwewb1pQ3WV3ifngBQaiwu2tFr4eO//ln5GsLbI
	OrYRj5gmkPXAnX7jNV54CVbgYwJh+j0I69SQHGFiBnZBiudqCBrPrFEEr4epq+pJFHGnkECnXSX
	pnP0vq3ZghG6qp20f8OtoU9juIQ==
X-Received: by 2002:a05:7301:77ca:b0:35c:6268:8127 with SMTP id 5a478bee46e88-35c62689d3emr10317826eec.13.1792064423935;
        Thu, 15 Oct 2026 04:40:23 -0700 (PDT)
X-Received: by 2002:a05:7301:77ca:b0:35c:6268:8127 with SMTP id 5a478bee46e88-35c62689d3emr10317790eec.13.1792064423384;
        Thu, 15 Oct 2026 04:40:23 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b29c2f861sm48144891eec.11.2026.10.15.04.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:40:23 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 17:09:41 +0530
Subject: [PATCH v5 7/7] arm64: defconfig: Enable UefiSecApp TEE client
 driver for Qualcomm SoCs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-7-1460691b35d3@oss.qualcomm.com>
References: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
In-Reply-To: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792064379; l=1240;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=qDDal9GJ8g6Ikut3T7wcy/AIpZjwo/GMmoItp1TdU54=;
 b=h337Cjzx40d1Oa0bgdtGrc718cUop1UqHCOTA0q42DmHXOvEVZ2J/aBIuy7x0aRk6pSyDNODj
 biXyTymUe2UDJ6HeGcdYLrNpdiHe1seBVm1ao6vlMZcewQz11CPjPbm
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: Z11dyijQYfJ0898kHfZtJG6nmAWboJPN
X-Proofpoint-ORIG-GUID: Z11dyijQYfJ0898kHfZtJG6nmAWboJPN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0NiBTYWx0ZWRfX15g2B6S+EVmc
 V3A2eGzna68JuQWmecp7IUyeIbbpePigUeRHCZv3bg4+0ewNrPI+ND6ICNKi5YC1dMsIcZSop/E
 L1mMy8OsCKkIiVIJwuDvI4VSDVJ8TDI=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad0bba8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=L1DwG8FsHRaiiIOMTvUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0NiBTYWx0ZWRfX4SacM/Fe2dvZ
 yoQ8etvbT58A8CAOCdEX/Km90Xum1yrbGRjBrX9Gffs4TlbBMTRXzZjZ+ST1MQGav9cI5ZxsDls
 9AlOZUJ7am9HCUmeMcs4BkcTbF/gC8jUnoFUwjJtW3y6ii8UMVxjIwJ77cyBwrUVsIBaJQYf5pM
 EfHTUQZysxSS6jiIACUG1k4n50jkiHKgLqJJeXWKapSW4T5WxmdepvZ1+gbXl7B/i6iB+mDry99
 iwfK47t6HMCbNMV5qLbCjXC6VNnfZ4h8fTKmGM+4GCCLgxDDG5tbr/AGgJtZ6TU7udtv9AGQrs4
 cbCKlC06gKT7ZVQePWT1YySBv5UCk/ISc88xsP1p+//yHZ+amDoVJ0AEQtIuQDQRo/SJM7mqyeJ
 FxzU8AVLZ87EpHnfa0NqbPSF3BMOA905UXhkn912dx8dVzZWoawcplEWlSJpUhfU5+8eEeIAwu2
 +1hyftyCMbOeLsy7Zug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150046

All Qualcomm SoCs starting from SM8x50 provide access to the Qualcomm
Trusted Execution Environment (QTEE) through the SMCInvoke interface
implemented by the QCOM-TEE driver. QTEE runs in the Secure World domain
on ARM64 CPUs and exposes secure services to Linux running in the Normal
World domain.

This change enables the UefiSecApp TEE client driver as a module to provide
access to UEFI variables on Qualcomm SoCs via the uefisecapp Trusted
Application running in QTEE. The TEE client driver communicates with QTEE
via the QCOM-TEE driver.

Access to UEFI variables has been tested on a Qualcomm RB3Gen2 board via
the efivar tool.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index fce418fe6ff6..a8525878c679 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -277,6 +277,7 @@ CONFIG_IMX_SCU=y
 CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
 CONFIG_QCOM_QSEECOM_UEFISECAPP=y
+CONFIG_QCOM_TEE_UEFISECAPP=m
 CONFIG_EXYNOS_ACPM_PROTOCOL=m
 CONFIG_TEGRA_BPMP=y
 CONFIG_ZYNQMP_FIRMWARE_DEBUG=y

-- 
2.34.1

