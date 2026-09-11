Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CDE35C692
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 14:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136474; cv=none; b=Xhcw03h24w/kHnhgwthsV5ERaZHv0sHqix04u7szV25p0HYh5po7Ts5F6XsNvu2fPUspJhXKvUU2X9sgETACge0aC0h7CngLi7Ux74PPe26s/Vtrw9yNELVCBJutyuyl4uzJi8lOEiwv3726uhm8ziEFvZGEa07qVhnNDfOaMSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136474; c=relaxed/simple;
	bh=BOTzSHBVyhqvDjlvFvqw3Zdmu5/vzVG84AmyMcCiDf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q5xhlHUW6w5c2pdozP4zx1ofyjzig7gou+FkITWICBtQiGXgVDLRUncf0l4UJ4bss3Bgm2T+mCJW4bLswkvssQHwRylYvL3+SiIELilMMk8MwYJZQCGLgEAzHsEFAvFvFZjqhNUZaWavv5LRJKJR4O/h+WqsQ+yDw9Fe0nBnv0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JPxXoWol; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PdZMfj2c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JPxXoWol";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PdZMfj2c"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCiruo2978637
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 14:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vNrBsY1KmFV
	0eVNZ8RefljSRUWHCi7H4Prg3Fz5IFwk=; b=JPxXoWolDJxs5jyDVEg20nWOLXh
	95ScjEYo3ZMRUmcpLiLJfQ4oKJbF9ZIStjLTpqK55LDRDvaOgUVAlP+TL/1Y6EF0
	U8Qb72aXVb84P8hBFsiPqV5rM8YcnOLSHCayfIW8VjY3SyIWF/bRQPVwLxKrmjlI
	bm5XKb828E770rf4iad9zb6Je1SaGp51HL4ncuDXltgOxjHTtI9vX4AmfH7KW0ND
	kzKYDVIkFaVkvcZFpdOLWi0D3WSTCCFSY5Nvdwk39+VYnO7aJMcjuGHeiINptJ5f
	4e0oC9r/yC5MhZYFsyAS4RkXBUCgjqTOPFk2u2vYy8V3wFNie0CeLxI17Jw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm7ucjvn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 14:21:11 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-881a45f96bbso13176547b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 07:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789136471; x=1789741271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vNrBsY1KmFV0eVNZ8RefljSRUWHCi7H4Prg3Fz5IFwk=;
        b=PdZMfj2cFxwwmlXSfMhv0ugrx34f7+XiBMBNJ8ITmeyFrEL+UdJgw0U/ZhzORHLh1t
         42TOPTk8eNwz8VWLnAhKdtDWYbEb68Qcwi8lCQsAgl3JLavrCgzxUZlIXxxY3FpgUEoQ
         pYiv+ADAzvv5JwUE8+yODRQP26sq05A80IGUCXx2kD1zFL7m1HpXCo/NNPM7viOJiF8e
         1g/x8mCauAxo0Vvk+AosVNBWbonBJrNasa9KSY/Gz4bZx/oeCUwy8qqR40gvj9IzwlXQ
         YxExDWVGr+edaE0ECdXqglf3XTO7uixP8U3Asbnzmxx/mk131sxSCX020UunOgOOziRt
         PjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136471; x=1789741271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vNrBsY1KmFV0eVNZ8RefljSRUWHCi7H4Prg3Fz5IFwk=;
        b=cAe+QHi11DZZBrND5/J3soaiRt9Rh2Y+wdc/lx6lQ18Uo0ZaJFK95xVgAGHrmaEZ+Z
         W4Qka68Pb61/+eZfEglUz6sTehvCVGTDVdhlA/6yykkrA8rvfXG9sUHAuwhZ7fpyz+WE
         lY7c06jxKfxKb0HuPYodIYscGExo+93KJB63jO2QOKvGCRiZF4B8nWnGRec/4vwBhWQs
         DMZPEyyOOkpDnbwzmmLTyZmK1twsWJAXySxk3M8+ObyQHCPx1TX9OrOCLw3q7k17bAhK
         mhRz6uxWLLQOchR7+dAr6vB9H+plVgVk/1ioPkc9dg4RYVBY7sqjvajwlBbtuIeHOcGy
         upeA==
X-Forwarded-Encrypted: i=1; AKwUvBx8qqycJ8V5NX3H34QmptasZ7Gz6QoldAxy2NLraiXGADNrrMUPUNvk68gKbgPs+N+bSh4j+QYY1wPg5djQ@vger.kernel.org
X-Gm-Message-State: AFuF++l4erp0PPW+rkgOeQfCraWazZNnRD1oHd2hx/jZzchelSunhU6f
	rq+xDX/LjuHwqlqlB38ELXi6g+j5T487jPCoYV2D2fLdcSh8Iu+a+UPjD3BdUkqX7M9rUcEHORA
	yrkLVrWUdpy74kiKd/hOyamg/mncRLcH7MQCOT16cfic/VBk+S1Wlrxs0WH7+x8/HbeV0
X-Gm-Gg: AYBFou0YoztypjFSiA21QJoROb2M0AYvtl20kTTnTcuXYK0Hb+Kg5sBjOBVLaSH0bt3
	RptfwRnHPl9O94cJVGOZi01znUne3mk+cr0/OeO4a0OU4rZ0uEhVA2fTRXolkkrlCgnQbyrB2GC
	fbVBwZcxfMiQRJPSrvtlSuz/NcFnh5KoiRtlhTkgOgYErqqerrTTnekMJMs7DUK6H7DUTMXMSM3
	t7OmU64nwuUuts8Cyw3S9K2g53UK0uVAfMJsXbE+Z0DzngJS5DbnwAAVGAXOovqVBqiI3dOE7jJ
	t7lO7Ebv5GBiNRWu79RZDigRLsHHDtb5C4upgiazdNpC6uH0snIqW31gUWRcOPNXQq7A7tFW7tb
	CHDSLpB8MYFLpaq5pWqakpkWXicFj41nQjqAw5WXPtlqKsLj1nTnG+OEh3olT
X-Received: by 2002:a05:690c:3489:b0:885:28f5:66b8 with SMTP id 00721157ae682-88528f56fd9mr7614737b3.60.1789136465691;
        Fri, 11 Sep 2026 07:21:05 -0700 (PDT)
X-Received: by 2002:a05:690c:3489:b0:885:28f5:66b8 with SMTP id 00721157ae682-88528f56fd9mr7614477b3.60.1789136465135;
        Fri, 11 Sep 2026 07:21:05 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-884895001fasm10483237b3.45.2026.09.11.07.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:21:04 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/5] arm64: dts: qcom: nord-embedded: Fix i2c9/i2c10 pin functions
Date: Fri, 11 Sep 2026 22:20:36 +0800
Message-ID: <20260911142040.100263-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O4asLx9W c=1 sm=1 tr=0 ts=6aa40e57 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=asaw0DWA8FDCBGCi_ycA:9 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIwMSBTYWx0ZWRfX8cEFcxKIHb1N
 hSOGK+nFJpUMVfsyh7FOrAn3tPoOAzJH7sqHSJap305so9EOkdtqBAyY1S7hlfYQm89qMVtR2uy
 VNX8GBYrdreljKnzVC+krMpFyr2CEDxnqRNbRtOkTqTM7CJlxfEQuCAaVvDbGQCE1Byo5utoivE
 J/NZ3cQB4bDpSsDkVgpEx2XfUREZAhi+sxTZgFPzCgo4hqpZ67tZoMYb51WfIr2vph8Jr6irNhP
 EbLutfJ4MvOSXBG+MSOiRfcDUPlpESf4mcjNYBMMLZrIXmLYbe4cwxJkxM//sg5kAtLQUbzxt8W
 x+rAehqmbkjvyonssRnGqCFyV0j+Q7ax4DsZmBEiidbqTcMOcKjrknhvA8xkcbSGAqnJ5zYR6J+
 FdJQAwjKYXiUUgJYsDnOXIXF73gavd2Nxmos29GI2zHHu2W5JUJeVjd2n5PkHsCKEPGWS6u7+Xn
 CjvHWB3XAsmVdz6fXrg==
X-Proofpoint-GUID: uBoQj-1Hf_JUw-o9GT_LlxY4cXyeMw77
X-Proofpoint-ORIG-GUID: uBoQj-1Hf_JUw-o9GT_LlxY4cXyeMw77
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIwMSBTYWx0ZWRfX+bPQTiifKEm1
 /uanrXgQwcmxF53ynii4UCYBil7GHlQnHfJpk+bHvFjbsTnUg2ddqou/ms9cwMGF3gon/NnmMFL
 ka99Srov3/Vm3gLBpZSEcPvef2lhWvE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110201

The i2c9/i2c10 and uart9/uart10 pinctrl states shared the same pins and
the same "qup1_se2"/"qup1_se3" function name, so the I2C states were
indistinguishable from the UART ones and ended up muxing the UART lanes.
i2c9 and i2c10 therefore did not work.

Now that the TLMM driver names each lane pair separately, select the
lane 0/1 function for I2C and the lane 2/3 function for UART.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index a03ee16c9cff..c7ac2e66632e 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -1056,14 +1056,14 @@ qup_i2c8_default: qup-i2c8-default-state {
 
 	qup_i2c9_default: qup-i2c9-default-state {
 		pins = "gpio127", "gpio128";
-		function = "qup1_se2";
+		function = "qup1_se2_01";
 		drive-strength = <2>;
 		bias-pull-up;
 	};
 
 	qup_i2c10_default: qup-i2c10-default-state {
 		pins = "gpio129", "gpio130";
-		function = "qup1_se3";
+		function = "qup1_se3_01";
 		drive-strength = <2>;
 		bias-pull-up;
 	};
@@ -1461,14 +1461,14 @@ qup_uart8_default: qup-uart8-default-state {
 
 	qup_uart9_default: qup-uart9-default-state {
 		pins = "gpio127", "gpio128";
-		function = "qup1_se2";
+		function = "qup1_se2_23";
 		drive-strength = <2>;
 		bias-disable;
 	};
 
 	qup_uart10_default: qup-uart10-default-state {
 		pins = "gpio129", "gpio130";
-		function = "qup1_se3";
+		function = "qup1_se3_23";
 		drive-strength = <2>;
 		bias-disable;
 	};
-- 
2.43.0

