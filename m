Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678897;
	b=eqa+XD3ADgwK7gMyUB6vtJFz1sBR5Fu51g2iaJRQxPWnn62Own/KsJgYA6KXqmfkg6uR
	 fgpQbrNPP3VLovHjLC/TZrJ6zXyUkPOMK3CzpLWFNhU4g5cyXA0YwqXK4pSWY++GtUV/W
	 oZZOQ+XckuLEeHoZjS2es9jbRq7MgDi9UL1fqJZofPBBViKQTYRxj8x7Hxbc3QbqnMdzu
	 t02MvtftI4jHseQTNGEKpmG7ecLWRsGvV6EqA7B81IyKQvQiOwG+VPD/O8z/vXYOuygte
	 y5xRJedaHfeCuXfNeCdjCrTfALni7eL8RD+MBfshVP7Hk8Igj+Ubo3DvLe9JGKk6N2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678897;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=T9jAmjlpPJzKEesHQGiR1/l1Z0EuOSLOuEzosz2QsKs=;
	b=cfMFKc3qeGy30cu4jhgYqEhMQnhPkCBDdqhjmEPwiQwzpggxxQSzVHR7Vr7OYhCZPSI3
	 6m30PRm/rbc6HguqIyi/WRb9oMrAHDzCjPJNjrVXi7/TUOC+kuCeTgHTnPpvRoMrs1QJf
	 5EJZHgoZECNlMM91DWQDD5pSA7uDo39jFPThgjkPGmZ+T23tUAEPwMPnVFcwAAXjLKqnF
	 RECQQpQa4Lv7ecEZC884H6D+lBkdI8tWy74HoAZoEcVMQsSRM+us4Ojr3TDUcdX4vUKAo
	 ESOsplrCnHfg1W0siReeOoPsb3ew7ZkFaVhZmumYLZHM9Wmx2+EWE0MGQ+u/2B41rZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E4AOo+dk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CSjUWNad;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20465606A89C
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 17:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20465606A89C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E4AOo+dk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CSjUWNad
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEHpNJJ155788
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 17:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T9jAmjlpPJzKEesHQGiR1/l1Z0EuOSLOuEzosz2QsKs=; b=E4AOo+dk9HBpmuCZ
	PCk3NfaPzeok0qV1FH4OUSz93vxqG/od7b6ejpk3HWu+wvReYZ6qR/7g/ZkafhE2
	x9jqvRNVN5NF83HdV8X5v/jrkaAVJXXoJqpUeTU0pNS1YSOltNyGvJvxBXtu9h1f
	hx8/PuxCSn9Byh3bRCkhhE8S0vyZrqzQFC9uLco4GpocjgAevLQSiYWd+xCenFWG
	nanQd3KN9t37qIJ2SuSeNZ5ee34+6qH0FuitvHPhfbd20iYxTfOXG021OW65xkdV
	pK1RbOswUGRern29wfkIwABwIvNM34k48sQ7WdnWlhs/DYVOA3gsV/YjUX7Xi6Ci
	wJ20yQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx1ehb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 17:54:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so506071385a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 09:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794678895; x=1795283695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T9jAmjlpPJzKEesHQGiR1/l1Z0EuOSLOuEzosz2QsKs=;
        b=CSjUWNadyNmpjxmZTM/yUNP3ITznnFQWKBXvz/tKx5Gz+GEiEccxcrkxy97SAoKj26
         Ch+NqLSoCQ5XBxZKFr0d0IunNPD0gdSEW5wZqHFSGC/wXe/wq8Z8FQ/W3/ewdWeJd9Ps
         x/bpZhZrqA++cmjEUqRzHrdYFIE4cPOjtZp+gz009roERVuoOENmtgt2+bXQ1bpwNToE
         PClptPl8aNVZ3OREwkz2JDpv5LHMRn2pEWh2OReb03m2MYr4nJwDsCALIuwqjGKx5O2O
         uZngGVc+NHi2DrAAeYll27KkBKD1mRsJukfhg9Q23wkm0Zhrx/+YbkIKSUA6ygrUD4Ga
         xs5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678895; x=1795283695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T9jAmjlpPJzKEesHQGiR1/l1Z0EuOSLOuEzosz2QsKs=;
        b=zKWiY/Yg1HJCkyxesmBRZux1tv8kftlqT8tRWnnbFekaHk6Fbqk8Ihca8aLKwX2IQh
         +bmcpnh/Z2teKcibSAvW2et5HI8W52hNArFSTZln56jSJbMYTFwravChAjx7sO6UkqB5
         E8c2Pjhuty5bzRlYtu1Kj1GFVMzbyF6g/ueQkPFiVlxrOhlFIJv4a0k5qEBxHaH9N0j9
         eyX9lAluz+mQo0L1sKgdtaSL1iZUdGCWeldLEJ4Dd36cd8mwKOnCpTsDq0g9pS0hNh9K
         1E6885moSBkab4hU5In4qJnnsvNYfqZ5QugoassTMFyEWtj8MCadqrN7DF3KF0QQcQ18
         +ThQ==
X-Gm-Message-State: APuU4Z9p11D7N5bS/iON3BaPcPihpMdEsDHoL+CfTH/HHqWuXZWlP6TD
	/HH8VJe51Oiy9t7vQmQkx52N3Girqn1RNpqkxxIq40EmjjzCcnunKCw/ro7nJ6H+EpV9SkLJnDx
	C26aoM0PYqZcKFtRJpL5RIKvOfm7Pwha44I1icKUTKZ/BtSV9guH5vF7W7zycXwL3NSrC
X-Gm-Gg: AYBFou2WyVazGftt2/4K7I/t0AIWHOzEk5ofp9nIw1suX80WGpv5Oi9YhtLJD2EB5Ux
	X6PSH5ER9k3pIEcaXjronL/GBXxOqUobm7G9ujQX3TATYg8RtedCICIZeKij40GyybndLbT+ANp
	gCcIoTaEUHMwvfMwpz5zjP/I8uGtymNnoFQ8tvneGQQnp4WZwsL6RfeofPdnCpQNgYF2gKjQt0e
	cZ6Qfb9Am+s7L5xtdBtkxH2BD/a2PKXZxlUbETUHA2xhJq9Nt7qiG4KAa5aD+COF2sLavoSu0zm
	dCZeLMQguEN2gnekoPW7WHs7R3HGzu1i7NAb1/abambLrKHOa5qL6fcw8eOYXWyKge94S+kWUyy
	aAF1vpJ2ZRVXzUioLu1grjeB9D4iu7mpFn6kwIfnBj4reaxGGcItCDcdlb7Ec3ae/Ko+0Bg==
X-Received: by 2002:a05:620a:4152:b0:949:6e5f:7395 with SMTP id af79cd13be357-9496e5f7ecemr179562685a.79.1794678895384;
        Sat, 14 Nov 2026 09:54:55 -0800 (PST)
X-Received: by 2002:a05:620a:4152:b0:949:6e5f:7395 with SMTP id af79cd13be357-9496e5f7ecemr179560385a.79.1794678894960;
        Sat, 14 Nov 2026 09:54:54 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c888b90d4sm11060292f8f.9.2026.11.14.09.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:54:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 18:54:37 +0100
Subject: [PATCH v4 2/4] arm64: dts: qcom: msm8996-oneplus: Disable
 disconnected DSI
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
Message-Id: <20261114-display-msm-of-graph-v4-2-b8de044c6c1b@oss.qualcomm.com>
References: <20261114-display-msm-of-graph-v4-0-b8de044c6c1b@oss.qualcomm.com>
In-Reply-To: <20261114-display-msm-of-graph-v4-0-b8de044c6c1b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GCFRCKJTBF0tDduwhG+AEpuoFlapsyUUwKoJTS/2B/I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq+KBiwypVbiB/+sME4U5cLI8rqkqaraxGTw7XS
 AfLuhR49AOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavigYgAKCRDBN2bmhouD
 1wE2D/0bw3W8hvBUayS9i62tP7e+l38ABke7P4J+I+RrzXqTv4qtL2nDYgDgCdSaGdxPJAGDerh
 w2VaQ9FXPoE4vbgVdEnaKxlQmrWVj5T/8SXLJBHqj8lr0y2eUKseeMXf7lpcIsiF/ZY3HWaK8Aq
 YuzazYF/QkL7BHFWp/LmhrAAI88rJ6tg7WIqu8tgpoV60niC0JZ7/65Crz+ob5wgqGQC+wQg7+L
 ZmINWEkF0uGLGqWN5FcnoZiMDBpeeqFRwojEeYLeJXK4Bou7uQGD9EsK6J/qL0yV5tFgzgofyrQ
 ExiJ6q0yYSIGvHEdrM5ickJejK/QM1s7zdw7FnWwVc3WC6qjiMJDcP+OGCJIZr4IUZM4WpyMMay
 WZh8l8eQXdKtOhdjZPLFX6KolLmnThXTztldaiyrNV3CKI5epagPQ1sErtlsXQcuZZMbw4eJ5/B
 w/3e7y0oSekT/4DTdeGkGd25ZjLwsjKo2t03kREhnXdnUWZ+GJQUHYSQjTJLaf/Tbz+SKOFJkNt
 70JiMBzyK0vi9MOMrtD4ew1od/Nt7ffKgEXNUI6F7nkBjx+IYzPx/HjKEmoCuBcudPQB+xHYc+N
 JKX+XCiAiDct136ylo4tPlwzVu3PW+ALvv//ANwlq4G9Awn5SBSFIya9mzbHgynvCuX44RzB9/Q
 PPyp6kzg0WUSvbw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA3MSBTYWx0ZWRfX6gcNZpEvev0Q
 3BqMbgCH3BSS9DvuSw1FsNEC/pFheNMCBmweG/yPsh/2/0AzR3NkigA/DeDUe3IPS4AJV92RyPg
 PyrJp+0KyDw4Vsmm3oe39YzIZHAsdCNjQJboT3Rj8wNzrU2nh4hPMvwo2708EL/bbOmDKA8Dy/f
 mkFU8+R/hRw/Uh8sD0wOsi/dn9drRhFrp2eXGh8nrmVsE6quYR3oRAbJ0QkjNKiYZ6cBephuruT
 NJAHqH/9Bb843HfWw73t7F4C1ES7ZuTa/ShJG9zNpmlZ9A+BGwcNqQCbfvDXniR6CPS614q1UpT
 +CSSIFZto8faLDgjAIHQ2CNZ6fo1/bScR0pidT7/B4OhkaBW8S3rUeA8ZwZDV0ApaeZGNSQ5urP
 fvXG0zHwFoJq6AoUnmgwhhgmhUZ/DW2S1GPQnKIrqFUQm44ty6xv3n9OWv2wqegAGmdDFMD0pDL
 lrUOyVS/rhQsolYsprw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA3MSBTYWx0ZWRfXzAA2z+/Vi2ym
 uxHGyKi6ZDDkAhYHPxMtrDlPq1sD+wk9gES179wpb4/bHm1xurlWuF8r67HQxL4dvaRJynC4pMB
 FMv+XIl2uxXp7Po8wCPF4AuIDiJZCDI=
X-Proofpoint-ORIG-GUID: zDlXJozhWaG0twQD2HsYR9m3e2f0sVRx
X-Proofpoint-GUID: zDlXJozhWaG0twQD2HsYR9m3e2f0sVRx
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6af8a06f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=eMlgcxtRJz0w_Lr9rQYA:9 a=4tUkUnfIpJ8A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140071

MDSS DSI and DSI PHY are useless, when nothing is attached (no panel
description in DTS), thus should be disabled in DTS: no bridge will be
registered and no component device will be bound.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
index 7a3f8afae22d..9c2cef11e7a9 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
@@ -189,7 +189,6 @@ &mdss {
 &mdss_dsi0 {
 	vdda-supply = <&vreg_l2a_1p25>;
 	vcca-supply = <&vreg_l22a_3p0>;
-	status = "okay";
 };
 
 &mdss_dsi0_out {
@@ -198,7 +197,6 @@ &mdss_dsi0_out {
 
 &mdss_dsi0_phy {
 	vcca-supply = <&vreg_l28a_0p925>;
-	status = "okay";
 };
 
 &mmcc {

-- 
2.53.0

