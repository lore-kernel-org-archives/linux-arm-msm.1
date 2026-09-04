Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FE7521209
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 18:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788547867; cv=none; b=DLsUKDBFD29AJZG6b/TE0GR161X5kNxPYsdUB4RI+Tab1DmVmuZz9BRChhuydVXUKZ4wVfrCnwp9jmmNHKkMMFx81BCcaazmmekkCur5ZgU0dgmTDr0ZsGOwq+yLl20Axd6nj8y/rs9s3rPI8HRrmSOlum5oDL+/W20W8wpGzB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788547867; c=relaxed/simple;
	bh=30e2YbKW2IQajGBFGXMD8HknPCEruSPRc6XeOZuDW3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QON1/ZORumwhNnd0hAjmD2kh3mwf4JQBh8OIZJ8bicsL1QRqrD2OLA7e8f6cVY41XZoJQeA6NUV6nAKPrkGiP+gZAgWSv0Fd7zfNgMXBZiLMjP01f7Wb76eGxachqhwcsQhrdlQAXz2iYISO8Oeojtjoy1AyK29SGID+m8p2Nss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YneRItfx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ORhK11md; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YneRItfx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ORhK11md"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684HI1ra3001275
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 18:51:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vP45VXrs0CiMYOIlCFKwXFygyz7JDRV/Nax9tHjmzJo=; b=YneRItfxRbb6Or7c
	S6V6E3PeDzKSliTXRXMOgHpdn1qjGyT3vGwciC3OiJgdCy79rKKulLxaTSaxyARX
	G2QcmSuvwQlsDijp/lIYUwF4m0OA1e1uEDhIH/61mNduvQxyjLMPzz8hSWua2M78
	80Iwe7G2nO/pp2r9L4SETD2hojlZrarS7rkoUEoyUWJpXNVo+HfPddFAX7r2EvqE
	eFv9bvW9kNL8FqtB9U1tKrj26u1rienzaB5/6Bxpu9gPuxNFrCMqyF7kI9Dq6ZGq
	3Apyo7Y7D0eMMZwsDVL9vb7oZKyVtFBIOpThhBld+I+y1wxH04o6DWvcAu74el4Z
	QYziTw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg00ys63f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 18:51:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1cade6b71so1402133a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 11:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788547863; x=1789152663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vP45VXrs0CiMYOIlCFKwXFygyz7JDRV/Nax9tHjmzJo=;
        b=ORhK11md8OvEJmoePxuSKd/jFjh2//ws2Kyrmvh8txjORgE4nOvFQuP9oxJxg0f6vC
         HM879LhE8i3i/bwdnVf2KA+o337owj3s6GzrFe5ooJbx45Qns8Z9u+XFJPKWU5QJgc+4
         5wDI/UnIv7wh4eKFqcjMqTs2BDhb/0usQehZZbE57BFlGef0xOp45TdniCVVBwIXDbs2
         EC90j1H+UTDqg330vFXpqhpFm1+iGTnRqLXeitRX4xT061kbrNq9Vycp4cAxMRBscX6l
         QVbQ3uYb52O3fxm4q7ElJAafbBNDS9Wg1zq1T40pKJxYRbtviTeeN5nBRy1LAdgsNKm7
         hC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788547863; x=1789152663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vP45VXrs0CiMYOIlCFKwXFygyz7JDRV/Nax9tHjmzJo=;
        b=fH1JgO8RV1CvK1jXMFS4Q2S8KdYcw3eNhLCxjY2NlvPmB58J8VSs86fmhHtbGj0Nrq
         8ivXEpwa7c3sC0nXo6RHc0UtB//gnhMKrgPm58uSvxwDEPSls0GPrvBhGEYr0oh2jKJa
         jxdv2WrhkrvWqs+Yksdsm1cm6uop/ZGxB2q+9ETd89t58spaPJVxzcjz4AuUyvbeaM95
         Mwg4LoBp9MZ/20Bdkg6TEcTopueNtA03riZHkOeMRE8pRfY2UnMBk16LsMYtHa3f7kTp
         vUOprzRkrphXbuNiwFacfbwRNfQLTzXx1w4vrxRy/4gOqFNZ9akV/a++7IlnSiQnHhTt
         9kkg==
X-Gm-Message-State: AFuF++lL6epGtkfNlxCRWjcwVqUjSjY36/HJSatpl4snQ311i4KG3WY+
	ZinLg+LeH/zk7wAoiQYQeQ6HSTPGQusUdQYJqtwIQBMPMHl9xeuFcgMjBd/Yt7WD/44DpugCBcJ
	hSseY4RsSdOH9GtT38uSe4vthrxaLqa6tWwg8HwobqMV0BXXYPwVRrnYUUOemFJzGO5Q6
X-Gm-Gg: AYBFou05CJrpvpqVnQ2qLvnDaJbk1wXtG9DWf0SJHhTUG7hXm84thqwN4FPwASdf7xL
	htYPJ6a5L7YfRqCbgA0mPpHhVmZUM3dekhnTxgJOzmRT+LI+8L0XuEu/NXYeJWTRFMxgba1U+cc
	53kAN8/GmSn9eVMojD6AsCVPh1x3nuSAFR9nOo9oxR2nTzydkHLsdBQOqIbizOR2x3NO9XiuJZk
	6lKQqJ/EzaKXfXnSyDLkrumdqaqt3FMLL40GwZ3+90dfEs/PLZaEZrUu70IAYQ1TTYFC1J9i3eb
	nDDGmyG4BN1Ai+gqPeB3PwsRb9HYHL85G/KCFEjImlGQWUfPU6Lx1Z878/Kzoa0XkbNAHv9E+7X
	fQvXlM+4nh+xMWoXl/buml0EdTJsJUvU=
X-Received: by 2002:a17:90b:5587:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-39b086549ccmr17687584a91.16.1788547862104;
        Fri, 04 Sep 2026 11:51:02 -0700 (PDT)
X-Received: by 2002:a17:90b:5587:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-39b086549ccmr17687529a91.16.1788547861586;
        Fri, 04 Sep 2026 11:51:01 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm8682644eec.24.2026.09.04.11.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 11:51:01 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 00:20:42 +0530
Subject: [PATCH 1/4] dt-bindings: clock: qcom: Add TCSR_UFS_CLKREF_EN
 definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-glymur-ufs-clk-changes-v1-1-cdff2c67a8c2@oss.qualcomm.com>
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
In-Reply-To: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE3MiBTYWx0ZWRfX/QoV8bbrKQS7
 ClZOZsy/IHrgw8i3CukK80Je3Os4th/kDSWA8YlCNmdidCxUWfZFu+3JgQpjZ6ibRbLWnSeTSvU
 a/wgkZrZAt7T3jyVK0H+FUFWgiuA9EE=
X-Authority-Analysis: v=2.4 cv=TP11jVla c=1 sm=1 tr=0 ts=6a9b1318 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=afu-3B1tbf9Pr7ydrUYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: VU7VPg8-PY4Tj6JJxOTdnzFzvj0_XwSt
X-Proofpoint-GUID: VU7VPg8-PY4Tj6JJxOTdnzFzvj0_XwSt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE3MiBTYWx0ZWRfX0lLbY2EvbHWP
 E4nTdEAvuLcscj6K4aPh8RsAWs9SfAdaKssDfrTTUWAC5DVemYc6VVLG9UPz/rdzb7z/kgnVmCv
 qLUM/TKumYAyb4XukoWMWP7gG5U1OjwNRWJSvIPCTBQBpsY7RrX1/x6v2uI9MFw/zfz3ow3m3MN
 6Gax/bNapiCZCh3H7VtW9VwC6sepYemFdIsYYsTFLPiu+/APAlRBgq6l6psSRc6QZ47h8xTSE1l
 hOMzLUY6E5eUNzVrdzdyq0sgdNmT/dRWo8U4vrNRlzcOKE1idkTjIunh0Iaz8oihI+qcDYSbzgD
 y8c0xzz4n03PhRHl0jvWi2ik4flxwpd+fganl/b454M00wErm1hgeXDEao6lwJgaEmqU8xq/ZCV
 EsCybF04HI64jnXBO20gw+wiEnNgBTgfljObxP9UoF72j8ksaIX//aBB4xoc5HF5wVQOt7rHDd3
 hid4NLMffdVmJZvr8Aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040172

UFS and PCIE_4 share the same clkref enable on Glymur. Hence define
TCSR_UFS_CLKREF_EN as an alias of TCSR_PCIE_4_CLKREF_EN for UFS consumers
to reference the shared clkref on Qualcomm Glymur platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,glymur-tcsr.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,glymur-tcsr.h b/include/dt-bindings/clock/qcom,glymur-tcsr.h
index 72614226b113bb60f1e430fc18e13c46c8b043d3..f338ab4454a14aa75532cd0a6a56b6bbb02f9448 100644
--- a/include/dt-bindings/clock/qcom,glymur-tcsr.h
+++ b/include/dt-bindings/clock/qcom,glymur-tcsr.h
@@ -20,5 +20,6 @@
 #define TCSR_USB3_1_CLKREF_EN					10
 #define TCSR_USB4_1_CLKREF_EN					11
 #define TCSR_USB4_2_CLKREF_EN					12
+#define TCSR_UFS_CLKREF_EN					TCSR_PCIE_4_CLKREF_EN
 
 #endif

-- 
2.34.1

