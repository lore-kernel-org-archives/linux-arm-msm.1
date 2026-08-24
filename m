Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9B242AFBB
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572599; cv=none; b=oKdVkCAoeZixII8Mu5QKPxGBrNPhtEqgOWcd2TASqbbL9xG0+JUuQw+fB+9+WVoZVNNd5L1mcIbwxr/EkVqCAL1TwPQNVthbJ7Mu5uWyirzSfF34NIMoeLkHmwvFzx7Ps2s9lojn0kcq4wp1rXZef0pqbdTgY+XSrEq+dUj42WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572599; c=relaxed/simple;
	bh=ygaxzeR1m8fCjevKn4pRG00MpO1FK6KfllGLi4KPPX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eQwFlgWZm+mmYbrI3T6XptqpsVExbqukGWjyyrDH3izvY08v+q3bn0XuESoli7lbmfEMWImUVuEUTpl/J3JgwrFRoD4SlLY4eTY4q+RiYq2ireEe1kY6nxGrYuUtisWHOAN86Jsw/68w5TgS/ZPaaU8aTejbGFH4gxkJTfrkekM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DdNL9t5+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kejp9YJ2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DdNL9t5+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kejp9YJ2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMYH51673198
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KxIIXbuugwFOHSBBrDbEWPRp8IgxDM1kPW8oV1iV++s=; b=DdNL9t5+XLgk53vS
	XFbtyygMZpFRiZ97YDHxuO6+aKldJFEV27mPy32TwUzlLYchp2F5uyWbpspTc/b6
	jw0Jajzzrr8dobJPjXTF2e/73vbwIKSGV8END4HXIcx5KlG+3Z6p8sB3OIdsa540
	dwqTWiFWhJ9EzkT5tTulE/vjYyOLud1+2p/fcZ6CJYgSs8g4Yot9GTvfwE13eR9S
	7re4JEUaST3zjZejfx8A2Uu8c0YdQr9BXl6lJld4ePtCw1QqnXoy0gZFsZZiBW+i
	UAq5ZhqFw5GA+qwQCed10sa7DtpiP5Ju2eQSO3grLo+vyPIX2R/mDzqQd5xAuqHy
	wLgxWQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf11ey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52827090cc5so43955191cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 04:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572596; x=1788177396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KxIIXbuugwFOHSBBrDbEWPRp8IgxDM1kPW8oV1iV++s=;
        b=kejp9YJ2QQY9Vk1yOcWjWHwHxiFFCTN1xfzBxlhj6ZzjY8F8Di9cwCG8NLTmZ6P1r3
         XqgUEjoU2qVy0pXB03s3RzpqtYbpw9OTQnQrbSoJ8jZk4uKxRjMp38AhsGOp7PCYiejK
         SxBkx1cbm50Ha10NlGVqX92z6hpJqGqWjWcH8gPTuH/GaWblCe/LdVqjPbPFvPsKn/MT
         qT/9qhRZECignSnO4ZdrSj/ZHRQvIUJSW16z2aIanjoA9+KZ41rKY7xNRPuBoHHBf4+B
         qd6I53mgyAByh2w8d1k6cOJgrfrFa4d5iVG47lf3DaTcwWIXV1GPWKZs6NmKHaECekJ6
         7zNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572596; x=1788177396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KxIIXbuugwFOHSBBrDbEWPRp8IgxDM1kPW8oV1iV++s=;
        b=V7EzhgpysgdT39Z174h/7Zf8eckNX/p56GbdixpLeGN8bVJbsLM5cdIFc/f0gyu/yz
         mc5I5FwXssnP0KOCNErNbKgtRXCBLiXVpk+aDxLPEk0PCV/y1xTp4qV+K3GoSz5Z3BUu
         uy42JLkKae8SZBBb7wBYE7SP0WXuEGnhHavGAkTORW9ZORIwoEVO/DgHamiC6lb/nY5V
         zM1j+8ZmpW1u7dixXgCZ3KmUnQRFcRbRGu/+CaOIR2r0CyM9RzVHBhD/ERIcZfOqgUJm
         8MmBeO6SUcwVJYWVSuFJ3is2Vu7+1mtPa+ZkcqremA39QcELg1VK+C+2ah+8GRwKHnvj
         727g==
X-Gm-Message-State: AFuF++ltk/oWCEeScqLx/V0ql3Ks1l6VVDC7W89DOE/FcmqxqOoy1XxA
	czfrSgZCzkZg6xQT74/FhSW8zyGpt/s1YUXPBQ/iPsuXMI+0E8IHtxqGcT+lQWALTtXqlsADqHr
	4mLCitDrocHk5rLVbubq/Tv+/DZf6lCtX1xsAD+fdUhbyvaxAlA+BBtbUZdqStFGLczQs
X-Gm-Gg: AR+sD10SS6ZRJWybSjjCeNBtMjI5LB220tpYVmys0xTm0OZpJ3pely4o/NAyATGGnr0
	FXfoYavaA9WMwvJ3Gvpmjt85f43CcAcuydxAyjE7LsqWVtfE74W0FcN+F1r5LQqV76dM6qj+mJq
	V1ZiJzT/2IONkEvDlIuVY5V8yhbRSuuIoT/HInJmiq2UFu2qdi8L6oHylwzFj/qBL9h6UY7tBDO
	F6zgiYJPRjSZLLABmdM2I31XZEgFI3JNnh7Vj4yBGe6klewMCC+dIgi6cGfhDEnyLGjUbutXqnt
	SQfgFOzRh3irVuboB6UEUurHU40zosI1/4QSdv3ZnqCXwDuozVpJnzV2eFQwciIyMS3MW0uKh2t
	H2rHIY8Na
X-Received: by 2002:a05:622a:1cc9:b0:52d:9ab4:7775 with SMTP id d75a77b69052e-52de36e0794mr349091391cf.21.1787572596429;
        Mon, 24 Aug 2026 04:56:36 -0700 (PDT)
X-Received: by 2002:a05:622a:1cc9:b0:52d:9ab4:7775 with SMTP id d75a77b69052e-52de36e0794mr349088771cf.21.1787572593981;
        Mon, 24 Aug 2026 04:56:33 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:32 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:25 +0300
Subject: [PATCH v3 38/47] arm64: dts: qcom: sm4450: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-38-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
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
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=953;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ygaxzeR1m8fCjevKn4pRG00MpO1FK6KfllGLi4KPPX0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDD69LNjiZUQCJB0/pLmPdDfKjMfu+TG7wnLc
 dN2TMS7ATyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww+gAKCRAbX0TJAJUV
 VlKpD/90UVtdVEQkMAh8529CNhnOFTi4v2ixDjlNgRiEc9sELZF+KDhPJFCQEb0cablWNSgKt4Y
 8vNtEDsIPVa5XgFAFUpaELBZnn+6r2It3q5/K8tuGO8Xx46Ubl3t5P86nLUVBIpeqdY92w3bcjE
 ZfwWx+GfpPvAv1ZXlYexqE9KgYigsN3GLVeSH29BpNZ5XS9ZYoS46I4tWvUMlZDMIDouoQPY9L6
 yWy8JlSTfU3IP9l1KBLddpF4kwRDrQfjdl0EYKaaCbKbF1lcjpssVrMkznuI6p21itBlj84/Fxi
 hyfo6FImK2VeQC3MueNoNZcLT3fAHhWfJEGm67HIfsVBcerOpqSG9op2+eS7Yro6PWeo2QEQiBL
 sABI5X3iG3nlwNc4KhStuX8K4YpB5lhMNQcn1+asMWe4m4881mgtS6jKtmDoPiV1rc4yrewIv/I
 SN5z7xlj0CXl3n0hTZtpF0i6ACZaz4E2HeE3aH3R200aQJMDsW47jglMOHJac08DqhcHW5NEHHM
 H0HvzA6XKSzRO1ViNJ2wmvhh7hqLqVMclcZ5fEuvje9i4OjMM/x1E7liIubMG6iss/V6OcuIrjJ
 hEb1GTYgJX1+M7u32wvYujWUjILegfNHEaxIodU87xSEhY2bAz6Qg2IZ/qhWAtrKUol9kpqvF36
 /DUmMrhfr8BP1cA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfXxL4meF3ncDqc
 YYmkx5RTydq79+iOJ4LI7appEaiWvrN+aRSbUqbDWj5SBF4GImkPP8SiYjqOwXSHfS7c0UarwWK
 2w42TCr2ZwqiI4dv5a/qZAKx0Bcj70o=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c3175 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=3n_S7Wnn7mudAyu7Y6kA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: ZGTq1_oToveLp4vomCWrC7xU_JRH0onp
X-Proofpoint-GUID: ZGTq1_oToveLp4vomCWrC7xU_JRH0onp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfXz1a06+nVzpmH
 IAM98J1RKbWIAghDursVY9rMOuUnbkyEstxt0DQOTFT/MnEMcAMXlF2h4ILfnGV1+8HKvx0MutO
 AQ277J2TwhAV6gtLd5QTDYxvto4lIlJY6sw6OCHnK32LHmRPnAmkw/Q/WVCHYgyDRqoJ5hqeBXv
 OYkbzY/ZzuNFzcQzXczvoQAS3KK2u3zMMi92iZNBD5YXOn9nWC0HAxUtAgbXu6CFpW/bj+CGbwY
 96ORDzm6ITXsiJlQc0VXtiP/qETScBkAzuhDyQOzpeP/s73ub5Xlu1Tp9yljiPOrYZIDmIC8fSI
 Zu+lLE6Q1Qk9+/MmhRQ7PvbkJeA+K3LbnatzBOC22zKCyY92vMV1Sig1QcDMJ+Z25DgZwNF/s8v
 v6bzaNPeRNQY6tNnnJ5HF/TaLFpKcrkAAdR0KP16Ls9XPqslJ/8sMSKpvCGfZGG8MLAK+Zltt2u
 vh8LdLzZKCJv8KU+rOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240100

The GCC GDSCs on SM4450 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm4450.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm4450.dtsi b/arch/arm64/boot/dts/qcom/sm4450.dtsi
index b7dc40f3778c..0057f68732b1 100644
--- a/arch/arm64/boot/dts/qcom/sm4450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4450.dtsi
@@ -390,6 +390,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>,
 				 <0>,

-- 
2.54.0

