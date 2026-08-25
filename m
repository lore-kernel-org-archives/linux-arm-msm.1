Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706893CAA3F
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 19:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787685223; cv=none; b=VfRwgAHDg1xxQ3MtU/e0mDosFr0AcGWMHWxuNR88LEgYbr1urXnl4dzLGSo7u3TbxYIIyd+kWt6+l0uBfIm412haGcHGzdI5CVHh3YCx13GBzPULLJ2zUh75snugUIdx+SoYFDDHnCw2Jv3y6DRg0C0NQ54LJxQ3Twu0WDQ2GQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787685223; c=relaxed/simple;
	bh=9aW/Il+F3jmFYDK7Xf+eUMzXhXUAVEvmzmS8mqMS0sw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kAcp079w0AbiUscVsEVpIWo0KCCbpNR/l9OeX4k4z09MLMQ9JvqVHdF/7CTGVDBDriJWDzbirxSiipnH9jjFw6R+FbDia50Tw1zGMY73/T71cvuA366DuVOie9yFKZiZ57zaI6I8/6eiqPCJTJdO4Fpt165/mHGTAubOzzgxuOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lyBsUtGG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cvCRf8GJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lyBsUtGG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cvCRf8GJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PHdBxr3672836
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 19:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vvx2K3BvEqIIUviRBaGf5QiNj8YmLTWogvn/E6iomOA=; b=lyBsUtGGPY+o4Y61
	vDKj+TBib25k1w3GPFp8h7+uswMOBMHHS8pXyTkONLEmHzOae75LTr8hJS4uzYcv
	RAqf6UbKOwdQGD9mbsHchF26kLEQqVi4KZkTn+V+cPT7mKSz2HLz76wMMgaxtPzD
	2zUmJYnLPaBAaDUh80XgM7amxDqIvCqG87r7NxlVgdPo/zZbFt6DrcUvTwaO2bIe
	kb84I6GBiH08uDvctqp3SnbNqy9sShcF2WZj3T5BgxWLyQUe3LijHI6UoB6d0nc3
	Vcw4uwZKlnuSLHgk0TdouSUFfLDCsynLoOjdwMhGMe4VoQLrvn93la+SC945DSt6
	A6aeiQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9bnj9mpq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 19:13:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cacd6d37edso2994735ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 12:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787685220; x=1788290020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vvx2K3BvEqIIUviRBaGf5QiNj8YmLTWogvn/E6iomOA=;
        b=cvCRf8GJTNWlyvCGoFpgzs0nS1PbeCswOAVZnHvXFb8KmjeDIVCIqXbhk4K1n5e65H
         DlEySCTlvMhq2LcLwTMFj3vvq+5bYVRwADZGwuUkyvgECMdISFrClS9iau3oI6IsW7zV
         8XlJqoloEjcbCSvlsRkmimyCPDHFHlxMxsbA0g+t3b/M2kK1r05uToCq0iKJ2RBcHehg
         m+BVmD6US38VPwqkMUP6NzF5Im+M3fdbY+NsYBWFm82I5FkdnoqKMPSKEX/vA6Znf+LE
         ipmzyoWD75EZHj+6Zqe2BvDp7cfT3U7DlvVtja+QC5u0Gr+zMMPXwgOGlXa864fehSZT
         5OJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787685220; x=1788290020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vvx2K3BvEqIIUviRBaGf5QiNj8YmLTWogvn/E6iomOA=;
        b=o+cVSv+too99DxmqnBghPnerZs/i0RQXh39S0MBU+K3TbWZcIMIbjCljj9vgl9gYYl
         +W+w4W3+0MYoJs9uKi/kpppBxbH4oFbg6JW5TVWeDBmyYgcN/S/IfVf7+i4VLHbIYfi2
         mI5qdvZLKUDSG2cDhrlMkMvCLhYj07HMzXG9XRAVH/+OBk3e1Uru5TbN96e4T99+hvBR
         z0Qbx3mcHcmlb7xS0y9k91wvKHUESoZhYaBJj0ajBaOZUn+rEKjtshr8NYJM4g4dubuJ
         T3ZmeXS1E02skvo8hmOIUs4vBWoFRTR0udowsTIhriX2l7gGNq9CdGREY56y6h2/tRS/
         WNDA==
X-Gm-Message-State: AFuF++m8mGvb3IQnwc7EOSWV2/Pyyp0K7EYCcjcCm8MdxZE7vLAli6+x
	U4vSnH8CTjJzL+4ovnY8HJmI7YSsCNAUEhNVbjzrlGfY7lpBAP550ZIublszS0T9WvFN2BpfegG
	WI6SfN0dCzm7kNlWux2k6dgVp8Nh0RXMuoBcB2EGQlYdmExzCF1PaTEjuTVp1BECC3i8k
X-Gm-Gg: AR+sD12Iww4RtlsSZk4jMcXn1TRkEH6/KmX9WL1bSqH+JPiXwfT4Z4tiAOW2BvOQdYS
	CxzQgDva+64tRRtk4n+OD5l+lHceZAoRnT8GvHGPq909+NRoueXC6tfIy45mj9Hw+zjY80G9mWS
	WCaRmi+GEYb1A/oqs2soNq/vmOOIv01RzdGn+cafVbMZU4zazFRS7CwetX5iD56FAm2B8oPZnbP
	ABNgMI5/RU4C8drBntDj4tI3WlBMw1//N2dv/ARq91g1hFcD3lPS0XCskxfCwWwsmw3X+8l5QJP
	xKczBlbwOOjV1GY0VzaUME5XW1b5qgiMZsO7LShr5EhfnQ7uBYo8ZNSEr4t/B58mYW88hqmGdIQ
	9MfkRoXTRL4EF/RXfb1U4fTXxfpEd5ATn
X-Received: by 2002:a17:902:f789:b0:2d6:ede8:51c5 with SMTP id d9443c01a7336-2d707a0b16emr9425405ad.6.1787685220066;
        Tue, 25 Aug 2026 12:13:40 -0700 (PDT)
X-Received: by 2002:a17:902:f789:b0:2d6:ede8:51c5 with SMTP id d9443c01a7336-2d707a0b16emr9424495ad.6.1787685219574;
        Tue, 25 Aug 2026 12:13:39 -0700 (PDT)
Received: from hu-afaisal-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283da048d3sm930416eec.28.2026.08.25.12.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 12:13:39 -0700 (PDT)
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 00:43:21 +0530
Subject: [PATCH v4 1/2] arm64: dts: qcom: shikra: unreserve GPIOs 14-17
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-shikra-dtpm-v4-1-8476223184de@oss.qualcomm.com>
References: <20260826-shikra-dtpm-v4-0-8476223184de@oss.qualcomm.com>
In-Reply-To: <20260826-shikra-dtpm-v4-0-8476223184de@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787685212; l=1477;
 i=khalid.ansari@oss.qualcomm.com; s=20251105; h=from:subject:message-id;
 bh=9aW/Il+F3jmFYDK7Xf+eUMzXhXUAVEvmzmS8mqMS0sw=;
 b=pr/YHzGpp8IkwEicNT0Lcow8PkwzdI0RmahKygyBdX5yVRyuj+r6qGyDEd+3Zz1fblRQmy3fE
 cYnstZk0gIHDo2176kNIW9A8+tKB/nA8WvCGNTx7LAdBRVX7wB1Eksg
X-Developer-Key: i=khalid.ansari@oss.qualcomm.com; a=ed25519;
 pk=eBXrIUgTWV0cgG+GsNeZPPgvj1Tm6g9L2sfcoxMGrKo=
X-Proofpoint-GUID: NAYTLf16Jx7GLQEsVX4J4Tupi5myEsWm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE2MyBTYWx0ZWRfX2Iwc7T4POxuL
 YvlMeaycfaqa8e80H8X40hj4qqctu2u46z30TBzdWhfAvrp2m2K4n89CAGi1bg8yiBvxtCzwiqe
 erUcgc6iyMsA1+eEM1/SUqk5GTvLJjz3MPH/CswiVbtPnC6CarNVmhR2T9n7h+UVnlh2PgFRYA9
 R3s5o/oXofsnIi3UJGFUAyaqmf2kVUGgspHFtcsG0Xhx2wiOY11Ji5W0nxUmZsNKn48/FUNltlJ
 lAasQ9GuXK0XtxI7B0CM9Hk3kaMP4fIs3glIYN5+GG8DXokrSIFVKmA4i2ZIijXAj5fsrw/lnpT
 qVBdsGI8nxAx3189zdJWf7TH2buPBoMnfAjqBqqPHwqIvZ51bWJmp8Bzs2mH6PGXt2r8Qoa5nAZ
 /VNP6fWBPZ5ISvHynCdtOphu8JjMjGA6zrlKxyUcETecmVL7T90EtHvDv9sPClK6y4Mmr0++dIy
 aouU9Q+sbF93QfFWRmA==
X-Authority-Analysis: v=2.4 cv=ZuHd7d7G c=1 sm=1 tr=0 ts=6a8de964 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ikZB-fCjBoBaDskMKxkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE2MyBTYWx0ZWRfX8Rx0M139jXKf
 BrutbV4ukZ7JrPxy6a4ghZ5dFzL2XEWgxJEnFgF//A1+J0AJhCMgjZRkAKK4puDPKrnnptnGhIM
 SmqOchBLIVLsr6mz2CgH3nc/SJRTBLc=
X-Proofpoint-ORIG-GUID: NAYTLf16Jx7GLQEsVX4J4Tupi5myEsWm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250163

GPIOs 14-17 were previously reserved in the tlmm gpio-reserved-ranges,
preventing Linux from accessing SPI5. Removing them from the reserved
list across all three Shikra EVK variants (CQM, CQS, IQS) enables it
for dTPM usecase.

Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 1 -
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 8ac42ff625a0..fde7fc035bf5 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -197,7 +197,6 @@ pm4125_l22: l22 {
 
 &tlmm {
 	gpio-reserved-ranges = <6 4>, /* Fingerprint SPI */
-			       <14 4>, /* eSE SPI */
 			       <30 2>, /* NFC SPI */
 			       <138 1>, /* NFC Secure IO */
 			       <155 11>; /* eMMC Boot */
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index 4ff97945274d..e119ace54e58 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -219,7 +219,6 @@ pm8150_l18: l18 {
 
 &tlmm {
 	 gpio-reserved-ranges = <6 4>, /* Fingerprint SPI */
-			       <14 4>, /* eSE SPI */
 			       <30 2>, /* NFC SPI */
 			       <138 1>, /* NFC Secure IO */
 			       <155 11>; /* eMMC Boot */

-- 
2.34.1

