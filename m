Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792688331;
	b=o0ZrwixhEYi6WnJQYvfFZVV22Yy0kUWQa2mTsmjzNZoscXbm9T03tTUy+bcNl2TP4Pjs
	 8ZngBegrnUImSdbpau83fcP6dmK8+68p8Ym5Q5n0c4nbeXMVE371qUpY5NWhGRD2NVVzi
	 KIIi+pjT5k3dYPaQaFjqYKoc1C9Yxs2R52cdg8ar8HqzyTgY2yMYdmmTddKImvHa1cb5x
	 iIrbX3dgEEZ/lCJra4v3WU9dpDOyJYlJpHORYDPRiZuq5gfA0DKQRz9XYGGYMRalrZYda
	 bTDXbsgEcAVaJ/R5LPLOnEcntVBBf1/3P1teT5+2PKoCoBCYzv2Qorwo7BGQHVhI/Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688331;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YiVig7SZ1LCNZalTMVQzyQL7vcBxu71OJRi/ySqVcbQ=;
	b=J9SThwKexdgksT5c3ot3dn6U6rJASZpJvY0Y+k3BVYso5gIH5qMdqy3xJ4vNqPlEjBDF
	 nY3xGTLLCXBXaRLfIZZGowKugD2yRWXqkAwj3gD0aHlXS2x1zC3m8VdPuwCsxgPsp0YrQ
	 YR9SkxYx/zlfIUE/DFCeh0lA7+jjTn6QzwvMeKtLHTPSklJT8on7J7p0hT1/nzXeAc0QZ
	 L/ykVuovs5ZYS1wCS9njqD9Zav8Ts6a424HzvdQ7DuY9zPza1gUd3dKxkNt1v2KVg8ZCb
	 RcdiLb5GRPV9JmhbOfbTUSy6HGw+Kkh6mMUiAkiS+cwZ7Esn8Rlgm7CzMP5VFzOdBcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oPekVx9R;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XEhpsg7u;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F75606A31F
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 16:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2F75606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oPekVx9R;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XEhpsg7u
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MEFGAX3210680
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 16:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YiVig7SZ1LCNZalTMVQzyQL7vcBxu71OJRi/ySqVcbQ=; b=oPekVx9RGSzP/DJp
	MDeMyhK0kCG6i33rSJvwbiRJjIor+XfdtHbiVekJs93q5ZK7FoNUZtFVp6Y7MNFs
	GpNi+zhS2iTBb7e1wDsF7OxKEzEGlOXmmJTX+elyf54iXrTDEetlWZ24yFi76daL
	WaFTdBfXSR89kLQOuVF29gmGO4FUthClfbGXs2UJqPavCQUOGhs5P8YZZ9JXqUzu
	blJ0o+XbDCQNJT3AcxN4L402/px/xo8+SzEqW8wGHN4tfYxIyqsBHorNT88rtXei
	N39FOfhp4WY3KZupB1qIpt1++4/uqLGg/BKDAD5+P5v2Exf7Jj9MKkTc8aVX/nmQ
	oivbHg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ammpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 16:58:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so33320a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792688329; x=1793293129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YiVig7SZ1LCNZalTMVQzyQL7vcBxu71OJRi/ySqVcbQ=;
        b=XEhpsg7uGs/gqr46TilqqFBGotDw3kqAddhZ1LNB3BqjA9pgPpUhG2MOlMIDjHfwRe
         TiJIxosKMYylaFg4e8+oFEuf4TKqT/J20yqpZOgILvlphRHRshz8D60U3Iw6Nn+Lcrro
         tM4u4CSx58rCVV3V3ZKapXeBcHyXfsJb157oBs62LCOSoEhLPIQIv4FKKc4FRTaklHcL
         deRi0fmEazaQIEn22UOHzC9KtoQERunH3bQsF7DI1Li2JM80VjJPOHoXaVmZPce4X8Me
         IWkyL6hXjkDskQEBjRQNUsHsopCsAYe1OHBxZtJHM7mTBSX/s+HuiErnOOpp3Cn53zJo
         RoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792688329; x=1793293129;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YiVig7SZ1LCNZalTMVQzyQL7vcBxu71OJRi/ySqVcbQ=;
        b=yEclRnt7rbWgH7Vl8z9tn5eb1VSNV1QaiV3jAJCwIg/bi0M0kqq2RRFoLUogV7d6ZS
         BmUj5UhwKfifIyHHe+7wX4+CaIeVkjTcebbTG04FLxktTj9oleBZQiKbN7BhONQEQb6M
         rHnGnKrpFdgpazSpN5pICiP6+FNucHkN53O2KWNlYyBYx8BRsxIhmxYSFrbWS2nN1Ses
         H+nMCcZZcQbc0evDRk+VTIc5IjvmgDOM8AxWKNkWokCGrrJx1YJj3w6kMO2mtu4yq39N
         khtliw7epVG84kspEGqkpg/KZ8I9eyq43kcVvGNrdKjvh9nsVwN7Q5213VlbiRTwp5T1
         oL1g==
X-Forwarded-Encrypted: i=1; AKwUvByODpQhlgVN1G6zNINeqv0U8kc/IpyDCoZI2tMIVty4bpVMiZ9PlsjsmiSVE8fQYdLbwOXu74deP0DMtXdI@vger.kernel.org
X-Gm-Message-State: AFq9FYKhgFJC+7uWfPKpbtYE1RAdPb7nH/WMWxeFIgCKthA1hu77bckO
	tLiEiYjbhBvY5+FHsz3zt0PD1oTGYkr4vOUeThy9cnBOJ98JBBwwjx2s9fFSYFB/MavvyEPxxu1
	Q8CMzLp/Ftw5aaxKDrpl+vGQnK7c3bplu6YKjTZGcKDQmSA1LLE7MK8vS9Mn+7qi+hUSP
X-Gm-Gg: AYBFou3CJvCE4qh3X3wnM0dRAXUw/2xEzZmQKftuet0MNB7nr5A3AUUzJ9GTJbJQsEA
	fV4lJ4Mj9cj6KP+Xb5C3WlMkG9R6tdfx6oHMk7Dy6t2CZbpxBVyTte9YvjmN3LKRpUIIpA831jS
	doiq8UkTTdJmpk7Q5TDiUhaFifPMcnU62RddUzyXP44Qt2VdB6eYnshXYBD43sntLDtAKp4yjak
	pScR66EzrkdiXxgKW5tKgGRdmJvYu2Vs0ZfPxSkKPWcKm7kJtRaHcB+Ttoqccda5GOczgxZ2w4a
	ljSHgG6nRf43kGxjJPx5KZDHZJnzGBMk5jgiGu/7ruXUAODeLudRG1wp5nmu8yl+wsiizsYct+t
	DTWGo/gFBBVByc9U1sCBlXJS0UXjMgQ==
X-Received: by 2002:a17:90b:4a47:b0:3ab:1af3:a0d with SMTP id 98e67ed59e1d1-3ad86d1e821mr4444444a91.33.1792688329110;
        Thu, 22 Oct 2026 09:58:49 -0700 (PDT)
X-Received: by 2002:a17:90b:4a47:b0:3ab:1af3:a0d with SMTP id 98e67ed59e1d1-3ad86d1e821mr4444437a91.33.1792688328657;
        Thu, 22 Oct 2026 09:58:48 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.235.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48876ebsm5013445a91.1.2026.10.22.09.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 09:58:47 -0700 (PDT)
Message-ID: <d8dc2c6f-9b1e-4248-b81b-cbbd524233d7@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 22:28:42 +0530
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
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Drop CPU critical trips
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260924-shikra_crit_trip-v1-1-730c48fa998e@oss.qualcomm.com>
 <xa4gmzdccrububsmervkbtwqpddsbikubvgsqksypqmx5oih2q@q2hz6tadbmu5>
 <53c6b966-a6ff-4b91-a2b7-d7faee5a6605@oss.qualcomm.com>
 <3a87d077-8b8b-4bcb-9f5a-03920ef3d38b@oss.qualcomm.com>
 <e3de4383-f530-4968-a177-288162cd34c3@oss.qualcomm.com>
 <727ru4mlgn2bf7ta42ww7772mekk6bea7sni5b2h556pk3c6xw@4atjqo2ygylo>
 <194cdf44-059d-4d03-8cef-d674ba37006b@oss.qualcomm.com>
 <crcwoq7atn7pkwt7cryixquqydyxtqezphq4cpq3cokxuxmkcu@axzmbxzf2mwg>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <crcwoq7atn7pkwt7cryixquqydyxtqezphq4cpq3cokxuxmkcu@axzmbxzf2mwg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 18GeVohEvSVDJM1NB5i_hhswuoIHoUKo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA2NyBTYWx0ZWRfXxk0mENwcGnc4
 Hk2Mso4y3zU0jYTJP+2wNbQdM7esmntx2XquntusWeRkxhxowQHG58CpJGoO+9Jm+2LlNw42/Y7
 sAoVx4HUXqrdoleJE26bkcy5NCd2yc8=
X-Proofpoint-ORIG-GUID: 18GeVohEvSVDJM1NB5i_hhswuoIHoUKo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA2NyBTYWx0ZWRfX8yLlSbV+VNbw
 gdP+NuTWlDB0WP7w6Iz+dLwxzEP9rVJUDaGhMdheZj9Z6fEyQszEDg3s4uI9XFdSc07VZo2ucrI
 U+yzJxz9Ek3/fNjB8HZrJgxCWqY+QRfPN0Btoo9JgMsVWS/VS54Swdn6B0zsQjZedkWPNibW1dY
 wVT3mhi7uWnxarwCFuQlZNH73+clGUaJKDTM7VeYm3p1yUIUToO4ThytrQ5nm6o94smmRxWZji4
 F8c1ztdk7NzhwOepkQPOiy5qwSd1zD778XIqABYJE5Kx0PlGGABQbXrgA/eEpEMNGJsYR6/D/E5
 LjTlLYIwEnlC+Yc3TB+GNFIRmbRXC2QGF3/eL75kRdvn9L/uq88ToGoG/3wtm3M3Gwj57otf/+1
 0beWKMS7GJE00FYFVf1y1q3ZVl4aYVyvbg7HAu5d+7/SCqnCIvTla8IlpQHphibkRIvGbAjQQFL
 YT8dDsZ5tUIx2K1Kjgg==
X-Authority-Analysis: v=2.4 cv=dOszC+Zb c=1 sm=1 tr=0 ts=6ada40c9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=8wa5AUNoahJ04lRaSfAPWg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NRCdo2LqAGfow365lYEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220067



On 10/21/2026 5:36 PM, Abel Vesa wrote:
> On 26-10-21 17:12:11, Gaurav Kohli wrote:
>>
>>
>> On 10/20/2026 6:26 PM, Abel Vesa wrote:
>>> On 26-10-19 20:03:47, Gaurav Kohli wrote:
>>>>
>>>>
>>>> On 10/15/2026 4:43 PM, Konrad Dybcio wrote:
>>>>> On 9/25/26 12:24 PM, Gaurav Kohli wrote:
>>>>>>
>>>>>>
>>>>>> On 9/25/2026 3:13 PM, Abel Vesa wrote:
>>>>>>> On 26-09-24 19:52:32, Gaurav Kohli wrote:
>>>>>>>> Shikra firmware handles CPU thermal mitigation up to 117 C, while
>>>>>>>> Linux CPU critical trips trigger at 115 C. This can shut the system
>>>>>>>> down before firmware reaches the end of its mitigation range.
>>>>>>>>
>>>>>>>> Drop the critical trips from the CPU thermal zones and leave the hot
>>>>>>>> trips, non-CPU critical trips and GPUSS passive cooling map unchanged.
>>>>>>>
>>>>>>> I thought that was the whole point of having the critical trips set to
>>>>>>> 115 C, so that the kernel can gracefully shut down before firmware cuts
>>>>>>> it off.
>>>>>>>
>>>>>>> What happens if CPU gets to 117 C and the critical trips are removed?
>>>>>>> How will firmware thermal mitigation handle it?
>>>>>>
>>>>>> Thanks Abel for review.
>>>>>>
>>>>>> For the CPU thermal zones on this SoC, hardware-side mitigation is already available at 115 C and 117 C, and hardware shutdown is at 120 C. Because of that, a Linux critical trip at 115 C is not very useful. It overlaps with the hardware mitigation range and can trigger shutdown before the firmware thermal sequence has completed.
>>>>>
>>>>> Does the hardware mitigation just pull the plug, or does it signal
>>>>> to the OS that it's about to? We absolutely need the OS to be aware,
>>>>> so that e.g. the filesystem will be synced.
>>>>
>>>> Thanks Konrad for the review.
>>>>
>>>> The OS is not notified before the final HW shutdown at 120 C. There is also
>>>> no useful margin for a Linux critical trip here, firmware/HW mitigation
>>>> starts at 115/117 C and hw shutdown is at 120.
>>>>
>>>> So 115 C overlaps with firmware mitigation, while placing it higher is
>>>> too close to HW shutdown to be useful.
>>>
>>> But having the 115 C one will allow the kernel to take all the necessary
>>> steps to bring the system down gracefully, while relying solely on the
>>> firmware will just kill the system before kernel can do anything.
>>
>> Thanks Abel for the review.
>>
>> On this target, 115/117 C firmware mitigation is throttling/prevention, not
>> shutdown. The final HW shutdown threshold is 120 C.
>>
>> The 115 C Linux critical trip therefore starts shutdown exactly when
>> firmware mitigation begins. Moving it higher also leaves too little margin
>> before 120 C.
>>
>> So this patch drops only the CPU critical trips. Would you prefer keeping a
>> Linux critical trip at 118 C ?
> 
> Yes. Again, we don't want the firmware to crash the system before kernel
> has a chance to bring it down gracefully.

Sure, will add at 118.

> 
> But how does the firmware mitigation (throttling/prevention) is done?
> Shouldn't kernel be aware of such thing ?

LMH hardware handles the CPU frequency throttling. The kernel is aware 
of LMH events through the cpufreq driver’s interrupt/polling
path.


thanks
Gaurav

