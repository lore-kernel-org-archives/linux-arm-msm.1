Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20B049C4BB
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 13:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354221; cv=none; b=EeKLRcctOol9Knxl1AxL+9SHj7PaNHytTjdrxnKu53J1WD2OLZnoR1BdpASICLKXqjAQ1C64A7g+HZ5+o8n+/C3aqge3PysgbM4NS69rACyLKc3a/e4cQWgp5LNPgV/xw0DIL9wGffW5q2zMPjeYDZajioOrY8fpbigx8h4EqrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354221; c=relaxed/simple;
	bh=G0hw/pezIlFMRhmrAIQvb2RbWY4suDlV/OtR8kK7ktA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mXI86VmD2dch1OCEGUyFw9hUUMyTfEPCfC8BWlzhc9BfYmPhUG51LFwU8UUaXS8gUn36Br1iZMS3v5sbo8HnEld6dL5kEhMA2q9qSklciwGHIMhpBtuBddyX/cH9/bk1u0i5coW62+ThZcXE1c+ntZJkcyywW0ZdMTXGPgo3zuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VmL9jYrH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AQl2Wrwd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VmL9jYrH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AQl2Wrwd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CRJXR1491371
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 13:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nkx9v1DF+Zw7it7PU+0H3Z4Av/8FoowJS7IAu7u2yc8=; b=VmL9jYrHvfl8wqk8
	D1B45ze0zrmlx2+vSz7eFAq+aNNbIQrwMGgmNUQafvQvsRCFeoANQX/Ocz00IAc4
	8GZ2/SV2FelOKLFCEQjx76ryndQW2aAr6vVNvA21rS8yENcc02A5FeD/wpX7lQPp
	uXbBvxxnp/X5P/cwTGsIrptwrpeomsSHTFqbWdog1ucjT3xggnFXytDQiu6EMwiI
	Np72QiGQt5QAWebvHetj2CSExlgPZ/H5fUouQqqmKAFJ+q3+GdUzxrO8vqtBx/Yj
	HCA8axqq+Dqvm5B3MQUly7PB5dSfRCkIU7NBeLY+uACEHHitdbJS5ewWFhSA74bR
	ng3FFg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geb56291c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 13:03:38 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7530aaa7212so24386137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 06:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788354218; x=1788959018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nkx9v1DF+Zw7it7PU+0H3Z4Av/8FoowJS7IAu7u2yc8=;
        b=AQl2WrwdYDI2X0ejp9EzHrZhjAGpj5sxVCX1be+qyskGVFfjLyEsrIrSWI9zftEANC
         wB7F8k56QriJQQl++H+Bqh7kRx5wB49cTw6SzZX98AxLzeHIEccBfihttGbN13BNUszy
         yPHDqRg2q0kQRr9HE08tuDJqLnG9++ZitN6wFB/ul8Zbs4X37l0GYs010Tae793gQ3pd
         rKm/oixsT5KzJ5sc3g0kYL6POE0kkTG4PHApQZLE82EPl5pveXQe2cWCdXHfFYymzhic
         ybQZoNO/lDe+wS+jARUIAOEk0Uq++9PIfjZ/X7ogrtCowjVBSiXYa9NgQBgBZLae+xkw
         97TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788354218; x=1788959018;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nkx9v1DF+Zw7it7PU+0H3Z4Av/8FoowJS7IAu7u2yc8=;
        b=q5DC9R10Nynbscl2uRmxHuZipGVCNX9kW06X5VG+6s7LLeBQj6dRI8+3SBhGGJ6dHT
         /bmSpXvfsQmMePimkI3mIqXPdIMrUzCtgTuG5JGfTwLmjtObgSBNsJVXty4FUyAILfZw
         iDwfe6R86U+Ngn6nOXPnAcFvlV80qKF8FiA//yXdCEDtBiSq30rj7dXJCjBpKcneldxc
         w32PsUS3r38Lp9xxSCg6/Et/+YxdpL0I62WEUyl5oDgZvnzuZlYYHHxkXY05hJGTnjit
         rXJNGV8ecBBvg8kmWYsX/38uaAlojFbHJ8gu5wBNpHhAsdMDL8qsmxDsjqgxg3j6Bbik
         7OSg==
X-Gm-Message-State: AFuF++ltPPdS5aRO06NmMlCGs/zCBlev/kAR0/FGIZSPnU4ghSY60F5c
	sOFajuX+jCOIv1gNG8TJumc/N0Pcbpjuihq7ZsZebKyGG0GzioGKGMqSUx77Sg+cmW1ZyZ5Z09d
	6A//2Ev+QMi85dlj/K5W1ZNRaQOjccj8LfaYJ59LQ5ghPaNIsJg3YAasJNLwIvpCn6AI2
X-Gm-Gg: AYBFou3rb/7nQ8x+ynPPDGokJ4rx70uXhvlN5HByo8RwMgj/FXiqZHfSAUA3moDU+BG
	X9UKbmeFHofu9dzVSO/YQPNaOYeUIFILNTNu6cD+Yj+BW6CjDLIQ6AsskykerwzJD66Y2kFofrV
	xF+/45kuXTXFHi6faLvKf2WkZIsqkEgPx81p0291koZd0KMBGDTPig/Lox4LjoAKFAzWuF4d/ts
	YHMXy8WifqmlQ4b2z48MLL752ax4X5hBFlPsaM1GAwAB+rHS8osDRPd4/Q5HQL6h3uMN2PsFD/E
	0WcyDUu3ORFbIGaW4VgV05MWnMRNZrl5WfCv3QkgdV1WMrLvVU9jhXuE6MRtFzZwusyowjOROIn
	KSLjzTNn+Dp6kXq9Uojm8yCUUhoI92aaUDg==
X-Received: by 2002:ac5:c84a:0:b0:5c7:d15b:5f2a with SMTP id 71dfb90a1353d-5c7d2809352mr421653e0c.2.1788354217480;
        Wed, 02 Sep 2026 06:03:37 -0700 (PDT)
X-Received: by 2002:ac5:c84a:0:b0:5c7:d15b:5f2a with SMTP id 71dfb90a1353d-5c7d2809352mr421601e0c.2.1788354216857;
        Wed, 02 Sep 2026 06:03:36 -0700 (PDT)
Received: from [192.168.0.242] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4761dd1sm41932925e9.0.2026.09.02.06.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 06:03:36 -0700 (PDT)
Message-ID: <7eea6a82-6bcf-486d-9c0e-5a68c34c03de@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 15:03:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add MSM8952 tlmm pinctrl driver
To: muzafferkadir@mainlining.org, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260820-msm8952-pinctrl-v2-0-bf2b8b7b379b@mainlining.org>
 <20260820-msm8952-pinctrl-v2-2-bf2b8b7b379b@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-msm8952-pinctrl-v2-2-bf2b8b7b379b@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDExNSBTYWx0ZWRfX5EGXDz0ew7GH
 cRCqgLkTGY/RK1fhtkVImFAOSANH//VXJiaqIMYGOv2y7Ehoz0f6XTt1QO+DFuQiDWtSGUbYtOZ
 osB9BhDh9PWTFubVHfLQXXubSFmG0ewKGckDUfkZwE0182hcAHPPN4PIb9iAUL8KCpN8lKBpAFI
 6tGtggOSPznvM6D8ITagvje/RIxlDLFOr/SSHrDE4gDncBLIELb+B22u5lTAazB2ojd9qxEvR+7
 FMWTeDRUGuIRo9yt60rz/AAddo6pcROsdbeiw/00+toUoYwWVgpSB0rCBGColNloSdY1lLv1vvo
 S+qEd+JX9vr6tK+ZIeJIG2b4YAa4ksCJ8TwIeRJQTKl16liH81efDYkSIHWEgK8JPGUOwvXb8ka
 AxNIloZsP9HL8ZV54ZbMO8b7qnSVMNOO322qiXruyp3lZIALvYDYhmgcSQLmq7SWbVkrE609bBu
 MulXhyp6xVHDwTYW8dg==
X-Proofpoint-GUID: 1cAREB5zUxRh-bBWTtZHyzGYYXLVxi1S
X-Authority-Analysis: v=2.4 cv=D8N37PRj c=1 sm=1 tr=0 ts=6a981eaa cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=OuZLqq7tAAAA:8 a=eYqAknA8CWvG3Flig9cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: 1cAREB5zUxRh-bBWTtZHyzGYYXLVxi1S
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDExNSBTYWx0ZWRfXzVj9fo7SkNiU
 WV3CI0Sr8dO+/3veFPCiKjrJRBsPy95nJ2XzCqn5Mq3SX25RaV/jnTlomCdsmDY3q2Sq6Q73xQZ
 rbuSjv1b7xflsVDEeSfayw65pujJ2Ag=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020115



On 20-Aug-26 13:17, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> MSM8952 has same pin count and similar pinctrl
> functions mostly with msm8917, but some functions use different pins.
> 
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> ---

The following is a review from my AI agent who inspected the
hw specification and prior art/review feedback regarding qcom
pinctrl. I read it and approve of it:


 Hi Muzaffer,

  The driver currently contains function/group declarations which are not connected to any PINGROUP() entry.

  For each item below, add the function to the corresponding GPIO’s PINGROUP() definition:

   Function                GPIO
  ━━━━━━━━━━━━━━━━━━━━━━  ━━━━━━
   mipi_dsi0                  0
  ──────────────────────  ──────
   smb_int                    1
  ──────────────────────  ──────
   qdss_cti_trig_out_b0       2
  ──────────────────────  ──────
   rcm_marker2                3
  ──────────────────────  ──────
   qdss_cti_trig_out_a1       3
  ──────────────────────  ──────
   codec_mad                 13
  ──────────────────────  ──────
   nfc_disable               16
  ──────────────────────  ──────
   nfc_irq                   17
  ──────────────────────  ──────
   flash_strobe              33
  ──────────────────────  ──────
   cam1_standby              35
  ──────────────────────  ──────
   cam1_rst                  36
  ──────────────────────  ──────
   cam2_standby              37
  ──────────────────────  ──────
   cam2_rst                  38
  ──────────────────────  ──────
   webcam_standby            39
  ──────────────────────  ──────
   webcam_rst                40
  ──────────────────────  ──────
   rcm_marker1               41
  ──────────────────────  ──────
   accel_int                 42
  ──────────────────────  ──────
   alsp_int                  43
  ──────────────────────  ──────
   mag_int                   44
  ──────────────────────  ──────
   gyro_int                  45
  ──────────────────────  ──────
   pressure_int              46
  ──────────────────────  ──────
   fp_gpio                   47
  ──────────────────────  ──────
   fp_int                    48
  ──────────────────────  ──────
   us_euro                   63
  ──────────────────────  ──────
   ts_resout                 64
  ──────────────────────  ──────
   ts_sample                 65
  ──────────────────────  ──────
   sdcard_det                67
  ──────────────────────  ──────
   audio_reset               68
  ──────────────────────  ──────
   codec_int1                73
  ──────────────────────  ──────
   codec_int2                74
  ──────────────────────  ──────
   key_volp                  85
  ──────────────────────  ──────
   key_snapshot              86
  ──────────────────────  ──────
   key_focus                 87
  ──────────────────────  ──────
   key_home                  88
  ──────────────────────  ──────
   backlight_en              91
  ──────────────────────  ──────
   lcd_en                    92
  ──────────────────────  ──────
   usbc_irq                  93
  ──────────────────────  ──────
   uim3_ldo                  96
  ──────────────────────  ──────
   wsa_irq                   97

  For example:

  > static const char *const mipi_dsi0_groups[] = { "gpio0" };

  must have a matching mipi_dsi0 entry in the GPIO0 PINGROUP() definition. The same consistency is required for every item in the table. The gpio function is intentionally excluded because it is inserted
  implicitly by the PINGROUP() macro.

  There are also functions missing from the GPIO table. Please add these to the corresponding groups. The final column is the function index from the MSM8952 GPIO mapping:

   Function     GPIO    Function index
  ━━━━━━━━━━━  ━━━━━━  ━━━━━━━━━━━━━━━━
   gp_pdm_2a       7                 4
  ───────────  ──────  ────────────────
   gp_pdm_1b      20                 3
  ───────────  ──────  ────────────────
   gp_pdm_2b      38                 1
  ───────────  ──────  ────────────────
   gp_mn          39                 2
  ───────────  ──────  ────────────────
   gp_pdm_1a      45                 1
  ───────────  ──────  ────────────────
   gp0_clk        46                 1
  ───────────  ──────  ────────────────
   gp1_clk        47                 2
  ───────────  ──────  ────────────────
   gp_pdm_0b      48                 2
  ───────────  ──────  ────────────────
   gp_pdm_0a      66                 3

  Finally, please move:

  > MODULE_DEVICE_TABLE(of, msm8952_pinctrl_of_match);

  immediately after the OF match table, consistent with the other Qualcomm pinctrl drivers.

Best regards,
Konrad
