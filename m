Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A373D25C2
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 14:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742929; cv=none; b=LSWTWOIav20u2aMwd9xzLhhXmHKMELlG6JLq5y8lG6Q4iBIYZhhzjYj/JgE/zzEkNwRWvgbvpjOPqfx/70pUOlwW2pChhO/AZrxxDrEcu822G4Ujg7ffkiOcdD3vJt/kJiRi0fCldegYFBVtdn3vkrmIdsNjmpL/ci29x1WwYbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742929; c=relaxed/simple;
	bh=grQaeezD4loaQ3dOGxCiDT5OfyrOGQRea/DATIc6/hg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kQT7NjrA8MIvvSQgWso3tofi05qqoNmWKPczGzLMtq5CvQG/Xaheffzkx418i1R6b/ZDzYLgUyeOLnqCLaUWUi/HWrsQkOO9yvRvXjSCuM1KhcJ7Q7RR8tEzsep4/DoOHk89ke53vXWmYmHVIUrmcdQuXaUkKr1qQLGsObfbWUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=neK5cG8A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nws3o9GD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="neK5cG8A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nws3o9GD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IEQvCk1020014
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 14:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zHH5No/d6gK16qDfihynuj16LmMumAiiVmAs/BzwDkc=; b=neK5cG8AuR+jOvy0
	3tl6pVJjFoD/X0tupaQ1EiBON5lQjYY3VACqmtdocu5OJ2ylQi34YJ2sv/xBqw5J
	CxZp/+GWO7uPW82E/UCudAPEDe21rD4bP8LsmNGJGxFwThFHdM3MjbXlf2DQn1mx
	p13KjkULEaCUUX4AGpb7+T6326hRnViTMEW1fLL+sOSC3uVeaZGokab0OJNyRpwe
	zJ+Nk5ckVD9QTx/GIF28f1UWYgGuFUSRyBKklfmVG1LCB2v91aBl6Y+dE5h7m7a4
	DiEP0K4433MVL4nI8JYmmLeQHZgxyFQiizLYW+S2bMPsRn9EKCZvK2DwEeabTq3U
	oru+gQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs72u035k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 14:48:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ae8e7e546so172810885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 07:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789742926; x=1790347726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zHH5No/d6gK16qDfihynuj16LmMumAiiVmAs/BzwDkc=;
        b=Nws3o9GDICYZzlA85AW4+tlvneIdXGJwKOg89aUY291x1f7EkMZmkwoatnb+Flvqog
         PfSH2nKeDgr7za1YxWuf+rbdamroMsC6t8Ky6COkAX6+Hs8Cgp3jThVR/Kq4xwwA77FZ
         M+dvzDSLIyezJN0ODMFov1XLczD9OOfwB0vMElCI3lgCVBsl2rlpOgRsLI2lGzUW2vhv
         xhx4yV8dJQItxtgYAxw51juSUko19bvpajc8VEKPB7c7AGClZgzzEpUtBIwyFDV94g4J
         jlKkrAOWMWl5HeDfZ6uXvY8zTDjeUbcCecJP/ANyIzL/u7pU3hSCOvoz4uo+9AigFasv
         LWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742926; x=1790347726;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zHH5No/d6gK16qDfihynuj16LmMumAiiVmAs/BzwDkc=;
        b=d16OMcDB9RgVh6XkpzkkRirI9CR8JKyPQVaZrN0plD2+Fm2rLbKfA7/uRXMGLg/rFM
         6mxtFpjS9TrtCFfM8Woz4/2re+wUDNMaagSkQXnCRpw+U2DDPuG5ueM4aHZcpjXbK0tB
         cD917udDc3TXqz0zgppsfDongczoYnV9lQJGiH5kijrp3PjNAsPaWAkIV0F32EZ1QXjr
         EndRC8a5zEXgjHvaBwmH2wHSZ7HR9B6lhfXt4iU1f96QQe4LAm3M2RuSYqMXVFMaeTl/
         xQEof55KmDxgjajSLfZKQESPka6mHCS/OFs8+NO3BvD9M4Gh4p3xFxM4jpShbzwPA0gG
         eH1A==
X-Forwarded-Encrypted: i=1; AKwUvBwO6ukRC3MsDMTIzwgHjmk2tbzhIvZja/Ysv8bVMLS6PWsA8h5fB4r9ydjMkiNAeTvcdk7Ac3sBpaIEuykT@vger.kernel.org
X-Gm-Message-State: AFuF++kJI32Ns0JN3VxLvXdo2wqk7pblzohynY3gGJf5sns8clvBVnMa
	PfRsXQrW3DttNcg4xb9CI+2Jy/64ollybh67qD8CaaeCZCNLkXhno5VS5F0XWaYCdDVNChdUygv
	ZMYa4JtAmwIviYwDSq/GMhBatysuuWTeaBqDlBMGYs1lFmy7BqWRkix23Ab8SN8PzUYUm
X-Gm-Gg: AYBFou2Jvd+tU7xSto9U5e9WIi+xc/sU2+fSiZhblJrCswwwzQNhUkAvuxHd3l690tT
	90HHkSYVuMeuVQGA0p6hvE6qusugOXLpdF2tx0O/Wu3KorEPOSnftEHIGNHleXdsidox9gtAiuP
	KF3etHFMYgTvvds5eLq/lLq30r5RVu1Azd4sukuIyStgTVC26GQ8BpfZ4micGOhJ0fogp0y4iSx
	PptMBO6GET5EAhemJPPXvUA1G0xpBgw9WsvCvzsgal0ODy0ZS+LlTWZ0KHRAobg0c0kyGfvUk+q
	7HkzQ2xjqvgOI4KMofiTW9FbKemzCTJSuS50mYuSYQin2ketNfMOSciNx4KmxQn8xQ0HETG05Mk
	2mJFBd9zpChnMm5LDFFEyTedNpo5YPOZCZH0NX9ZEJ6jB6kgxlypYwaFBNpzQpq8=
X-Received: by 2002:a05:620a:4686:b0:939:feaa:949c with SMTP id af79cd13be357-93bdc7503a2mr376113485a.36.1789742925572;
        Fri, 18 Sep 2026 07:48:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4686:b0:939:feaa:949c with SMTP id af79cd13be357-93bdc7503a2mr376109285a.36.1789742925068;
        Fri, 18 Sep 2026 07:48:45 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:82ae:cd75:d970:e66f? ([2a05:6e02:1041:c10:82ae:cd75:d970:e66f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcc1160a1sm12355955e9.4.2026.09.18.07.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:48:44 -0700 (PDT)
Message-ID: <b5a41e7b-3a6a-4c1a-9475-b40e85ff4916@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 16:48:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <2104f437-e960-4e55-b0e1-2b37126e8c2f@oss.qualcomm.com>
 <82a72918-7bc7-4e2c-892c-0dcdd6dd5548@oss.qualcomm.com>
 <3f51bf6c-5318-4e32-a1ca-3ce8cf8c4ceb@oss.qualcomm.com>
 <20260918-roaring-bee-of-acceptance-50a8a9@sudeepholla>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260918-roaring-bee-of-acceptance-50a8a9@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _Q3JuXL2DhFBbtdLXoXzNN1Ohq-P0SVe
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIxMCBTYWx0ZWRfXz61I4Y5AV6RK
 wOkVI1nMQYFT/vOAvXlvlk0ZGsHZSJYMSNH3SapOp3No8MngAoGr8/igjy2M6DCcv6vmwHLTHNi
 23hMpAbgw/6vV+2UTlS1X+mcs4rhvj4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIxMCBTYWx0ZWRfX0QHGFPE82Ei3
 kHX1S+51habLbKhe14qCLWj0DhNUP1C7hpjUs3G0Zklso1fbyfPuUCLIJZ8AFi4qWWNhFgqk4Ip
 KHyGn/wqYVe5XWtB7Vye4DvqRwCQ6csKruv5rolJKqaOKQ8hgXnnKEXZLqqBLfoEnmxdbASKzz2
 ZqgaSbl09k0Vq0MjJQ+A/Ein1tmnKXezD6yirB7pqxEumRvhRBBLe8lyM3oklIbtUUSfTkuRJ4R
 a2FUdjDvJuVvL9TQ99yYlHDGenXmJ8+vWKyPsFjfZREFfYhhpAhA2FopYUZuwyvDMWi44kvvemj
 Ry2Ts0gxXmiP41voLBJDDlufMLPeQv5fLIccW52ifLu7dtMPtgM8xu7rVL6o8GPqag/U+692um7
 xOeW9jgXUFbpJ9vWNk3OjMZKvNCoP8H/4044QhUp4/Iq9K1aDTmJmTaIkIkfafV0VkMNDkOrBSL
 NPDIL5aeSQbjbCXZUBQ==
X-Proofpoint-GUID: _Q3JuXL2DhFBbtdLXoXzNN1Ohq-P0SVe
X-Authority-Analysis: v=2.4 cv=DO8acCNb c=1 sm=1 tr=0 ts=6aad4f4e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=EXJEmdUHkevauOIPG10A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180210

On 9/18/26 15:38, Sudeep Holla wrote:
> On Fri, Sep 18, 2026 at 12:13:10PM +0200, Daniel Lezcano wrote:
>> On 9/18/26 12:02, Hans de Goede wrote:
>>> Hi Daniel,
>>>
>>> On 18-Sep-26 11:53, Daniel Lezcano wrote:
>>>>
>>>> Hi Hans,
>>>>
>>>> thanks for taking care of that
>>>>
>>>>
>>>> On 9/18/26 11:29, Hans de Goede wrote:
>>>>> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>>>>
>>>>> SCMI client drivers already describe their bus match data with
>>>>> MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
>>>>> SCMI device tables. As a result, SCMI modules do not get generated module
>>>>> aliases from their id tables.
>>>>>
>>>>> Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
>>>>> visible to modpost, add the corresponding generated offsets and teach
>>>>> file2alias to emit scmi:<protocol>:<name> aliases.
>>>>>
>>>>> Use the same stable alias format for SCMI device uevents and sysfs
>>>>> modaliases. The previous string included the instance-specific device
>>>>> name, which is not useful for matching modules.
>>>>>
>>>>> Assisted-by: Codex:GPT-5.5
>>>>> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>>>> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>>>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>>>> ---
>>>>
>>
>> [ ... ]
>>
>>>>>     #include <linux/bitfield.h>
>>>>> +#include <linux/device-id/scmi.h>
>>>>>     #include <linux/device.h>
>>>>>     #include <linux/notifier.h>
>>>>>     #include <linux/types.h>
>>>>> @@ -951,11 +952,6 @@ struct scmi_device {
>>>>>       #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
>>>>>     -struct scmi_device_id {
>>>>> -    u8 protocol_id;
>>>>> -    const char *name;
>>>>> -};
>>>>> -
>>>>
>>>> What is the reason of converting the char * to a fixed array? That limits the name and may result in truncation and potentially name collision, no ?
>>>
>>> Because of how modpost works to generate modaliases inside the .ko
>>> any string buffers in device_id structs need to have a fixed length.
>>>
>>> So the truncation / name collision issue pretty much applies to all
>>> foo_device_id structs in the kernel. People should now to make sure
>>> that any strings used will fit inside the fixed string. And I would
>>> expect the compiler to warn for overly long strings.
>> Ok, thanks for the clarification
> 
> Not related to above topic, but just wanted to check with Daniel if this
> solves module auto-loading for you. Was there someone else who was testing
> this series and was having issue with earlier versions or its you only
> Hans de Goede and it was with v1/v2 when Bjorn posted them. I remember
> something vaguely and couldn't trace back all the versions easily.
Sure, I'll try it with my t14s laptop (Hamoa)
