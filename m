Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792999489;
	b=PSzRVRuy0CBKm9pnJW4Iu4xkxDehAoaqAyXcTfMvXQbc6R1ETHg62MbmLaK1OxWIT4zQ
	 2OZpKhz6r4g+9u/VbjnPwCU29DhilKR5iFPQN73ZCFObLJK+5m0loK3QC7JBHe1P2C5Fg
	 o/0SysmiP4LO8cGENNLusg0z7/3roEUXWo7d6dEQvniZDnGBuWj9yHcQu129YoNJForxl
	 xKkIiX1h7uTSrPp4qb3dGO8tN+2V5l0Kgd2tAjgq306hxq8iQ1QnKDra1VlCIP2qnwmXp
	 cvw7FOBHKXYSIDAI1vYsdprno0EL81sQFCbDL4CbzpmCS81e0NAvw9zeZDUQG7mjgtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792999489;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0Q9hZOGPGHQItfvB0KvMGoubShfJzS8NO1cPSm+V9WQ=;
	b=JTvDmGJ+S3UinZKMJyXdgz/trPImsYzz9y7aJlpD++iiOm/mw4UtugSTP0fFwK31V5a0
	 mMIdelE7fmHAUT5nEA23CpTI0MNIiwFLZFyvMAkP9ddC7ces5NkcDSqbG1KmZzMuobk0J
	 3c+iVWcETVXZWkkRQHUmX+r8oWn1LlEqtt6h1OUYoi8EAvvBPfVwtPfJplvu5s5mCSbaA
	 XM2eRKccXs1q2mo2jFKxL79lZKgdm5RGhyXJqyUOpzVHBjQrw8jGyvTTo9dLw/AU6ge3R
	 B2PwHpsOxJ4bfKzZGKS0GDJGwZkprHZ6CVDiE4FZ65GmINv5UZTowhvLDWHm07ByJ/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bxh0UO8g;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uyt7s3cl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA10C606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 07:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA10C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bxh0UO8g;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uyt7s3cl
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4bJsO1182453
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 07:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Q9hZOGPGHQItfvB0KvMGoubShfJzS8NO1cPSm+V9WQ=; b=Bxh0UO8gpAPiz5D5
	E3S9mOqwI0wTzEfGTe4C7thJEq/v0j0LvzQoxntZrkv0a1xWzZh0WIFGhxUoqp5b
	qQgKnhgQXT+zjrmOYAdAwalHzLHt+FpeJt25pt2sX3cMwXfumma+HWOlqTYk+ITB
	zfGJsWkXBbhSTur0ONGZW5nSxaZcCm7g0laj9se2wuzmxsroP7ye+tp4GnlPDXbG
	PkIdTUT19X4xb4Nps8VB+8xBybbCd0QjTBms8BAxftqFxuMAj+OdYvru1iqlJnVL
	vVJxGkkIG04n3Xn1zjbsebm19izIdAUyrTG/lAF8Mh+5n/YCrSFmlW6au/R9lu2e
	ngYnkA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27w8y9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 07:24:47 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36998507c13so1565187eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 00:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792999487; x=1793604287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Q9hZOGPGHQItfvB0KvMGoubShfJzS8NO1cPSm+V9WQ=;
        b=Uyt7s3clcyOJanwgjk6K7xfZ7MN0F45sfiWW2AS3MWXjvrzmCvg0RTBCe8ixNDYRam
         7o7THnY9AcvJqfjXtDRLUBOaM0HLmL10plz2s9zNnv3FYtXx3osNwzEdVZPaMeM2B6O8
         L5pJoELuwkztAlM6BeONvKbi4IinMtOvnA/swvYfbU/yDgezSYybp5a5fjbHq2RKHICr
         d9DHCRWH9QtLwR/pkT0041YQtS2tNcxXNxU5YvbGJObiKzkJFEpDDG6yvW/GrPrcZWIs
         czHC4X3QvQXn5oxg6J14RQ/1YMnBrB4/0s56+mdVpX635LfyrdOEGDsMaUS/Cek96VO+
         KEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792999487; x=1793604287;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Q9hZOGPGHQItfvB0KvMGoubShfJzS8NO1cPSm+V9WQ=;
        b=VfX1NS5WdawtxuQKxn5K2H5PL8rhOithTf7Kig6xIN3MzSy3qoguPuWWfAr+mF9VdT
         J5wnIyDYasnCcbSDvCZU6QbOqN1dV3ESUoFUzcBQQRixkIgar2Po0Ynh0gXm8tiVwsXz
         4kM4LAqak4j8mn+egLhsBZO8MMcERpfnYaoh0duJKoddCaNRvWdQQIhrqeZadAtHrPsH
         od2m0/qCJS5+YUqOWXls4dPIVqAMu+zLQOuZEvrld3L3X6B5VbYJ8rvOJsSdkru/8nio
         JGGx+fypD8/0ePkp50o4O+CWNsl5VfT3TO88F+mVhdntxu9Y2UhsiGqRGPAHE1LArTIC
         kfoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpzsCJymLdvfeGcI02yx33hmiZwTkm8/v1LuYWEp8qgvbE+QYPGL+1XwjzO1J6ItkW/Wooy45WlKVmBUlr@vger.kernel.org
X-Gm-Message-State: AFq9FYLSrc/3qPYCxHP1F/u414n8bew85KMdRCqV2uBPyvViFjrpjO/P
	Gd9QfbEJPx+EyGZmvjW9aCrY95yHraNTY+5ASLT+hcz7hiFYhCyO2iXEtWif1xgjFA6mmBfzp+r
	SJuHK/9Zk1vZ5CHF55wET326Re4uPht1XGHQ62Wr1b2JrV+Js4Ea+ctGIBCmDXhwhbVVM
X-Gm-Gg: AYBFou1IcrQkw6FVxr/UtaVAtfGv7/eBIioQfOrKSWFhsbwRZaJgooZHRG58t+mmW22
	LI7mCEKa77TJGY+qKSTqJ5ruxW4/1nF6qKi66Dyr+D2KOC7s2Fbs2bjAcaWetUgkTxLVGwAX0Rl
	sKaqzhyfQqxDM9cvmTnfbquXjUqJy8aPKZSCBnCCtnq87rJRWBWc18SOsqas+/Xo19vJOwFgxJV
	AQ442AGHzMYokCfF9Rz3d/VqapFURNnlYrnaQoFOxkTB6kMaSn4wDu61wV1Y76+14DU+SxSeK2H
	qIMCQzxQ2mnYw/ctVg1vqsndXBoIyjco5lAChDGErQFEljBgBi4dp3A6E0+gek+/mdr2FUtf8Sy
	oMe1m8vc93wcKYZGyrZpiCw==
X-Received: by 2002:a05:701b:2501:b0:14c:d8d9:9502 with SMTP id a92af1059eb24-19933f05474mr9361009c88.14.1792999486566;
        Mon, 26 Oct 2026 00:24:46 -0700 (PDT)
X-Received: by 2002:a05:701b:2501:b0:14c:d8d9:9502 with SMTP id a92af1059eb24-19933f05474mr9360973c88.14.1792999485793;
        Mon, 26 Oct 2026 00:24:45 -0700 (PDT)
Received: from [10.219.3.4] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm13556700eec.21.2026.10.26.00.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 00:24:45 -0700 (PDT)
Message-ID: <f2467cdb-e4b9-47a9-bf64-51eac8732b28@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 12:54:39 +0530
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
Subject: Re: [PATCH v1 5/5] ASoC: qcom: sc8280xp: Add shikra-iqs-lt9611uxd-evk
 compatible support
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-6-karthik.s@oss.qualcomm.com>
 <4e08bcac-66ee-41b4-a2b7-65797ec0e3f0@oss.qualcomm.com>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <4e08bcac-66ee-41b4-a2b7-65797ec0e3f0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adf003f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Y5lwcFhJtQqtPFhOBPcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: OqFhps4vXZ0N09R46OOTvBI3B70KH9PF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyOSBTYWx0ZWRfX0blyafp9lfx0
 exrz/YUCG04DeswwuTmGBKC5QsjS/Woj1CydbZZMfzR+jadrmcwxaJZTY98wxTPhkmF13AeP/UN
 /ugtu3/ieKF/0ED4w9IawqaCCORe5WI=
X-Proofpoint-GUID: OqFhps4vXZ0N09R46OOTvBI3B70KH9PF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyOSBTYWx0ZWRfX1GnOfV7atVHR
 haYf4hXK+vFMR40SAASWXloggRsFoVd21koWYION1L0a7qxZV2CYZ2Fd1St7I5WyiWql9eCni+L
 tG/y3JCI2ftlp6GRYt0qkrTf2nQSpM8MDhFRWnLyA1nHRvxGUPTLuvlJvdEutNbiCvmbCHwBXLG
 iq+0Rj4qBldG+dG+2o8QxYxEkZeVP/xrQcdUAVceJIBZ27VooGXdOp2OxEXGMGeOGCw9Bjc8mmI
 PhQGizqDlt3kWAU4PsAHYSJprxq2By0MXyqcZjqzNXINUQgajHuN70pCfYmQ5HNbnWoqjLwMOgZ
 tgq2IpWofAryRxKympx8IRd9T5MUHngmVLe9w05g/1IvxB2y3LeWTeZcK/lOSciO0HlQkVUCjrP
 QBZxCAPt5PleiT6vy7yMTbr+1rfS6CsHN/zjcvY6+u9M3f5ygOXQR3irtky0I88QOEBY1BkQz2e
 C9m1YxiLzJlqZo16HAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260029



On 10/22/2026 9:37 PM, Ajay Kumar Nandam wrote:
>> +static const struct qcom_snd_soc_common 
>> shikra_iqs_lt9611uxd_priv_data = {
>> +    .driver_name = "shikra",
>> +    .dapm_widgets = sc8280xp_dapm_widgets,
>> +    .num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
>> +    .codec_dai_fmt = SND_SOC_DAIFMT_BC_FC |
>> +             SND_SOC_DAIFMT_NB_NF |
>> +             SND_SOC_DAIFMT_I2S,
>> +};
> 
> Since the codec is configured as mi2s_bclk_enable, shouldn't we also 
> set .mi2s_bclk_enable = true here?
> 
not necessary in our case, use case is working fine.

for example in case of qcs8275 using max98091 mi2s_bclk_enable is set
but mi2s_bclk_enable is not set to true.

>> +
>>   static const struct qcom_snd_soc_common sm8450_priv_data = {
>>       .driver_name = "sm8450",
>>       .dapm_widgets = sc8280xp_dapm_widgets,
>> @@ -608,6 +617,8 @@ static const struct of_device_id 
>> snd_sc8280xp_dt_match[] = {
>>       { .compatible = "qcom,qcs9100-sndcard", .data = 
>> &qcs9100_priv_data },
>>       { .compatible = "qcom,sc8280xp-sndcard", .data = 
>> &sc8280xp_priv_data },
>>       { .compatible = "qcom,shikra-iqs-sndcard", .data = 
>> &shikra_iqs_priv_data },
>> +    { .compatible = "qcom,shikra-iqs-lt9611uxd-sndcard",
>> +      .data = &shikra_iqs_lt9611uxd_priv_data },
>>       { .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
> 
> Nit: please keep the compatible list sorted alphabetically.

sure thanks will update in V2

thanks and regards,
Karthik S

