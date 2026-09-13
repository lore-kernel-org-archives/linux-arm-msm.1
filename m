Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E6E3F1AA2
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 14:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789310466; cv=none; b=Ji4vzWQXSJlkZl6d0jWHZa3njOULzx3nuf/04uiJGeZD5iN8XSFml4femmIn1B+usHmvIrDIBh6oJjYwaBcAArx8Lw5nxgwAIAGuv2QaYENNJ+VximgV+elmS71KwMBCK6stPgjU35+Uwy7hS2zf1sz4odKrys7qlf1qg9M8Rp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789310466; c=relaxed/simple;
	bh=IY2WnSD8E/Qc7eoIlUp3aoznMSkvtOFuNLNJe202z0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sVY/FmIJx9+0Z3u/qgcynyxuttD4v0jrY89v0plLnoYh7xN1PXQzZ3kKpMoRu0DRxeyc9XmNqkn8t30r8qav/nth3MkerT61JHjzLhvabNn+PzhKRPbgwM3lO5zB0M4v37B+ko8L3OhduMVc5Jd6hU7mi4uuE26XSn5tO+7hNaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BkQTaJdV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fLrDOPeH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BkQTaJdV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fLrDOPeH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DDxmdd2785785
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 14:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WADuGXO2aoMe0sj7AUt3ZiPoX2ZXMtN/W8/YvHMCyFc=; b=BkQTaJdVMzXzaTgO
	KfiKVTg9uvkbTmRyXTZU2ckmy2yLfjAl24DHPYSxLkevVTYf+u3be1twM+p2NnY0
	3IjvT+OIUelDurfXnvQUAAWFYlYAApXBIXddAcZmMz5yI4qednV0MDlIn5fCs9PT
	XrIhmKZ0DBraSQX84yLOom78Gxbpwm0mDbO299pmJo2IimE4ZV6rPdyswyv0RJik
	8d3yoxCMEJbHl6fXnbvAPfSZThufEgUHf83+CoyNiqMS3Kqn/MKtrOeKbPb45VyY
	w2C0SxM2d/Wl2olS8StwFODmGbGwoJF4xZEogin7MsEg2zz2wiupJw43H06WTzQo
	pe20pw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cbh63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 14:41:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so3520381a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 07:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789310463; x=1789915263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WADuGXO2aoMe0sj7AUt3ZiPoX2ZXMtN/W8/YvHMCyFc=;
        b=fLrDOPeH2OGqhTO1RflKYxww+bweGfL8XfiYifQFJjcF369uIilCp/ZNOOXJcFIOdU
         jzsJfbpTwoPia3ANUbPLPEZPbz95oGEQOeV9WofLUz0A30ps4eh7JinyiLdTcjaE35tC
         nJZZaD19WHH1ZsfaFLsxaseSs80GlZBEfvjzs8ucm3uXKNYoJnzGXMS5yZdujFDXCfzL
         llJoJElITK3sRLVnusQhUJ1qsHzo4W1Mhn6qQfVmItw7MjVcJt/NeNNOePOvm3gI9N9o
         OFd7T5byOn6Ln4+bTGVgBoitByiY1POHL+edT3q/XHi/y83JyY4z83G9lph6QEMYUOft
         h8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789310463; x=1789915263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WADuGXO2aoMe0sj7AUt3ZiPoX2ZXMtN/W8/YvHMCyFc=;
        b=r9ulF7Y5lU6HdQG0ih3m90fAO7QNpJ/57BdWLm5MxYq9NNE1C9ez0Kc79algzOubvK
         DYx8IcjSmPZ31zKyFVvMPazEQs0WbVO6fwwNIC3Wl/9TsP9kJIKY3YGqD869MVHXM1/j
         JO5H/0U/UGqkSkTqQdzqKI6uohPWIGHJ17P1Ruh044tC29hIuVPMddGH3T/AQ+gwc0Yw
         WZB0Y8y/H3uP0Ct0oA2HmyiAopIl7Dx/NdvLbPcHYBtGKZzkjnMOUORVb/0FBRYwF5kn
         sWAM32HvKns+L8R2T1de7V8I/LGy2Vp8rb+wJUSLAHy/YKp8iF1cFIqVSe33/p2Yt2hj
         QGbw==
X-Forwarded-Encrypted: i=1; AKwUvBycWZukQuaW/aqSsEPx0DyOUkpz1NwrwYXABxjtLjDGdfT6tt7y1oct4LMGJ6d1/aEgljDYYdNiznI+rPlj@vger.kernel.org
X-Gm-Message-State: AFuF++kxOBGpFjl1EF9gRAkY4tv0v9NOfJzEL0jlEB0bBmJ5nL+sUOCe
	14k9YAev0ERP4NIp8vS1BWfAUIL/mssqlL/8GMrSn7b67Hbs92I8ggSajEvVJGYYdp9kFaNJdr+
	f1Bg3zlahqkiomHURGt+uLiTeXlwP5W/AxSfoJxZMGeQ/YeyKNnYqX0/PQi+8m33nWGp0
X-Gm-Gg: AYBFou3mn3puKe/zZ8UCGDIsckTJGi8Ia1uFqheu2emcZWMVEwqKXLZX/5feptguBuw
	t7JXm26QeZPUNcyOr2ker9aXkHErrEO9LQ2etBtmKul0oCM9z8ELe9yJPqHUBazNzd3yZLPNH2E
	FFZDCe4FWxXIwIgOc13B69TjHYA1T2US4V4a1zTFQM6looMWvysStovHsRe2uF9OK1o5cCEfhhe
	F8Ia2j9OZpy5ThDbUKH8FaRSL+FnIUv8n4pQx8asMPdbgtqrsPjPmdLuGmpwPpl43E9VguoxxsY
	iY6ykBzATnFMnblAbqoqAdY+gdu5M1XClyBZRlhQ3iLSuLMVUPGwkv+veV7qfFC3VkDnwSXarDp
	vRYdbrXgCWt7hmseT12kTQvH7soT+JSC60BZlbJjBEJo4eN2n947qXf1qwGoujqIcjpOzyw==
X-Received: by 2002:a17:90b:5408:b0:39b:3109:10ce with SMTP id 98e67ed59e1d1-39dbc6a0196mr14224704a91.16.1789310463150;
        Sun, 13 Sep 2026 07:41:03 -0700 (PDT)
X-Received: by 2002:a17:90b:5408:b0:39b:3109:10ce with SMTP id 98e67ed59e1d1-39dbc6a0196mr14224655a91.16.1789310462739;
        Sun, 13 Sep 2026 07:41:02 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14382741839sm2904705c88.6.2026.09.13.07.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:41:02 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 20:10:44 +0530
Subject: [PATCH v8 1/5] dt-bindings: phy: Add PHY_TYPE_EUSB2 definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-eusb2-interrupt-v8-v8-1-0f505b9c394b@oss.qualcomm.com>
References: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
In-Reply-To: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789310452; l=1964;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=IY2WnSD8E/Qc7eoIlUp3aoznMSkvtOFuNLNJe202z0k=;
 b=O5E116sLIKdMq7m8mU3ZS4xE9nMUaQM50pmqzz3y0t2E/twLbTfyVIOTlWjZSaucWPmnWISos
 ucWaTi3SA0xDUMH7MpWkbiG+X9MYhCpULb6YAOuoJ9f2UmuPrIY7Ugm
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDIxMCBTYWx0ZWRfX0JWTDGvat/ak
 A4tRG9quBzYLKwP17PznZQnU51h96EeUhKxH+zASCTt5v64/935qXpIoOTaPqWBqnZwFLrwhqvO
 DsAOuEkkv3V5Aq3APtruSbN0Arg1KRE=
X-Proofpoint-GUID: _zvdWliWFvZryejAkYa6Mixzd7Ox_ntp
X-Authority-Analysis: v=2.4 cv=BdZNQbt2 c=1 sm=1 tr=0 ts=6aa6b5ff cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=L1EOSesq0gyy4kqEYQ0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: _zvdWliWFvZryejAkYa6Mixzd7Ox_ntp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDIxMCBTYWx0ZWRfX12cbSq5uqm6W
 lW/pVBX70WGOP9ip0B30LW0xvsStIdCtngrUzMe0o7/vc7f/UYoWmvy22kAbRtMYOcouGhBsJTh
 CSyycYbg8n7DEyuRz4Ki/vvqfnIlCya9A53R1GthRsbhgoeVZ+16T27Oy7j9cH789EvQL0GkIPf
 R4XGRZhVQYDGNMnnrs6ecYvYMpvKPF86u5OCQq2ylDGTiJIkbIgvXCbiVH7+p/S7fxpmGZri7Bd
 8NCvPnTKgiKDJQhNEOVp5BSFzkDSbvegtrriB/+C/1NmjNzI0DaSayJ0gPUfv1t+YwsWUaLeGPe
 Jd259MshhgU4eSfeM6teblpF2+qFy7/PmNchXUNcWMbUSlidQ+toDsJScDmqkXMVA0oI9tqCGX7
 62qdOB63mwCO0kx8Id3NmoATuwHmZIlL3djWki0j4YpEPMNAd2T7y4eSq28fWxH/GnckO4RWvUF
 pTZAknFikE/rMe9WF9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130210

eUSB2 (Embedded USB2) is a MIPI Alliance standard for chip-to-chip USB2
signaling. Unlike standard USB2, which uses 3.3V signaling, eUSB2 uses
low-voltage differential signaling (~0.4V) and requires a repeater to
interface with external USB2 ports. Because of these differences, eUSB2
PHY initialization sequences, voltage tuning, and register configuration
are distinct from USB2.

Additionally, eUSB2 targets handle wakeup interrupts differently
depending on device speed when operating in host mode. According to the
eUSB2 specification, remote wakeup signaling in host mode is detected
via different data-line assertions based on the connected device speed:

- Low-speed devices: the host repeater drives eD+ to logic '1' upon
  detecting a K-state on the USB lines during remote wakeup (eUSB2
  spec, Section 5.5.14).
- Full-speed/high-speed devices: the host repeater drives eD- to
  logic '1' upon detecting a K-state during remote wakeup (eUSB2 spec,
   Sections 5.5.15 and 5.5.18).

Since the eUSB2 PHY's DP and DM lines need to be configured differently
from USB2 PHYs, controllers should be able to query the PHY type and
configure wakeup interrupts accordingly.

Add PHY_TYPE_EUSB2 to distinguish eUSB2 PHYs from standard USB2 PHYs.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 include/dt-bindings/phy/phy.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 979b5dfd8353..555a022c8c0b 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -24,6 +24,7 @@
 #define PHY_TYPE_CPHY		11
 #define PHY_TYPE_USXGMII	12
 #define PHY_TYPE_XAUI		13
+#define PHY_TYPE_EUSB2		14
 
 #define PHY_POL_NORMAL		0
 #define PHY_POL_INVERT		1

-- 
2.34.1

