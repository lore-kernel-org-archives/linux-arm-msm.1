Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625676;
	b=yJbN4LXaniKiCt3qKt0cT5+hyAbiX8Z3iO215/Cwt2oBlxdPi4FARJX6BaTZPQyuqgvY
	 tJ4to13llDFYrBNTtfk+cOehPpbX3PbzYJ27SvH61R51pVvxviLOkbSndk0N4PVYYR6ZM
	 f0bE0TEB8IF20NZM5DmoH/3EhTpDDXIuulPo56Z0FYNFHmxgvfR9c1NFCZfMFfVw1j/Gx
	 u83tE7T3jvCKQCRDLF3bRNIOB1reC8h9LmEgjKjH+zsrBzdcoLBjbONZx17hTT6iebk4E
	 woUy3HECdHuIHDoNJYB+kTCphIHnGCyDzIBcFTKaFx4CyHWnN8551FbAUiI0Z8sG6kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625676;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ntm9sON3wZbXgSR0FsNnRT0Ebj0apKXl+cIgJKKSV2Q=;
	b=ws/N8f0JogMwfOPydOr+bC3s8KBHpiXgj02x73ZvKnQeNOBsaROgFZ/0TbVP/9ZVWrZv
	 lDuJTlrh2Jno+QDFcgZU56Ua1lMgHHUIWEEf3Sh3gGJwILjFUb8+lnPWxQq/IEB4YYrEL
	 QbOmSulmJJcuFWWg9eQQPz3snEiNXFOLPuvn1tBKvVsS5LHbyOCsn2JXOuLoMQPGxzQH7
	 knJludiBpeRsM1ebnJGVVhsUAn9Q53oHSbrsa0lIOx7efb+xtoB61z8UcdkzRjcdLmvpQ
	 64MaYEujtutBbd7aFX+jKnt19qrtmqTJ/PlkNWBbDjiZmWtjRHtZAW3ZWTyHKD5+GaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J0XwmSAP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eFKp84VT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82915606A32E
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82915606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J0XwmSAP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eFKp84VT
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAOhP804756
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 13:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ntm9sON3wZbXgSR0FsNnRT0Ebj0apKXl+cIgJKKSV2Q=; b=J0XwmSAPxt7213lS
	zEjTdYY5EPeftuAPPqXcK3rvVsgyQ2iTrxyRfuVR7SGdMEtFnbtzF+1ecPPncPG4
	US3m9DcXbJuXpvAh7qdR/iA610ZE+6I4dxIQPsLyKx74XjQc5qtjOytUE+gqanYM
	6mUdh3rHInYIeC1IC1MpSyJAySaTtJa2MxMTdLye1M5AeHyYMzb0eVIaXiFe51r0
	cc3GLNZQ5mknVtpSpKg3SfH3jKmA8nKtaLhM+tFxCQ5jqrSC1SeJQAqp20W10HN1
	uncmecfYxKC/O+6ZQFroEsORpUy+ZDOiBUv2h7/jLg17E4y1HF1uT3JnoBDgOpfu
	bkkvgg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvrxqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 13:21:14 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eaabe26601so158628e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625673; x=1794230473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ntm9sON3wZbXgSR0FsNnRT0Ebj0apKXl+cIgJKKSV2Q=;
        b=eFKp84VT0KUAWi0W495XVrFaJMLUBVVFdFwqivDRfly7lddvaoRZsEdHj6QvyKaVWR
         tD+9wfYSp3q6pfQwjx9vIfDLQQYtIdVh5TvaUKQN8jmHfiDwhzNAbMdB5ls1Hht7vtrh
         1hON9WNQPyP8211cGX6+FNU3EvNDfSJx/ALdWrttzfpQVecNpN7+ofOSgJjPWgyV03SU
         PHJxW9SS2W6sgNhMWDzZ2HL2W20enUJvTMUwdnyo/0DneLETFo7H8pbgQcsEijwy197W
         1zPoKvqVcuQUosB1AplvSGarJtvJQ8Z2+APEmSzXUW2sVQRCWh1CJJgDYrfKP5b8C31f
         k2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625673; x=1794230473;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ntm9sON3wZbXgSR0FsNnRT0Ebj0apKXl+cIgJKKSV2Q=;
        b=g4iB+IMA89jQI5I+d8BDDg13jrGTCi0tLwPg7rdvcVGGdYxDk64o2U42LlrQuyqxWm
         g9Q+I8m5o88a6FGObaFjHc/XAQ+EJJ5ab/Ckv0xhoT48g+PDk1/8lhnmQ3DnA1LFy50U
         R4rCh9yB274vI8Pn52nU0/FllwP86iRGB3IwMrgKP3smnrDmqShqmRNfL5ZyPBdO8WaF
         JEcxaknbPFCwEYYyETr+Z8q61UQJ1OvFzWXvd11TGBWW7vXiKayexCouKKtPY4UIFZgy
         1VVlt+QX5kX66qfTAvp4vMYxQ4nli45w1K3zHs6AL7Zwt7BHTiuBXlzIZ0LOasb1k9yg
         im3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwIGGhleGi0p/poZPtzVVfvXzu0AE0mu9UecX4T6pCM4zB6/Tz2LUlvuRkniaD0sN14xH2uClJ05JofBi3Q@vger.kernel.org
X-Gm-Message-State: APuU4Z/q/vFilI/i8wRK7yBucM7bApiPkdAix3OPCmzxRlVKT3fCdaO7
	6wc0D30kFLC4YW9eRieEI7u9QG5CMs8+BsZO5XvLRtnjHY0N1edxsllactvRF/MR7PgnCcy/1A8
	azGZEusX3z+QTb19xe/gHMpkhjdr6zZ2HQe0vLuYgUw5Sqv8p+oT+eMx8fAz/4Ps4VNpC
X-Gm-Gg: AYBFou0F5Kxa5VdTPQY/0YpzNU2bM8ujgsz/MzACEhqEAwNQrX5z3s95qXK136uGEGY
	pREEHgYePE3itiiSWDhycRjSN+bubyxRKGxLysorB27eNeORe9BwROuL6B/hLbEqhbhtSdnJgPM
	Sy6HeyPrfIPweKcxDaIAOd16dMjh0b4u4hB+TzPDVpG5/lxmXtpD2w31mr6jPeYZFblAMkOSghZ
	Ox7FaEGbSOUPoVPrHe6mGZHT3kPTHIE2TiWHTvg1S/XM5pxlm6ttQUf1A+qeJHwAbx6wMw4cq8+
	ybxeFzk2UmlzLT9JoNjuQtiyrXkse5BQwlCLGV4KsJWlVPCyu+BWTBPjLFqnHsL7BoQe1r+fzAd
	AXcda5Mi5LQXYEkbGS1fW0GhUh5IxM/QKVcOxnCrGGBiqgS624lnX2hqhUFk2e0EQ6fGfD3A=
X-Received: by 2002:a05:6102:a145:b0:7cc:32ce:4c41 with SMTP id ada2fe7eead31-7d07255e419mr2961275137.2.1793625673535;
        Mon, 02 Nov 2026 05:21:13 -0800 (PST)
X-Received: by 2002:a05:6102:a145:b0:7cc:32ce:4c41 with SMTP id ada2fe7eead31-7d07255e419mr2961256137.2.1793625673072;
        Mon, 02 Nov 2026 05:21:13 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9fcbb0sm3395230a12.19.2026.11.02.05.21.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:21:11 -0800 (PST)
Message-ID: <20c50258-a5cc-433c-836e-92ed8ec1ce7d@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 14:21:08 +0100
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
Subject: Re: [PATCH RFC v2 4/5] arm64: dts: qcom: nord-ride-embedded: Add
 sound support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
 <20261021073633.2163128-5-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021073633.2163128-5-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae88e4a cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Us665vxpbSFhsO2t51IA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: m2ygSjg_zhZsXbLAKls_NuyJDFwbu_zZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX0TgdLVOX3ulK
 9FU8uHIEyyQRWyDscAz9T+Rn6dcNVOTW2AE6uQkdknSFkL+o8VggwdwBvSvMXPtg2ZrvY77xns5
 AW9Ee1CYXunRD1+I2ryMmf4vJ7RpLn4=
X-Proofpoint-ORIG-GUID: m2ygSjg_zhZsXbLAKls_NuyJDFwbu_zZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfXzd+04yDyQpX5
 Ws9YWGkl1IPlw1dL21rDXikMiyFG+qnLr+5nzGa7dGwCW5dWsvECZEnhWSofAC4AcDeWAWoJqmr
 W657lTtHVAoyGbNrs8819Q/B23cdkaONE30lynnyiRf/e54fJOVpOtNYAlD90zBTFwNt1hraF+m
 /dndP8JXDnUVUlrQuOBq7vNVDywrIBIBxkmQ6xl78PO8BHiOn3Sw0GzBeNyufDucaz5yJ7TxiLc
 lWyWgIVH56AMWhL0dJE9dzKR5DH7CI38az3e1oPW9DMUV2YmJ7mPQotEtGqteNL8fumhg0Mo4nG
 poYbsCXUkoOHGSLkSGou86ImCXM2NIHXut3AjioyZyeg8PV4UoO+ENXtkj1VkkbhOz/S3miT7ES
 lOl3EUtsbMfITRVg1q/6/kQ2N/LNvE2Vme1nZGDa4iANa+LA9Iee5VUYBCDl0U4x379XST2NR08
 yAhlz4XDJ6Ik5w5jqWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020053

On 10/21/26 9:36 AM, Shawn Guo wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Enable audio on the nord-ride-embedded board. Add a soundcard node using
> the qcom,nord-sndcard compatible.
> 
> Add PCM1681/ADAU1979 codec nodes on I2C18, with the PCM1681 system
> clock supplied via MCLK0. The DAC control lines come off a TCA6408 I/O
> expander on the same bus.
> 
> Describe DAC_ENABLE as the enable of two regulator-fixed supplies
> (3.3V and 5V load switches) feeding the PCM1681, and the three MAX9892
> click-and-pop suppressors as one simple-audio-amplifier on
> CLICK_POP_MUTE_N, routed after VOUT1..6, so DAPM controls the mute.

[...]

> +	expander0: gpio@20 {
> +		compatible = "ti,tca6408";
> +		reg = <0x20>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-controller;
> +		interrupts-extended = <&pmau0102_l_gpios 6 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios = <&pmau0102_l_gpios 5 GPIO_ACTIVE_LOW>;
> +		vcc-supply =<&vreg_per_3p3>;

nit, missing space after assignment

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
