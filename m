Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DB93C76BE
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 16:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785948521; cv=none; b=RTbCm+vZLPqpANK1kMx6Ba4BuHc38rzKRnEMV2R2XJgNOLS0XZt19QbD71WmYGmTDz4aD4xPcBCnnEhYBKpshpXvRjL8+z120LdB+iqveo0GiaR5+yv/Iqyadj4qD1K1UEuBLoZdEhJhdXqwM5yeoWn1kBQKy1WG8McdV7pHhMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785948521; c=relaxed/simple;
	bh=5LFJ/WzAU679fvIbWxxG7760pWZiholE8FfQ8FqOhqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ce/OGE1KROv5BK8XEx9hXAGwH8Rpd69+ZHlsNI3Wt8fl4+v/V6nsaTjMGXbHV/5+xq39GLyOJVMfvA13q/fWGWU0ZUaWGJklyKjR2h3to2Mn5OxV2E5JcIF5iFQJpxiYEDyQC4IHR5OY+shMEp/2NtlZRkyNVnroM//ofrAS1lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h41UXSPn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DgzWEQkh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h41UXSPn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DgzWEQkh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675FVLt12655672
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Aug 2026 16:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VdhP7B1RyO9P+PSnx2BryT28tlmUerchf5OyzQtnMRM=; b=h41UXSPnm2tl4MrN
	khD63jtepzgzGfxcprPxTfpsEhrCh9JkgO7Fy2wW58u4wlAi8duTFABP1oiB6iEZ
	BS0SKcO7M3a9xn2xyqQqcRZOtgiVDIG3pwP8q//hPZHQIRehLEpfoLlVtcyBWKPH
	WWoBAXsxXV4o5lTYpWxCcMdtD+6Jcxd0UC3oxSn7Zo+L80sTRN8d4+/sq1eVJbXx
	wpHlMwzwb+Ug1H60TroqbtVKWbvgK5Q37nO15O8mn8tVOietHPVqeSEhZN77eSS+
	+0lEvrn3FnkMO3Ho8fe0CMZyJVR8YbKkLcb4nazxYDsIDvqkTeCuiAnquFMyaeS2
	NAf5CA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuwbqudsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 16:48:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cee1ec30f2so14944875ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 09:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785948518; x=1786553318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VdhP7B1RyO9P+PSnx2BryT28tlmUerchf5OyzQtnMRM=;
        b=DgzWEQkhl2LV9LKOFYlAOJmA+Mm+a9qS4FAPVZdNyv3sceHOVALnaAKQQpm6tg5e4G
         toATVfw8yqMrCenQKAqzXLzXvTn+/OrcjenDw9gL6SdbblRV7qrcsmekrUy85vcT6MAF
         wFFniirwotozp4036Er5YqtOJYUf81jS0ep7+PKg8YUbDINS1L6aAYUMx29sjCxk5wlO
         tPtOB+/RQdtxubVjYYQ8yEnpowftzwGI7A3mwJG3zlgz4mpZuC+mCSjDgUsKY5lCKTRe
         FWfO0FmGkGUHXXSY++jReeacNfdEgUcQMS09G2eH9DEVUv2ba5CH3PSWE/C/e64+Ffmt
         COyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785948518; x=1786553318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VdhP7B1RyO9P+PSnx2BryT28tlmUerchf5OyzQtnMRM=;
        b=lfILpZGZWV9ytzEpiSApz9QnvoH3G7pU0ts37d33BgBNEx613lDHgaNmWMgmzLcr60
         NOetdUOGgB7VTmuo45Wg6CEPzr4JECsJ5mKTL4Ql0GnJkp6Z39J60F6qxUAO7GdJFVC4
         uAxw9bE8/moPZqAYimfssiS7CY0CGdYjZ7N7W64pGMhEzY7xzeKWsRQaCICtwzzABMvE
         gN+L645BVxNpc5UwC4RHgYXcHacfltSqgxCKRvQ/mr7wbfpY3q2DLsqgk81c9RnsLCtX
         yxnTKKNxnfEPRktOjpQ8TaWbeJtZgfH0Te7rj3zvSQu+LoHDO77WIrfbosNqcFzfMtl0
         JWmg==
X-Forwarded-Encrypted: i=1; AHgh+RptCNq/jHL+8sO0zP8Ovt+ARCIHU9wzLwrVKwuo5POvIG6mqU71GQ9QmPbAccIQ++w+zFYI21MZfJzXSbeO@vger.kernel.org
X-Gm-Message-State: AOJu0YxdggIqHPgRwmkk/uDzw/6IaUPWUm5rfWygoPNLMeLlF09f8wHP
	iKqohsRlR3QtVSsEKy2gf1/6OYcyz8qI0QOVSjDpl/V8TPuySWf4BrtEgAtMK3V2/oqctHwuNtm
	raLLNkLPj3pIj4dPGURBE0tJLWrcNwDmyCcV/RTjb27VGUd5ilwFwdM+8NSffYdHNG9Ts
X-Gm-Gg: AR+sD11IlbqwMp7AGUfQsHHu+rubMFmXRWxD26O4kV5TVEBS7Gkp6ngpfK77xea3ZEc
	j01c1P7urHLGv2cgXVYsAQ19L9wjK7bAK0x3TpjYutIznpegNRVW4hl4DJIKffcpNcXlB+RRQk1
	9ZFdl9xMVOp6p6QAdlv+tI8wDK91WRr7/G7aMtXvjA9DCaZnzQl+LVOrwGG57PoBdWGv3hCbf52
	mTt/Sr29OrofS9psD59vjP6Fy/XPqO5uzUGva5MK2EY18vAe/jk5q4Cwd1Edcscb9Apn5AL7Y69
	AEdi8QByK9JV3l0NLkL6sud9Y9mmXAkAAk94A9rTNS0HjkJ8X4oaztcFuo1LS49oA62xt7urb6T
	0xHLQYQWSXleFNVgA2qTC/EzsnvxACE8=
X-Received: by 2002:a17:902:f78d:b0:2cf:9344:b80c with SMTP id d9443c01a7336-2d0caa031damr96632475ad.18.1785948518463;
        Wed, 05 Aug 2026 09:48:38 -0700 (PDT)
X-Received: by 2002:a17:902:f78d:b0:2cf:9344:b80c with SMTP id d9443c01a7336-2d0caa031damr96631635ad.18.1785948517832;
        Wed, 05 Aug 2026 09:48:37 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4d986fsm19159465ad.75.2026.08.05.09.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 09:48:37 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 22:17:13 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom,qcs8300-gcc: Add TSCSS clocks
 and resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-qcs8300-tsc-clks-v1-1-e7a5101ed479@oss.qualcomm.com>
References: <20260805-qcs8300-tsc-clks-v1-0-e7a5101ed479@oss.qualcomm.com>
In-Reply-To: <20260805-qcs8300-tsc-clks-v1-0-e7a5101ed479@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: sXsv1jiWtA9bgr-0u2CVckY3cFW6i6Zz
X-Authority-Analysis: v=2.4 cv=B+uJFutM c=1 sm=1 tr=0 ts=6a736967 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=66EydcdwdGgFu5TxQx0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: sXsv1jiWtA9bgr-0u2CVckY3cFW6i6Zz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEzNyBTYWx0ZWRfXzn1KfN+jRAQ2
 dpYGgqrdNNBC9hDUDR+GtZLyVH9lNPJgT2YyT/wAncGVh5wevIc/E39jKEgnpeevaMzjHjGG8QI
 KGelFw/d3Mu89aS0onFGCP+kx73tR9o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEzNyBTYWx0ZWRfX/rsrlh0+oLd9
 nPthFTHxOhyu4rW/YeG2uNyCMZdIdzEXXGUoNnIgpsHIvAPBzqtMPEfcHysT+6QkmmYsPSNGAjf
 PjejxexYSAVk67P1TJYLb2MlhLyyizuMlUM6lFOLNNIar8MstpdZ1deLXUOEzlVEkPBoqWV+vF9
 AxDxo1+lp9K9FjCEI6K1W7Px755awBfHl7+IyORMXC5jgg/HmJBSlLH2j+NVH3CiB9ASWIV53P+
 MWHZ9Ek9RNZ+4MwF6MqGDxZJxMMrveambIl9ycvoA0fuUmZ3bQwlbjTMLJZ/9BEuaPHcLZjbpci
 4s2ik55v53as+xEqDKgUNqzL0OkomgU/fjDEi5taDIbBo3r8GdaL1oCP/1K6qAAAMZiXZfIWDYN
 K9vnyh6sw36XdC9KklNccfQ04jrK9NB2m2CUNnoTFF7qVWbHvvFgy1Tev+hSMaOCPWbF1ig8Rqz
 QsMzawbroOCg0t+qDQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050137

Add the missing GCC TSCSS clocks and reset IDs that are required for the
Timestamp Counter Subsystem (TSCSS) functionality on Qualcomm QCS8300 SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,qcs8300-gcc.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,qcs8300-gcc.h b/include/dt-bindings/clock/qcom,qcs8300-gcc.h
index a0083b1d212692825251d6a49e15b9129c1eb1b0..3c674c7baaba91815b13450e647b41053bd7330d 100644
--- a/include/dt-bindings/clock/qcom,qcs8300-gcc.h
+++ b/include/dt-bindings/clock/qcom,qcs8300-gcc.h
@@ -191,6 +191,11 @@
 #define GCC_VIDEO_AXI0_CLK					181
 #define GCC_VIDEO_AXI1_CLK					182
 #define GCC_VIDEO_XO_CLK					183
+#define GCC_GPLL5						184
+#define GCC_TSCSS_AHB_CLK					185
+#define GCC_TSCSS_CNTR_CLK_SRC					186
+#define GCC_TSCSS_ETU_CLK					187
+#define GCC_TSCSS_GLOBAL_CNTR_CLK				188
 
 /* GCC power domains */
 #define GCC_EMAC0_GDSC						0
@@ -230,5 +235,6 @@
 #define GCC_VIDEO_BCR						26
 #define GCC_VIDEO_AXI0_CLK_ARES					27
 #define GCC_VIDEO_AXI1_CLK_ARES					28
+#define GCC_TSCSS_BCR						29
 
 #endif

-- 
2.34.1

