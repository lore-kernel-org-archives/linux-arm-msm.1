Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596077;
	b=FRiySMq8PcxcM+Jzd06iZ1mkVsXnew5c8NVAyjoYcLgDz3gt2h+DkC+Y13ydNUyt5EMM
	 vuWnbPEPF82/F+qtUyL+bKRXh3E6BZFLE2nsN9AKp+y1qdZ2YBTsyrhPEw9JXTrgLVQv7
	 oDedbRkDsMW9zRXc495yWyqqmYjd3Aqn0YBeRLY4etKlug0EzYjOYUaI2pPgmyGLCRbKn
	 D8/zqXV4m+YT0gnFQSPtrzMRL55a+sUyjwbn4JSwI31BqsrnReUdG1zx4WZgaGY40hf2J
	 SsjABV4rexO3dz6TaOZ90b4ZTu8PQ2CbARUi5wABA92Ks15Qg7oHfJcHGiVDsbCHr2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Q1JhuU8Nkw9dssyxcEwG+PVmzJ51R1f0S9ahYTS38mY=;
	b=4v2CTxipkbhNBm6YZ30+GoPlZP4lNq8dFpSXVfvW6dunOVL/cPGhzfqtiJdnPJidaC+f
	 bCggvbiKUMCPURpezvpxNcYqrQQaONxcDr/W/ZtHrEbcnuq3ne9ygT5rm4LwHbj2JO8i6
	 +3KYVHxtPGKaTw9C5FIhTMDolTWY5f1uUcdOhw4dviN8O3S5Mae52K87x1C5mJRTCoLIa
	 PkLEQ2Jr5MR3ueA4LbhczaztZgJ3O3nI5ibAJgp/MzU28MMR67irT2ONLfznNO/298yEX
	 yinuKcYKSTCmI16BObj7GE7q7PzACQndS7UqCaycJm02kOhkBDzUfkLQJeismK+k5mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dW3oVz+u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BtShZ8fv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AC76071052
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37AC76071052
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dW3oVz+u;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BtShZ8fv
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRSWM3296073
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Q1JhuU8Nkw9dssyxcEwG+PVmzJ51R1f0S9a
	hYTS38mY=; b=dW3oVz+u+m63wVIhoZCLkc6AhsnucjH6O7TOQeDWH+ww/ok//or
	jeCCCZKH14aqecIBhUAArFyfyvyO6OFL2sCc9NSG/yfPkbOnWBXKprxEfwxf7DPW
	g2AhfSMBPQfwjgj+jzex/nJj6s3ZqIRhqwxK8aDPV4vmhfPI8W/D4Wk5CGDx5WdY
	rPjw0i1tkXjte+49mb02mmJqDuQclrK4QVSHvjQ/EGzGC9z8B2FWlLEi561/4+ZU
	9dSIg4EiUxfI2bi8xH5Y6kd1JDFBIUZxDCLIg4Vd7s7iNhhwG+ZhdZbi8gs/7GRa
	zyZMoJVkFIrZEv76gQ0o3lut5JOINWvGjPw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6tpu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:54:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so435795385a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 10:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596074; x=1795200874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q1JhuU8Nkw9dssyxcEwG+PVmzJ51R1f0S9ahYTS38mY=;
        b=BtShZ8fv8OrpyFw3sPeItMgXLTtvsnR8ZnyRGspulEHieOiyFXeC7QztHga8M1Sl4w
         4y+zrlYQr9S8d2GcFt3ugsYDC6IneWNB0HeGnQQNhdcx/ZuqddK8T8rGnkxC6DVYCeqM
         kDJ3vbWZVkWT4U9rd8KhqTlBQf41pEg06Pw5lISZzDE4Lvl+c4xTiTbjL+h5yCKMDwm8
         twaxJh1Q9u11syNUdrwZeCwr8/GODhCUCQRKDVMoL/Ao8lSTnTAk3f9OC/TOS5oASfHM
         WkUU89YrJwklDOLSYEqvSgC+OZy+Vu064MBa91cscDGbNsf7tDCI4L0jhzNN26w6XVZs
         YK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596074; x=1795200874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q1JhuU8Nkw9dssyxcEwG+PVmzJ51R1f0S9ahYTS38mY=;
        b=rNSBa7i2R4SHurMM6Jj/5jW/6EosiZQwHxRgkG8L7IAPSrzcskxFiXVx+pxwzCK0oO
         u1LYWWUfJrXeSpTfBNMtD9w1A/BOLBt3TIKAxKxZ650Ov2FKAKIDMdTIE/SxT+QJqmTb
         skDoA8pTZIcNc4Zc7FgInJTAoO4pL9UY2QgMQxaRC2axodFHIHscpEs5LhaFYNiJKXAO
         5M/3IXhY2jbNIhg1WtJoighXAA3og8mmyHnjtztOJ0p6W21d/GBvNB4533zWB3bFwAFx
         j/OOZDNyVGv5gTEQ98E0FP8S8pkN/bfXre+AiTShSJm6cjsEeWxSk9o/FfKD6HqSTncj
         8wUQ==
X-Forwarded-Encrypted: i=1; AL+hErFbkTfcGoSAc97RbNiYm/u8daWQf5aIaVadwmdJ5oioeZIFlFZ7DnHjrZJDE4a9hIWHalDGlGpUvHHnfe6w@vger.kernel.org
X-Gm-Message-State: APuU4Z93O4JKbQyRXZb7appRq2l2ITUo7EUTFxHOPBOESlsywX19T+cu
	EMxwu3ylvOp4w1rcImlnMGIERAGeOe91+nW0zZzDJOuvNhyX9ydmWUWTZhjeLIjirTV4eDysVYx
	ygTEjmn46vKIAwwRjwT66TnLBjNF8YVczE31CpcVlh2zrL2Ae+RaBRMYC3D5xQJlnZsfT
X-Gm-Gg: AYBFou3MGeEJxRVdEcLx0Sj4LyZ16bG/XPWalP0hxLy26UU37VPMQ1F04zLEP/xpa9j
	+a71IdII1OgWgMuVI4hvJMW+Gv3ZpYixTwLwjrKU96bygUIBCkD5foRJgRnYnk1f3N2jSqJ5tHo
	KWcaq8liWa8y8zh93xzePpVRa9uVkFRcNCHwqlCC/OpKsEARUQH0bYfz4dW/qMXNPduy96PPWlw
	Ju+gQCCQ9wmoZTYKmGvy00Qy6maqlfP5XsDXtm4uSOlOTeiJB0ynOGv+j0smyVAmU+bkZ3CfySz
	d6gprrqP61NJ532DGICdQhr7bR5cgdWLvev/YHvw5dhjYFrgFrHuxGW/eqjI3nqR2Nq8G1bdZk2
	putIoGDftAVzJRZR8hsv5HZcA75kl2HP3vnLZNXuZnFf2I0aeQ1o5mcH0HJq4ng==
X-Received: by 2002:a05:620a:280f:b0:93f:11ee:ba5f with SMTP id af79cd13be357-9494bca42ccmr526939185a.79.1794596074460;
        Fri, 13 Nov 2026 10:54:34 -0800 (PST)
X-Received: by 2002:a05:620a:280f:b0:93f:11ee:ba5f with SMTP id af79cd13be357-9494bca42ccmr526936985a.79.1794596074040;
        Fri, 13 Nov 2026 10:54:34 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c888b90d4sm5762454f8f.9.2026.11.13.10.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:54:33 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: qcom: Correct white-space style
Date: Fri, 13 Nov 2026 19:54:27 +0100
Message-ID: <20261113185426.183501-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6956; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=+cwBvi/OxmEVHoBLxmBLN15WNowNdLnafX4q3m+XQhs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq91zil3CEC3XipyOyjj2DPWuJJKZsq9BuCrkCA
 c9835+9c2KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavdc4gAKCRDBN2bmhouD
 1xfeD/9CjLbsyhgAzrFyF/wB202oa3X4BZgtiOBG9iEufmDV9aE1KdlOWI/H5f6KlOvLOW1Udfg
 JrYHJ5HvPJhvPaQOVJSNsyoBslf0syOHQ7zCb62N7YIzr+vsb7yuwYUO5sV0JPCEDcBsV+lmgZl
 mUgwHKhgMvT8lF+F00miyVJ7flfSKW8lPnHXW8tvhjhlqRp6xsAUu5Zg55laHDGuTrSNlvT0eCV
 WfXiKQjYnlTVGKAXijWQaetE8GWUtdpX0WUqj4syxTDT2KSUMIAzsVW9CkVvjXjMM3op7ndeDgh
 kNQTk0sC2+I1HB62sTwX3eNX+i7PUMo4venMzahKwiwe8H5vPGv53oaCJ40frWC8g8EHtvZR7cF
 1AtSzmZkjevDb3/cyObac+7Ozly1Y77PQ2yic6gPrtqjJ943JnJduuaHTu99bbqKe1zKcQ8hBlJ
 K32KIwQtsetgKSX3XPx+II4qhSfCs1MmaYX22ESLcFesRtdqD6KBO8x8OH6LYmEJXEK9/1QSFkW
 FHdHt8FH2OFqIUkvkT+PUp/0+CstYkg5aRfuwFx0P//kQjuWPx8R/mmVlmouquTLb6MRL779kqj
 FS/gPjBqGKkkM1CMH689tzRbmhHjpbfxAgAlrBEc7xon/NClDbvxaPxIPfZnN4TI8J7VbkEQSsK 4CGHMN2eeOHeXvQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX++ZZ6XftZ16i
 aOvgaCtaQplW+JliY+RJg0L/ljF21gyWLT2tDQO1o1KwTj5j/hCM9nsHeVadSvARxNrVqsSsnjf
 yB1Bg7D8uRiCi9yd/F/qJZeCs0SLh3ZNRT+2XSDwIoG8jrnIDpTuXSONc7QJmiAsuAvhf7TSo1G
 L2+gTk1g9XgoMt8eoz/r9uoBbQ8vtlFZ8R2ajYZLfqqoGDve9dlADbc+Xu+N9A3xnSiM/S5P7qh
 9boBBb3UFnrfCCbeBCAUTouN/TyfB4uLvVeX2Dy46HrF9cZmLSh/CATVdqh1WeHN9c7BneU9tEi
 hvDP6h6DuMOVQEjOJ/CbDwvEyVtR5E+w/i22NSWWPxrxTBilRMOF1192f4+7LvpsJe3Y+SMx2Lq
 m+EAMaeenUwVU5b3QVrPNgBBiY9ouoyXf6XyOo95flfaKwZosM5IUYGeT/oNRFKr25uwVG6unQ5
 sXpC1WUr0cY8pQ8s07g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX+ATSpG89KJ08
 gnnpH4hfPSM2bkwSGB+hkRv0TY7FjDCdKjeTxcUbhbHC+goiHboqpd6vcXPNLLyacfQTbZt3dFr
 6eXG+XU3tdbNyxINibOe20SACoi5QSQ=
X-Proofpoint-GUID: dA6hJZ3ZLDB4_1ZT5lww3CcATrfjIFxv
X-Proofpoint-ORIG-GUID: dA6hJZ3ZLDB4_1ZT5lww3CcATrfjIFxv
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af75ceb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=qeHlmA2xqscd7yt2h3EA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075

Correct minor style issues around white-spaces (e.g. double space before
'=', missing space before bracket, spaces used for indentation) to fix
dt-style-check warnings like:

  monaco-ac-evk.dts:825: [redundant-whitespace] extra whitespace after :

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9650.dtsi         | 60 +++++++++----------
 .../boot/dts/qcom/milos-fairphone-fp6.dts     |  8 +--
 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts    |  2 +-
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts |  2 +-
 .../boot/dts/qcom/sm8650-valve-deckard.dts    | 10 ++--
 5 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9650.dtsi b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
index 3f18438be6fc..9ace638e43e2 100644
--- a/arch/arm64/boot/dts/qcom/ipq9650.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
@@ -530,12 +530,12 @@ frame@f42d000 {
 
 		pcie3: pcie@30000000 {
 			compatible = "qcom,pcie-ipq9650", "qcom,pcie-ipq9574";
-			reg =  <0x0 0x30000000 0x0 0xf1d>,
-			       <0x0 0x30000f20 0x0 0xa8>,
-			       <0x0 0x30001000 0x0 0x1000>,
-			       <0x0 0x000b0000 0x0 0x3000>,
-			       <0x0 0x30100000 0x0 0x1000>,
-			       <0x0 0x000b6000 0x0 0x1000>;
+			reg = <0x0 0x30000000 0x0 0xf1d>,
+			      <0x0 0x30000f20 0x0 0xa8>,
+			      <0x0 0x30001000 0x0 0x1000>,
+			      <0x0 0x000b0000 0x0 0x3000>,
+			      <0x0 0x30100000 0x0 0x1000>,
+			      <0x0 0x000b6000 0x0 0x1000>;
 			reg-names = "dbi",
 				    "elbi",
 				    "atu",
@@ -630,12 +630,12 @@ pcie3_port0: pcie@0 {
 
 		pcie2: pcie@40000000 {
 			compatible = "qcom,pcie-ipq9650", "qcom,pcie-ipq9574";
-			reg =  <0x0 0x40000000 0x0 0xf1d>,
-			       <0x0 0x40000f20 0x0 0xa8>,
-			       <0x0 0x40001000 0x0 0x1000>,
-			       <0x0 0x000f8000 0x0 0x3000>,
-			       <0x0 0x40100000 0x0 0x1000>,
-			       <0x0 0x000fe000 0x0 0x1000>;
+			reg = <0x0 0x40000000 0x0 0xf1d>,
+			      <0x0 0x40000f20 0x0 0xa8>,
+			      <0x0 0x40001000 0x0 0x1000>,
+			      <0x0 0x000f8000 0x0 0x3000>,
+			      <0x0 0x40100000 0x0 0x1000>,
+			      <0x0 0x000fe000 0x0 0x1000>;
 			reg-names = "dbi",
 				    "elbi",
 				    "atu",
@@ -730,12 +730,12 @@ pcie2_port0: pcie@0 {
 
 		pcie1: pcie@50000000 {
 			compatible = "qcom,pcie-ipq9650", "qcom,pcie-ipq9574";
-			reg =  <0x0 0x50000000 0x0 0xf1d>,
-			       <0x0 0x50000f20 0x0 0xa8>,
-			       <0x0 0x50001000 0x0 0x1000>,
-			       <0x0 0x000f0000 0x0 0x3000>,
-			       <0x0 0x50100000 0x0 0x1000>,
-			       <0x0 0x000f6000 0x0 0x1000>;
+			reg = <0x0 0x50000000 0x0 0xf1d>,
+			      <0x0 0x50000f20 0x0 0xa8>,
+			      <0x0 0x50001000 0x0 0x1000>,
+			      <0x0 0x000f0000 0x0 0x3000>,
+			      <0x0 0x50100000 0x0 0x1000>,
+			      <0x0 0x000f6000 0x0 0x1000>;
 			reg-names = "dbi",
 				    "elbi",
 				    "atu",
@@ -830,12 +830,12 @@ pcie1_port0: pcie@0 {
 
 		pcie4: pcie@60000000 {
 			compatible = "qcom,pcie-ipq9650", "qcom,pcie-ipq9574";
-			reg =  <0x0 0x60000000 0x0 0xf1d>,
-			       <0x0 0x60000f20 0x0 0xa8>,
-			       <0x0 0x60001000 0x0 0x1000>,
-			       <0x0 0x00088000 0x0 0x3000>,
-			       <0x0 0x60100000 0x0 0x1000>,
-			       <0x0 0x0008e000 0x0 0x1000>;
+			reg = <0x0 0x60000000 0x0 0xf1d>,
+			      <0x0 0x60000f20 0x0 0xa8>,
+			      <0x0 0x60001000 0x0 0x1000>,
+			      <0x0 0x00088000 0x0 0x3000>,
+			      <0x0 0x60100000 0x0 0x1000>,
+			      <0x0 0x0008e000 0x0 0x1000>;
 			reg-names = "dbi",
 				    "elbi",
 				    "atu",
@@ -930,12 +930,12 @@ pcie4_port0: pcie@0 {
 
 		pcie0: pcie@70000000 {
 			compatible = "qcom,pcie-ipq9650", "qcom,pcie-ipq9574";
-			reg =  <0x0 0x70000000 0x0 0xf1d>,
-			       <0x0 0x70000f20 0x0 0xa8>,
-			       <0x0 0x70001000 0x0 0x1000>,
-			       <0x0 0x00080000 0x0 0x3000>,
-			       <0x0 0x70100000 0x0 0x1000>,
-			       <0x0 0x00086000 0x0 0x1000>;
+			reg = <0x0 0x70000000 0x0 0xf1d>,
+			      <0x0 0x70000f20 0x0 0xa8>,
+			      <0x0 0x70001000 0x0 0x1000>,
+			      <0x0 0x00080000 0x0 0x3000>,
+			      <0x0 0x70100000 0x0 0x1000>,
+			      <0x0 0x00086000 0x0 0x1000>;
 			reg-names = "dbi",
 				    "elbi",
 				    "atu",
diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 5c4581410a40..c9638684e3b5 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -1035,10 +1035,10 @@ &uart11 {
 	interrupts-extended = <&intc GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH 0>,
 			      <&tlmm 51 IRQ_TYPE_EDGE_FALLING>;
 
-	pinctrl-1 =  <&qup_uart11_sleep_cts>,
-		     <&qup_uart11_sleep_rts>,
-		     <&qup_uart11_sleep_tx>,
-		     <&qup_uart11_sleep_rx>;
+	pinctrl-1 = <&qup_uart11_sleep_cts>,
+		    <&qup_uart11_sleep_rts>,
+		    <&qup_uart11_sleep_tx>,
+		    <&qup_uart11_sleep_rx>;
 	pinctrl-names = "default",
 			"sleep";
 
diff --git a/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts b/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
index 3780642fe483..395489c65242 100644
--- a/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
@@ -872,7 +872,7 @@ expander3_int: expander3-int-state {
 		bias-pull-up;
 	};
 
-	expander6_int:  expander6-int-state {
+	expander6_int: expander6-int-state {
 		pins = "gpio52";
 		function = "gpio";
 		bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 48fbf0650f0e..69f05bd0169f 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -1204,7 +1204,7 @@ panel0_in_0: endpoint {
 				};
 			};
 
-			port@1{
+			port@1 {
 				reg = <1>;
 				panel0_in_1: endpoint {
 					remote-endpoint = <&mdss_dsi1_out>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
index a83cad8efb2c..6e7a8606d179 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
@@ -958,15 +958,15 @@ &i2c2 {
 	status = "okay";
 
 	eeprom@50 {
-		compatible  = "atmel,24c32";
+		compatible = "atmel,24c32";
 		reg = <0x50>;
 
 		label = "strap_eeprom";
-		vcc-supply  = <&vreg_l15b_1p8>;
+		vcc-supply = <&vreg_l15b_1p8>;
 	};
 
 	eeprom@51 {
-		compatible  = "atmel,24c04";
+		compatible = "atmel,24c04";
 		reg = <0x51>;
 
 		label = "strap_v2_eeprom";
@@ -993,10 +993,10 @@ &i2c5 {
 	status = "okay";
 
 	eeprom@50 {
-		compatible  = "atmel,24c64";
+		compatible = "atmel,24c64";
 		reg = <0x50>;
 		label = "core_v2_eeprom";
-		vcc-supply  = <&vreg_l15b_1p8>;
+		vcc-supply = <&vreg_l15b_1p8>;
 		pagesize = <32>;
 		size = <8192>;
 		address-width = <16>;
-- 
2.53.0

