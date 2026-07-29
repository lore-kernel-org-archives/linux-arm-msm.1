Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763273A9635
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785316546; cv=none; b=fOictbsZv7pEipxOfyvryiEO470u55h61yJyLJNhh1S6iOiHlwJyekGFYk9+5Tz1id4xDoH5Wv/ZSBv6+p/8gPQsCF/gJaCSx7QEt/0N96uE1NyAxM4/wDtGkSbnPhj8HjiBGrKH1/6KaUyANBrtVvn0aJx6/9fqY6t4gZEama4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785316546; c=relaxed/simple;
	bh=+gk/e2s11EeVbRrSRAUQ248g6TladWdS/ffh2QnUg2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=n9sy22nZ/K4kCs4afQKEE8JjuDFg0ru0didJWcJe61gn1JjzaXYWzRVgCsHtvpk3+nrgOoZrHVzlXuDiSRkJ5tAbrALCnbrUAZPJSEpP/Nuyj9q28W9hCW5Z+shYhgjbrIhV7b2VWDNkIh2M/wB/H/nCm7ue58sxa5eCm9a2FkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lXrETC1m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PDNm3x3f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lXrETC1m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PDNm3x3f"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7fWLC1054062
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jOp5gEZNxv1g/4EpEpBPTe
	E6y94T1S6TztjglZW07QQ=; b=lXrETC1mKl7OFJK+v7DYK/NvoDOKDbFtE5JTtK
	yU8cIAqgG71/9/g+8qYavzd9bNKfj4LUDLFpC/G46HfKFBqd9ETyXdyffKIihIPx
	ajWuMeYafQC74OZJWz2CSFy95KzObGfeq8r3cxt3bt1NfbP3+/KPD5YYhKLpEy8T
	NTYA/9u2t/XUpBQHJQRVgfhAtlldbqtWdjKjlq0X23jihxIoYZ2tAQv07rkJib4X
	t1NS6PShCp1nNHAEfXl0cwlHxdeC4ZaZwjHlCi7S2jkIonh/ZnjD7+Ahv1CPfbzh
	7cq/Cre3xL4r0vDf1qKk/zLW83oqp00QaGYADo9g3A5Td50w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqa30151j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:15:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso801352a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785316543; x=1785921343; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jOp5gEZNxv1g/4EpEpBPTeE6y94T1S6TztjglZW07QQ=;
        b=PDNm3x3f+QPBwEi04FstiGAg2yehXaKbU28uFe/duuzPKiKc4UA6qBB5L+Y8rdACFD
         jSg60eaNsRq90HLB1BJBbvLLDuzj0HKNaZg8oXMlg2c1882fwa0b0wvOXGJwWbGheRpq
         At+2FTpHt7zshTpuqIcNLv2njWptoJ38stNIVSOfcN3pO1Rphpo3+uslEM5zlEJl/Zhg
         f8b6ioxOD+yk646W4JrFSi9S5pbY235EWmXkEOpRhFXIlW4s3ulWKeVutmasq3BKp6/T
         SnIzdYwon/dLCGo4vZLO5ZgZZLuCuaFP+2UOcnfFM5XMVdX8rNz+c0gtEFPWvVwNTelH
         jq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785316543; x=1785921343;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jOp5gEZNxv1g/4EpEpBPTeE6y94T1S6TztjglZW07QQ=;
        b=ZE2cpYkV3ka0a3ZEsAa7f07K08AlNyWDHUjW6MDb1b2dLf8VWF4mF9pGXcYo+O1EgS
         w970XCC9lIalDB9HWR75qa6V2W31iksrNiiihjFuZBz8BiOWxyCopmlCZNf7LJrP3ctk
         C8vdvEqyS9ZCTvpzqK6SL6Mjq73OFxJECC/g8jLicXLPS7NRh6afbX8NUIFqCWe7RbMI
         qhcX0/Z2YSRNDlCqTHDYKz5TlcH5PGj4w3+LvtVLqVD9DESBfq914NEF8kzH1MS04dzj
         kwlVDSM8dlprCNddg2mEfqXEAESVnB3RNPT8/LOpcvLOipTaA/57sM07ELmAlB+NBj9B
         j9rA==
X-Forwarded-Encrypted: i=1; AHgh+Ro2G7zPcme+q/DPg4rZ++IyxmRm+/lpFk/ZnzVuqJ0TKqpLV/DhmJqS5tTtEBeLNjyj8Dgm5CVdL4vGPHvJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxJxgbP/uXwN/x9URgojXQpk5LU9rDgaeebitu8amEz5TQvVFpZ
	ZaUKU3sjwPf6UOjtqVnLZwSfXbOt0T+z+sb/46M/Jq4LclfxcOWOsiZltse35tdPwPAI0wGsyJo
	h9va36MN9Q29ZIa8s0eC8NE61kNOsVBLPgYxZLL9C9gxhtum4CUUAZU1izdJiw309ASNs
X-Gm-Gg: AR+sD115KRmklxVTE66xpYZu8JInMhhZYGsVlnTUTFN6kqgcSClSq1DKtrZGatGDvVz
	/JmnjWV/ifJj/cxez6KBI3UYVwp9h6A6i+MfY2d3bskfu+aOXdovmLknXqiKRSn0U/tXp/6F5/J
	TCyagYvppRKinpFylX0sBfvswPnSj8C0HOKrA4yd1yfFhVJin+jmhjFdqCzUQTxxoETC+/nBS37
	qgUKMEBer79s41mEZLUcjrzQyYbDn3ns4fG+7CjriyVbfwGj8gcZ5vhw4VoPwLXioFnz+nEBn+1
	nzUu+ClBF2d5Qd3EO47bCpA6Nqd7zW6QIG2n14qIgMYNNyEJxLPQILRwVRvgL/HQMYL3xQXcCFg
	XvhPvl73aBFO++0uburjJoaGBB3SUaOFVFxz4hsqSDg5uKl42gXgBitY9M1y58zDAbIcYVD9KlA
	dCzZvX8cpUyTam+tUKnjY812I=
X-Received: by 2002:a17:90b:17ca:b0:38f:1f8:1fa with SMTP id 98e67ed59e1d1-38f6a471bf4mr6111334a91.15.1785316543238;
        Wed, 29 Jul 2026 02:15:43 -0700 (PDT)
X-Received: by 2002:a17:90b:17ca:b0:38f:1f8:1fa with SMTP id 98e67ed59e1d1-38f6a471bf4mr6111312a91.15.1785316542826;
        Wed, 29 Jul 2026 02:15:42 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d37368sm13585089eec.22.2026.07.29.02.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 02:15:42 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:45:25 +0530
Subject: [PATCH] soc: qcom: geni-se: allow selection on 32-bit ARM Qualcomm
 SoCs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-qcom-geni-se-armv7-v1-1-cf90f050cf0c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKzEaWoC/32NwQ6CMBBEf4X07BLaGhBP/ofhQMsCa4RKFxoN4
 d8tePcyyUvezKyC0ROyuCar8BiIyY0R5CkRtq/HDoGayEJlKs8KdYHJugE6HAkYofZDKKAtjJY
 SbYm5FrH48tjS+xi9Vz/mxTzQzvvSbvTEs/Of4zXI3ft7ECRIOMtGad0Ybcr85pjTaamf0R3SG
 KLatu0LU5Csks0AAAA=
X-Change-ID: 20260728-qcom-geni-se-armv7-f7b311ec9e63
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785316539; l=1403;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=+gk/e2s11EeVbRrSRAUQ248g6TladWdS/ffh2QnUg2w=;
 b=9GPvySPRwzCMI0wzRHgGeXcOuNLIg0GhuXMgDoOVNliIPgcvE0ujoiaZvu7udoNruKByW206t
 u7SgxHVfiy/D0932wrevHOU8BzhiE5njZvRKM+E0vD22tQwnqROW+x0
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: T-U9Z-HnnBGSKj_7nwiyLpKSS3CB28ai
X-Authority-Analysis: v=2.4 cv=EME2FVZC c=1 sm=1 tr=0 ts=6a69c4c0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=EBjTWYSWYZ8WbdhEkYwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA3NSBTYWx0ZWRfX33V4jqI0wRo0
 ouWbQDLepmvG28GHjdOPDtFJgNjXChZ0qZ5gjLwUtgwAu1x26xRCsGfBOrnYqdEX2qenFc2J6AF
 9IzTfeq3zIRfTVpnqm1chRq51Fkd59c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA3NSBTYWx0ZWRfX6OkMninOsPo3
 SyWW1jWthn8sXUS584xQ87MdStdc57nY/xG8GgzWMW2lrM0v8mo8qejteoUWfA7bOjef7qI8YGI
 fpNwE4LLjVT4KBr/RuQxhxNUzKAXMX17s+4wI8WveVLwmyxsxJYeeR2B4kdnCT+FW4T1LFRBe84
 Z11GRhj27b2ozWtGG1d+NQgMe0jG6ez6v4VnjTCKtmIt0sWx1h1faA2Srf8E6F4mDaOxUFfhQym
 wIUJ28PNQOf4JeiznTd4EzYI/fldjDEhquuAjHcKGh51TU7kBKmGHvLdIMC1SjRFFhVKgW0j6Jp
 rdzfyu2hFRkvE8p1v1mPR0t+hsoXZ6p8864u7bCgViXPj7RUCaTz5+9xLxH7S5Vm1A9Ezx2CWB2
 yJtHu7rOJrss1Py1C3qUOGs0EHJpiOX15dLzCRApXVbHN2wPOWFCaFyRUcS7nEAc2RFprTFlxZL
 Ci9RpznTZYSa10BowVA==
X-Proofpoint-ORIG-GUID: T-U9Z-HnnBGSKj_7nwiyLpKSS3CB28ai
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1011 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290075

Commit e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
tightened QCOM_GENI_SE's dependency to ARM64 || COMPILE_TEST on the
assumption that no ARMv7 Qualcomm SoC uses the GENI Serial Engine
hardware.

Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
wrapper for its debug UART, so this assumption no longer holds.

Fixes: e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://patch.msgid.link/20260728-qcom-geni-se-armv7-v1-1-41d233db3b96@oss.qualcomm.com
---
 drivers/soc/qcom/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index fd4d4ecd2df0..5b3c9d31fd7f 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -39,7 +39,6 @@ config QCOM_COMMAND_DB
 
 config QCOM_GENI_SE
 	tristate "Qualcomm GENI Serial Engine Driver"
-	depends on ARM64 || COMPILE_TEST
 	default ARCH_QCOM
 	help
 	  This driver is used to manage Generic Interface (GENI) firmware based

---
base-commit: 9c6fc9be717cf3558710a958d0d16ab9c39314d8
change-id: 20260728-qcom-geni-se-armv7-f7b311ec9e63

Best regards,
--  
Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

