Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165190;
	b=YYomFF9gqphACCNnNP2mhVZBUHdIk6edZaGr3cNuJbS4xJV5/KiNDQVtlZNSa1d8i77I
	 R5aENARqRAbA3bkrpH6QG+6C43xXycfYppGe3qMXQNIUueLqQ51AtkfgEa8sdoa7/icM5
	 JmALr/eJFNhYgYgfg53ZFmVr3Sa56538IY3jcRWZuY3PyVCYmrBQHE5w3ptqfiPJGk2ip
	 kXwrfH6ePM7f+TBmm33Fr3aR4JMVgLY4TuGtS2Sc0SlMBDT6pkDWhO0wnczN8YrCr2iQ8
	 MXynez6QGnv0JjuTvmdWJj65P4Rly5n9kMhZYOJDsd0nV3V6+kQuou/bq+bzFjbWm0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165190;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9yC3cw49LDStsX4tcMB+rfbv7t6LPElYR1xcbvBtwNs=;
	b=qAKnd3M74mhbpFitAVwJnqBC03hbTqZnLMe2+B39niEKqS8f6To1TCTU0N+JEb4YWJx+
	 ES+VtUMk8caexSUMCXJJwF0Ym6RgX8N1D6iz8zUQcUhRx3sWScyNjAEd9ua+G+C/bM5QY
	 N1qSewC8vvvPkAJk41FhMMr/NdVXej/rqUDai2cGVhxcjLtz+oe7FsG9LPRSbQBAKsF5W
	 y4hovu0KGFEwDz4sdXwO9KSwbftHgQPTQ5mxsAvyyuOSoK4bygDce9rKcd2+yEKTMi3yk
	 FuY9NtTHgqO+mpvRM1VkvN2m8TOtl7vgsRGn73EF+ytU+MapAC1qoGv9T/OnGn/oKYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BO0BDJHH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ElOsWj5E;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D27D606A33E
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D27D606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BO0BDJHH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ElOsWj5E
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7etOe3575575
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9yC3cw49LDStsX4tcMB+rfbv7t6LPElYR1xcbvBtwNs=; b=BO0BDJHHVP5a4Q88
	f5AOBZso9jP0CqVvq/jzpZ4YXg1gZ80sQqxBQhuOxk38gzK23+d+6E/XnupWkV7S
	kXEGgN11mu5Kbew6nqnca+/Fnwkkp6h3s41P/Zpr+Esp+GMvwHGkFjI3Y0i568Yx
	Ds7MThrfrA7j0AsjNuATNThYtO7NRcZUKf8mDr1/2vHmZ+PvVnDLhyFRl/k2GELB
	U3uZTgB05BxXE3nR0EN/CKRYQijwjhScCwVATg1VRG6NyJVEi8xavWBMFN4e0d8Q
	mtYm8m/4Qe86Eyl6/H3ZM4SsdA8AdqLL6I/9bIE4kYo+1nnWOV/a8h/bwN8EcHBX
	dtf7WQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu80m7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:59:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3846d5f54c1so799399eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 00:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795165170; x=1795769970; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9yC3cw49LDStsX4tcMB+rfbv7t6LPElYR1xcbvBtwNs=;
        b=ElOsWj5E9b0TS9gSBOn3D3+hcgB/GUZCjRBIuyrObE3uwE1pvQ9r1KDCi+Q1vQbBAv
         cuw3VEF9lL5wDqgSCGijg3r31M7+gAx4YJUkPwR+mOdUMsDaWU9hFW0wLARBodkCG73j
         ONRPpCL58WQBa45Y3w6Us5kpDvuRb+c1u86LoOybFddNRaQ/5ozY0ScrK1cQL4Kz0Lgc
         orGheWUZgR/j5Ahv950l/BIREqdRFqYOn6V/DB48PzHGBgVjsOhA8IH7+DvagFFUTi/U
         fhdB3aE2JEz/uUyoBvkgHACwhnhbua+vUb4cioh2gQqYjjENG+rFDLceFZMAivjlfOQT
         jlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795165170; x=1795769970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9yC3cw49LDStsX4tcMB+rfbv7t6LPElYR1xcbvBtwNs=;
        b=0M5FqVLDMwAWldk/p/cCcZaMJJXetz75roIlosjvlYoXrtHz8ACHe6OPmRLjein3mX
         JOwzDIinV/3KHSVk5oZJZk/FgS+lhBvmyV4QpaLGcopX5OMGvzO9TsqMe79DtNnzQdjI
         5ONMuG87D/oT6RX8QRXGlIYwC+u7Rh3ur3jIeJTpOoo2CBPjqjjYG9utZ/RKwsNvtCCt
         XV2qzJNV9Mt0/Q1Q5Cb9i6RvVOBUd72hA+vQsblrvlaWafwJVVOoS19CqPQRUG3eBrQ/
         /sdz+8PbjsmSgTTFCK7a46XKe/vYuMVgzsSx0MbGgu3ZQ3ZpBb3A0kyBoaU1VLr50rNL
         Zwbw==
X-Gm-Message-State: APuU4Z9hsRK39wgqbqT2rrrBvtA0XjcNjm3hDZPALmv4M9aLSJqQ92Pb
	K/Y2y5TrDPP9PP8wbMYysmRUuuyNy8Kq0lXCRLxm4y5E6EimIKFJMCcri0Wo4YE6/kMLOPdGRwH
	thFpqaOQzOTTx7fL9fZZ4asUjOvFdWbDJEqxFRnyxZOTAfpTK0Fdmgb7j5bY6YQ50XAQ3
X-Gm-Gg: AYBFou3iTZE/LnMygMylZIT/Y0sviwIbTFXjWPNbWzrCkVGZnINvTo+JEN3i+9HEiJW
	NgB2gak0BaiD+fWYhjtkmQTT1PnggpIdT1jMIjnPLIwMHfhEC0NguIsHynBH5fpHC1dcHmXheTu
	87FHhPsi07qhzqdTTNJp0+n7SGmExkKtTK0quc3XtjSplHTnynPfiIh/xdiNVrwaXPbHvnUKDq+
	6uxC91uTMy23Oso+8xLrB/Tm/60jrmePQWx6Z3FXaZOPxy39sSF5pxqthvxvvhEJgdaMqD5UxYQ
	g7MIgnYTGsmPJqTMvkCDweXxVXGNskYSweriyjzVeK/ziCLF3hGJl8a9P9jBpaApKqZlF+xGbML
	yxib4uNqJ0pa9hgi/XnOSbXXkqVGQBoF2moARBkB3cYYj98aJsClNY6sX/jhmsyWyPIwHENqWyQ
	I+XvKKlU+0oEiGxiXjR14YVWMwpNDQ9AsSwk63XpQ9UYx4oNks1e0S1+fmBx++8t5ptpH4dbLOn
	WNSxDQQ9w0=
X-Received: by 2002:a05:7023:b12:b0:141:5281:8a41 with SMTP id a92af1059eb24-1b55687fbc9mr2380957c88.9.1795165170331;
        Fri, 20 Nov 2026 00:59:30 -0800 (PST)
X-Received: by 2002:a05:7023:b12:b0:141:5281:8a41 with SMTP id a92af1059eb24-1b55687fbc9mr2380910c88.9.1795165169700;
        Fri, 20 Nov 2026 00:59:29 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm9490658c88.9.2026.11.20.00.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:59:29 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:29:06 +0530
Subject: [PATCH 1/4] arm64: dts: qcom: ipq9650: fix the TCSR mutex address
 range
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
Message-Id: <20261120-ipq9650_various_devices-v1-1-14f53b84c42c@oss.qualcomm.com>
References: <20261120-ipq9650_various_devices-v1-0-14f53b84c42c@oss.qualcomm.com>
In-Reply-To: <20261120-ipq9650_various_devices-v1-0-14f53b84c42c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNSBTYWx0ZWRfX4AkKqQOErqj4
 oFJV0L/FXNgV9RGmWwK/vNA+g2BXze75kXTYn7sEQF2r+/1n4VQ+LJKuB2Kf8yIlZv3hcRrHSP+
 sSbsXEMklsnNxDsAEr2idybVTrh2oZKuLk5bf8Hzbg6Vc1nbzWPzvs3734kuvoCiU15PcjmtNPo
 s+Cf9SjSosxaIk7PvUPfwQlhXKw3+LbIqAXsgV+Jh4OCePyBboTXKzRJVKO0Qgi0utrulpYHxYU
 4jBTocxgLoTEMobBeIxAKFlCZGJiaac1n1v9WBp0o7upaildQsBB+1kA9S1FC63dYRGIz1YyyjJ
 ejj3d0YvWpCcYbZjr3vhuWLFlfBFcfq3HXmkt+7L6hKoJteKGfsVmZgNwDiwEnN8i38EOgbkTnD
 74NluYKAt4DX8dfwDfRelowyNXULgf1i437zUvIKB0Kiza7/SxMPPOgjdVhMGyW8vvJlA+Ffs4S
 OditAWK+xquyrZfedMA==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b000bf2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eUx0VPcQqj1qSSogbGIA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: JKrfk4nNbQszKyrlye2MWwgsvkygbahN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNSBTYWx0ZWRfX6diHyBIk1blq
 r0eG9GGJSFKGjtT4DNBwKTQd6udhU0f+QA9O+fOLu3m7zUEWutd7ATiBKG3elELS2J3MSTvtAaw
 e9Y8L4C2VvvaP0l8pAK2uIWzGkKwCAU=
X-Proofpoint-GUID: JKrfk4nNbQszKyrlye2MWwgsvkygbahN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200035

TCSR mutex region is 0x20000 but it is mistakenly mentioned as 0x57000.
Fix the same.

Cc: stable@vger.kernel.org
Fixes: 8cef25a0044d ("arm64: dts: qcom: add IPQ9650 SoC and rdp488 board support")
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9650.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9650.dtsi b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
index 9ace638e43e2..94269c9c8d6f 100644
--- a/arch/arm64/boot/dts/qcom/ipq9650.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
@@ -385,7 +385,7 @@ gcc: clock-controller@1800000 {
 
 		tcsr_mutex: hwlock@1917000 {
 			compatible = "qcom,tcsr-mutex";
-			reg = <0x0 0x01917000 0x0 0x57000>;
+			reg = <0x0 0x01917000 0x0 0x20000>;
 			#hwlock-cells = <1>;
 		};
 

-- 
2.34.1

