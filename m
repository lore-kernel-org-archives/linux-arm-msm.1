Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143952;
	b=2PuXJLh+V+rKV8smjWGPPdyrJRTaD2TwMlFcMHFxhZq5VE+dj2iAxuUyHgPMVFIRycZK
	 3vOf4NVMi+mgSP+2dxy+k4fjR7ZFse0jm8IFlVZyTrvYEfmgzOTo+FrJbHA9JO1fWoPPU
	 Lbki1ibQtjJTy7+hgH53m6GIfAfjZBrr8otFCEx1h1iLnzVki9NumSQDTfn3srdP5Nv9a
	 3D9aty+z1JDGWYMiBvsiPtuksvYGPtAwa0yDCSe5/H06pBdN/Xy9hRZgws4DeXS2RQHkO
	 fC4GcEuvF/yq6VRbGbJmmGKbThFDtiMzfG52S912nFWMIDj9tbhgBOpF3s+KMdCa5oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143952;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vgpTIWVKL9fxj/Y8qEh6EoiYPWef4bzE6JMDE0rg0qU=;
	b=J6jRXlC381fs2y7QqEcxpGKETmPZUA+inh1ulwd4nr73WC90oVtqVbZBKkpfmIScRVSR
	 b3LIyP5bT4uESegrKNoYU95aWQu3RE8vQzEhMefeeLG4ypHG0lWDGTLcP7rNk47HYsRzU
	 9Ej7xxjpsES8jHGBN7AjdluiygbYLioB+3nnBe52WS9np2yHBc7qhRB3+iLJEvKHke+P7
	 VeTg/goy8psqofyH3vPvYRqjd72zGfPZP15D0Y9EiKnHWF+kNmpU52bV2Bc7tNff+wEq5
	 TV4UGj90cHyvf9KbwNnzrZ5uf/kvOYppwsjCMwOq1onpI3bsCvMOL9EBwFMA7yxnukw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAu2P4N0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jiXxBruu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C53606A326
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 13:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72C53606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAu2P4N0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jiXxBruu
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8Agfx32210392
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Nov 2026 13:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vgpTIWVKL9fxj/Y8qEh6EoiYPWef4bzE6JMDE0rg0qU=; b=DAu2P4N02RQhm6JY
	WykbkYkBjwjNzqQPYMTZJw1er8ZwU4u24Ng6aGkUNw6q3Etuhg8RwfJL8cGGvCJF
	TTjFoNjcfAUBBBWy7+a+QnHxCt+69EtElmmxEB4gc09hSwHgpgEJgjwiA184883G
	aoItqCQp6Zu4mUIlAEpi8w4Tz0Owyq867P7n7Kq9o5Nb2bhMjJ46YVJIZTEF2F6b
	2AK+g8w0nvpHy1d5v7lYHtH0LPeBNLNbIVLvn/KCg8FVL9QDw6qCHzWj0cLYgiuG
	ntUuAnCbH+af6AvG1ibUCVP/K0DiYLYQTFPNzWjD+BWB/l8YIp7jt9eleCuFb+sP
	03BchQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsspf39xh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 13:19:11 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1663fb7e005so85835c88.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 05:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794143951; x=1794748751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vgpTIWVKL9fxj/Y8qEh6EoiYPWef4bzE6JMDE0rg0qU=;
        b=jiXxBruu9Y/CeGVYbaF5Il85TojS5XNv6xEKiIxOxQ/3f1ukZeK+l267oWvikNTPW3
         16XfM67mdbjdwXgqa7/J1uixDcaalo48Hs+Jt3V48RGHPwRs5DBzHZ4EaanS2So5xuaM
         HE0hmnbMkzbUFtJAknzDhY3FNw7dDR6mmVRwZC+bn3rDUdR9SCyUSgSHz+FO0KvRNR4K
         9qe26sjWk3iFKLgBkO9yTN75g2kZ6g4/CkuVKHX9qMjbp3vv3AriT+juR7UjqVOaL+57
         Rl8+wMFkuCaLPxCdMzcuS0U+5liuAfDB+6x3gpk3JRkz4Xpci9hzECahdV2VM23wKbJk
         ckEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143951; x=1794748751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vgpTIWVKL9fxj/Y8qEh6EoiYPWef4bzE6JMDE0rg0qU=;
        b=atWZ+Dlh89V9041xJHVc1x0ro7xMurEjySkLN3+CQ5AXJNIFuYK2ctKPQUVWhujy5g
         3LFNHzJvw8HmA85F9cIyIqcSGhgDGoNNii0p05L+APj4P0kH9Q4x6W6UlwFsuPeuTn2o
         WB/gCt/KmjIsNpVa6Ap+5vX35mFeTjXAfwwB/e/w6SM+nHYH1ikCTiyz6Uio6OPfX2hw
         e2mq4D6aIBS3P6LdBvHft2zBa5HhhaPNTeHTjv/arz+TJlwAk0ZMa7sN1Q9Tjtdhl0Mk
         QmqgxcPqI8YK6o3cD5Igo4RFLyp0wWr6Z/m15zGk7p6vOICCB8W0ZoD7eRkfJEeyiVUU
         1/mQ==
X-Forwarded-Encrypted: i=1; AL+hErEAUQKUAv+DDnzxeuAhVu7d92ygN6ZmezvZ3VBOtwotF6AJoSn3T15GVHLMjZ3/vq3fAn3ozV4/kCghr0XL@vger.kernel.org
X-Gm-Message-State: APuU4Z/MuXyFn1ZiP82SlK79H1u9Ktfy3ubxm/P9wqVrHQilrLax/euv
	XodmtrmsMpjTYry5ByWbp1fDFGsK5o5kRqoPnPqw1HAFxycBwVxdQg2GdCF0eWF63DUAGoK017p
	i8kQ4dk6mNpEwRo3bE79YjqUpSMyXULnsSBjISjOGBEYz487S9IPAZ4mAaSKQdV84xPd3
X-Gm-Gg: AYBFou0cdHD61bjCGHs0ub0/citrMMvHFx7Vi308D2uctrbAEJ3ouO2s2Za9I9bQSwy
	lxe3JLWfBcwIShmneQTMroDWfv65euyTNk+fHxou4V65ibgzq+KBg4RShcb0InRJ/v1bluxA+lW
	GFNuc9hPv4aZdM9LdYIYYugsvVEQy/3Fp+2gLjfC2Ak/lK87ZlMGRu1rxOYELtd2zkAPYXB6k3V
	k7YzkdrDyLeyjKZoUn4fLSBuwbsuWbRxmOoF9yVfS9Q+nbbaW1yneMPdFYkZkrUVwUzpWLtPzVR
	26X0UrO19Q9hC16Gv4XiZ1ZMEBDhUD89rOhKw9nawE1m/YKCQWCmUmn74eLszth8++N7Jvp3+KM
	u4JSqJdNYV0VbHUOceFHpnmH/U1G4f9b5aeJ7muLAABhc5YKaJ5QUrWH6s+dFoAFQQg+sGsxQXB
	ZzY1M=
X-Received: by 2002:a05:701b:4252:10b0:1b2:40be:a929 with SMTP id a92af1059eb24-1b39fec24cfmr2288469c88.14.1794143950658;
        Sun, 08 Nov 2026 05:19:10 -0800 (PST)
X-Received: by 2002:a05:701b:4252:10b0:1b2:40be:a929 with SMTP id a92af1059eb24-1b39fec24cfmr2288427c88.14.1794143950085;
        Sun, 08 Nov 2026 05:19:10 -0800 (PST)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5336980c88.13.2026.11.08.05.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:19:09 -0800 (PST)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 18:48:27 +0530
Subject: [PATCH v2 06/10] arm64: dts: qcom: lemans: Add support for TSCSS
 node
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
Message-Id: <20261108-tscss-v2-6-d5f575010427@oss.qualcomm.com>
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
In-Reply-To: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfXwzfySBlV81aE
 M0jfT0Ip0F4jmrp/W5hWtkuHW94eD1OPyM4FldGI/VC6TXYjzD6LaVv+OHsYUOWm6vMoht5yzyP
 BhnsLCgCiES7qKeuhDzlMGyHxT/VQkk=
X-Authority-Analysis: v=2.4 cv=LJzz05W9 c=1 sm=1 tr=0 ts=6af076cf cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=cV2z5tzyjUHL2YBgtoMA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: cZ-LCJzinHs31wegPIt2PTY32Yr3c9Td
X-Proofpoint-ORIG-GUID: cZ-LCJzinHs31wegPIt2PTY32Yr3c9Td
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfXyEe7BHz66hmL
 CBYKV+YMHbgYEIEJe/3Yi38vKD0e+KtHr/dD38CXircnSvxVLUmh/ha6KTGVm5UbP8SU9EDEPDX
 Xr7zJwg09smu3zGEVEYfSmzDpk+kSpm/YG4qTTe+UISbUL7R6bizTeBXp3mIHhH94lGZFjxyu0S
 asgruh1auyg02hoBz4bqkEnm3hNZaJP+4wee0/a6Tf80BeE6dJn4V1fB/LY3HTc0KVFG2jkwuwX
 EFFM061VIEgzcsALWa2Ou6ERtIYTbALOVXgJQyIsdHTPdMxbQnq04R5ZJuS36gZFR44aEeHViLK
 0ZOp8+DDTBf9PrpNKlZd33C5FLz/5+Sz9s7hyR1HlKSBaIHM7NrmdnmPY7zHQSllZlqOAGl4FvE
 Yyi5PIU0IkwaG73IWkHluzjuU8wFj4O7MMKekr7L25jEV1TSFHQ0+E/r3RA1SVk4lHoc8LHlv+T
 ArTRLxU6rWMYLU/czqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611080052

Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm Lemans
SoCs.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..4c76c820cacb 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3022,6 +3022,18 @@ pcie1_phy: phy@1c14000 {
 			status = "disabled";
 		};
 
+		ptp@1c80000 {
+			compatible = "qcom,sa8775p-tscss";
+			reg = <0x0 0x01c80000 0x0 0x2000>;
+			reg-names = "tsc";
+			clocks = <&gcc GCC_TSCSS_AHB_CLK>,
+				 <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>,
+				 <&gcc GCC_TSCSS_ETU_CLK>;
+			clock-names = "ahb", "cntr", "etu";
+			assigned-clocks = <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>;
+			assigned-clock-rates = <15625000>;
+		};
+
 		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sa8775p-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
 			reg = <0x0 0x01d84000 0x0 0x3000>;

-- 
2.34.1

