Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419117;
	b=fpI6msLsRy/BtrEzksSvzwpi4OebovjHtjygTB6to2mzN+ozCuLaXLvYPfdLMPnacxrX
	 KHCgbGbCi56YlIOAa0VK1acBr/XCJubocvFPSQ+SuqW1Z4W8wA4w3W+Z2OORf+Rb0k/Jk
	 p6UIFaFFE3Rpw5vLKqIVm6QKZ5lDY3iNpD9GoIQ8M4qqkD4J74DxEd4NSG/XQ3cHdg9JM
	 8OFlRAziplUMA+wtExCS96QEdprslG+8516haqXcxFYAtXYyHChYFWaazemjya/JqJ1ag
	 qk6Gr3xBODK7gz3uCMTdkYJLrSBhArXzeq7KNmijGp/vkL2ZUQ712oxkflhCVfHyEEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419117;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ncvx1kc+KnyirfS/u1X4r0v1xWirGVewXCeeeqzrG2M=;
	b=w0qsSiQ7uSKoj2EmIqLvDSPNcdwSl+GS6Mg7S3+iOT4v0vgTiRfRCrNb/CRASOo3UeYt
	 Lfnpav10K2CqPCd29JEGAvpcH98eh5ibFzEeMpbmWt6bzGMigH/qIqhgNnkFRvTs0o9Kv
	 fNBP67dfsMJp06aUZyVYn9T2wRkDLfr2qB6VbChEsTnoDQaiEvxTznUqgyLt6K//mQRLk
	 xsLILDBXRXAcOHVTEVah7dz1Zb82+AQh6aRgmiuW3m5+jTVgMLbY0NOmfED3n61iwrRN5
	 zlL7iAQIt7PsNkWjJiEJAzEPSiwq+qYTZeqEyTDqt4B5cfD8/c90Drp0sBZ2tTjD1ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AGBbzFaX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YDAtrCry;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E35606B4DE
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42E35606B4DE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AGBbzFaX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YDAtrCry
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF04QS3597120
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ncvx1kc+KnyirfS/u1X4r0
	v1xWirGVewXCeeeqzrG2M=; b=AGBbzFaXTQcH7ATZsrVb3OY+ZD9YVm2yYJLVBc
	iwC5BvJZr4bFELQW3pC8bAfQLxCOXKEypHgsBC25ZFPd7ZD2qpg7NoZ/vuEr1tec
	oMf94m1BtIquBTxMnNPB0S0F6Din9TofUW4g4mGp/yF5GsDfdYbkCHKU2C4n1qe+
	CJtF4URKI+DbvyZTLt2uNIFhgQ5zK63MxcLgrhRNfTkRNPAHVKkqMsb6HDa/Gqtz
	th09VJSHBS2UGNde+lQE0DBoQf2sT+10q9Idp6Ike7v4AnY2Wd6m8tAQiiFzmYbf
	uC46NskzqkjTLFN6zQazwD9LJDcNzUTqtGedKc/GvO+iXOTg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1u8vhg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:45:16 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98304865f02so2541591241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 09:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794419115; x=1795023915; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ncvx1kc+KnyirfS/u1X4r0v1xWirGVewXCeeeqzrG2M=;
        b=YDAtrCrymui/hYobhBfrJvjNrmKs0AzhnFq3wP4jMBJMW8UnnorxoXDEEpEOyFbcwG
         Hsqjp1CkPahfGxt0xDBf5RR71yeXQi+Ns3uDvmg/yLsd3Z/vcLtBa1mgeQgdhaV6Xu4B
         wUOhF+IoCZbDSp+Wqwc80sadyjt012Ijgjs6qPtSgtDv9fM91JSvrbwRkrIfMeaEyUjw
         3tmeV6a8CbSTinnZw2qO9tygtLE0NlC+3+hjWXbMbZ3VZd92mUeWy2yRFUQfA+T7g5Zh
         Q2bKRiJ4KIs8DQDHPTX+CWtU/4frgXNegOLVIuYtwLFI02hJC4HFGpPHf0YCoUtmviiM
         wYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794419115; x=1795023915;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ncvx1kc+KnyirfS/u1X4r0v1xWirGVewXCeeeqzrG2M=;
        b=VhrGkP/9NMY3GHvgE9qP3Ib6zWNUqnL9wNRisc6YLxreaRqXgMzJUttilbC33mWwc9
         wzTlTX6pm1xRD4NdNuiQ/DeBN1993AgWjV4k0JMiQV7VpXaB9cdy0oFEpXMOrrCaLJRE
         vNkZO3dusOinr2V4gms0w5s1V6ehhtJyDB2XAE74TFpC3KfgxXea5Rqp1i5WT/xcl+tA
         83ItzQoTOwR0KkVhJna/LLq9ugw4OgmsGfbPIhPV31v0wLTRFhzpdyk7xE0QI12SJjBS
         yQdfqLl91SiXj5b7NbjFkkp/vljjhXXuaDKVifDSuJXqXlPAEAvq3NDQBE5cBROPlwGU
         UNVw==
X-Gm-Message-State: APuU4Z8Ad9x9sgqcLTU0n59S/YLiKM6biTIRNOvqMo3kPKKWgw6QW95J
	HQcqvDUDMhTob6gfjq/2dBKdcjw9iXigGjGqL4j0QGzCXFcWYCsArGpKvI3oP/Y5tTC/j1MGYCt
	wNX0baYJ4DUIURkgGdGCxuSghXCzyc91I8pvPSEhqBW1EtEWE54iHiG9goljmkE75LNn9
X-Gm-Gg: AYBFou2skLGXuNYK1/SblGbccLMaTTSaG7Q5LpnuLJMxG6I67rhZ1b5nqtZIEoepGzE
	2V23fiviSlsb+Em8mcdK2DFaUQsYc8SDwzkWYf4iC3r07gLfkU0wSVrWkQSvkSc4wW77Z4x9+Ks
	Mi412XfWKvIt2LNCCYPnO1660dE6+lQ1GzVtXbEmvOv/JCIbmzUCIcpCsQUt1NYoQph+YwoV60v
	p48O1IDBdJ5dFfW4AVa56sJEwVgMtpT0KoNCLd1Bwk6IzoFwdCBqb0h+J8MYpbSN6um3KyApaWk
	rYG11gI3cd0eMoEZt6Jy64xWWs2fhcd/Qakf2bPOiFRzAvbQck1Ehu3ngg5iIqa9OGvJ3l3Q9G5
	eN+kR4KLCVvPx6X3Rqp5JXl8dfTyMWVvtmKLzy+kMG+3pa0FtNRjMqpvSo+UokToAyFd8uA==
X-Received: by 2002:a67:e713:0:b0:7d2:d9f8:21cf with SMTP id ada2fe7eead31-7d5061e6d25mr1449139137.29.1794419115352;
        Wed, 11 Nov 2026 09:45:15 -0800 (PST)
X-Received: by 2002:a67:e713:0:b0:7d2:d9f8:21cf with SMTP id ada2fe7eead31-7d5061e6d25mr1449109137.29.1794419114825;
        Wed, 11 Nov 2026 09:45:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e1f5810sm4846525e9.0.2026.11.11.09.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:45:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm: qcom: display/msm: Require DSI graph endpoint
Date: Wed, 11 Nov 2026 18:44:59 +0100
Message-Id: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0K6dkgHEYkr72FYlNLCGGqxA0RCu
 LsFD+DmJy/5/79VsAlkWNySVQQzE5N/RchOidCderUGqIksMpkViCihIR56tYBjB95CG9TQgZI
 lqosuMK9zEadDMJY+x+2j+jFP9dPocf/aGx3x6MNyeGfce38UM4IEac8oC1vitc7vnjl9T6rX3
 rk0hqi2bfsCp0dtlNEAAAA=
X-Change-ID: 20261110-display-msm-of-graph-a081a5c614b4
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3375;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=aXbJomZ5DO59KV9VjzL/jOUnmaWmH1KHQxCz5sW5hBM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9KmeCDRuPXZQNp+DC6xqfi4nA8Ma4N62VXzkl
 jjJ5Jk2HzCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavSpngAKCRDBN2bmhouD
 16MfD/0QnpTOf/4Fs23G1SKNkJwzDl5wtvoaxXE4BgjPpbHV0gdtL4k6fDz4pRBab3wXhWVODvX
 Z9VbUU0uryAhuP8rNvQlqNvjOIZ/dT4SVMwtZIfcpuNx4BXUiofqF66iJxX+6xYg2xhps19+A4w
 UkTQEqdk1AgcBQlI64KmzXer8FwdsAfRRQh9nCOXRnh4XE3yJHQaWRiEjkFdg13e0qbdhCaz15F
 A5ad0m7az1E5BYfnwHfcK7KVrt9c1KhuF2gzBPftvtavXb8GkzSTXdKADYTz38juILTuRhx5PJO
 JdLj91aH+ru1irqQHIIqKht1/4gp3xFc7upB5Zs+8iUJep+WGcuTbX+dyraDunKRHEjRILHyf7m
 AkAY+wt8bi4JH/1Rno9sgmW/n7czN56Cy5TnH1vrhmEjDIJYWuiu0KhtcYH/BxAmzvs87tvcCCm
 NiQffrtaQj4PtObnUOdOhM2Jq9GblRc+wC50z87yt/3e/3+3zjbprCl9OsyJ56rCrUV1IfZrRLt
 Ipf9bkzY96aH/U/zXztUSiVXKEtUonhZSBxlF55tBy1H013O68fv6mfAcJxxNT+kFwJBaF7EIEe
 prZqPFXlE3/m24KoU5dzvM010/H5xqhPj2JLvR+G7AujovIYjLSrRoQDh0NtzMsUoqg8WlocRaD
 nMr1jYBBML53SPA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MCBTYWx0ZWRfX2m6ySL734eos
 9n2HuM04SY5NZIXewBSryyum+jg4VBCOfr9pgI0DX1hsuZRFG9vNYKu7wyr6/ydGJ6r29YOk0w+
 mNwVr0EoaiTmjgDFD3H9boxEtyPUo9U=
X-Proofpoint-GUID: 841osdB7RkX7wXWCOTbD65C0whYr9N4S
X-Proofpoint-ORIG-GUID: 841osdB7RkX7wXWCOTbD65C0whYr9N4S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MCBTYWx0ZWRfXzdc10okqDXh2
 K1TQe5z/eQWtjqpxqcWD4rBXvFzdgy5Rx9+YmmseYVT80ZdSUp+fXeR2lqi2qnHjeD8M6xgxphr
 Y9F2RPlPpvKkiLzvyQfbwJFrNh3AK1jIbMuU2y+a5ATAFk7CCjFRzUrHdAaxz/7hAJOh9psaO5/
 oR6nFxl6KeYNnDx8zHrepF43PyvTr26k3ijOmXTQ4hWjDPxKzq3SoMYsFMdtN8O+B4TUsiLTBiG
 FxAifUYXMGtrHyg9KgKqjobygFabctZgjRpLt8PeB7Oinp8Qq1lJqgb/5Y7wwGalYp+fegUklfc
 Nv4Eu14+oiI5gJIiOaxsDv9PTaqOMuON8j0plVofCohu6Yeb/T7RbGoAMb1vr6+EiO8aP7zU2lq
 liqY7zs1AosEqZYlKHN6z677la1qYxwmkXjNzDmXw9QYcj7NjomNqpb3lQRYEUDx0ezFskw6/x0
 yP18213FdC5pppvnLAQ==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af4a9ac cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=_iFXmH2w7s5zJ4zlvgEA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110070

The DTS can be applied as is. Then the bindings can go independently.

Changes in v2:
- Patch #1: Update also apq8016
- Link to v1: https://patch.msgid.link/20261110-display-msm-of-graph-v1-0-0f3106f817b4@oss.qualcomm.com

Qualcomm DSI display drivers won't work without proper endpoint, so be
explicit about this in the bindings, so we can validate the DTS
properly.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      arm64: dts: qcom: msm8916: Disable disconnected DSI
      arm64: dts: qcom: msm8996-oneplus: Disable disconnected DSI
      dt-bindings: display/msm: Require DSI graph endpoint

 .../devicetree/bindings/display/msm/dsi-controller-main.yaml      | 6 ++++++
 .../devicetree/bindings/display/msm/qcom,milos-mdss.yaml          | 1 +
 .../devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml        | 2 ++
 .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml        | 1 +
 .../devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml        | 4 +++-
 .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml        | 8 ++++++--
 .../devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml       | 2 ++
 .../devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml        | 2 ++
 .../devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml         | 1 +
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts                          | 4 ++++
 arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts             | 4 ++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts              | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts                | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts                 | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts            | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi                             | 4 ++++
 arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi              | 2 --
 33 files changed, 84 insertions(+), 5 deletions(-)
---
base-commit: e4924298116a18e6fb5b86e8a3b7bcd3b4ea0f46
change-id: 20261110-display-msm-of-graph-a081a5c614b4

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

