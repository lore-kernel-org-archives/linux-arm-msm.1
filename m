Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792997323;
	b=aw4IhRnvwvTMIBIO9wH+ViY8hH77ZXfPcn1y7LxUeBmfHCAuCrqqlX8pkXgc6odZE5KH
	 gQYGBfvGLj164/D9L/nKAciK1M5nPoNF2jeb0vu2JyWgHdgj0q1GBayHMLyptIm1csFmi
	 Vnnu0udTIm4vbkVZhouTqBZCQq0gKB3tXx2Yz78ZN7pOs9+cNUZBVWpoRsj/s48u5XRvv
	 5VvbDsbDkKJ7ndx0qCSLz35IVgR09zlVCgrQ6cBtVdI1+564KspQFd1mRRh4udxr/xja4
	 hCEB5D/PcxAE4qNE+hSm8W6KnWIKYsnjkqs2iP8LTh1IVrVLZd94FLtVov/0EQ+faug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792997323;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=umk1luZ7XsKUroA5aUD5mENUuDaKJUgj+/jjMchHMTI=;
	b=K1SqdxbwjVxlR4IxuPV2PdNZmH3KrUYNde84tlbtQL9ZyH66PDVwEGUnQMB3puVtzvdM
	 gpfuJoVxE1Ia5jC2KECLG9LTdAHFTQRlRggmn7BDE2NzydDeAEcfAvCPnThxeiByiSFyo
	 gb9f73mmnFRl/S4hXEgi4t0qCc3ThSbwn+GEwCBg8amK3sFnmDBE8bUw/SRTNlJXIbNL4
	 QAeNYjZGqVb4hYdhsHHm4y6apWcoOIPfGwbQTKPY3/ol39TbsyHefCsO+MyfgN17m2uJ1
	 Y4mU4Hdy+nHeOrKZY140zOEQ6IFkOAu0rjYW18sw+b3tP95dbI7jAjoc8g+lYq3vFqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="bEYIwf/H";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WgVki5Wy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1ACD606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1ACD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bEYIwf/H;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WgVki5Wy
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b51e1340528
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	umk1luZ7XsKUroA5aUD5mENUuDaKJUgj+/jjMchHMTI=; b=bEYIwf/HuLuugK+4
	f/v0zBXJeHH4oNelfp+4L8Aba2LEzen+zqGJsgS68v5/SrQXERUIlEY7xg0XF8Em
	ksvEBfxY9y+7ytRl0mPJZBiU35NW3+MRC8XQDCCcjLmJy1+mgyl88QJ6zwp6kV3d
	ppFlZWtyElUZWP6LThosNYdXZ5sX0cLxJHMTsLZtrKtcqNQUpa/rUiE3yPA4gY7x
	Xh4fXXi6Tg4wq3wgd7a48NvxplZaoJ1IgHtTN3KsIf80h5wEwPSqLmhbbBMhTBOl
	az39aRswkWQT/OgAqw8Axepg+gw9wRoyKBAzP4WtQa0tTDWedXKpnWkyXxB+PdzE
	GR4deA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgny9w08j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:48:41 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso5169467eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 23:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792997321; x=1793602121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=umk1luZ7XsKUroA5aUD5mENUuDaKJUgj+/jjMchHMTI=;
        b=WgVki5WybWcW6sEL7UvSDBc5Y4kn1oIqQWuqf9BBxjWi65ygpYa7axZautqx4H373G
         rkoMBz/iEms0LGG+FF5DRRIkXzqyitNtN9aeOJqNOX6ANiHcDHS9MUsxyb7jUYdBXARt
         vF7xOfIZGJYYOenzXV8EREfqrSrSVLH/XJVQupjcwFKye6YnWz340Y5mviM/NojkBXpE
         rh6/AGd9y/thKy3LghiwyUEJP539bFNpry0DoTGu98f6T1bw79a/hVHN4iSwFKdR7uvb
         HrfQOXQFA3XVbtNrDhcZY+KZgemh7aO/qskKtcpv7QCUhcT0KHDusOdRPtkuXPlcE8aw
         IJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792997321; x=1793602121;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=umk1luZ7XsKUroA5aUD5mENUuDaKJUgj+/jjMchHMTI=;
        b=DKk11xq/YVsTpu8QPLErUk/M3sokqfpzgIPEpbARG+LS1EK6HIyIL2c679FpFdHuX7
         58qQPds9RfMSrHPtHU8PmEQDW63x5NJixM3NKPOKdgO4H56qTHFzoq66qFv8JpmLtPUS
         U0JKzFvyZyqnbpgHwKcvPso30KssKp3aFxg6bqmwnIDbHCWTD/eBwuf7OcrDLoe7q+LJ
         G9Ijj9+gAvJy4QimwvNlbv6IYvZvXzaMz6310jFfKn9oNIIoAPSVYH85ZoeSKy9bt20r
         mpO9VYvhgdaqECnsza+8d2dmUMezhsLPqT71EmLT8xNy0RIoDnlnGwCyb33nzB3+P3Ri
         fUPA==
X-Forwarded-Encrypted: i=1; AKwUvBxlhWwJD0gLK6pxOig6JRQWoeI/9VSVnZFQdhtiWW9nIIhafiLuDU0PIXVFbxF8wiyn/WFUKXICeLANMcU6@vger.kernel.org
X-Gm-Message-State: AFq9FYLhFOM64q45QLl2LdlWLdXLHtuqxlaw5nENTrc5N20M/7sI5VEZ
	TCt4ysdVEeq9ga5D7/8aQHmJINU+s/VzHcOBGJy4lcU18+eXY6s3AkAS2kM0ERR0XFm6qGU5ciV
	HQKH1RvF+gkqe80nizQNGUSg1o7+8Q3XTuUx1JTQrSzDw/qEKSd0UF6hftg9aYx7aKQEZ
X-Gm-Gg: AYBFou2ZtNdM1rUY07+tBTJR40C2eTN9J4lXEQyl615lgyOgzPf3uPIghKmxYptyqLk
	j+HQKN0algu2e2/8A/v5evc/ionj+jdnAo9zssnymlRVDh8hViTmS6JpHCN9+Wxl72V+QMeoJ7h
	B5EELyKXOZ3X7+O/SUB7blqt+1efD5rJ1cRmEmBb+zBlJhmusCrz4gNQ1rq36XtvPjXFKHlfFlw
	fx4jCmdehEcu26QPlDLRxqvH8Cc8BL8eWiO4smc7MeO7Am+Hb4QcVrvM6N2ntU5o1ZnboeBOhbK
	37HuKGtoM330zqAByICA8zLBdkJZWjH5NJfNRAtDgZcUZ15PDewWePVZAlZIM9qoMR0fUzIa91/
	Jc3dKwOQq4mJnqsaCdhb9
X-Received: by 2002:a05:693c:20c6:10b0:367:a092:3c73 with SMTP id 5a478bee46e88-369e84b1cd1mr8538760eec.12.1792997321069;
        Sun, 25 Oct 2026 23:48:41 -0700 (PDT)
X-Received: by 2002:a05:693c:20c6:10b0:367:a092:3c73 with SMTP id 5a478bee46e88-369e84b1cd1mr8538723eec.12.1792997320290;
        Sun, 25 Oct 2026 23:48:40 -0700 (PDT)
Received: from [10.219.3.4] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm12718581eec.21.2026.10.25.23.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 23:48:39 -0700 (PDT)
Message-ID: <2df45439-fb12-4668-9b42-383d5975a902@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 12:18:34 +0530
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
Subject: Re: [PATCH v1 2/5] arm64: dts: qcom: shikra-iqs: Add LT9611UXD HDMI
 audio overlay
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-3-karthik.s@oss.qualcomm.com>
 <b7kzeykjxoiuf2m4klkga7rnvtri5vs6z7qexe2uskrcpsh65s@dpkzcc4ykkiu>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <b7kzeykjxoiuf2m4klkga7rnvtri5vs6z7qexe2uskrcpsh65s@dpkzcc4ykkiu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KGAwHJlnMIe2lOPJ-V_DCZcEQvp_3sHW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNiBTYWx0ZWRfX/EUZN/86VTwH
 m9ahAnoKNzqULUjXCsZ7CBc3imnbQ0ngdQTlpUwB4SAjSURjuu/QMq0uSNG9/NZFhWNWxoT6ag/
 LcCh9xQOrvmIZIBzSSAOETN5vsUbIBVDktZZ7n4AarkQ8p0/uGQr9ZjJ/pJvnHxwuZONtXdNmd9
 ls1i1UhPYWdGu/B0u/ATL7JcjiAL2gpxrGBrzxR/C39v32wie/A2tD66NB9ka8zqbB/sG/8emsv
 +/q1Coo76SkyMeSJH/E7Mwszs5SEH5YWRFI+DuTlKtocqRZBdgmd1Q/HBXy6HgAFGyIuqVrldN4
 DGV7ctLo3N3et6umCq0WD/PTY8j3sk2/TL7NmGCRtyCpnlUw6LkAMfLd2bj2kGgVi1ZeFMkeNhF
 KzdxhEu1udBr0CfN9nZmE0G45KM8sG+I+SKoUwXcN5n0h2KVzgopBVEkN6rtrLITrxa7wX0kHv4
 I6lzjjZ6C2c/47JfwNg==
X-Authority-Analysis: v=2.4 cv=PqcG/AM3 c=1 sm=1 tr=0 ts=6adef7c9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=RYTj8pPuvwbYsVMnchwA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: KGAwHJlnMIe2lOPJ-V_DCZcEQvp_3sHW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNiBTYWx0ZWRfX/vhaKMMpHtTG
 VZtqw3sknyLUub46QZiXm2o2qH8xMK0mTLh3i7PWDrlqi3gDeX96XsZkj60yim0VSJRo8GaOPjm
 SUfdPAQoDfGaPjG+zrntttqujmEs0cA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260026



On 10/22/2026 4:01 PM, Dmitry Baryshkov wrote:
>>   arch/arm64/boot/dts/qcom/Makefile             |  4 +++
>>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts   |  2 +-
>>   .../dts/qcom/shikra-iqs-lt9611uxd-evk.dtso    | 36 +++++++++++++++++++
>>   3 files changed, 41 insertions(+), 1 deletion(-)
>>   create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-lt9611uxd-evk.dtso
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 1c86e7e98f55..127c5c345eff 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -339,6 +339,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
>> +
>> +shikra-iqs-lt9611uxd-evk-dtbs		:= shikra-iqs-evk.dtb shikra-iqs-lt9611uxd-evk.dtbo
>> +
> What does this overlay mean from the hardware point of view? Is it some
> hardware variant that requires reconfiguration by soldering? By changing
> the jumper? Can one use max98091 and HDMI audio in parallel?
> 
 From hardware point of view, there a physical dip switch which in "ON" 
state indicates max98091 codec is available and in "OFF" state indicated 
the lt9611uxd bridge chip is available.

Parallel use of HDMI audio and max98091 is not supported.


>> +
>> +/* Board subtype 0: LT9611UXD as I2S audio codec, no MAX98091 */
>> +
>> +&lt9611uxd {
>> +	#sound-dai-cells = <1>;
>> +};
> This should be a part of the base DT.
>

sure thanks, will update in V2.
>> +
>> +&sound {
>> +	compatible = "qcom,shikra-iqs-lt9611uxd-sndcard";
>> +	model = "shikra-iqs-lt9611uxd-evk";
>> +	audio-routing = "VA DMIC0", "vdd-micb",
>> +			"VA DMIC1", "vdd-micb",
>> +			"VA DMIC2", "vdd-micb",
>> +			"VA DMIC3", "vdd-micb";
>> +
>> +	pri-i2s-playback-dai-link {
>> +		codec {
>> +			sound-dai = <&lt9611uxd 0>;
>> +		};
>> +	};
>> +
>> +	pri-i2s-capture-dai-link {
>> +		status = "disabled";
>> +	};
>> +};
>> +
>> +&max98091 {
>> +	status = "disabled";
>> +};
> Keep the nodes sorted.

sure thanks, will update in V2.


Thanks and regards,
Karthik S

