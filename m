Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE25148E0C4
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 09:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450931; cv=none; b=bCtCW6LnsevMrwh39xQ8OVCiaIVX9LinDjLlw21rRPafv999pHFUHWIXciepnCWy3d59LFP/u/ox8fmrtR29SKa7CBqYYnD39aqrujrFGuIP9t2NvHCfGhfSn50iYhPB7o6C3fiyHLRELVhc9Hq430groB/BmbqYqJ5MIWK+cfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450931; c=relaxed/simple;
	bh=3d9/a9jjN7GAxpxkt4zvvXZScodzf1IsGMV7uENdLz4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SI1fqf32+1h4Vz/BKFUPomS7PRyS0t0ZsF3eI3Kzy/cBGIgwISndv3neyy10CraOFxxc7HtPC4cpyzEGnrsm1N4C/OhlhxarmTvVZeuKWEwn9lrM6YlnU0OAdhHZyJh4FksVl+V3bkFxiPE4HCb2OMsCckYgMtwrHJD/MVXtutg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cKaV+0Es; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MO7o0bjU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cKaV+0Es";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MO7o0bjU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K9pu2189911
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 09:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jif7VDWkcxpHWo5f464ZlO5jXohlLqKyfu0q1fOYDqI=; b=cKaV+0Es539E1VlW
	rWa79AnDt5ZucKUMuOdR8l7/V4gu6Pf3XoBgUoU5nSvFbfgTUHRTyCn05kgVPX4o
	sg2Kg4gbsM+skULywNPPR90bzmsDMkrkO368or9EIE+6T7/tWGm5VTKyYOL7Dh3I
	M+zmO+yMIEZTdMMBLz0J376RDpjhTfDX2lS04tZBhdbHXv6LTMHL6Ykmk+ovGRrD
	DlVmuGeH7Qu6Huj/U9K7lvOmMzcnlHER1a0URStPZnMkPQh4RVYlcvh61V61RnkD
	3BHzEL1P7CV4JPkzUuVyZVEB9txLahwoJan+TIZH/Hwh6aBn53C5SBBrT5GLXjhV
	NTGmeQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3a2y6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 09:15:17 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-154e9d2d94fso10409047c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 02:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450917; x=1792055717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jif7VDWkcxpHWo5f464ZlO5jXohlLqKyfu0q1fOYDqI=;
        b=MO7o0bjUJocWZLUz8eWv358WBVVktQlxS2+O4Qp903p/VEzj7ttHNULJ4RCdT4QazE
         ZxTed/UNzLChv8ZG+GnfFvtneSV7dqhXCWva+uaQwSAgnSzooV4hp+eOWBC5p/D2mkxO
         eveufqFBCqnfPnaTejnSQdv6Cfon895xdNa2lLLo1+qWc6B0rh7cBWGh7EpZGK7kpvFH
         izzruJ309l50htD9WseqiIUuYwYCvBYoHixLs8v5c5KtB49pvnWNQGMxV9FpP3YoXu3a
         NZgzqGYa31K1GAr0aytgfwcs2EN9bR99sjGccmzWLztPWvYZQLbDUP/j1eazyNF293LC
         BpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450917; x=1792055717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jif7VDWkcxpHWo5f464ZlO5jXohlLqKyfu0q1fOYDqI=;
        b=qVL1w4O/vS7zpb1zPbZI5BLd//fduzsF9lT5giOpUWT3WVvWVddhAMnH7Ma5D/4JM2
         kD1tIQp5m0zBpEM3FuX6icYc50b3epdhwLQY9RR8ozibYQvYRYidiS/c5m2qqCP178Lb
         ZW3cKy7ckV0yJc3iaS83k0Za5JqC3OiNG5H1Wez/BxoTCZIBMw7uyXwKFD9lessHkPEs
         d6h4y1a+r0194YkeUj6FfcOVqPPg/jKH1lAR1Il+UZXTWoa0LcqSiIswN2MC4D7mrbxD
         F7PtAuM/C/94H39gGTYwUsW3x1jCbrtt7yFcoHaovSuZejiKlxdu0+mtBIPFLxSmVWsl
         m7dw==
X-Gm-Message-State: AFuF++lGdn2/2ZLYm4kPdLDdR3T6G6HTMajsvqDUGLKR55wROlSeIAau
	GDRt0mv725GWStrJt2ys8uAct1vByK+RjUxypm9+5mrgOL9f2s9OlqwRS5ZqfYLGrOdUihvGbcC
	N0T93FjvOUo+EvJ/X9Sh6e4gf/zf/ambUgV8CUR1aZNko4TRncX5GnPRwl2xgmru70jG8ZbdYGo
	km
X-Gm-Gg: AYBFou0e7M6xMfRIC8a7JosBIw4vL95VLoB7gv6rPhnAEWKLI52HEuDSxgs/uq/k26C
	akLnbxushhJawFWVHuEFkTK8uPOTo7wlSgstwbkzPLnKZ1aJEhpv01REQSBJCPC9hSmukBgifmN
	GL/BM5LIvyhnS5OE94I0mwuZqlU123AyYp8uNb9NE1TpqbFg8YIXX83z0UIW3omdnzCn7vzy7UG
	zruV0O02GK/8zSJn5826oXnfHbwbARUbYwNByw+KN4cmGQwJ2monS3XCzmiBsAXLbWtad+4dEso
	OQ/X5WFGxPu8wjXszgjo6DQiFQudhh/5JZdaEegx6kzJ3y02h6zwUd9DS0BzwFoP7y95wMj5d4T
	WzsMdl7x+aqyatwfnyejvHM9bNK2XaAR2isbpnPBkfTJD0LcnjzESLIj0lWxa8r4WatICfHBxw7
	drdYJerlXjFKZ+CLhEdmuJfZk8cgAy
X-Received: by 2002:a05:7022:ed0a:b0:150:1cea:31b0 with SMTP id a92af1059eb24-16205cc1e56mr6233888c88.13.1791450917080;
        Thu, 08 Oct 2026 02:15:17 -0700 (PDT)
X-Received: by 2002:a05:7022:ed0a:b0:150:1cea:31b0 with SMTP id a92af1059eb24-16205cc1e56mr6233825c88.13.1791450916215;
        Thu, 08 Oct 2026 02:15:16 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm24456045c88.2.2026.10.08.02.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:15:15 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:44:31 +0530
Subject: [PATCH v6 11/11] arm64: dts: qcom: ipq5210: Add random number
 generator node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-08-dts-v6-11-f9c4ec8664d8@oss.qualcomm.com>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
In-Reply-To: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac75f25 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=bztaWnFoPO8Rjwv9oDEA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX5LBq1mRU5yvv
 nP43fdPvOgTFQrKY+DxM8IRhmmOGd6kPpDFWGNY/ft2teTeCNJtrab1M/s/57BGFSJ83xOdfnIk
 AFPuWtzTuuzihTaFswR5uzf2nPdc1kw=
X-Proofpoint-GUID: a5UPOmu2uQc1TGv_oNOXTk9t2uJKm_ZK
X-Proofpoint-ORIG-GUID: a5UPOmu2uQc1TGv_oNOXTk9t2uJKm_ZK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfXw+pXeacbxhb9
 zSAFyKJSaEKmdqDXpuVb6AvEvkcp7Fb7jAQKK+jIzf3RRVbcq2RTwC71n6BU3i8SKhXd0/0/Rs2
 SBKHzv7sxaOmZgevhD5VR7iY2TG8/KmBWSTTmyKIq7WXnc8Dj0oOZOi4ekDg7BLTP1aHru+PJs4
 rLyHVoJjVX4HFn7lZpW79SW8xqHDHw+yCDPE5XjrTbMoVUm5wRI8ty6JbaONCNoshfyTI7+m3ts
 VyaJ72vb+3bV8BMRnPfMK4nSP7Wzna4iz1dBdsmn/0NEivJR8zYOWl1GO+Zm8U1Q8sgic3BgtY1
 m+zaeNo8S4RPeKQsCsumZr7YNN8eyw1Pk7WfX/xGa60EJNZcY50uvvIlEga7T1vTepAGo64AsWx
 u127hBp3glmwIGb6efW6/Rzr6UAJbNWq2gcFEHWub0vGLhZbeaEEC8qoMettxeffD96QF3+Gauf
 Q42nkMTdIhwQpSlvucg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

Add random generator node for the RNG block present in IPQ5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 23a2e27b70fa..4795de0c8baa 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -198,6 +198,13 @@ soc@0 {
 		dma-ranges = <0 0 0 0 0x10 0>;
 		ranges = <0 0 0 0 0x10 0>;
 
+		rng: rng@4c3000 {
+			compatible = "qcom,ipq5210-trng", "qcom,trng";
+			reg = <0x0 0x004c3000 0x0 0x1000>;
+			clocks = <&gcc GCC_QRNG_AHB_CLK>;
+			clock-names = "core";
+		};
+
 		qusb_phy_0: phy@7b000 {
 			compatible = "qcom,ipq5210-qusb2-phy", "qcom,ipq6018-qusb2-phy";
 			reg = <0x0 0x0007b000 0x0 0x180>;

-- 
2.34.1

