Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347C6296BAF
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 14:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785593651; cv=none; b=qUfK2/53/miPAo0ip6Va4C/RtJjWx18Rrovcr9T6Cc9ojQi/PjY74h4lQdnXes/lo8gjKQXkzT8Q8ENinIfB7DgW3OBUg30Vmvhkt6RzFSr0UHy4TSI/t9icSfO0EIxsfrHvqxPOjcwxoFSyuRTVIbW1H11xubIraQ5rFzdLNNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785593651; c=relaxed/simple;
	bh=WhReouEPT0feU5MQmQInaoMDe0X4aQOAzAKso31UGbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jAjK4PYfZpWNaUbAwXtpHCK3ez0ToMii27vtWEF/iPH7QudN5r/vaojU40IEMJRWwjGO+jLdkim4ZnaTYZwzhhzfxxQbtgCxSG8/UDKs6YS2LYy9LjrffzXOyJIsMRR2wjxDydZOAb5wzdj5XMo70Tl4Gqag2M5IoGtGTI8VR0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iLMPe8pT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HU/SD9h1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iLMPe8pT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HU/SD9h1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671CamL02815531
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Aug 2026 14:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uHNlyGAaWAq2NRA4NV7Ae3CXJ5ky5RIilhiWwiCNMsI=; b=iLMPe8pTHSuqbZnL
	c6S9UdNkfc+oSCsmzBQmAvFvEj4QYDeXSnYgATx3NBTzyTr93eV40GCDTQD6t0Z1
	YLy+tCp0XLuB2F8rHCOtQ97DlKRKdzj+oCxfPNMOYvooaG7D05FQaf8tS5RVOceY
	Diz5ZvAcId/3b8tircduUr7aU/D15utrVCwBuYs9jhdK6r1TSH8I21Sxp2REAQwV
	PKomR0Vh2p5y77OckNl0r8lDCztGhgdOPMm6LRbn+yUW7DcTOVv3BCaHT1szhq+6
	4RfkH9LZG5VXT7KJ1QJDuZIHAijKfkFR8/E8SMbg/KOnu3+HpodhUpDr3SPHohOk
	IONE3w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9jfrwb6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 14:14:09 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb6dd278512so1271358a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 07:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785593649; x=1786198449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uHNlyGAaWAq2NRA4NV7Ae3CXJ5ky5RIilhiWwiCNMsI=;
        b=HU/SD9h1vvsWPQOD4vyXf4gpwlQLvfbFYpX+/LmK/7e+GmxHnrzbvKWL0YViaHuhHk
         V/OiLnugamAdHvs1yFogkdc+O4U+fxS5Tpc5PaF59gKKYIDx3saplVMi2WmhP4O3Mxe2
         /PtP3iXBAR9NsENK1mHFk6ctsZrfEhb3kfOYCtCEgHI1trjwg6Apw2z8PvqxnPqb5iRi
         ghzbxZK7sZcDQuz4cZJ74Iva8BTgDN1jBGNK8BfWyq2DAY+xbDWs+texUtOt11cGOjEc
         pLucT50718rT8Zi0X7Wg6sCEUKlKALhxnTOvKNuu7AkONE1m1P7zwh54cKMEkqpNN1nZ
         kiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785593649; x=1786198449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uHNlyGAaWAq2NRA4NV7Ae3CXJ5ky5RIilhiWwiCNMsI=;
        b=le8UVxJwiGCmFSsjhxYqidgEewYvmQ+iV4N/PcFFKD1J/qWiRrz55qWdsv95e2LFR3
         C+g279x57y1B7EJIbAqBCjrdhZYGAsXmDNGi779rLfWzN5mjJE5JLmbE8s253elX0oFs
         JZiWvk42ThaefDb2NzG0M5wCfIx4lrkFTG+vhKvyZPfp2Y0ZmnvHJbQuP2pS+kjsDGTg
         O5OR31LV04xoht/TUmq8aNEjJB6Pe5auhVDXkA0krrNX7ZMiGlhNDgSyAhAQFDOd4SGl
         F/sSlwBk/moDadVIu78tHRXxojYAWEKhPoIOgT/eVBpGjfliv2yoMp2sy6m0fKvMIvXJ
         yz/A==
X-Forwarded-Encrypted: i=1; AHgh+RrJ1HRUPQNIOLFzknIdwGWANGb3pER6n6B2ITC89IrCNG0nyyscsOi/p7rU9yBpM4NYFPYTa/gnMwIW2f/1@vger.kernel.org
X-Gm-Message-State: AOJu0YwiOBG58txMyT8MGip7A8+8HJCVl4Yx8ObRtL0RAV1jstAEK781
	8DHQsAAzULra0A/MlwUl7W5SjPoG5iKvJ8UIwqUyiDurnzpqYxGuGHGq4s1JVscBsKKUYYf8hRS
	scMLCtZO3rcxExx2nd4Ptu3HLHeH8hAUH1ks6KyBhBecsesAJzgDB7ZyeUPwxGO722ZwVSWk7cB
	al
X-Gm-Gg: AR+sD126UOeNmObW10LSPetUC3Ns9TOUp8FX4CSx8jR+Voc2i8T4VEl70cjTe+u5efo
	l6gNIfGG+IrMc6SrL0RAV/K+gpcyRhVqutuFKpXP7O/Kk8wZV1PAXqrhWj2l04TMaMdZMkWzrEp
	ZqKn+8CyYavVSD0NTQpYejFP9YElfz1OJQxmdFcxgy5A71EdDa3mYJ+zZPTqg/UWbaLXkc8LZT/
	l/8IFMorKcfUjCB+mY4GybBBARxWjCNb56jGZp20GjfaDqB2nrVUiRV/5MDbOoYZXLYTG/Ztd42
	VathlxcDDc+JxOF2I4t022pnuW6urDh55cF928wZngSZmNh0vVoUZ1PpD/93wlQVVpdi0HyDPII
	gLwu2BZoCBBlxPWpCoppFp6ix
X-Received: by 2002:a05:6a21:4cc5:b0:3c4:3672:ba6 with SMTP id adf61e73a8af0-3c92a7e7e6fmr3392538637.22.1785593648670;
        Sat, 01 Aug 2026 07:14:08 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cc5:b0:3c4:3672:ba6 with SMTP id adf61e73a8af0-3c92a7e7e6fmr3392510637.22.1785593648265;
        Sat, 01 Aug 2026 07:14:08 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm13570696c88.13.2026.08.01.07.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 07:14:07 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 19:43:52 +0530
Subject: [PATCH v2 1/6] dt-bindings: clock: qcom: Add GCC video axi reset
 clocks for Nord
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-nord_videocc_camcc-v2-1-674d7718e41f@oss.qualcomm.com>
References: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
In-Reply-To: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: ghWCoky-MtcAj2NB_rnTTh2QQMWNqawO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDExNCBTYWx0ZWRfX07ZfAdaPK6uz
 VPfTHVj80DkT05tPf6xdrit7P2ZldcuhdJ/UoEa+VA15oV4EUyE8CcqKOePQShOuHU2IokoPfXb
 /c/cMK1WF0iFm7ujV5A7mRVmhpnMTrjem9sRVJldvK+F6IX9bEmlijWhk7n4R6sbZTSlw7FjxBL
 huDeeE0zKOLCknxiqQBIkpylx3u1LxVOCUcdeWhVOarx74sdY8w9ck8G79xg5qmMYs0kkhC5I4c
 ujiYmnIxMgkk6nSsxChFSW0xw85xPYYlpBNixq7DyViBN12p+MrHHYH4nJgIhkPLUbl6XWxNvtQ
 aoWZsEsvQMLXqGra2BM1O5LJWh0IGp7zivPvTze86WaU4P/U1PQ9b2xvDK0wiDxs+uiTpsmAF58
 jlwQ/O7fNiYnt0Y666A0tYPW2q2Ho2kN6FXQOYOi9yGbCyCkDWEE4yJdVUaFSvB1DiC+6g4aYdY
 5u1Z5KccPNgghnAIGkg==
X-Authority-Analysis: v=2.4 cv=TYSmcxQh c=1 sm=1 tr=0 ts=6a6dff31 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=wyNhwcPAjvrcrPB_k8gA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: ghWCoky-MtcAj2NB_rnTTh2QQMWNqawO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDExNCBTYWx0ZWRfX1axAisWXkMq0
 dH7osVVZFxuX2hsaQLemHu8n5pq4IMncPiZdPSKePWsb1zGAtC1EVPpSE9qq2SBaEkDha4NgSe6
 3hzHb+79a5EpJBuNCpuZP1LqheFutwM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010114

The NW_GCC video axi reset clocks are required by the video SW driver
to assert and deassert the clock resets during their power down
sequence. Hence add these clock resets.

Fixes: 06498d59bb4e ("dt-bindings: clock: qcom: Add Nord Global Clock Controller")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,nord-nwgcc.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,nord-nwgcc.h b/include/dt-bindings/clock/qcom,nord-nwgcc.h
index b6253dd2aa85a3152f99447a60a6f8a3e85d8f3c..8beaa129aa814c82470deee4382de5bdf8177892 100644
--- a/include/dt-bindings/clock/qcom,nord-nwgcc.h
+++ b/include/dt-bindings/clock/qcom,nord-nwgcc.h
@@ -65,5 +65,8 @@
 #define NW_GCC_GPU_2_BCR					6
 #define NW_GCC_GPU_BCR						7
 #define NW_GCC_VIDEO_BCR					8
+#define NW_GCC_VIDEO_AXI0_CLK_ARES				9
+#define NW_GCC_VIDEO_AXI0C_CLK_ARES				10
+#define NW_GCC_VIDEO_AXI1_CLK_ARES				11
 
 #endif

-- 
2.34.1

