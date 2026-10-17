Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A163D6CC6
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 04:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792213134; cv=none; b=pnrYK/N9H/z9ZeO7o441x9NCiJWcxHGQ/0oWt71RsiwaCf9nIGYe6NLGjhYhcnmI7ou9j/ODyfsg8ps+iDQt9fw97wyMwe5y4ghnsiJL6HeXa3gywbS4UQHJarnb1vP7T1jdhAeqlvPDAn1Woi2F+i0TG2N3Hvlv0SJ2nYWRez4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792213134; c=relaxed/simple;
	bh=2eQRHgppbkcSpMqh2UZLhmC13xrKz1QPMZmh+unhBD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZT7sVSSLW1Mi65gC367Yl8Ph+VpIYrfu/PJLS7WDsjgSsRO1PoqmDU7Ib627+igLg6ACJD71C1qjKJEVbsjQiIe3bhSZRKuSVoBfZ9YjL2EkCgv2/oLpMS8x7EMhcBO1qjlkYN+EdZut1aGbeatzSjdBY3r/9YPlsfPQ+aIp1hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iGUxQddI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YmUGRZaA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iGUxQddI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YmUGRZaA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30WOf350854
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 04:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OGZPLB5j5vu
	z9k8vw17ZLseNAVbY8N/wxsdlErvLb+0=; b=iGUxQddIo8bFvJI6NI9eHLtS9LY
	UJYRGWfSfZfGLZuu1a5lrsO8/LqRGaP/h1Rve9R4xFoNG453TYNzpD5RitgeOo1k
	kQ/3oKonID5mlK63IEVAC9YNUHqcNucQQStJg77rrVZn0yEbLsAwubCUhlCspwDj
	SSNGotio/rSXLqA1n54WTLGFPjel/EMQDLJEacj/uOd4Wd24u2gZ36HeMSDgSWTy
	aucYfbSiDJpIqlfUlIWuhpjehu4KEdImXD6oJ2iQzhMmygN+nas1BONGwcf8dW1Q
	wXcmoS8ZBmyhR4yuLbLnkP6fSD4drJBEC15hfLqN1Ms1At+Z6U96aIj3dAA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc016g95j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 04:58:52 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c902e0da2so1975195eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 21:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792213131; x=1792817931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OGZPLB5j5vuz9k8vw17ZLseNAVbY8N/wxsdlErvLb+0=;
        b=YmUGRZaA3pu13QA/8/WvcqL+cVz3wvlLZ+GZ1+Bn/Xnfg8NqRQO/IgUZekGjCDVC2D
         udexI4ItVqjKeeNu1tlagKFZA/evQs9WSwN+k7L8ULjfmQiVOs+X9dHLQgvV9tOXaer7
         OjpRRgP4c22YfaejOGoWoGo/34kmRSNeXqbAg6/YwPNkvc+T5kV6tsNTTmAsekL7vD5C
         I5o0mhvDNPOboN6gmpcw3tiB65FIBGernkGv8DehoHvordB80sFUrvFbjV1MBCrNRpKA
         hQ8/i/s4gN20ZXLiO7D9GOwCfA0VGA9WfU1tKh13GypY/tVzGIDijbnCZJx+F+JUko20
         o9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792213131; x=1792817931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OGZPLB5j5vuz9k8vw17ZLseNAVbY8N/wxsdlErvLb+0=;
        b=bLFSoI85Y9Ur6CVoVRoXK2PXBzmrD174YjeYlf3WkeaKc6eigHfE/kUMNDjEuU+lW6
         ur/3yCX4PM2N+Uqg/wQS2rllXSNuLuieLqXTX32JO9uOIz66kMBeXwAxaE1lPKbgT2QJ
         JxD+mQP3ZvWk8XAYsqX2J4kENWl3kZTu6tTzZOsWyoCc30R1eC0fKlEJZCj3XSDVZYqE
         aqgZs7elwXzCov8S43/zQBlDSoB4Mnz15RR8XBSI62E/1vWXVPc2+Qv6vFLXP7gG902e
         0reHo2Oub3F8gq99drNbBCCF59AWD8nTjNgWv8oBMiGFRTNX0SXo60+KpIYdocsdD/xU
         VYrA==
X-Forwarded-Encrypted: i=1; AKwUvBxmwEzBqalDDojwo4TzwxErvtHhG6xyurdEskDHrfUUho3EbSJb33ayVVllOoz1Qad3EpqSTTbrQQOCQ3Ir@vger.kernel.org
X-Gm-Message-State: AFq9FYKxEXDJcQYQTToB+sf9bjxWcB85R1ZsD2jnlQ/V42oWgRLRosCb
	BSwez+wLwpeqm8KayQ+8lo/hWjuBrlIRCEUcMasYu39H+mS5KeZk1FjN8zFEaWlI89UEizAwWTq
	TT3I6TrP90eeToRxAZG19Amjc+DhxTVn4KroCKPGJOKhRaGt2T1aJOUjA5Awn5eIHq06J
X-Gm-Gg: AYBFou1yG5kOyXO9qYZbYMYY2VaG7wYc5tupGoGT7e+lqDyW1tbA+yQRmNpUSj5I8lb
	hLPmwnEq2ERPJ/B80JPe+Q4JqItTfqgvg2wmA8svVbV4AiLcmxm2r1NuMNhFnO+DpB9AgGnoM+T
	u7LhnP88m/+/djohuCqc0Dlgk3oqMIiUBbRPdXPu3VcdHmUJQcrev+vo61rq93g0NfmsFsUObgL
	oYIihsXhLN2YVFUruTPP1tLaGsKm6rEr3lMAAj/YS3DYtrF7Nj/WKC14w/278eZqZ+axDhuxkRI
	VfnUyY6d2mYaxrTswDOWX963BxQe47y4JJpehY0gm8WP1TsHPbzFeNGFuHqaNAmJoIrAKb1wZRx
	pEe21lgW7ZxzFy26wze0sDMyhQmrVv2WcHuZ0+jGRRHQGzcT+Vng/FTPoWv4=
X-Received: by 2002:a05:7022:e88e:b0:185:e68c:904c with SMTP id a92af1059eb24-185e68c9108mr1545642c88.7.1792213130996;
        Fri, 16 Oct 2026 21:58:50 -0700 (PDT)
X-Received: by 2002:a05:7022:e88e:b0:185:e68c:904c with SMTP id a92af1059eb24-185e68c9108mr1545610c88.7.1792213130535;
        Fri, 16 Oct 2026 21:58:50 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm15203817c88.11.2026.10.16.21.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:58:50 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 4/4] arm64: dts: qcom: nord: Fix videocc clock inputs
Date: Sat, 17 Oct 2026 12:58:17 +0800
Message-ID: <20261017045817.1506961-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017045817.1506961-1-shengchao.guo@oss.qualcomm.com>
References: <20261017045817.1506961-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxOSBTYWx0ZWRfX5F3Um4EsJcCS
 TIyW1mwBYwhC5Gr6pPnyvZetKRy2pSsYed/gb/Lc4lFtpEBjNHRbyBdmJIH3/IF8n3BCk529iHG
 pV7M6Vzu5vFLQBQfP0j9eUCbmOOBYxo=
X-Proofpoint-GUID: kzz3taHGICx1snCE2hhtw80YvIMtn_Ni
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxOSBTYWx0ZWRfX2JXc1/XNdMMx
 Jls77Ug80NzoAjrewTezvXToVx9vn5eOPgDEfYIT30acfvXV/SgZHnnptx3GUBzRZcr70bCYgBY
 BjZHbVrS2Z/isL+0xgfhAwGRITMiwoE5DNCYBs8A6NSuYcSBEqxFEY05bCO8A1GNu/dcuouyp0V
 bdpgP4F3hNXH8vupQyz4/632uhFZZFBNgvwl/XrqHAqZXGIrmfLcT64Op93N0zoWnuW8wwuPbwU
 eAq9/8gbMUMD2Bh+0r5Qq3kz2odCVmd31EgM3jSWX/9FS6YAoWCx7iNm/Y7LTG+25LR2thvivgP
 1RRbik+W6g9TM4oS+lYgwK4pqA/zegK+JD8An1Up3dvQJh7iRKZAkbGPEO7wAcz6uMYe1+idcYy
 wd220N16wltU+xbjOhxCWlbXOAvfioMvpBd8CO6zumEaj6EiUjcdSFQ487X6/M6KmJV0D4jFXnX
 WTofUFq7rJp7veFdMQA==
X-Authority-Analysis: v=2.4 cv=COm/zhrD c=1 sm=1 tr=0 ts=6ad3008c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=I6E1kIfsyqVcGmBSIt8A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: kzz3taHGICx1snCE2hhtw80YvIMtn_Ni
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170019

The video clock controller binding describes three clock inputs for
Nord: the board XO, the active-only board XO and the 32 kHz sleep clock.
The videocc node instead passes the board XO and NW_GCC_VIDEO_AHB_CLK,
which is not an input of the controller.

Pass bi_tcxo_ao_div2 and the board sleep clock in place of the AHB
clock. No functional change, NW_GCC_VIDEO_AHB_CLK is kept always on by
the NW GCC driver.

Assisted-by: LLM
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 1ab7d9bc3cfe..62d14be55839 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -886,7 +886,8 @@ videocc: clock-controller@aaf0000 {
 		compatible = "qcom,nord-videocc";
 		reg = <0x0 0x0aaf0000 0x0 0x10000>;
 		clocks = <&bi_tcxo_div2>,
-			 <&nwgcc NW_GCC_VIDEO_AHB_CLK>;
+			 <&bi_tcxo_ao_div2>,
+			 <&sleep_clk>;
 		power-domains = <&rpmhpd RPMHPD_MMCX>,
 				<&rpmhpd RPMHPD_MXC>;
 		required-opps = <&rpmhpd_opp_low_svs>,
-- 
2.43.0

