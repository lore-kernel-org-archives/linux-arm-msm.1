Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383551;
	b=glQ7VhEVtfSq7MQCC4MAdTk9OB2ETbsP3d/Ee6/TsNNo1vB0ASGLY7u84QGicNSO/3Jz
	 KX48IDuQRnCOAdpHvwlE2U15JlQlBv2SFTSyxt/aVc3TWL3Y5YAHebYA2sbttv1KDAOs7
	 F8RftlTgSlXiuLg7f7pUUkHXmR1Kl6u2KYa7O0RgfKkT30x/Z8iFlNu4maP0pTklUyDVT
	 aHd/bMhr55PxuvJ3wl+zJR5edXts2upl/GM7dYSlSSYEBlEsefIap10P5QjlQub21fc+i
	 h7HOAk+pOHcySu2AKehaVFcG360e5Wgf4H+mzekulDFNrQ03sfWdYc0hwPuy+W5AJYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383551;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=H1FTmvvuzLSB0xhxVui9xLIa/5Rt4Meo03vMKHS6kVE=;
	b=MYGDOlOf7UiAbiZUecfMDblY2VLtH65qe2/+soJ6Ga7paX6F72rNEQTVlXQM2Nllq//E
	 MjYRYUlhxygvTbi2t0bnrd2K/sp5y0Na1R+qbz1hhODdA6iW3QvQkLt9fzpgu9qkxjVmL
	 /HkpD13NXfyrH0WDBUwe6vwc6Pk8ucSmlDKZT39wLPjCanU2LhJtHZ4HgHehfZKxrRtla
	 Wsho0k92C6MY/UGR+w0+3axKG17FGZAj/astQnOZD6bXsCPlu6qRc20J3dDxRNnpDuHRJ
	 6JDJdo+OyTFoWERP0rhePQFhSWLPpK4UhdsqwyG3KWGxEe+iQ3s/5RuRN0AXlyitXzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MxDw1JwY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gV4BTd2z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7712160A2600
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:52:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7712160A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MxDw1JwY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gV4BTd2z
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KPVC1386446
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=H1FTmvvuzLS
	B0xhxVui9xLIa/5Rt4Meo03vMKHS6kVE=; b=MxDw1JwYm675bIC7xzYAztv9GJi
	g7nkdsaRe0y/7w5AW5CoKQCvV9vUH9LOWO8hjuwgeq9FiTIKox/uckH8Q9SRyaw0
	3azXe9LuExqooW6lH4h2rmL9F9IEUwXaLoOh0R4KuNYLWl/EZRsfqa755DNTncJ9
	jhojylvx+2lIJeNspc5vKbBEcWyUkqZMtT32OD8AqVDoDntuIWs8957jf0XWV9Dy
	DlHS2L2cy5esbNsCjuhUqWmurLzHRKTnuCzGbJMwxUww5pY/fU9/rzhWPIjv4QOM
	nf4oGB6e9DIHeddqYPkYUOwmSnL7CENRbZayqdNBhi2JLpGigXm4mI1rf2w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnm9fv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:52:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so6354391eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 23:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794383549; x=1794988349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H1FTmvvuzLSB0xhxVui9xLIa/5Rt4Meo03vMKHS6kVE=;
        b=gV4BTd2zUV3gALOVSBe0GseCRCGwIxcvQpWb+F28bMZTaBJE1JEYTBftDuXldXYofj
         nPzPgpdqJ50F9w1x4JatPqPybTGTSGMSLiaFGt7k+DuXAtwvHeB3XEtwQp4N6nEqIA4C
         dqTGMLZENgvxyTkX7QTcrFyagVNTHkn7U707dcy0UPAOs3pyTWE5TO87XTatp/Z9lCoj
         B03p9EfBN7oHphzyWBGQKpkzz90eliEM7+srKAGhkbrUoe/f5Rx+wdGD7GTAOZreL0PN
         2YQVwkyP1J6CkzG3K5Qwx+JtzRfS9yI17i269CDipLzwWXcQMhxOs96HV6B12QnUQT67
         AqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383549; x=1794988349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H1FTmvvuzLSB0xhxVui9xLIa/5Rt4Meo03vMKHS6kVE=;
        b=ydd9wjffFrTOuCZCvolhuP8iIp3x2m5XcJOrgBGoJhC0Rr9bjx7JkQGlnsnf/0kaVa
         U1jivAWOUg9MKbdzXczym8vzbSfNMwcQpMVcTEGDk39h18VHiwHrzN6l3FbaGGLfT/s/
         oIjma6RNIGwsPpSDgOul6nBjJ9kApixdJQB3awm6p7nFDMxXQlqFi0m6DRVk/GaGpmdm
         B1vAd2C0GZMenmVAganJaZMNN0Kv9I1uLxZFei5ItYylFC6wqOmOY2A+piQuZpB9QDLX
         5FFOn0kylCvTXp3jlGXXdB1/VGi7QRjRzTlt7cEcPEZjGPm7BRlz4OlnyCGBiAP9pD/3
         Qh1w==
X-Forwarded-Encrypted: i=1; AL+hErHw63j6Okpl1LlY2kEcOmEPjyYqZ9+ruBTys1PU/RN8iNVjDH92NBXcCOuBbdhqAwUiSyEJWYHjhe38sp5b@vger.kernel.org
X-Gm-Message-State: APuU4Z8y8+1LWVtpEFSj6Uyoz0iswM1m5l6y0j50JhYPh5F0SZKc4R2x
	v5WV3Gkpxlnq9u8pY0tocTnjrMTLHm/XktNgJo/xTD5OWtEtrHvRqr5W7iP1eeC1BxKMfqIQTTx
	5tFaUw8e2c7vpm7htCGgw17GGnrONmG7bbF6kjO7fVyU5ho/E1mT5qAYPVy3+LU54AcJE
X-Gm-Gg: AYBFou3xtUbBDWaHhCbmIj7/al24Oh747T4MCv0lWVJn+E36wzKhMzK8paHpuM7xNk1
	qAwUKsda+KBPt8zHPN74NRaQMdk/ohHjAkg2Fn6aqqBfN3McUixzpfYhKMR4Md70Wz2yQXG/l/G
	Ald8WJzVYW12kj0SCW/Ox/IIsYuxRriSS1UzPvOf+935ZX4criS7+OA7RrhoEAW2/4kQ5QavuLt
	cCAlQNSaAzeBUguwwfjA8lMwVDCi1mM8cAq5EZgi1kvsG3bpqYrJpaNlYbE+kdCUnwWjk4X4h1c
	ZhNyK6oCN1NUmNB8HSDMWoAbR07btKlA5kWtpAPZebCnOOtpWIdGaDXh7iMXWIcR7YrZHIx8VsL
	o37xWdLGRjuNvSqIoyhdFdlt9IxcWzloMFZYXF/JAjDRhrxWJ0F0BRV8CPsX4FnrXP9yaewoMlN
	RWuWnQmLKqYHjgDvTAgIvlsRHXAF2D16t4
X-Received: by 2002:a05:693c:88c5:20b0:369:daea:812a with SMTP id 5a478bee46e88-3768694df2fmr2222292eec.30.1794383549142;
        Tue, 10 Nov 2026 23:52:29 -0800 (PST)
X-Received: by 2002:a05:693c:88c5:20b0:369:daea:812a with SMTP id 5a478bee46e88-3768694df2fmr2222243eec.30.1794383548209;
        Tue, 10 Nov 2026 23:52:28 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-377531d3287sm187032eec.0.2026.11.10.23.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:52:27 -0800 (PST)
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 7/7] arm64: dts: qcom: nord-rrd: Add WCN7850 Bluetooth support
Date: Wed, 11 Nov 2026 15:51:41 +0800
Message-ID: <20261111075141.3710366-8-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 5ieEZwdyHtEu-xnP1ZRSb87ClKvdMRtl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX4krNNUHvlWye
 izdOpXEyWvG7o8KtJ4EjzROchu0ZpDyOUSrcyQ9UOSREo4o36nlghsAGHCgYfCxMBgLcWMXJGnc
 ZAKsT8WZLLip2fLSO08ZJNrouLi+5W4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfXxikM+osO75oR
 IlTK0JPPNGCVwfmLdfjad4KbmR/DzXF6DMC8w1hjUchesHxn3iqDGnj7lZEUOp+2txd30RjI6re
 XkEVO/R2YhlQ35cyLXt2xX+ckbZ7YGXMyZPDA+nzrmDHz9JqhuFI7L3q6oGKFGEy99cIcKfeSim
 qv7PSj+4Zs3hWYTEE7S1Mg8F/ptifWBVZXEPw/uMmGWXqcvQMAtbiSb+K0gsvHNlEy2RYdYoFMK
 DvyNm0gZynlm6cBaB/RarzwpuHP+ub76aNaC3dBFIAcY9OZGh0BbOpfgrB0G+U0AtWO/Lj3O7EF
 /qYprSZfeWV+I9tC1/fLLCxNebKd5YCeEV1kWdGkgptkeMHA0jKhNzO/H1h7sBeS2HADApuKc00
 rt+o18N8w3DsEQcUBy1NWLf+CaQ0JIX0oCsVbOqS/+NtWMaFjSpMpuVaF7eP61Eurl0e6xBPPxu
 /Z9n1iwpHh2p0ld1qIQ==
X-Proofpoint-GUID: 5ieEZwdyHtEu-xnP1ZRSb87ClKvdMRtl
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af41ebe cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=grFeI82b2oVWyHTUkKAA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110031

From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>

Enable Bluetooth for the WCN7850 module on the Nord RRD: route the
BT UART (uart17) as serial1, add the bt-enable GPIO (pmau0102_e GPIO9)
to the WCN7850 PMU and describe the bluetooth node with its supplies.

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
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

