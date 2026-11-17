Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906399;
	b=Wc4W5C6bxUHmW8+AxEREA+9VQg1/Bv5sLsA76rcLfEjjxcvbHI+9E6/suQzPAU1vyfF6
	 71PEan0c08AtasXkoCGRhVwDtkh35fVPeijMaUeWCkM9re0agrhnQeFsY5OP9nOzadmLg
	 Muk5Q3lwfqWdsh/IF9c4mgn0CE0+TbRre5BIidoyxbokkkfAmn8IW4Qc9iVdKXlAF/lhn
	 CdVSlSQf1suu+/We+kwQgc8LovIEBKN2Z6NVqC9OXEFBK1HF1t+cT0VbE/Ro9YpsV6ppV
	 2V+bbpfhV5wGD0wPc2b7JlY9AQOJk/Vbg/M8wt4xvdnzw3IZDBTnMuCRofTmUEyM8AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906399;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=G1aPL1MlNOGc/htpoxXZOBRFJ5I2czNFzBkTOlaU5EM=;
	b=SS4T1/Tbxo0j0NdZfSU7U+/qbxHclRu+EODBqoc3uXzNOmpjdQ1UsbBPcE+5lbnJMens
	 gMtBzx1j6zbmmXJdoJR0eWbs6xOUCk7Ndj8F8enmnKVnMKHdSeI6rcuHmDQKi3lfrAg2u
	 WWh9CNRlXX5Qc3cvmtj+YaTPzw1rU6ZPcxZe1xf0z30+/tVtMn99wlT3QDnMwn8DMDO1J
	 e19rL+2HMTdn9lgFY8PdtMri8mOc+bwNBoWsYwRoPg6d5xCh2zvGv/malJq+I1Hpgl9JQ
	 rILWGmT52svP1pb+qBpe9+isIxP4VQ5tx1cb91TXNVADXlzOyyT4iQXGXvkQGcdNTXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lzNYJdCQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VzKTcPB7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA684606A898
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 09:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA684606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lzNYJdCQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VzKTcPB7
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH449801699358
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 09:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G1aPL1MlNOGc/htpoxXZOBRFJ5I2czNFzBkTOlaU5EM=; b=lzNYJdCQ+22v8uiy
	hhXCrfC/TRosrojiSfVmW68T+xQ+kVNhKZ6z9BJtyFXWXrUmgX557PPBYZ/xL4zA
	nsTTE6HP6rVdsPhvwgvX6abtP7tninpBz3p1nIlL1LA3pFq76Z7vp5hQX2hC1O7U
	0tkbb3smj0mv68CjhHGqjmw07BkXr4FsPKV8Jvas0zsKDdqlui9sDnKrBjmzbd9h
	NloZqjuX84MHhFCPcZWvYng1dR1WBWs1lv/QcY/AmhFiGoZj7Ki2h/OakXTWORP4
	3ij0G/ueT2OGTOssKU6UXXvfPNyLVzEKEqz7rZvWKxvWKiKx00QRKN9fU6xgqyeV
	vdbBxg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0fjuh2k9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 09:06:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so853593285a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 01:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794906397; x=1795511197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1aPL1MlNOGc/htpoxXZOBRFJ5I2czNFzBkTOlaU5EM=;
        b=VzKTcPB7cez9iV+rs7xGDfqELeBSFAOImRCKWvKOF2BFjZW83XivkGu6+GTRLFtZ2L
         WH8uD1lpI+BGZLnJibP/eGqxUVkqpehhZj3UIYSVZCHchExb0wxmTCDQUp+bHKmVERo7
         xdkjtkAnjakNehu9j0LfrFaBbUDHhMExnpc4YnCO8IKdEa4rD7Htir9/PiwNFHf5hu79
         hnaRpH16YC7d30nMalGn49iHI7dYOSrS5N2cPDdM4DFuSopd2LSSf0/k82KreMIFb0+g
         NsbEPPea2k3qEA+mdar6tDjCoXUi0XJWTN5kXc5YerMGg+8JVVOe1SPQ4mJvX1ym/+YF
         WCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794906397; x=1795511197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1aPL1MlNOGc/htpoxXZOBRFJ5I2czNFzBkTOlaU5EM=;
        b=T4dIsVFLbrWjBX0hNY27zZRCnFErst6P+/XKT+668qzXSr5RLC+26gBzQIf+phv6KT
         5ODhjx6sByIBxpflNgiYfOG0kOTEupMOw1XYEPgeSncTiqpwGfrE83c89x0doROL6uX+
         a6ieERd5nrl1qVtzIwCDMcXJjq1HcRH0P4vMs7gTMqaYoZcrpyCa/u29uQoAx/aI+0Ko
         Q4srWmhdLq3QV6wmCtWi+LbkeoTcJSP/8uwDaoHo1PYmO4LVCsWSuwfHeZgeFMW+mu4V
         d8Q45qDGU5tLkiL6B4TjNy1DOWbKXzq6cO8p9WhxiSS8LbLQ82npIPQeEj/AsNmC8yj/
         EOHQ==
X-Gm-Message-State: APuU4Z/bFgM6r/168VYxJLy6aPoza2TBtiuvPDqWBF6qzLa21/nsw1/1
	bEQvZnufhjIQAzou6yPs/d0DN4OkaeqwK0uUlujFvzWyikHKTR+KAVbpAQZenK2bQPCT5jSRu/x
	VuLKPJJYH8G25NQtqQZ7vamvOBAy4rnW/YvND+4o39IIQqMtuHQYrHmuuJsPUcCFPMAzN
X-Gm-Gg: AYBFou2+vMAnpgdtaugPErU8RGuO3VB9KktWOk78a8eMeD6jtzWNAEp9FZaS44q3pf/
	GyCnS/BGqFtqQLwaFYkZ3MjcxDL9y5vsGNmOA0ham7wbERySJLvDkT5s7pgvsR70m8oCtV/0NkN
	uloGc+WY/IaU0JZ/SgpsMvwX6zcHdzMhGvY2qdHvm8Oc7KhX0rMaCoPc7XuCnj0rSSHgEFuVkX4
	3Iwbf1eiEwysM2Od4RAjkAhNm3PIOW7o+nLfGe31H14pxZZ1MUlSAvs/UvTeOQ/0hITPvgP2EZ8
	8ktEKCScniFBv11dUeUgsCQfwmrR/NQ0gTtIgtx79gAnfDhM5aVjQlRlgcq1bidin5Dz1gA3ULb
	2+YDzr2k07nNFsCEvBx60+f+5JELKymNXvgI7ycX7GkvY63ZbuJgkc91nvxtSMTqsdgB1WvQjEW
	8=
X-Received: by 2002:a05:620a:8390:b0:949:7497:7c1c with SMTP id af79cd13be357-949749783a0mr1047335485a.60.1794906396887;
        Tue, 17 Nov 2026 01:06:36 -0800 (PST)
X-Received: by 2002:a05:620a:8390:b0:949:7497:7c1c with SMTP id af79cd13be357-949749783a0mr1047331885a.60.1794906396291;
        Tue, 17 Nov 2026 01:06:36 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm27310657f8f.56.2026.11.17.01.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:06:35 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 10:06:28 +0100
Subject: [PATCH v3 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add the cfg_ahb clock for Nord
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
Message-Id: <20261117-qcom-nord-ahb2phy-clk-v3-1-ce5ee1073208@oss.qualcomm.com>
References: <20261117-qcom-nord-ahb2phy-clk-v3-0-ce5ee1073208@oss.qualcomm.com>
In-Reply-To: <20261117-qcom-nord-ahb2phy-clk-v3-0-ce5ee1073208@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1951;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=O068p3qvY13gpO1dapynH3Vca4Ot7GTVTMBYtc7x7LU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq/BkWaH0DVs6hwvZ7sOYbRSydJrmgAr5t8FV+A
 Gp/dGqHDFKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavwZFgAKCRAFnS7L/zaE
 w443D/9TbrlZs9tS3VbmqVk5HYrt3fS2uqe8ksEZV8PZAbNcz+UPZAC5gU1uYtHkiPYpvVnf6AD
 vzLkwE/U+kb218VDHh3A/HVNhL/16BpQjubHC2CCesAoaQDHqyEmhsamR4cbrwHCDc5t0x0GySD
 yOvQPe68WH3Jz+DMvd+I2n84K3QFTRbA2Zskx7o8eKiK7sUOYM1Z1A2pMyWUx8jTMIb+h15XxF1
 wZcw49vEJyDghi4SPkRMDZDp17zN8rAI2uWXx926io1kds3rI93zRjtWCzVZ33q2Sbea2ZmvKJs
 TZiB9LD89sg9ssvCYxk+mJjENzGvE7w4qiEO2MqOflEl+RH6P6pe9f67b6DHXPJj5x30ZjtwyMC
 NaeOsRXws4bio2w3KICUkzPDaRAVKvhdK74OZiUI6N/tfxC31fbGBmZvtwOiWswklDTE3iGgOs0
 mJRO/TaSYmQSH1mm1xpQ3waeHC3AfICnLZ2zQLfnL3ycNjQt967fGYnsmH78zZ3HCls0GAXQB1k
 Az+TX9py9CJiuIEBoN1WOcUX7NLQDi4g2Y9r4azCvjxqA9j561kwdhzd4U+lbvbFBpybosUeCRU
 nzY3tkGBQLcjZk43aVt67wUE0kuWr8oiQRqYH4i3CnH1yZZ5+MquZapgbdbJjohq4ecHwvtZzKd
 QhOVUodO7zGm8VQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNiBTYWx0ZWRfX8rAhICjLYYvx
 dO5u2NMWFL0hlJ8N8sLYA9KA0AyZY4YYcQ+YcTzSaNlzDIUlRDUZtK2x3uKPnsxwZ9rt1flGfA2
 G3B24vFWrBTP6xspo6RmZ4NGKoAwnAT78Klexiku0siSmRkN0qoDpJbSnCHn8TKvrgESrJBVlKY
 MWEwQzOSjj5NPxvY/OQ0QnqOKZV6zbRztTBVpdyH9WE4UK9vnHvu2NRDmueqwLn3n8Zv0d6dtHr
 elAIg0/TZPB8Dmt5L5dtf6Wq5BqtqIWbVDvngQFfNK1PDNxEfbwSd/WihnpmzJ254Ukamh7NuJg
 iXu88Q1cgNnTkMTKai7avZsQd+skErthAMrHO6gHA74EE74XCGqiiVK3WOo+c0uZT1W9LuQs8PO
 coU4wYIGBQqiYH7G9HhfJCSLkYXQKBZDyelqkWwE3Y3dfvzM3UNow7QdLeEyzpDLd1nYTgyrI3C
 t2w0bF6NqLNy//QSvtw==
X-Authority-Analysis: v=2.4 cv=JfIpPkKV c=1 sm=1 tr=0 ts=6afc191d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=2jpwp6DS_NLBz8rowOEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: uISFaqoiYE9E2YCII5Zk6DMofNm6o6c4
X-Proofpoint-GUID: uISFaqoiYE9E2YCII5Zk6DMofNm6o6c4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNiBTYWx0ZWRfX4SEe//USKkhe
 qZE68v7e4Iw/Z2HJpn6O0e3wgOtOPwLV51j/FKrOzp/93HDa9+/D/Pdl0KNwkFiobOT04sSjsHy
 NgnRnhI9VoWHwHTQbhco3aF7DVdkzz4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170036

From: Shawn Guo <shengchao.guo@oss.qualcomm.com>

On Nord, the USB3-DP PHY registers are reached through the AHB2PHY_0
bridge, which is gated by NE_GCC_AHB2PHY_CLK. Describe the bridge clock
as a fifth "cfg_ahb" clock for Nord, using the same clock list as SC7180
and SDM845.

While at it: make the constraints stricter than the global settings: set
minItems to 5 as all three architectures require the cfg_ahb clock.

Fixes: 674e602140a1 ("dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Document the Nord QMP PHY")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
[Bartosz: fix constraints]
Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 13e64fe510b8f..8d09e6937fef0 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -209,11 +209,13 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,nord-qmp-usb3-dp-phy
               - qcom,sc7180-qmp-usb3-dp-phy
               - qcom,sdm845-qmp-usb3-dp-phy
     then:
       properties:
         clocks:
+          minItems: 5
           maxItems: 5
         clock-names:
           items:
@@ -229,6 +231,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - qcom,nord-qmp-usb3-dp-phy
                 - qcom,x1e80100-qmp-usb3-dp-phy
                 - qcom,sc7180-qmp-usb3-dp-phy
                 - qcom,sdm845-qmp-usb3-dp-phy

-- 
2.47.3

