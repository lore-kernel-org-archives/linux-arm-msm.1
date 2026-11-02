Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621467;
	b=LdyYsPvvC/j4U3Xq0wYXdXi+u//xUBIun8gKAvi1xRRMpWoxU+Bt1V6Lun7uZbw0OO+R
	 /L86zXwObA4I7AyNj7O9TspCREzK2yTBSNyc0aqk8acqCaBRaoIhY+Ktd2yQzJCN1vvgn
	 0+QPewIxsFz77c48PJOP48K+QMVNtEhPwBZDEnUXAN/hO5BzjDd4ORldjsKD4MDC7MxEa
	 fIysjGXaOyLiZcp8eimM03NIiU+UIlYkK4HrxAXzsmaLD58o8pjiDnCGEf9D4kjJB8zdK
	 exsgg6pLHc6Lbuv7dJld4gI9YUOIT9FYdT1v5x5dZZkHnO3azDSrL7lXBlRIZYyJiEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621467;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=J3/hZ+aQt6/4TqWRyRqscOyRiPQOnfwCCtusSAbWeXQ=;
	b=eMxkxgZRHeH7mBY+EijZE8eIBOMH/IH3hHPQ1J8n1I0USGyyG18O2CpTAXwldWro+G0Q
	 mRYP6I4bdfGO5zK0ApnDUkNI4ns2t2KE2qGBczfQEpM/Qy7b3Gd5iIloy8VCzdgenDIIX
	 hWuNwgQp6wxnNtJDNWjfypmo0oDzZO2ejbV2Uqo2s7CIukJwdURgssN1bQrnWFo4TgxqC
	 7hYULemEXWin+L9t7N1dVhF8z6eOW/H4BNjTf3FFeuizC9+D7OOr05oIx+6PEB3JTSWmc
	 uxazy+8lZL1nR01zbHOxV8wltNPzzwTwTjVTRqS/GLKJedQwWhr+3bWfHc02cy+gfyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pFaaotrC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TCtAri8G;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6428660A380F
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 12:11:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6428660A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pFaaotrC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TCtAri8G
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A9FD4039352
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 12:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J3/hZ+aQt6/4TqWRyRqscOyRiPQOnfwCCtusSAbWeXQ=; b=pFaaotrCb9JYp32O
	x3X5urS6mI5MRnryk62kyZ3aGhdh0e3BWmnEPIhdqj9s7plKv5XFQacA5yq8oZYB
	8xYB5mCqM0BKL+VgWDooeDxPOjKWPZEb0L63JWGKVhiITpwMXT5UwqHR0QF7JlPY
	qkgYLIfSE0Ry0vwfpkNWQw3a7jnRKfcmJjq7l+px/juZQzg29fBm8nTv2eKmJmNz
	+C4wrvnoEnKO/KqatE++OL1NudpN10/0yAx+JfpELBODltm8pWSAZLBQ1NRqiIg9
	I4w1Wj908wFb8dZDNMLVwYxeUvM5RvVfyTgpmNdReTNZ7/ngvMweFkTmdBKlzH58
	6EN5IA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph19219-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 12:11:06 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc175cb172so2596880137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 04:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793621466; x=1794226266; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3/hZ+aQt6/4TqWRyRqscOyRiPQOnfwCCtusSAbWeXQ=;
        b=TCtAri8G6Q7L4GcZBndptPEq+jWtf0hMQTwKX5jfwq0HV5HnY7u7sm7kKHpue2Wt01
         3n5RT/pO2hkhNcf7IbMq/wGW6E+JMdka8+oPN+oU+2zvqH2KyiHpAZdiK3U3k1E0F9X3
         ysf1kkQ3n3Pf25ybxXwPB1DYQMYGofOq+RNLxTYZT1S/xyZdakC4HvGPsiUHscQe41SU
         EEzEda4hrovVETF1aBRdeavHUk3ghGb+IO/NrPZiMQkaOkV/WA/Odc2jcpq1RsWkyrjb
         dOG1FOxarbJHrrq3tTXc7Q0pZRnqebqPph+4N6DmZg+6p9PE7MUl79QjSprP9Y/UAX3u
         05kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621466; x=1794226266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J3/hZ+aQt6/4TqWRyRqscOyRiPQOnfwCCtusSAbWeXQ=;
        b=2YkYOQuR52VNOLCUvZP/GG20lv86tMKrrWqqYVjYHO5bXiS5HJm0r/k/pIboQc/VYz
         XT8zxmfe+VhHU+OluNA9+wG3VQCCFNyzJFkKvvEPfpNKmUYt926DvKF/Z+n9DCuCo5B1
         LFDlyaL3i9rEi4LjAO+t5LcvR/6eGDj8y9n50yeTmndYBuu0HvDsZ82Fvf1vXWIqwriG
         WDLb+k2Y30rG5Q3IdiEr0+m0LJDhUzdhM25++8NxSM07i131y4lw2ykycA7rg9VIbE+o
         FZl7UC6Hf0FGcGd/oa0Xr3oCt6gAnjjbf5GoxfGpBh9Q2ErjhU5+bh1taJIItdlZ1Q89
         9B5A==
X-Gm-Message-State: APuU4Z83ZNNDOuVrBD/hLRA2WuDGVSlhQGd6iZT8Opqeo+G4veoLjAxd
	3+Sd93I1+jarq1mTpmOpS9AfLkeHQTrAiNP5D5sRL+N220qykcNuW5GzjfRV8NEAtInGx9aaHLM
	1A9BM7MwgTKVB57ZWvb3ywqocVcE2Dd5Ds/JzzdhlffsO5v645A+R3QlPxkPDS9S4OIT6
X-Gm-Gg: AYBFou1GGlFlyd/kzHAK9KFf0V91O3iVDj4xJoroddfbZKMUxZWtsUcRVmuupJ+ox+F
	6Xn3Et3FBR20eK/k6A+mRfdVIQAtLgRPfdChFtGAhETXNs9OVAlrUDd4iN10Pu5IdmnTJgBW40R
	5OYkpvonolaqta+Iv4D5gaOpwjwQPFhyH9om0hLNhDGyLkM/+5p2qgYeAxLyURlm7MJtUGp/Lub
	AtLsoLXHun0ii+MxUv8yx8dKNjeVKscyJBaJ88DNyxYTt/1VoCFIhspEMbdCY9XZri5yozKO5if
	LX5z8X77J7qUdZziCwaQ4heRTrZiGplz5cVxhDvXoiNSkj+A+NnBcPP2JSE5unHa9gwdUgIyZEv
	3YhLwe7s54O9qJ6UnxADHm9OAnL5n3VfiQR8/WtyLmpiV5/2e9kVTIThGGg==
X-Received: by 2002:a05:6102:6b0b:b0:7cc:1274:aba3 with SMTP id ada2fe7eead31-7d0726cacc9mr4313374137.22.1793621465428;
        Mon, 02 Nov 2026 04:11:05 -0800 (PST)
X-Received: by 2002:a05:6102:6b0b:b0:7cc:1274:aba3 with SMTP id ada2fe7eead31-7d0726cacc9mr4313354137.22.1793621464663;
        Mon, 02 Nov 2026 04:11:04 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b81c74sm19304405f8f.36.2026.11.02.04.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:11:03 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:10:48 +0200
Subject: [PATCH v4 2/4] arm64: dts: qcom: eliza-cqs-evk: Move sound card
 support to Eliza EVK generic
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
Message-Id: <20261102-dts-qcom-eliza-add-ufs-variant-v4-2-c92512c7c759@oss.qualcomm.com>
References: <20261102-dts-qcom-eliza-add-ufs-variant-v4-0-c92512c7c759@oss.qualcomm.com>
In-Reply-To: <20261102-dts-qcom-eliza-add-ufs-variant-v4-0-c92512c7c759@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9216;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=bw3lRk27DYHr1IzAGaOF70J1YE4CAQr6Ctzh6DIASCw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6H3QMe81gFRKWbP0l7Du2RptXPNwQzSBpFZyq
 1UW8MHkkoWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauh90AAKCRAbX0TJAJUV
 VrwxEAC3ytFvNuLfUcTun6fJnZ/1Tb8nLADyQxlB1EIDnWcYMKTe89XJJSzImtuu29xtGXgn/F8
 ouw+qkmhTzJklCWKPE1WxbtsmSLLgusrAno22QalQ9LrSNr7qB0eZCamH7tG6HSDKCBqTMEFIdn
 pf1jXQ5x0mJKccUklh9BickyHaIwa6gIZH0Y8NTvHTJwMq2lOeF/ICNKF/31tLDk3jdZDzAublA
 BcFiYJUWx408l108QszeFsanNDAieAX1DAb4hSbgib2vc1fKbwA3rnD6uWSqoshuRASv2EkE81S
 6TNJ8wwz6L5cg8RUcgFnKzXh5RcRf5f+aKHgj4kPBcKzlq75tssoA6lKq1bBQRyDD0ei9OAADE+
 bgNhIHT8UOyZ94XJDzIQnVKVAJS1lgm+CmeLQTacs5s+Ey4T7En3fvhnJVz2/0KnP4QsmRayvLr
 FHuYKCAB5REyV4YUXsa3XfWGKQErWQjKOaSCc5XXpqzLahJmvJXOlH77oRfd6IBo94QuF4Zu5bx
 ttXeklKQc9UrjaiGbfL2VH5QzWeClRYogY4iqx8EFRHeYaWUGyGfJXvDHYYdtXzOjXJbeD5zYhB
 A1sSH3r80zlR3j7BC9wpkXLbX5DLqywUZqxoBVssMZg3E3C5lGD0CCtLvJSpB944QgKgLs0FOEe
 yPOq6qUb6RTSNlw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: 2wgCjDIiXfBDT90SPmc1nNm_GKh9A0HS
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae87dda cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=igo63PMTUtHa8Wayq9QA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: 2wgCjDIiXfBDT90SPmc1nNm_GKh9A0HS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfX+FEgEBVIK5Zh
 fjUzSjbiQmSAzXL+7968/IkyfIkqL4K143J6X58VAJsmT6d6tV6B5npmTJs/3wnH7fFWp+pXMq/
 eSlsnXJax4PDYBWkMEOkY87PStGAu+8QPCM5RBiwQY9/2/yzavl8fJqMqjTT3MEBMEYQ+7MKQCE
 z/blsPo/5JdBQva09O4AdhKfWM7RztpRYS4MZrOa4FnvINB59Z0uieFluA0thbaqkNfWN8FM6Zk
 5nVKf0Z66ei6TJ8hxnl0EXRnuAA2SQvWI7+IpL2HRefaeInWm/SFdXaQSJA/4Dzo3nWBmkFeyo9
 0Hlw80k5kYG7z+WzGfzms9fgCkirabm8o8yKZY+1Z8bgaQXpK9I+dzcf+qhozlQ1tsXQ2xZH2pr
 BgaIICASt24HyHgfLd7K0Hg1ZgrGQTrKhutv6aWbhfTvNVXASAFFLyrc0ukoF/1LVbiTkBfqxj9
 RwoFZsBovBT/dQqzjVw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfXw0AQ1kz2SOHk
 S7m7NhXSMBjBtWzsKQlWVB+HTc+F7YTiB3pzeX+tHCWe/PCwSnHgUex90n1+ebdrdi8F/PnCpgf
 eGtBcjyp8IXRJRdNPnlnr8zRZGNSpU0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020048

The sound card support is the same across all variants of the Eliza
EVK. That means we can reuse it even for Eliza CQM EVK later.

So move the sound related nodes from Eliza CQS EVK to Eliza EVK generic
implementation.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 141 -----------------------------
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi    | 139 ++++++++++++++++++++++++++++
 2 files changed, 139 insertions(+), 141 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
index 5e4175291f05..43d428a4ed2d 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
@@ -5,151 +5,10 @@
 
 /dts-v1/;
 
-#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
-
 #include "eliza-cqs-som.dtsi"
 #include "eliza-evk.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
 	compatible = "qcom,eliza-cqs-evk", "qcom,eliza-cqs-som", "qcom,eliza";
-
-	sound {
-		compatible = "qcom,eliza-sndcard", "qcom,sm8450-sndcard";
-		model = "eliza-cqs-evk";
-
-		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
-				"SpkrRight IN", "WSA_SPK2 OUT",
-				"VA DMIC0", "vdd-micb",
-				"VA DMIC1", "vdd-micb",
-				"VA DMIC2", "vdd-micb",
-				"VA DMIC3", "vdd-micb",
-				"VA DMIC4", "vdd-micb",
-				"VA DMIC5", "vdd-micb",
-				"VA DMIC6", "vdd-micb",
-				"VA DMIC7", "vdd-micb";
-
-		va-dai-link {
-			link-name = "VA Capture";
-
-			codec {
-				sound-dai = <&lpass_vamacro 0>;
-			};
-
-			cpu {
-				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
-			};
-
-			platform {
-				sound-dai = <&q6apm>;
-			};
-		};
-
-		wsa-dai-link {
-			link-name = "WSA Playback";
-
-			codec {
-				sound-dai = <&left_spkr>, <&right_spkr>,
-					    <&swr0 0>, <&lpass_wsamacro 0>;
-			};
-
-			cpu {
-				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
-			};
-
-			platform {
-				sound-dai = <&q6apm>;
-			};
-		};
-	};
-
-	dmic_eldo: regulator-dmic-eldo {
-		compatible = "regulator-fixed";
-		regulator-name = "dmic-eldo";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		gpio = <&pm7550_gpios 8 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		vin-supply = <&vreg_bob>;
-	};
-};
-
-&lpass_vamacro {
-	pinctrl-0 = <&dmic01_default>, <&dmic23_default>,
-		    <&dmic45_default>, <&dmic67_default>;
-	pinctrl-names = "default";
-
-	vdd-micb-supply = <&dmic_eldo>;
-	qcom,dmic-sample-rate = <4800000>;
-};
-
-&swr0 {
-	pinctrl-0 = <&wsa_swr_active>;
-	pinctrl-names = "default";
-
-	status = "okay";
-
-	/* WSA8845, Speaker Left */
-	left_spkr: speaker@0,0 {
-		compatible = "sdw20217020400";
-		reg = <0 0>;
-		pinctrl-0 = <&spkr_1_sd_n_active>;
-		pinctrl-names = "default";
-		powerdown-gpios = <&tlmm 59 GPIO_ACTIVE_LOW>;
-		vdd-1p8-supply = <&vreg_l7b>;
-		vdd-io-supply = <&vreg_l7b>;
-
-		#sound-dai-cells = <0>;
-		sound-name-prefix = "SpkrLeft";
-
-		/*
-		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 1  (SPKR_L)
-		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 2  (SPKR_L_COMP)
-		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 3  (SPKR_L_BOOST)
-		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7  (PBR)
-		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 10 (SPKR_L_VI)
-		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
-		 */
-		qcom,port-mapping = <1 2 3 7 10 13>;
-	};
-
-	/* WSA8845, Speaker Right */
-	right_spkr: speaker@0,1 {
-		compatible = "sdw20217020400";
-		reg = <0 1>;
-		pinctrl-0 = <&spkr_2_sd_n_active>;
-		pinctrl-names = "default";
-		powerdown-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
-		vdd-1p8-supply = <&vreg_l7b>;
-		vdd-io-supply = <&vreg_l7b>;
-
-		#sound-dai-cells = <0>;
-		sound-name-prefix = "SpkrRight";
-
-		/*
-		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 4  (SPKR_R)
-		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 5  (SPKR_R_COMP)
-		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 6  (SPKR_R_BOOST)
-		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7  (PBR)
-		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 11 (SPKR_R_VI)
-		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
-		 */
-		qcom,port-mapping = <4 5 6 7 11 13>;
-	};
-};
-
-&tlmm {
-	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
-		pins = "gpio59";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
-
-	spkr_2_sd_n_active: spkr-2-sd-n-active-state {
-		pins = "gpio79";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
 };
diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index 6c5cc47a183e..726fd8dd6c0d 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -3,6 +3,8 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
 / {
 	aliases {
 		serial0 = &uart13;
@@ -63,6 +65,55 @@ pmic_glink_ss_in: endpoint {
 		};
 	};
 
+	sound {
+		compatible = "qcom,eliza-sndcard", "qcom,sm8450-sndcard";
+		model = "eliza-cqs-evk";
+
+		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
+				"SpkrRight IN", "WSA_SPK2 OUT",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb",
+				"VA DMIC4", "vdd-micb",
+				"VA DMIC5", "vdd-micb",
+				"VA DMIC6", "vdd-micb",
+				"VA DMIC7", "vdd-micb";
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			codec {
+				sound-dai = <&left_spkr>, <&right_spkr>,
+					    <&swr0 0>, <&lpass_wsamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
 	vreg_0p9: regulator-0v9 {
 		compatible = "regulator-fixed";
 		regulator-name = "VREG_0P9";
@@ -94,6 +145,16 @@ vreg_pcie_m_3p3: regulator-3p3 {
 		enable-active-high;
 	};
 
+	dmic_eldo: regulator-dmic-eldo {
+		compatible = "regulator-fixed";
+		regulator-name = "dmic-eldo";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&pm7550_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vreg_bob>;
+	};
+
 	connector-0 {
 		compatible = "pcie-m2-e-connector";
 		vpcie3v3-supply = <&vreg_pcie_m_3p3>;
@@ -148,6 +209,15 @@ gpio_expander1: gpio@3c {
 	};
 };
 
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>,
+		    <&dmic45_default>, <&dmic67_default>;
+	pinctrl-names = "default";
+
+	vdd-micb-supply = <&dmic_eldo>;
+	qcom,dmic-sample-rate = <4800000>;
+};
+
 &pcie0 {
 	status = "okay";
 };
@@ -197,12 +267,81 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&swr0 {
+	pinctrl-0 = <&wsa_swr_active>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	/* WSA8845, Speaker Left */
+	left_spkr: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		pinctrl-0 = <&spkr_1_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&tlmm 59 GPIO_ACTIVE_LOW>;
+		vdd-1p8-supply = <&vreg_l7b>;
+		vdd-io-supply = <&vreg_l7b>;
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 1  (SPKR_L)
+		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 2  (SPKR_L_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 3  (SPKR_L_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7  (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 10 (SPKR_L_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <1 2 3 7 10 13>;
+	};
+
+	/* WSA8845, Speaker Right */
+	right_spkr: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		pinctrl-0 = <&spkr_2_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
+		vdd-1p8-supply = <&vreg_l7b>;
+		vdd-io-supply = <&vreg_l7b>;
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 4  (SPKR_R)
+		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 5  (SPKR_R_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 6  (SPKR_R_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7  (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 11 (SPKR_R_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <4 5 6 7 11 13>;
+	};
+};
+
 &tlmm {
 	sd_cd: sd-cd-state {
 		pins = "gpio58";
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
+		pins = "gpio59";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	spkr_2_sd_n_active: spkr-2-sd-n-active-state {
+		pins = "gpio79";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
 };
 
 &pcie1 {

-- 
2.54.0

