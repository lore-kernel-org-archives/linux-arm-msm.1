Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC053BC69C
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785136130; cv=none; b=DSjUitdJ4Jzv7/0FI54N6lRUVUh2jfQJHPuOdKwVSWcvWRZ2S5Y12MvoKYV7SGlrBk59n/192aHQIkaizv1EVK7DbIhYvLvIE2gKfEM+euWDc1IuNmPL6UXa6laa2wk2+KkYKpKKN4cEROgmMbwTVFk6u/Kx0MyyNQJilrfoT6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785136130; c=relaxed/simple;
	bh=MG1GWb9hZphruxpUSQyenSfn/wC+QIgQwpedGztWTuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UoPkhBASWGG4f86Sz6k3DDbV+FvnBXC6Qfe3GjX9h8ilNixWaBOkcvdrkDFJenZCfZd03YaJnZVA3nMZSxBrpQfjxwjhgygZSJZyRVSFjSK8OSnk3FJQ9VSgX4dTXzphbOgxLZH70rsJhe+Ip1XapKzwgbys13KGpWnt9eMVYpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mfh/Bwgn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V7x8SD88; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mfh/Bwgn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V7x8SD88"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1fpQK2417069
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AkCcYKg/1g7
	RZD8uzUH99V7PW0IFfhJEegSKIw2Rqqg=; b=Mfh/Bwgng7PsfU0U/dLlrX+dTfW
	LoAnco+5AXpsEFXGtZttYoCpiMI4Av9UiELvHomg7qVRTg15Z8SN+hZ3yDJlwiaD
	h7PfKGfMqWPkcn9tmL53lFHce1izllB0TKfB124+8m/RuVkiGbHZA2mxvVJTdoqT
	xer5O1P6rt/qaVTG9xGjJOmOBZ+0ds+GNOFMkcWhq2tTcCHwSDMv2hz7rGjG4tXP
	ZCr18ZuYZsegJ1G8k+5xsh4XK1+JVeTnF+ItNwCp8HlYlqKjfFmWSBEDyZRICfxn
	hlMzaQn/w45GVlAFJH0zLjLwsZsyq+Rv9Qo2MzsksgEJvvklBOgHhlbhqVw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmmqycyb6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:08:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8e9489f62bfso32069826d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 00:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785136127; x=1785740927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AkCcYKg/1g7RZD8uzUH99V7PW0IFfhJEegSKIw2Rqqg=;
        b=V7x8SD88ES/Uqn9S4qdgkUDyw+vO4ufSaOhNwifKDID2M4ktdkDfaqtqJBW8n2mHJo
         5XW1i3s+aZY0lsMrRkubvJJkldovZPPLCEIsjzTWLRog359Z35LXvFbxbN6L+AO9mTID
         JUvmstkBk1c3oXcvUxyzwftChG9liTuoJDs9Q+gsQJdQpyVgFyXG4yO8Ck6fw3d7aFx/
         a281yNYWwOA0dT4y1Ev631kyOAfmHjeC3zzAKHMQTesu3MvBmUPCQQZqc/E49naGugEj
         oNgsFzsxkomaQNn7pNUbKNKO/5TLOlZgajcjbM7DuHAhTpehPMhPeMCsF85uuwcn7S5V
         eFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785136127; x=1785740927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AkCcYKg/1g7RZD8uzUH99V7PW0IFfhJEegSKIw2Rqqg=;
        b=b+H+6KA/ohKzFdIUCssG3DvfcHQneq/1c8SgyWI4m9/+Ft7urwLb1m4k2tFAg5sJu0
         Mmmr5KYD+VGCIh9MqwxPOpCwWHznUys16Wfbq1TSW/nkT2tQ1Zf/Y/Ssi0Gt+jQAVFVm
         QbDSRMk8pREfeJgap8PyXvxDhPqbTrr0q9W8XUJ2Bk+10glcAa8R6c68JkNZOCoUbefg
         ifhtNELPpvHi/WaTIBrQtZcMzj9D6wHNvgJGHrkyfc9ime/OdgPf2AlAinECnpIfRGOO
         LbBI5i6QHLnJWE2qX/ifyV0SGyBNQs0xd06j6KR/LYdQvmWzCeS2vwmy0eSJRvFdhPmK
         F/Vg==
X-Gm-Message-State: AOJu0YwGMjYcdkqKfhv9SZuamDYmz6CO3DaZB0sG1r3E2tLbtdYf6ybC
	06VxTywzVOLhXV2k6V4Eroh5ml4ZJ2feU3YCkNA4GbLEXY/J9g1dKpB0MBQjFaTM2q6EPOWtRkt
	9oImMtJ+D3iSDD8NbelNuJ4h3TZmxBi89bxMCy+YKOqAw9SpXYljbMG358aFRZLDjkRFe
X-Gm-Gg: AR+sD10SgnmGS5BgDs8a4IT5JqaLDnWow+PjKezgVC10lPVB/wHbeIRwZAzy0cEiTPl
	tYhnnlF2VE9G1z4vgbZszAePzzf6ahHPhG1rb1P0636njxo8FYKbTwARV/3JXXnUWxw5MHFLtnb
	NRYjHHqR7ae7NzptNjGOZ3xQgUQ8kmv+wPWbJo7OL/9ggif+Ir87phsOqKPu15tD3vwuSjrQ6JN
	0JZjxGJ4hSatAk4kOQh5ake2uBIuos3gW92ZnJz4v/+WOxLVk4MB5182hx9z0wylGVjaHy9mTKA
	ItBhDN20THB/HVLyQFfvD+Kq3dvuTKQ7avAkP/vtMOUMKyErbya8LAr2jT0fIEuR4dIo/6iTkep
	n1u5/jcoId7hohA+KRg9bNAG4QilM9xrA4L2k06qWTEcer1U5aGmjsQz3Owk=
X-Received: by 2002:ac8:570d:0:b0:51b:f635:9aa1 with SMTP id d75a77b69052e-529a865ef01mr76880121cf.48.1785136127264;
        Mon, 27 Jul 2026 00:08:47 -0700 (PDT)
X-Received: by 2002:ac8:570d:0:b0:51b:f635:9aa1 with SMTP id d75a77b69052e-529a865ef01mr76879951cf.48.1785136126840;
        Mon, 27 Jul 2026 00:08:46 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e8522e88sm58884446d6.1.2026.07.27.00.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:08:46 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add HAMOA-IOT-COME board
Date: Mon, 27 Jul 2026 15:07:16 +0800
Message-ID: <20260727070758.528-2-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727070758.528-1-yuanjie.yang@oss.qualcomm.com>
References: <20260727070758.528-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2g-AkxefeziF2PUIiAO0UKYCgux0J6Qi
X-Authority-Analysis: v=2.4 cv=drbrzVg4 c=1 sm=1 tr=0 ts=6a6703ff cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=ufpXK9N5UmUcXK3xRpUA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 2g-AkxefeziF2PUIiAO0UKYCgux0J6Qi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA2OSBTYWx0ZWRfXw8YyVJglW5oP
 Cbn2A1k/aDurHqO9kbDN0h/h+44ADE0TtA/guoR81dM6TvhiI7Ne6ePefp/usE6OgcZIZ/2Jgn1
 NjTAKluApmtIKzcqGSz1GMV3RwD6qMLguXxueDZ/0Ea767VHbId2dLAXMA9/ulpzeBhMyS4A0d4
 Ks7VyhAbKtEBCZmJJ+pCPBP0jln46Pd4Q/6l+fFsISBJU6QzwtvcCoDoRccHbv+OISNslNRAktY
 lJXjmGr8X3zbMx6Hxeg1bV4i6Ic07ackNoHO1PwjSobYTyKj9fmH43jMP4HiGdbqJ8brGd3m/Zk
 C8URf4JeeE/FZPnmFFU6/E3NYp/zbiTm8ePVzP9m/6ZHFWyNOzGDGJKlwNoqJ1GRCf47H+/GnJR
 RkNolMAk/sK9gWOsn0XbzLhFaDCTcqkEZb3Qs/rrudRf0VrWf1mfBlCPvAWxAdRUjAzrHfiyT5D
 OuxqIjeMkPxVFdL/YsQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA2OSBTYWx0ZWRfX9VPqfrSrJjOv
 jMCYjrou+kgnbFFnnLHc/jbPfKXrtEGsRL5Eg4ee8Bc0IwRQKgBIAfMslVUAPJe9ulxLLOQmSHv
 qf39UT9pq1tYYdoi1WSsc2Q00DSCE0I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270069

Document the device tree binding for the HAMOA-IOT-COME board based on
the Qualcomm X1E80100 SoC.

The platform consists of a system-on-module (SoM) mounted on a carrier
board. The SoM integrates the core system functionality, including a
SiP containing the X1E80100 SoC and its supporting components.

The COME SiP hardware is effectively the same as the SoM used on the
Qualcomm HAMOA EVK, while the carrier board provides the board-specific
peripherals and connectivity.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c7c9a9279684..443191b12137 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1209,6 +1209,13 @@ properties:
               - qcom,x1e80100-qcp
           - const: qcom,x1e80100
 
+      - items:
+          - enum:
+              - qcom,hamoa-iot-come
+          - const: qcom,hamoa-iot-come-som
+          - const: qcom,hamoa-iot-som
+          - const: qcom,x1e80100
+
       - items:
           - enum:
               - qcom,hamoa-iot-evk
-- 
2.43.0

