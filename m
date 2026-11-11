Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383542;
	b=QHjOV+liK4Jc8696LLJgmR5lrnJLjYXpZb+/Do1Fc94pdA0Fz9P18EMG8oCpctOFNmsc
	 fLmqwUfM+e/YTcp68GZipXqC6XQpfI2+uj8DI50Zc8RbzyAlnjMF9g3u0DctRbDKzrC7b
	 nG767jArkj6EXmT5SPHIi7M41cSQQNdWnlNkPbER/4o39UhNykY1JUK4+k6NbNAW7cwW8
	 BS/d6itAWgvGXh2Pw0vK7E/u8VAa02YDKP+MBNp26WCgaBNaeQC7DqWB0dXuVdRBjqnZl
	 xmc9RraOdeQWUcndTrXqiawMGY/fzSG0Xi8IVehe1n60IJoHHuYM2WrlNF/Uc6sV4lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383542;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oEFqOh0M05wzKjp9Y/Se6tBM5Fn4hx4zrs5F4eHMNfA=;
	b=uSmVYL3Ik+Wk1LAtZ7qj5YLmragpHxGlLjv1a9k19rVqYkQ9sXg7MKg1UtJrLFUQuIuD
	 R9MXRmd7PLLpCq6CypJbERFyUk9SIsk4c/PYbUpr/P6FZa6xhB1b+LubxPF2aeMyXmtbe
	 JltFmCWyVN+9sfMLlKPgTJg43jXFnYKUGN0qwA9OCJZc8R3Qivso8MInZyfTdRLJYlyU0
	 UGViKDcqLcW6zQQ87PXMRoqBgCX7W32IFALO80aIZSI8wgnavNOm5EoaF1zzm3MWH1jSZ
	 DuwI7ifrP7d4jRNhjl69q+jYZGNXSvdAAIpNUfzsj3b8Nmk0opXAqvoDG66Vi1GILww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mT0BuTVy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KjWXhBbD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887C860A2604
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 887C860A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mT0BuTVy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KjWXhBbD
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB6Z9Y9581042
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oEFqOh0M05w
	zKjp9Y/Se6tBM5Fn4hx4zrs5F4eHMNfA=; b=mT0BuTVy4WWHfQjSRTF2fMOfqMf
	ATYK3Rsi+JumQpF9rPC146zjB3snKw6WWBWMExp7U+2r+F9CCaG1Tn0/VH74yI25
	m4EEz7Pk4Vn7taem/rX3uJlY0DDOhn0Y+jr2/4GlmebZKk91uPS9j/NIOLMYi6vo
	Nc1MDQA+1qye8cZTRgb9mx1ULgdmpoLQsNT3PJO7aVVH2iQ9uXZ47OuVGIxpIL0R
	5h28aaXFfj9Yhew4N02ILRuWolWUt3iPhWY2E23q8gTIt9qyfOHywAgUuckOP3NX
	u1/SPFl9HJe99Eus4UX2uM4qVIApPKCTLkGjRV+occRW9J6GIYESG9bz9Iw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7pr93m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:52:20 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a3451ea93so4280559eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 23:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794383540; x=1794988340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oEFqOh0M05wzKjp9Y/Se6tBM5Fn4hx4zrs5F4eHMNfA=;
        b=KjWXhBbD9zgCZBHGTHbnyBVLX/zDirfpsKn5P7OAnN6Ug+LHaGjcRbegtlFBb5lyfq
         a4EFLQKFbHu7K7b0Z64+4baFiIifBTMe46kh8bOPijW1tc9RoHITtZ+S9bdvZygZn26I
         SpErQ2YN8s8eC7a5dqJu+tWnryLyQ4D09ya0IYiIY8sNLVss69Z36YK50KBzzsCAZADl
         MFLop4P7hnkssS83B/i1Ac75GYAKy09Tj0kH+gwjsWScgFhO7c6vdBwpMjH6cj9XucjT
         /gNl6glppGz9sWbnENB4BfR8xyJhayFjVH4F82F8LD5Sz8tlatfevms8QbV87K9Nj8ej
         6TLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383540; x=1794988340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oEFqOh0M05wzKjp9Y/Se6tBM5Fn4hx4zrs5F4eHMNfA=;
        b=w8DyimI8bCgSEPJNGjSOGeoIKFhmkh/kWX4l1EaR3oOb6MJw0IflATiVojZKg757+L
         7vEdyUlU5yJpOuSRhSO8Qxt0Vuba8R/c8GQujKJgPrUE0qJVlMwBK5twp338k1vhTrqm
         kV8+Wmqaei9RfyOIlRL78W4qW7Yx0WF4NGff+bVl/D2LVf8ok6k5hs8WWQO8NGI0IQNr
         QmGT9fYrSWNPHhHxFyWiOjP421+F6Hh1sApmq076fxKkKpNWrm4TOWXUWmJLXkJGVRcH
         ia6pRibDLJJK6Isou5ZdzDVOkegnDnryhGz36+0PnQd726akWRbSt0Q6d6TiIkldATNJ
         dEhQ==
X-Forwarded-Encrypted: i=1; AL+hErEfZxPsdc6CVO29l0dwsRLUOe96fTW4KGel1/ga1tzCLb0a5dJgDyNmvQm5MDIxTdnriaBmo26A5TEhXSeD@vger.kernel.org
X-Gm-Message-State: APuU4Z/7y1kgvSJ2nXgEJjKE+KIy/B/YrDilqXEXPCKQIeF4DW7BXptb
	UO9JUCeeo0iY0jUaRQQ+tXquyF05AKBrtyR2DjpnbbeZCBWV6E+X+d5/QLebpUOFx5APN7dXuWg
	yWD5HEqjRK1/X/4hCEZphPdwv90aMELWVG81XPgyZXCHTN0iEYtgcxhD8ZQTLDffIqnoD
X-Gm-Gg: AYBFou2h7kZj4BKyvt0QygvmZEwoh5WQKFKcgVsxaY8pBQAQugLY8b1em/NgeFPXHQZ
	KE+QgUE49rf9YDmTCebYM1GLVgqQ8MPnljc16pEsKiGlkPTZKoM9W7uj8JVqxs4WK7CYEdnEDW3
	Kl/BdR76GIi4DV8YSA2E8nhtskN4zEfBpT7v+HOuQA9aNhf2kW7chGp7vFukG7qyE2aYyepLvnr
	XgPYnU8WQF0F6Ksusew2phVUU1QKnKmDzx1oS9thMRD4u65SESR9SoSlr359W6zixnNObmi7Ukn
	TYnA3LJLgwTRja6dpzzJH0WA7HnOOuEU2onD98Cw3h//mlrwW6VOThh28ZI4ZAmT5VktmhrxGp7
	5YqQUlqLEGp7s8ocacaDAprTLvyd/TebxWeiQRTlae5MIv63OFK6kJeXsIaPLOmiG67zFgf0Y2X
	7lcJolGUDkxaKyO9ILkyBsk7J7MJxyrL4Z
X-Received: by 2002:a05:7301:430c:b0:351:7e5d:2de9 with SMTP id 5a478bee46e88-37683189067mr2300253eec.1.1794383540202;
        Tue, 10 Nov 2026 23:52:20 -0800 (PST)
X-Received: by 2002:a05:7301:430c:b0:351:7e5d:2de9 with SMTP id 5a478bee46e88-37683189067mr2300214eec.1.1794383539509;
        Tue, 10 Nov 2026 23:52:19 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-377531d3287sm187032eec.0.2026.11.10.23.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:52:19 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 5/7] arm64: dts: qcom: nord-ride-embedded: Add WCN7850 Bluetooth support
Date: Wed, 11 Nov 2026 15:51:39 +0800
Message-ID: <20261111075141.3710366-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
References: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX8zJwn2oJ7ldy
 O1gbfA/X9zkaIMliioziuFFuiuLavJWmf+j2ltO2WAhiolpD2VTm0v4D0vgKPOPvXPIrH1kPYim
 AUU3kWaDXR5H+pPNl7kfUiD66OfdaJQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX7+RMpsVlpVtc
 B8xxYdePFmdJ398YNrJl6ZNLG80fQo5oYp2hPvyzs5wJtdrL0Fm+2NnzwKtGNMS4uDU39apiJ4K
 deisytcdLBWC1iJFkvQ/DgmwrTzakEGZi+kR7pTC9cfRUxjtEpGLrq78kZM58CQWZZ/QPxZjBCz
 ZrXhKo6m5OIYcpWDsZ2M8awwswpzZi/dfdERLOVJRw207M3T7yxjiZWlCfT6SluP2Pi/SQLNKcl
 E/eX/Sq3eJQW6Va/k+lR9VlNt6eAN3mp1QUYTtHx1j8JPrPpAO62N1bnd/tnRN3nBeFHyuE4Gv3
 w/uqlWgcC43lvPrmfKVwdiZgKViomOtEM2qDT9eKY0C1xXNBaU6v/LnOlCTsvDCARO62TZkNX6j
 3t9fQPDS8MeG1QByOz8OjYgKBOT9bqKwtL/Q54KpThg5JTaYUwRagWY8qy6Y6NsRE158yCyqdyG
 I4jHqAzIsusYKE/ObJA==
X-Proofpoint-GUID: ju7QAwiyWhKNq1GMO6ocC1j8BHwTe_Ul
X-Proofpoint-ORIG-GUID: ju7QAwiyWhKNq1GMO6ocC1j8BHwTe_Ul
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af41eb4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=zbc3kRkrEr7k9oJ_x3gA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110031

From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>

The WCN7850 module on the connectivity adapter card exposes its HCI
interface on UART17, and BT_EN is routed to pmau0102_e GPIO9.

Hook that GPIO up to the WCN7850 PMU, enable uart17 as serial1, and
describe the Bluetooth controller consuming the PMU outputs.

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index a9adbbd75878..3f764069bf1b 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
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
@@ -583,6 +585,23 @@ &uart15 {
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

