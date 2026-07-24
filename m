Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D0D3ED3B3
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887310; cv=none; b=qxRgfrwYXK/UUcCPx6q4HY+y3i5nZA6BJneSYXI/JXlUur2lDj7Xq1xQC0E82UMCiytF2wHfUa9BuYSC3FRzEHttf5P0OZOjE/HYB+PE9FCp8b8h+4joGC724dLtFYC8zuWYVnRO1iSU2+Ggq7lH6c1P243vn1wjvB9GtVjEaI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887310; c=relaxed/simple;
	bh=hNJNcXrNH9t/WVgtwP4qKBm+72KdIBYy832AI6C7B9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gm8lhKxY5kVV/MBWWKXCML4rDQZIfYyJVDfepec/z4BIRccS/sWGDfGfbGjt27roArAhQ7GCG5ghqjeNg3jc8/CloSRRWArpMRjiuXhkdpkZz/bvtDvcqtsT0XzKrNDErWMrSQ/xp0wxD8us4IF72gLb05/+CEoDs5xx8tN8WKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lM8/GR/x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c7TB5pgx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lM8/GR/x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c7TB5pgx"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lJlN1869101
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1xzZ4TYv3eyDh/q626F6lbXEnoEWyDq/x87h4i2WaNM=; b=lM8/GR/xLRlV1WoJ
	F3lDG6tE7Z5cdGNVWElmBsQ7ZIOZRWilEhn3tAZpPt4/d4h5mlLsdVAIjarNUQEk
	1c4GUrZFCwisxJ48L6uHAJUxF4J6Sn2kPtmJ0o+0P0PqP3hGHLzecAjtadPQBhjH
	gBqPgqQGT2yZg5wjr4UEZuo0S2OYOactMqXXY2UQp3i9pfbMNnnbS3q54VYrrITb
	AIPgj8e8x91PxKp36BMQduYO8J2BkJ9O4zj+x2Yc0QnnF3rxrexUUuPJAp2d0X68
	IYGZ8w0AAYSdmE0x8CSAFI6xOhg6tHx1PF2+4M5HkF6MRxAB6jrSeNkNNkTGNFL2
	2LBBBA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0pw97r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:01:47 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so424427a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 03:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784887306; x=1785492106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1xzZ4TYv3eyDh/q626F6lbXEnoEWyDq/x87h4i2WaNM=;
        b=c7TB5pgx6sH24PWBBCmzaV0dXi54qTxALJBQkWleFW6L6pPq/pOc8xLLMUbjvpImE6
         EBEVYRDTICntVuv17uojshkmDj+XTs1AmG3+fOkROjhPONXi8wk8imLNtQ5fTJLpGPUw
         2vqT/4LN0K9taiC241J1HY9s9iZsaoer4+PPhcV2VrY6AackkkPV7Lvx43GpYUrvQfd0
         YxRHivnUiR4PqhpvwENFmdiH0s8pQFqV2SvuVic8YLWyy2uMBlKYwWtccaCabd3SUb7r
         umlPfNl5p9aEAdp9gfIB7LSsftbMr4Is2nXfrJM+T+dVIxzEdUgsCZnTYk9Qb+gZjI8v
         mL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784887306; x=1785492106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1xzZ4TYv3eyDh/q626F6lbXEnoEWyDq/x87h4i2WaNM=;
        b=pGo5qARN0ZuycjJ8aarmCXUIWm0+z2ORpS/V+qDt2FOIxCNB8v5trc8+276MLL0qGe
         sucfiVaVH01A0qKMp76Wh5XCDJ43yZ85BnAGEv3rJRhyxQHCx8HfRCqB+dtzOh69h3Bs
         Lu1F/+KTSh0JY7Yc1/KLxUkQg007JlXlzJUvgfV4Yolvaz9lCxdXfNx7hGVx1D+Piwjt
         OS5vmsjDkW9qavOrJFimuQZid55/f4zdhHFM5qp3pcwrWp+euky1+sPgfv1rwq/jGx6o
         oAXw6CXf3AiFP4HAW5Z2EAI2HmuzCbXU1JZK6xPy18v3FQFe2Gtuz64u/aQ5BP8D8AxL
         W4DA==
X-Forwarded-Encrypted: i=1; AHgh+RqZPnLe4+AljPjzWDu9WJw5jT4AsPrq8/s3Zjl8WiSUxTwZ+CpmW6EUxKv/02fKSJq8mqs4olTPPRoi8Uaf@vger.kernel.org
X-Gm-Message-State: AOJu0YzTt5omGmItfwkuJwj7zke0zcKh50TpbIfbUOAuPwbgZrwoLXtx
	eNdFgzHnVeWoUH7RX4rP9GUYPPOHtqhEpJyb6nPksBhja5cuEq5bVewHg80yQ+N2q6r4ZmAv09r
	+Yk8a0Gc4wfyqe0GigUwmpjlUbMWFPUf/TO3w9xyuHfJSTjuGWa+AHZ3mMY5hsh/GAYhR
X-Gm-Gg: AR+sD11Cvv2o/dTVde/QFcDeOZOhD9QMb2rDYuMFZnpfcHC7/w2gALhNIOmeMw6c3CS
	SZQ5ehUdBnCJ6bgDDmFt+DHB8AwG5BpqigvIJazC8QZxe6sa8vC/XLH2AeXWOKVJRbYGrxde3AW
	t//pI754JxLTeOlxrkfRTuIlgQZkkS0XDYYp2RCwC0G1TdT1DbaxRcDsJFxvNejzhITWV2mCyJx
	21Hs2qNPurre5gFkd7L8p9/LHOZp1Lpm264UF5nBZ+TA/9Y8lv7BYrgkRWh/oGOhpAs7dV243V6
	ZyMkBwcCuUJUFVkd+IZ0IPX1jNX+q8on79WvLVmX+4umR9WdJkum7SS6Qw7ysMMc/9eTDQAO0pk
	ZBhCCQRrviWyGucD+tSqOBU+c1ppT5oD5keNXpmQGaBvcsS0=
X-Received: by 2002:a05:6a21:4d0c:b0:3c3:9251:fe49 with SMTP id adf61e73a8af0-3c44b1ee70dmr7362930637.50.1784887306359;
        Fri, 24 Jul 2026 03:01:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:4d0c:b0:3c3:9251:fe49 with SMTP id adf61e73a8af0-3c44b1ee70dmr7362904637.50.1784887305969;
        Fri, 24 Jul 2026 03:01:45 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1c9289sm29515427eec.29.2026.07.24.03.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:01:45 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 03:01:22 -0700
Subject: [PATCH v7 4/6] arm64: dts: qcom: glymur-crd: Add PHY supplies for
 pcie3_phy
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-glymur_linkmode_0724-v7-4-65c8469c6b65@oss.qualcomm.com>
References: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
In-Reply-To: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784887301; l=909;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=hNJNcXrNH9t/WVgtwP4qKBm+72KdIBYy832AI6C7B9Y=;
 b=Vv9RQne1q6h6Y2c8HqXDglkrX0naBuTuN6Lt7DDTtPB7r0B0T409GqfC9mhVtdgG/xSRbB9XF
 qX0nGE2ivWcBoBPjb/WgmIaL76UAM2QPj0uukGBUdsp5vRC6UYCUvER
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MSBTYWx0ZWRfX4jAviLF457jl
 riSj/lesbxDvG4ujhI3rqWfXH1neTMQh3biGhif/PFuuL8Ffx/lHeNNxA5M8Dd+PxOW5I3KSLmA
 JMpnCW3O3848WVQJBaKgrwgGXVVeriNUfJbO0zvPYgUNScaNCoyl7M1f/FTOgP/ADikpLkFQDRx
 +75ijSBeXo2QRYNpyOw2IIF2cTcJIH1FHPBReDDOxFxTAtRjBHHsT2mLztQ3k8znx+RkL/SqYOh
 12ehK0CzrFmejBxplO0vnRh57UGhyyYur1I0kL2JGs+xe5S5gUxwS3HXc6H9lSgHBhWHeQP+T0h
 JRn+GnNKJITrQUmN3ZugOq0lLJyjBUJfhpH+zwOs2hKzi2+uEGwM7CQNWL3XiMY+rc4k1QtZ9kB
 fxheqARASjygsTvA8XyoIKlYhpnUpM/Ro58Q0f23eRhtfuWBZ7tSt6v3IZrzqbhtOgdUEZyoWPY
 UDCUFUSDpGgBWO+6TRg==
X-Authority-Analysis: v=2.4 cv=RJeD2Yi+ c=1 sm=1 tr=0 ts=6a63380b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=A-Hq22lvr9pePbC5bZQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: DS4Ing9NIWwPSUI8ypMQru2gZoXxiFMo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MSBTYWx0ZWRfXzkpDuG3mg04E
 WeInAMNZcgndJjaYRLhB/gLNpLmPPBf6gqfwsnyQOHFvruUliz/IuoteH5Xqc8MgwqHWof0GyiE
 BlxQhD+dZROpUOkLPppHrq+qwqzJMDQ=
X-Proofpoint-GUID: DS4Ing9NIWwPSUI8ypMQru2gZoXxiFMo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240091

CRD wires the shared Gen5x8 PCIe PHY's regulator supplies through
board-specific PMIC rails. Add the vdda-phy, vdda-pll, and
vdda-refgen0p9/1p2 supplies for &pcie3_phy.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 6125617de82a..0aae613a33ad 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -28,3 +28,11 @@ &mdss_dp1 {
 &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
+
+&pcie3_phy {
+	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
+	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
+
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
+};

-- 
2.34.1

