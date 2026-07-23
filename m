Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D689449EA8
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784804759; cv=none; b=nXTQ/aycGDR3WAky8R200xc9Vx62DDAetP7cdOFkC8C4J8T23L/X8piXADm5lfL7zXJhfvgm9jfUmtsqogmvpZG7HL0B2AC30bS5s13dkTzmKZSO90IZenY5dI9yiCVTH8EIGp0Tp+j0B4mmsjAGaaroN3Fv6gxv5OxkH1SEGqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784804759; c=relaxed/simple;
	bh=OwAplwYTX5ghT4fVWFOYK6ieCMrlo2iy84oCUwHIfV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RKmlPG7t+vH5UAoeE368aB/qOQVVL2SOZMSPRhlbGqVTfmBp/+kkRsmB+ygv69QqrrSkOvlptdmYcEFFYPO4jKaY7mdP4S5arWnsyIm/ENcKJLB4OHUlEE7Ctnb17qKt+89fRMDpNg3wYTl8RqBKizOclPw7UPO05vG4IBLj/xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kDZ7137a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DANC7Rnk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kDZ7137a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DANC7Rnk"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8r4DM3790742
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ueSh5+HGwHbPbXpRSulOx2jS5R2Ly4UekPjsWs7pRu4=; b=kDZ7137aqIjFufY6
	As8biE4hcI3SJYYhauVreTM58yun7NdYTTkf9v5iD7O+nmxuNEq/CrtomkPRnDOL
	/xCmW9O6nX6lY5AWbgb3rB5VHQyCnaX9m4CE7ipXEniCZcJKePYBtZeqYaXovSpc
	WT4tsPE1x02LI1CLYwgpVhv6lrhD2wonV4rdzNuQkPecuOG77hS+0Ckr6L+OgO1I
	ovhljoe4l57OsRTlxtpsEehQWHFPLiDXmigBPNqL445PFhc1Vobj09/xOyksgM4a
	V15lu2m/7OQhmux/jwOOqPrPE7ZCV+gXvZhJN6u6t0j2Osnj/DiBEy6w71HIUZK9
	kD2QGA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk7b52f5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:05:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e6cb57d25so19698185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784804756; x=1785409556; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ueSh5+HGwHbPbXpRSulOx2jS5R2Ly4UekPjsWs7pRu4=;
        b=DANC7RnkhBqxSMTsU49PIiydJpmg/zTZqdry+v30mGtqu299/uvPWMg3bFmZBQmPA+
         6DWtqvrgpKFYSzIw3CEIXgPwVSA2TYOq+D0xwGk8A4hVzaTya7KukbPk+GsugKmQzOPq
         lkaC0NCZel4dvOlkLkUJ4wP0Pib4oLfAuAbqafjtcgJ+F2GYSazP/zY+KgCVrMUNkhZt
         5h8Tfn1/UU15XaPOHQoIzvj7+lsOf1IyC7SfpmNDYP9NkBTfYnMunpC1BNACy6fa3sBk
         0h69VNfDRa2EHvu+HScXfT0UqdEuhjnvnc2wgqS3b+aPYn+VPIzlo+H5PGeuqdUyxA4o
         Juig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784804756; x=1785409556;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ueSh5+HGwHbPbXpRSulOx2jS5R2Ly4UekPjsWs7pRu4=;
        b=jpIShhAfquA24sUFzZkU6YN50zzgL+jVyE5dtsIKeiVX1UnyXVTAviqol1Jn2NLDND
         ZvuXn4yAHCbaQZMdaciPwxmDDJHo+DVE6i9BNmM8hW6plQTpDQXANY4FFJv70US5F3gj
         9lr2DiPcSSJb5ASXullyobXRt793VZ+UHy35CPWw5ymquU9EAnsZF3s5O0UofmVjBtg5
         gRqfalGBbX/tyGWrH67Itl12YlN+4twI6FVb1U0Tv+ZMwPgob7Ij+Mi+VZrkWnfkRa97
         e96azblp2SvUUIXPAmm0FgRd0o0jBUtdRvljb214p1CIX8WJhR2xHJsJsqbB+R6YVK8r
         w5+Q==
X-Gm-Message-State: AOJu0YwrpBTQfHS1825fv7uRd/UOtwjSzzlaQa4fNRqpXiphRD9qgp27
	ZQMQnTRVZewfrE7w6a0OOSb7v4VDa3oaMG7j8EGQWlM9F18z1XubLmvQxZJHjBFCclbHa8aJu4a
	f6Sz1WWOy2rbmvzsFuXuLdVaeo5WnCLdDGJ9tNpgVmHtg6cFsbLA343hilu/yN0/Y8XDN
X-Gm-Gg: AR+sD10XBcuiSKpPFHMusWZJ5qzXg6aFyMR/HEklKfjMMMjm5p9dxnIrB9H26be+e4j
	YkPY06fdKEzUDK3hebkaQAhnG18jUdLfYaQaw5EPJbJb5SBowJG++pY0t5wPTmwlxfo16EV43go
	2aQQUgCehEkp12dBHQEivhBpDEtReqS+1oewkLUL67Ku1S0CrJjaDcTTMjONdtoFVeg5MnBG0Cd
	+m+dKY9tsKJ9DTlxe7iqIOA19x8qsvjzkxpHoUYdOJu7eMjnisKJKjRZaTZYPRBcIb6Gyz0xuFn
	VVO+293oVMAYzXHOB6eM83/k2j/kc7q0G3CJ8vGR/Zzhxs2dw2P2DLRVNiTWzs6KsCWIM6wJHB0
	K7XiTyhccU5/g63gt9A6dJYFp
X-Received: by 2002:a05:620a:a295:b0:90d:11b2:80f3 with SMTP id af79cd13be357-931251e0e82mr10011285a.7.1784804755906;
        Thu, 23 Jul 2026 04:05:55 -0700 (PDT)
X-Received: by 2002:a05:620a:a295:b0:90d:11b2:80f3 with SMTP id af79cd13be357-931251e0e82mr10007885a.7.1784804755391;
        Thu, 23 Jul 2026 04:05:55 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f34b88069sm1999013a12.7.2026.07.23.04.05.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 04:05:54 -0700 (PDT)
Message-ID: <a74c4d5c-7092-4f5d-80fa-4528308ec837@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 13:05:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe
 M.2 Key E connector
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <20260723-hamoa-m2-dts-v2-v2-0-82254ac101fb@oss.qualcomm.com>
 <20260723-hamoa-m2-dts-v2-v2-3-82254ac101fb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-hamoa-m2-dts-v2-v2-3-82254ac101fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwOCBTYWx0ZWRfX/Mxdnjr/RZmu
 +GbkuZtBIt6Kft4AQaeepA0lYW2nfR9sU5IAj/y626sCzXDzALelapqJLUZV0SUxE74u+WhOS7k
 7l2e8PO4dSxvts2l+E8LUuHdvjPcjLZGXf2Wg7fVkuYLHuUwMAjMwFmEhpls484CDogQYoy8Bwf
 p4yJ9dJSgBT2WLr5g8VtuE2H2O59CyZeUphkWakurNhQayEVbwE262rIBPsBneg9p7TpyhqnyOq
 mgJyVznv8HDbNhgBWZW/X8lk9jbi/WvyTQ/N4HP3XUhMfI3jZu4D1Dqnko2JKl9zDYr9JDbKcEF
 xa07F28Xlu1ejpDxlzfxNmdSyHWlpps7u/sZUK09ANL8oyOw+YtTwEel+qbpANot90+UBSg9KLH
 yUdKFD8xKa9fKk0ibAQrFEAHSXzR5nOSMWEvjvSaphe3EZ94p1URv6/VGlSLPGytdpDCRxuOPFW
 MMV+0TAJClcrlumrEYQ==
X-Proofpoint-GUID: bwOlFj0yY4OUrcotLZG9s56mgjoO4jtq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwOCBTYWx0ZWRfXz3FyHv8/b8DJ
 4QedMlrPhl0uUL+SZnN5zeeeEBy+XrESGD518cNiiQPOsyE2t1Z9UUZrtkzs/1evNaBUCcY2Tq7
 AdJU8TYNVV2ZubPwhywK7wtE+BIT/WA=
X-Authority-Analysis: v=2.4 cv=btx8wkai c=1 sm=1 tr=0 ts=6a61f595 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=6WoBsH-PcZNXEBUzj7sA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: bwOlFj0yY4OUrcotLZG9s56mgjoO4jtq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230108

On 7/23/26 11:56 AM, Wei Deng wrote:
> The Hamoa IoT EVK has a PCIe M.2 Mechanical Key E connector for wireless
> connectivity cards exposing Wi-Fi over PCIe and Bluetooth over either
> UART or USB, depending on the card variant.

[...]

> +	wifi-bt-connector {
> +		compatible = "pcie-m2-e-connector";
> +		vpcie3v3-supply = <&vreg_wcn_3p3>;
> +
> +		w-disable1-gpios = <&tlmm 117 GPIO_ACTIVE_LOW>;
> +		w-disable2-gpios = <&tlmm 116 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 = <&wcn_wlan_en>, <&wcn_bt_en>;
> +		pinctrl-names = "default";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			/* PCIe for Wi-Fi */

Similarly, this is both defined by bindings and made obvious by
the label you assign to the endpoint

[...]

> +&usb_2 {
> +	ports {
> +		port@1 {

That's why we should use labels and references instead of nested
nodes - you defined a port different to the one in patch 1.

I feel like we should probably define the uart endpoints in the SoC
DTSI as well.

Konrad
