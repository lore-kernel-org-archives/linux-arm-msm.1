Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814563839B8
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 14:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788271716; cv=none; b=hs7CsCvUMfwbZAvDnH1GUI209LSl+IV1kVsiKlxTZi3s7wrHOiJOBWFSg9KKR/DiafRiCdgaZ2k06cC7ZexG/tWSpTs7eNldOcs90sU3gbUg/5oqLqb7kmEbADWXQMgC3KHJmbxhetsryM/etjr51ugMWDM4ZvGT1eGtAq/cJk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788271716; c=relaxed/simple;
	bh=colpSvQ380ywH2w2lEES0eevoSl8wWJBS0QAQ8Hjf1M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WDyv8HW0fsYDo3jjyo6Z1YSLmCs54QqqiDopwfr6bM0lNlx9ngJFNVUfJH2vdN1wRrZhpegTHJruKCaHzKuT7CGTSYV26ghOR+vlfJFDQFGYCiyy+HIVr9YYUZJqxwoaHxkJ4JNbFawPKPFz2nU3hJboumV9UyL9w2OAbkh6s1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kgIepFhy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aRf6FOKd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kgIepFhy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aRf6FOKd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8YfD3495533
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 14:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Oa5JSaR2HXZbUmoPEdwIB4s32xvCS0qi1Pl
	yRPcXY4M=; b=kgIepFhy1XHtm0FYuPNVqACvHfAd8lpc129/YWZ0kIP+tvQ/MDs
	QpXkSjnSAS9TgmamOYXzRjoRh/34hn5xFIcvhxjAeJvBRruXqynT3+s0BJxgBVbK
	aDg21qL5AxhBhmgoix+HqsA4ifWsbRATbzG8I9enKZDB/WgessrYES1khb/TUfeq
	CBdnTd97J/1oTw94F8d0NwboA1NGyr8G1001ss4vT6wo3nsjEsiEFrr3V8ikzww5
	OtSAuPmUwtVN6RqCIGuMve+6Xq63BPQjxptYqTLlw634fzqz/ntGKcyAnKIezbR5
	jurnC5uJn0qDoOcA/WJyJ6Dte4eeNRdRFcQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdy9ng8mh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 14:08:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso5024452a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 07:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788271712; x=1788876512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oa5JSaR2HXZbUmoPEdwIB4s32xvCS0qi1PlyRPcXY4M=;
        b=aRf6FOKdm0+NvWSv6U7O1pgrjnbo4kIjswr0zGXukJ9oY1uYVjzCte5YN6St/OtwKk
         MXcvOTjYYEvs1ax7/Pp4HrP37rpZ8+Oz7W4OvirQSExRy1l6y4qjoSH08N2/1p0HFtG1
         up2yRRt3aLmgbyH5OkgtR1FT9C8o+TNEzVdtUaBpfxNOb8fVfunwU+pWylGLzY1+y0Ds
         Yq40vsK5jXwTmdfA3nDBE1UTh0M8mRYD7iqW2bSJqjFL5GTBjPaHW3Qhk3bhAt0Kztzg
         jQqixRls49rz7wmLad/uHaUI91KLDlVGKcwdZcbxbvPanCUIiLCAIU90f5hV1Zbon4Gt
         I8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788271712; x=1788876512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oa5JSaR2HXZbUmoPEdwIB4s32xvCS0qi1PlyRPcXY4M=;
        b=mbAWjur6kzH3c9W4qbY537a0WazMFKCpETa/iCwoXEHdiIMJbqMs6CTaLNeOv5tDC6
         bbRn8sWLkYtk6jI6ZbL1Zu7ezrmjsEZqs+I+RDf39COf3bGSj9SxWUFSpzHR5vg6XOPa
         fdWjS5zFTFR6CQ02tNHSXTpebTIpsxKhfy4+dOSmvrV5HcfcV7E7IT0BMJxJk/4t0KDd
         R6OE8I2xqeozLQVn3EoX6E/7Tx5GShVQDu2q+xXLT54wPazhNAfzRYuL2J67hI51bG0c
         1NuE0++829mWcvweS5YHwdwoxd++ZuiGR+Z4abS1W9+1X/54pG4l9qaVTZRcjxYv1p3f
         szHg==
X-Forwarded-Encrypted: i=1; AKwUvByR/jR7b9+L4wCXknr5aspGrZiSlwypfalQ4Y1KT1M7AkkCExelZ9CHzilGZQ7k6ikkN9bbULajHW99JUzs@vger.kernel.org
X-Gm-Message-State: AFuF++k02w4EeLUbFUXeiLx+cuP+OxTFzrzs778I79qfjLIWjqy6/YeI
	GApV8tQDr6f3oR/6emuieI1Y3k7vonw4SmNdx85TjNvuhNCRapb0Pj824S0PAOQW4585lbSqU10
	2dS2Ri2mDsKLHHRZ9Dw5D+IEcKZcVdd94lG1g16vpU4QhHEwbpavC7SsGHYnUcUu1xO7L
X-Gm-Gg: AYBFou1F6dc9i+bWNUQkPVEw8uiqiDnWGCiDwEdQKsfyojVoukx/d73O1ngtFcxGAJi
	Fd1icOtJzNvBDNaxirdekTFTrRwESC7hUc8T82T0lyXImX9In1tTSpU34lJMPb+T+9CzfspO4HN
	J40nps5jLAPzQXBaUwyS5NsJKxbGw8DHudpR66GQSZSBx9iHAXH+Msnx8Q7XqTwxIKjQomfjF1T
	3iAj6orbLbGQLUQp4r2RAGPXj1Relmhrxasc0qVj3kKR4ZZUF3LWC65tmKhoGBeMRv2wTkh+NYH
	JS23yFSknwCcUrOVuxSDu/XUQHL2CiuZCE/euS3rzXW7ZgxJmAlSypn/Se8vibVKXdKqBADoZiq
	ErKMGKFz3Wah6ScJ7bNJBwDL2Awf9Uxpgd2a+hrqZKagkI72jcHnuvuoVLq77
X-Received: by 2002:a17:90a:d887:b0:392:b509:b1a5 with SMTP id 98e67ed59e1d1-39907e0f87bmr12734709a91.14.1788271712096;
        Tue, 01 Sep 2026 07:08:32 -0700 (PDT)
X-Received: by 2002:a17:90a:d887:b0:392:b509:b1a5 with SMTP id 98e67ed59e1d1-39907e0f87bmr12734531a91.14.1788271711452;
        Tue, 01 Sep 2026 07:08:31 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0bf8a13sm56447342c88.0.2026.09.01.07.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:08:29 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: arm-smmu: Document Adreno SMMU for Nord SoC
Date: Tue,  1 Sep 2026 22:08:16 +0800
Message-ID: <20260901140816.74200-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEyNSBTYWx0ZWRfX4lwPVJcGU3NE
 oUTniGa5QnSv7Jdb6usk+2Y5/BXCdCcPSyVCfOYSwLc3mUnszCit5AXAYQTISsE73tTlJRB5/7q
 YX0k9RKQRT0WJwsmoBS954t/w+qICbQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEyNSBTYWx0ZWRfX7bLVxcdOhfFP
 jzOQnv60iT1QDArMcDsQrgQe2rdPBYmHeTGOTYKAiq2al9h6qvNy0KROJJa6mAiB5kKM7X0sAH6
 rJhGSl7OWOiFxQpwoRxHK5NOSzMkbnII6026FkOz99VkRG2vwnnW+/rYSndTJTb0nTkNdLcczrA
 gkSDaaffmwdj9txuXgVljctRLidp7TtnPV9WX/J8WzgLv1xQDudGhqsLI8dEeAGWosunb/lSVmM
 WugfQc1zrrNYfgN0dM79fuhB5m2jXViPWnL7vrA/eT7hTwC6FXDOJTErn1kuBS2lIvbpD8O5Gy2
 V31Q+my+ZucyH2fFuXcCr1dVuan7Hjf8XlMyUaIzVimoEFB0nscLuyeiGrOGLDYND4J4Xk9trad
 1P31e/ZITml5RDp+dLddxmY90CI3DRfBr4m5+A2IOqxsw86oCQFs2sRKgze5PK6q8ue8DJLpElT
 GpN8aPKkxkx/jldiE6A==
X-Authority-Analysis: v=2.4 cv=e/02j6p/ c=1 sm=1 tr=0 ts=6a96dc62 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=W7vQhCiC0Tbq709-ndwA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: XODSM4WjgUfjjzXqM20uncQs8Ooy-G_C
X-Proofpoint-GUID: XODSM4WjgUfjjzXqM20uncQs8Ooy-G_C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010125

Add specific compatible string to document the GPU SMMU present on
Nord SoC.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index ffa33b7f4a96..ea338d313c05 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -102,6 +102,7 @@ properties:
               - qcom,hawi-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
+              - qcom,nord-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500
               - qcom,qcs8300-smmu-500
-- 
2.43.0

