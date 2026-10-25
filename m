Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792915462;
	b=FU6oUIpaWX/wjnhe2F1+yBay6A5xvuRDJxefKHGDAp19v/YAwgvsmrlZm0vkVdHrkW/4
	 2t071PNXAh1/3mcWCi7/G/SQuIn+73/oWUSBVnsdfw/G8A1UVjsL7fiWwSK2cdP52Kr75
	 +PsGzLXk2XOP4AyEWhcs+PTQOI+MI6MAroifWDR5EqA5CZ8l3kMfqk6t6/BEhzGXMZqNd
	 6JosDvAb16w/SpMPBo1X/by24JnigmjQxt0QYZMoh3tSqFkTYSYMncTbEZo1zDExVW7f6
	 CDmM+0ACODusrH/Rt9/W3d1q8P8hvwG3WmqvsU9AIKt0BEr+NpV9jI8zwr2s0nSnpQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792915462;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=J2GYP2bcjwkDFqHNWYeEbSfUF0yw4ds3/hBpHNxwQcQ=;
	b=tn7baV7RPSXXe83YSNkUgVIUBhGKoaVf7ijg1bdXhYDwdn34NOb9MUMy3fm1BMoSdOKk
	 UqZfVLyxp9dcf4dVZQUhC/ySYFDX81n4+whCcL8K5DLgvgQOEuW9Jr9CA2RfD1usSwWN3
	 Mb97Akd12wTG51x0RxuJfoHUNwTrBFxrYgZY7qEubZph4CHibHzbtoNLqWEbckx0yXjbm
	 YZAqLO56csYeAnsNNMTZBTnQM12JHQwTO7sgEgQptfvj3YJTxbZCq1h4pq9SAUjaQda2t
	 ugSWoae4W2Rpmnov36AzDe4aGHaJDsnCBSIRcTWJP1Ed2O2bjL2esbDE1Otxv2/WgGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NJsNFwIv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=er3Yn1AW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DA9606A31A
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 08:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1DA9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NJsNFwIv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=er3Yn1AW
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P4tBTP3029350
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 08:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=J2GYP2bcjwkDFqHNWYeEbS
	fUF0yw4ds3/hBpHNxwQcQ=; b=NJsNFwIvZCC8q+/4u7GRZPZeidXn80wkq0fbT8
	vK+JuOVTc0huhKggjOtFPlRikAOA+lERIHnC8gPLVhUzFETvh0WUeSl8ni7QbORi
	0zbWEZB/52H2hxKd+GSoAdFOtASj9WvgAfMUA1PIXzMD8lA4NkZhAOh+ZIRmd9vM
	ihtJF8vvD8d8uDkQI12rMOm/ZAe37PY4BNvoTlglsL1cAmlCr49kaNSU+sqaN2rd
	HcUstI7vkGhEVWS7Hqj6lURi8rp7ufdn3SahPYe2FF2zGvKSPovlp6g9/nF5Jcun
	khE+T6KobsV6ISna1YjdNmU7K4Ou+0hp7DfT1Q3YnBAf8V4Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgnehjkw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 08:04:20 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3425098ae4bso4293848eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 01:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792915460; x=1793520260; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J2GYP2bcjwkDFqHNWYeEbSfUF0yw4ds3/hBpHNxwQcQ=;
        b=er3Yn1AWOEJkllMHTH8RtyBdoBMXV0Bl8rlD7te9zLkFY7MvtDg18Lrc53z7OY3ZQp
         3Ol+lpsNtZ4Ne0DcBNolXThRNyxrqgqNMP2Qy4/NOIwIgWmKX7tyULhB7mWRI0wXJ6rA
         y0SUDUC5Y6Xm3T/7/xF5mAWejbKTYqGwMir81NhvS+aKuiMEPRMeCiN3oKu42X47gDH5
         dGligSvArBdzo2eTqCtiZ2RxyZCAdcVQCuB2fKSMlMSq7igBUCpUPXHm13+G5gufNlVL
         1KsnzEeHg/4G8iWwbh4lkFzkUKVgZ/ClUQhR/nTKiL53qJEOt74FA205wYakR4kvhS07
         DDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792915460; x=1793520260;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=J2GYP2bcjwkDFqHNWYeEbSfUF0yw4ds3/hBpHNxwQcQ=;
        b=I9QWeCtU/LSiIkaaZ9zBZlulIT5qaGcdZ6MZDuhYkRHSvRUFzGqOZ8a+wrRikYwKMm
         OERgX5fn5DTKtjApBVvzeZ2c21RdewBjsadjVwlyaBxDPSH09tnsh9y137p2CRaLdows
         s+3XZT0RBN/vkxHPRQ0ySLkHYg3Kg7V1bypmzy0CqXGHVzp+AnN21qOtv5BLx9fMsyfQ
         FnzepUrlPWFsXjuw7dHgipyvgDfbtMEoYadrVHl6650m6HQuQfRKcErXPzQpaLxZ99T4
         QIj3u1bb6UJPrcWn/SnNxTtNAjvjiNDLYxfWnzgzB4KmRuJc7JA8hvQjA7+NEMlNI6df
         7cdA==
X-Gm-Message-State: AFq9FYKVuz6FkCL2XNlMHs5b9tTZsKITUbWoJOmZD7h4czPRSizS6Zbg
	cq0cVF9O1VtlFaNsCzI7cMtYHe0ghJWu7Kr4jZT/gvXw3Y6twuKffkHhGV536fGrSWOEAvxB9Y+
	TFP8vA+uIUSCbRRdEjCRT5fHBHwmHLjwXhIq0QgOxXN/30XMIuFZXKM/JfbK5HHEMAvCe
X-Gm-Gg: AYBFou2ViMVsjSJ94Mr2vrpsRdBImRFb8299ay9BQqU9OUqYX94nRBKqWPZ/4ACU5uS
	1u4OllcRgeBD16R10YSKapHT+GIyNdA98MQF43+wZ0TkGFcv/ZCOwHTV1lcL/o2XMdJoeamHeZk
	zBkf/DfOG7W0N4WOgw6PnqGFLZ0N7tdqhMlYlIUV6gC6zAUtqUAq/fj3997spu3SQXwQj4+NuVM
	xQfkqPzy3PHi7Z69XFKdY0AKRonq2SBt4AiHwjkVDoMTRC2CgPDj4gUzIbLOrj6dOHffDLFv1D4
	d51YsbOx5TAFYCYwf+qoOXgwaI4WnnrLORGO0Zbtq30ppxJweCfT2w0irO5fTkOTrMuUTjXLMmV
	GSwdHCF5uVEO8nSurLEG2HlE8SFZg
X-Received: by 2002:a05:7022:51e:b0:14e:d0ba:75af with SMTP id a92af1059eb24-1994d8b728amr7883415c88.6.1792915460142;
        Sun, 25 Oct 2026 01:04:20 -0700 (PDT)
X-Received: by 2002:a05:7022:51e:b0:14e:d0ba:75af with SMTP id a92af1059eb24-1994d8b728amr7883373c88.6.1792915459531;
        Sun, 25 Oct 2026 01:04:19 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f81ea9sm16147303c88.11.2026.10.25.01.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 01:04:19 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Sun, 25 Oct 2026 13:33:05 +0530
Subject: [PATCH v2] arm64: dts: qcom: shikra: Raise CPU critical trips
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
Message-Id: <20261025-shikra_crit_trip-v2-1-79e429cb9350@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALi33WoC/32NUQ6CMBBEr0L22xJaCQW/vIchpK1FNgrFXSQa0
 rtbOYA/k7xJ5s0G7Ak9wynbgPyKjGFKoA4ZuMFMNy/wmhhUoaqiUaXgAe9kOke4dAvhLLSR0lp
 bVVZLSLOZfI/vXXlpEw/IS6DP/rDKX/tHtkohhT4Wrqx70zS1Pwfm/PkyDxfGMU8BbYzxC42wM
 Wi3AAAA
X-Change-ID: 20260924-shikra_crit_trip-7a11bbb66b71
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792915455; l=2686;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=9NEPErxMm60dBJueiQOlAK4w2gncG77hGo4ML1LQSLc=;
 b=TwY+vI+fG86BiToPOGX0DYO2gXUwEYF0FyBZuKKlAOgItrGWJo2ZyfcSaN8NPJYed0sgnBU5E
 /iOoXBmP3UqAoAn8pIzdogWSUN3UUi0Xltcnx3wRaL2ibpBUYDL8Ff4
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAzMSBTYWx0ZWRfX6k2zCmBCc7cw
 +dEf2MrJVg8Zr9TMBWC5W9SxhHWmAkgSs8uFiT6z1UkncyMySO/XI+BdVqMR5K26VMJytLoIUs1
 Kciw/jsfI70NATooJCobzU0ZwXaLGCQ=
X-Proofpoint-ORIG-GUID: c-nFIm5aiOyBVSgEq2LH6AzxL8AAuWRG
X-Authority-Analysis: v=2.4 cv=d5tgWhjE c=1 sm=1 tr=0 ts=6addb805 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jog98iChi2leUUf6YfEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAzMSBTYWx0ZWRfX//UYZioJSPEr
 xhggY1qmWVIPgQSw1tNJ4rMU77uVysZConxje4LV+8p6eajrJpQLWFE/WC37IqLSnGi9d6jUOG5
 Y/nitvFnh3sl/w4q1fe63XhQWOvjVsgv7CjMxeXQn2qs7QU32lvR5KtSxXsvgBmtdfuHqodsECh
 8dfuVGHgxa3ep/p2sngwwXfnfuGoW+TcrwOgd+dbQhnRKnSxpeYCBhtp7MDQlTaLWuleXF81SLx
 FQ/6lE1rsawpSshWN0EgkgQfUPK2coFIPG4CpF1Buaq2upZBj1KmloPBvlWDC0Zh/lXu8T9IEBb
 zKVgCWEpoIZoTrEbWYmD9tLbbuWf+aHWA655CoOUyZamgu4ESm9ACYXsVOxXfrpcZRGCmME9CfK
 wK0O3VsNpXIx6V0RtgmK/IA8OZKCXEQ814CG+OGTm7oLIJwAe8SMagTb5HF+C9qqB7TNTqWycqY
 zYdEJbLRyvBKXPouatA==
X-Proofpoint-GUID: c-nFIm5aiOyBVSgEq2LH6AzxL8AAuWRG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250031

Shikra firmware starts CPU thermal mitigation at 115 C and also
handles the 117 C threshold, while hardware shutdown is at 120 C. A
Linux critical trip at 115 C overlaps the beginning of firmware
mitigation and can shut the system down before firmware has had a
chance to complete its thermal sequence.

Raise the CPU and CPUSS critical trips to 118 C instead. This keeps a
Linux graceful shutdown path before the hardware cutoff while allowing
the firmware mitigation range to run first. Leave the hot trips,
non-CPU critical trips and GPUSS passive cooling map unchanged.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
Changes in v2:
- Move critical support at 118. (Abel)
- Link to v1: https://lore.kernel.org/r/20260924-shikra_crit_trip-v1-1-730c48fa998e@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index c1f06f692f66..c4e1b78e2673 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -3756,7 +3756,7 @@ trip-point0 {
 				};
 
 				cpu00-critical {
-					temperature = <115000>;
+					temperature = <118000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -3774,7 +3774,7 @@ trip-point0 {
 				};
 
 				cpu01-critical {
-					temperature = <115000>;
+					temperature = <118000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -3792,7 +3792,7 @@ trip-point0 {
 				};
 
 				cpu10-critical {
-					temperature = <115000>;
+					temperature = <118000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -3810,7 +3810,7 @@ trip-point0 {
 				};
 
 				cpu11-critical {
-					temperature = <115000>;
+					temperature = <118000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -3828,7 +3828,7 @@ trip-point0 {
 				};
 
 				cpuss0-critical {
-					temperature = <115000>;
+					temperature = <118000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -3968,7 +3968,7 @@ trip-point0 {
 				};
 
 				cpu02-critical {
-					temperature = <115000>;
+					temperature = <118000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -3986,7 +3986,7 @@ trip-point0 {
 				};
 
 				cpuss1-critical {
-					temperature = <115000>;
+					temperature = <118000>;
 					hysteresis = <0>;
 					type = "critical";
 				};

---
base-commit: 3d7783543c2646af69ad65825e810060494bea21
change-id: 20260924-shikra_crit_trip-7a11bbb66b71

Best regards,
-- 
Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

