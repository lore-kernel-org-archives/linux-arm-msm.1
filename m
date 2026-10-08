Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9599F48640B
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 09:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450900; cv=none; b=L4TbOysilmLquQEKUeSKnkMaZWF+EnUvQQVr96T2YxGofzmk7d0DvEVi5grq/KsZhMP+RJaN+XcVf3CpPTdYVZlGU/FY8xr3e3NQWlRi3HksUEFSJt99LSfRN31FZL1ZzR+KLeN1cgNPXG588+ogjYFu5PmOsm/EqNCVQYx/fi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450900; c=relaxed/simple;
	bh=EZNzhw66TQKS3/ys7hB9X72wHLID8eW7VocBG9jNpBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KKyJrw7Uk/MyMj8Yv3LR9p/qz6624TDoDzmx+zfuQtB+VQ1aKMiG0j634DcHIxmM84gOxNSY+qfXAlwUWrLx5IZdBQadDxXO8rF/GGzg3VuEF3etgf8heTdZ99hqxC3pJXUvI91MxUuq6O6nCPK7hu7tXxJFikkoS/OupjU0D1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bofeOqO/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SWmbjucm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bofeOqO/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SWmbjucm"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K92C1574579
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 09:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vWw27EvAoHyMo7PLPdhTJ3G2tiw8E/kIhA2dZUt1o8A=; b=bofeOqO/hGNSL97e
	JqgYiJlN17/Njy/+PMtAgZdQYqIHphi9QcZp0kqSn+jYSAjKTaeGPB+puvD+U8l5
	R0NZHMGGPvXZuSwKCsjURFyshgPd9HMfZdwx1Qtq60RYmrhGPLCgJDwTjJOt9HNo
	qu7XDeNbLOiLEjrzHAeWIrwOinEBLdcEr8w2XptewjPxtTuayCr9tJD4Wsw0hAp2
	Su6y1PWzqhDIWNY3u1UDZ8sNXK21d3/YD3f9dUJXvgYmiSpESjM4YmKvPIAlhBEc
	H4YLPFhb/fVoR0qNshmOqB2q0ZlpSBL4iyLLbAfE7B2KJJA6IJUscaZ2mdMsS8ph
	KO/aKQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe524wj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 09:14:53 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-143826c4a13so3910753c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 02:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450893; x=1792055693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vWw27EvAoHyMo7PLPdhTJ3G2tiw8E/kIhA2dZUt1o8A=;
        b=SWmbjucmgPSidkA0dXn8RP+MyJDr81ZaoLvAKIYX0GLwj32hqslDuEYHPHdoQdVRxG
         SzvQxLeCbC4LwmZAJsU3r6C7T7rfkNm1WdkNHm34eBYLmnkEmZCy7r74EUQS9XDaIUqA
         vqrjEFtCCyQgr3cw+XzQzFtFcccSfyXj4ea+qmv0hNtL93oXfLHynYFpyLMilpsjKXRX
         56TgyihrHgE8tDjCtXahjWzWWqhutpzsXcrxlfITk5Y4H/kxWov/psqWPcME7Oz7eHA3
         QWI8zZ06aZ4kz30w/12znJgOZ6JlfrkWyRyreLfFrs3Of25+INhGTSWEt5ExN41lsQyM
         q7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450893; x=1792055693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vWw27EvAoHyMo7PLPdhTJ3G2tiw8E/kIhA2dZUt1o8A=;
        b=rCk7lk7elghl4rfa+z1orZ8OpnEoH0Ti3olImChYCu42bWa8lTSMl25dDJRFnJFduG
         kZMl6FYYvxXdcLV4hNPc0RIQS++mVi3atCgzlsPVqwhBEB2odMMkpW1BV/Fwv3fj4bMl
         7OIOS6+/ayqGAX3RvjN5O05xQXUFyjvZ2hJMGAWOJr1/V6ADir182dCwj84Ap2IUCcC9
         Fu/hcypSwSd85b12flB4CLclBjTCnfINbHtIxDQftO7yaoBNstbA7ERNLvgaO1FwEE/j
         v5+/IO2l3UQXp3ZR4cId7dpZQ2q+o/z9QS3QoVAIifJAYXLHM18iKPZmF5dDlyBf/IOr
         gzsQ==
X-Gm-Message-State: AFuF++k9hP/uYKNEBRuLMIsNWygBKhNNVtc6crX7d3YUbZWToiXu/4i5
	uC4HUb4VWKUO2UdlrfO7u/U3rVv53DrEmqrSloNavpGZVXAm0uVAcV+DNikF1HaKyFhcEhgPY5r
	QJS8p4mJjXnYRH9lpAT3ZlpXPl/oGSDohOqcFIF17mVOANTGE+E+OSWnfz5S5/0GvQxQk
X-Gm-Gg: AYBFou2D9VKLCR/Ju+n/aE1/LKCZBWAw6e/eh5J4FuKsK08jNwQqxP5GFrVJ6Tk6DDv
	1zxxNTPCvl2WIeW27Wd6+kUWY2owmOt25QqxbTYY5oYUYNV29QKffehDk2BdP8q7qYJLEBrxssl
	LfQQB1GUiIOS1Q43N2yXRFK1SmW5UlNiaJB7GCuOlWpEzrkd7Sms0UzimfFQGHuU0ahstendUR3
	qkVp6zwTLHL1aZcEloq5lHKAQ5w0X3crVxtJv25JZv6yF1VKBO54+ERlBDadNOcn8bs0RTC9Rjn
	mrxGd+QeBpGmJTKegvI196V6+R0Cfu16i5cbTRHfo2nYtxbF1mzr15Ec19DP8edUeXAlpeZCWIQ
	zhzgqdx+3xeS6Uz/y+AQLWS0BgmoxsA1acFkzhkwtzutmiHsew/PVQY23JkBrZ5OY/OtJPMm+ph
	/39hLpDDFNuFHPDgD/JvAZliX3n7hU
X-Received: by 2002:a05:701b:21ce:b0:144:c123:4036 with SMTP id a92af1059eb24-162074d60e3mr5046909c88.35.1791450892855;
        Thu, 08 Oct 2026 02:14:52 -0700 (PDT)
X-Received: by 2002:a05:701b:21ce:b0:144:c123:4036 with SMTP id a92af1059eb24-162074d60e3mr5046882c88.35.1791450892236;
        Thu, 08 Oct 2026 02:14:52 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm24456045c88.2.2026.10.08.02.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:14:51 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:44:25 +0530
Subject: [PATCH v6 05/11] arm64: dts: qcom: ipq5210: Add C3 CPU idle state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-08-dts-v6-5-f9c4ec8664d8@oss.qualcomm.com>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
In-Reply-To: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: ZqUATCSlfajlsPH_d8F0CS4brUJwZWDJ
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac75f0d cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=LX2C00z4I0v6K8_64uwA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX7jXLMv2Nm6qJ
 DZLztF8vSY7j7hRc8s2sFXk/n1fydq6H24jRNxQY5tuuOC/1Lpu2pVLse0I3tycWfoRureZa5Ai
 QfPnmH9Jkj6rsoq/RNoM6I1TqxTvtCY=
X-Proofpoint-GUID: ZqUATCSlfajlsPH_d8F0CS4brUJwZWDJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX8dLEphCToigK
 OmjmHvIUoJqKTBSa3ZLbBjF2PGIvgpLzVVfg3L+HB71t8BXf3GrFCIgf5EiNAM6tWCAd5TkVFT5
 AAIG3x9k4sUU9KY7mVePB3ecWqdY/Y5+hca6xsk4FJLakFFeseNhu15DDE8+WYM7DX/nvpLIjhQ
 9KPLBwRuQSUB7WWMKPWFiOjqt5FJrDh7YWV/vk/I0AnWSIWssosDi0j2FJQgOonfSy3w4iCPSoi
 sP6IL1wK2ztCkhagPXFGojn5hJ8udfxOXbmQUJnkjEjPovOWx6PIos1vvRNWpq4C07XQzvJTu1h
 e5k9htGon4M20vbf6ZjsNA6tj21TnT/DTZ6cfwtFgKGAiSNaaLkgWksL5HQ/4IVVkfBgo+ACjka
 hnmSFcr9rQoFdWnyz1FKERggvbcKPg7/PlJKDsqYcTSANUKXRT0arPnidcNYpLPf5puEwOcFGDU
 S8/+U0ruqBD+5U32LWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

Add the PSCI-backed C3 idle state for the Cortex-A53 CPUs and wire it to
all CPU nodes.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 3183182d1cc7..331589a9c1ff 100644
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
+			cpu_sleep_0: cpu-sleep-c3 { /* C3 */
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

