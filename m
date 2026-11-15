Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776661;
	b=EHMmvnt3GtcPCt6TeQ0GvMASrxia/amTuRcvXtu3pItXPeowxVAVumw6rmKIgMwGT1nB
	 gJwH09qdBaaP9DbkABFMllxpVppRuJT/O59ORBH4TnA1HxIBTAmSrhE7fN9XjZvSksCeB
	 edhT7OI9RJ50kGjG1HUjQ1LvmNoe697Kx0Ee5wVmZ+dbd/HICRlqKXfA7Rvy8ekzvzwts
	 yEfyolBQVIL0d8E/lkKXlNyjcPb1WDqd4xL2m01cNXamPGagiR45DQ3oyWcbAkCNwBg5g
	 71j0i83JJPoU/Tck4AzHTuoRgkaDDs2olafp64/q7opOCdS33fVj58qUdLLcuhbYTRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776661;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IvJv4G1qdzEGifoDcuLnLQ8T7dGYEN5NE+7M7bvYeec=;
	b=x57PsFq5b3bdK8nWf99UwqMn83ZSbt7OFDAS7lx1Do9Nt1j3Xnht8IehEffo6baDkkF2
	 kEAzdFyyc6vYWnO4RQrUeQosujVDtARATWG+x5pfXEs6xDSSTYW4vXN+Y/nhjuVRls53I
	 7cD7uZ+QgDrXTOWzxd0A1yGpsoHY/2By6yMuxbqYLIyv4scZ6zTyqW12bc2nw9CVmXDiz
	 QXU58+bbtQwyo0oeHh1TIQA0Bm0ibYxEyWAQxYwvul7poybzAKe7mCJ2T+dmyHZSAT9wo
	 hWljaUxrNUDBdcPwlvnnPWeFRTEXFwXlXjRpZMGdspDRNtRHngMofXQB2V/xbKL9+rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C2oDkk2g;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yl3yEuIl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B31606A330
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 21:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29B31606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C2oDkk2g;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yl3yEuIl
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFIROu5865298
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 21:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IvJv4G1qdzEGifoDcuLnLQ8T7dGYEN5NE+7M7bvYeec=; b=C2oDkk2gmKK8PAXn
	8374kca06ubl4FSAvnw0K4XeMdi4I7knBXHSRehGGam8wtB6gxjQxkK2G5TOMvS/
	7Vz7gOb8zxgOHzEPdR69CbJml6LYh4/sA5cyNC798+sIxiGMMySinjNXjS1eZNm8
	vH0of3vSOgl2uV5xciFigFpv8sv4kkAJSK88CRosUE5Bvof56GiMKa5Dj3GvSViS
	qp6ct0TQIksHxAYYU2nbA8M2XRWAXLSRadwbyrZE772JxE+WQRbQXYvsGAamPBm6
	cPK6J3FFfFtpgchb1zqQirUesvTF9eRNUmkKBBFWkR0bL5muKrqotdwniniucpSB
	/GY/ig==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhm8unx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 21:04:19 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ee4ca144bcso104473e0c.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 13:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794776658; x=1795381458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IvJv4G1qdzEGifoDcuLnLQ8T7dGYEN5NE+7M7bvYeec=;
        b=Yl3yEuIlskCdCWo4P2xJuvmNm88HkVnHL4cqGzYf0fGlIeEUIlhfahrFgESVd5JRtU
         DHWIEGWBm+aCjwXA2LQ5J8PfuoQmbNYTGGcRlG8DCEY8EtoYkHzIRUlRvxyUKwLVuplC
         6aKeE1Sg4sOpT5Bevb3aRKcZVAymvdRHLqWLSjoexkD5rFrcQ9GI4J+qcMihNJg3e4fZ
         6ZRYji/H487DJTJwxu7vED3W/BRq7xijyX2XUqN5nWq7rVzXLQTPugKFLlMxX1umdwCk
         dUL4Beu3IUBh3EAqTVoS8EflYtmqQkrfpw/KHYUv6Sr+Ev5Ad7COeaeJFRtTsxvpZgeH
         QUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776658; x=1795381458;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IvJv4G1qdzEGifoDcuLnLQ8T7dGYEN5NE+7M7bvYeec=;
        b=ClY/GXWNLYZSeEf4AjTzBT4tAXsL72EB5MMxD9XKSC/j+bMa6+aM+2gi6LUJiIj84k
         COBWwe/Xu36sPuaHVMGeS7zaLpZSqKwpIG5P6DgETGvEHoIFASxShywwhFP4SpvDxe59
         U0PuE92TrC9VOlnXcXd1BVkEBJ3LP7qF9HLqLeHJeigVPBulWEgg8Q14Fu2936KjOufp
         982uNpsOUqh0i/ajztd0kHm66AyXYAFjOwCK0WFpkjHj5Sn04jm9NYECfTVRTaWFIGPc
         +xZP1/5UUsiSCcyFdHnZSC84Hm0Nzl4VmQ1OM5BXqnjUpUo7n0Q8rn+ibqwo4sTlh3SB
         bNLQ==
X-Forwarded-Encrypted: i=1; AL+hErG43WvIJV0/yE6G1RONZlokQ8EpHIE7ewkXDfuk5BC5RohcUDkB6ugvo4j/fEmg0+8eb1k06rVPxkvv/rj4@vger.kernel.org
X-Gm-Message-State: APuU4Z+4XwHKlONXeumL7/pkSqQWNuYcnlMbi0rEKwkswHg3lMgZf/+Q
	p80HCq+Mr7Q5sTesym9Lpo6cxQGCbbfl67zmBu80Dz5jbSWK6hOvHzJI6ewyFaOypUKKla0M4jo
	BKyCBNn2a7YlWeFRZKAty3Xb9wmfAVvtVwq3lZ7rHn172TKXmxFvw15oeoQHvzSghKEdx
X-Gm-Gg: AYBFou2iPtF1pjXrML8CM1PJ3rOgwLli9ndsY/W82Ck1XbSMwEDFFRBVE2BegtVL9ns
	dWDf/b5EkFjzkrrUh0+tEQwdjBdoOJ0yCzk5skz7QNOAjk+KfSXl9+cflk9cI59KrggKwNiE+WN
	XQPs1He7hpTsrgO9AFHY1hORkdbR3TaOKBGA4zX6/6uEv2RqWv83CynzM0o3AOWJc3e9dzVm7e1
	hjdDkBnb+aQk29i7zicBqtT1KrFc2C74Acm2iyfCc1oNCc1/uW6zWoEiajlNbMxVz+0Y5okbXte
	TOlQEePQ4AjLnRs7133VTE2sosKaR/omKcXHJaiIa8Q+qxqyWWNLz1MtPgBQ94bC10YV4I1y0sM
	XnARzuq73ky2hONSgPzjiZrV0yIAkWKa6mO3IooJtGXQnjgI6sC1Si6hsQI8GDFZ1bjy4oMkwPT
	ob
X-Received: by 2002:a05:6102:508d:b0:7c0:1d48:b2a2 with SMTP id ada2fe7eead31-7d64d8e0df8mr2587395137.31.1794776658360;
        Sun, 15 Nov 2026 13:04:18 -0800 (PST)
X-Received: by 2002:a05:6102:508d:b0:7c0:1d48:b2a2 with SMTP id ada2fe7eead31-7d64d8e0df8mr2587390137.31.1794776657877;
        Sun, 15 Nov 2026 13:04:17 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb65ce005bsm156345935e9.14.2026.11.15.13.04.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:04:17 -0800 (PST)
Message-ID: <31e8d411-0861-40cd-81f2-6d48ac99f95f@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:04:16 +0000
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
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [RFC PATCH 01/23] ASoC: soc-core: allow default ch_maps on links
 with more than 8 DAIs
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-2-srinivas.kandagatla@oss.qualcomm.com>
 <179476416981.140154.14343442697827559163.b4-review@b4>
Content-Language: en-US
In-Reply-To: <179476416981.140154.14343442697827559163.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ItKL47/g c=1 sm=1 tr=0 ts=6afa1e53 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=3AhHibbqxz6MnhjUMnIA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX3JB1WK1QVmG2
 EUI6o+X3Ev+Nb0z0t7gRKxbLhasJ+OwMn1OtopHL70J0pb7uINFX95ZO1VOs+UOVHH4nH/AYUp+
 ulwrmz4iL6lCQyUWLl4C9u+A96dlUts=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX/5KO8ngup20X
 /Hx6dprIrBa48FAwBEEZfBZbuUl2uwZgWg/t/lKFXyW9LVoZKrBvMyDU68T6bpjNBFQDe53CmPh
 Kh+oJya0dRwHaK+JWiaAh2mwSGktTV0JPXhNUJTvXwpT+xLunBaFMC/dEQ3tIn6QlcpCIS/gbzA
 YrFZwDp2OMosVxCHPt1GKlmftnuF8Qq6wlaO179LfJYP1B6aN7cmFRpuXDbGq8ix+LtBJ3diVNn
 0xr3Dz5GdXN6AUr5lohh19TMTzCCkD/+JJoY4Hm0cpxCiBTQ/7zz2aR4RpMwcdP+cZniHsHZB/n
 pbesPoDR86i4B+LI31cSOjujtjPKidpxYCB5wiNUrQ4RpuDcOxoFhiU07/zaEbnGqS/X4S3K4UF
 33fNM1MN4CZkWok8cpx9xHbNYOiIuxqAqyru/AeqNS0iLNCAyA+zPs6ZGfQzhyMGq/qQ1Mh5irc
 cEcLja+48akcjupsyyw==
X-Proofpoint-ORIG-GUID: zYWoYMPMLKNz9WvQF9vR3z7WbiXCX9by
X-Proofpoint-GUID: zYWoYMPMLKNz9WvQF9vR3z7WbiXCX9by
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611150083

On 11/15/26 5:36 PM, Mark Brown wrote:
>> snd_soc_compensate_channel_connection_map() builds the default channel
>> map from static 8-entry arrays and fails the card for links with more
>> DAIs. A speaker protection link carrying both the amplifier and the V/I
>> sense codec DAIs of four speakers has about sixteen.
>>
>> Keep the static arrays for links that fit, and allocate a per-link map
>> with the same 1:1, 1:N or N:1 layout for those that do not.
> 
>> @@ -915,20 +915,40 @@ static int snd_soc_compensate_channel_connection_map(struct snd_soc_card *card,
> 
>> +	if (dai_link->num_cpus   <= MAX_DEFAULT_CH_MAP_SIZE &&
>> +	    dai_link->num_codecs <= MAX_DEFAULT_CH_MAP_SIZE) {
> 
>> +	} else {
>> +		int num_maps = max(dai_link->num_cpus, dai_link->num_codecs);
>> +		ch_maps = devm_kcalloc(card->dev, num_maps, sizeof(*ch_maps),
> 
> This is a dynamic allocation bound to the card's device but it ends up
> in the dai link which might be stored as static data in the machine
> driver and get reused on a rebind.

I missed that, am thinking of moving away from static entires and make
everything dyamic and add  devm_action should set the ch_maps to NULL
which will make sure snd_soc_compensate_channel_connection_map gets
reallocated on rebind. This also makes it more consistent with the way
machine drivers allocate ch_maps too.

--srini


> 

