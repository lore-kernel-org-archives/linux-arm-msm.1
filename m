Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70377384CCA
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 19:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784574225; cv=none; b=WWbhBUTjx8pEsb86EndJe2yESmTho01NllpxAqn6nJxJFXDyj94KMDFFr8RIGaphocsX0OuVyjKk6yJuLD5PA7q6jVKBoBlfDLsBgFGwKagRAug7kV3A2h4IT2Fh88f1aFzNeMBIt+Fk92S8hZ3BG2N7p5fesHP2K+RR49wshSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784574225; c=relaxed/simple;
	bh=P3qudtq8aL5VayRLTwk45JoQ+Pok+bOMfhCUWilcNIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VTgveDu1nYOhkVqVmbFjifI/Z3FCQ3jsD44TJ98qcRh0mkjT4hIlDcI6HMBW75E5rm7W1kR6b1CVennOrggkkqEZMVC4OchJsk5Uy+uObUvsxycqtmSD+ouWHROJufNhLD5bc8aN1tW6NZg1BARXcUFT1NXk4PNMWN9uYZtEbdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p1lZnIVF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X2pmu3Jx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p1lZnIVF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X2pmu3Jx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KHBsYP137399
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 19:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PuWa4CSJ71smicbQ1SN4Kz4bDAAQ4V0JRNi12E/BNQ8=; b=p1lZnIVFhxCOr2r8
	FwoScd1wsjRT4m8uBZ0tWMo+oovPVm8x6t/HCmP4KYw44iVRBlHpGGGjfuKx5IbS
	J8nYmCtjfQ0ZfS70yyautckKqMe5qikKvg8Xn2OB6ayjpi11z8KO69KJHVpVqVEs
	8xVq5gysj9paRKCOAOKvcm1rB9zLzGxnO8aURJs7CDcaydynPdhjyxpw5hgx3lG/
	a8VwGL9daqjTVwKnc6lCwnz0tIBgN/WwHeMt+bEdQdq7PXvdEDwRuJo7vtgU2t4p
	85fJITwJ628o7Z7rvUdHFczJt3FtgzDCKsrzMtMmvz98uGjkZoybboZ4zdtf/G9U
	fEySww==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5rf53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 19:03:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1eb52e1fso91068621cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 12:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784574223; x=1785179023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PuWa4CSJ71smicbQ1SN4Kz4bDAAQ4V0JRNi12E/BNQ8=;
        b=X2pmu3JxSIZ7zwIfsZFD0nIjGXEltTQDpT64/LBXd9ogzOAvWCh9owtLvKCL9isG6a
         9y6wnX2NaMJxW7yXiWI2RkGtsrWvg363ug0BIfhFJLJU6g1/z3FdfK6tmgdtyyQXblUS
         gfX9mld8yXSRw23fwo8zKiLmhCDEXi2ua4OfLScbKNEkFfoqfnW7MNdGADuMAHIaJhcZ
         +OyKBhNwzm7WlAIYvGmHY2OJ3FHWu7bJf1QYuicr4uVFkBRdkSR3f4T7oZPhuyCQLqih
         2WM23tRQE2sUqhN9xPowUtOvc50uj6lmr6B8AFSYyZ9mgKlKSdj0fLj+sX01YUWHs79Z
         0QdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784574223; x=1785179023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PuWa4CSJ71smicbQ1SN4Kz4bDAAQ4V0JRNi12E/BNQ8=;
        b=SpBG/aYfJ528NxCEkKzUw7f+uqUrQ7ErTdZFI5ex3cZeqsZKVcMu/KbZPX6wkXJ9P4
         CEw4P0+tb9BdeG5yQocPdhpfnIPr1aa/ywc3zpEbecA25GWPJB9hAvsa0O+00jEFS5t9
         A0M4YcouaUG33Z1sHqlxxEV66z6kuh80aY2knlFiKwzbOJtQuTL7hLW11qRMg6j/qnMD
         tmg/8gp5MmJOLiIKfKYAALGS0YP3Ec+RMvB/Gq35dmxvYTlDhmENw5v9NBZSgspY0e22
         W+jbWDBNIYml20jRLK+auwDLggF2flfTxQ37TsXO19prJBbHNNx61LUkUw+W2fWBYrJe
         0POA==
X-Gm-Message-State: AOJu0YxY5q41CFXRMQBkuGZxMojLGPHRd+ojbUdV32juWbL+RDDdGyCW
	BONdhY/osyhZMGw6W/UcqOXQUh9AbsKgt1YJFmNaZBBPvvJfw5+sVpOIj4fooK63uggj5RNzm/m
	TRGtl6u6E7PZadE5zJppF0Mf+HTbv+GXcoU6A3Ha37b1YqqFEqv9VKDKrcqqpolPzSxmNA0I6lz
	Y7
X-Gm-Gg: AfdE7cmIq2vwYPrZ8XFWtgh1fW50ZdtLZnbVwUKdcvrnGQlYo8QucOQlr+q6X7eHdW+
	UW9iSUGf724CFgf0RTOMBQkSQfqbm5UwUQu4yMyixt8Mr9rsFgu59VX0Gf+r3z63uldC/IOqfrh
	M4snfrTZSW2JiPlo7ttK9F20IfVSVvUSLE22LkeIMyqzNwmC0wmAHYoj4iHc5wxPVWxhNVf6AEJ
	bRlEbs4bDjnHuCkugE7aXh3YIErDucEZP0ByWhjqjX9fvj89JXB8pb/+5koAqRG6FFNFWEskIZw
	pDuYxkh8aeOATdOcAXnBlgL6VUWDA19DXHgNMznAgB/aGmdj4N0EVj+YBzkSjUDdRwaYUNaSnqz
	LEtiIw8g8zw6bq/H/T1naA3ht
X-Received: by 2002:a05:622a:5b0c:b0:51a:8dc5:bf89 with SMTP id d75a77b69052e-5213a383538mr134376731cf.5.1784574222727;
        Mon, 20 Jul 2026 12:03:42 -0700 (PDT)
X-Received: by 2002:a05:622a:5b0c:b0:51a:8dc5:bf89 with SMTP id d75a77b69052e-5213a383538mr134376321cf.5.1784574222376;
        Mon, 20 Jul 2026 12:03:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954aa1a231sm181509845e9.1.2026.07.20.12.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:03:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 21:03:29 +0200
Subject: [PATCH v3 3/3] ARM/arm64: defconfig: Drop redundant Qualcomm
 interconnect entries
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-interconnect-qcom-clean-arm64-v3-3-942e8ee7ebda@oss.qualcomm.com>
References: <20260720-interconnect-qcom-clean-arm64-v3-0-942e8ee7ebda@oss.qualcomm.com>
In-Reply-To: <20260720-interconnect-qcom-clean-arm64-v3-0-942e8ee7ebda@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2338;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=P3qudtq8aL5VayRLTwk45JoQ+Pok+bOMfhCUWilcNIU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqXnEFmk3ZaxFirB5xz6i/Pw9DZ1VgvyXjLIt34
 tqnNQYkUxeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCal5xBQAKCRDBN2bmhouD
 1yXjD/4mBaoS1yc+FLKpo4ORjSJV/YHXAbA4lLPhLCDmemdak9rj+o8HJ1ux406sL80xDANWdoo
 5EwFysLADJzOKLqQhGuHtXZ/TdIwu4to+ICiMVkA8rVBkQIt85odqTQu3oJfSmdRB9/ekLcn3Pd
 XRWHdvJeZXOOaizd5YXhZJ9LUCJajDs4mFuqt53L+xxNdydIC6iYoXQse77AEdyCb83gw5hV0SG
 rr/eK17QkeKI4LbUNPxJf8xR/ZY+1oPAr56jalsE0Ur2NfUvqYsquJmFN8Vmyq6e2haOiKzsPTS
 tu2HJwEBHJze5Y670SLOHaCUEntp+SB15guCTosHIhbC3Y/g6tylka59Bd3tYQS2VdG5iWnD3uD
 g5w55OREhD1DwiqXqopCWLMYIVabxi7LJQIKUcQZ/72SmrS63R0P1XTq4QoJOJJQVlQpP1ANqYu
 NUjm/HJ0fS7Ohw/V7vA6ZdeF5G+UeNa3XCuuhCIhQdtAGf7yn2x7+uuPsAjtO2eRt+MVHwSR4YZ
 YqriIGZAz+LeiSBupq8x/nUIILOZOYzq8Gnjc1KGANXQYWwZF7cLyz5l/nZ80epy5ZlsWevYTIR
 SMDRwhBZL0CyfIvAS5mDI+j/GyD/eeq0hSUjZyRIcpa2+UXqYsHEs63asMnqH/l/ZOI5WkZ+NQK
 GStxJDBZpEHoU3g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: OFjGwPHUuPQM9tBviqwP6pTbcaCcE3pN
X-Proofpoint-ORIG-GUID: OFjGwPHUuPQM9tBviqwP6pTbcaCcE3pN
X-Authority-Analysis: v=2.4 cv=e+U2j6p/ c=1 sm=1 tr=0 ts=6a5e710f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=YAWiFM8ZlreF83lw66sA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIwOCBTYWx0ZWRfX6p1q6EFfxyJ7
 LeorGcWM3JKrzLIyFTKyw5XGY8DePmT9viJapUpnEdq1g6oFhTjVhakiUi5EosaU+5J2oW3q/rh
 BzFxOk5vpHRGMsYL85FjbG79ynM5M24=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIwOCBTYWx0ZWRfXwR+HqJwO0qpF
 Ah9N+dVfUoC1FfHT24wSYZgqlCsXsRLBzcXVV5vDAJK7UfyOs1UG7C+KKa71Jw5KHh6tM63K4s6
 qRfH6apP7ByOhBYfXNguvfM3qJHrybn2BfPiePBZvyE6U7hJku3qBPmnODRj66qa6Y4y8E0A3pp
 m2XnJSiEW1bBR4hnp1lJa0vi0GKdQA3iTerGCNdB8WhPSfibxiKzBH8NfdpDDnStCf1vyv20pcn
 5EPzT8hWVlvKA0AgAenMB6ky0YJGdRl2ieC5Rf5d0ahMR+h6kP3M8XoU8y49xUHIOpPPFWpX5Ez
 Pw8pnPkWTRWwAgMuwVy7s6YIyOAQ4ZOzj/M6ltMvsPAutHzjAvqOfasb8Tnt9sxsVeFqjSIq4cK
 xVOVRBs+kSSdYZG+kUeA4mdBVUPgMlfJHeMcvH1G2/ZtjC4bwaCWJwTjToTDKqQjji+lOpYR1Ls
 S0WNz7FUhwWVhLIqc3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_04,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200208

Drop all drivers from defconfig which have defaults in Kconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/configs/qcom_defconfig |  3 ---
 arch/arm64/configs/defconfig    | 31 -------------------------------
 2 files changed, 34 deletions(-)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index df0a0ce5b097..630e31c036a9 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -272,9 +272,6 @@ CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=y
 CONFIG_PHY_QCOM_USB_HSIC=y
 CONFIG_NVMEM_QCOM_QFPROM=y
 CONFIG_INTERCONNECT=y
-CONFIG_INTERCONNECT_QCOM=y
-CONFIG_INTERCONNECT_QCOM_MSM8974=m
-CONFIG_INTERCONNECT_QCOM_SDX55=m
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT4_FS=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 91a3b2cd10b3..b11040fa9cfd 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1863,37 +1863,6 @@ CONFIG_INTERCONNECT_IMX8MM=m
 CONFIG_INTERCONNECT_IMX8MN=m
 CONFIG_INTERCONNECT_IMX8MQ=m
 CONFIG_INTERCONNECT_IMX8MP=y
-CONFIG_INTERCONNECT_QCOM=y
-CONFIG_INTERCONNECT_QCOM_ELIZA=y
-CONFIG_INTERCONNECT_QCOM_GLYMUR=y
-CONFIG_INTERCONNECT_QCOM_KAANAPALI=y
-CONFIG_INTERCONNECT_QCOM_MSM8916=m
-CONFIG_INTERCONNECT_QCOM_MSM8953=y
-CONFIG_INTERCONNECT_QCOM_MSM8996=y
-CONFIG_INTERCONNECT_QCOM_OSM_L3=m
-CONFIG_INTERCONNECT_QCOM_QCM2290=y
-CONFIG_INTERCONNECT_QCOM_QCS404=m
-CONFIG_INTERCONNECT_QCOM_QCS615=y
-CONFIG_INTERCONNECT_QCOM_QCS8300=y
-CONFIG_INTERCONNECT_QCOM_QDU1000=y
-CONFIG_INTERCONNECT_QCOM_SA8775P=y
-CONFIG_INTERCONNECT_QCOM_SC7180=y
-CONFIG_INTERCONNECT_QCOM_SC7280=y
-CONFIG_INTERCONNECT_QCOM_SC8180X=y
-CONFIG_INTERCONNECT_QCOM_SC8280XP=y
-CONFIG_INTERCONNECT_QCOM_SDM845=y
-CONFIG_INTERCONNECT_QCOM_SDX75=y
-CONFIG_INTERCONNECT_QCOM_SM6115=y
-CONFIG_INTERCONNECT_QCOM_SM6350=y
-CONFIG_INTERCONNECT_QCOM_MILOS=y
-CONFIG_INTERCONNECT_QCOM_SM8150=y
-CONFIG_INTERCONNECT_QCOM_SM8250=y
-CONFIG_INTERCONNECT_QCOM_SM8350=y
-CONFIG_INTERCONNECT_QCOM_SM8450=y
-CONFIG_INTERCONNECT_QCOM_SM8550=y
-CONFIG_INTERCONNECT_QCOM_SM8650=y
-CONFIG_INTERCONNECT_QCOM_SM8750=y
-CONFIG_INTERCONNECT_QCOM_X1E80100=y
 CONFIG_COUNTER=m
 CONFIG_RZ_MTU3_CNT=m
 CONFIG_STM32_TIMER_CNT=m

-- 
2.53.0

