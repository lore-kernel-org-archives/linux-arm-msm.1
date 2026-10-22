Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792692343;
	b=rlM1Mq+jgA/YMjj6ZHUFEzSCcCk6iVCqqG4ooFNQvVKpNbafQiyuhunXOIh2+Di7qxPK
	 kmRUP1v39qDsKvzk4vEHpN5CAs2WbLYnromcBEYopGgilA/adDZ0JtTW5R/yHTrxz2Bs1
	 7zQa6uNrSzyd375jemrxxPI4LSJZ6o3CzZ38Qju06c0NcpwT6pAT2gU58gPuvMvqyYGoR
	 yQfGS1h7906AhfS/Igfgf3CBLulGz5DDyQuXkCzTITFcfqJMRftVRH/McTJMTqpjQV/h9
	 m2lus/mMRnZkvUtt42rkDM51jstZRSH7s4UqHTkiSUDv3tcidYam/4cPRPSqiqiOTLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792692343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=JY/kgswJkw3rC1uB03Rt3fXoWelWaBya4FySXulL7N8=;
	b=ZEiU+4sGuEwF2UOdy9zuzt1DSZO391ghr/xVdhHnhCGcKwalcxpKwSxP+FVyPlMgV5fb
	 VWwHURycOgIaxlJ0ZcyBOUMdXGwrtU2DoCR8sRM7nH/jiFk/DFoxxPog8pfgl4Z4gRumz
	 UwMwEdAOJppYa0UzY2gG5CeB3Whd8HyVUj/DQvYPQ84VSx49m6B7XF8TjiP9F3cYHcO9I
	 pmrur8jVNiwuZTbzVD4Ne/PSnWTplNjwDow8X3yRnK5iAkFt7Vuqb6C4FPlZppBMIK8Ye
	 nL7bv+0CHkXpc+ppnvms/zD9GF3ds203czwVlY0rDYncIj8nSSjGG/LwtfyGoyjMniw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ENiGG3gy;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB46F606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 18:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB46F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ENiGG3gy
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1d75f2f11so681835e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792692341; x=1793297141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JY/kgswJkw3rC1uB03Rt3fXoWelWaBya4FySXulL7N8=;
        b=ENiGG3gyyAuVeWIKa4LSnuOTEfgIAnd+HliVCcVvSd97dGwI6+bb0LpYPHo6PkUhTh
         cXLAv7cMZKpMSaKp1xlOAHaQrEPRp+Qqcvvu9jMexARfKbIFjlgs7TPyJI6ptY4sRcJ7
         pnHKxke6wzEvPe0C+4sWoOS7fNm1Hz7UeYddytJeKWtdBlr1pXgF3JsLtc0Qbk71FO1A
         zNwpb+ECp6OuM+oqFq6mdi4sEC6XQ9NfaU+4A3Q5dKnFNQ/P7cxSZJ2On8cNhfa/UoE7
         PVqbFHyi73gJU57gv2Sb1YRRm5dqOLgZR11k9/R4jd4q+y4oM4XJqk+7Gz7ys1NviWvz
         a7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792692341; x=1793297141;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JY/kgswJkw3rC1uB03Rt3fXoWelWaBya4FySXulL7N8=;
        b=GE7JesOY1rUMKhentUbpfERE2rQqp9vWCRzJ02fOtzEp3NSZSRj31GylUssIjfQmVw
         NhMV5a16iExxw5UIatHHkiPszexm6ex4GPdCi8ieY5bBiReGSGiwylgClwkeZKrvqN5U
         KqUBmVy3KJYUsj9qtA40DJ9PRCFmb2bK6N3ukzFe2II+/9OSvEpM5ncY9Yfoj4Jyo+0X
         /4Rv5UMDwyU+gkCDMuCBtiygQA2aHM42rI5VN6xz8Wpy/9hEGhSl+X0F5asz9H1cSOUZ
         DRkvsQgPhd1dYkmW1OceDqg56URBFlfJpjxuSYo5wMBfWxS8szEWxS82IOJ4nsiuq27Z
         Em0A==
X-Forwarded-Encrypted: i=1; AKwUvBw1YnYhStfsAXaDNpeY5QOhLbSDI1t/zPHEFxtJt27kLIFrwLI5Dmi0iBbk3r8XZ9MXQ8mC4TutwB4xwb5h@vger.kernel.org
X-Gm-Message-State: AFq9FYJtIIa+32237B/nkNoQN+3L+W4ThTB1q2uUtU0X2XjCg146s9wC
	6Z6oOHBfvR3RH5bq/mQM/ieSX1Pl7bvG9prTgLX00oWES2V1FajCgNw=
X-Gm-Gg: AYBFou1lvBlg+AgX5zOncg1cGOhHvRbhm+99RtRaDlAOK3x3UixpYARUiYXtCCWgV3L
	K+6LYfW1PP2DKAiaJd07tY3kHw6gsUTUrNssu8erZkw/Rm8CjcE6oRwDscfO5x+FSJrywY98GSH
	/+64gmRCdJ+aGFNnMzRFxPdGNJ+q8a/bZRT8XsTUKb7EX6kcwoXKoYA2cYSJM/fz0fAyNGrOMTM
	fHxwXLIbn4fBrziKmeef9dNhqrlKaHSl4tsD2dS3GsYyG61z3PhKx3ufN1fKijemxKQJDSHgk0z
	SQ0Ax/i44AsBSrx1+qiXQHZOLHLb4uOzV3VmL4SNsmFEZm21gBEcyQ3tf3iRyykNgTbyb8zr62K
	tCd+fFWtJitsW7blKfgZsK/AgXBuZVTu1W0Yw011BurEg5Ik9b6H0rEAMUBjlEiWIn02cCO8toc
	AwCBcJ2DKOdeTEXWJ+fUzTU2fN7/8pyxujmREaYUQG7oVo0pdFrsII7d2KgVARcD7FkS5WB5+Fh
	YKZ9tUGmTrmFJeoF/O9RQQOMz28P6QiYgOgiNa1/ai7HVA1KE3Le8qq/x2wnsVgRzzTBopc5TXl
	PveWAxg4Uo3C9iWjbFyHy9sD7Xlu61g1rHcl
X-Received: by 2002:a05:600c:46d3:b0:4a1:acaa:c355 with SMTP id 5b1f17b1804b1-4a1fdd0b191mr127111405e9.10.1792692340943;
        Thu, 22 Oct 2026 11:05:40 -0700 (PDT)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2104627e0sm14106125e9.9.2026.10.22.11.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 11:05:40 -0700 (PDT)
Message-ID: <31970f28-5415-4e78-aa0f-51f15d779e1b@gmail.com>
Date: Thu, 22 Oct 2026 20:05:38 +0200
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
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
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
In-Reply-To: <1f6db59c-b7a9-41a1-8022-6713365fa09e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/22/26 2:54 PM, Anna Maniscalco wrote:
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
>>>>>>> trying to separate a part of the GPU into a separate device, but 
>>>>>>> it's
>>>>>>> unnecessary.
>>>>>> What I was trying to say is that we need to map sid0 and sid1 to 
>>>>>> different
>>>>>> context banks.
>>>>>>
>>>>>>  From what I recall, so long as we use the same dt node, the 
>>>>>> iommu drivert
>>>>>> provides no way of doing this.
>>>>>>
>>>>>> What kgsl does is having a node for the iommu and then subnodes 
>>>>>> for gfx lpac
>>>>>> and secure.
>>>>>>
>>>>>> The address on the lpac device doesn't really matter. I have very 
>>>>>> limted
>>>>>> knowledge of DTSs but I think we could just leave it out altogether?
>>>>> I think, you were poined to the Glymur Iris patches. Another 
>>>>> option is
>>>>> the QDA driver being submitted too. Both ot them use iommu-map to
>>>>> describe the same usecase - a set of SIDs which are used by the 
>>>>> device
>>>>> but which should not be a part of the defaut set. With it in place 
>>>>> you
>>>>> don't need to have separate qcom,lpac devices, no additional 
>>>>> properties,
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
> One thing sashiko is pointing out is that new dt should work with hold 
> kernel so, in general moving sid1 from there would break it since old 
> kernels don't know how to handle them separately.
>
> Not sure how to address this.
>
> Best regards,

Also, looking into iommu-map, it seems like I would ultimately still 
need to add a child device.

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

