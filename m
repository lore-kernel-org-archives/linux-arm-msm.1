Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8415743E087
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109456; cv=none; b=Mf5IdR42jbCoNQFE7NXPJYsctqHfmy754NXT/i/2BEshF0snTAHyuS2t/3WbHQuioqucHumM5Pqmr/qvgZpC6k6DtlP6F1xqkb9wZZlr5tW7UncWLLEamWmv1o4eI6bicWO4B/YYSlyw0V8mTIsAkC0Rw/B1jPpLQxb7JxriUu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109456; c=relaxed/simple;
	bh=txGG2oCDNTtagJRUuKL7R0M8TEmq6WZ4snmJ7KrOtTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jkzsr9GQLkbLh84Q6GLJoeuF8bh9aVGIBE3YEUdcTJBvXbGml/5U2rmoDUV12ohmdrZfI1Kdy1N6zpmpXfjtvdBjWv40SmUTQF/nmV9crgQ8w+aiRK+D/AZ754JE74bNl6RNg2sP/2TMoOQau4r0B3Eyw8U6++6eNZKfcO2nSWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JkjAjRyS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QLnbdD+v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JkjAjRyS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QLnbdD+v"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kWOY3709527
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ANtucg0EPqGoGTII2koncEnIcZSyH5bQdGP8YNE3III=; b=JkjAjRySmffFlQDO
	VXHIVMUEHn1emnnNj6B3YirxHNG5acC4UjolydTYdJ6wMILANLlF7s7aHXn9loLJ
	RH5VUSA0Ljg4twb6zhr6+FlJD+FuhpfYFM4+JfXYQUtgykLmJZy4+4ZPiahlBGxU
	bnLGQwv2zBmlQ1U/Rw6ttUpQ/ReNx13+/6NbUu1c2f25I10uvDiRrQH2jI8LnOAR
	sD6FgcJrhUHU3b0Mu0NMgxQJ+mQygOGculji102hqXhHxLW0wigW/tdz/wnoEY1p
	WSoU2s46u5whjKSFTIqXMaCYUcLHIn6d1dp86cLMWFmOXPd3yzK1NdfRzfLpDxRC
	VySDXQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm5q41hf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:50:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1a439db36so606543a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 23:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789109437; x=1789714237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ANtucg0EPqGoGTII2koncEnIcZSyH5bQdGP8YNE3III=;
        b=QLnbdD+vIG9k21GdNdFUO7nUZ89LnjGKBDrhDTsKHdFWYR1883512MTeqpMSLO6b3J
         nZh42W2Z+cqwPQsLV5w/wzA4Bijm0B6jv4eM1uezkLY+Xlux04+bStIcB77qLTVfn2bE
         4ud6yrZTht5Hv2nTxTtWT5XEy4HfW19Tu3UOnA+TAHDlJEgPmK7e+K5qH/YqM9wpJ706
         qkmEjoBZfWluqa4SNcfy0id3Vhgjg+q7zq70ipBiARh/IB/Buw8nRXKHMm/kJ45gGlnC
         LKxlp9XjGXo7EEs1UMhYWGoZLrYs2I4rlcvjXc4wyf98UIXZH6m4hcD66EZM9D5+IHXb
         up4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789109437; x=1789714237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ANtucg0EPqGoGTII2koncEnIcZSyH5bQdGP8YNE3III=;
        b=N3pwolnEPMVTiTrbOh0hm1GHT7PYv0EEoW7MLUITPKLu9mqHGOiRHTBVRxF5/Qaqt+
         bj1cNfbY7HvYdz1h3z+5tmuc82K5Y7uKvJEOBak+x8X6MpxdzN5AJmzwt9Tuytsccjrk
         5RhJsBUULdybezqtViueF/0V00wjfbfdQZkDVE9ICsP5124iX1kAxmwtqQLcDjAtQJUf
         g2sVkOwz0plsTROcpqQGKGHSb1hvuct3G0hHcn+R/P9d9GbWCvcsQuWhmVG3/MWVUyyM
         Xg2r3RLGX38qrOtqXljH1Et/TkSh2mhaa6ajheDKSztTBi7DnmsEfoBUTttnLE1vVcPa
         8MLA==
X-Gm-Message-State: AFuF++lmqJrAc8Tr8iGBgsSqbHNX0/a5EY4jzCzkdaDWB+kZC6PWaPuk
	YW8T1xrnTkvoMWMnIZVD4gl886W/fKRYeN764+d8qqOCU294/y0+Yam7ETXAKbebJlraqAjYYRJ
	R8kqF1AG93AIZ4eaQFw0KDKY12Q1FKOxpM8bgPJY533wOQd9uLD5QuJs5/tSBisT6OaWE
X-Gm-Gg: AYBFou05AIaqvV8vjpOzITOBt3mIq1jfdkdPBrYpW/vZU3YwoSbPct4JDR+NbOKAbM0
	iuVB/1ACMJsv2lPGR2wtHGHusU5ftFG0e2CVN2LYEtiYwebCTDFEmFVV05KVFZDl9xYnihxlJJe
	aTTj8VhW4vXTp1wUYWBTV3oYM9U9Pdap1CQJP1ABQ3Mlockr4VOx/fSK9WDXbgwJucr7Xu2qPXS
	uOpScKvirA7qVI+0jlMdw/8PlV++aBWzjDwIgWpesVATdzTJTr1tiWayCg4X4U3EiKbAVjaLCs1
	p7Ap4k+6ijkk/1+vNETDd0kVCfqqjXuUnH06gRPztF55+6PgoqJskEphQkqa0Xe5Thm3/DRO4Ww
	XkFsjF+8NPRWwLGDwJxWYbag+hCv+k3l4gvY=
X-Received: by 2002:a17:90b:5790:b0:398:9be9:ab8e with SMTP id 98e67ed59e1d1-39d9c21b847mr4640498a91.19.1789109437086;
        Thu, 10 Sep 2026 23:50:37 -0700 (PDT)
X-Received: by 2002:a17:90b:5790:b0:398:9be9:ab8e with SMTP id 98e67ed59e1d1-39d9c21b847mr4640449a91.19.1789109436629;
        Thu, 10 Sep 2026 23:50:36 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a598aasm3934383c88.1.2026.09.10.23.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:50:36 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:20:08 +0530
Subject: [PATCH 7/8] arm64: dts: qcom: sm8750: Add t-power-on-us property
 for PCIe root port
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-t_pwr_on-v1-7-c9eee197d082@oss.qualcomm.com>
References: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
In-Reply-To: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789109406; l=806;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=txGG2oCDNTtagJRUuKL7R0M8TEmq6WZ4snmJ7KrOtTM=;
 b=vQMF74YGhbBQLFZBTHDZQ2SyZkOOD4SMkSmxMAOBL9l0nh2ULEgi3dlQixAof9eMHrIfM5V/P
 lxdRc+Okj5iAYSfFBN/l96HHAF53FQ+Ofxm7zlHwPgdh5+CG4mZxTbo
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 713Kyyu2lVJDLjkNxg6ES3IXibDMtV5b
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX8aN55BSZpLWK
 enapIdcMRLt6R8s8LFIuuuXXzgh2rbYBSnH6hsz3SgjjzTR+BE/nDXa2n3gYZE1R9M+nfEqP+ti
 rE1AbyDzdbSQa6/EEXmnjm6InHz3X0A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX1MIHSEIwb3wT
 2rI/yZ/557Xl8AHxR0WyO/KPzafP/RLz959hwBBVH5vlWVRZAkI4jQ1MaUb1rIqdGoxdAlWZKGu
 SUU2hEto/Pjq6IbTXlD1wXUtBKkkoTh8jvJSRVjrbEOUjjywcb4XhFQDy6Zuu27JT2KlXq+Nrn+
 8E2iOAyLEmmaWmd0RG+8IGEekbcbcSw7lFO8qvpa0p/8VfRIgAHJvq+K4RZblk/ZfW8IdWBLc/G
 m8xR4/KD/Wl4tSw5gQ1PcyBq1l9WR4tNIU/s9K5ZNH5mG/awkwvU6kUG29L9Hh6SIzcMjzy/bA9
 jPbyfGAMCqFqBHDw+Z612+rili5ci4wS9D2WiRZ3DtPVir2bLAw3gQS6wQMZQ4Zn9tglK4S7ZaX
 fmuy/jWnVSpRTBfw6A3ckoV//m47nt2DqXW3tShZzbKjGVIxuR1GGJ2J4a+gOI62IqY8WRnKUrl
 m142iXblQ1ABb308E6Q==
X-Proofpoint-ORIG-GUID: 713Kyyu2lVJDLjkNxg6ES3IXibDMtV5b
X-Authority-Analysis: v=2.4 cv=Wsa+otfv c=1 sm=1 tr=0 ts=6aa3a4be cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110093

Currently the PCIe controller is not programming the T_POWER_ON value,
which can result in improper L1.2 exit behavior. Add the
t-power-on-us property to the PCIe root port so that this value is
correctly programmed during host initialization.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index dd738d13df8e..bb57385678f4 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -5577,6 +5577,8 @@ pcieport0: pcie@0 {
 				#size-cells = <2>;
 				ranges;
 				phys = <&pcie0_phy>;
+
+				t-power-on-us = <80>;
 			};
 		};
 

-- 
2.34.1

