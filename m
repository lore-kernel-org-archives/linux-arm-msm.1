Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810520;
	b=eCUVo90KoR4F391/S2Cb5sk0cwMk9LRMD6HiGJlwWVF4OSboDmByUSYK/qbKSY58ALsI
	 /yX5T1zwLlydaVqZTw0C6GTBV6NuNSOq0aC4dHBQTkdqNdHRMRARG+MGQv7TqSrZHsUOt
	 Sa79UtFX5XBO93Hti84l4cK0509o2KpfaEQ0e6i/ccdzwdT9vEbnZEqiFV17Pyr+MfnJo
	 7OP9G1RsYdTDwhd+DQ04+RVHNj+3mOvgVwfTLXXnHCkAaaKkGjFIlg+8yFGwDSv4JAv2R
	 z386QM8vMcL6N9SE3ExuKLJGnhgvFvocweesqqzqJXk2GHTss7IGvkZrhw/OZl598XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810520;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Y38/cgs0IXFwvCCxp54d00JDAtVXdn4TENZYiDeVtV4=;
	b=skxrLgq05MhxsPl1y4cwv1Cvvcyxm7aHi3unkFcm5ic0+Y3mRiVY6UVq1pW0v5gpYf1F
	 9mwyV77uI46YHMUc+r86mugTEScp+GvTUuKHoFOLN/RiXxN8gbPsOhDCQOExkVEhcl4O1
	 3g9SDLYJrN+ejjx/ITM+wHq4AIjjCFO7BrQ8ahBKgT008EVhCc86cyMVObBbtgzu6VrsI
	 o1tLFOILLQvfcMbw2wkm9yqQNuF/s7OEnlBaIDpKsQj/HMz+rP47W2SMSYWWMyxCwUjdA
	 0rSDdg3t/0SDtG99IquMdTdNhtRQAmZIVBhiD5lr4ZSyXyvAVp6V3ZN+VrRgnBeqQQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hohA/HTT";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=awbFHGYX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B1E606A323
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 06:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36B1E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hohA/HTT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=awbFHGYX
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5M4Pv3177722
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 06:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y38/cgs0IXFwvCCxp54d00JDAtVXdn4TENZYiDeVtV4=; b=hohA/HTT/gEVRy8O
	yiBC1lblRlVc9X0hGjmSTrDD8E15JMqfl9sgNhBkwrTtHpwJPoooTUVMdAQL00qk
	ITc4ejlRtZpSvfo62xwmXXCR00fikXna53E/DIPgxrKPC0sbys6cmt5kwfKH2YDu
	3f1wZROjcbkbdzV5fWpiH2fvynSrexO3ypmBlMGrNA7cEP+idAMt5vzXIK6eKads
	duFBXOwiZG3tQXZHPMaCi7LEJWH5TKrvxnQfa7QkAnG4TF2+oJqc6w97QgXZROWd
	BgfGC8x+K1d0rrjs9zXDjpNcpYQ9WZJi58m2GORPS1Kg02fWhbMSEHiYBfefu/Uw
	19veoA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmcd2qb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 06:28:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso3435876a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 22:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794810519; x=1795415319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y38/cgs0IXFwvCCxp54d00JDAtVXdn4TENZYiDeVtV4=;
        b=awbFHGYX4rRO1SFd23H6VsDQvNMWat4muwxM9lujKRUKZJo72tHOj7jBJX2uKPzrJo
         v1gdZfUW66poxUbkF9qmPXvKbEtJ6sHWTZxU1WhiIXobt2TsyhjFx5qXJ2S7vNQSrAgB
         ARG8zn26m7hQADYtj8IE3XDP5MGoVWgg6XcEMM/hINADwTBkLV07pve03O0soTqblLOA
         upFy4IMwyH2dS7naCc961ynwt1W9Eobi/YdEUWDmO/1qUZGDnNRssGnBvEwwtw3z/Qcd
         mSnwWczamn8t74r9tE0/iOhg2uH9Dc8YtUiR9S0jXDVgZsC1txPpz2R03jgvB8khaQFA
         Tnzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810519; x=1795415319;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y38/cgs0IXFwvCCxp54d00JDAtVXdn4TENZYiDeVtV4=;
        b=BprF1CNqgZH5ClYnkm/Dddeccdq3Zb764piuFCxU5YUd2hWv7P6ip+kHPwb0MfFPlq
         9SsBzIAiQiAHCSRycP0h0Kcdzjbx+dZrOOqcKfeo4AVGYQIBKnAVG9HGyiafhyRuSFef
         w3EEd7JYXv30mgaimYXmesJEisSC2M52yGDYVrF+BoI/vNO4eT70XXQIN+Cg4GZSNVR3
         t+6NE4EL5fTIlFXVlep7EbLKFoKpq+b9fVDzpqw7Qnffm7oQ4yi8LU3pHaTtCLaJMaPS
         iQKiPKksifa6xlYL2kPPiDYcZ7h5uwj+W80HBAfxo5JhGqZhJ+maJWohgn1gseIb6ufE
         qcEg==
X-Gm-Message-State: APuU4Z+4DypxE5L38WkfpVywL4/8hYz7MkX3Jp6tY3QTgN3Ic708PRok
	ZFXZYoL1yAu9WURaViyF4RRaGYhoQHuHEJadDClGFvH8WHzeHLzcGMp01od9HjCi/Hk3BLN8T9W
	QDe/+DKIy7/WqPJQHZZ9HOWRw3GgF41VZ3qSUD/1kDiuw/Ph32upnUjcCx1WD99CM+0Tb+Z0vVb
	S3
X-Gm-Gg: AYBFou12U8pUaOIuog5ymMlTVQfObmXfvEeKkfpvLRkTPmCBtEac2Pwv0QB0CPnIPaS
	2t2kuffMLO49YI3sHJ3ECxb3V4geyydXgGQo7paueEl8B6wojRb8WK0edeyU8p7qLtyvEmC6Otu
	M4Rgqu9s7+mUxYpkriDAAo+kunu6bkFdpX3sJYySgMObH99+00klBT1GFELY/TMbOk8JQ99dOre
	2qkvIAA1Ss6lvpzLx3osNebUeEBcazX2u210e6cNfvo8tOkzEysoFhVrrqL4xRsRFCMbGTFJDMT
	ZVQBvr7SneTFLgcswXA7zOLyl1L2W8+xdmWjD3fYrwdK1OshEQDIpQH+OVqcxjxQtDkDYoaMw4A
	cSescqDr55dfw84bf83HuZ9ps8d9t9+eyix1oVcaT6Rva42u/vaCjRoqQ+V+f4GIiP/YBHUETXz
	BCoug=
X-Received: by 2002:a05:6a21:4847:b0:3f9:c909:ff6c with SMTP id adf61e73a8af0-3f9c90a14ffmr3773262637.13.1794810518620;
        Sun, 15 Nov 2026 22:28:38 -0800 (PST)
X-Received: by 2002:a05:6a21:4847:b0:3f9:c909:ff6c with SMTP id adf61e73a8af0-3f9c90a14ffmr3773237637.13.1794810518081;
        Sun, 15 Nov 2026 22:28:38 -0800 (PST)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bececce013sm3370713b3a.6.2026.11.15.22.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 22:28:37 -0800 (PST)
Message-ID: <5355782d-8ea7-412f-9b90-886ad995633e@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 11:58:32 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Enable the Inline Crypto Engine
 for SDHC
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261109-enable-ice-sdcc-for-lemans-v1-1-1f25debeea49@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20261109-enable-ice-sdcc-for-lemans-v1-1-1f25debeea49@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNSBTYWx0ZWRfX3cfW5tzsHz9T
 jIGri5Ub3NEYqgOXRKH7BbnG4VPplVKjPimOjE1nOepVNwlO/05Zi5kXyWECBLLyzry5UxsVVQD
 IZhh9bOjKu9Mf9iUOT6TM9xokoWNOMc=
X-Proofpoint-ORIG-GUID: t0VeAtTb5Ra17nw9hpRTUjA0KI76eIOo
X-Proofpoint-GUID: t0VeAtTb5Ra17nw9hpRTUjA0KI76eIOo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNSBTYWx0ZWRfXzk/lweISW5ZI
 6ltWwEJplFz7HZNS9MhToaOYPIkYh0vSqNxhzOpx6AWL0D00WNnGcEZf60RDcR+WH7KtDYS+mwF
 0kwY8DKh2xQIHLnIgJhwQhA8qpL+NmQNRKCg+Wat9Z839CQdRDOhLe5K5p16zQWng9uGA0uQuWr
 KepMEhAkVMMnQCRm7Em/7bFVsB0N8IjRJ9lDgQqEh2v3xfAYVfEY5j1i3yOGUrpJ7QVZFAO42gZ
 +UuOJQd2QXHFkT2rZRQdU8k/jDA1IUgxJbZXm0wGVy2P8uxwQkGzW6voIKJNKFDcXYY6UVbM5Xb
 UFUDkdT1LWFK2WCXP/G1GY29k8LGnHMPr7p/VarwiBs5WiHkln9u40hMaUzDB8TUddxsdoFne2R
 Azw8j1yYkhYxXXhf75L4Q0Uxf2dVkdxI72PdyHkqaTQ5ofj7NtfzEDs383rmon+rCX9Dzx4oMV0
 5gpo4YTKrsrZDQb1h0A==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6afaa297 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mGBdCwITC7C827Q3XjIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160025

On 09-11-2026 14:29, Abhinaba Rakshit wrote:
> Add an ICE node to LeMans SoC description and enable it by adding a
> phandle to the SDHC node.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
> This patchseries enables Inline Crypto Engine for LeMans platform
> for SDHC storage.
> 
> Testing:
> * dtbs_check.
> * Validated on LeMans-evk with custom Mezzanine board for SDHC support.
> 
> Dependencies
> ============
> 
> [1] Enable ICE clock scaling
>     https://lore.kernel.org/all/20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com/
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 1fdb72fa5518446ba2ea582e8362e86bba75c379..dfd41b613523fb85eb122488e0562447f7228e61 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -4327,6 +4327,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  			qcom,dll-config = <0x0007642c>;
>  			qcom,ddr-config = <0x80040868>;
>  
> +			qcom,ice = <&sdhc_ice>;
> +
>  			status = "disabled";
>  
>  			sdhc_opp_table: opp-table {
> @@ -4348,6 +4350,33 @@ opp-384000000 {
>  			};
>  		};
>  
> +		sdhc_ice: crypto@87c8000 {
> +			compatible = "qcom,sa8775p-inline-crypto-engine",
> +				     "qcom,inline-crypto-engine";
> +			reg = <0x0 0x087c8000 0x0 0x18000>;
> +			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
> +				 <&gcc GCC_SDCC1_AHB_CLK>;
> +			clock-names = "core",
> +				      "iface";
> +			power-domains = <&rpmhpd SA8775P_CX>;
> +
> +			operating-points-v2 = <&ice_mmc_opp_table>;

Can we follow same pattern(sdhc_ice_opp_table) as following in other
patches in dependent series?
https://lore.kernel.org/all/20260824-enable-ice-clock-scaling-v12-4-09271f583dc6@oss.qualcomm.com/

-- 
Regards
Kuldeep

