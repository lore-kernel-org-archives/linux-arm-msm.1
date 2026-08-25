Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B451F3C1092
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 19:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787685225; cv=none; b=EBvigFPv4uEgIKBcijaK2cYRnxy7aSSZQJw2jW9Ql7FASpSeHMhSuFgQdPJAQKPMZNRbvGDwhLZTfu1OGn7jiuHP6Poo0QmAXyr+blanGkPzMkNjrewPWE7x9hVezNhl/gyv2sqG3Z+4pFKTij0HE+yl1vYCKvwgGFubmDaL+es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787685225; c=relaxed/simple;
	bh=dbmx/W67JCVIALQIqb/RkHyLo6NQgtoo7SnJ/KM4xDI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DCW94C2d9a2U48KXcUXasjDpBLK+Rfg19T7CF9LylvW8wuU2yp9gh5zTPxqFJXGxL5CqlrCBFAtA2+Ff8Q5QTc1cihDEAB9V6xMS8H05qMi4tw51ggyvxZhEyriJiUjpvMmYAztz0CczMWrlf0kxZWD1vzLAHKtkslaNaNd2Q1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OFz76rUp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cTZmzQlu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OFz76rUp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cTZmzQlu"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PHdGNd2048981
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 19:13:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wSG9jyQWZ/3aOSzM1SwMhKd6p1qQKUizzvvLAiAsy7E=; b=OFz76rUpjtH7dHlm
	Hd+oq+Rq4o+nrT0xGR97CPVICE6ml2zcIW0lNuLz9CSXGvykMLRcjsD3oM05aVxe
	yZXVlsY35xuKDpJ7oDKIN+vqXCL7UcBTwARsclcCZWXkcQ9o6jelyia4M/E/Ihoc
	rUl9fKGtMT9maIntzBTvdipdsqZ1U7SQ+Kr5t9poq2KD0SMMLcwZ9cW2jVm5cXCe
	0ZclK/IWd8WwR4oq3fKdsn+wesLisQRtqvdjqu2bohNGwj6gBRvW8LfoHb67sE3w
	0LBHFcEilFdGn278hYr8ft07midUdzV5MTkzuV4F1xtFwGQJwTwJicuTOZgQCnLA
	F2f0AA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fjn0d03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 19:13:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6fb956002so2459855ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 12:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787685223; x=1788290023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wSG9jyQWZ/3aOSzM1SwMhKd6p1qQKUizzvvLAiAsy7E=;
        b=cTZmzQluyqG2m0tgez3FufkJV1UgWKoaDZ9dC8BrguP5awUSQTlCXmZuBHEOls8yi0
         YEEy77Lo09GIH5IEwJPhRfEdInFLlupnE883X6IAcQS5qkYtgTxbAMHRC6ow4Ebprh8a
         pYy8oVGoOiz8M5EWlVFWzeVze9t4K540x04cZoR0Y8sLLZuKEDhg6NV/cAvVQfZZ4vGX
         sH9xJxLoGbLPo5wIo9iLvCaS1tDteW5l72b99uTvAZFlJ1Nl4ZFkmxSYenoXDVxPRPqm
         3FnvGmHZ5+B4G+sG5bLnIpkXpMHRqu3RBDoqWGfJNnitv+CIvjoHkeWMMzIH5ZZvGzzH
         o/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787685223; x=1788290023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wSG9jyQWZ/3aOSzM1SwMhKd6p1qQKUizzvvLAiAsy7E=;
        b=i2mR633YshMd5TRze+tUcdLbezgOcWp3R22Q8LYECJ1MFopql6pk9wgrM9ROPddUeq
         PYKPeB2RnVW7Yn2dPTWIQdsRa2RSpvD92Qo2wlzI9XLFjf2m50gLZmC2CkeMu/X73i4j
         Xjzjsj5qI5d8KGxjVhlIcT7T0NaoBcCTagfh4emrVBYsZFBH2t+AJkF26GPapzKM6W1J
         Z7sGl3PB8HtUwf7n+vsoJbTek4WE23km9vItF+XDt1/SarFaDZTz5iZkSF2xeT3AoM27
         tf1atP2tih7FmcoAa/rdCbKug2qgm+XVSDjHnO+mS0/PmbpOHBaIbM5Ss4AINfxvRs/a
         QFYQ==
X-Gm-Message-State: AFuF++mOGsmq2Ms0DxHu8mlCdh+eEpFnP2pgFsksvho+xNDmnC5BCFM0
	9LXz1wuw2xYzCiPX5rSsu1TWHY7ITX4ABxT2WmGsPYw6BPwkd7mul63hECuS/Z8l/s0rvTkwhbu
	NV6xPwe2W0KP+TJGWTPDGWFg1167zhM3qhcUyKnd6Q3KkWXCYnwfrC5MIFfiLqaSf+VEr
X-Gm-Gg: AR+sD13aWaNHZCZqPDhSBR+z56jhuAoA+Wp/IfwuRotp0E/yjjBoevq7dEA7SWXM4rW
	KU/HwVW/d2F+UC781RvL5JEFbffOzpFmk3ja1/egNF/5MQwL7E3VIsBF5S98cluPfRVajoiEejK
	XPuhPMFvRswNf2QzxDWbiYjCBbtoL057f6Bch9e7LXU+NeShVKMWBz129R4mKbkmdIQvFupJwJZ
	TfNoYXyIu7W/EwMNhMFuv4X7ppZGEPuUMZ7nujErRG31PnXJtUoxDVw9Ik8C3ZelwJQntIjkF6r
	ZYd924V9QUrIS/k0r2dCGZOnODbfdmoPwrlhaAbXTq7JXEcclpBUqgPRMEavu4lxgqAnRw/vt3a
	Ex0YOrYgOSa72VEl6btFB9JztbMGsSkYy
X-Received: by 2002:a17:903:2c03:b0:2d6:ee6b:1b08 with SMTP id d9443c01a7336-2d707a2f363mr7602465ad.3.1787685223531;
        Tue, 25 Aug 2026 12:13:43 -0700 (PDT)
X-Received: by 2002:a17:903:2c03:b0:2d6:ee6b:1b08 with SMTP id d9443c01a7336-2d707a2f363mr7601725ad.3.1787685223041;
        Tue, 25 Aug 2026 12:13:43 -0700 (PDT)
Received: from hu-afaisal-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283da048d3sm930416eec.28.2026.08.25.12.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 12:13:42 -0700 (PDT)
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 00:43:22 +0530
Subject: [PATCH v4 2/2] arm64: dts: qcom: shikra: enable ST33 TPM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-shikra-dtpm-v4-2-8476223184de@oss.qualcomm.com>
References: <20260826-shikra-dtpm-v4-0-8476223184de@oss.qualcomm.com>
In-Reply-To: <20260826-shikra-dtpm-v4-0-8476223184de@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787685212; l=750;
 i=khalid.ansari@oss.qualcomm.com; s=20251105; h=from:subject:message-id;
 bh=dbmx/W67JCVIALQIqb/RkHyLo6NQgtoo7SnJ/KM4xDI=;
 b=swjVKDYB9ZRIp1jGaRmYBI6oSxVJyyDLlcTr2c35v/vXTEfxFCVFgmNfzfa0EAJ+sayKI6zrZ
 wohcDeEVmzbC5JFCQyqBYzCIDg034vjewGd8dnmJOx4tggHJqloqGdT
X-Developer-Key: i=khalid.ansari@oss.qualcomm.com; a=ed25519;
 pk=eBXrIUgTWV0cgG+GsNeZPPgvj1Tm6g9L2sfcoxMGrKo=
X-Proofpoint-GUID: 1n7519hM6Y7uXNYjyND6KLBfYbYNHAEh
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE2MyBTYWx0ZWRfX058Klsl6Urxb
 hu25ELxowMuwj7Fmm/kQ7t4XzGfEmLF4VUctsnY/vhmhhUZXYyojKD9I3FcjJaeHc5YjG+xvOcr
 IE6B0dYwLGsr9RSOTB2Jy9n7TgGY/Lo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE2MyBTYWx0ZWRfX0xstsE4ZTDGU
 vGflcMp/iI35BD9705+VacfEGrR05AkvSgZVxOO+oINrKwyOorfT/cc48qT1kePcORbK6rpDkf3
 m2eCh+NYA9gWzcTwLJrRmCVDOKcLJAHh2YLCmVeFKRkUC/mYuQhLl7dycz3X1nCCkUfxopmEuz8
 4L1ERyFz5LBeUdV+fKI+c51xMrB3mxLLU61T89q3xKX0WRTfFLzjA0aPs1034QFERVMWL6dKdYQ
 YU74Vzk7Em1pdSkZHo9OGC90QvU2PT7GtNn356rNVai03lR4+Oo4Op9JYCs4umrtKlVV/pWDfeC
 jlXTCWuFlrx6YkH/gMdegoBhxYDZVaTItHMGB37S+w2b8t5DazyRt4Bt5e9xRWHOnyAm93BKIIx
 JfelcQ60v3sKf98A9YkM7lhy6aowMw3ZZ24HTbfGAsyp/rFYoeuuORFGDEWgT33Uki3HN3XpmSq
 L47zSKpsfvk4G3/TkHg==
X-Authority-Analysis: v=2.4 cv=ccziaHDM c=1 sm=1 tr=0 ts=6a8de968 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=YSeSwzeZyu-nVJi06OQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 1n7519hM6Y7uXNYjyND6KLBfYbYNHAEh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250163

Enable ST33HTPM TPM over SPI5 on the Shikra IoT EVK by adding the
required SPI and TPM nodes.

Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 6eb4184f7642..9f3a880e95e6 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -12,3 +12,13 @@ &qupv3_0 {
 &uart0 {
 	status = "okay";
 };
+
+&spi5 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};

-- 
2.34.1

