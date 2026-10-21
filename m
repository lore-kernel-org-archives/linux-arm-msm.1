Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792549900;
	b=EXg3VMUUxAhyTEvBGIrPEOYOEl8eSWboCf+f4/BpfK4TihzpX00yeD6d9/8ns9qoLWcf
	 885s0eij3uq/jKtVNB9h2HTdNna7dT5ZQlge5SYI2ipsc3j3PzvBG7JkEUaSWaZr9SVt4
	 JLw8kjx/3eDLaP562Nti7xq1yaAnKJECzAJyGKStcwQ2RyJR0Z1JL1kVSxwEyeadAKaae
	 gBAbKM/0S+BtpAY+ICvAD7YogTlw529kYMLOGpgdbTSAChj96QwI0TQcg3s2RVf61OM96
	 hEE7zgmiRSCGeul9y5C0MBYQKHlYNjc6idaMlVrrbEZDDFILAPQVqBV3nL09DNJa4SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792549900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IPf7L65c7m++ph0yay7QXokNG5R3RgcbIuZvJZ5kiCg=;
	b=qfP2Si1bXDMC0HzRR7evDVY1Pwv+YkLDh+rNIZLIOytCl8Si73DdxWajKmLbMgGCbVcJ
	 saE7Dmqzyr5pNCrTYvoU9yr6M/Rv1ZHar6WbQO10LL2BHQiOgTacBfAYFWFCy+54UfoZa
	 hXnh4DdnRkLAN+KIIVB3BdfslPuKROdezYQeESHZo4d2QMEL+2cqohk2hdz0xoiaASEjE
	 RQH6dClYoWtCvaH0VdG8o4jaHSOb4hVX5acsVpxUvx7bJTuc6LdM5WIbpixdKbYIbsfFC
	 yuPfaOhy0rDAvYfu9IyUTXCcjBcJJCjonGP7m8EvwRMeCsQnswJISAWX0/bAkY2Lm1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MyGxdhF+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DV18kUxX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20686606A319
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20686606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MyGxdhF+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DV18kUxX
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2FEgN3906651
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IPf7L65c7m+
	+ph0yay7QXokNG5R3RgcbIuZvJZ5kiCg=; b=MyGxdhF+osJcze3FTvgc7H3l8SW
	2fjo0VMd6xBtn5a1GtgOf5QFJQbE01LybwCVu2uQYDClZo7uODH/UuSQU4Xr6Pel
	jBIYY9aIVNtHpZq3iwpc4O4k4uV+Rpb/MYKo/c97mMt3v/0O5Sx65ADytrgW5KxZ
	pgCb0J1iQEDqTkRspCLCoCUrGFVmlunvNqLNjgD4Xuz0YTpG0ySB1HbhV7ykcFQh
	0nLIF6kxkWp5KUlt1Rur07CStr9DVsApVbUwAsfDCoAt6nm4ytS9sZ9BuOvzyds+
	jblu0gCpD47J3ibV+fGPwtt5LTWOAzghSXfMouiCsVyk+elsagtOruf0XZw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs00rqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:31:39 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3510d0baf63so508407eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 19:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792549898; x=1793154698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IPf7L65c7m++ph0yay7QXokNG5R3RgcbIuZvJZ5kiCg=;
        b=DV18kUxXX0CVQlv3cdTh2tRxZZsxRxR1UEsRsnJlWUwVLjy55FyxU3jNDyHhXSMMro
         77+Ds4wqQkNgQnuesAuo/mXIs1jmV26VRjb+hW/zutDiAiDVwpzXoFoAmofGNcxJw1y3
         ui6zeJi01XHKxx0Nzm7BsCYP/NKQ6AYUxYHoMsvp0lGaKjLgKKLzDpvAZvpJyfPFgRpX
         ChAM9NotBZoFbPJh2X7mU8kmho3PKcL1aEJXqfb0NGRnjUyz1Ln+J7qwt7lVLWp+VjVb
         3aA1SRVXFNBWrCPpe6/Kni7PyhcXf5UhmuGlGmHGiWnctSidylHnzi606JZYkPv7vRG4
         I0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792549898; x=1793154698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IPf7L65c7m++ph0yay7QXokNG5R3RgcbIuZvJZ5kiCg=;
        b=R9M8CWjO9MPWz1PtLaM+APQwXyynjp9CmM9ur/fHHfLe22bP20YNWmcxkgbbvqNr1P
         qvVyNASGUXOFhSV34bZkY5UeFEDq3wfoFcbCFurrqI5l6R2iT6fhwWu4vm4Nh2zbatmf
         qLaOlgYFZAf/1VLGZRM6A/uZWGVDt0cW90zqRkxjSyiGp0L6dLtPwEXXKuMT7JXqhA2h
         2svoBtz+PQF/JrxNMvEAdu/SFFko91z2Eo43GOQIBRjAfBhI9RXQF9tXg/vWV8DDk9E1
         QYcRgIT4y9DE06cTGzzGiITwNtWpfJNq+DAh1q8wIgJ7ef2tEN+I91cC7nR9k3EtDOAP
         iPkg==
X-Forwarded-Encrypted: i=1; AKwUvBynJmppR72oKrXFsm0wtht/g1nvpkzajgKths/f5aW85UwqEUnrcIGm/qGNxwC2JByOtTpl9dxKMgS+NFAa@vger.kernel.org
X-Gm-Message-State: AFq9FYJcs5YGIQYY1kcmLWJiA0THarSZ0vH9hZcYDT4rCVbwHtB9BojW
	v3gyxqlivpG05dimbKW7LRRWy2OdVdep+oVYQyGxRYLYzSjJmGNYPa75q1AveLPHJICqYT1uHms
	q9HawucU0kYrMDmFbnjNjf1+IMV6s6/ktKbHb4scHk4Wf8hhF6raiW8/XT9Ac27hFuvil
X-Gm-Gg: AYBFou0sQa6DgxpMKhDx6yr6HpuBMc0+Iw3bnwEHpPWwZ4zMKyLeLoqdzLFSzyVBrdR
	LAEv5krHKSsADIw5hYjLm1HFBW8NMwB389QhLn4aKL8pvKCUKruYcK8lMuo/bc7fUdt0Rz7831Y
	i2mNWuqiea7K9JNHnaQLl5xhNtYyzvXHYXEt0CjDOGFeQpigplhzGsnk01gBxI372VnfIjArnD0
	QI+mVG0F8pUUZBspYO0gdyzVNVExNPs0JXfO882kbnXc4abfPEjnGGP4CXqwiT2888EZu6eLrbX
	VmpMyATayHPv/TdXiXG/01DNk0fdCKOdLZ90YVJ/x8DWjEeoG+zm0ZFKYshkAgS0iMjEXsVaFrt
	vM/e8xZKW7B9MyAvKisetOSKIggK5lV8A+cmHgZul4Jz7WdfnY9SAHJ+tcWo=
X-Received: by 2002:a05:7022:b054:10b0:166:847c:f162 with SMTP id a92af1059eb24-190a8a84d84mr934692c88.45.1792549897935;
        Tue, 20 Oct 2026 19:31:37 -0700 (PDT)
X-Received: by 2002:a05:7022:b054:10b0:166:847c:f162 with SMTP id a92af1059eb24-190a8a84d84mr934602c88.45.1792549895958;
        Tue, 20 Oct 2026 19:31:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm2395108c88.22.2026.10.20.19.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:31:35 -0700 (PDT)
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
Subject: [PATCH RFC v3 5/5] arm64: dts: qcom: nord-ride-embedded: Add WCN7850 Bluetooth support
Date: Wed, 21 Oct 2026 10:29:20 +0800
Message-ID: <20261021022921.2053957-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com>
References: <20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8240b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=zbc3kRkrEr7k9oJ_x3gA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAwOSBTYWx0ZWRfXxiawF3r/Wy05
 giu+0IQK5OuYoCgg7kvBp8uqHiC/7GfqMarHPRlPKcQDEEZb4125D7aJk0FOezQPfdqhCMm5+/Y
 DBlmb4EZcpAMb9TXLXwIZv73ml94aPbgypp4Q0NL6e6R2z8SytrjUmv3Mf+65Yp3Wsri1OOtYUb
 MaHaT8pIdBztpIxRhRoeMFf+p2xz2goYlA08KcsxNzFuA55VjilM9GMYmBBEP1vW0eUGIWogIg5
 iBkaAW0QpId/dRACx5uJJMkIG/8sdj2ujJFiKwKg4ESsbJV+wnHTh7ppz94Md9qU9vjJw2u89sk
 S/mjRxOXSNn12iEGgWcGFWa+1Nv6mk2I8iVe58RHM16BTh5JEkTQufR6LjKU2npRqxwR3n7VNRY
 7Z05Z23kdb58xHxCuAszBZ5GeKLlZK3+7mVZOvRijgGXvoOHSoU4wS7ho4ZLXwEj5vUcmefwnIv
 +Kr/qgTYfYGUl04CqKw==
X-Proofpoint-ORIG-GUID: QVvmw6n1FBahWXXEWwziPWBWLbvs15pK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAwOSBTYWx0ZWRfXw48evKI5e3Dd
 7Wg1wDETETmfSP6wGd46MuyM0GUbCRzJOwqz1gZVzdHsd1PXGktK6svI3I1PUs8XrKE+X0f+ZQN
 NLYB/cO4yWprgw1ytXONF8iKUGlDLj4=
X-Proofpoint-GUID: QVvmw6n1FBahWXXEWwziPWBWLbvs15pK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210009

From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>

The WCN7850 module on the connectivity adapter card exposes its HCI
interface on UART17, and BT_EN is routed to pmau0102_e GPIO9.

Hook that GPIO up to the WCN7850 PMU, enable uart17 as serial1, and
describe the Bluetooth controller consuming the PMU outputs.

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 916f583b882a..6dc405ed7ef5 100644
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

