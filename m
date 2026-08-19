Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495E137A488
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 08:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787129185; cv=none; b=n4lfV9mD2VVOjhl8nZ6Pc2SDLLCE4wynTsf7bHLv0MPIeTiwB0S++T4kxRUBN9gwtLv/8NcnygpGo938Qkm0kNBdI0jxSyujNppuuOX5Yx79G2vIWxFmZi/eBzhLgYdJfSYJaVHVY3ZtK3bQwfr3FMY9PSQK66gEws/AKPnSfC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787129185; c=relaxed/simple;
	bh=q8mraRrmgHMVHGomDsnASw+W8JH6cTixoUL3mdpiFQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e0SC3X7Qpe85YsBG8T+6jT/8AAFok2Iy9ZWCU/Mm9UYqPqnqdhUJjf9F7PXCmrbq1UfLS+qWrQySqaT2qWHtZvAaiSmzeiFzzea+ZjxUn7esYEGXBiSjX4uc/qa9kmpec9vgP/+AKpd800MJPJ+7MNfPILBCgPNm6dn+yidTyU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NZPYXiYb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LkxS57aN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NZPYXiYb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LkxS57aN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6Z6sG2456369
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 08:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O3awk090fv+wHLhoaCMsIo8K0iIvej0ArJXTOk47NXs=; b=NZPYXiYbg4ySdN5t
	zUNpV3HRdqK9Lx9Ko6RuLzoRqVXZzRrKQa8zNx3efGyZEuzTlw2+UIlE4pcm265d
	18Pd2p0qrI5CD2xzY9YJICvdRtOFLErlGvvYqfF/eqmUZVCNPDv0Tco1kDEAttLy
	m4ZyMCRlxOTAsSSSq2WH33Gz6fTyaWlEZ5eQtPKfui0U5Su8Bz04t0mJYOUrX9Oj
	8SBRgcbJ5bL0I5BzjXA1aEOshQ8dHi28jBugpAPkCOAujlLbOdm06gYTByvNwMnt
	Ee4jlZ/3oYvn5ohUMcZ97FrpOXfK1Dujp6//MKLUszlGRRdukG7eZ3qLrCiFJkWK
	GlONGA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfka94g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 08:46:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c9d953b71so1103721cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 01:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787129181; x=1787733981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O3awk090fv+wHLhoaCMsIo8K0iIvej0ArJXTOk47NXs=;
        b=LkxS57aNAdY7/khGbNGRC5FDuWNA3ljHEAmip4KrH3tyiD++v7kWKJPYFBXOUZ0NoL
         vicyoyzss2URzL9h4VyzASv+7hn9/bBj2lUnmg3LIiewujlIinrVrbnzPebVoztJ5jLN
         g7KnQvFuPO4oUQDY3MdNTB5XJZEJg9P5Q8iHg27qJFr24BlylIMCAYN0nM1mntnkZODE
         5AlBgH/dz5SoQV5IZ5/mJctUcDRlM02fitUGycycze47sJr2v4/G/t9CQjKU83yyUtRE
         WiLcMH1h0irK8PfTYzAinnYsOvgIM5yWNr9jo664TnRhKMYBYELJNB+KQskZe6eaxXYI
         CdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787129181; x=1787733981;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O3awk090fv+wHLhoaCMsIo8K0iIvej0ArJXTOk47NXs=;
        b=MKyElkb6kVVFRlzGezGKu2fF3SaWgTV7MuuA1jTnwJ3aLoFkSU/MTLhhoWzm9U8sR3
         cdieXaJBkSCmtHgS6SNX4Ukp3/mXSpwMAYWNvu+TPNZJxik1rqwNSslsT/KinhuC5WLM
         zZajE6JW2hZGF/D1Hb4SVuoMV9mYMH0x2l9t4nJQw0DT5CA/OpE5yorpLCT7OxFvALw8
         CngXxYlJLtRiesoqE0cO8qun7+9aOk+y2bxK12ZXVpNvF/J4DGTNiOoXrC/bPpYbVrXR
         f4QqIojQfmbvRCoteDNudsoi5shBBMvqxFxx8/AT+28SSsbncKwFGm65PAZ0n3ep/1Hd
         PkiA==
X-Forwarded-Encrypted: i=1; AHgh+RpNqyXrTKmnAMoaRfR6GYH6LVn7yUWsSSeSwNK4a4rAM8BnakV9pneJkpF8EZDdkg7uqETu/cdLnROilA9i@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9K03crtlZQtEHcOH/mRDPm6HoEolNbHnexUZDmkiMCLxhHpAy
	vv7yZSCSnooalFBfdrnZx5iet3S92Mz+DiKziv3DyX8BwcWfb/F4Ls7csKHIzg+0DVTaA9r7oGM
	U6NB49PTP2Zh8yqJlEf5zyjmrvlvdCkU6Yc8yEp1DXpZkMMnA1hIM3fHZEjP6zn9Iki7s
X-Gm-Gg: AR+sD10X6XARKUmck/1uOGXlkOp1GGM7fHxt922Dr4qACrO9DU7eOrxnwpzugKAq9qQ
	JezLDLuWktOp42sEcBKV8RHobUbzthjc0o/3gX0d9Vef43x2bYG5+5gGqjvveaTXRm6jEZR2hk3
	DEZs8HVB9ZiHDUxkHfWgfqiZtafD/mX/BJRGcMclz/w+JvKsP1BTPpoZJwVwFunyUmhGMFqanzc
	FLaB2GFxPA67hSyRdzXFWOjP6qbKqDJb+BiJiaAaUWRKHVkNpmvYDM+WIPPyrirDqZyANP1aNIN
	X72qmyvOCpczc6FZQMWX18dFHVdd5hIUDURX4XJV/HycTwWqjjUCZ425vj7PXhHU1PIXp5jc6dj
	3aHK6SMsBAjYkfLPANidyH9bL
X-Received: by 2002:ac8:7f0f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52dd5c958aamr20664811cf.3.1787129181239;
        Wed, 19 Aug 2026 01:46:21 -0700 (PDT)
X-Received: by 2002:ac8:7f0f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52dd5c958aamr20664521cf.3.1787129180657;
        Wed, 19 Aug 2026 01:46:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c7abd4esm45824666b.18.2026.08.19.01.46.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 01:46:19 -0700 (PDT)
Message-ID: <917a711e-0626-4066-bcf7-c87468aed933@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 10:46:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] power: supply: qcom_battmgr: add Xiaomi taoyao
 support
To: Stanislav Zaikin <zstaseg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260818151039.409767-1-zstaseg@gmail.com>
 <20260818151039.409767-3-zstaseg@gmail.com>
 <20260819-slick-spotted-chamois-962510@quoll>
 <590e7881-de96-4de4-bb50-1e91439b92ef@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <590e7881-de96-4de4-bb50-1e91439b92ef@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PoGjqQM3 c=1 sm=1 tr=0 ts=6a856d5e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=d2DcZoktuL7L5Z54p5QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA2NiBTYWx0ZWRfX/h2T1b1Hap/q
 dWoFy4+aSmhyznyVja2MbcB9I7w9tjLr24IR0EBJyhfjNJS20Gwgk3CqkYrn/tt5xJRouzgcOiz
 RaUvnwqrl2Vh5DE1ay0eXLTjuH6V0pz7ry8+ChTm5z3aEvet/1O+oPB/4Gvkj6bx/0Ugn6XApXC
 a9ySQv8uLfBvOI6lDVbHQdlgfILm5CGqOB4maHbohzTtA2RFFieyWDIwr/cOjmInsdrv9Ofvl4h
 zWZsODKgNczLSDRa0gWGqJ/bEf1L/ACnBUGH0X8orQX8Q2daZYxg1/6ls0+chbM5JX+w8Gdi03m
 NMW3jadBNpBSvWHpsvCZ+tBcsYNbPf/YQ5Ll0nzo+7c6DEO0WlxNqPG0WJZdMc3xHvGHYiB1Tg9
 nyu9IQQ9V6OUoWHdUazKTs//pJSfR1+GLIDQAx+2r+rzk8f/YYq77kDTuUNOgjFaShJuXXvpEqb
 mMcLqa34omdl+QKIWFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA2NiBTYWx0ZWRfX4wnzn7szbjlm
 bMlQKIY571vrObkuhKj0aGiktabrapcuFmRtU9tc3dac8d/orwM3QjrNFLb/dJGBPkbhxzjFzJA
 8ijjtCkKW3dy8jy7qf1t5bjk4zQ64aQ=
X-Proofpoint-GUID: lX0ubGUqARxUWe93Va0-FUo-9-k4CTxF
X-Proofpoint-ORIG-GUID: lX0ubGUqARxUWe93Va0-FUo-9-k4CTxF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190066

On 8/19/26 10:37 AM, Stanislav Zaikin wrote:
> On 8/19/26 9:11 AM, Krzysztof Kozlowski wrote:
>> On Tue, Aug 18, 2026 at 05:10:38PM +0200, user.email wrote:
>>> From: Stanislav Zaikin <zstaseg@gmail.com>
>>>
>>> The Xiaomi taoyao firmware defines an additional BATT_CONSTANT_CURRENT
>>> property (ID 12) between BATT_CHG_CTRL_LIM_MAX and BATT_TEMP, shifting
>>> all higher battery property IDs by one.
>>>
>>> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
>>> ---
>>>   drivers/power/supply/qcom_battmgr.c | 86 +++++++++++++++++++++++++++--
>>>   1 file changed, 82 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
>>> index 490137a23d00..390d7c75e36f 100644
>>> --- a/drivers/power/supply/qcom_battmgr.c
>>> +++ b/drivers/power/supply/qcom_battmgr.c
>>> @@ -24,6 +24,7 @@ enum qcom_battmgr_variant {
>>>       QCOM_BATTMGR_SM8350,
>>>       QCOM_BATTMGR_SM8550,
>>>       QCOM_BATTMGR_X1E80100,
>>> +    QCOM_BATTMGR_TAOYAO,
>>
>> T < X, do not introduce entries in random order
> 
> Hello Krzysztof,
> Thank you for the review.
> 
> Will fix in v3.
> 
>>> @@ -1381,6 +1453,11 @@ static void qcom_battmgr_sm8350_callback(struct qcom_battmgr *battmgr,
>>>       switch (opcode) {
>>>       case BATTMGR_BAT_PROPERTY_GET:
>>>           property = le32_to_cpu(resp->intval.property);
>>> +
>>> +        if (battmgr->variant == QCOM_BATTMGR_TAOYAO &&
>>> +            property < ARRAY_SIZE(taoyao_to_canonical))
>>> +            property = taoyao_to_canonical[property];
>>
>> So device is or is not compatible with sm7325? Above code suggests that
>> it is not. How does it work when bound by sm7325 compatible?
> 
> The device is sm7325-based and when bound to sm7325-pmic-glink it falls back to QCOM_BATTMGR_SM8350 property map. However, due to shifted property IDs baked into taoyao's firmware the parsing of roughly the 2nd half of properties is broken.
> 
> And any userspace process that reads the battery properties via sysfs suffers from 1s timeouts and it basically hangs my DE.
> 
> Since this is an RFC: do you think this approach is better than what I described in cover letter? (manually shifting property IDs)

Krzysztof is trying to say that even though the device is based on the
7325 SoC, what the kernel today knows as "pmic glink on sm7325" is not
compatible with the customized firmware on your device, so the fallback
compatible should be dropped, as it suggests that is the case

Konrad
