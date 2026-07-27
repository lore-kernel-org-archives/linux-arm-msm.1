Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8F532D45B
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161532; cv=none; b=BpM+sW87VYrCU2xf/ZxkndEibcZ+LUWZdl2Iou6UHBDUgwv9QvPQmHtXqq+THwiCO09wsMyU8ua5OkspQTPN+ywRZ+Ogd9/D2kH3WDbxAOuQlH2R7i2T1cmrMfQQGwCVSdAXQOYeRUf5LjkImmixLw1JGkkuA2B5TnPdKwARI6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161532; c=relaxed/simple;
	bh=sVtABILvw16qFz0vsPNzwxnwBDnnPVxUFUJl6PcCho0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jg05C/hG7FI82p5IrzAIBPhEw2zs+V3e+9w2LCRiBAowWGTP/KddipYNEzPTQ9P1Oevs5uUxT55c+jRKcV8je2Hc3F9UBi6O7SrUHBhs6ccrmNNmJF9FkyOgzjmor3A1TRutHCytImEmj593m+8hiTBFjoZwCUsGIe4PH3ZcjIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U2ViyXPz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KK/lajgp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U2ViyXPz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KK/lajgp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlfL3033185
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7CaSux/07UZ/WNWh/01IaYJpnFO3EliCgL6mAg9sbiA=; b=U2ViyXPz2W04Fa2b
	6x3Ueyj5p2MCUhBRW+d8cgdaGYMqYvoFk2IOs4pPh7xXirNhCG/BVqlaCjK2tKd0
	UexbelIYSq8WmH4o9azadZywRQ4EtzKAG+fbxGirn5K/Jk7dm0jdM6qnZ2dJI6HX
	BUiwQZmMtylbTe+bt4qCsG35E2uhqK8JyLq6nF2PQHKwqmR6fAXEIAwMezB8tHGL
	LRTUN3hj/cLCYIyhF0iVB3DVTq6yQD23w6yF9lgUIGL8bYjH1go7LNl7QkFSOwLl
	hPWg49YjPcBF4ty1OJ8eeK6jooKanjpOp7eCUs0DLRAMLj3tsrkI4liLmgOlQRct
	ckmRwQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4c615ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:12:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfbf3e4a63so78083035ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785161530; x=1785766330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CaSux/07UZ/WNWh/01IaYJpnFO3EliCgL6mAg9sbiA=;
        b=KK/lajgpcdnlaI4bpQgVH0RoLn7HomiE5DtIiy0A2S8aG7wIKGhf9tue7/LUT2D8Lq
         oXuWg3li+jp2IE03AErlK7kqKbs6kNRQ/jW/cUe9pAFaWkRIBEVL73NcpnYS8t+toVDF
         tnDdc6FS5q9EEil4rktVpq5GrklYIYz2ixmirqImBuJ+4RXOOvDmua829WcGbpU3S++d
         GkXhrUf/ZA2skCZQYDkaPizgwN1XmATXRmpNoZEjMyYRqQbUB3svGuSqb3pyh4tUpEiO
         bEFE0lvlnDtTNThGGmYgD+7e5yVUufFaJM3vJL3KbLJaJdwkkavrnOt9uOf+7A3layHE
         ZMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785161530; x=1785766330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CaSux/07UZ/WNWh/01IaYJpnFO3EliCgL6mAg9sbiA=;
        b=bNw7yfyX/gbJYsZtbUnUUGbafu88p7DS9uzjZDfGqG2x/y4ColMdUH3JZefaRWy5dc
         WgCK4X5NrE1T71j+KygEsXVNO8l80yTrYE3TbxUXXQwfHOKzHJPB3VObNQxCACbVxaqX
         iO6INeDhCzx5k/vTOeTuTr7k0tuNyeEyNHSqm7WsXuEr1nR8DIaOiROIUWTlg3tTldAW
         vrMk0dxei0XVDto40N7d1DvwasEBxSY/giIlr0kxO2V/3A/2nigziLx8LxWmiRVSO/co
         PoneDw7ipXWaimKuyCVaPemR+v59ydTb62dGsdyjJ+eu1zJXzvDBJRZYWJR/Dea7o4Ug
         2/8w==
X-Forwarded-Encrypted: i=1; AHgh+RrJDBSNlUZF6Ze7UKr+4UGHJ/j3PWmPEki/u/DCVKDuficn6eMuIZxtUE4i3lutQzR9bAUDMHmt0LFRdM1n@vger.kernel.org
X-Gm-Message-State: AOJu0Yw30mKbGjGxplATER+SjQlbbCFJZggjnev9JsUIrFBsVRn8m0xo
	VGQkwlgu+tRM0eJeNlwcOwcI38GiBIIoPhv7PAAFev7gZFgvU8stRuHIg2u5WglQ9SuRTFmXdPr
	Ht0BxUjBJ8GoZU0GCWVlUhsPnN8npxTkgVYJlzIK1YFCt6M/jcXwsSD1NFDy5MfoOazR3dZpqsc
	36
X-Gm-Gg: AR+sD13Htm1V8bWA2Nz+rWUoQZaZKNqhTb2Mb9wnSwrrXnhTKiikbB6CHpG3Xm9kngw
	1OSInumnvygFg+4sqxJ3as22y2pavQri7U+T2M1wSdrKvo41ye5z2ru8m+NRZF4P0Rox1D3nf4b
	ANJQM+Mz2RunSpWPVlaLdh0Tp7GAKzLfnomPLCpYytu7wgZgtuKwXgZXvfiQUuIiC9c3i6sUtSx
	RSchdh0XPmdtp+PS0NdRy+tusgG9R+VN4udyPUfr9XcgIX0RGRQZ8HXwB9ral1RFrlnuxPY1+De
	9jMu5N32PjsAL9+s7bOrSRWJnSRS6cH4+/os4mhHlh3XA4Xj5Df2BeXF372RxCWHDtQpji4w//O
	kLKjLwsWHjkgopryeCR0zlmk3Thb66pg=
X-Received: by 2002:a05:6a20:a110:b0:3c3:b5db:d24a with SMTP id adf61e73a8af0-3c67e078756mr8870298637.68.1785161529731;
        Mon, 27 Jul 2026 07:12:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:a110:b0:3c3:b5db:d24a with SMTP id adf61e73a8af0-3c67e078756mr8870274637.68.1785161529263;
        Mon, 27 Jul 2026 07:12:09 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc44cb92sm53438677eec.13.2026.07.27.07.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:12:08 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 19:41:02 +0530
Subject: [PATCH 6/6] arm64: dts: qcom: qdu1000: Add support for TSCSS node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-tscss-v1-6-beed14e72510@oss.qualcomm.com>
References: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
In-Reply-To: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=eYQNubEH c=1 sm=1 tr=0 ts=6a67673a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=pCDFdeNEuqTB-y8mxvIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNSBTYWx0ZWRfX15JsR/crcenG
 mNkuDpW+pK2dX4YPsBvZd3RWI7o+jsI6vQWg+3EbJYuUcDRuSi7LGzLMe/vHcAgsO7UUKB0EIr4
 2IQ7MEtmPuxK8ASdyovcG33u0Q2S6ak=
X-Proofpoint-ORIG-GUID: fJoszsc74Bs8IkSrOG0kGM_omCRBPq3S
X-Proofpoint-GUID: fJoszsc74Bs8IkSrOG0kGM_omCRBPq3S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNSBTYWx0ZWRfX1v1nIwC1wIn4
 SkdwCCTXex2aOjckJHKWl9dsmZkfXpha8hqPYWcNR9C92ocXQK9ClFl67roNqXUgGjcy1k5OtLz
 sUxMY+oaPG4pVmouGlaqLn8ogD742waTCKtFaO1MqZpTqH9d8hp0o2wJVp8bHGYHK6/MYgGTUW0
 PTtSQzVtQf5zr64WeS4zuCJ59CMs/VKsbyShUBqWI+sN/Q499PDAzy455Rm6oQidrnmdpq31utz
 CiqZyXGxbbRKenn1w88HCswDvH1qZAwTN7XswU9bEB388oQse1YNHvfVG5FDl2GJz5w2KUvjetY
 BFFK1kYePa6w37dHr+XWmiDGUk/s2AlcVD0APocRC4g6NnBQJooFNbgEXoYnoMCMsAHH8yEuZO6
 kyCkzPLm502n4o0XiZGzKN5y8+OqQidmmU/N+7gWeZ5klbpa7VdwahgreYKEt9tNAs7eYp+FYqB
 SrJVSR5kGkPUI8InjFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270135

Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm QDU1000
SoCs.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index 26cc86d12f725682ebbbb9be22829bb7c6be7fd4..8979c18225184a318284131639f24c698e59f166 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -876,6 +876,17 @@ system_noc: interconnect@1640000 {
 			#interconnect-cells = <2>;
 		};
 
+		tscss@1da0000 {
+			compatible = "qcom,qdu1000-tscss";
+			reg = <0x0 0x01da0000 0x0 0x2000>;
+			reg-names = "tsc";
+			clocks = <&gcc GCC_TSC_CFG_AHB_CLK>,
+				 <&gcc GCC_TSC_CNTR_CLK>;
+			clock-names = "ahb", "cntr";
+			assigned-clocks = <&gcc GCC_TSC_CNTR_CLK>;
+			assigned-clock-rates = <500000000>;
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x1f40000 0x0 0x20000>;

-- 
2.34.1

