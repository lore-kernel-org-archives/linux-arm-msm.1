Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A1E3B4EB5
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784279984; cv=none; b=jAeSEw9qyBMQOM3lNHHRP9XZ7DHebTKnwqLgJNmQyzN9x4TTZeoh6jt5g/W0WjDWwJiV9ZAyYE2ODgmSqGdFJDfHiEiOmaL7MGjkjtkqZeAEzJGfhGO24KsdrxLB8LFmnv6x4lc8JtX8oPH4R0QlwMf9+3enabFLiHIrRTfmnh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784279984; c=relaxed/simple;
	bh=Hzglabe4fPRfpMhvzvFOhd9PrI7n4OZPOiOIVE4Fp3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q9BRfk2ry+s559+PAERHwT4NJIcDlg6j7sC7GATiX84Qkl4qTkE0nJOpeonWlxN0gbghhwoUFO9jmW445Ja937h+sZKJci4gp3oIp4UXRUI9pWp6h+eafUo+xfSNUzelU9LWju0v0E8+PMNQB+qdkcQAsOsAMMSlRQedWeKq3MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZmbLp3uL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AW8CmSZK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZmbLp3uL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AW8CmSZK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cT2j794370
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jnWJTq3ZZfdGzIIHwOFOt1HkgzENpzxRhvMtusPnSOU=; b=ZmbLp3uLosyqjFTW
	M7IlmuApo6IEagko80gfYY29NIZ2F4aqEnSZ4JvBrk7XQYDRsxSymdjV63kBMCaK
	vCbLmDV9ZeSOLSDr6eRaceNTIcWn1yr58wSLiaxZwqS1ZV8bZvaEBFWYnZFAqGEK
	Y1M2othd9oLr+oF0/n4SimhJ3xvD6kLQjP8tCJVZCryueG3JGA025Jb1BWsXvvau
	A9km4aP4oBjRnSkFw9k7GOJcN/nQo/UF+lpTXaAg3EKBftlqspsIw4wyk9VKEJWv
	2mfGD8aTRYC1K5ma6w0Kw7kDga2d5O9F6LBx8nSDmfZIXxdhV+OXy+H+2ffujoCs
	oO5a8A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8k1ya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:19:41 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84885a4fcabso5194277b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 02:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784279981; x=1784884781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jnWJTq3ZZfdGzIIHwOFOt1HkgzENpzxRhvMtusPnSOU=;
        b=AW8CmSZKs7BZSnkmxyeQPjRN583VYGJGw2Uqzn7bzD3U88RM6AGXQm6LUdNSOQfCBg
         HbMYRMkDRkKdZhz593Ck3p821SyIfy3LJv+n+rQLUisTR3BkvZOSOVujyWo180TYKgDS
         QZHSdHS3/Z1FuJt7Qy3H5HRQFi2Ijjj++bFHaseR4ffTAxg5hE2cCK5BQMbG446R9LMT
         XFdhAkFJZX0AIcmni66+jlPsJy86RtRI+WEussksk9HHdfLH/6pz5usvpQMC1LeEmkph
         aazCtkPcMo20cyhsdj1H6woam52CoTb/i5qEDrTCZL7ACqsmkFxAY6DrmruubDwjPRSW
         zWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784279981; x=1784884781;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jnWJTq3ZZfdGzIIHwOFOt1HkgzENpzxRhvMtusPnSOU=;
        b=pW+WOnw/Tqj/N377xisQu72vqmt42TbO/kGiWrbz7R+VErkNL6Ra5uIkcYevCCVbrY
         uZtQxfkaCR6IXA70hHHk03L1TLUqb+557+eelj1yLT+PqA/qgyAGdJiHZDwBCO5FAiU7
         ZOdsfd3hvWsiGGpLs8WnDwfIUmJPvGR8DjYpjV29yaxcx43HkoKj67Au0fiNrsYs2d0B
         a8zecAGOXuwEBakVSZJOY4p2Neykpw2aJZAbxXfkdxeKFT8bPVXFPGwot85kF3IqF8r7
         mQFm8lupVW8pJlVFm8seUL455mPtLW5U3+B5Xqx8h3T+4b+xDJeO06vxeiZ4ieIjnPOz
         ty6g==
X-Gm-Message-State: AOJu0YwRXqgL6/Kt/loXNHmpSIonBot0fyRUqDxqsKniUzORMAS+61WE
	NvPo7O3NUGtQrD8KFIIGgMcTMNAwcXWg/OFy26bUgnMa4iDR0OZzbpNkvQZGQgPOkw4S990VxMG
	ap88copc14mKX1rncIwCSvoydOwzIeaUNF+nxKPOPOFQ+5AV6Iz67tYx7FZkdsTUvFzYn
X-Gm-Gg: AfdE7cnej3nBBC082ldZY1E2G15RVQPZpeDzmqYKZv7729L7JoIt2PeO+/24t/IybAU
	omf7GWyWM2AOORrlKNeCyM9lfM+7j7oKyXy2XP9/1T2CV/wirw55PJTcdNjkQFk7Bg9nZdT4l/8
	0Ek/Ns6RMx20nbluDcE95fFZTFMe52zZY4kxYIpfYbDFidBszc6Miodv2Zzi33xn9kv4y01/Uq6
	woM6ernNA6VOOcsLKYRyyKDZ6c5kpWvdgIjp9YgGvePfkAD7dHCurF1iVUOliQgTehuo6IMkJyo
	NdsFvYoM2LOu/InzkPgc4Qy4nGy9UfCo2M84q1IU9HC7JPPDnqtKWPGvowu/hX19b8Xu7UKJCVk
	gd+5VBUyVlAxUg2lB79DUVnkUHPk6
X-Received: by 2002:a05:6a00:887:b0:847:e2c7:59c5 with SMTP id d2e1a72fcca58-84c294fc35bmr1785580b3a.49.1784279980799;
        Fri, 17 Jul 2026 02:19:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:887:b0:847:e2c7:59c5 with SMTP id d2e1a72fcca58-84c294fc35bmr1785532b3a.49.1784279980040;
        Fri, 17 Jul 2026 02:19:40 -0700 (PDT)
Received: from [10.219.57.117] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcd3dcsm676117b3a.24.2026.07.17.02.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 02:19:39 -0700 (PDT)
Message-ID: <c74550ed-7233-4a21-910b-409ef705171f@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 14:49:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/11] arm64: dts: qcom: shikra: Add
 gpio-reserved-ranges to tlmm
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Anurag Pateriya <apateriy@qti.qualcomm.com>
References: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
 <20260702-shikra-dt-m1-v5-11-f911ac92720c@oss.qualcomm.com>
 <9c1aab59-14b2-4811-b778-8e96645bd65b@oss.qualcomm.com>
 <97b205e8-5ab7-4205-b1dc-cbcb0497987d@oss.qualcomm.com>
 <986da1da-db2e-4d4a-b9d0-70482adaf4bd@oss.qualcomm.com>
 <4f641f13-a278-4465-8033-670c7279a7e3@oss.qualcomm.com>
 <1153ebbd-659f-4ba9-9317-66ece33423e9@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <1153ebbd-659f-4ba9-9317-66ece33423e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 29vw4cX9gHUuV6MqIeC_S075DLRcjuB2
X-Proofpoint-ORIG-GUID: 29vw4cX9gHUuV6MqIeC_S075DLRcjuB2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5MSBTYWx0ZWRfX5nt48CQEQG1i
 rQWA5vM7PZdlYX/dFW9OvIW/ubthHd9nOCyiH68lTuwlhK7foHiAAwnespS6FeG96yJIrMJrcJW
 F+7GWyaiS90KX4nvL8NUdVZ/Z1UNems=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5MSBTYWx0ZWRfX7BR6Jgs+FWp7
 WIKCJU1ZrZ6F5LtCxEGf+CwEkNPDK3lI7bfSMhbST0iE4p4izUmgqAaywXInSLitt+xNN6QB2uN
 43YGFxEW4fJYHAbAL744CLY8gY+WKJL/Uoo+XNtAKjDOT/DzkBB9MrAUpoGg1V1mqF6VDb20ICj
 NR/7sAE7kzFMzwSzhT3mdR032DmfheeYzzYudmBRyizhZ6sBgIH+TZ+qIEEDuaZq4mwUuJPdzVs
 yA8lCUkxvoDdAnwAyzKaBUPe0eZ29EBUhA4zwmkZ9o4rtECZsBrEJqHnSPF+n4kTaihiC8coTcU
 nxIt8gEGudtZ0R44Ps2feNudj/TCs+QigpXE8OEWCB8SchyIAS0wogVb+hA7KWh0jyyoG2xI4cO
 +NkH+Qt2gBOUY5xWSP0XN8WqaTVPpsxEoJGAgKhO1ecFtnkh/g/1lfkfPsCaazjDQY0sMF679CD
 x4+jl7xQ7zkLZjpXGkA==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a59f3ad cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=lo2R6pnlw34kmT72REkA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170091

On 7/17/2026 12:03 AM, Konrad Dybcio wrote:
> On 7/15/26 3:41 PM, Komal Bajaj wrote:
>>
>>
>> On 7/15/2026 3:57 PM, Konrad Dybcio wrote:
>>> On 7/7/26 6:36 PM, Komal Bajaj wrote:
>>>> On 7/2/2026 4:25 PM, Konrad Dybcio wrote:
>>>>> On 7/2/26 11:50 AM, Komal Bajaj wrote:
>>>>>> Add gpio-reserved-ranges property to the tlmm node for all three
>>>>>> Shikra EVK variants (CQM, CQS, IQS) to mark GPIOs used by the
>>>>>> SoC internally and not available for general use.
>>>>> These are generally added to prevent non-secure access upon TLMM
>>>>> probe, i.e. the board won't boot if some of them are not protected.
>>>>>
>>>>> I assume the proposed set contains both ones that are _absolutely
>>>>> forbidden_ for Linux to touch, but also ones that are dedicated to
>>>>> some specific purpose that Linux _shouldn't_ touch.
>>>> Yes, some GPIOs are reserved for secure-world use and are therefore not accessible from the non-secure world.
>>>> I will update the commit message accordingly.
>>> I'm not sure how to read your response. In other words - is this
>>> patch boot-critical?
>> Yes, with Access Policy enabled, it becomes boot-critical.
> Well then, I'm no less than surprised since we have DTs for 3 boards
> in -next right now that I'm learning can't possibly boot..
>
> I understand you might have disabled that at some point during the
> development, but it's clearly not the configuration that's supported
> by any means. Please make sure to take that into account next time.
Development initially started with firmware builds that did not have 
Access Policy enabled.
Recently, firmware has since been updated to enable Access Policy, which 
makes these GPIOs boot-critical and requires this change.
If its needed, I can add Fixes tag.

>
> For this issue, since the pins seem common, perhaps moving them to
> the SoM DTSI makes more sense. And this most definitely needs 'fixes'
> tags.

Makes sense. I'll move it to the SoM DTSI in the next revision.

Thanks
Komal

>
> Konrad

