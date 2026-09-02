Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC63B360EC5
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 14:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788357665; cv=none; b=F372vwokjuVM8XMjYnM2tdu2d9LF/LA4fo64nWPL13oTmzE/yhVejB63ZhKP23OwA4Cu6QoWjCMCk5xhmbAi4rPEJcgjruSC3mCijwlivXLIXAh/ym8WhGVTvKRAURRIuEYC6RcXhgvEwcEA0/1ozgkp2e5IuX3HlL0CDrL5bP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788357665; c=relaxed/simple;
	bh=QUkRyik0eCsHwhKR92w2rKBKeVOBb88SlZpwkoQ4hVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H2iBrFp1x9IKgvIX0vlHEMnDuoJJHQjlGV8+rx/i9GOYgdy3XBAKLDFKtLF+Kyt9eyVqpl+Ff3P2KcuTDtQmZBgUeKIUDr+18fcc17mrwXCcsIsFVnsKM7j1mhkpmXvN/wgzRgHKJ7o0HD3fxBrkN1kwkzkC7GOGE42ws0lB4n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X6UPllYQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A231ia58; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X6UPllYQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A231ia58"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CR2Hq1549590
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 14:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eLj2eXlys9pmbPYscBzp4AyUd99vJAeUI5TcFcOt/1I=; b=X6UPllYQVZ75nQg7
	FgVy6ihKj0pXCki3rg5EpsLZf8hzJplK5uJGwSV9XZH87Vac+CZYSAqknKwbbBGu
	WFwX3zQPTQ/rhODAUNRT/e5KXycMsmt+Qu0KppysOZS4pjJD5alKw3lbwqS2o4ek
	P9v7Xmg3G3fL+vg0hxYdqn0O6g3nADuO20B9N5ogvqOL7PriePm9pQfw79TFe0ke
	igVSArPRK8GzpcvY1KHg8N/jNA/3UEyEGnIajHcB+dcKZvi3ajDw2sUvKwHg1eNp
	nBIXNirX4rEJUPfrDUDYft2gUP+n7Qbi8QXdbXXISODvUSLyC7oWnplLiRQzzrIh
	CnXBfQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gej2c8sqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 14:01:00 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97752c2acb7so16691241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 07:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788357659; x=1788962459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eLj2eXlys9pmbPYscBzp4AyUd99vJAeUI5TcFcOt/1I=;
        b=A231ia589eBiDiZDlZbHK90ih8N7heIaMzuOCytn0DUBDdMRLrKz8csDZrv7s7J+5c
         wDLll+RMIhc6jYDSBvQyHMrKhXFCjOjd8ZvTIJMU77A2vX1F+SXu6JBCQkPdPmk31U+t
         dbZUl4c6vxqH0jttADC2dASWagXF1mxn+KLRY+7pP7BZG9SKnlHlQsszaukZvmIDJm+k
         aCy4PWX7epax83Str7F30qX3pQVPgOUShNvEu6yfuNTH6jWQpUrTXpG4MCCcPZaDx5fX
         rWvg/R+rBuV4f2fGIP+3gx8eGwTzW7oZmmlvGO0yaaJHXhgIseyzwZDJ7uPe3gunsQXj
         XESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788357659; x=1788962459;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eLj2eXlys9pmbPYscBzp4AyUd99vJAeUI5TcFcOt/1I=;
        b=VEs6W5dssXMqCRXT53JsZcVfG9PBElJGowQTTW26+MDwM85V0jqk92m1iKSUReFmjT
         NznFonsk0fuWsp6HopWnAxFa5wH1KCj4zYCrvXzHKgWe5kkxRyxHtjwghl7yK0QJ/DZu
         J1XVci8bfUHf72c1M9RxCEY6dK3pl/Hxcn1b51GtWUdRbs1UvxoTOd6M/WVjyxMh0hWp
         EeYCE6ED/TRKlId4ahgpwovhDAkPsJU9zNBoUkJfeSbTxB+U79cv1bAOvFraGieg+qUH
         m5v5LfYD/qhTsa/E8YaJmHGmU39E+72VLfnWh67ht8kxmEpfrMNGa1w0WHT/JK2payDe
         rjag==
X-Forwarded-Encrypted: i=1; AKwUvBwPvlbrbEwWz7FzQyqO4Ti42buLCpwB0IVwsQIxhBgf+y9js7Fp030Ql5gv5HHGUDGqZeXdkCMcOFa4X/wd@vger.kernel.org
X-Gm-Message-State: AFuF++nA/5h4p83VbImVS/y1dHtpqhLih1GQ3l3iepjUfh/QpPDUv6gV
	NO5yCMUTaV7DJ3FBD9Sk4oUa3tVhOGZe1p4HqmddaDX5Vro5jwX0PCeItmwQyq4lYWMJc3vPnrn
	5u99V20M/kz3vD/khN3aSRi5UVsqDU4/MxaJ1bPek5uF62A8SaIZR6d4y4L+WtOidTaL3
X-Gm-Gg: AYBFou3oUObt29sdWhcH2RHXdTsdJPb+WN8/Pg4UjnAGJQjDK8Blouw2hxDs4/veesD
	v+6UQAcJWBtu9Y+RmCe6+OHf0E3z4epZxJCXb9oZI965FryyrYtUstx0Y6qIJvkA6S80YftWmQ4
	u7K87SL7koiNOxnPYC0uKWtEF/2tdqHZVzP6GWpYK+D0Duv2FkNCrA3uO0Tdc2IwuIEYGSMA+ou
	v2wzYffEb9qjAuaY5XfkChBmvIdqL2lWtG9hp3yPSh7a4a39IhD1xzm8psNyQVTN/F35ahKvqw5
	zdN4+Tip2p47YmcijrnnCqEJHo5/LmmxAJwIibx85JycuGr4dP8tBaVS73riVqrlz6cQA21Bf8Z
	bXYgBknORMGZSsN907c0xdQ==
X-Received: by 2002:a05:6102:292c:b0:78a:135e:feb8 with SMTP id ada2fe7eead31-78a1f241009mr641447137.0.1788357659431;
        Wed, 02 Sep 2026 07:00:59 -0700 (PDT)
X-Received: by 2002:a05:6102:292c:b0:78a:135e:feb8 with SMTP id ada2fe7eead31-78a1f241009mr641231137.0.1788357656711;
        Wed, 02 Sep 2026 07:00:56 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606b25e6dsm599815e87.34.2026.09.02.07.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 07:00:55 -0700 (PDT)
Message-ID: <a8396c00-0704-4e7f-a4ae-44acebf0a470@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 16:00:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: Add initial support for Nord Ride
 Embedded board
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-7-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831032103.341633-7-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEyMyBTYWx0ZWRfX05ENpAs4nDRn
 sQWwygQlFjcHCuNjxaKPOM7trqkzZBmc2GphxA3p+QJWDATH7si1cM+iZOfkYanM3hSulxvpjNP
 rPcOK9OYNnlmxf/vOmywAhlpmyhbQts=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEyMyBTYWx0ZWRfXzCoqoedBsLnX
 gI6waSwu8e9tRAl5w9CPXSu3bcujMivgmdrG905mIpnTUChTCWC7/bME497FqE8ZB8jS2gcSMF2
 J0fnGcylS3IFDYIGe8n9vA3zpVRm9IA73peIMqHVxRz4dx1Lxg8sFwLHWWGKlK5rFTxaaWLcgFW
 FcS79y6E4ZE27XN3LIdi3C/2PZLdHQ+gQ4iE//fH5UpdYWcCrl48YE6Nfp5z5ouVjX59foT9tRn
 CkYYAqPjxz8HOMkZqZ//bBV3larc2B7jROaMqEIyDThswfm2m9GDwvXEEbrGbS3UZSce8NTZCGx
 CF3gPZAM7eUVSgTQW/YLcclU62rmorrogHrwv/HEB/1WmsfGH9iqnQUL+YmeMOEnGrjZBSOBk1I
 Dn9aFQrh8aQ+gNeeYQ6f08jxERBKgQ==
X-Proofpoint-GUID: eMS-yZj0Op-kLzX4ur7ZfYHYN6C1RgAS
X-Proofpoint-ORIG-GUID: eMS-yZj0Op-kLzX4ur7ZfYHYN6C1RgAS
X-Authority-Analysis: v=2.4 cv=G+ss1dk5 c=1 sm=1 tr=0 ts=6a982c1c cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=AhoN2pN4Pgw2UKRmVskA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020123

On 8/31/26 5:21 AM, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add the initial device tree for the Nord Ride Embedded board, the
> non-SCMI variant of the SA8797P automotive Ride board.

[...]

> +		vreg_l7a_1p2: ldo7 {
> +			regulator-name = "vreg_l7a_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-always-on;
> +			regulator-boot-on;

You mark _a lot_ of regulators as always- and boot-on - is that
necessary for all of them?

[...]

> +	/* PMIC H - "UPMH" satellite (CD90-73961-1) - SID 0x7, Bus E0 */

leftover?

[...]

> +	/* PMIC I - "UPMI" satellite (CD90-73961-1) - SID 0x8, Bus E0 */

likewise, a couple times

[...]

> +		vreg_s2i_gfx0: smps2 {
> +			regulator-name = "vreg_s2i_gfx0";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s7i_mm: smps7 {
> +			regulator-name = "vreg_s7i_mm";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;

Are these actually exposed as regulators and not RPMHPDs?

Konrad
