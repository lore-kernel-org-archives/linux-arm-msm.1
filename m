Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FD43CFF79
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784535629; cv=none; b=P9drueNgCOPNrozZhvZKC/jebngnMLrV+XjVhyLQMWO5mJSCoK/Ix8muYm94BVbZJUtEER/B8nP3PoDafgtPLHDS+++coN8iclJqV6Jy4/PqWF8tcKb5BvR2HDC5PzCSqn2tMNLH7O4lotd2Q3fTz4c10YIfMvRETs/Wx30ltbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784535629; c=relaxed/simple;
	bh=aiv0AD/suh5Q8DfpHWahqVpLMyb+b7u4U+TQtpkkaaU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GQOwsttOPplS/8uHq4LoZYX/L9o6O8n0caWvdc1GX6RyrAcDplmSehCr5QAny+DmMTSd06n34zHWLYBX1Q2gJb69PhaiRTGpQn4tMMK8E9WW9hFASPVSeVrqcrmo5zS0d+BowYNHVhuVjRAWEKQCLRMpvZTKMI23A6MVcRrGSHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JIKteCJX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LyrFnLv4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JIKteCJX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LyrFnLv4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RUCv1520111
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AySNhEFQOTN
	/wXML7Im2LDtrkYAXvBDqSS652rSteso=; b=JIKteCJX8orE7wUxGG1lubywkxU
	FALVxjpDSMQVqIVSP9ni+w2B6tHuOHYHc/kCtGMBjdGA8LnIluT8WIZnkVmhSHZq
	pnk/PyPdcAlKRAiqbUUcKYjM8GaNBPnjtCzOCQENpd6FCwapIoy32gDfj9QRPXQO
	l0C51Wsj865NmqRz33R0kts1lPqUaiopCaTyy5zGD1pVBZ/Hc6m0rKSwLwJ9EWov
	oys9OPjkHFUSHVyVDQcKpK4WMBOG0gNeq+8NsJHQbg5RnYQvoPPrCFjwVqfR8dOI
	7H1kynKrkL2kDFV4z25X6KxSNUGgDgpw97n4jCMww3scxLQA16NwUALjwGg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2chn522-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:20:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38de4c60f0eso1892969a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 01:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784535624; x=1785140424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AySNhEFQOTN/wXML7Im2LDtrkYAXvBDqSS652rSteso=;
        b=LyrFnLv4EslrdWwHJ0mDX0x3etbVQPgwRRD00utL/eLe6OypPROCB+bPGm0geLSava
         IcEyhX8AR3cfhc9T25FN3zHvuZChVP4v6eMp5kbe9OHWHL8prXXbx8BnN4p7NEflUssI
         XWgkYS9h8lpT+aJ0z9B6soc5OuRFczfUU1CehQ/xi7hFu0NBZFIIn2xVT01Pnb2qMY/p
         LMe55fBOMr/FuYAiB1VhnQ2Kt2AywW/UwprphzfTS3XmAnDBSQaOKkqm6qvGYsuBYVVz
         EmmfTljZwsnuGPaWj+JXWSWY6iMj9jfMxwtTq/jX9/dDGvIbs7fv9SQBc9sPUsvomEDu
         pgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784535624; x=1785140424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AySNhEFQOTN/wXML7Im2LDtrkYAXvBDqSS652rSteso=;
        b=Nj9EBvqqBp2HmTJUHHkFE7IXuNkk28kkhIGjZPTFtueb8cq1mQu/qoHcGyzDNsUgM7
         1sM/hL/12MmjAmF1diJv/jchf1VgjEZLviU1+uHJPYg5/Ll4ccFaTu4U0Nv0kiQmCVgj
         p6EnPIWuo94zkpyL1sCYPgqTY4dkqLBVVF3jHEW6li13l3f5sr3bVdYnssKxY1BiLPjX
         i8RU67i6Ywv5J50aplKvjhOqA6x3V+sEmUhArEQ/mfGAxTedV44g8Rhyp8C7IL7wQqL7
         v2Zjm7dA0KVX3yPP/K+glDGSZiKLyPM622k3DoeD2Hj1TthUIwZKu6IrQzyquCvLK5vU
         0LWA==
X-Forwarded-Encrypted: i=1; AHgh+RoeGzjyVTFA7+CviFhvUZOWr5X/bskHyI+5vJq9nJxXunvtT9IMi0DPa/NvooG94rOqTNSbB+uaYCI2s89g@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6nrYxh8PyrtzQAt9a78OZgckYYYqjwPkwUSOLm0NxqeycY04L
	R1r+4H8ZTLcsPwCs7nx/FiuquoMjXHBcqiHC1y+ejuLFZH2tOZTjlFV7Rj/aSReMU7EaFrjNGCu
	+QpR5PaY373R7tqKVjWb1zwt8JpiJR1ei7GxyX83ncBSIkHQY5EhpEc2ZI697iiVo3JS2
X-Gm-Gg: AfdE7cnH3ll197OE0JqyMvksdu4/ViI/H7q8CizX/GWsIByVTD2At1Z75IGlSuohW9D
	LbIJiuCCEwpD45EpuiZIeKOnhCBaIrJbXZERdyEG2+nCxzozCnTUa0M6eXCvlMP0nK/QO27scpQ
	XcnUZIjz4c7bCuqwjxQDz3igqXjOkZ2XhVtmV2pNfCHX3OLvp8MzGJklabvTxvdcvAD5qXCMHDP
	TaXTtVSCI9mMiY/47GrnHcYcn5IQWqu5kqSLzl3J6RImggpoABRvLW+Tr9YNkOYFAALGzPXglT1
	ELS2Q/3aGWDEHIwDsfvuM5V7VNu9aGNpGNYA+JHG/+jgl9A3GfI2Ay8PdWtP1t+zG8yawmHk29S
	nnyFbH9cZSo7gyGq2HrTHKTwr8kdPcCs=
X-Received: by 2002:a17:90b:264a:b0:37f:fc3a:382d with SMTP id 98e67ed59e1d1-38e4b6044fcmr10163016a91.6.1784535623924;
        Mon, 20 Jul 2026 01:20:23 -0700 (PDT)
X-Received: by 2002:a17:90b:264a:b0:37f:fc3a:382d with SMTP id 98e67ed59e1d1-38e4b6044fcmr10163000a91.6.1784535623504;
        Mon, 20 Jul 2026 01:20:23 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39e0531asm7233688a91.5.2026.07.20.01.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:20:23 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        faruque.ansari@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com
Subject: [PATCH v2 4/4] arm64: dts: qcom: lemans: add RAS error source nodes
Date: Mon, 20 Jul 2026 13:49:54 +0530
Message-Id: <20260720081954.1858180-5-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720081954.1858180-1-umang.chheda@oss.qualcomm.com>
References: <20260720081954.1858180-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5MSBTYWx0ZWRfX9+Udx1z7o411
 inU+VykWvu0knVg1NREte6In1iS+iNwdxMRuZfCSDFVuMvlNrWU8fbdHZlJiVnnXtPo7EjsAj4I
 7AreocujZSFJNQekzP8NcHGhtdq6xZ0=
X-Proofpoint-GUID: Ff54zXK5ZIqv4iw6G2ZEkseca4WlpGCf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5MSBTYWx0ZWRfX3CBKHZOLq4V0
 TfbcwmfIYRqBA0Woh2bO8H4+Q26lk3ZoRO47bEWFpK17BXQU+kdPbFqK83zDca60ucSDUjfO2gO
 oRHOOkro+xaHPAFuSXDTixZjJExKJlIFxYRQ9MjHqWFp5Aruzvroy+aWvubMlLAI7oxyVjjL2Ht
 KeYOcsuSOx+H2LD2NsIhSpkTf2V3inNlHoMDD1w1txotLguWWgqMqCjjwvZX9Blr0/JAEp2dyYH
 3HVg8NULVuBsEb5PBJEE8ZmgqEmwe8w/DCJ5ykxh+RmI+O18e5a9dKvEOyF7y63cpyK0UdUBFuQ
 yYLLatrd15iKsshTT4M36+A9Jw1ZvIRgCRQEiOsGf8LVCz65NHmzxcISSizH0hWwNUEhGw9nqPU
 YQoiAiwBXPLqiliLLhgRlCdEsSsICHgbJcZPZIRbLbBMV/0WxlqwgfOTmv7baYdcOcm5uj40CvF
 UyUvrBVu2z4baRJxVgQ==
X-Authority-Analysis: v=2.4 cv=T5K8ifKQ c=1 sm=1 tr=0 ts=6a5dda48 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=isxhWOj3iQD9eQR5az0A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: Ff54zXK5ZIqv4iw6G2ZEkseca4WlpGCf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200091

Add RAS error source nodes for the Lemans SoC.

Two processor error sources are described: a per-PE node covering
the L1/L2 cache hierarchy using a PPI, and two shared L3 cache
nodes for the two CPU clusters using SPIs.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 3b0539e27b51..64d3370cba82 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -619,6 +619,36 @@ system_pd: power-domain-system {
 		};
 	};

+	ras-l1l2-0 {
+		compatible = "arm,ras-processor";
+		arm,num-records = <1>;
+		arm,record-impl = /bits/ 64 <0x1>;
+		arm,status-reporting = /bits/ 64 <0x1>;
+		cache = <&l2_0>;
+		interrupts = <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "fhi";
+	};
+
+	ras-l3-cluster0 {
+		compatible = "arm,ras-processor";
+		arm,num-records = <2>;
+		arm,record-impl = /bits/ 64 <0x2>;
+		arm,status-reporting = /bits/ 64 <0x2>;
+		cache = <&l3_0>;
+		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "fhi";
+	};
+
+	ras-l3-cluster1 {
+		compatible = "arm,ras-processor";
+		arm,num-records = <2>;
+		arm,record-impl = /bits/ 64 <0x2>;
+		arm,status-reporting = /bits/ 64 <0x2>;
+		cache = <&l3_1>;
+		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "fhi";
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
--
2.34.1

