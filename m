Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB0A45C6E4
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 06:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085620; cv=none; b=mP6N54TaEkENgVfWtVYtzl8BWRjrx3m9DKrrTF/SuXnFrVStJzQlyNfW73SIloqgoCeduvFLf8cbiau2YKKGM+DlpX8waXMhX2o7bZpylDKLFtPR3lj8JuM2aVSvNoPE8ptFTrQwLTvc3Hma7KTmfaf3mgNAwqF7Vgu7NxJt+R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085620; c=relaxed/simple;
	bh=fCMrPmPUNafBvO10YWswU3IRQXLhDtGia0biGdyfMJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l9XqelIEq/tKrKIPC9xwZss5ZsYybD4fLngo75wNBIFmNOZBX7aC0jTNJqzTxrr66Tmy9amlFvkPDE/DnWvol6G+wRj2RlbwIRcq2t6FM6RESa59+cyPL+3Kzdf0wO6aZj4AYi2JlNpMyL4494xOoALwiTSU4hrUwNeh6nlptds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=akm7XDEW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ax4nnx2v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="akm7XDEW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ax4nnx2v"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6776C10Y3576091
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 06:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aEf2DkYlwBhwbK9/Hz1rs3k+ZWcCvcZ6YxQGzJOUpfo=; b=akm7XDEWRLSa+I5W
	rccKD/uFljuXmfh0Vppull39C3+f75bCfTWxLiK8TQu8R0Ks3GGdlAz2aFh2U6P/
	QeVTyawYXQ0z1EjZp+jwrahHNiHZSPJ0VQSs3PYotPfZaD5niDMzylvx/yHHaJ2w
	AoQQoJ0SqHa1UDZ8EcM/9JtomuU8G5OxkEFIamfU1cKo4xo4sWowgh1qFY5QkTkV
	RBo2wgFgyDrDFNxUWe1SHj0/evKGRO1GuvapgZD+MM7lQWxguG3q4TiaJ7pJRf41
	UcTtf7LZxT9q9qZWpPRxFnXYUL0WkqZFma2xwdxYH6s7UIUWmdVmahQfhkco9ryM
	4JbSYQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fw9vu04u5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 06:53:37 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-caf5fa127d4so5094762a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 23:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786085616; x=1786690416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aEf2DkYlwBhwbK9/Hz1rs3k+ZWcCvcZ6YxQGzJOUpfo=;
        b=Ax4nnx2vf99HNx9pzKd/m7Qe7JkNvPo05TQNTDvYqahoVO+Xc00OiB6XulscXoTT1v
         P93c/h1t/W1MDmp9TkL5R7yBgKlOxUoIHURLz9uswzKsqtbBIrXwWYi88Nr858qka47T
         uZrTAynaE4wur5/eIDOhsROic9B5b+C94umLSAS+bbPHECYJJXxlle2NE/g2RJeyIs/r
         cdXONgTMWeKtl1MEbXV4P4o6iZcMJIhy6pyoV/DreBQXBoJNcGukP7EfmDS9UD3xejto
         y2b0RKEJxBH9vUI44Bw35k0n8J2nOwafH414JiI+BRHNmUZCoh0raqt4Vd4en5yaIsvc
         0mFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085616; x=1786690416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aEf2DkYlwBhwbK9/Hz1rs3k+ZWcCvcZ6YxQGzJOUpfo=;
        b=CkN6+SwbvyzUyY9eodbhw3MPJY3VGSIDC8ugWA54XTpx6Pub66bkNrxD42P+5fdGCA
         9b1xfUnO6DR9NAErLUGrz7LG/ziRcX8LDOmiykNCEh9r0kC8WUSJ82xiqDl6agDOqY46
         ZhBk+N3HRM/fb3gCsz8On6zGycvQEsN/JYEiSwOAe+qA1/CYFvpMJFfwClAOtIMHEWxo
         ABR6BCGrZshR4jWHGfUghOuDs9kFuab3m2NoPRxxBsi/jcjkBaujDDw/agFKul9ViPGT
         DWtnu9T9DQ4pJZBOllhyF5VhbjrkxqxwpCPpwen6rWe/sMjSOZhYN2ULXZsPpSn3xPN5
         yP7A==
X-Gm-Message-State: AOJu0YzqRB2leiq6DTL62NKtgpl0NIVHTlm7PJatsjS+sCKWc8bcHAE6
	K5OZZLsrUCxNSU71+KgiriUlyQMJu2wglkcY8AVVdGefWPcD/5+uvEv6coFtdNqerXZYVRO9MEX
	zLx3kzMksHTLFF4rdQwZrbrAo612btZFh4N2kIWoZK4BE5DJCjobBxWkhSbi/EwD0h//g
X-Gm-Gg: AR+sD12dZBsUrsc9D7HTKsl/gMo3CVQcy8uvSvWkNbO7qhdnEZ+X2sb3H5Hineq74vX
	yaIk+NneMziK6b4918/r5flWCpx1bLBMQ8M4ci8UzOLmLgEHPDP49kFCCbmGnpD8jl70c85nUf3
	G2KToNnrx3zVfktL9bc90EUjLacRbUQQbWT6hYsiQlH7VS3y9GIJ+k+oXqhkMcd4NI+9081pEs7
	GQQeIpqe8TCgdZkUaGivKhwhelGxz2H4XaXsJ/b5wDuF6tjrBl89KDZczaSWpRkmY3TX+Q/mCG1
	f9EG1t4OJN0WOsEfH7lsy+7VSGNN0Af7UXgi2CFN2kCSbyM8mbOzZBhhlQLiDYnvjsUPmaldrLx
	4mpL86I3bLz60CJrQQn36q5lG/Q4xSpMGeGCTnwOCkQM=
X-Received: by 2002:a05:6a00:14c1:b0:84e:2bb:2d3e with SMTP id d2e1a72fcca58-84f5df75147mr1601399b3a.9.1786085616381;
        Thu, 06 Aug 2026 23:53:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:14c1:b0:84e:2bb:2d3e with SMTP id d2e1a72fcca58-84f5df75147mr1601352b3a.9.1786085615882;
        Thu, 06 Aug 2026 23:53:35 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f19842bsm223493a12.4.2026.08.06.23.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:53:35 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 23:53:16 -0700
Subject: [PATCH v2 12/12] arm64: dts: qcom: Update IPQ5210 xo_board to use
 fixed factor clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-qcom_ipq5210_cmnpll-v2-12-cce718b8ec17@oss.qualcomm.com>
References: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
In-Reply-To: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786085595; l=1388;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=fCMrPmPUNafBvO10YWswU3IRQXLhDtGia0biGdyfMJ8=;
 b=zPJlTejwSlIiks/S9GRhED1Pg5YBRxh98sLwAUScXZ53SPlbxLbxUTMzkOZwvLodCgXwbG4G6
 anQKjPEKjnBAlDnIFqihtVPf7C1hRVHjV5hWa31Mv84wgfUqvHvn8pA
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-ORIG-GUID: JmW4oUarqMWEr-M-5de96nvnmfmg8Txx
X-Authority-Analysis: v=2.4 cv=SYbHsPRu c=1 sm=1 tr=0 ts=6a7580f1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=CPdYy-Otk887xBsD2wUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfXx3rLZsj8PUbm
 sC26e4awe9P5lt3drGKFdGnNiQCLHcY0bMeSj2pemzjEJZDdGZEs6HzIMtfb9ny8dARBinXUme9
 e+scrEaDZkSZj+9MKMkWhCanFXipTP0=
X-Proofpoint-GUID: JmW4oUarqMWEr-M-5de96nvnmfmg8Txx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfX03N4sklYaZA5
 6lc1Uiasr9fVy9r3bRM/qOGLJIY87YFFz9DFugkDWLUX670DUly8XrL3Ta4iYbctn9ZXT89cRt+
 /zvIW7OQndQagOXzmm2SL63GV84oHuyz3kClX34DzNI+LFqN0igObDnCb/z4crNyc6td+Ia87/E
 FYhOr5lqR4gnsQHMy1ttHuw/twd3ncA4tFw4vdDI8J2pjKtGDSoM5m3WTeER2ntBW6nnsdYq1ev
 KB7Wd6GvCVqFSiorch+hkgznP3jq3Psb8Wh3CG3en8HTL63v6GrAY5mdTCRXQbYlgUdSF1hMGZr
 LKdpu/2/AZk0NA0Ul57K6ZcO78HXOSrPzWJWgwEHYJhxRgCA62XCry8xfYe2mqWDYVdx5RGzmDA
 fcSShwV/8xu41bCWQUTUycylxhaPAT1LNYrEnSQwtoEoypiLLtMyzf5sr2aM5CXAkvJrfmm/P9A
 vgILF6O0RchnyHv9iTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070050

xo_board is fixed to 24 MHZ, which is routed from WiFi output clock
48 MHZ (also being the reference clock of CMN PLL) divided 2 by
analog block routing channel.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts | 7 ++++++-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 3 ++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 7410d092814e..fa537633d5f5 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -85,8 +85,13 @@ &ref_48mhz_clk {
 	clock-mult = <1>;
 };
 
+/*
+ * The frequency of xo_board is fixed to 24 MHZ, which is routed
+ * from WiFi output clock 48 MHZ divided by 2.
+ */
 &xo_board {
-	clock-frequency = <24000000>;
+	clock-div = <2>;
+	clock-mult = <1>;
 };
 
 &xo_clk {
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 7025bdd9036e..8f6b37041132 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -26,7 +26,8 @@ sleep_clk: sleep-clk {
 		};
 
 		xo_board: xo-board-clk {
-			compatible = "fixed-clock";
+			compatible = "fixed-factor-clock";
+			clocks = <&xo_clk>;
 			#clock-cells = <0>;
 		};
 

-- 
2.43.0

