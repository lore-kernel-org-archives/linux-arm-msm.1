Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527030;
	b=V/l+jZUT1N/rKhcfpPStxAOyjRrBVYAqs9NLy2gKufPTa+4vGTMB0lGhuR+zmAVLkYMT
	 Cf8fUATSh1St/Wm8c5rWzKQPDZ5L5FPO6993eu5Bo9nF6Dr7CiBqljCzlmt6QdN1qVIQr
	 1l/YN7tvwx3LqSHUaaBcStdommcSIAQZANFM8sNPht0nvb0aIdJpFIWysdUvczy+MOiFy
	 p8WBw+oo0hCvBMsJ/JB5TAMo/7/dq7Mq2WZ+gSlHNj7fSs2VSRWpAYD+Ek8/b+2m1m/EB
	 6VbKFtQPtyIWMCD7ZvpM9iGQ8AmWVgEIVfGIcVbBBRmlZdNe/xKak6miNsWLpgOD/Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527030;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kSz60ixsAltKUoHcGmsZcg9w8jYAlOU9XrNtf1Gkbcg=;
	b=vpm1434waaxLWDtCBblAJ5k2quEeo2yUzbs8zBv3h/OTbOddBTHzyZLbImE3GYpCG6tf
	 cpW0+7D1cebmYBtIArpPEmZISOMuZi5x0lnpbrbPFp8NbbadJuWLI06ZGF/BXOXUgVtpT
	 pvdJnhTR5RfgQEO/M5yP6ao9KydEnAtIWpDaDO0jScmSxreh0VTHG1iD1SpA2iL0W1kJu
	 +pAfOAxkkxKEdANUyoXAAzxJSJdFLmwJntnjEqedvDLpQn2a9ubU+tNO86JUnvHE7PQjK
	 pDqlom7bKuPSSIGitTTNN5MsI5p6MMCe4qFmLVPgFOHhyjI3D1g1N1SOSZxhEkGfT1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Es++B80a;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dpSpjJOe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01796606A32A
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 13:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01796606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Es++B80a;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dpSpjJOe
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuV41120314
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 13:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kSz60ixsAltKUoHcGmsZcg9w8jYAlOU9XrNtf1Gkbcg=; b=Es++B80agng9b4xK
	ONkCQxh9pzsx+/pQab8RJwmpKobkSUCgzn1sIKMLspxYqdeT3xQMAsqSj3Ka/BWx
	JOXvxtkCPF63QvyuOTVGhvHWzAgqVK2MX2xak8Zq2VCw6P3N13AoBi0eDVsdGpyz
	mCI6QVNHPKpCzCuk9e0HhY4Y8hwzmLC9JKR+xJL3z1Oz1kWAGevHTT/rJO48fMs1
	9GTxrn+pHirk/9szYcloPhmWwKIxQtL8ihT0GNV8zMr+zlZ7M34bPnzxXwFlDOU7
	3unv2BsoGKxBhB81xpzOwC03sxkbAIbtkk33dk0hKsQeg0N5Y9UGAWpedK/YF/cz
	zK/QUg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4x8f39us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 13:30:29 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b507e3df87so14397917b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 05:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795527028; x=1796131828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kSz60ixsAltKUoHcGmsZcg9w8jYAlOU9XrNtf1Gkbcg=;
        b=dpSpjJOey0Z+wQUUVdfGa/Vyqhj9YxfodK83Dh/xqFTi+f7Q5IYufwM/fBHLA5rgAU
         JDb6cGWVJuE81OYyunvOYH1CrjcAJgpTALRmpNDfgl1DmVSR41WEikS6EqF2tP16o9Vt
         T07ha9xSc8HHWqZrXYhCZRKDrEwQCRVqjbVGxb1nASXov5ag2re9ax+MxwqOOddI2x6E
         SB+X7wRT1rq+HJCT05T5WTH1X6N/rDCHLosWqQIShgWf4h2vPy1QOQLOwM6aKEVG7xHF
         VYB7rRSKRVQ2dR5LbB92QjQ0c5RehrxCkBG4WXzVJkbzOpNEzSawXxIy4Fa5XMruCrTq
         tLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527028; x=1796131828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kSz60ixsAltKUoHcGmsZcg9w8jYAlOU9XrNtf1Gkbcg=;
        b=xf65zByHkuJqU/HgWw9mHcEgh0gnxKx8v3XZnJnTSJeX2BGQzejJKieelPN5GfyEou
         nCa1uNwcbZjWz6JUF5vUw/6YztqlH19oEjh2I+f+yzWtCj68Y2rDblebK4l8MYOUBFfB
         2aK9AbDfH/KhSRNar5LGd+7Uf16zVoM8XLw1Q/kdzkhZIEeTCCbaEcStuiQI9b6w9taz
         hkgr67tG3Tz3LPjK7tEMcpAlAEKznnnxM+IYyuoToTYeMaHFRIazVMyyNr8dMy7DydZX
         vJc9dvPtUUQiqLNDUy1B0GDy/Cl2b3NGT9TxdbM0J3Qq0fJnMa65UNCg4xoHqXpoKHWi
         Ll7Q==
X-Gm-Message-State: APuU4Z/UZF28qzHHtM7vwW084DofDYfK6glZpGN1cRZmVczb4nsROX4C
	XlGypPIaZaAtzaOJVkrmu7Fk2flYraZ9gB2M3KOfh0ZLFv8xh82LoxJfhQ9DuBCllF9RFGelf7Z
	6nD8KYTj0pfGI2cOM2eR5qtkQCazCf1337a8j76gLEGiI5QRGnOKEmWQzRFiqpuHvLPMu
X-Gm-Gg: AZFdTZce4OmtZFrhxefX/vUyl7na3WmRXlIxCUuTQHnYj7ON7QNtgszfh/xlZRfS7lG
	GWpQSsAbP3vwqMjnTWkhKW2cVs0uhQO3OQNxQeZcRfTMBjGds4oW6T49EekvjZO1ACjzfmJHnBk
	gP36SnGV8Nr7pBAxpxfAEz6HkVWlz5zDuBP8H1vjXDrG5C8irQjfdyNEmxri/nRpDxizVkO45QA
	prFsNoyN8uPi1ZewHBCfRKu6in25sVQ71YB8UbONfTkPdhfSjFpBTQANHOndgLHvj++Ybnv0f0x
	1mW1YPx+UgbHtlVkYhMo5GlNCwQYDCufXQk6EWSIBojnqe8lO63GQrQTw5v3DM5Pa4db0zU4wE3
	bV1KS6hE4B2LYJRaeE9ucIhIRenXOOGW6z726/u7T0+Bq1jPWjVVoFx3ckvfnsFSrGxHuyPcyeh
	3z+MxHyFs=
X-Received: by 2002:a05:690c:a0cb:b0:8b5:136f:220d with SMTP id 00721157ae682-8b52045f53dmr79114847b3.3.1795527028107;
        Tue, 24 Nov 2026 05:30:28 -0800 (PST)
X-Received: by 2002:a05:690c:a0cb:b0:8b5:136f:220d with SMTP id 00721157ae682-8b52045f53dmr79114357b3.3.1795527026873;
        Tue, 24 Nov 2026 05:30:26 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:a546:3db2:3be0:87d9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b1ed8b6a05sm11659080f8f.43.2026.11.24.05.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:30:25 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 14:30:16 +0100
Subject: [PATCH 1/3] dt-bindings: clock: qcom,gcc-sc8280xp: Add USB4 MISC
 resets
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
Message-Id: <20261124-topic-8280_usb4_clks-v1-1-be083a711eb4@oss.qualcomm.com>
References: <20261124-topic-8280_usb4_clks-v1-0-be083a711eb4@oss.qualcomm.com>
In-Reply-To: <20261124-topic-8280_usb4_clks-v1-0-be083a711eb4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795527022; l=1650;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=3V1LwUrzFtkyX8gsvhaGuSuz2iOQm/r4ACIfiK+B1oY=;
 b=NX4lpesLNZvAs+Xf+UDl22Mo5N4iMOBqSM8KmDwtc+vwj2rxivqoMW9H1PGp4Wazl0+hH4Y5N
 cu2kme1L4iWBr1TNvuDcKZjJKHNqn4t70iuWHdKILWG+VCpSI5c7YCF
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1MiBTYWx0ZWRfX9Vn6oS5hR3em
 M0n/RJkFw4UvRqXJ2vzT1VXTZFI7+5zY11oS+KzyFlJoVwSyOtdVKPoTT+fwl5NHItgQ4g1h+wY
 crqv9asHbUc3LDDpy/UKczyGZnhka6s=
X-Authority-Analysis: v=2.4 cv=JbgpPkKV c=1 sm=1 tr=0 ts=6b059175 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=EQwe2IC4Xa6s3jYMUEgA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: pHWolqqYZuMCFhJb_DVyuFFvgS2lAdCv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1MiBTYWx0ZWRfX58yAQ/ax2QTh
 MkKm0/wOfpbgf1PFM3tdyY9Wnhp1TylfGn/NDkQBiuLmeI5Z5qLwqUfExvrI5zwuyaBoXUiDYPy
 OSHd2ArkqZvH1+3aCvmlr+dpSKPVjRouGlIi7+r/Sl+eHrW0nuliHptbr+uZAXrXiM5qJWge8mu
 Lv99itwEMXyNgHar++d4QgO9/t/ee3oD/4ANfoSVfdg57Uwu8notT3aq1ElgN6dt/TGlMWamXfb
 2mwdUX3XPzc/EVPEudGADWhTY/+q3N08ABbelfUxNm/a1rvIbopSJlkyRsWed7QiSv3/HT8ShoE
 COr02lvCvRgT+5MhLfgJI9HVl33WHTCB83E6LJZYzXiFGPEG2JwUTvLVeK1KI1BZFoAXODJtdYp
 T9gO6L/aPuzM2JQaM0PqO51zgqf6scML2m4kJ5YTmiq+tWK8kS8WhsaS659M8xacd7ckPikOhsg
 LU8giVbcrTDKzGaQZhQ==
X-Proofpoint-ORIG-GUID: pHWolqqYZuMCFhJb_DVyuFFvgS2lAdCv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240052

Some of the USB4 resets were not initially described.
Add indices for them to allow extending the driver.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,gcc-sc8280xp.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-sc8280xp.h b/include/dt-bindings/clock/qcom,gcc-sc8280xp.h
index 8454915917849da3498e4f2fcb551d2730b62f42..649c4d841f3c41b6f9dfbceab3ff74b27fd77485 100644
--- a/include/dt-bindings/clock/qcom,gcc-sc8280xp.h
+++ b/include/dt-bindings/clock/qcom,gcc-sc8280xp.h
@@ -478,6 +478,26 @@
 #define GCC_VIDEO_BCR					76
 #define GCC_VIDEO_AXI0_CLK_ARES				77
 #define GCC_VIDEO_AXI1_CLK_ARES				78
+#define GCC_USB4_MISC_USB4_SYS_BCR			79
+#define GCC_USB4_MISC_RX_CLK_0_BCR			80
+#define GCC_USB4_MISC_RX_CLK_1_BCR			81
+#define GCC_USB4_MISC_USB_PIPE_BCR			82
+#define GCC_USB4_MISC_PCIE_PIPE_BCR			83
+#define GCC_USB4_MISC_TMU_BCR				84
+#define GCC_USB4_MISC_SB_IF_BCR				85
+#define GCC_USB4_MISC_HIA_MSTR_BCR			86
+#define GCC_USB4_MISC_AHB_BCR				87
+#define GCC_USB4_MISC_DP_MAX_PCLK_BCR			88
+#define GCC_USB4_1_MISC_USB4_SYS_BCR			89
+#define GCC_USB4_1_MISC_RX_CLK_0_BCR			90
+#define GCC_USB4_1_MISC_RX_CLK_1_BCR			91
+#define GCC_USB4_1_MISC_USB_PIPE_BCR			92
+#define GCC_USB4_1_MISC_PCIE_PIPE_BCR			93
+#define GCC_USB4_1_MISC_TMU_BCR				94
+#define GCC_USB4_1_MISC_SB_IF_BCR			95
+#define GCC_USB4_1_MISC_HIA_MSTR_BCR			96
+#define GCC_USB4_1_MISC_AHB_BCR				97
+#define GCC_USB4_1_MISC_DP_MAX_PCLK_BCR			98
 
 /* GCC GDSCs */
 #define PCIE_0_TUNNEL_GDSC				0

-- 
2.55.0

