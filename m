Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496A74E4C49
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 12:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789733926; cv=none; b=MDI8zXSvRbHKFxmPoXkfNILr7xSUWSYiHFjTO9GI+d+RlwvjYWorhOELEL1y5WGAjzkXc8jLuH2HbIAYn9mcrI+hhUdMfZY4wipRsFXMrxVYXI4KaoZP5wJUcDs7ok1dkdxG84nCojhHPJh1B7jnSRbVEVnNpKtWkFNEV+RWccU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789733926; c=relaxed/simple;
	bh=wapxrbOKn0aJ+lRvm1E7CjXQYuLnjYoitWtQ+7teQlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PGw2UiEIRvWr806MF7samaMGWC9RZeTuUk8dAnPmKCUMtaN7ABACBiGjIgb53JfhUp6GN3VESFRpKm+v6IQKTHsnE3r/KMUNfusz+ig4vJqbAhupZ21xep7BBY+MH1ALcq/6UlFK0wNBc3gkh1vu84DfuuNPrzOCI6kcdrhJN9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hIVnV7Fk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HUzbzjZc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hIVnV7Fk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HUzbzjZc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9e2CJ1214594
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 12:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e1YPzYuwWx4GQll8y/pnlimp1lFMP988wsR4cR+Oego=; b=hIVnV7Fk2rOPC2+Q
	7XI/n3bpaC6WD9gitchTLUpGTFRPt10Dli4VF/T0zBviQTzRbBnkvlF3j5IZyWc+
	9JMIKkUgFMs3ablTZTGJkI4/Tl38m8GphLLeo+odRedmdfQXJrAWTW8DJapPwUt4
	PZVxGNcLy3mjz457GCKGksfFmwAraseJ4Wye9K9hBh9au1aCPhxF+O+N138QcQwO
	PgQDBsKjYMyG6XIKtu6Ds1ukxX8ODQdbFpoOgxmduyCcKY45hXC669xnhrlEs7AD
	Xe6yESzibXRIRrZXHjjUST69VReCrCfnthb5rb0kqdB26mRh3iYs9EeEccTDrcPv
	QuEGfQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrg4334p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 12:18:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939f4002c1aso10985285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 05:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789733922; x=1790338722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e1YPzYuwWx4GQll8y/pnlimp1lFMP988wsR4cR+Oego=;
        b=HUzbzjZcmlDTQt9LEPgf1V5G/kaU0o9ooLDj7lBHDM3DwnAhAVAz/Ud8gLPxGcISn0
         uAlo8vlC111b/K8fzw5UXlTT1RegmcM7nbW3FiIqErd+g0bR7pjdbfgmSVQwjfXCnmJc
         mYkmqO6weRgAHuCUvObHrtWSk4Sp1B4QFkLpqFHkXAUoga4mWN2O16SeZTq53HgU9kdw
         36kTMUeNK0/VL2wPNXkaaZibEV2dok2+Qh07HsKxP0vX8yVnb4zRh9/7Nx2eu6Qj/OAu
         YQ/VVEqaPYJvNlMZk6hXAPZ9qoLMBSK0z1y3wpwnYAGnCcnEZy00Q1aCp035ArA3UFwb
         Z2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789733922; x=1790338722;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e1YPzYuwWx4GQll8y/pnlimp1lFMP988wsR4cR+Oego=;
        b=zwS3RTM+lPrRrNiuGHYziPEGy5zsp3RFEES0EgU/N90MdPcHPdjQIIZQZTf67NxRXu
         gY5Hu8FM5luhZpl9zdoy3ZmCmBwqzkOLaGY4NAburutnp+/EvhC/UvQKKEcjElboYwg5
         L3RLrGrcMHPTgJEaTCoFZxplZ3PvZ5kCfZ/a6ISwGZbj0OnFTQmXJOVEzU16H83gtBFx
         wR0jzQexT4E7QUXIhgpbLdq1DvPH4v+pXFlOntwIOzBqZDPco728+tnkvCAkCwQAqYrs
         XC95yxhkMXI7vIQNA5J650ELH267x7YaQ37qjyJmnecGZxk08OuUK4VJTWJLf1kEkjF0
         Uptg==
X-Forwarded-Encrypted: i=1; AKwUvBwPGduF7K5fzokXFvtVSfcH7SgNF6HApvCOR/89vh4PD1ESNN9Yqq67Nt+LiSaImKNRK/DiRmMY/fmqrnZC@vger.kernel.org
X-Gm-Message-State: AFuF++mMkHteRW5X2CyfYnKo0BFVYoFho8ZRWDCJNS8B+LORhPCCZY+a
	uPD8mpqVT48IL3zlWZfxY/UNCByZWPZ73QG2Mb3KChJTVmdlYahQdNOtb5dYnHLYJafZ+z8m5/A
	SMuvTQwSliEpVCC52q3FgruRZcdCCVt5KkYelhRFo++F7hfthmPOkgkyfyIq3+teJWVXJ
X-Gm-Gg: AYBFou1z81W25/XkSr7jYgNbGWjxrKWP1EaWIjrViXhlpGhfbhWhgHUodUzrIMJKoQw
	2nC4LqsZrS62X2D6feob60y1Uo/DDm3au6cUWUsVkrX6lzfCTx04V3kTyU1/6/mx+FBmaINp9jC
	wsucHtrl/k/Y3jLRRe4D3RPmsiejwKvbX6FeHUQoQ5THpVBmMsVDnTRaiK2Th1Wr/lrNt9GZg4a
	FokqjhWWBIRo8+EFmcZsW0XrA4cZoUIH0FShe7jolzG9OSy1iYf7UtDpt81k4RcUBT0A73vGRm3
	uLVBisiAT6BBBxmU5ozB1gJg//duROY8D5g0HKO3JHBZf44GRHho/TmaJmx/GZbUQWGh7oPMEW9
	7TJvLHvxvzYhpM16OUz9kVg==
X-Received: by 2002:a05:620a:438b:b0:92e:6485:f640 with SMTP id af79cd13be357-93be06c07d9mr240482185a.4.1789733922570;
        Fri, 18 Sep 2026 05:18:42 -0700 (PDT)
X-Received: by 2002:a05:620a:438b:b0:92e:6485:f640 with SMTP id af79cd13be357-93be06c07d9mr240476185a.4.1789733922045;
        Fri, 18 Sep 2026 05:18:42 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa5979cea5sm785612a12.31.2026.09.18.05.18.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 05:18:41 -0700 (PDT)
Message-ID: <002eb70b-17fe-496d-870f-ac15c62fe32e@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 14:18:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] platform: arm64: Add a driver for the EC found on
 ASUS Glymur machines
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260917-topic-asus_ec-v1-0-373516d347ae@oss.qualcomm.com>
 <20260917-topic-asus_ec-v1-2-373516d347ae@oss.qualcomm.com>
 <20260918-calm-gainful-turkey-8ba016@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260918-calm-gainful-turkey-8ba016@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5L2rWX01i3DWpLXBqBkulxQ9E_ZXHiHG
X-Authority-Analysis: v=2.4 cv=ZO9CCn7b c=1 sm=1 tr=0 ts=6aad2c23 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=WnbzyOWOUeW_Ihyr:21 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=BxavHUX6cQikRYdMHAsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 5L2rWX01i3DWpLXBqBkulxQ9E_ZXHiHG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE3MiBTYWx0ZWRfX/HKN/yzN1miD
 rTObR9hILiPqVt3IqlPJwrchXAiIKNCrHGLOfKWGznQ6SP82MKgs9ZEm3VtbPU5Jh5hMFQ/ZNhn
 KjBf4TFa3p94NuQ+IIWWe1ya8nUSFTKROzC3u7lk1TndfI6bUVsOpCcNq2mX2N6CGka4a8J3u/l
 kw/JQBT3T3TJL5U7zNDmQWLSfrzvPMt9p35DL1GTjjej3CgVmRRUm5r2XLdZZCYiRcwJMspJc8w
 o7rKRVCCrCnDn/OQDxBJvHMyFuuJp7W8zpjWWJS/MhKTLatd4bqB0TvNkNiblHWfZjlUhHDm+LZ
 4dDtxX8DAP91u2OYnb1VPNm8UpDgHZlMwTflJhXFMaAipftWUKTNZZg84r/Bjh7r0I4wdzkWIIt
 D0mrHW1dZVexsNA7VSq8sijb3navGUNO8znq5jXGMffwhhMUalJDCLulVmq4O251Hxgkm0erBPm
 7JQCW8YaGRt5iqHMOVw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE3MiBTYWx0ZWRfX3MGNQPy4KIJC
 RBL9dWswVQF9FA7dw7kRj1tAVAfvbrf64ZuoCBl5SNV1VMcW2pebcPQopDrABd9+V9z/2QvNir4
 vfJstHYo+ngtfeWcWakUgL/B1w+suX0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180172

On 9/18/26 1:35 PM, Krzysztof Kozlowski wrote:
> On Thu, Sep 17, 2026 at 12:54:57PM +0200, Konrad Dybcio wrote:
>> +static int asus_glymur_ec_resume(struct device *dev)
>> +{
>> +	return asus_glymur_ec_modern_standby(dev_get_drvdata(dev),
>> +					     ASUS_QCOM_EC_MODERN_STANDBY_EXIT);
>> +}
>> +
>> +static DEFINE_SIMPLE_DEV_PM_OPS(asus_glymur_ec_pm_ops,
>> +				asus_glymur_ec_suspend,
>> +				asus_glymur_ec_resume);
>> +
>> +static const struct of_device_id asus_glymur_ec_of_match[] = {
>> +	{ .compatible = "asus,zenbook-a14-ux3407na-ec" },
>> +	{ .compatible = "asus,zenbook-a16-ux3607oa-ec" },
> 
> Does this mean devices are compatible? If so should be expressed in the
> bindings. If not, should be expressed in bindings commit msg, see
> writing bindings docs.

They generally seem to be, but because of the very limited information
we have, I don't think it's worth risking associating them.. Would
a mention of this be enough?

Konrad
