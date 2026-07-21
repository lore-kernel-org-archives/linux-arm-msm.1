Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A75847DFAB
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627650; cv=none; b=lFw1+brBxlhKOPn9SMa1S0Wn3havPQuL7r29CmDFRvDAIrLR2dn3Ae5vkKDPkYLyOfIXiYAK1zzfViJFV6io0It0gfT7y4TuC2pD3kNFUG3ir6w24Qj+uAOkv4T5zD/719bKJ4+rYuqlEK/MC/M2xTG5kyLA87xY1nREUYGrlUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627650; c=relaxed/simple;
	bh=lYuT3wAuvUJYgWLaG91/0UdafTdXUvsgzgEJo1MAEq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aY0SAO5YJqmYSbGQkkz5h9dvQdDCKnloW3u1oS834eMNLJWJugbjkjvapP2D8dXBlG8G0oGhW5UUg21VnlqrLv7S00Klap0r6l7IHAD7JYYzyeZRzJRxkFKK7x6WkQrBRXCDUC9uMid6WNHCVlyeRKhiHUp0i8Slgs9K/XMRWGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K504jULl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OUCr4pHW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K504jULl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OUCr4pHW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L9XP3A1390612
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:54:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	grsWGejb12FxiDp/fmsnM37rDgDukOSGfOuQlSCzxm4=; b=K504jULlip4uWTEL
	rxcvf1mhlyLRQMMNHwFmUTj8C8rpIWCXMsF6fYu+SCnR7hSm/jH44FLpq15RuF1C
	PBFxGHwsenhvnEC7Gs+log9rYw3dwIp7IS2doDmUhm92klTJ3jdjBQUsDyp5Bozy
	fWB3yqFcXW3zndlxpfX5ZnpNuI6fjEHlxBAYg0h+cF09JfItUAm2/dCeDm1IIAGq
	kfpfEjq6IQdfpBabDa7IhAwgbzvBHHOLS2nvGaRyYy1wTv9lNw7zs11SV6SK83La
	EM7cVJofHzqSjD09VoQ20VFvyHSS3n9KKDc5yQqukVC27chA221YCEVwESV7eqBO
	4s/Y5g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj68602gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:54:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce8a76df2dso203371465ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 02:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784627647; x=1785232447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=grsWGejb12FxiDp/fmsnM37rDgDukOSGfOuQlSCzxm4=;
        b=OUCr4pHW8YS58N4Tn47TlCZMtV28/2ZQ00Q7vR15XjacKncPMD0hrYrimAumHDMU6e
         /ETjyh3qCYHx8MusOX4gfMKOb7KU1rRWIn1RwGk5015JCq7QGECqxv9MwqQ+qi4Z7WS6
         MWKULW503l3J0xNV7WV/ABsbNrvYaqmOMkqchxqZLJAFuBEeMnGIuXaxxMh8pW9EWKfU
         rhxKR1ELv1JUppQKyABtR06j+KwzzOw+6+Xmnmr3Rp0bv4MKHrtzGl9VnNLGY3MakdTz
         MUSZC81REgxwT567JdUdFiL3Kff8Lp5hkEIehIe1p3SQsSWmx6tQNuywSHsJIwiD9hS4
         L1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627647; x=1785232447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=grsWGejb12FxiDp/fmsnM37rDgDukOSGfOuQlSCzxm4=;
        b=nJfHEcKD4UYQLx+m5ek/ppW6nvepTNep5rLl6KKsBKwsMqrYj0NT+No8XsShUfKpDN
         LVD7ew7ZF34WlsS6UwJHED/HmayiJ+uNgKSd/5HwRuWEY8+X+e4KZSfnLv0t5YJbjXeA
         RJRh/74vZ8N4gWhKLdoGqh1Jq2HgtjxyvIM4eGKPZN1UyDaef1EoC8xeSXij+jG8WXKW
         K+9rkkVGT6Ud559V9yKn4HzvjvShmZV69xEtSbFOSlgj7ZPRXwXGO3uDYIYmGvdQCIRm
         ix3t3rmaxejCemnQwLYagHfyvQa1ZNO+3BrtcRjtjEbl7g5atoesr8WpTQw7cRIgS9ZG
         zSAw==
X-Gm-Message-State: AOJu0Yxqr2Bc48Or4+fITpBbs3l9KdSqAPtErMofEXsoK+bi+pmWkV5i
	tkztIkz/vzoqX/88rL6RiiCYaTTSYfBgEVrrWvaWLJhFd9O6fIDJXTim7mIE883WsSJWuHAJDZx
	ZQ0OXZXrkkqnFEuRV9BDaV5N4S9mSlMt5Ftqt6sCNdWRT1XgNqOYJ/3Cv6yUSqVrJtaQ/
X-Gm-Gg: AR+sD10ABUsC7kx+yh6kMj/D9OR3njWkVPLMPmpwNfdNM5uxTCdHS7PGGIelnZlgz3y
	q23DyyJpMmRoyAwqYbavclpCxvDKr25FWTCj4Pj4Gdf6i1u9h8sK4EYNvqOKY/mISBMj856+StK
	G44arnB4qfJA4MoHoUXlKfHMNJLz9Vj/hZndTX/rwe9OQmx6SXrdCEEdH6KOOd/rYJLZxkqPLWY
	zM0grZNiTJlHYS8xsw1sTeXcEV6gmcSV5nB8yLqBv5OUyUSr7tDD6CQ0MB0FD4Qd/21z0NX/Lzj
	iRTKCiqcepkFgTFMV3dXuctTQRiDjsx2nHH+Y1wdVa9aVJEBiyLsXQbs6sSbd0M5qBWFJuFFOMk
	03Mk8NQZs0PMBBXP4Ist9qe2zC1LBoX610UhO8yo30keZrzPUzW2qvBMlEmZ8lmHxaARfJQ==
X-Received: by 2002:a17:903:3807:b0:2c2:bd7f:ccd4 with SMTP id d9443c01a7336-2cf349175f9mr185805005ad.21.1784627647134;
        Tue, 21 Jul 2026 02:54:07 -0700 (PDT)
X-Received: by 2002:a17:903:3807:b0:2c2:bd7f:ccd4 with SMTP id d9443c01a7336-2cf349175f9mr185804745ad.21.1784627646667;
        Tue, 21 Jul 2026 02:54:06 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346da139sm71950055ad.40.2026.07.21.02.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:54:05 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:23:47 +0530
Subject: [PATCH v4 3/4] arm64: dts: qcom: Enable USB controllers on Shikra
 CQM platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-usb-shikra-dt-v4-v4-3-2e7a092d7f27@oss.qualcomm.com>
References: <20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com>
In-Reply-To: <20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784627631; l=1150;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=lYuT3wAuvUJYgWLaG91/0UdafTdXUvsgzgEJo1MAEq8=;
 b=sC0RrTZkmPn/iKlcqgVYtmCTy90eNbECCd3dtc7JVXJQTt0neLxsIJ5YJPmLQxRpSBX/EDoaL
 w8JYOIfbaLFDJJ77tdldBJfgqTHs3Qy9iBWYqAy9BazAbbWZnwoXgBK
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwNCBTYWx0ZWRfX1lxMHfd7KK7W
 7IOHsZW0WdHVHJA2VHLsRxGadfIpPD71zlPJeuBBLa+AdCXl0dEyQqQ2woEe6+ePEFJaMb/YYnv
 uKgSajwn7aqi1kYj18+ARz5SlkDL5WA=
X-Proofpoint-ORIG-GUID: idEeb2SYIapIpVXBUUgOOJE151dESQfv
X-Proofpoint-GUID: idEeb2SYIapIpVXBUUgOOJE151dESQfv
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a5f41c0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Ncz9f9T2D-eHx8tkw6QA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwNCBTYWx0ZWRfXz3Vqzo+pKL7I
 Faprt/ZRjZhV8qTJFBVSO/ONi/eHEiirLv4MexTEkdDuPqir0F9WJ2fCtkdfLWvwRJpRGn+MKEk
 nVFn8YINh36J5rs7IJUzWwIynk7KwE8No3zvEgTZpQ+N4stIz3REVN+FwwtglBhlCMo8O8QOcSz
 VhmKClZ44wmRn1CM8z8ph2Ojhi+jOA9Dxar1cP9+HR5pyCi3CVkaRJ/sxViCfPZJ2rQGx9Q2Zh5
 e5sZ6/jgYd5Wnv9qvBSU1isgyVPuD8r7DdFdf4Ify9TxUXBWEDkK7CjUUm2rIYMjxm+kEE4hXkv
 BuLnJF2jO1PJijod3hcV6ShjBfIROt7oYEX4NhWmZJBgCOrju5RnbbaLIVLvFBcJHHnWGq3k4BI
 p+YEEY2Whi+IIms1ELCmJGHuJdxVTKhFnnScdn4hWbEOjJ2HOk0lVsvE1FgIQh3cgrJSSj2xeEK
 1hXcJ6mRa3QbA5XQMGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210104

Enable both USB controllers in device mode on Shikra CQM platform.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c..e58b40389ad3 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -38,3 +38,38 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
+
+&usb_2 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};

-- 
2.34.1

