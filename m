Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CC047143B
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 12:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786018849; cv=none; b=Nxs7P42Ux+Z0ELJOFCahLOFbX9YJbmKRQAbujeC5ogwkle3DKnNuVVEoOD8bzUKvO8plONqKZbhl0UrhZc20o7sM154FCcUAGfDm+amXbKAfWi0rItj3sgxoA+2OZliUDJNnT4y+VkI6/0gVnz5v37pd9rpuxroTTpGaK8l8DnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786018849; c=relaxed/simple;
	bh=RS3C84zKt1qq0aaaidnCnRiiJL9eVJxfoeDku28sdxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ku8sjCtBy3Z0SQeKHC1DNJT8dXzCZDoqjdqkDae7I1PI6aLqukaaMes0BYDD1wQuNvwJo9J8X3b1IPHKvOBRY9AcWBSfKxiIP8Vnow7utCOwclcctQTvDCq6JJKgpPd/uqASyNfdNvp4a2/cmYm2Y6Jddz7yAtGvYzFtVw7qE94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dcuesrv4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GpBoTG9v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dcuesrv4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GpBoTG9v"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nchP1227567
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 12:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eljm1/P+9MgDZV0CFSNfFsR1xVwLZeqXgh6wNKhw2sE=; b=Dcuesrv4mj8CFY2y
	zD/nwEOJ2bniig+eoWI4chT67FkzSp0OVmJmddOA84A1hbgW9aDBO8booTQkRPfi
	EVp4H4dwPrzjuUJpgZX1ahfAwTJby8cvKNqmQJ6W4ImT1ibx6M6J2rqKszNwK5uL
	EWU1QLX26DrDADhy0baceOBDcmlaxKVj+fJhgaVhf8U9pS7YxbIvRQhNPIzEqXUV
	R06U0yk1FPVANeUeaZ3Vy7McLVqz4b3OLFslTaCnxBFDD6GHgOqklWJO0owmwhdV
	fEhPhaUq5F9QpSwGRr/okN4RO9UnWDmq0NK0LurjXxaQdtCq6uGhHJ6EW3aB6NuY
	rPd26Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvqdugupb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 12:20:47 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb733fc5024so2922287a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 05:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786018846; x=1786623646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eljm1/P+9MgDZV0CFSNfFsR1xVwLZeqXgh6wNKhw2sE=;
        b=GpBoTG9vkDVoT9Wyf65DsPfDDrecAjBHKm9zGyWDVtIP31WaZn469BmKZLdW93uad4
         dhp8gyXWKu6zWJ2Ctsoc3ObhZonbwzFLU/ozX4rQUwCbBwnzVdNUCJnludgyNAJzAafZ
         pLAWZ4inzxEYsMFH28dPUWZbN7tV+yxleAsbPC2U/byoUOiMEuXvgxJftElowNXT3lqr
         bAdmGM79mt/NMNNoI0JBwkzBfGhzuzKRQKqHzqTfC8G3jmeRzXk9kP2uOkYNe7FWUYQ0
         zqaGScyuSo1yGEUdj4RScXowL4xMW/EhdmqrzlOCjG/xlXgJK41TA3yh9aNoG/bETjbG
         hpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786018846; x=1786623646;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eljm1/P+9MgDZV0CFSNfFsR1xVwLZeqXgh6wNKhw2sE=;
        b=bfsiZKRq1lBPIC2FfGM/a47GIevKpTqFZojMmcwihvoJv7eYvq2CjlS1EPgO5cYbde
         J0Kv+3C+Ulmw6mG8PfUUz6oLqAKzh2sg0k70kAphDjbJgIsZDw+wmBlVsmpnFbaZNk01
         YDYIgRcFAvynJ3WUq00pYdi9y0r+snjD1i9b7XQfds5aQbtJElNAIQIeCIMyUzal5PZ3
         fUoP3J9gogReBjHfloYWDEhwBHLycJ4tZ4Z90Msv13u61meTbvYW1NSePQntB7gY3rWH
         vOIX1TvbtzPx8ibgMSj3AF6b6QF93GMSOj+vUhE6SGSE9m/j+LbzsPGeLh+Rw+lPp2RC
         Gt5A==
X-Forwarded-Encrypted: i=1; AHgh+Rrz8PjnQyZ2DrZL4O4dUraJc89BiKE43S9Nb4gBwLd3QGG/DQkZQt7HeBYuD49edeyJ/iMN1HzFw23bVrR5@vger.kernel.org
X-Gm-Message-State: AOJu0YyKNELbrO2sPZmkL2tEOjOpkYts8ZqbTYXConBuaTDFNqwCNAKJ
	W37MNFmZwCx83sleslCGMqoi3XGJHdH6U5jt3w2vr/vRHssjbi5vD7jSikNyPx0e0R5PKfNrra4
	y6DbBShAynEklJ2Cg/1KkvhZDJksWBBVJVfTbiMHZsxTt0Dxf8PJHDdmt3ZaJchYgEEd4
X-Gm-Gg: AR+sD11huzS/SnDj6qRlcy21sF5d+FKNiO8f4YP/fo5I5IPaRocYJA0gzN0XSSdEk/5
	3pF3Fm0Tl5tWdkrfZqtnIiZcRF6LrE2ohNP39NMfqTLrBsS1knmmJtV40AgqkGXUQu3oWLBqCw3
	wLzO6xsD3kp9fSITtgcH0Dxrwcopwu1E9TzrLjQgqFrMg+9Y3SSf1NDotq9seMiApr8P85sFclX
	UFOko+qjQ16cw0hJvJNoHwk4zxkdNYkKk6fwlnxeopzz5mhgshgzQBhTCIap8qLjqZAFmNDxUkV
	shBgYRCQgCwR3AkNQcBczUTUa8LEZUSWY1TbpWOlbyIii2QZpYg5enzqbjoYoBM75n/PLyYw9Kg
	gh+9TS9mdeNCwlTKn5gLdiI5vJAEx83hvL1Y=
X-Received: by 2002:a05:6a21:b97:b0:3bf:b8d8:8296 with SMTP id adf61e73a8af0-3cb85ea6f84mr17196159637.26.1786018846318;
        Thu, 06 Aug 2026 05:20:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:b97:b0:3bf:b8d8:8296 with SMTP id adf61e73a8af0-3cb85ea6f84mr17196066637.26.1786018845827;
        Thu, 06 Aug 2026 05:20:45 -0700 (PDT)
Received: from [192.168.0.173] ([183.83.142.146])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863b76cfsm26785838eec.4.2026.08.06.05.20.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 05:20:45 -0700 (PDT)
Message-ID: <353172fa-8acf-4055-a777-021177761fcc@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 17:50:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] dt-bindings: media: qcom,venus: Add context bank
 subnodes to common schema
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        stable@vger.kernel.org, Daniel J Blueman <daniel@quora.org>
References: <d6ffacaf-7f83-42be-a3cf-40ce00810ca9@linaro.org>
 <Ia82wa4IJDPkQZpTCt4MDMqtq1VGZ7DqIaJFNvV0MjaT3jjWrbD_iBs8RU7pqrIz-ZTMSK2irncUv7-PZ-fvkg==@protonmail.internalid>
 <8130900b-c9f2-4f5a-80f1-1e8567ee1b72@oss.qualcomm.com>
 <f252d83f-e0e7-4061-8da8-d2650f1beadf@kernel.org>
 <ea0f1777-4615-415c-86d2-2a792ea42b3e@linaro.org>
 <41163185-09e8-47b5-9ece-c6503cb48920@kernel.org>
 <72b267c5-6490-453a-9900-b196d1cfc5f8@linaro.org>
 <2tWmEJ8s0nm8efbgvq24Zwo1vkuH4Na_gC6stCr9_O1A9k9JcA2-TFN5qziPoORYrCKyDgjscvGyO64HI6qVqQ==@protonmail.internalid>
 <72b4edc0-dc80-484d-a2b0-88ea11ae001e@kernel.org>
 <995779b4-925a-48a1-9288-930e0a10b7c5@kernel.org>
 <nht5phhqatbc35rh4l4r5lbf5bytgb2zmesv433zjscs5ye7rs@6y4bczl23nao>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <nht5phhqatbc35rh4l4r5lbf5bytgb2zmesv433zjscs5ye7rs@6y4bczl23nao>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: drTS7QEaEvSh97MenshFMgFThWfD7QH8
X-Proofpoint-ORIG-GUID: drTS7QEaEvSh97MenshFMgFThWfD7QH8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5NiBTYWx0ZWRfX0qEMCTxc1sbw
 S6TmynToqH/ntMT5NmDsHquU76kBIfleO8uTbXIEwhMuNGZZW5YA62xqV0MTB0a5alAdYk5ckdB
 gBU2VJKgTqsJF6ZB08XMXuW4MD+uvRBKcHHZs050jBFMvsagoBkuJm1f2ziujUDMa20CrJgaD2M
 GXeyPFp6dbkANXq3aifbFKKayJqLCrZSGtooCtApPXB8OgIfXlytOEmpv3qGWnUejRVy63Zyxs8
 FQsvjLLX1ahgupWc0AkRUKdR98JISqbzMw0xPe2Km/BEBuuNBPesJ6zTQFzVv0v7oS2hwhxJkSZ
 oz13ytUqIzoHDjPDw1bbO8xRg1Nxo1Mt5gqMuxuZc0e9bIvIwsXOeeOMzS51uU+L3/8cK3Ux2xX
 4onc2sBu3sHiemtx1bNOWdWmmjN4R3sfKy6NG41O1AO8JAYlP2Dkjgq1A2cuDPm9jR2R4Wqgdd8
 +zq+b5zjfLVSCF9R8XA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5NiBTYWx0ZWRfX3OagnGJXBW8C
 GjyTs3Blq1fsTd+obkuEP7HPdHPA7n/MlQ/3teSWTKMSI9L/ikVGeL5RwceRxunw2BiHDsKAMY+
 aDRsP3MBbnEbtlk28EiQJZ+SI4YOCt8=
X-Authority-Analysis: v=2.4 cv=bdtbluPB c=1 sm=1 tr=0 ts=6a747c1f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=eVbXwf39F0J6/s7D6zfB/A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=2vOZiK0QeDry3nFfGDsA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060096


On 8/6/2026 4:44 PM, Dmitry Baryshkov wrote:
> On Thu, Aug 06, 2026 at 11:50:01AM +0100, Bryan O'Donoghue wrote:
>> On 06/08/2026 11:32, Krzysztof Kozlowski wrote:
>>>> Yes -master.
>>>>
>>>> My issue is how long this will take. Several kernel cycles and the
>>>> debate is ongoing.
>>>>
>>>> Daneil's fix has not been applied which means the replicable system bug
>>>> is out there in the wild, not addressed.
>>>>
>>>> Daniel's fix could have been applied and rolled out to all users in
>>>> mainline and consequently stable.
>>>>
>>>> Instead another architectural level fix is still under discussion, which
>>>> is of no value to end users whose systems can reset in the meantime.
>>>>
>>>> Its just not responsible behaviour. So I feel both of these drivers need
>>>> to be marked as BROKEN unless/until a fix lands.
>>>>
>>>> I'm hoping the vidc team will come up with something else.
>>> I did not object taking a known fix for the problem for the mainline
>>> kernel, regardless if the fix is optimal or not. I only objected the
>>> reason of taking patches because of something in stable kernels or
>>> making backports easier or whatever other semi-expressed reason, which
>>> is not the mainline-kernel reason.
>>>
>>> Best regards,
>>> Krzysztof
>>
>> I'm all in favour of rolling out Daniel's fix.
> 
> The biggest problem with it is that it looks like a hotfix or a hack
> rather than a proper description / solution. From this PoV we will land
> the fixes for all the boards in mainline and then fix the same issue
> _again_.

I would call it as un-optimal than a hack, and certainly i can say it 
would *not* have to be patched again. Its simple enough that it applies 
one reserve region to all, instead of applying it selectively to 
specific stream.

> 
>> I don't want to propose BROKEN but at the same time the timeline on this
>> demands action:
> 
> I think this might be a solution, which everybody dislikes, but in the
> end it is true (for both drivers).
> 
>> - Sub-nodes proposed around December ?
>>    Which means the system resetting bug was known
>>    and understood but not promoted as a bug requiring
>>    resolution as it should have been.
>>
>>    Fine people make mistakes, that's life, lessons learned.
>>
>> - Daniel's fix posted.
>>    Not endorsed or rolled out. Its not "perfect" but
>>    it is certainly "good enough".
>>
>> - Now more debate on sub-nodes
>>    I'm all in favour of that but NOT at the expense
>>    of replicable bugs from real users.
>>
>> TBH, when I start to lay out the timeline on this, I get annoyed. It seems
>> to me qcom has understood this bug for nearly six months more ? and mainline
>> is still waiting on a resolution.
>>
>> So I'll leave it up to the vidc people to decide. But some kind of deadline
>> needs to be put on this.

let me post Daniel's patch as fixes, and then the sub node patches can 
continue separately and drop the fixes tag from sub node patches. I 
would be patching both venus and iris.

>>
>> Close of business GMT Friday - either something mergable lands for sub-nodes
>> or we replicate Daniel's fix to all platforms. Failing both, I will have no
>> choice but to set both drivers to BROKEN.
>>
>> Stability has to come first.
>>
>> ---
>> bod
> 

Regards,
Vikash
