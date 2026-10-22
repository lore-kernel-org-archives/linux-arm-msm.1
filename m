Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656305;
	b=2eUgxHGT0kgqsSJaSTkWcqTaguimxgGGyzZpAqBjnsQFKFznj1STGkpYsoziXMrRuwqk
	 o4DABgHRsdCp/Fxn+Cdz6+878b+yPKtxFO+9c83fKfqgE/KxgDJviuwqsDeqeMVV/Ruxi
	 ZyWfJ8NTWq+CCAgUb1dxjvQlDDF1P49d1BO5oSA1Z2vJfafwcm3b7vaNRCBA+0ZZhmrIV
	 rE1r/bNToUfICAR4VNPe2NwEA1vMbABanv8VtCo9/Lk4xj7GHve1+2SDef9nKWsqcq3TD
	 5IX5HFx30jRk07tomgOw8a4/hMQiURKYNdtf5KAD0f9G6pR/crUMWGTvXqRsGSwOUUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656305;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PZB4BubJt0rXp4l0BXgNtCvwouqVWJOCf63irxkG5Nk=;
	b=dpBkh9Lbi91ykVGwzOBdGHZch1VxjlL7GsETg41d697WcwM9nwREJGvnklkRhNuEoh7C
	 OD52kz24WAA01k0/G1oX3asqRLSFbPHSPmb8m3KbliuGqC6ZUXDhGts/5A+0cZeFNpN+9
	 AN2wRE/m9YG/JMv+IDvxSAo6pNA9jEhZZM7NuKkz2cIfQgnNFUhBo4a+LPonGE2XLCKIk
	 SUC07MlqqcZFPqrC5HtwX2gWebV87pQMvXBoCGuk7QTfjx84252dqUDjofzFGUd4Jrakn
	 en3nZUfiZD9GRtPl5YwBvdFjEwc+Ck8Ya/hzyPVrpW2Ge98wNX9zzDJasBgpCUQfFbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQOhDfF3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TUtwjJoK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC988606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:05:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC988606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQOhDfF3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TUtwjJoK
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M701u02714299
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PZB4BubJt0rXp4l0BXgNtCvwouqVWJOCf63irxkG5Nk=; b=cQOhDfF3r36vj4kQ
	xjVtHletR+j6W9y+iv7K1etgu5d5VhhTBr7ehV2hi7fnaB15JDWRewYPUnXPrgjd
	i4s2CyAnp94GdXmwIKjaeyR004RAWANKoe0azq35ZSo8ygzHUCJpxF1pDMG6koXp
	W/weUD6pa0mywBn0pFPUsUctpIXz/Nm4/a5FRJDusNpAJgF+z4DrPBCnFrfCHEPE
	LDofoMC9sbjelgpn2m58YJnTEpn6ZYwf8UGgpsrPMvwOi3ci9fsbmlYaA22dlYkx
	LfUlckblKMZlS4FFcb+BM5ZSmASur1h8AQXGs/jzlxyrnZ7Tfs0ELnB57r1fTpKn
	6cQ77w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsbq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:05:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93df7a9466bso17556485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 01:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656303; x=1793261103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PZB4BubJt0rXp4l0BXgNtCvwouqVWJOCf63irxkG5Nk=;
        b=TUtwjJoKXpRqR+koG0tBr3W2QDfYkYxTtxCqtdVlzcJrRRoRo/wqtT0yLVsV47qgCv
         zV/LwUEDeBcCPKv6zO2z2ws7ccgaMQsPxv31chzg45q+/3ohEoUvyXXzT83psqo/sZG6
         rIX+5hCrKpwcMN9vvwSSx3hZ9rpJa5/CYAQr+5Kmha6NJpAlJlfylG0zZ2KN+1AyFpQ4
         zgWs5Sf30jZaCSlrpmhs0moBPP/ElMUKRkbVr65FS6SdhssNsJ5QPVwP7KDnoADgCs5B
         SfLiQ7ItGkTMsSN6bVyBc755XIbaibS9oGpy37PbfTBa8VoSTmGSq722DCX2Bl6jJEs4
         W/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656303; x=1793261103;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PZB4BubJt0rXp4l0BXgNtCvwouqVWJOCf63irxkG5Nk=;
        b=Y2WOm5pEAQ5Cf1T08Xc4JvVAqA20YeMBlyq4Pgow5yz2C57TA7e3oYICiNwtXJRfw8
         zGtNdaJBpdCrnBo743a/dmiH6tc2J7ofYyLSRpqZXf/yPcsP4tGeOsdtBMcn+HfPct91
         7kUYtzJDggpy0863ZJ06OfBGwSyuJN5j+47eJI4rvvunz3Fek8GLz75iH+BkBurb0xsr
         9Z8Mc/aLLpmzR75ize7GrgjfyzWLvaJoriJQvYi3bLLdPAthWY4ZqbUmrsQZSqU9QQdB
         I1p5OCn9oxy8TQoGZXZPFK9COctKTcQLgnsCdrCcJ+/Zwg4dIbDeNGVd7gOa69iZEGBk
         yxDg==
X-Gm-Message-State: AFq9FYKYAdvL4UeV24MaIye2wr5Vp+Nb0UbrRlGs61Mq0dMzrc2p9CIR
	eoM5ZFio1AGRxBPR+cIBYKnGxikFuG7BfQi/Dwpiiphu3EZPs4n4eUYqLnSSk0xCkdLkPOqZAMJ
	fcgEf570dAL7ZHo559+TPLhSvB9WGbQlUFAwmLHU+bNeXuePH2li0h0veJJl7X0spduNu
X-Gm-Gg: AYBFou20tS8zRfB+xduHG78xZ1Dh0DpIh6dP+XX5VtZdwKL1i+9d88S8enQJoe762Ac
	QKe/TRcWZ2bSVowyBZ21+6vq2oexFHRV0dTyH4EExjwUequQYMikiW3NfTW9JXMtnswYYBDAsCd
	+wcjCDzzHTPSUZR3DIOb5xrZHy9kvb/foW8BD9I6Zu1mAUiCYYi5tP44aAi0zb2eexWR3JhZsqW
	2XRD1+90Hxhq76sploGUd+iOF/q1E0M0pbqS24flXDmF7mjJ4SUvoIN8UECjdCpdMAvkAwB5Whu
	0dDRPlvbOPmyuCIMIvv6zKarn9qG4h4zYcEZ7JX/whp366BIFpAzPUD4Xd3YGYsvPU4zb9wHgVO
	baK3+sumnL7KyDkjwAFJPcw==
X-Received: by 2002:a05:620a:1a15:b0:939:c7d1:7471 with SMTP id af79cd13be357-93f57f7036dmr932520985a.4.1792656303051;
        Thu, 22 Oct 2026 01:05:03 -0700 (PDT)
X-Received: by 2002:a05:620a:1a15:b0:939:c7d1:7471 with SMTP id af79cd13be357-93f57f7036dmr932515785a.4.1792656302652;
        Thu, 22 Oct 2026 01:05:02 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a610a92sm76425466b.80.2026.10.22.01.04.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:05:01 -0700 (PDT)
Message-ID: <b4737aa6-02e0-4554-91d3-4d63710037ae@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:04:58 +0200
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
Subject: Re: [PATCH 1/6] arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD HDMI
 bridge support
To: anand.tiwari@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-1-585caa39cd7c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-1-585caa39cd7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6dDTFejTm9b0JHGb2zzCouErndJP9Wya
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX535urrKeLpeI
 /UCOrjTrqVhk80bVAdp1CVUWA5njxDUekssrLwX+hpnGXpx195wT66FWHU9cy+1W42scl4sEEbv
 /BWgjKPLyiqq4lKeE87L0TWrSLNL2HW3chBXIFcnPCvB89+5r+DMAnrvOL2pU72z07C5O40Crrs
 HjS3ooejPTKBCwqg1A4t4Q0RzQsvI4YsLmbMhmaumAB10C/112zThyVyHSgQ8kpba/3rG45ETYH
 f0B7/6KHy4EomETq8suFNahlauveIYmtewV0QBOxiGh0F7pQo0OsrZ0dIcz+k2XgInbCQvPI09z
 2F5qXHSQtrSrDxYZHzKzCQVdm24ySiJQoEPsezbe4red7YNPvUZSO7cxOBdfR/qIjmrCqiGA/BA
 EGiv+V032CIDbfzX2I4Kr3GWUaQ8Fcw1rhLCOVKOH6l3BYORY83tid5LsmZ5xA/gWAnCGRyf9JL
 8DWtFTfZv40SH45mrBw==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ad9c3af cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=kz7q-GqAsz_10McoYYEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX/k8ii7R1+Svv
 kMPQsVufSjYJDyLs2UfLK65O5qVJqu6T41iGDq3hBl8HAtM8iHxfXPWE5McvP8Kwh4Ve4loCXqR
 1TjIMLEpwBKTALSRZag/kx/wQQeBkZM=
X-Proofpoint-ORIG-GUID: 6dDTFejTm9b0JHGb2zzCouErndJP9Wya
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220032

On 10/21/26 5:17 PM, anand.tiwari@oss.qualcomm.com wrote:
> From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> 
> Add support for the Lontium LT9611UXD DSI-to-HDMI bridge, enabled by
> default on the Talos Lyra EVK base board DT, to provide HDMI output
> on the DSI0_B2B connector on the carrier card.

[...]

> +	vreg_disp_3p3: regulator-disp-3p3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_disp_3p3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&tlmm 3 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		pinctrl-0 = <&lcd_bias_en>;
> +		pinctrl-names = "default";
> +	};
> +
> +};

Stray \n above

Otherwise looks good

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
