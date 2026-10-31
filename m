Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456727;
	b=UTFYSo7j2f35/zceu1jIVDvEOF11bCfB2/AmB7ePYlmj6Bf4wXerTRFalzo2SaVkfIfs
	 c+Y7v+FHfL3rYZX/iH4qgOb7sBMFOCdtHjXUNKm0m9D4ud2Ticr8R2+xEJaI9otJ4FL41
	 KZWzgCHLhuuSy0MCYA9wkcerX9iWoKve1xDILoHI14nkP68vbz6S78cRdq5YrLF8wiD43
	 ZwqlZgOog+4iwMZVRby/9Y713e3VwEskIz7wG4XQgWx4gctDdApSVgxaoiYcpbO8BwCCO
	 V2DbX93K9tIsryv/HAqZ2LAPIFXYZBAzFrddXFqBcxvko2VVJ2Ru1ORR8SmD0AefGMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456727;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5uJBzesEdn8JWNtnL1mhsTmx0/t5Wkhbj05DbKxlros=;
	b=ZR9O4loT3TH/KMGJoKtLJG6WXYso+hPAuO2Jt85tw3A1R4BOb1+FLO22TkxGpxTzCsAt
	 BIFHITGfiQVNdc/MdlKefNTGv8iaZnKhP0KIJv4GrI+iYodEq5tzYRRTOosSLiJgrnf/U
	 T//d5unJqchMoYoLijYoM0IHxwwInmhmahw0WJQkyJTNGbFIQ813c1jJeSMvAvI64W21q
	 YWDwkmXV4ivNH4vmZ2uJF1FFARGuacpbQbGpslYjt4DDPRJAOfWqHTPobTAGXN7dxqMWt
	 2aHSqz42XZvcV+TLnDwCT216ssiL1Dj/aNda42Q2zBPAnGtAdqm4BgFlTWxEWbaNj3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LiQeguRt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="f+bvQHK/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECA2606A31C
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 14:25:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ECA2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LiQeguRt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f+bvQHK/
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD03br3174207
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 14:25:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5uJBzesEdn8
	JWNtnL1mhsTmx0/t5Wkhbj05DbKxlros=; b=LiQeguRtraozvTWcJG2Lfi4vsn5
	Uzsyy72XxzJUSNOdDh0auoKDMqtlAWcwaJYmwoF8umt1t2+CrCKBCh6rh5SuVJh1
	8I2EJ1WR4M7fQ+7v0/DkAFv1iGTb13vWaMQ5QXHhNAhmmug/S68djh0jhCGo49IB
	k/kkH3tPBiDgPTp3eYGxIhf1HM5CPcvlX0vE2xrJ3KEuOmPgR2gImnHmeoCyunyT
	+Az8YaKG1qAP/flAc9cQ4Hf2PCuN7EvpDnI+KXqzijY1IV/WCdIerki3OW9xDz/f
	DYQE+thPlG0Z6U/txpO3fQoKdEBY7V+QB94SuvFWwGYdT8Xe7pweG5wEZQg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn61fsknm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 14:25:26 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36637676140so2355121eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 07:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793456726; x=1794061526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5uJBzesEdn8JWNtnL1mhsTmx0/t5Wkhbj05DbKxlros=;
        b=f+bvQHK/P/cJsC57jufuCGZJhv9u4dsQGXW1vrnTCD6fPVkbpdbTQoQwhb0sWzbzWC
         ZgsDLRHZFKgeqftSpAIpp46pMBNJ3FOaMnDJJA4QJpbYCcHUy1pnn6Sfpts68KpQNjhD
         3n/uaG8u3FWTBHvEKYiSFtpj7cg3Oe+byhLGKvwZDOhYF/xE9i5f7bWm7hHwRsHo+vC4
         f3wlR03pIe4AQ3WeokGAwvax9mrrjxveMUARsw6oZm+t6nVp4LLwicnOSo2JRJgDEtN+
         WaH6bmVOrpWL6TD4f+s02zcdV4my630bbNv/bjFojoE1xweXiNUYLezU2IWcyHITwnYc
         yDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456726; x=1794061526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5uJBzesEdn8JWNtnL1mhsTmx0/t5Wkhbj05DbKxlros=;
        b=qFg+qWTLdJt3eePHNQvjf/R2C3a4Qk8nkgBWeoTtKDTvmqXr8kArWqbnqoBhdr+3Yu
         qMJGztirHsqRFEBavoaP20wWCMziGARvJrqtNZ4Ij90FbywgRfrOtNj3fM/MglK2gPzb
         i2A0tXxouoklPrjK1LRqMVp8kQGlBf1ASKRl7SOzvkb34gjxhTNmxkYz/3PFcxu+qEdM
         3z6WNOj17jxaOG7WvcVevV3zxbUsM9GioC1XZxQ2XctVPunpEBxMuMjS7R2+Ey88asP8
         9+pqZkfjPa1/bvAQtCaRwO3+AGZcWmTlXu66bgn7/NlrZN+Av9bn0tLjZ1l9X62tD/NP
         1T8Q==
X-Forwarded-Encrypted: i=1; AKwUvBykvphlygt4EOgj3/BWERLqZlxawIUWdMOqQxGWm+I+48oDz/XQpT+Yz+0nWlfEa1T7UW673OqOXN8yim8q@vger.kernel.org
X-Gm-Message-State: AFq9FYLikexe/xr1YkEbpdrelCEZE3TbY9/ml6Gnm6mY4uU+Ujlq7yaW
	sl/WxCxMzfLGDPj/eBdJ3os3QQjESYgH9VbfXosQVqr/y2qu54hhMWrjlLKSG5bpi4LytmYdqwl
	DriPt5EwZZnKMWWLFBXHDRZd/SUs/E5jAxnxOsSi518x1BNQIDuigyDEt44afwdoaQzMt
X-Gm-Gg: AYBFou0MtLuviuGGJgcoqbww8IaAGHGGXUUCbhW0QrFqsj1uqeq9MPzNP5FsMlK7JjJ
	r/WGPpVoBydbdYzWYQHJZ4SZL2slOtq3+KQ1i81W2xASI7RkzFsNmtvVuQ+CThQMe+zstMOWv2m
	ltgYv+qZL+D6sm0PCFvYKOZiJuCn0U91ZbTlzoL4BpjxQ8IGiQn0d8BNUTZa2D5361CfufJ3IUm
	x+jBFSKUzc95lLxcITz8gOb0oFTVB3allsFmXy4B526Z60zlUq5LyZ9G46HZoRv8DhrYAd3g0Sc
	lXqTY2sv8XrVJtOZah94F7gsVRrbEw/s3AvkzyjoYqCTbLcxIsctZlS6SxGZaS/Gg9eI3rHNUMS
	wtqZpoYqxpxbI3ANRUJEi/S6aAQXsqXENcUg1og2g79TdUyB5W3UdpXbVSNRqmHyhJ3T5WRaaFt
	DOKVGnyKIRqJlD6iX4mH6BHKBJfkP61eky
X-Received: by 2002:a05:7301:6194:10b0:369:f937:9a7a with SMTP id 5a478bee46e88-36a42437876mr7966015eec.34.1793456726007;
        Sat, 31 Oct 2026 07:25:26 -0700 (PDT)
X-Received: by 2002:a05:7301:6194:10b0:369:f937:9a7a with SMTP id 5a478bee46e88-36a42437876mr7965970eec.34.1793456725286;
        Sat, 31 Oct 2026 07:25:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm24968586eec.16.2026.10.31.07.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 07:25:25 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v4 7/7] arm64: dts: qcom: nord-rrd: Add WCN7850 Bluetooth support
Date: Sat, 31 Oct 2026 22:24:33 +0800
Message-ID: <20261031142433.1212809-8-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
References: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX5dfTHxq3SySM
 U82iAzEtxEtwndxLbN7mlPSh/EnD9XLJ/ID9dkxHblaaC0c/6Q53khdx2FXWRD4uwMdre3U7aMi
 SGBv4quhvRIlP28e/fMGyFs9Ges0uq8=
X-Authority-Analysis: v=2.4 cv=V/LoQuni c=1 sm=1 tr=0 ts=6ae5fa56 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=grFeI82b2oVWyHTUkKAA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: sAoOSc_qLhH_yafNhfAhHp3IwMErmCqU
X-Proofpoint-ORIG-GUID: sAoOSc_qLhH_yafNhfAhHp3IwMErmCqU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX6K0cnL036oso
 yeQtKs0Gu8BzdxYbAHJZamytfMKTtojtPDuZd5f17m+AgQc0D7C1MG3eAAVNO5k1sx9pt6dd1ZV
 tcKOqbW165SZKIzIloQQW/PFwHOamiAI2O8EW33WAYesqjRWl+sYXtOZZV0A5ux0R3QFlnTT25U
 NaFgOLwQxMHV4fODQfxVs2T68KWQ00bkvRkRxqroKSxnuzWYsCQb6Z86hYpRkjTSF4UPqLMP7CW
 veQL1iKMnWFwMTV8WcCflf7zjk07AcKwwJMAMpiNsHdJyI6cCVhKXsZcqCmW2nyQWAaf2HlezKt
 DWasjL+SZBr5DnSaZRFThDG3ldNxYYkv0i0UcZk4Xur5/CNBkGE06pkmk3AL12Yq4z2Awbwi1JZ
 IYUYSIjIw6TSphAhcu9eNHbxsQFPQLgB2ba36lpJeBx2i+JPu2y7hGsIWPGASEicEOzQh4xou8P
 2PSK9ybOk9ktwl9DXYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310057

From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>

Enable Bluetooth for the WCN7850 module on the Nord RRD: route the
BT UART (uart17) as serial1, add the bt-enable GPIO (pmau0102_e GPIO9)
to the WCN7850 PMU and describe the bluetooth node with its supplies.

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index b23c1a81a376..827d3ba3a238 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -18,6 +18,7 @@ / {
 
 	aliases {
 		serial0 = &uart15;
+		serial1 = &uart17;
 	};
 
 	chosen {
@@ -102,6 +103,7 @@ vreg_wcn_core_vh_1p95: regulator-wcn-core-vh-1p95 {
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
+		bt-enable-gpios = <&pmau0102_e_gpios 9 GPIO_ACTIVE_HIGH>;
 		wlan-enable-gpios = <&pmau0102_e_gpios 10 GPIO_ACTIVE_HIGH>;
 
 		vdd-supply = <&vreg_wcn_3p3>;
@@ -602,6 +604,23 @@ &uart15 {
 	status = "okay";
 };
 
+&uart17 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+		max-speed = <3200000>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+	};
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 181 GPIO_ACTIVE_LOW>;
 
-- 
2.43.0

