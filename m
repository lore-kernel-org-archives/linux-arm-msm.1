Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792705602;
	b=s3mQJHu0+HR9fBjPKOdfF4dDa1C6NnIWdPf1yO/oYek0ll8CMAvKAoo4WiULcKWpVRiS
	 uENeB823O1kXlbaIsASm5aPxLNepM6fBr9irNbCPrLSt1WPfL8/6r6+XYeyMY8avP9L3R
	 478SKSUMAStQgo90DomQQ49HxShKqaWjYZDkMWsosybqaMNYdSLHR7D/+damMwpBvwXge
	 ce7krH4EVC8jFy3B5M1SVKuDXI5Iz/spY/kWoJ0wisoATdfcboMOqIXc/hyOEMW8+lDZ4
	 no6NRIByAr8+tl10xAdB3kfdvDU47JHh9GM/8AOeScFvJm78NhimgQVdr6q0HryZ4tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792705602;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6QE+P56C2nYaSieRX/rS/N9gClwTb0YY8JP9mDQoasU=;
	b=0T8iHbTifFz7z1j+5wQLXwBlGT8XLCLmVisOz3/8XcLuRatSuLBfyLpwflWYs1Pd6Uuq
	 gIXPdp72rsIatbEMbz3UZMhukL6LTOJ8sjSul6ZGzCZg7hXz2+6UE4fLmB9eIJ1fgpmu7
	 KaQG8Qjm48CUTIcpEcnfq3w1ed3zwo6eknvo7mop3HTkI1ygt9oqaGAR3AyIJQzSuCGcL
	 FibzC2x6eHkaz1oWBZrtBR5DVPqY3TQmGAX8QVzRgKmKaMkRMUnSqbPhzWy/P+jCr3UY1
	 FKhLT3z5/3Ow4zdqoR3eOVgzoCKDAV56/EkiwEGdE1+Tr67Xeg9Ms2aDfTTe4aw2lEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UNq+hvA9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OmAdHEdM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189B6606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 21:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 189B6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UNq+hvA9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OmAdHEdM
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MLSeQx1389069
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 21:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6QE+P56C2nYaSieRX/rS/N9gClwTb0YY8JP9mDQoasU=; b=UNq+hvA9A8DEwJLN
	NSYfFSTtglUNNRNcKnXpBoF+eJxXXmuGdMTgqw7kmS6wZSsb8jP0zZbtAYPZSzvI
	sKxCKw85TSNNzD8r8KAvtkuj309mg2YOI9eQdAS7L1XUYlYegnK3AIzwdnpPabzR
	ts1NDX3Mhqs5NgWyklR+me2lpJcGfo2BgTM6lffe6lljiqxNlxwjjqWlaMcYRcZn
	7/v6+pT603Hh7qLgcO3a3t8hIvCiz5xj+hQQuoDccw+7GKskfaEsyKy2wsD1D5s8
	e5B3IBFArInFKq54Cfemsc0cdvi8cf0svwEMsRslmd1Xlg78ZZ+q/UsIiFXWZdty
	4wjHaQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmj8q4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 21:46:40 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so570298eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 14:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792705600; x=1793310400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6QE+P56C2nYaSieRX/rS/N9gClwTb0YY8JP9mDQoasU=;
        b=OmAdHEdMj1H6hFPAzdEFyjjbIiCg6eVtO+0OGtNWuI2w327goJQpsLmSAzm7zaktSf
         kND7Iq+oiX9witWYENMJF8Dtg/oZf1YqtA4bi8gCt6tlv92v4lL4h00Engje7logm0vC
         DCNkgCRWoqVnnsFNFkIMv6Qu+AkEp72HJn8tNyIm3mKv+V1sEDzE2qjmoYD8Xa9XCUQw
         hJlGc4dIh5Icg7LdWCQVrraQN2N42N8v9/2rcHu1SfJvu1RoE5QjCeH09ZkgmA8a7Nwz
         0nSVjMXAJOgh/0t9svlE5OURkz0uiH3WcpjevPMOzJ7fNGbwdF5IZ4/cHQQ9yGPpdWKV
         7YTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792705600; x=1793310400;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6QE+P56C2nYaSieRX/rS/N9gClwTb0YY8JP9mDQoasU=;
        b=KwH5Mj/h+/HDwSB8i1qzS/YFCFPulVNx/zkBHsEPZaFv3po8IaOnaNX63gXdLIXMDy
         cEkQ9EGknMSabh7JmsTqkCFPjWILclxUZNgntklu7xxUKCN8lNyA3+SCPhKPHJppcu+u
         f0me2vQf1S5kmVfw9LUp0gT3NI19p5H+VTaXBm8ToLaAP45ULEvU/mAtrp7bNRqTcg8U
         nTQAvDWI5ZHBg1vfbYYyYA0q23b75ZAgwtPZKfzjg9fu0RhLfCjwKVhaUeDoT4be8/my
         +1EDBx9MJ3uxuIDUv6SWFKIMUnw8qm/0FKOrnVsDtAnuVb0EqxVPZxz5tJ0Wq0zJBxV0
         8XJw==
X-Forwarded-Encrypted: i=1; AKwUvBx7kPv2u8Ue3GjjYjk/IMdHNWL6I3vY+KVT7KoGkvocrJf8izCabaloXeWKO3nCi2Lu0LPwVqdyC6gpivK5@vger.kernel.org
X-Gm-Message-State: AFq9FYKChKqxNhlnw/SoJB6MDnwlU7feGvrkxwW7QyFH58Nb4IRE8xT7
	voDSJdpBu6VD4lfudV6lo8X+4l5V1hk09bVQnCCUiwnuYwCk7mwbZHM1dPU3laYgS07u7+LhGDv
	LshHNIIVUA5oU1dxiZ+d4gVMDeuYtoX0Cof89iIWVj2ddZ0DGp/dgojUOmbBbD4pS5Sw3
X-Gm-Gg: AYBFou2qadsm5jDXxRDY2FG96jLt8nqjQ6ViZbWqI68GDkCSLltqtCGF8a8H+QkDbjo
	HqEA5o4F0lC3B4sxbiSpLuGxBdW8JpoyJPLWIdY4fJvrsiNQMQ9T7V9WOO6jHZhUhxKRCM6Pkr/
	MLA/DcDJQGUaWtHMA8WAi9rEG/8/RiOZWtzyyQcB+cm2YgOYsD/reVUOwcu3LMOTbiCAZfPqL9K
	8FYXxooihApjhyB3V7iS9pSk5g5VvHwlrhzsHxbQQNcXHQ1hTW54Oba+x5/ywRcJk2DqIaT3yxE
	eooWtSo9uA2PV5nAUmefG+WM6oyPWuozx/++vidI7p5Ix22fsbTVKOvS4fbUXoLt8z+2sN7M03H
	xLkj5rsSpguusY3M28aArqzGT
X-Received: by 2002:a05:7022:1e13:b0:18b:48c3:287c with SMTP id a92af1059eb24-195c693fa23mr494661c88.41.1792705599638;
        Thu, 22 Oct 2026 14:46:39 -0700 (PDT)
X-Received: by 2002:a05:7022:1e13:b0:18b:48c3:287c with SMTP id a92af1059eb24-195c693fa23mr494632c88.41.1792705599029;
        Thu, 22 Oct 2026 14:46:39 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.228.226])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195e9e9c4c7sm954775c88.4.2026.10.22.14.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 14:46:37 -0700 (PDT)
Message-ID: <fcb86c33-1893-47bb-80eb-20acd65f3805@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 03:16:27 +0530
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
Subject: Re: [PATCH RFC 03/13] drm/msm: look for lpac from dts
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
 <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
 <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
 <m4vwrqt6yyaawpvkyrqfzs3kbipbhygmtrhphuthl2gmjvkgyt@u2d3dnvl2phy>
 <54cb37bb-aaa5-4c5d-a563-acca4822dd35@oss.qualcomm.com>
 <t5gu6ciwmxdb2jghc44gtixdsbedkgy4yzke5sgawjrr2h362u@ahvhh3yfe6lx>
 <wtun2cfukyzxlsfiz2izsejd33k4jpapwqa3uqih5drcsrkff5@e6llkke5dayw>
 <1f6db59c-b7a9-41a1-8022-6713365fa09e@gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <1f6db59c-b7a9-41a1-8022-6713365fa09e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cbAjy13VA6F1z60fa45rIYGEqOwktsNP
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6ada8440 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ipsIN8yD8anPosRfiFfp5w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=9jRdOu3wAAAA:8 a=InArmlTPJEDsLdIP4zgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=ZE6KLimJVUuLrTuGpvhn:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA4NiBTYWx0ZWRfXwchg1bGuK6XZ
 NmKeRaOErwtK86lIhSGWXKhjAShfSbJIrR7Ur0sxGip845+iUgL40OLwHbZhgljoWgHoVFS0ZgP
 u0d1l0eyTkRNxIg7ewQBVAYqpt+Y174=
X-Proofpoint-ORIG-GUID: cbAjy13VA6F1z60fa45rIYGEqOwktsNP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA4NiBTYWx0ZWRfXyDUCvJnhekr1
 TMLP/ktgJs3S4b337VJ4Ca/eVPV5mh1een8FGdirxoJJCUcu4HGXAxN2WFj/jPuk4rGAOvzxn/O
 2m8iZUgwUGZ2AXhjnb+LG8NJ2joQSG+OheUUMW2JxXoMiJmqx+YDbpfeLbFTTABEl+hhahspeWm
 CE6fUGDYxn6LhE18mc9CgfkjzzTio3xgiwP3XDMpC26uIqH63XZJrwMTrBS/EhwE6UE1JnVS1Uf
 BKaLLeEDVPYYSXEG+x8U8lzJvxd6TyQaccmmd5x+zADBY4YqD/KfwnNahebS7VOaDcA7mAfsVhu
 zpBzuVGRAhQb7H0BoBLSeml/iWWqkom/2qtowQYA/m/aYOuooKjjmu2bzZnyT76jRJJK6O94gWw
 ubgCsVhCJA4+9UNdGFM1/q1Dj0s97Dmbku089QKsnNklGFNbNvgvK4s7JI7cfqfJ51D5N+QrNjg
 9WGL9zdlTG+d2rrNGvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220086



On 10/22/2026 6:24 PM, Anna Maniscalco wrote:
> On 7/9/26 9:39 PM, Dmitry Baryshkov wrote:
>> On Thu, Jul 09, 2026 at 05:54:23PM +0300, Dmitry Baryshkov wrote:
>>> On Thu, Jul 09, 2026 at 07:12:39PM +0530, Akhil P Oommen wrote:
>>>> On 7/7/2026 10:09 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, Jul 07, 2026 at 05:02:43PM +0200, Anna Maniscalco wrote:
>>>>>> On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
>>>>>>> On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
>>>>>>>> In order to associate the SID used by LPAC to it's own domain and
>>>>>>>> context bank we need a separate node on the DTS.
>>>>>>> Can we use iommu-map instead of adding a new device using the same
>>>>>>> addresses? You provide zero explanations, but it seems like you are
>>>>>>> trying to separate a part of the GPU into a separate device, but it's
>>>>>>> unnecessary.
>>>>>> What I was trying to say is that we need to map sid0 and sid1 to different
>>>>>> context banks.
>>>>>>
>>>>>>  From what I recall, so long as we use the same dt node, the iommu drivert
>>>>>> provides no way of doing this.
>>>>>>
>>>>>> What kgsl does is having a node for the iommu and then subnodes for gfx lpac
>>>>>> and secure.
>>>>>>
>>>>>> The address on the lpac device doesn't really matter. I have very limted
>>>>>> knowledge of DTSs but I think we could just leave it out altogether?
>>>>> I think, you were poined to the Glymur Iris patches. Another option is
>>>>> the QDA driver being submitted too. Both ot them use iommu-map to
>>>>> describe the same usecase - a set of SIDs which are used by the device
>>>>> but which should not be a part of the defaut set. With it in place you
>>>>> don't need to have separate qcom,lpac devices, no additional properties,
>>>>> etc.
>>>>>
>>>>> I'd recommend following the same approach.
>>>> iiuc, the conclusion in this recent thread is to use child nodes for a
>>>> similar case:
>>>> https://lore.kernel.org/all/20260618151745.GD231643@ziepe.ca/
>>> Let me check internally.
>> After a brief discussion: it can be either, depending on what suites
>> better (and if you can persuade DMA / IOMMU maintainers to let one extra
>> bus or not).
>>
> One thing sashiko is pointing out is that new dt should work with hold kernel so, in general moving sid1 from there would break it since old kernels don't know how to handle them separately.
> 

+ Bjorn/Konrad

Not sure how strict is the requirement for compatibility with older kernel version. An
option in your case could be just do an override in the board dts file of the
Steam Frame.

-Akhil.

> Not sure how to address this.
> 
> Best regards,

