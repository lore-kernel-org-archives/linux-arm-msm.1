Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793520327;
	b=dx5+6hA3cfWqt1Xw6IofWMlSAFZUsmFVEI2t8HWtsrxKbvfW1heOLYYPf80TC+GC92SE
	 2goPP+OSpE3OWDWfcJPBWGZlCx5Dh+v3JeRDWEhOGaoTu37cRPeJimSCJ7Vkl0amfVdSG
	 KOybf1m/xd9CJjumEQBfvZjgEFgfS2oFhe7co7k0l1nWKt2j5sFANSxJ70Fwu0/B53ud8
	 x32arX9rfkaXctxGXBHUqXS7oLEh5x7HTVLXa4pXjjZPBycX3h9aJezjz2cycOK8C7m3K
	 wq+8aysqOc+9S39ROb20EaNa97LZCmYCBWfAxroaAMN/fQ9DNZSb6rCyz4eNGbwrTqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793520327;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xz3k8nUkuCL1vaN306jsyyCr9ZkPRCcwyn30pa+56JI=;
	b=WuzwvBK3TYhv/sFLaPq8rcS2IPRtSKC71BOm5hi0NUalb04SZpPf7GC9r5zJpEgcMD4W
	 G/LpIL4fBgFpfKPBfTMaPiqVU9mTqVjvUMJgQ8WlnA9QbHpbsheoH6cqs6VpUuPCDFbHF
	 IzutfBamYd1As8jdTjmTqRfEKj/oang+weZ0ESmFZq+gB8u3qK3924sCOKX+WijRbKAmZ
	 Y2ItJAQLSsr8mjq9l8fp5gADTsuN27ia3s24yHHgwoNVcgb7JRsvd6dTkKBBmYxRnxN8h
	 lI/fHp3y5ublHWxvl7An5acNF24Ja+kem7/Xs6lNTXsaHKyiMHnU1EnM9wMLZAfwpPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pnDOAO2k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z2SetOW5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A31B606A324
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 08:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A31B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pnDOAO2k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z2SetOW5
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A15KbnI3105764
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Nov 2026 08:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xz3k8nUkuCL
	1vaN306jsyyCr9ZkPRCcwyn30pa+56JI=; b=pnDOAO2kXTl37RH6ahQbhjshAM2
	J7/6suSCthRNIhkM5dEWNMq2XNZQ21gmkr3AyJBdnmuaPcb/wMGE+XEjqrKDdYl8
	/23b65O4ndOjKtWHdpXL+nSQDLknB+HNwZWwDhYP39r6cMb+IGrxNGJHseHUmqFT
	I/UbiFUK1ee8CXi06SvVMOWBE2PPkLUEuX8N5FzhFQjE9Jc01MwH4Ru1UF8s4E3k
	1zUoA4DQgyDsoh/pzUP9a77t2FeRQLLP1gCCdQmgHRy7dDgwAWCN/Y9siJiCANDl
	eAvqiadKJezPF5EoxscMBh9pYb3zYOVdTVlH5R25Ttp3uVkmltNToHE6GOQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7twt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 08:05:01 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-359b81ad4e8so2830989eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 01:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793520301; x=1794125101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xz3k8nUkuCL1vaN306jsyyCr9ZkPRCcwyn30pa+56JI=;
        b=Z2SetOW5+S9IhAsCcLX8iXytIdnt9LFePB5/eSKYBrc2CLup++RqLUs8kKHJKS5mem
         IxCwyU87Gb5AdyFQeMDzvdYfdFCFKceIaybSExQgpn7dw6YfvYqqaSXwchYzdfbgxjb0
         anwWE/5N9q9mx3wUS6tm3Cvyzn+RpSZtW30Ph1XidGrUyXhtf9SdYKAMfx/h27Ih8VTC
         zFAq7dgGPsFfYC7JF9WHgBWWk6yrGmODERb4s6+jyae9m3APjTe5GXZngR1zBJd0casu
         KFaS8q1bE22DzKA0/DSsx543n7ak59iyAQ/J6exPybhjtox+LLLZOW44H6iEGgvWGAlR
         BIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793520301; x=1794125101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xz3k8nUkuCL1vaN306jsyyCr9ZkPRCcwyn30pa+56JI=;
        b=2bcL0Re7l5eQE3CFiadEkpFgDJo3O1ycR7V4a1Ov4VbHe/UqCb59coKyPCVW3jzDFY
         UfyZlgQBttcNEdToyto1eRcyPvG/+CFHXQCinXzPgLBl9DSLfe8Jxn0RkS3gWTC2DD0q
         57VBirzENZ1PtzsQPR/F8lSMSAsTN0dxrmSfpEYLDVdxUcZHKTvUJfwTBKpiJcGQKImX
         ke+0F8Yf85NmG7kN9Ob5jut60XAU+9HBILPc9pOD30Cg4z+5E2ZvnbOBKp4WcYCzgtgW
         2i0BmBf6SduL9JmpCHGPBELRub2jKluOuOqYEG689v60m0HLRUcOyRz23c8zbRyO3nTa
         MeHw==
X-Forwarded-Encrypted: i=1; AKwUvBy+PN2Sx9gKnT94+RleoyEMw/Kw7/64Ulk02j2VOFdjdOATn8R+x3Vu/nubgOALTBhQKu/emRdkeijbexTk@vger.kernel.org
X-Gm-Message-State: APuU4Z+t3XK9ygPAMNTpmg/1ZH3/HRV2PRsQuxzAe8ybTcsK70BmWbaL
	wMJMstyVnvBGOFW+euhuvnr63Ckjast9GxvcXMAAc64pXrtmgtHRXZXLi0f7ZHIxXSi60CWVPLU
	PPkiCY0vnbzdZASP5QRqihFQXJlipL1oRFdN47GET7AX0K3wRK7dLOqSwX5VfgZ6b0Yom
X-Gm-Gg: AYBFou33qMyf45chKqyvCq4qkiMlbrx4ce/37DXta8F7cYmvIGyRaZ+D6kf3U0N6npH
	RmG14sWy9ZmFPy0EM+1kPBANbwBDoD9qrH9IevglLSrTHLL2KDgnP5PBMEGolcIclWm7I/7sj8X
	dyU14EIwkWBChN9k+XGvoFTrr/0auTM/NnWhXEO0F7CrFRvQTLCjA6twfgPJ2UVHwCQF7p/8I36
	Wd2gErGSgmf51dRjQ39CCb4TpG12oIiyArQkG8dW8KSDxSprF3TdHLBxa/xS6BV1h6xDgP/U5cm
	Up+8bqGSYoTU5zyBvnyttCsXWH7vPxNiiChQYm1H9/aEtPDuX+u8MJyMtGsAVGlFQYfvvXqyW5m
	HVjHB976xsNLrVbWTOtYp07Sxdm7DhNEGINOqxpy1vSZRTRTDskiBfyXovoDib/tjWUifp0HVy/
	jB680NM+wIhQG266Pswlb6FDjcwQ7O/BvP
X-Received: by 2002:a05:693c:6087:b0:369:f420:8679 with SMTP id 5a478bee46e88-36a42440304mr12108988eec.38.1793520300684;
        Sun, 01 Nov 2026 01:05:00 -0700 (PDT)
X-Received: by 2002:a05:693c:6087:b0:369:f420:8679 with SMTP id 5a478bee46e88-36a42440304mr12108966eec.38.1793520300163;
        Sun, 01 Nov 2026 01:05:00 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a5fb97sm27341792eec.23.2026.11.01.01.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:04:59 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC 2/3] arm64: dts: qcom: nord-ride-embedded: Enable Ethernet
Date: Sun,  1 Nov 2026 16:04:12 +0800
Message-ID: <20261101080413.1428016-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
References: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pRuf-d46skeoXR268QQqNvoonUlcJg90
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDAzMiBTYWx0ZWRfX2DilbjxQmLzi
 tc25MYxeCsUbKRWRbeMDAUxFidrS7aLYlbSD4Ko6TCeDMItlni+zNX5MuVliRim8WfG44Yl4eHR
 35KFBqT1snMPrYPkA2MG9ZYxq+EOoN8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDAzMiBTYWx0ZWRfX0zOFhT5AYvfv
 Hmu700GB+beLpDuIhmut1JGnVxWqs1XPPTazpzypjeO4ckLhGMoAUMqZ4r24pYKNI7astaff0Av
 NynW3+LYvd6KWT7euIIR9kUNU5OGYTJpCmu42m3FW5BY6xQJ0yfBWTszYrQcKh7reiSGADah3AA
 dCU8vMmo9QFWQFK6tiaoIvEbABWkLPDtYYNfaqJagyPOHbAUqrLaiWtQFq+/SSWJEl1bwBC6INx
 vC0yJyeEHsqwM+jqoCo0P+iv8+amPRY+OeCbccgmBvnWgmVExZYA+lWEE8e/P9jBUoAIiX9ZHJV
 gsU6kHpWMUTybDdbBAZQ8Ai5SLP4P2drROdVkI+EGlXAcKAFIx6gzZgLffGZ3u8qbOfKudXuI6E
 ltLAOQQEPUg2ERpsu4OT0c9/Mx6H5FVnPVpOEhZLX2ZY3Wg3ct1mNTHqf0T67SDZmST+9RUZZJM
 nCDoetlBvcQZIZSWxnw==
X-Proofpoint-GUID: pRuf-d46skeoXR268QQqNvoonUlcJg90
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae6f2ad cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=7rWIkOKoExSrKlJ8jWUA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010032

From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Enable both Ethernet ports on Nord Ride in fixed-link USXGMII 10-Gbps
mode for connection to the onboard firmware driven Ethernet switch.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..50bf4c32641d 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -366,6 +366,28 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&ethernet0 {
+	phy-mode = "usxgmii";
+
+	status = "okay";
+
+	fixed-link {
+		speed = <10000>;
+		full-duplex;
+	};
+};
+
+&ethernet1 {
+	phy-mode = "usxgmii";
+
+	status = "okay";
+
+	fixed-link {
+		speed = <10000>;
+		full-duplex;
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
@@ -419,6 +441,20 @@ &remoteproc_cdsp3 {
 	status = "okay";
 };
 
+&serdes0 {
+	vdda-0p9-supply = <&vreg_l1h_0p9>;
+	vdda-1p2-supply = <&vreg_l2h_1p2>;
+
+	status = "okay";
+};
+
+&serdes1 {
+	vdda-0p9-supply = <&vreg_l1h_0p9>;
+	vdda-1p2-supply = <&vreg_l2h_1p2>;
+
+	status = "okay";
+};
+
 &uart15 {
 	status = "okay";
 };
@@ -440,3 +476,11 @@ &ufs_mem_phy {
 
 	status = "okay";
 };
+
+&xpcs0 {
+	status = "okay";
+};
+
+&xpcs1 {
+	status = "okay";
+};
-- 
2.43.0

