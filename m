Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956892;
	b=2eXZvyQw9C2s6yLjnt4zY9E9dzWBg5wtuXszyO5Ys7w9f2KjymumJUVcdS6vvwH2dgon
	 5ny0Ylr73ANP1K4i7ZXWOF2Ah6XQN7Kwn0UdOxtc4+nc4ZsS7nBub1ALAKF0HjgPgaREj
	 g1qqMycx4luyqDkEYIpckO11GnhcSG44AQaIgQ6CcLs1ux0yCyGNCx1Dn6bRSW2QVP+Yh
	 iymz6u2MrqRCwrSgnq34S2dWKbGIByKPOKhNk8U/P+7qQXkwO1+FaKUjMJMQqBTF3nd92
	 SGOzrPQrMNWLUmVmZN3OHmtS3VinuDKUE9wFSdJKIufd1Upfat2xvIILshOnPi75RYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956892;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5BuKvOdVHfG70wKPsTOfM/oNm6cma4tWvmEUhJO1T5k=;
	b=IcPOHTNA3UKrOxvxdra5C3OnZW0tkDtsXduzEzDFaR5Qf4qvsiK1CHbALVj7Go2L3AcS
	 R0/alztbfUVJ8Tq1RNwzFI6rO39Qg1jVmIlitFAxbwmqtEhlQW+y2oyshvbS6+LZ4wyn3
	 YOmWFa3a+6XimVyCc+be3/TzYP8wlkAyB2HKC6Fqi1mXcbYcoHxJcsOOZrRATDsJhIjkl
	 A7lsJRkF5LB6qMNlAYzKNsrCHERcCXpH5QC9snHdam/iqqSyop/gScXdaalz0YAeg164R
	 0TOoch0e2aPhQBTQQ79mwZdYnHacl7ok12uL+qP++ttnJ4FM4qWrcRDJsvCXUdQeJyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SwuUv5yk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kE0SiNMG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1472606D824
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 09:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1472606D824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SwuUv5yk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kE0SiNMG
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R7B93243894
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 09:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5BuKvOdVHfG70wKPsTOfM/oNm6cma4tWvmEUhJO1T5k=; b=SwuUv5ykMMMlZMjy
	ydJlVb02szNBtZaEnxgImAGT74GgneXkq+HNRuow+LRIytTT76CwuzCvipHlWxZh
	qxxO9qfm9LVm9MC/jn6Nii4fwRtOUeUvjjQxKA8KZ0lFGPwedeIK1MM+RJvzAlFN
	NDNOvNFDEu9YTSaFpkvxkBGU6aQL/NUtUrgTwA9+Yf4wzUz4nCApqHftQefHG4v0
	AK1zCbyhlTs+l9p+Tr7tQBErR47fXCybAT4kZqX6no3vMGEvbk936SEHbfT81Usl
	NAhMgX1MC+16zxhM24Z0RjqiWM29KlhPYvmgLcHGfsh49N8gqbnpyN+jnmpv0KGB
	QFOUDQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa21yq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 09:21:31 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so1004391eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 01:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956891; x=1794561691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5BuKvOdVHfG70wKPsTOfM/oNm6cma4tWvmEUhJO1T5k=;
        b=kE0SiNMGN8/u+6FAL2pXtOSIkD2TqxfxNAeLXXqcc4CViKss/gJaB87fp70FtF9OqH
         4B1zZ6JzznI3mC+HttieLDi98lo+pyRc82AQJ3UBvItp2rk6eritG89r1eB/wNWANHXr
         +xPjp6HhWPYoNQJ2LVk4wDY6tUaPfifz/YDyyBz20y20eXSPzN1y0e/d3IiTVjsXVCrW
         ZhD6tgCYlIZ3MUBaNqV+crHqVMTjyxq7BPYgf4Vsmr08bTnb18bN3HrXAc2WDAW18My6
         jA9oVqcxmxRt1hyhFS3eOKc+zuu7vPpZ5x3zdMvsVEIk8JipDCTi5rqCkNw53/3P4Zg5
         DMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956891; x=1794561691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5BuKvOdVHfG70wKPsTOfM/oNm6cma4tWvmEUhJO1T5k=;
        b=KdFO8zxgLfK7v0MPxI62D7cUUlqJkzxH+spz7eme31hQK9DNWjfht8lEqs411UG7Xg
         QNtL7O+MuK+L+snGlRVvRlXKv1WPQSkjTfFzsS0qxNuej62mOdAqNVyRXin4E40lwEqF
         iKiZiPNtcfF8gcC7BuvPjyxWYYVaRocXC9lPb8pgg0S+fu+0S7yOSiyHPf96B5ekwcVQ
         ZXy19QWYcCszAvU/nAl3gj7J+TUVNUJHafEKDCxA2we6PSfCxdDEBTImmVjRPVAWP7wh
         RkH/bJ+L5JUVa2fcAHWjiPN4aQCJXWcLPN6CCEt84GFH3424QgMQkNUj49vjhw174Z0R
         MoqA==
X-Gm-Message-State: APuU4Z/UV5HleiyRsZeTqcBP+GBZFsUqgqjnb2UMxDYrQhmJnhG55MSL
	GU3uq60TJvgBjkW9/BDh2vrVkZxWj+1+x+1F88XIY25UXiphHyGW2Y7ND/NCaLg9CsyxhmEOts9
	mIafz2A7wIwqHEevj5HVpVS+KM0l4Su0/rVBAZPxbkUMPyC9JSKXlXiUlIC4YVpYiRyG8
X-Gm-Gg: AYBFou1e0Y3DsMbfXEvd0Y0Z4STSOlIMvZH0bcoceCQmPYN0vrh668HM+D6TxOdD7V5
	gTdCGnacVLlueHoab4rCXm0NMVGjEkNCOQtLNaY7wYLoa/0i4ydqH0Hfmch3Uz4ngpFbzdRqJUK
	EQwnMrEYOiZud91ThWcYQZdzZT55Gw2OeXihwEytWrljYmp9TH48HwJgbHy+OXgQawNeyeHki8b
	HKnweoE2LcKC+0dsOUxoQwCEqedMAyldl99dKWGmefDfFZZixln3i1tBaFh/39Ibq0XDDcf1//C
	jimVov0FYlmRi4iLIbEE00A1kb3o+m982vXIbMVCJYnHaKEjXEKEO6Z2EP8+Dl+oPo187Y2XSAY
	CqRTVipHgbP6KoGoSU8LARejK48dA7yLeDmSKGTAWEQdyN0KCAbGClpfClddwvuGfjikyidFJzo
	NNw174wxW+yybjFyLi0D68rFjfRbU6sfdVM09xLjH4L/kCVTv5tRmN3KDQ7FZfxDH/4nAq4akSG
	2wI2g==
X-Received: by 2002:a05:7301:4d04:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-36f764286e1mr2526671eec.26.1793956890491;
        Fri, 06 Nov 2026 01:21:30 -0800 (PST)
X-Received: by 2002:a05:7301:4d04:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-36f764286e1mr2526649eec.26.1793956890009;
        Fri, 06 Nov 2026 01:21:30 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:29 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:50:54 +0530
Subject: [PATCH v8 05/11] arm64: dts: qcom: ipq5210: Add C3 CPU idle state
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
Message-Id: <20261106-08-dts-v8-5-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
In-Reply-To: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aed9c1b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=LX2C00z4I0v6K8_64uwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX3H108sgn4PFt
 2A+OW8HS2ujckWdpoOubU9vS2z39qXWh2evWe8j/6FNxCGNprtKEhqkbJyf4rYOuHJgLwy91KnJ
 OD0fpBf2NwIyzdn3H47Si7c4HSYRYog=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfXwThnmF/RkkqS
 fLFlofi/Ub43o4AzzA7Jtv6MQYOmfHxONTeqY6G7VgbGrXgA4p3xilgFh/6sEKCE3hdVfKs9CQg
 0nXVMkGTXs51T2nbKx37A+Z+nbFKD3oiHftYDlY9OeCeYQqR3tb3tuD/J/TlDERk0+XREpd333U
 wdriJdPg5JrZraz0SySsOJnM9Eljy0Sh9/ydXnPkFXw301vwX3w/gXICs+/8R8fVnkpE3O1+hJK
 /c9+iJajnJNnf9qVbwaE4qvMrBuC9aEXuZDiD/yd9KKEBFi6D3otnl336iRn7k+O1lMHv7kr4kQ
 sEI8TO1fM/a9lwmoG2J1g/FHgXQSB3BuS8CWx9e+bV5ExQ6q0yqHoKBDqVlOc5lgmHe7vRclfCy
 8j6AGvzfdw+YWbAGAROSWM9FjcmkeY6Jok9QaXAAYMIXDhjLVyQ3slw5DsFkGRhF3W2M3P84y5r
 hbcDtUN7FdqmLZE0W/g==
X-Proofpoint-GUID: 6sK3LGuUg1MOwiwo_gyuUHv8waz_yYLY
X-Proofpoint-ORIG-GUID: 6sK3LGuUg1MOwiwo_gyuUHv8waz_yYLY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

Add the PSCI-backed C3 idle state for the Cortex-A53 CPUs and wire it to
all CPU nodes.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 81af32af4047..6dfc89903d2f 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -36,6 +36,7 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -47,6 +48,7 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a53";
 			reg = <0x1>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -58,6 +60,7 @@ cpu2: cpu@2 {
 			compatible = "arm,cortex-a53";
 			reg = <0x2>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -69,6 +72,7 @@ cpu3: cpu@3 {
 			compatible = "arm,cortex-a53";
 			reg = <0x3>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -80,6 +84,20 @@ l2_0: l2-cache {
 			cache-level = <2>;
 			cache-unified;
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			cpu_sleep_0: cpu-sleep-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <181>;
+				exit-latency-us = <149>;
+				min-residency-us = <703>;
+				local-timer-stop;
+			};
+		};
 	};
 
 	firmware {

-- 
2.34.1

