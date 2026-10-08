Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CAA484250
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 09:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450896; cv=none; b=U7gnFSOp0nk8ta4t8XpICEG0Dq8C6mnG4M3HEoy0woO1/eUqez1hg/3jVnyq+mlzp/DHu0wt8U8Kt8iR7D5ktuM8ukONOX5hJ2DNRngnIr92NYxlhUgzFhgnDxYIKOLnCItwtNJaHWMnfMRTbDO9yZxTtmzFMYJyKShvB/sPCZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450896; c=relaxed/simple;
	bh=GhFRqakdXxPtxTbtrzN5urR2xQCR8Jnvt7LGgpDDpaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uNTqdzvJ7tKWJKZ+QsXX4IdAl3QDJGNBP4f04DboW+/PjKLunr2vNl6adfFPKAIrgUBIwhyD0J6iX3umRwiTVvJm8YUoxKurT44sV+kYJqNPJ3NQvc/ljADdWfzwv+duEE0wQi1lbohWY03L2s8k5zhQghs9HHbuw5gpVA22www=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ou93vlmP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EQOj4mne; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ou93vlmP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EQOj4mne"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KNb03307923
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 09:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3qcHgeO1xfv6UWffh/524xIdjtA4+f0IFUNruW8igoc=; b=Ou93vlmPSAyQ0wpi
	kuwT9fWWnsTwkxEzmwT/Ggopey4PYwVGeweLFP8v5PuZUbX8PCeoVk/pTnN/g4v2
	pzx2Vl+nKirvxLXX0G5wswzr18K4AcM+mPOalJw/4KdvhSRK0cpCogW/NCF7sdWz
	OKPfZfO3oV9MidGKxzgxGrSVxpxBUmShP1MEal/IkIOIaSGLppfpOwhqiTok9+8t
	WFqW7oHL78scZaJZ/oHur3WlHxsrESLp7hUvEXY42VDUr9uqTr0U/i/QoA/lVE8Q
	8x4M1Trh9XYD1BBiQveNO7PvHAIDZKbJVnNxZW6RVlyC9NsSlZsD6CGMFTshyX9z
	fl9ZHA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sg9p90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 09:14:49 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so17670931c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 02:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450889; x=1792055689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qcHgeO1xfv6UWffh/524xIdjtA4+f0IFUNruW8igoc=;
        b=EQOj4mneZgnIjatJ83rMaYF2nenbQ5g7keIcwLlONFiPZlMHngdWFwRf2jSmeQu2vp
         wy7E54Mg/e9JdAZyNQqsOxPcwYaShpgIdf7xb07cSS8aBCg4pFA78vz28R4oIPONiXzx
         uPPi+9gzoy7NzCawh4drawPjua0Sl1pLRPCUPhVfC56tdBYnvqELmIzKnW8rtdIFce4m
         cr4cALmX6Xg3otC5eLMs/z+5nbVmUuZuVoq303Pce01LyeLp52n6hYoXg7hscUoKBt0S
         HzMrR4RpCf1NiztvCOKBhHkBFv2wv4Y+t5H3JeyG6+Q3Rh+Sm98iFA6RQt6PImVWGROT
         s25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450889; x=1792055689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3qcHgeO1xfv6UWffh/524xIdjtA4+f0IFUNruW8igoc=;
        b=kh59+KJBesLtj2a1SqdLZ/+AOBVV/TLvZwci6SOvUt591tbTX7vm3dzwQ2fdp6royR
         yRYFpSrLr74Nsqrg3LyPDrG164bb+ZjWswX83PmIUHbHMVHGBaZVfNW4UWlarNIaUG22
         TuRy4nZM6NU+QO3RvUaswuJP2Cp71fm85wTMEm6pcAoS5OHGZXIyPVUO1gA4hzJaLTwE
         FYEac7WK+hWxQTJ9XLKPHn4rdYV0yfKAI8WBIze5ux2sruDMlnRUg0EotclZWFA5OSVb
         Qc2dOs4+G4CpLG7eYGMt/hqDH6W6EVTd8OO1mRaBLWVIbE0bygXJQ60nxhq8CFoq5iJK
         RPSw==
X-Gm-Message-State: AFuF++l4Jt3Sk7zwh72kfqE+QCx7Ub+kGnXK/5ljWxoHCWPfnaYiq2oq
	AlEQROSoVgaOUpOIrtn0mGs2zErlALthP7obWyERI7GUY/QErV1+O6GYObpu45FZw1lF3qhyKuO
	jyMOI1DzICT9KmA/WHfLMWUWUKNh9sYdbZ6KJo/KjilaqNswip2Ht2aEHbcIz6xMJarg+
X-Gm-Gg: AYBFou1F57RZ1DFhxED/cIAwTlGnJPSdZg3AZKSZkJk5rUu0UUdLDhV2J+BeSCZqmeD
	YJm04edwydQ6GrYRAXju9TrMykzvSjX9Pjl/IbvQvVJBlehnam/UFiRy4via3xtYea+PIM3a9IN
	hQQ3QBcbj0eJg67+pFMtdJGFGAbl7VdH2YU7GfSYba4qlm83qxNBxX9kWU+ZLZs2FwWu6tbn/7R
	0MprQTaAcQCOc872+WZVL3HjGRXdZ1IfRrXaaX6f+nn1NB4lLoG5sM3cWmR7ugdhKSsII5IYvXG
	tgMnKIcnU1CwWcaTIV6xeieArzeS334VhL0J76F+TCoZ2D0f+jOGQKcFGjK0Ai9FSSOat3v8Cxz
	mSESoyzzsx5lLT2Vhg0wI79a4JKCsp6abUNf0486z5yerrrhniohPuQi5WHIW/gZFEAIYWT1NPt
	BpT75H76ZPUXf3pMhrVZcg60DWuTdw
X-Received: by 2002:a05:701b:42d0:10b0:14a:51c8:e9fd with SMTP id a92af1059eb24-1620693f02fmr5728553c88.26.1791450889147;
        Thu, 08 Oct 2026 02:14:49 -0700 (PDT)
X-Received: by 2002:a05:701b:42d0:10b0:14a:51c8:e9fd with SMTP id a92af1059eb24-1620693f02fmr5728522c88.26.1791450888178;
        Thu, 08 Oct 2026 02:14:48 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm24456045c88.2.2026.10.08.02.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:14:47 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:44:24 +0530
Subject: [PATCH v6 04/11] arm64: dts: qcom: ipq5210: Add support for WPS
 button
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-08-dts-v6-4-f9c4ec8664d8@oss.qualcomm.com>
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
X-Proofpoint-GUID: ml1PgopUTdYvtk2bw8CuVAZozAtJEDJ8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX3WCjkzjhadGk
 wylacV0HzX7RekWp6CNhLihQMbHgA8FEpnBULYKWO4S/n+8POy+9+jygrGXdPIMmP0LthDKqTBO
 aJidejIOUhRLWZSdqKJxGXZ9VlhB+L4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfXyOs2I/2tglPf
 b95QqD4j3NmKFhEzl7hZmdDZA91/tKTAD9TZ1iDlXmweLrUPESZykRXlaoIDvj3TD833tGlp/4s
 sh1aO2VxbroR9nyBDSV+NfrDUXuHG60jB5bYFEbMM2hZytOkYhp45Y28D66j+5OLdzUH0tWSgqN
 zQgSOHqdzfVEHwxdD0k/84DG8LJA1lbFvGlTR2vDQXxq+oKOIoZjxR3mfHbf+NV/ti0mKBIH19+
 ywngjkzEO22lv0QGenFKL89OmUKfDqmKazsvLEPHEe5a7sPm6H/PBMn0hoAqzp4qZrACoUIUFLJ
 rnVBK9Ul/rUThFhiqjVPi4AV5ya5DESwDhF6kIYwE9eQIJ+YGpVJlTMj4n7ozXtOOLTqcm3M2Wj
 FAWxZrBu5lxWySNnYdkE/aiUGrRGxdqrHHl6587QtzEQcr/aFKDPj77oVwl8WLFD0Ump/D+MBr9
 O9VoD/hLGf49fEtIodg==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac75f0a cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=nVy4eOtUigsjo0hPaBgA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: ml1PgopUTdYvtk2bw8CuVAZozAtJEDJ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

Add GPIO related nodes to enable WPS (Wi-Fi Protected Setup) in IPQ5210
based RDPs.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 30c8560822b5..9f493561037c 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include "ipq5210.dtsi"
 
 / {
@@ -17,6 +18,19 @@ chosen {
 		stdout-path = "serial0";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-names = "default";
+
+		button-wps {
+			label = "wps";
+			linux,code = <KEY_WPS_BUTTON>;
+			gpios = <&tlmm 25 GPIO_ACTIVE_LOW>;
+			debounce-interval = <60>;
+		};
+	};
+
 	vreg_misc_3p3: regulator-usb-3p3 {
 		compatible = "regulator-fixed";
 		regulator-min-microvolt = <3300000>;
@@ -123,6 +137,13 @@ &ssphy_0 {
 };
 
 &tlmm {
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio25";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
 	pcie1_default_state: pcie1-default-state {
 		pins = "gpio29";
 		function = "gpio";

-- 
2.34.1

