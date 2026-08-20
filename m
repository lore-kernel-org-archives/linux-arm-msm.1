Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA07402422
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220573; cv=none; b=IicH/eYTnEK36ePSq+4hr60KKepG93d283PRtdrhRr6qO8sNTUlV2Wio9kaIPqnx/oacvii0ThPFlOqU6bqy8o5vCprRweIisBmYY3/+mjZTfu85sFXyEHvN7SQj6x/yiurg5jl+pFwdn/6wQtUX+CUVGSSeZTZZTzHwEKgEH2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220573; c=relaxed/simple;
	bh=kwoe9cDJHyiDxCz0G2t7XYacMKY7IbgYwFOuciWzpr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lu1v9868Iv6KGDzqQXXjKSZPjKA9bO/4QQeG9FCwchwxqfGBVj6T3F3lTZ8tJRJVH7NEon5kCUI+U0icsnPCGFCI/CWCxo2wy+zqP10H6xMVugJNQqhwIrBsUqzOEXaUtucwgJt9n9dqM7HHK6viGUOqZ23zYGCHcEeL6P0xOzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=muTCn76l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iVh3NV/i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="muTCn76l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iVh3NV/i"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KA2ohi3132018
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFBlWjhx8TjR7emqcNSFWOI5z9JSSyOCX9bxdec/40U=; b=muTCn76l8sN0F6lb
	+4VTkld1SIIFK3HdYM/yxoK+UBOmKm4YBQVNfEHRc7pSM6xaoz/55REw2On+xru5
	ZEr3fevO7jXZ/SgN52FzoBI2lMsI46wcEhPs3IcBziR9ddSAPSY9QWJc5WUcmQhl
	jTIYWO/uVhRUI6h8rHfKcbF76g/XL1dzPLKjIrEyg/F2aHm63HfbQhbHdhPnHKdu
	TV2UxrovNtrzUW85WHzRPFC68a/tkZtHzNQtW/HRP0g1J+nmFCRnae053yK49Epq
	Ut1P2nfVQe40G3xOBYtcGYVAKBdCeNXPwaFbTZdXHQERa6f02gXshGwYrsy1daTT
	0MQLfA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg180vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:09:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-933023a5980so330557185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 03:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220563; x=1787825363; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AFBlWjhx8TjR7emqcNSFWOI5z9JSSyOCX9bxdec/40U=;
        b=iVh3NV/i+sH0nYYPOt49+ociQY0xWUiYP5OumcTJIjCGKp3jfxB7TR8SyAgbIzhO7+
         nzI1UCyBG0+2TcSf4RgYHLRLbJg2pgAAPtt/8AZACGesshZlqqw1oMy2844LLP2zMuzI
         flOvcxjXbxToLExySCaEq8Z7gol6JQNIAtzENKnj9a8rmHwbARBgVresanq8RtdFOu9t
         fTIu0tRwsuPf+i5f5Pr8UG1mW9aCvSB/v5zLQ48H9pHbnyybnQsG4frZvwLNLF8A7gSC
         U1FeI0Kyg90CujGBx9ztV0UhKOO83Vq5z+9ZoT8DCegS/qm60gbKoMga8EIDAOtXjchX
         OWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220563; x=1787825363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFBlWjhx8TjR7emqcNSFWOI5z9JSSyOCX9bxdec/40U=;
        b=FHkcqweGQH88prqJj/j84zgRjgXfWVCcnYtbOlb0AQ/fYwFr3Z8zgb2cwSinbw7hc8
         +uQXINC7ykafaNdIhst8d8YUDPnuZrm+qCBS23g3UhlLyP4TXtWhxY3Cl09ZAPWf48yL
         YrX069mrfplLWPIpGYCkuap/MTs+xGpOgeFirOzzmw8Wj7CEdBvNa2re77T2BkU0FSZR
         qOJbjrT/Irk3emcWOEZqsfhOBjpkB386lMMZQPvNejVb5skUPQUZXRl4b+dugRUCbaiD
         nb6hMvwvAbpmgiTuFqZN6mXuyR9ndMTKsjolwrKOTB4sTv7ozhbn2/KITwxEVe7877y7
         mB5Q==
X-Gm-Message-State: AOJu0YwlR6jCZpIsgUQJoqoiUyv5sBjvwmwHneu+u4oQXz4KJ26w21WN
	89Eh8zluiv47D5GgnzxATmT4H1vJG66hmU0S+b3GxrqEipNjEeT10jxAmLOH0Ui8mCpR6uH2uyY
	koYtCp+EjFcTS7wR1RvYogQL0O3Kh1M+1BST2+XUxfXZBaai/FT6UGl8TOBKvjMhdoNeN
X-Gm-Gg: AR+sD12idzQhXiGLTUw3sNVy/xByhVnKsg5FqnjMWhjMVMoHGnlwoXsdA06D8OHY5vC
	DRzj/So/+pGONm5oORNrHZixixlKzdFXY0WMObFFfMzFv0qtCjW72tydJZZYP8Wvrs4uwy6BjF1
	e2S1I+r/2XgwHRUU+Y5VotyNTgot10XPmFfQpiVUt+xzlO93kr9M6ilZZlMj1C9LaYwBKIT8YdY
	1FEc9KzYM7Qpryl/JYWS2MwJiJAFirzyflmDF3vmxM9RprvkRtWWWDJDBRk0Ma0MOgl0YBsCO5c
	QnTKG+wPE0pqBrWujFXIPK9VgiKxweQc0gnyJcJ/uetk3IFtBHMGxUbdZ6IgxMjCz8oup1Y7KFG
	tWtyegc96
X-Received: by 2002:a05:620a:608d:b0:937:65d:d89e with SMTP id af79cd13be357-9371e1dd574mr1157180485a.3.1787220562878;
        Thu, 20 Aug 2026 03:09:22 -0700 (PDT)
X-Received: by 2002:a05:620a:608d:b0:937:65d:d89e with SMTP id af79cd13be357-9371e1dd574mr1157174285a.3.1787220562259;
        Thu, 20 Aug 2026 03:09:22 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:09:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:19 +0300
Subject: [PATCH v2 16/16] arm64: dts: qcom: talos: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-16-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=997;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=kwoe9cDJHyiDxCz0G2t7XYacMKY7IbgYwFOuciWzpr8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhtIec+URlh7A5dIigIpTnDOKpNKsM6HPVA+MI
 xkeUked6vGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobSHgAKCRAbX0TJAJUV
 VgM/D/95tFnAQWFM2D4nEdej6uEOLuu9jPJIkkxU4kGMiW2t6D+ChuxJJ2G/PXnrgsk6JFFuM7W
 PJpbJ41Eo4zVXuVKzAWiy3Uc8ktwD+KcHb1a3qqSxduzL+6d9HdBN5oQMZgeXEe4cLRtPjzZWwD
 QZAuRKG51OaqcMeTn35EvBFV08F7+Ty+o+PyB5QZ1Dqgr51lS2euN0lnWs4eQb67wjZp5+Hzcdi
 /PTr78sLgKkr9LWLW/h603UrnW0xfGNie6tdMlvHurJ++Hpb9okCMq+iDgwJupScxO1XTgy1P7Y
 hqV8Wkyt6bmeYjo4MGNrQCOLZrh1Smv9BSzKJOcTIHRhWpKf/YDd6gzAJ9i/PInZ+nHiFLRdCR/
 KEquPPSGqBTrTDsv/UfCvDAtixGO7L2J8hPpkXIgnw62H1gEo0QT3B1JHx/moUaP7xxOpYlMtSm
 27fBSOYy/RgyL1C3Vw+WtYLkev/lLu2OyP9Up1Y04581rvSwIpgC7fqO2tX9FLy6GW3g2+48Tuw
 ItzhiLHyqhEi6k/umfEmPlF8EZ7A3R559vla2BGnlE4xvaFBRXPhypw4vxRKwrSFY1n0zr21Hib
 Yl9XiCKk1DznSC5y2VV0+pIT4nssflvsl3ghaafFTTufC9I+IXO+YgG7ey9YRZnXoBODsIq/pI9
 D/9FzzBIiJEjydQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: 8FlTkU_ZZXPotwxn0X0uUIXzvP3VyCpL
X-Authority-Analysis: v=2.4 cv=G7Is1dk5 c=1 sm=1 tr=0 ts=6a86d253 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 8FlTkU_ZZXPotwxn0X0uUIXzvP3VyCpL
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfXyhRzCM9Eup7Q
 yuQpM6m+aEHLjl9NGxu48hSjquYxPCVq+NrIFhdtGDUS0uKXcWqP2ta+cv+X5Ri9DFmC0x5mC0u
 VehCbkllaL+5Ew91+LD0J0x34w6D/ac=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX7LVPTPnIAUlZ
 mTUK+ipKJC5ohWLVCnDKqBPAz9KBJiz/uZ8ZO12CLYcfu2r0Irp+8GK/68asSrudS5p3W4bTw9w
 V3EeZP7SKIAvZlCAAd8UcKPxpijn8U7Cy2KyqEK1BEiN576u50drHVGlW/fs8smv9CwecZVw2Y3
 Xa6pg3Jqt5FqBCBYar/e6d7InaZpO7AsCQi6lV4HyWrGRSTJdXyj5OitKO0MTuxzkHS5pJD8E5i
 i7bN5VW94VprbmBJKvTPgRuKU20sdOTvwctuhTwxxGc0uNedP0oyX9sSD2HrTxCXjxMeQCIxVTA
 aeIoWDQRrd8Vo6IOUAn02FfYCJRYxf30f18q27QPNDG7sRWGCLyEoFOwj5y9n1pX0ZofGSrVcb9
 dE65uWLoQCfRcxTR3uZ0NsSX3w6At8J5i9zmhcmVa3wwhVv/0bInLZvIldVIxoZyEa0XPkaHOdU
 PcU+RCVIZGQbqsgISbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200074

The GCC GDSCs on QCS615 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index eedfdce3c479..06ca54acf565 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -706,6 +706,8 @@ gcc: clock-controller@100000 {
 				      "bi_tcxo_ao",
 				      "sleep_clk";
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

