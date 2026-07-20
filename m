Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751A2352C3C
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556139; cv=none; b=LmOLiEsse9/dfm32nlvRGymT78ihqrJp1mSDFAfMyqUoApqd9/x1981O9pmek2qkK/NlSsCbypy6ZW2HeyHcernBfBsx5XmQWz6muByuYMfJdymbBiCvI8oeF+kQywOkUtmkJkqhJFLwtrU4sRJCn5VMm6CBdHKnMMRRYpUULMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556139; c=relaxed/simple;
	bh=k+xGFny4AtHUe/z+uwLMvqdlk5Vb4YYI1phGcXQdCn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M5Cl+ZBzV8BGCEOiekWZYNMuMkaM23j3fxEkmnnZJ1F9yK6Oeyi/bfAYxgxEbAA+Tp2imucuwN+hfTEBOL6xoAchha7wDE/lq7Epd4vzKUUJOdM+dLhn5wikL1QgBwMJdeJkPOG7QoRe0OkQhOnQF1LO8Mftflu44pSmB9SdxtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R37Rpw7p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BIzLxd4f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R37Rpw7p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BIzLxd4f"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDqZTi2498883
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lA/IMjFuXqZio4SG1SxOvRIX9lgOxQfU7bsItBl2BZA=; b=R37Rpw7p2eo+K9zz
	1lZS6+M6oW4KuoAgUKsix8gV9z/GuuJQyQjzWp1mqbnWhjSo5cEcK6Xz8480FtR1
	xTNUIfbMyuP9Exkg4DhLMjRMZyIgMG3KZ5/afIqcgoSr1t6XPUeqRgiw8p3zw/qx
	HYng2j94WVKO9vXsWm9fYklBgNdtS1+KFuB26wK6dOzvN4rj3reSdM8jkvVnpVzj
	GAxY9+vwExzEOBMTHe2keKVbasoFxpI3191zlvGXs1TpI073EmaW5wqIjEMTDDGS
	J6/s/VyNDZi3Sp7yqvDomuUH+VKsSUG49GFu7KuouTCO9DgoqM60rtrCbuMVKT4C
	/AU0Pg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhh5y14h1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:02:16 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bf9f78f126so504708e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 07:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784556136; x=1785160936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lA/IMjFuXqZio4SG1SxOvRIX9lgOxQfU7bsItBl2BZA=;
        b=BIzLxd4fxVRmCiXpsKPP/BVQ30OzsZEx0ZQyOWmGbaRG6JhihQV1PvcCqwRwf3r/CY
         yXO/TPDcAl9kSrxVQsnbmwpKlKy9GVPyRDUnCzhwPhO8rFuTM9SGENeO5Zyt2uEn4voV
         dMzBO44PNxKwkrHcEdbyfHUiZ4ZucIxDcsijq7QADD0OIABfCpFp0ahN2xY738WAcOxs
         3lbnGBmhDW9fw/mH1oSHYVrU98fiGAw7uc1hN4IeeWjheCr2Ey7LCDsw7yFIl1XMem8U
         13cllKZspB3/gz4C76p2n1sMeSS5oAkMLj4QAk4iOS5mpFAl2YOpW4gLD1wmosAgwPKi
         sA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784556136; x=1785160936;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lA/IMjFuXqZio4SG1SxOvRIX9lgOxQfU7bsItBl2BZA=;
        b=Mx5oXPsnZhyv7IQSeu0E1htPaufUN+x7+zz6WF80vb8zpAODO30hUfUnC+MuOSVqMt
         DOxjk4Vv7S4QBzLWvvoXhkMgnbdhnymDYBzAKT2nuMXivHj43xrgwcEdyJX+1o8e4ukJ
         4DR1nLwuTANN7Cgfc7lG/6MqNoMK0EQejcVcwTL7Ej1FLvQcZSXNX3TaYIlBil1MDDkA
         M+rYrbmcbgVLh97/6NjDZczxm5kDnNmK26GKM77HN5lcEih2wy6AJ1f5/ffoNuyOSd7N
         uYvb2lnsqO93HjwHdeDOn1Ez1JiTHpnKBtcdVSgOH2arftdiWAUUGJ/tpV5rlMniiZ48
         TTEg==
X-Forwarded-Encrypted: i=1; AHgh+Rp5VWx6ynUzMRNPzd1/V5SWpI5qRIwnYkzp+N3cqBVMkRM3kLF5rFT0ORa8qklf1PPhvtJKCPMsKbXVlhsV@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt9nPbaAebzs3i87aHWAAI3tFen+w0AqEyID+XpgelWYwETXlG
	/R0OUyRQnJt8sUr0cct26JyApRjzh4uqC44rVm01dpVdBHLjBUgZaNGo6tKMpiYRmeJpQd6SuUH
	zqjf76/actCnKYK7p65zERVrqSnwwMGtS0gBKzDHLelvygbZxDK0MuCc6P+nmT7ge5wXEMLHDC7
	DI
X-Gm-Gg: AfdE7clNcFz08VGoNgqY02oKU1FETSrVQQPwJIDuhGKBSRZQFtz615532RgSPlOeS1O
	p2G1qPiysm/JOhneALwO2q2JPRNUpl4UfWnQ/umaURIm4GfvU34D6VdAO4UxIwVqEBRNOnHft38
	SDqYBlyu4V9fWg8dTWUZXYzGJx7L6c7Zq13q55eJmeZBOjRlkPpS+VKiif4iUQUk2JtWBWDmtG8
	EKjgXDaOvKLErTU7fFsC2a29l6z66waRI4f1C1BJ14oRpKmnTQdRljVxOZWxtIcJADnH8BQd/Cu
	aIFuGg2rZzQRNT1XOk6WRzUxx0sNEKpM2Gz+IE+oVsYq8W0y3F5zqPzpJ19pnBTanhmi6rySpun
	8TispQ15veIxpOfEnYHVz5Qzg
X-Received: by 2002:a05:6102:5246:b0:632:9ebf:6069 with SMTP id ada2fe7eead31-74ab47556bcmr132792137.4.1784556135811;
        Mon, 20 Jul 2026 07:02:15 -0700 (PDT)
X-Received: by 2002:a05:6102:5246:b0:632:9ebf:6069 with SMTP id ada2fe7eead31-74ab47556bcmr132743137.4.1784556135195;
        Mon, 20 Jul 2026 07:02:15 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f837sm482769766b.32.2026.07.20.07.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 07:02:14 -0700 (PDT)
Message-ID: <216e23f1-2074-489b-bbf8-0a781a57eb50@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:02:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] arm64: dts: qcom: Add device tree for Nord Ride
 board
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com>
 <20260716142605.2398433-6-shengchao.guo@oss.qualcomm.com>
 <90769e77-c311-4a4f-be37-09065e217f55@oss.qualcomm.com>
 <al2iDH2b_YxdHfLO@QCOM-aGQu4IUr3Y>
 <d5240c7c-6450-489a-97a3-c774deb129b5@oss.qualcomm.com>
 <al4qB8gIyLSjPBGS@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <al4qB8gIyLSjPBGS@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE1NiBTYWx0ZWRfX/S59Qhw0yM/6
 cgsi3ThxChLiNaUXga11QWTLqH7zrxL/Pt+XmNsNySK15ZOEu73ZDrIIvTko2m120YfZSZ5ivPR
 jA+FEeWJ6FYh1N8AlIadUIkfltYlX3Q=
X-Proofpoint-GUID: NsQ8YxE6dZjifY_IwpD9S9rgI9fMZbt2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE1NiBTYWx0ZWRfX7FSFmq7DmpDt
 9pKU1HHgtxwmizA8hge71kGtUYvt5kkVf79RIlcB6j+dcTVpakzx+AB8m80alNVBzaLkOz/nwaj
 dwWxskGLVUqDmAqjTLXyFH2lPrA2yw8ygCpYaNp/SJFp0OGO+n05p02kggDxIckFaOAe69rQPGf
 qgEk1nGVBOtN9ARy/4y41w+Sy+B4osyVc/b461ftOpmwtiMn2P5iRbP0nErgBCOz1xPr53rzzA8
 /yqzOezhFCpZEaaCVPWzLNg4cAqsQxnjNG1cBb/USbpqeSew6Er+VgWnMXceiMq0aS1TnzU4ydA
 H/CGMYBtWHsU92WKRRlpp8QBe1rfk2qboOtkFwp4J0nmJxFpKr+YNtkI0ovltZwzZaszPWed/dJ
 qxOdbzx+IWlWKTFAkNwoouqJeCoBEA==
X-Proofpoint-ORIG-GUID: NsQ8YxE6dZjifY_IwpD9S9rgI9fMZbt2
X-Authority-Analysis: v=2.4 cv=f/x4wuyM c=1 sm=1 tr=0 ts=6a5e2a68 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=AGgUKOJZDmLg38P9jMQA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200156

On 7/20/26 4:00 PM, Shawn Guo wrote:
> On Mon, Jul 20, 2026 at 10:40:09AM +0200, Konrad Dybcio wrote:
>> On 7/20/26 6:20 AM, Shawn Guo wrote:
>>> On Thu, Jul 16, 2026 at 07:14:56PM +0200, Konrad Dybcio wrote:
>>>> On 7/16/26 4:26 PM, Shawn Guo wrote:
>>>>> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>>>>>
>>>>> Add initial device tree for the Qualcomm SA8797P Ride reference board,
>>>>> which is built on Nord GearVM variant.
>>
>> [...]
>>
>>>>> +&scmi15 {
>>>>> +	status = "okay";
>>>>> +};
>>>>> +
>>>>> +&scmi23 {
>>>>> +	status = "okay";
>>>>> +};
>>>>
>>>> Why only these ones? Can all of the SCMI servers be enabled?
>>>
>>> These are the ones that have actual/enabled client/consumer devices,
>>> e.g. scmi3 for ufs, scmi11 for uart, scmi23 for thermal sensors.
>>
>> We normally refrain from enabling resources in the DT only because the
>> OS (really just Linux) doesn't have the necessary support to cope with
>> the ""complete"" system description. In this case, there's a firmware
>> layer drives everything and handles on/off requests gracefully
>> (hopefully).
>>
>>> We can enable all the SCMI servers, but I'm afraid that cause kernel
>>> to map shared memory and issue SMC calls to discover protocols (like
>>> power domains, DVFS, resets) that have no consumers, which might waste
>>> a small amount of memory and boot time.
>>
>> Please give it a shot and see if there's any immediate
>> problems.
> 
> Sorry! I have to take "We can enable all the SCMI servers" back. I just
> tested. It seems that NHLOS ABL doesn't like the idea, and it
> fails/refuses to boot Linux Kernel when we enable all SCMI instances in
> DT.
> 
> I can try to figure out the cause by working with Auto/firmware team
> internally, but that likely takes some time. Can we address this later
> as a separate topic, so that the whole series doesn't get blocked
> for v7.3 merge window?

Yes

Konrad
