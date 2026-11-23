Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452196;
	b=h5L3ajGKrYH+e5pSOGGb8RDFQaEC9Ol8Hbg7DgwvGR+cm9AQukq3/cRS9zXukS8Vt1rJ
	 oK1iiNl/rtgY3RGmUsDh9dr/Xs446MlKYRyqdCVRWMD1hrVELDB0cFSx+f+3vEKYX9/bl
	 IfpMKGyFzhRM67/jil/Mw7qxkjaLwXt9EKd1FDVJ2+aD+iQ5QAyisTyR8utHPQbe0RaQx
	 WhgzvJcsmP+3rgtyDoTCAkURHTl/gUo7HAgtP4lDIbGobtEdxEkmLRb874cPFV7A8tDAy
	 88+1eKr4VuRY3Q5qe3HGlcjRCx0u4/rr8RljljDhfWITMvUv4uxx5bHxGHZigUvP7Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452196;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4dujEuBXbtdpkxlaf3V6YXDJHRlkRou/+U38dB2bzLI=;
	b=xCW8fVBl2OtRMsdeqOD4DC/RJgjPcRb38NlcU+Y1f50yHFgzLradhdgLpno4HYdqXL3P
	 xfq9YJErhf78E97EXYPqz1cXDmQtnMQu1AiZyydN/78uEWmIGHS0NIfXMtFpFyIhy/GIs
	 /nCk2m+qonLiyWhxty98TfyeAzzb/co4JUvJ90WpMUOOFQA3Fa8lpFv5AU+pBWYF8Inkj
	 C+wb8it308Mw5l8WX+Fq0BhLAE7q/d/7S1GrGXQX40b8F+/VEsYMobw1GNftKUDyfIHYO
	 Tdz0jyHxiOHLcdveyinytInWoHNobVKE/iBdgVoAAJy6ZgReT2eWIMCoC6RzGwzVeKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BJxLbydi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d9wepR5N;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9BA606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 16:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C9BA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BJxLbydi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d9wepR5N
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGxMc3730309
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 16:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4dujEuBXbtdpkxlaf3V6YXDJHRlkRou/+U38dB2bzLI=; b=BJxLbydiFh36cspL
	sjkt6M6rN8VAnIycKHiGxY9g2lFI+mhGFgkLoxusd6OBXjQJhbKnpQYGvXqb5JsB
	ONVkCBLGcpewlx+PPz52uWazm9Vmn0QtMSE+lUZEm0d3xdqGGDEqpSKzdu+NDLy5
	x1STtGIlRK83phRttxuFZkmP8Oh20GPlJ02HU4vUkXO4IJZLawe3flwg8/VswFyu
	9ZRNmjziL6T66mowY2aLoUzUwGxZWqUCLOZOVUbYj5C9GfQ2OSxEGX/XgpCcA7Uk
	NStCa6Er+pOIT8Zdr8e6fB6Tgr/RKAiaXeYMsjtG4K/NhdwC8K4JrBBljHjwXw5D
	CNB7Pw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd2eg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 16:43:15 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc01d48a1bso3258245137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 08:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795452191; x=1796056991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4dujEuBXbtdpkxlaf3V6YXDJHRlkRou/+U38dB2bzLI=;
        b=d9wepR5NDCKmoeZcLD0kH9eyIiTwFA4e8UgUGQ5IuHeGgLASnlzgnwlSHL+b13YiHz
         XOBimlr0zEryQpQDjoV2GNeGulSoJufsW/X1WLP2F3YuwN3BpCX1CJABqQsZZ1SUANsE
         spiuAw94zoRLPhDE9ddaunkvGh8i/C5St09hCqLd+eCoKsNx/2sOChVhgaf9ICw+uAV5
         nzxYo3yLUPd1FtjeoPGM8m0cf9iHtVbXbdDVlt9TtC/vJuqPtWmdUAp57qciKA613a70
         PMc9XoKvNINxF16Ohqg4C01PEnJ/85xmPGGuVx5jr5rNfZEar+0ejdVgcqEQegiNKJDQ
         elrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452191; x=1796056991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4dujEuBXbtdpkxlaf3V6YXDJHRlkRou/+U38dB2bzLI=;
        b=xZCV8zpURMrDnUkr8WyVs9IMDMH2fjsDXu7SAiRid4Le3QpJY5WSsTze3hMa6Zxo2+
         ek1mZqA8V8SxCF0kHW0aiPLl3tY1rGkqxDD3WhV05jCkLXgi0Uyz/Y1wTonwp/D9IlzJ
         bnbF5DJmc1gRi3Fi6Qfh7iVaPf7JAK8Eqj4efEmus8xWspIDPuNLLxUFb+Pvg7+OxWSi
         qmfMEYHvtLSupW9ASRqbk+ZkF6lMUknlc30K0EBCwBU85pZnceCPKbW3/dPGbJzgHavP
         jTFOOtL6zNs3i4y35X8/zR2FtnZ5RRb6nw5OQfUpsROV5QaOrxDO4q/qYgRCUsdz4dya
         /0gA==
X-Gm-Message-State: APuU4Z8y3/2zeCQ38tA8wAneKPLfrJtpqwqNgpPHzjdsHXtFjlQE+Ehj
	AxylQjEJb4X088lEUQIOhs9b9KNbwr7H6hRr5NWb4ykCmvHSM57dfbmGvdhEUVn6X1FWiHaVAQP
	6enKXwKGIc0QKtXOtPC+ewrmnA65MpL9Xnv97K+r6cMjuls+UEW0y9+LmIzcDRqr3B1Ew
X-Gm-Gg: AZFdTZcph+ox6u84yNe4wUaBa5myB7on+ses1zdks6v/FbrF+novdoCz2VQ9VECmy5o
	fVfpDyGoi8UW2fuNd7sbGc3KYvSj5DCGNRpo/pksXQqol+jB4hz3zsmtzU+L7Mh/ELbq2X8A2Ce
	oXDg/MYTuMgZCurIviSeEe9efA8ixm1yJ3SAqBGXSm6CvXUg6KamUGtWJV1T59HXJa5TYxREjJh
	xtl49/8niwXDfnUD5XSLX5NP2m/uo5r2TNxn+wNi9TFElmvOrSPm8d4Y04cbrIvicMBs7yiUPqU
	eLTcrz9YxLpeN8FWvna+3qYk5OomqCdhFfpkfI4+ywI9DXkD0ucsSmsuegMm7wRVL23d9CRwQcG
	Yp2OqqGromkqK7/7z9RPoZ6iEKQJbbbALZjmkxSsN7syplsSycb3LuaPBUATbyUclOhC6//kigX
	F/jspTZISFvc3P
X-Received: by 2002:a05:6102:3913:b0:7b9:5abb:eb17 with SMTP id ada2fe7eead31-7d6db84e3a8mr4489905137.3.1795452191194;
        Mon, 23 Nov 2026 08:43:11 -0800 (PST)
X-Received: by 2002:a05:6102:3913:b0:7b9:5abb:eb17 with SMTP id ada2fe7eead31-7d6db84e3a8mr4489882137.3.1795452190556;
        Mon, 23 Nov 2026 08:43:10 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm426725366b.80.2026.11.23.08.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:43:09 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:42:59 +0100
Subject: [PATCH v2 4/5] arm64: dts: qcom: agatti: add the Embedded USB
 Debugger
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
Message-Id: <20261123-qcm2290-eud-v2-4-9bfc432dee07@oss.qualcomm.com>
References: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
In-Reply-To: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: uSPezcsplmTj3cQy-0r5w9CPqcmHRQnJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX9/KqK7wBRJ7c
 qlmjrHX/mTfhAuTzgrhHdUFof6V410eIdzUxX2j2nvdtpYF5WIRPJWN0rfqBml19L2X0ZJ7u6P8
 oCe6SKM8p+tw5NiqAWA9onJT/9YqahljrBF9zuLDa72qh0tGjKGJ97MFz24TJTqQB6RWd63Vxvq
 EjTXQfYPXNv+5ys/zwIZbN4HDn3haNCg9cNzLXceO0GXJih5m6NCvLjzoR/Ih3nc+bfd5uaio37
 bPpFmG+2JygsnzoIxpCkfQE0h1J30p9AtRTvBTaHmEUDYQSOWx5GK+s6KpDdgkAs52DzdRWHREN
 bsCm+/WcrbGchel4KCdyZjZKZVGfZKYSlMnXifwmMRIbcasLCXQbahLRwl0NJg+rEn6iK3nm62u
 tLtOy+cN1xKj8vu9mXmfxeCDrxV37rlm7rWQVMAA94E3YJgOES33EF0UdcUzkK1dAAEUufYpAfm
 hhDeFnMdZNuOfzM9ngg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX+rHPug+f9kK2
 w0JwqZSaw792Es94x7Om930k1lE6ztvnqL0kAkTshnu9ewYZgDwYf99cjixQbDI1nIyZ026J/VZ
 /nfCOuYmtk0w9AbcoQmHeWcAbYRusGY=
X-Proofpoint-GUID: uSPezcsplmTj3cQy-0r5w9CPqcmHRQnJ
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b046d23 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=RP-5YM1mH3AJJUWU3rkA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230066

Describe the EUD:

- its CSRs at 0x1610000 and the mode manager register at 0x1612000;
- TCSR_APSS_SPARE_REG1 (0x3e5018), as offset 0x25018 into the TCSR
  syscon;
- its interrupt (eud_int[1], GIC SPI 189).

Hook its port to a second endpoint of the dwc3 high-speed port so the
driver finds the role switch, while the board keeps the first endpoint
for its connector.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index ea9b39b1ed43..ac7a653a6f03 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -826,6 +826,30 @@ gcc: clock-controller@1400000 {
 			#power-domain-cells = <1>;
 		};
 
+		eud: eud@1610000 {
+			compatible = "qcom,qcm2290-eud", "qcom,eud";
+			reg = <0x0 0x01610000 0x0 0x2000>,
+			      <0x0 0x01612000 0x0 0x1000>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+
+			qcom,tcsr-reg = <&tcsr_regs 0x25018>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					eud_ep: endpoint {
+						remote-endpoint = <&usb_dwc3_hs_eud>;
+					};
+				};
+			};
+		};
+
 		usb_hsphy: phy@1613000 {
 			compatible = "qcom,qcm2290-qusb2-phy";
 			reg = <0x0 0x01613000 0x0 0x180>;
@@ -1680,8 +1704,16 @@ ports {
 
 				port@0 {
 					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
 
-					usb_dwc3_hs: endpoint {
+					usb_dwc3_hs: endpoint@0 {
+						reg = <0>;
+					};
+
+					usb_dwc3_hs_eud: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&eud_ep>;
 					};
 				};
 

-- 
2.53.0

