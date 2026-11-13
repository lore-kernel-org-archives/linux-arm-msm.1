Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794545757;
	b=3tKti+9kVhX/yzYZtAfuR/dnqCiQu1yM32xBDzoSESPhN2iL5dNJ9KiLOK+wJgmFSP1r
	 sQGVhpROPzzgYFdOBedNdgE442HSe7jD9JdqaF4dRB3QAunr7vnS7NBTFpSZvzvPFvqOc
	 ZNfI9syCVWVwcHrhbaxYcA8eSZDB8OdQuY207k4yuGRL5T8X5PYxLKrd0ZSfoTm3JGu3T
	 sTQO2T2CN93EyoC1qzUKaD4PF/IRw9aXj6qfvOh/OmoxIf2wzf8Wg26e3j4w+xjIBTCfy
	 pvuf/rqq8aKETXVspykJqWLF3qRfN41vefWRHENeQuDaX1QPuPSkyMXkfIFvY5l2o3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794545757;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xVFG72PNJc05CviP7xNZo/AxabG5HdWiKbSPhL5aFtg=;
	b=atvwvYsUQr002Vec+EF0rV9IEvhlM4uM/v7k1zQCacvWqWXeyzOBIDTAyp/dpqIgxHEE
	 EKRUbbNQxx//9xYz+OLY7HaDJq/35+75C4NE73TtMC6M7OMSxMwLmbcXSNL9xOuYcj5Y0
	 BSsB75w027KrYm67hvN2IWBl8f9TNzr6RylfBko6ulWAQ1h+McUHBNb+jgrRaXbLAYLjm
	 QOjh2nQ76Fr+ZLZDkgFLLBKXYvXF17tFH0Mx17h1OGfLSav08oyYXt1DN9WGnc5snTt5m
	 r75Jj+jsJG5Or/ZhI/FaLJdvsn35m1vWo9oZR7yg8Ajqj4LfVoMOrEm0Y4hnmoJhTWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pg5NrZPO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZQKRdPTi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FF3606A883
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 04:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51FF3606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pg5NrZPO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZQKRdPTi
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2K5oH3273763
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 04:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xVFG72PNJc05CviP7xNZo/AxabG5HdWiKbSPhL5aFtg=; b=Pg5NrZPOBthbtwqS
	xB90pYx4t3dhHxty8ZW7kyN7wtCVBVOioiHBypjrLM1M/eWjCs8/nXeKOrU00y7P
	+PFT9PWaTXNcCal6itSc/um3EJ3fK7f+Fpp8mHamleuqEjc8cxJEPGWwyrrb7MIf
	6o9X+U0IYZMx5RXrUkW9GJv0Nm6tnKcmuFE94EK2Rt52KyRqmqJ7c6Gd4bNGr+5Q
	6O94jpwJszTrSjXkc1q+yNgPlD8wkbp6GCmWT6T8/fiTHBKcLW0uCD/J2mQhBFx7
	aO0IYgROJBrNWBm7Ey18cZd02ODmC5lP39iLGsYA08nxXaI43e+SyyyTAjKAgCWU
	NZgn1w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufgrvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 04:55:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed077a15c3so5037225ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 20:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794545755; x=1795150555; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVFG72PNJc05CviP7xNZo/AxabG5HdWiKbSPhL5aFtg=;
        b=ZQKRdPTisf3yF4+vRpx6QkqV/XFYeMwge0OjWthO0Vknba+xvnut+cr/JY0ERZLof1
         dOCVkHccAE29XiXG6x4UHRFpa/pzvzDkFkHDULvX62KDdyJJ6z+mSKqNgAHCCLEsJknp
         Ge5CvfpmJcig6asX+ML82ZnWQAaA5+BKpPUnIpMj2kRRU4DuoWjm7aPrnlYNL2ZIgy/C
         PI6B7s2Hu+oQOyBBU32+v93xff44qWWZM/8H6DmztHr9h9jIHuPJ+iuWx+tOeee71tDM
         2l3dATWipoCtl/Q4DUOaUKmkwQldwE46DGH+ktLVrA6ugi3v6v4QeYEK+E9A7Nln9y52
         /55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794545755; x=1795150555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xVFG72PNJc05CviP7xNZo/AxabG5HdWiKbSPhL5aFtg=;
        b=V1O2jCYnkPX7LCE9/+u41oL3sT7l58ZTofB64UP6LkQ58X7YWgjtNb0GIJ9+jWLj8U
         lm52GTWaKV7zG3vpZ7kV2OSb0VNSOKpFdOzlOm4f79x97qvJFlKY5uHKG4SKB4EykFca
         XJTGJM6CnXj+V+vCeHJsjPSU8ClXAzlLKUlwBIiX1nxBSPesIW9FWECL/HqseyBJFLW1
         ABXMLEH+eAaTJfO0ow6e+nqILpxgRaOQqxZevtfOdOzT4QeOGW5VxvEg63AKAD+Tg20N
         rO1s4N9TuO50XYsY74EpQNgNo6hMC0qgaiYkPD/XSAh3yoruiMxIhVdQWaOCxQmwAv77
         Qhvw==
X-Forwarded-Encrypted: i=1; AL+hErFq1YzuD1kPJG+Zw+M0jnn+Gmb3FOoJsmrPjBcR0fltF/OmGLewMIEcSmbnrwvd1Sy0hhAV7ucMsL13w2Ub@vger.kernel.org
X-Gm-Message-State: APuU4Z/T6QiDDHY/iXVHR4ujSwGcckM3CDix39kg6+JlKtm3gkbqbV7o
	rtEeEvwyuXkvNciUpP9V1KadOMebVu9GljxxN1oGD9ZFtJPrZz94l1GA8XiEUFTW2SgpBCLvrUn
	EmBWLgJPj4PmF9qrFpH820KwYuYSrB+uqN960Hy9NmeFrO4Z24sRIrY7abo7/CSdk7kBh
X-Gm-Gg: AYBFou3zxOGI7WTRf15VfioVIhVxsW/HV3J7gh0mZf6lBe/fhRD0C7+YKB/jbT+B6mL
	gV7ovGlyC7U7Ev8+pfA/wPhHw7NfUABOfAW2coJnwQBRoaPS+dnJSUZXgALEQpc/LNKGxFZ/8XV
	DQxz9iX+Il5PCG1e0yD86ouic1VE5FIaxjQG2bCP7a+5njs5hNneo2nn2adr6ZrImCb5EyXW4Rd
	NLrzKlbR12suq38l9NsWhqkWf0WN25HKstbzIWmaaPNTIPRjXvA6jr6YJPqXgbujSYdKBsrCpiy
	a3odMFZFX5SfnqVGCb4yvBxv10r/hFmO3693d9k4RP0qL21IkK/1xUGFdG2j+m40RJpLKkuAZut
	y/Xj5KixihSDhjaQBxPbmwdv7UjCn7LCiyLYI4dSnQZ4Qt73J9v0NDkdYNbH+Vo9ds4wz0o/68v
	og
X-Received: by 2002:a17:90b:1650:b0:3b1:8396:ebf8 with SMTP id 98e67ed59e1d1-3b1b0a4fe2emr1091217a91.36.1794545754953;
        Thu, 12 Nov 2026 20:55:54 -0800 (PST)
X-Received: by 2002:a17:90b:1650:b0:3b1:8396:ebf8 with SMTP id 98e67ed59e1d1-3b1b0a4fe2emr1091192a91.36.1794545754499;
        Thu, 12 Nov 2026 20:55:54 -0800 (PST)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0fdbdsm7739875a91.10.2026.11.12.20.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 20:55:53 -0800 (PST)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:25:27 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: monaco-evk: Add suspend-only
 power collapse state
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
Message-Id: <20261113-s2idle_state-v2-3-ad604182e7e7@oss.qualcomm.com>
References: <20261113-s2idle_state-v2-0-ad604182e7e7@oss.qualcomm.com>
In-Reply-To: <20261113-s2idle_state-v2-0-ad604182e7e7@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794545733; l=1804;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=rmjlNp7nzxS52DoDEeFUOHUSdU6WMCg82sqCrOEZzak=;
 b=99iaGDZdsjb3GWnJn0sBCepEljAZvIMI4mra1BI3ze7MPtyBgN92lgx7tfmEL3USukl6zESNl
 vaejUR9FkQ7BdMKu8h44J8RpH4F6m1DxRsfFH8jZvgdVRcpHd87abPo
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: fH_NUtwcam9DIazpOTD1SgobYWV5iBLt
X-Proofpoint-ORIG-GUID: fH_NUtwcam9DIazpOTD1SgobYWV5iBLt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfX7maXBVyrSpL/
 vf7n6cHxKQNlYJ9Gph2ncGUyyBjtsYTk1iCl1UakR1u6+nxxM446yctTIfR8C4D6qvTH2Vb635q
 4uYaIS7+OPwR66A5BOERmEGj6ffJnbHnIzmYj2gdDGtUBx92kXt4VflRSrrj8477cigvEph90Sz
 hRJVsQ77ItRktFcE8WKvuj2vWeQ0Vte/7JXhXBnt72T49ry8yaJ/JspctZbxnROB45jiDEKbwAW
 Lrp4KGPwLVbWkeeU6QC9o9oGSJk/HrU+deLY+iWOU0s4E456Fs45lMQiLefc7OC7ndt+AnC6q3u
 ndDc57uFLOUKkHGp0no2TDp6mRAqiqjbwUgEypxlFut77pGvmLWx3YOceoddvxUgOCC/Xo8OzfS
 Lo6iooIQof6CP71SKTUpioBZg1hVd0lCNhO9xK+bPoRTSMTNORz79YEolBAcFj8BZ13plP5cblk
 f6Brahq57wv6QZcVUpg==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af6985b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=JkMn96IHD8b9Uh7FENwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfX8j0HqDpfut5M
 EqivkVW7szvvN/E1MxG0EuGN2fgelpYdN9GtdOlCvMXHOUrGrCWMNhTYs3bPRC38aGZLkz/sSeq
 3XZowBPW+TbnWae58G2W2Z9aRDe/BoI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130019

To achieve SoC low power mode like chip rail power collapse (CxPC),
the Monaco EVK board with four PMICs requires coordinated power-down of
CPUSS and the Safety Island (SAIL) subsystem. This deepest system power
collapse state is reserved for system-wide suspend (s2idle).

Only the Monaco EVK with four PMICs supports this deepest state. The
Monaco AC EVK described by monaco-ac-evk.dts has two PMICs and does not
support powering down SAIL. Define the state in monaco-evk.dts instead
of the shared monaco.dtsi so it is only available on the supported
board.

Add the system_suspend domain idle state, mark it with system-state,
and reference it from the system power domain.

Acked-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 539c9c80a808..5e6206bcc97f 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -80,6 +80,19 @@ m2_e_uart_ep: endpoint@0 {
 		};
 	};
 
+	cpus {
+		domain-idle-states {
+			system_suspend: domain-suspend {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x4200c344>;
+				entry-latency-us = <706562>;
+				exit-latency-us = <706562>;
+				min-residency-us = <1414124>;
+				system-state;
+			};
+		};
+	};
+
 	dmic: audio-codec-0 {
 		compatible = "dmic-codec";
 		#sound-dai-cells = <0>;
@@ -772,6 +785,10 @@ tpm@0 {
 	};
 };
 
+&system_pd {
+	domain-idle-states = <&system_sleep>, <&system_suspend>;
+};
+
 &tlmm {
 	pcie0_default_state: pcie0-default-state {
 		wake-pins {

-- 
2.43.0

