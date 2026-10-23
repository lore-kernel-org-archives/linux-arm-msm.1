Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769163;
	b=muq0SzIYBEQ3Tk/q7XOneMfafbSu6unvSOovCvF4F/DahsVPoiXYkto28BsHCHIE5s5g
	 lbHkJ2tAxHPCLO/BUUz9RuNfWPyIGHsXw1wPdvod+XuheS3tIGOhz1GnM1RT7RSznwVLl
	 OJHZBKKhyK5Is3uEXy/xMVYWYrYfZXB6BowUlBbytQ784aEb6MjCly7iXlszshMUMioO5
	 rtRC3AWD8qfnChmO/3JZJPqFRzqCx4upbtVYQQja7AQxAsuJ/JGuq6EhQHIaxhoRQvdQz
	 ZalWTpZGpZGtU3QTM0Q+ZmqR4tLRCwnGEB2FrSPqzI//7kWINVOYXmJTjWJzZVPCDzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4a2HGeqSU90/oPjDCBfIOMhTpn84AQ4hBfmcEVcMu7Y=;
	b=xxLXpT3sWYUTykOS1yuFhhmjGcEfLK7jIOi5D1H25GZi3ggaLSyP5rQAKclE0Nf8ye3D
	 GZBglQigoWdwcVN2sD7gsTroc2skJbum8MaB3S6xHB1rEKy2z6UBLEHsGM1eqHVXIeR4b
	 6vu+xi/E2OFDBIncjstl75+Hhk0l6vxqdd0tIFhp7Irg9OiJ369abRXln9bZgtCKgwZ62
	 P/tW3mMubm7xzWaE0KTDrC7B/47jzCkiswzfgih7Yu59EH71Zpi9+o3sxRQrU3upXRwl1
	 U0Gc329ekRZFrvnFncMcMeZNahWK2L79ZTeEF39lVwguVM8YuGKv85f+HCDbE5nZVBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=clz6LlPj;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7760B606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7760B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=clz6LlPj
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso6975755e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792769161; x=1793373961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4a2HGeqSU90/oPjDCBfIOMhTpn84AQ4hBfmcEVcMu7Y=;
        b=clz6LlPjUTdI3liTjbBPzvaJkyBEN/TX3HWi/4eIyxmmD8ZI4SkQKMe8JEaByKZ2ik
         eRDS3Q02MyWHy2PC32Wy6vIuqBCo7vnr1u6nXWBuVNKCKKXgPR1pZJnAuOF6WVJ3t6rO
         10pytd3CMYvrnCQ6Dn/V7zVk4+RxfpV1d8ZZ6M9d4Io/cMYyW4ZUZJY31xhESceKPYId
         7N7O8IUvcNX7rQU/YQBztiPewCNQOmbApYI13yZUd0WOdeMqN6FPwbf8jRCg6S6KGBaX
         /CxfKtvmcVdVaInpniLAhO10G5Ie74B4YrO3ewquG0c2v2p+5S9TMTpKGcjV4OXa4a+0
         zgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769161; x=1793373961;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4a2HGeqSU90/oPjDCBfIOMhTpn84AQ4hBfmcEVcMu7Y=;
        b=EQJLpc0JzyyxChpRdg2wlvzcLQxpmSF5mzkHHLKOQs2abNprH6+IFirHktCk1bSsCy
         Ns2OkNp80qvXjzo889Dz9O1U75KsVOZ2ri/mdWaNXtIdI7kMo7AllyLINjsfDdmt0pLc
         y3/Dt4GeQpa197EKAzyoKDxwKoT/T4WL9RWTgxrLB0aI+0Vvwgdw6pBjHvbNBiYkEq6g
         2iitzkekyuUfOFMfxb1zvtqa0zSe/2MqvTDMwsM+F055HyiFiDDFbciHyXqFLWyZwdSb
         MZb/1xJbIiJHBvVlRiskkGKt9k1JmFYB5ztNIpIAAU9vuv+t/54nbAhuQD9l72YR9BrL
         zKRA==
X-Forwarded-Encrypted: i=1; AKwUvBxYyA0MG9mK4oq/1vQOuv6TbGpWyWT4NpJ4az8wJINNS0qlZxb4kjQpQfS02Pw799clTHqddLP8N+vl2/FT@vger.kernel.org
X-Gm-Message-State: AFq9FYJw/VKIvfYLehmz7a8OeCxiTUj5+DMatf854vAefM/CmGhwUkXu
	5k/qaXRiWuQamsMnJf1e0RLYGYstA+qwn4YYg3XVSlM13o23UsXkVQs=
X-Gm-Gg: AYBFou0ScK7tLv1wSChkJ7rdWwz8LqGw1dm35TrKSjBvOnYmpMwuaCp53VXUqC0sqYs
	C6ZaZp5Lf1oNGI1Bu5WU/UpdFH6EIa06iERAs4+PMBggYZIaE7vmV+xOlDCRH3pGjpt310kVu/P
	c18AEY2Mh4dLPJdDAYPGb5JH/Dtox/rbgZuug8pLqI9NTDM3izzzsY72Q/LfT20ivHaQgNpzCkS
	p4LrkaB4dvt1klcI5+i+jk6rZmwHUMUJtjWiRuNkiCZ2jxsxBVHgty7i5nM76CHvAVhAkJKKAKW
	wKAIjHNWYHHjgQ1TnTAJgp4eRwdlB4MR3/CQlnPTFdMASbcIKMroAzo+StfFk7k0fuj45GAnyXW
	8slHL+XdPkE6ewjqVJ8DyOqN+xGdCnjxNpQ3yMHMHJ84y7qnWapsaO3rvgMUdAv3YfeObcGd5w2
	ExCT0tc7Oq7pW+egBs+jfUzTxK/+EX/hEXslk3q9iCb8UCU1F/+D97zIUEMjzsIBPaRC/wKp5Ip
	fkwKHjjjfC+T5/IXF4NAzfz8Io7vxg/fcvmiaWO8HsL1k6JuohNIQnGBRF4dPn7J4aorxWHREng
	ZKOBY1bjGOyC4lQotdn7F8/h6AL80yZ8Y8umn4nSI2pq6rq9zl4BW5M1gA==
X-Received: by 2002:a05:600c:19ca:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4a211c8fa81mr43106325e9.8.1792769161277;
        Fri, 23 Oct 2026 08:26:01 -0700 (PDT)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a29cda9686sm11718245e9.6.2026.10.23.08.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 08:26:00 -0700 (PDT)
Message-ID: <af06c4b0-55a6-45e2-b2d0-81d64fcc845d@gmail.com>
Date: Fri, 23 Oct 2026 17:25:58 +0200
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
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
 <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
 <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
 <m4vwrqt6yyaawpvkyrqfzs3kbipbhygmtrhphuthl2gmjvkgyt@u2d3dnvl2phy>
 <54cb37bb-aaa5-4c5d-a563-acca4822dd35@oss.qualcomm.com>
 <t5gu6ciwmxdb2jghc44gtixdsbedkgy4yzke5sgawjrr2h362u@ahvhh3yfe6lx>
 <wtun2cfukyzxlsfiz2izsejd33k4jpapwqa3uqih5drcsrkff5@e6llkke5dayw>
 <1f6db59c-b7a9-41a1-8022-6713365fa09e@gmail.com>
 <fcb86c33-1893-47bb-80eb-20acd65f3805@oss.qualcomm.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <fcb86c33-1893-47bb-80eb-20acd65f3805@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/22/26 11:46 PM, Akhil P Oommen wrote:
>
> On 10/22/2026 6:24 PM, Anna Maniscalco wrote:
>> On 7/9/26 9:39 PM, Dmitry Baryshkov wrote:
>>> On Thu, Jul 09, 2026 at 05:54:23PM +0300, Dmitry Baryshkov wrote:
>>>> On Thu, Jul 09, 2026 at 07:12:39PM +0530, Akhil P Oommen wrote:
>>>>> On 7/7/2026 10:09 PM, Dmitry Baryshkov wrote:
>>>>>> On Tue, Jul 07, 2026 at 05:02:43PM +0200, Anna Maniscalco wrote:
>>>>>>> On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
>>>>>>>>> In order to associate the SID used by LPAC to it's own domain and
>>>>>>>>> context bank we need a separate node on the DTS.
>>>>>>>> Can we use iommu-map instead of adding a new device using the same
>>>>>>>> addresses? You provide zero explanations, but it seems like you are
>>>>>>>> trying to separate a part of the GPU into a separate device, but it's
>>>>>>>> unnecessary.
>>>>>>> What I was trying to say is that we need to map sid0 and sid1 to different
>>>>>>> context banks.
>>>>>>>
>>>>>>>   From what I recall, so long as we use the same dt node, the iommu drivert
>>>>>>> provides no way of doing this.
>>>>>>>
>>>>>>> What kgsl does is having a node for the iommu and then subnodes for gfx lpac
>>>>>>> and secure.
>>>>>>>
>>>>>>> The address on the lpac device doesn't really matter. I have very limted
>>>>>>> knowledge of DTSs but I think we could just leave it out altogether?
>>>>>> I think, you were poined to the Glymur Iris patches. Another option is
>>>>>> the QDA driver being submitted too. Both ot them use iommu-map to
>>>>>> describe the same usecase - a set of SIDs which are used by the device
>>>>>> but which should not be a part of the defaut set. With it in place you
>>>>>> don't need to have separate qcom,lpac devices, no additional properties,
>>>>>> etc.
>>>>>>
>>>>>> I'd recommend following the same approach.
>>>>> iiuc, the conclusion in this recent thread is to use child nodes for a
>>>>> similar case:
>>>>> https://lore.kernel.org/all/20260618151745.GD231643@ziepe.ca/
>>>> Let me check internally.
>>> After a brief discussion: it can be either, depending on what suites
>>> better (and if you can persuade DMA / IOMMU maintainers to let one extra
>>> bus or not).
>>>
>> One thing sashiko is pointing out is that new dt should work with hold kernel so, in general moving sid1 from there would break it since old kernels don't know how to handle them separately.
>>
> + Bjorn/Konrad
>
> Not sure how strict is the requirement for compatibility with older kernel version. An
> option in your case could be just do an override in the board dts file of the
> Steam Frame.'
In other words that would mean not upstreaming the DTS change? Although 
we plan
on keeping LPAC off by default upstream it feels like that would be 
quite a big
barrier to enabling it for people that want it.

Also yeah not sure where sashiko got that requirement, maybe it's not a 
real problem?
>
> -Akhil.
>
>> Not sure how to address this.
>>
>> Best regards,


Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

