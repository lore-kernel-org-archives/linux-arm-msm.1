Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793012078;
	b=RGpx9hJOmiAwAoerkLkz+8Zl3pv6FQL0WvqX9risWk21ti0+j7tBKNNWTjFfnJQHngP2
	 K4r++8GJpZIAZA5SMvlVFLUGRkcHGQTjDNtTDhILThw6ZMi25PZtriy7Nef6whTSEUPIG
	 e+aXfahcxowVhH4f0DKctzHwMGAqEhaj7Vbp3lLs3oP3ECRfkSIx/SxIaN6SHjPDI15aN
	 JMxWtsqCl7jdK6LG9/bS6WXnvzLwhkb3+nxkMvivOjYNIuF7oIEK2dde/pX4hpeYFg6zX
	 XVaJlu0dHXmFhI3Vi5XlLDcFX8d97g+mwLO8d/BSKRfVnGzKJ2kE/qt/Pw603T8CERQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012078;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Oq0D2Ss++smLUiQ99vZjmEFsrbRIToYjC2WTlYiT258=;
	b=UvqlMH90Lbb36qn9tOhIX3W9+puRUH5l/sz6XP3R3TlE7V0lpzSVthTk3o8CRC3lOg8f
	 NFXGjg7JmmU1+H2M3AFvbkes8/kwSnfsf/j1ZqKqXTte9DrkK5lDOxR5lk5pwX1QnjRYg
	 9mRjSkdxB6eQnEJ9XoDZLcvfBRD/c6nKXEawwsR5lCdV3K0jno1snAQV9/BNZEqal32Fz
	 z7qQz9StyfvHcaczTJRjXCJ14E3RZKH5IfJqaDMVQMm+U0/W4WYszBMEut4s8EHAl63ol
	 t45Y2nGr+aLIEe0U7vzamXR0osFVGdphZ8/OoBI73MKXpIjyZBtSJQ1PX0aLDiJWshw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lJT9wNFT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BPLFgbfK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED033606A31D
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED033606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lJT9wNFT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BPLFgbfK
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAWVe92986404
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oq0D2Ss++smLUiQ99vZjmEFsrbRIToYjC2WTlYiT258=; b=lJT9wNFTbz1ZUXG+
	XfeeYnfmzm9oGbGmvPV15k8JJxKnXdpuw2EmtDm/+AFh8DMU8zKmbCRWj470EP1M
	aRr8pH8TZ+8LA88ZAiCqHm9pvwMDMp/l/YNdfzAJ4w7XA7gIDu/C76G7Mtmw1+AQ
	CcDONmFUrEZu6pOtryh7Rjy2mrdHDvyvdht0vMT7iZT0erTpnKOapU9op4yf5qiF
	oJzKZxM6n/xz1Aqr6/iPXpl8fp9fBg2+JC/WA/8kKFvdO7pcXmKLWqvsmPiqK5Ar
	px0YbOyRTdl7aOfoN6USMVGTgdZ+c+hmNSBQtMptbWZL0XleqVDoJckX6jqem2mN
	i4iLog==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y02bq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:54:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5337f843b50so2113601cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 03:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793012076; x=1793616876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oq0D2Ss++smLUiQ99vZjmEFsrbRIToYjC2WTlYiT258=;
        b=BPLFgbfKzu8Eb5D3Uh4oimWyGut4t2AP+Rlit6Nxvh2HN3ydtc5RD73mzISn+R8YZ3
         +CwhOgALY2B0Hklulxb28RQoR44C7/Ybxnx+/JWtEqhsx7HfWbiL3Q035CyREtXLQDfm
         48aUKvwLNJ03AUid1fXDip0t1xA58vEW4P4nkKF/ZY+l6pnclbQ0H2LVnU9Mqstl4zaD
         GuIuciiGhH96p4ueQHj3TomNOhZ1ZuL22QK+u5k6aCsOGq1tkxN3xue62AgVHPIiUzsa
         vrTCRNdJ1FDXpcLO5A1dNxmyiZPhuypI3N0/kGU5YsixQ1Rxh48DzqLK1rqFGzTeuayL
         sm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793012076; x=1793616876;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oq0D2Ss++smLUiQ99vZjmEFsrbRIToYjC2WTlYiT258=;
        b=BhFxrwHVdEFufVnzbRa55EoM9tH2mJEZA2axcGmUwdeMsPA4bSAFzvLWVpdMQDvA0s
         GbwdXcmwVziUUq1X9Ck8nOZ5ELgQBxxqnZtiC0zKiM01oe6BmFICf1XZnnSbZiP8GRG0
         GPKEqAA+eRHK8lxxj0io8EYg0zUImf7bSNuJcLtjuOOd3ljtP48jSsZpt67liKyJi1fj
         //i6lcIDmFtixzN7dq+jcVx0hAhgefmFSAon9VSMAx1JVFD0q2LzhtJwrUk01sPVNFxd
         E+dVteZR2H4q21h8GdtTYAvHw8XtItFlDIn27ufBCJktxVQLPpJuotGwPXmHscGBdX/L
         DqGg==
X-Gm-Message-State: AFq9FYKJEjx95u8WR1r/t/7e9TduNQjyeLXnEUrrGasPfw0BTmruIqKR
	xxYdD7r2ic898ehMX4tJYr/2y7i/oQj1WS/n3LHJztdF7OFIGCTlTEFJpl2MeaMYusiOUs/KSin
	S9ful83SAVniScNVmAVyFzW2JOzmjY4lU0rON3JEn/SGl/zh+eVwg8GS/vlTRstE87D0A
X-Gm-Gg: AYBFou1SlCtYm9QrKg0Ec25XfE+Rq8LzAarDlAyfXFDrmnZp/9YPRFTbDRJEvPVtYgW
	yPY10uvO1yKMOzFh5bD2ZWPlZCQJKtNlgSaxql7rhkzECDq2ogrHCmPX7XVqFTHumUt49ZjwtVn
	lXfxi5V3f9rKIMDJj9P5Er+3XwmX5wi/w/r0UbKwdf6Jpy5wzcvLCPwOjeO4HdXsaIchJ0yyE1G
	vTQaxqNvxWWFbLLPXKbwPS/9S6I7gx4ZzO15ibn8B2ToQO+FhKzypYP4e0Q6sEB6G0mnUBSy1HD
	nGoNARtOBIqVwG7Cr19jflUD3anUNBy0MXBoOiixquqFcfWG8y1GQ9oMEviGMSKx48gQ5NpLFUr
	iNcUl/2r2B0Hz8AdwOubtrw==
X-Received: by 2002:a05:620a:4e84:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-940ef9710femr1137088485a.6.1793012076199;
        Mon, 26 Oct 2026 03:54:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4e84:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-940ef9710femr1137085685a.6.1793012075783;
        Mon, 26 Oct 2026 03:54:35 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea620sm305456166b.23.2026.10.26.03.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:54:34 -0700 (PDT)
Message-ID: <7c287dda-9e81-4e98-8a8e-0984afa5507d@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:54:33 +0100
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
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm8250-hdk: Add support of QCA6390
To: ShiTou Hong <redstone.dcity@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ShiTou Hong <dc_redstone@outlook.com>,
        KancyJoe <kancy2333@outlook.com>
References: <20261023072832.2642647-1-dc_redstone@outlook.com>
 <20261023072832.2642647-5-dc_redstone@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023072832.2642647-5-dc_redstone@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MyBTYWx0ZWRfX5Hr4qEo5OVs4
 ZeJY861G6dZ7RVYgezQqxpRVIhnRNaTWrG6fZQDOM22PSi2KBqbdjUlqjs/bGvklIW2t4XM8mf+
 94uyoGe5kjwTAYSgIHY3dVXj+ihNEGA=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf316c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=WvK3DE_TvOQGC-msfrYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MyBTYWx0ZWRfXxCQpR9IirpEB
 fyN0TFXNkwYqc+HK2HKOARNKaWKWfCVC4jWwKvk6vCefOK1Wvtqe88FGcVq+lupWFMKnKwuec2D
 rnOiIEF1NmrI38ij4yf56rp0aqrvjDi9HjEST5Fy7bOKak1CinYRZk1jK2ZHg/T9lb5zi+Jdd2v
 TnLru9NrUeVcVXb8dtJStKJ2+ck/OqxNAOmo2PT/ii7Vl684Y9XDPzDzUEmoonG9vOaVPTE1clY
 e1p8713WJPi5WVtYO0EnzY15jXlrAbQKK+Er0Bi6wtHpXK73HvJxRmZhCUG2CQbqKEgpRUuGj3N
 94S5KFmsepUGVk06JDIIuprGqi9RRv8gx/lahvPiWd627sYZZ7mSQIIWWdwbMUyswrUNSwWk9Ol
 Ck0ScDqwvFZekpTq4uwrOnbDOU0QAqixIQtQY2ZGyi839EUEI1PQ2vieLm9dgxDj35iz5oHQMT0
 Jbq8FirEKcYAzNPsPjg==
X-Proofpoint-GUID: myjY3VKZ0UPhepDE_v3pLcoLc23DJH6d
X-Proofpoint-ORIG-GUID: myjY3VKZ0UPhepDE_v3pLcoLc23DJH6d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260043

On 10/23/26 9:28 AM, ShiTou Hong wrote:
> The sm8250-hdk has a QCA6390 WiFi/BT module which hasn't
> been added in the dts file.
> 
> Enable the UART port of BT, add the bluetooth node.
> Add the QCA6390 PMU node.
> Add the wifi node of pcieport0.
> Add the missing regulator node of PM8009 which is used by QCA6390.
> Add the pinctrl of QCA6390 enable pins.

Don't describe the diff, describe the problem

https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

[...]

> +	qca6390_pins: qca6390-default-state {
> +		wlan-enable-pins {
> +			pins = "gpio20";
> +			function = "gpio";
> +			drive-strength = <16>;
> +			output-low;

Drop output-foo, the driver will take care of that

> +			bias-pull-up;
> +		};
> +
> +		bt-enable-pins {
> +			pins = "gpio21";
> +			function = "gpio";
> +			drive-strength = <16>;
> +			output-low;

likewise

Konrad
