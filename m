Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794401006;
	b=UR+jNtB2MiRzXnR7/LZtwq0uRSshjv/OEYmqoNgR5zPrKDYo9G3svjiIUDY1DsP5SBgt
	 J2yB+DvjdJBQnmavXk+EvVzLASwWcDR3UFaVz8vwNh8j1quOSTg4XCc45GO0U7OBEwzWf
	 4Mey866Tj1xW44L6Y5yXfgtOPzmAtndioGL+YKGLhHkYCnEwNFf9JsFHucvMrSAhLgWVg
	 7MXxKvUuiA1NmTcB/s1898lgGE/yL3exBY9VKplONJRIcEueAS4PQbAs7nKNnuNnVUGmA
	 pOBfsSew1UrAHZix0iacCiSNcckr3k7evPGPiTLEP7gWlQQBNYQ/LodCnBLKqZXN2dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401006;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nLyGHp4qcirbe+SZhXZ5P8Yy+rXglhgyVMIGmTp7hZI=;
	b=MQRldhACXgRSZZew6i8wGKbkWU/YiSak1kwtt0Knt5zZtnPVP4Ag1u4066ksLbOTMuZr
	 /cf3gaPl+LpaiOvpbzxcuqI2DebGffime0AKxSSD4f1PUiuV2/dBuU9Uj0Hi8O0lo3U9z
	 YLdCXSLwaPQTw8mti2UHtp9TFHrSuA4UMdLrqBHmy0A/eeAauTtOMi96D4hbOqYNJf7YQ
	 mE3qcS7F054OgoR2danlaaPu+CQ/8agitxeg8NzfIFGTaFHvcvXou189kzT/jD6OcWvXV
	 HFIuMK0TLphOr2+yHl3aUnKCrwogCtiXaa7gUFNswLYgg7RVlri0AQjI1IInguCitYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N0YbEjmQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e7Mpc2Ah;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF4D606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 12:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AF4D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N0YbEjmQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e7Mpc2Ah
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCYvCk2356424
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 12:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nLyGHp4qcirbe+SZhXZ5P8Yy
	+rXglhgyVMIGmTp7hZI=; b=N0YbEjmQBWUJSHllIctgvmge4ehK9Ko+T2ylVKBH
	wyBACIgWfQYeSDeymj2z4uBm84hVKKY0O19Hnyl+CGrbWdskfOVEXjEC44+M5+1J
	gGaR6EVTlxdsizCRtLAi+PAyCzeuTdoUg3SQo6fn58i5IgE2TshkKVtUyKfcohlR
	yfRTYBEMI9VRKEuEsv5MDMfBEAjWFPFRKJxPBJZwbcPcjIU9IBO/AeNyhz7hXfBQ
	mfA0GYDjwF56hGWHKwn8VV6rkArUhQ6BJAXZAes2qnqvpmmbf8CEPxgyu6ZPZZB9
	uhAsS4U6KzjOsWNRvbQgiDAQ0MihOmtOIwsLmV3+cfRRmA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdhurm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 12:43:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so669690985a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 04:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794401004; x=1795005804; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nLyGHp4qcirbe+SZhXZ5P8Yy+rXglhgyVMIGmTp7hZI=;
        b=e7Mpc2AhEvZabwvVArhEa2QJYdhi/WGBTijXTVy3BbzPt/eCBWYs9di0vkY8AFhM7l
         PWDMz23ai2Dev3l0qGBwiwp1J+557X9e+e4aQ+TEPNnvG3Ci0jeEmxBjOMN0KMFQ/y47
         8uxFLFRcKXtIAeNLsOALHJlAHckhWgPbZ6gqdTcRBL0LHmiFwD6PrwvyJNg7rlBIOCOb
         v2wZm0n0x1r8mUngrxBMF6xgbTCsM0tW06uB4AzBRvYu/DKnc50L+nAdYnsyufL/G9In
         AcPnOvtLP/uOeLubFxhdtM0vuYnx5dFq8g31tk71zK/t23rTa+1TzeaKmUAwhFjccrld
         2X/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794401004; x=1795005804;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nLyGHp4qcirbe+SZhXZ5P8Yy+rXglhgyVMIGmTp7hZI=;
        b=gYKEsWcd84dAQTvDNZ6neknF2wsZWME67P48Cjnngw9tuIqzn8wUB15jdKWL+6oCq5
         J29Zk8nElVzX4eOhMLe/tg7XuN0E5O+fDcDubIBDNbpqtTs9TMndNgVzhOft5oeaXLoz
         MZYhBpawM522jXG1D92j5ek35HTgt20Fm1DpeRgUd9TDe9/oUiFG3YO2IJSAKtLOXMOR
         kPJbRQogFTmq8Z4PKWPAzi/vqgq0C57izfQVlEwj7Nq6za/2aSiGtX5BXNLtWFh9ziNV
         h/0unkmIkTyjpOd66pqRs/g4eeYpW9Bx/a/lxwPnMT+hg0qBP/KLZ6+XrGuTCfYcj1L6
         D/wA==
X-Forwarded-Encrypted: i=1; AL+hErHucu0AOwYLDSxh1uQuoog1jw7PdfGVBbI4MH8aPGjjShjOarz1iMurPGcX6T4HTzFVvRl9BrZREv3svFmi@vger.kernel.org
X-Gm-Message-State: APuU4Z8jrjMtsWHzy3zCbakaUn66/Fsy+tKPxRLufIG8vEbWgDxHKprL
	eCdouHV2Nf85R2ZoINtDpRVw93ydV1Nqfs3jVuVIQLcyKI9pp/bl2jCaGuvTzRvwCsal6E61Iny
	wK97m2zCDruTf896o/Mpfe5jLND4byElI6/z2GERsioPPSV3l9AFwAHNzrYDrXG8MonH+
X-Gm-Gg: AYBFou2D05OkTIg8LwisJKI6efjrKwUskCP6UraHKNDm0bw0zAXjtaMtgOvR06VnJIC
	V1iT19Mli0h+UKh7LH5Z+6GI0e/y/uknfmSZx6SNIwwX3wunfPj+n+gCt4xqGVGlrzHp9ffRo24
	IaR5I2z0nB0BUhbdKQ8Ott5h4WSPQ1t/aK7yRinNqxJPGpFQqEX3h59YWoc7uzmznsddPXQ9+ZT
	fGi/tDoznNqYPPpASYFYIhV/ByS8NLsYZumZWspk1gu29CyyBwLbxYK/5ku+V4KnxHsFz+VfRnM
	KCgu+MMwYpjQP3AD9+KhGSuF+RK4o0VUhPwJ/jUbl0XFfCBlSSp2jDeTJKpF/10x441k5HpRT3R
	9mRAI2Mw3didRsmuImcZRjV33KjV+GIKCCpMs0Z5X6Nexl+x5KFvFnfvjiHP9yCgNVDhUpsyKXh
	9fhiXsRK+Offqq2U79sZiBdQ4LdYff+/kI8IkZiiEuCkbIMuS4Lv6Dw9uyY0+J+w==
X-Received: by 2002:a05:620a:3185:b0:939:6dea:374d with SMTP id af79cd13be357-947b00730e6mr343626985a.49.1794401004492;
        Wed, 11 Nov 2026 04:43:24 -0800 (PST)
X-Received: by 2002:a05:620a:3185:b0:939:6dea:374d with SMTP id af79cd13be357-947b00730e6mr343623185a.49.1794401003960;
        Wed, 11 Nov 2026 04:43:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae092629d0sm12242091fa.26.2026.11.11.04.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:43:23 -0800 (PST)
Date: Wed, 11 Nov 2026 14:43:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/7] arm64: dts: qcom: c630: Use LN_BB_CLK2 as the eDP
 bridge reference clock
Message-ID: <t6qm3ktezem4fjeqbo3r3z3ptzjvwlgjuz6kn2sl6z4aj4rkzp@v6mfpglfzixt>
References: <20261111115303.3749380-9-ardb+git@google.com>
 <20261111115303.3749380-11-ardb+git@google.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111115303.3749380-11-ardb+git@google.com>
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af462ed cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=_PC-E5IO6Wh9n2e_leYA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: xHWygLqUEm-o3UH13-_nsbu7G5XRnBtK
X-Proofpoint-GUID: xHWygLqUEm-o3UH13-_nsbu7G5XRnBtK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MCBTYWx0ZWRfX5NOr5mvUNR9K
 +QomuZY3SS1H/Dij5KeV2ZVmr0xnnxtyLQXEr91kAi+DIWyMpHnETU0lxVg1BTMkDUdM+DfbK0+
 xTjEzQF0qnN5DT5+SlK6bSWHX1GRrBlfl4M2udjaeSGB2P338K3WF/NKx3f9Z9lW3MV7wwPs17+
 V8zvw5+73ut3LvGMr1On2v/pXwq5Bl1uV03W9BBoqBj2SjKcLsS1Q2oJYwIq+ljH6R2QFTIXdxi
 HJpeO4lpuRtyBBDvi357pK54nQkdcV1yX8YlZ5l2xQARxRRbfBTWgee9tASMk4j+kYAqXr0ygAX
 izUrL1he30GIKMoCwbuIGq2MlmJJwrYEs+4D+NOfQBvUuL7L0BXam8pNMevy3JtJJKx/zOy+k+B
 swgKBZeyPCynyLOSLg5W0u7RFz9P3msflZ8lRQk43C4t5cDqUmRJTveh/cqF5h8QuSZqQ9LlKgt
 PtAj6WjPhGtYyYq40tA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MCBTYWx0ZWRfX2AjshuCx6OYX
 3zjEDIhkYljJhgGB57gn6HFW5igUy4PuMLOosqnSNrgx8Rny21eP+LTUguOImUP/TTallkBIGkv
 qUwUEaIj3C/9UJ3vj5IWyKUEDu1Ee3o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110050

On Wed, Nov 11, 2026 at 12:53:06PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The SN65DSI86 eDP bridge on the Yoga C630 is described as being clocked by
> an always-on fixed 19.2 MHz reference clock. However, as on the SDM845
> reference design (Cheza), its REFCLK appears to be fed by the LN_BB_CLK2
> output of the PMIC, which also serves as the master clock of the WCD9340
> audio codec.
> 
> As nothing tells Linux that the bridge depends on LN_BB_CLK2, the clock
> only runs when the codec happens to have it enabled, and the WCD934x
> driver only enables it on demand. If the bridge is brought up while
> LN_BB_CLK2 is off or being toggled, e.g., when the display stack probes
> before the codec, or while the codec is being initialized, all AUX
> transfers fail and the DP PLL does not lock, leaving the panel dark:
> 
>   ti_sn65dsi86 10-002c: Can't read lane count (-110); assuming 4
>   ti_sn65dsi86 10-002c: Can't read eDP rev (-110), assuming 1.1
>   ti_sn65dsi86 10-002c: Can't read max rate (-110); assuming 5.4 GHz
>   ti_sn65dsi86 10-002c: DP_PLL_LOCK polling failed (-110)
> 
> So describe the actual clock instead, so that the bridge driver keeps it
> enabled for as long as the bridge is powered up.

According to the schematics the actual clock is a divider clock coming
from the GPIO16 of the PMIC.

> 
> Fixes: 956e9c85f47b ("arm64: dts: qcom: c630: Define eDP bridge and panel")
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> index 9d38ae83c979..a4a573ea7e4a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> @@ -97,13 +97,6 @@ sw_edp_1p2: edp-1p2-regulator {
>  		vin-supply = <&vreg_l2a_1p2>;
>  	};
>  
> -	sn65dsi86_refclk: sn65dsi86-refclk {
> -		compatible = "fixed-clock";
> -		#clock-cells = <0>;
> -
> -		clock-frequency = <19200000>;
> -	};
> -
>  	vph_pwr: regulator-vph-pwr {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vph_pwr";
> @@ -528,7 +521,7 @@ sn65dsi86: bridge@2c {
>  		vpll-supply = <&vreg_l14a_1p88>;
>  		vccio-supply = <&vreg_l14a_1p88>;
>  
> -		clocks = <&sn65dsi86_refclk>;
> +		clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
>  		clock-names = "refclk";
>  
>  		no-hpd;
> -- 
> 2.56.0.611.g1030f0b940-goog
> 

-- 
With best wishes
Dmitry
