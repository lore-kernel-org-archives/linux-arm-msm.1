Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523186;
	b=Gd6peS1V6/Tzlx+6Kx6Px0fEwjREKINB4VceXIycC6xMMTkj1GQ2tQkDiAk4DC8pxNTC
	 5g4k+yiF3hgWb2Uqy/Eav/2HEYnvSdInN+sTk7dOU2IljrmsUcVrrlFd/rcADHoK5QHS4
	 oTBc91pFIVZrlJUbQvvYCNHENMhqiEohLqerduybK7KXhoPb8KQUZTfJcusqo1R5O5NPV
	 s+ayZUbMMSQtD/Ow7u6qvS+oMIkQ3yr3yojTxtCDqw/rPyZSPc0yqEctm30p/ZhfzkL3d
	 qcuT8nOpdRHFbGTmm0kphXQv1XnKb9HRMmla+Tjc0x67bCoEW4i3rwtes+jm2SiZJBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523186;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=L2FQwINb04s7mJ3OBtOg2oqHSpYWCSQGkL/MPOtCiMo=;
	b=sg9I72whuwi8ccmaM21u6vs5Ugi5aE0g1eUsKBe0Lbfn85Ak3x4QRVgmlwM7L/6o1RDd
	 R48mobbmZKLfKovrZca9g3BZwWDVCobyMaGOGiPwZeYONs6qbYcX3b5pTnPu4pm2j7ACz
	 37h+tACrwr7arcZgBFhb/gAhpLLuhKQrKtO+j61GUDa+jYs9xvIgU++GgGnbpGZot5FH5
	 vGCrH0RcCey3TvKmvDeCFgvFd5+ybQoBx5Ugt82AzrT49m+ugW998aNaUm7MHSn+z/Fez
	 btFHutd1pZ4Eg8cZFZI13tGE/SAh4lmk1opzUqywDu0IX9mJHtV0E2+8kM0kMF9pxqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q3xZNhkB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jZYsat8O;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1DF606A330
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 22:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB1DF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q3xZNhkB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jZYsat8O
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACJZXiK2266586
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 22:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L2FQwINb04s7mJ3OBtOg2oqHSpYWCSQGkL/MPOtCiMo=; b=Q3xZNhkBWFe1lWE4
	AeuH8BITv502qgQA/TRAo211X9vwsHk+KQQlAR14tBWzdyvAQPKufqKCH90hoe/S
	b/wTZ01ZFma0DSVxlG7EFUhW2NCf6x2I+IL8c1N4leJhK9YWc6opA2O53L/+nDtD
	zX5XHeB1lhiF7COt3FtfX4JJZO1EudxCiIQDj0aBz/TcJUxmqXkPS/G3Aavvy5vO
	/u552aoPrquOBEAIYJ6a4rKMDpvq67mYgVxTPuJOOkj5mn5+VK23ULSU6njl/ZZH
	0GSuQj6pjXgjDBjMWdXnHo2rrkA56S2hkvCjhCANCACcX4l3Gl7mIpCLT2PofdFu
	C0m9tQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc3jna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 22:39:45 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-370230d93efso1400143eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 14:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794523184; x=1795127984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2FQwINb04s7mJ3OBtOg2oqHSpYWCSQGkL/MPOtCiMo=;
        b=jZYsat8OIKQ/9NS8j3cTctWawQcKDLyBAU+SPeJVVJK4sVgkjmXaHuUlciRW/xzYQD
         Ay2vvJgQtBLL8D0r10bdC0jX61G5xWr8AGcpWcO9nEEXrQEOKyuvRTl4X47wYb3QzhCs
         /aWReYWYFEdQL+yL3Oh+pWVRy55zvWZKJ13fmtFLihDCl2keiqxpWD5ZRQqRH/5UwD6I
         L1t+KAfFiKzBU1sPE7BlWMo7V3CBnony0VImWDVIGFQ74E5/eF/GEwrD/uZyUdd8Hwai
         xWFIsclz6lJIE7RnSePVgLnaWdX4swGK2loPiLw7pM+j9jZfJSRKyLdQmTT0znQasoGA
         nN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794523184; x=1795127984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2FQwINb04s7mJ3OBtOg2oqHSpYWCSQGkL/MPOtCiMo=;
        b=L4EcM9JoAh/b2OuMbz/tvV83AlqHArPk/2id4kG34A5YicBgu+8/TEC62xQ96eW5Qx
         dAI8TyQ+0fQnE1P2LVmZjbbsUwfNEmVl1hxwRfMrsOO8+cydORjKBiKsSjt0kVAUGH3j
         hQhXAQavH3qXntEw9V4UPKJK9rOjBBIMQ1rRKvUqbHpY2sNAOlxI7RRluvSlFVYKATcZ
         mRHk2ceiSMXmMhJIdmaVFTh0haL7FxlnFbLRWxitQav+CNDfv6nYxMiJ/kMtNyl3vrWd
         G/0Gn1iZmaLuvMjEIkrUOwGM1J7crh4cBdOezxurb8gamLlwPfsp/WI0fb+WSeWu313n
         k8ew==
X-Gm-Message-State: APuU4Z88Qbw9wCu925YvPG1TB9RGnfRkaFxQjGz7z6ZQ9pY/bTywNA+e
	QusnO4F1srKnYgq+iEYR5W8cEle9OmR74w3PDdMixWNB9oMdzjZJ0QHiWeMPElJuvGxZTEv3hjL
	wywsvdYvKOmtCrWcXhLdVt3xpPUB8bCqqnJmxM6jPZY6vMpEGxHb0x6SJLkRwso0Nqyzh3w2vFb
	0T
X-Gm-Gg: AYBFou28wILt3faGpMLYRcabTWS8OCHroNHMpTxKZ4Jwbkc746p4Q8hDKIZqxDNsBlv
	BeJDao3fb30XRCas481op5V3CG2KlwkBPSFGEEyXoHlMc9/u1CoR6AYrZ7F806SqtsR8khilo4x
	dsTJF3WeIwiVbI1BB7KMQMDdEx0xDg/hEKliVe429FsncJI2UFYpXElSboG965vauvlcdlcosow
	uNQ3MMa/Df8qH2vZiBpm7dcJB1UEhYN3U0c9geO6U/B6+XJ6VfI0xAfztJEuvWL7TTnYLaQEjEQ
	FhnVwY6aOfHH+g1Su3CfzHJ4eGQJ4f1aPjVhw0x4AmotR3YvSiISj+KBtTr61TS94v0azjrCXRa
	VrgF09DiCur2rin4B9wULF0d4Zj9vYpcaqOCnz/aK0+qzZ0malENiBr2BH3+W1LwsnVG4kPzNcw
	994UHFgEbyKw==
X-Received: by 2002:a05:7022:f503:b0:166:b307:5855 with SMTP id a92af1059eb24-1b502fe3953mr895767c88.0.1794523184506;
        Thu, 12 Nov 2026 14:39:44 -0800 (PST)
X-Received: by 2002:a05:7022:f503:b0:166:b307:5855 with SMTP id a92af1059eb24-1b502fe3953mr895736c88.0.1794523183996;
        Thu, 12 Nov 2026 14:39:43 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm2333496c88.5.2026.11.12.14.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:39:43 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 04:08:31 +0530
Subject: [PATCH v13 5/6] arm64: dts: qcom: monaco: Add OPP-table for ICE
 UFS and ICE SDHC nodes
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-enable-ice-clock-scaling-v13-5-258dc817bd63@oss.qualcomm.com>
References: <20261113-enable-ice-clock-scaling-v13-0-258dc817bd63@oss.qualcomm.com>
In-Reply-To: <20261113-enable-ice-clock-scaling-v13-0-258dc817bd63@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: vnQhoCXPzMTrklIsaVKwCrexEi9fHa3U
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA5MCBTYWx0ZWRfXwlNLERRPaIf1
 0zpyy0toI/UGMbTbIV6Dt3l56N0reJIuqtNcIQTsS75y0TG0Q71fHNZmWGBmibcBAC4dbS9nyIU
 xzp6uH1RFqisIhfhv/89xNqFCZmGKIs=
X-Proofpoint-GUID: vnQhoCXPzMTrklIsaVKwCrexEi9fHa3U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA5MCBTYWx0ZWRfX0avkK6SRiCXy
 qlyTFyO/42VXK9DhMxS1bOK2mTvFfaME1g+yrRiaYLWJUr67L8MVULEvUX0EP/VmwCVfIg/7iXs
 715jrzBP0szvNupnVZGgVdLvsFawplQCKA3oNczsOvKoRqacEivf/LLWgyHGw7xKckD3XbA5T6I
 a1oUxpUGmu90248U2f3zsZKVyZUPBrLH2kaooiTlCv8EHfYSmmoMVp6kl7x6Z9Hx+3LlyT5DDO6
 qJHeyVG0hea+fHWfmtb7SS5M9CWpRWdtOC9Hn+0oqzf6ahDEeJborIAH550u/wPgV8c+JWtEHSW
 DXx5w3zJYLYYUJaKB7828dlJOqMR/Yh+/aywt1Uu8H73C4iljk6M3p0opk22/An8NxS7nRNb6nP
 XSWQTHgB701A9s9CxajzNjWdjuX8RsO4NCDnYKrNHk5RJgmO1tN9bDmUU3cUSI+pK0B8yo4ymrf
 d2+Cf1UQOruNRhVecSw==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af64031 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=IFdraIdqUsMg42QbtkkA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120090

Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
an optional OPP-table.

Add OPP-table for ICE UFS and ICE SDHC device nodes for Monaco
platform.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 3541313a79bf47fe27499f6dc370cb778d780a08..d7e2038854b0bdcc91d65d5712290c690e772258 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2725,6 +2725,27 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+
+			operating-points-v2 = <&ice_opp_table>;
+
+			ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-75000000 {
+					opp-hz = /bits/ 64 <75000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-201600000 {
+					opp-hz = /bits/ 64 <201600000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-403200000 {
+					opp-hz = /bits/ 64 <403200000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		crypto: crypto@1dfa000 {
@@ -4890,6 +4911,22 @@ sdhc_ice: crypto@87c8000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&rpmhpd RPMHPD_CX>;
+
+			operating-points-v2 = <&sdhc_ice_opp_table>;
+
+			sdhc_ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		usb_1_hsphy: phy@8904000 {

-- 
2.34.1

