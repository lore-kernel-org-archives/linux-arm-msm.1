Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792853880;
	b=NfbaGvVzwqHlnJdQE/Vw3+Bn0gzkOu7f2yJM0iIHdhCI0X08bx0cNf8f8+stx0Waemau
	 EovaVvsfHrJ3blCzOvhDokViqpuls+dE/g/FiwYVLDdDDfsFVtYDYdtTJ4quGBUvhcWw8
	 ppO1j9AIvnJ4Gd1xGTC9+ACtxwaUjpEW7NGPz8df0McaWzAgBxQJ5vSdkm598LGBU6PhV
	 RtD8NcB4efIYBJm1b6mhexA//qvf16jAvOiXBkofoYGEzYyxGPu8xnH0Y3nyyrDaw6USP
	 +RlbHSHbGGsCj6RwHrICz16ajNqsB31j7Yf59ju/e3Pqceehp78uPsOnFw7lPAq2Sgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792853880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0glh7Tm3hCTaLHkk+iB1ZlmshEZqwQSCyeFUL075eSY=;
	b=1XpNp5gL4Sy7pGjS/31PLI5lrmTGWRrth9HU/ZGX/jMDuyRvwENm0TdgG50k4ryLcv+J
	 C031BVQ3yhBpLwnQIT6819DU1BxETXQJu7qRuHMA45pNxHJpVP/nzgcU73FkWXCubK5Ps
	 0IHmBz79pAOSJqMJ62KyawoqQYmdVgqX4OR5tjTyMsLy8T+wnVSLFjoYPThhwsSNQ8lJR
	 1AlVzy2l7hdwa4zQHbFHxQINZ3SGLpELzsYxBoP8ahQuRHKAFvmvbszISjIG0pRQZ6lq0
	 yp/s4KjiQzQqmAT+WWY1I7pGW2/Oh/h3/9N0fC6F6nIe/yCMwGnr7pUy8xmXcatJixw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nMxrjfJN;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00E6606A31D
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 14:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E00E6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nMxrjfJN
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48df4f540ebso952571f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 07:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792853878; x=1793458678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0glh7Tm3hCTaLHkk+iB1ZlmshEZqwQSCyeFUL075eSY=;
        b=nMxrjfJNFph/Sn/t1gDc23RmnPkpjH+f+gr0HSGObz4xkS4q0QihM+B/1cDxlUhIc4
         sDnXXIVtwJjBhP1yY8aNpREl5r+B7A4jWr2NCudhe+0CNu17U9Gk6VfIx/grCZUKKtKc
         /dzpm80Vot/uFLoyRD6Jn9h8f2/vRSrUL9uPREc4Egg1f3vhEnSRZTxWYqVUlwJ2sv0H
         5LkZ1zS21msqH3aYZ8/ehsgHVCRF1e+PsododjaTmJrBRtBk836CgY4/Jym1DGWzVowO
         9AFPAoXjhH0iRMvv3u6TzGC2IERxaRuJTCl+zZF0NMjyleTjpdGU33dQzkTIHKFTNmy2
         OkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792853878; x=1793458678;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0glh7Tm3hCTaLHkk+iB1ZlmshEZqwQSCyeFUL075eSY=;
        b=c0+WMqag8x+6QPFbDVLdPzhIc+H8v1s9qrzc5LO/cdt0bO/u2NNhX3yr991cQsqArb
         BVdS8UVSUHc/RUv8sF5Zgo4X9/8FXsdIkmVRwOQe+oedg1ImAaHe0gnZa0ZUd9qI0pRC
         ZK5zJbNqpjU2V2oVflUKzTPbfnM69MHBZGXCEKMJx/IOb1Vjakm/b801afZnaQBMa28n
         Ih4IvI7bSvTSHJHUaV9DuaE12stKKzURVfvhaQxYesU238X/MaClXrO8nZMAXCrtg9sP
         CVjiVRU+WDA1tmnKPJnfRtAAprYb+AhaOyZCtCTpjQPLGV6LpXeE6vvvCCvzafsQnzup
         Zp3w==
X-Forwarded-Encrypted: i=1; AKwUvBzsbH98a7073l95A1d842T3qbqgYIj6b5PSV+6QclIPFs3EOUYbleqgez4fZy6kA2yutB3Xax70ST0HOB3Y@vger.kernel.org
X-Gm-Message-State: AFq9FYJEnYdRogLpIikzw5VJxGzZ7/wNK0EN+07soUXmL/iTZIQGbSlg
	ABERcC7l+zJkUpcH0Mm3lJU5yxnCtligbhTBTkBkqebbY1gwkVepEhw=
X-Gm-Gg: AYBFou3J2BGu+HyEcdl+dMhbXrhUEbDL96B54nPO49I59oeCyL8WUWtAEi8wn637X9v
	JgbtvtN4g8TRPuu0dguD+LXfT48v3Vkv70ITc/zH4/wHMsVl6VcB3Bbju1VSO7yFl1IC1NOf045
	KrKLINV7W9IDfWtCvoO0tJ42NTHBewnHQhaaY7IC4xdBaABzFwWkemiHv+fKOobzKqgHzzhG+kh
	o507HVMIYwwOTI1cgHjHQkOSxjUrBU33arNHYGj2SwUSdFqesIJaDGKwHLMF13cGxptv2TrpcTt
	Umb1J5GBNxk4dor+IKx2NGjiZtUGIq4LLgzGGZO9sggzBVTESydzc6dSavbxpTyg/UiafwbtFe1
	2de0RiQBXqWNG/uPmGOm3xHrPOYxpc8mR5co0mMkTlM4hKaJpt9HEFmdm15H4uBKIUOiP1/l4U8
	TOiScoX7jNdehptNofrqIjoJjwx1amfVgqWxVUTnKircrNOQHQfjfr4enJ7O7zEbYL+iUwmkV8t
	q/a2lLqyQTRp45yzqB6JIZOOQpQLp/q4Z9amwIV76lNGSODP8Myo/xIsuSrcP1TPfl3Axmr3c0O
	d9EYD3qrQkstYpcRgA+nWn1mBE6Z/QozbttXyxkd0kKmBWFrybXiNJpEEw==
X-Received: by 2002:a05:600c:198e:b0:4a1:fcfa:2a07 with SMTP id 5b1f17b1804b1-4a35acafde7mr31200265e9.30.1792853878070;
        Sat, 24 Oct 2026 07:57:58 -0700 (PDT)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fbc718sm50327315e9.2.2026.10.24.07.57.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 07:57:57 -0700 (PDT)
Message-ID: <7d35f41a-c72b-4743-b8a4-0ba715be6756@gmail.com>
Date: Sat, 24 Oct 2026 16:57:55 +0200
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
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
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
 <o2zmplbtmoueumw3iqejfsdmucp5f66woa5hmw3vodbe66reab@syn2ashugzyg>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <o2zmplbtmoueumw3iqejfsdmucp5f66woa5hmw3vodbe66reab@syn2ashugzyg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/24/26 1:36 AM, Dmitry Baryshkov wrote:
> On Fri, Oct 23, 2026 at 03:16:27AM +0530, Akhil P Oommen wrote:
>>
>> On 10/22/2026 6:24 PM, Anna Maniscalco wrote:
>>> On 7/9/26 9:39 PM, Dmitry Baryshkov wrote:
>>>> On Thu, Jul 09, 2026 at 05:54:23PM +0300, Dmitry Baryshkov wrote:
>>>>> On Thu, Jul 09, 2026 at 07:12:39PM +0530, Akhil P Oommen wrote:
>>>>>> On 7/7/2026 10:09 PM, Dmitry Baryshkov wrote:
>>>>>>> On Tue, Jul 07, 2026 at 05:02:43PM +0200, Anna Maniscalco wrote:
>>>>>>>> On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
>>>>>>>>> On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
>>>>>>>>>> In order to associate the SID used by LPAC to it's own domain and
>>>>>>>>>> context bank we need a separate node on the DTS.
>>>>>>>>> Can we use iommu-map instead of adding a new device using the same
>>>>>>>>> addresses? You provide zero explanations, but it seems like you are
>>>>>>>>> trying to separate a part of the GPU into a separate device, but it's
>>>>>>>>> unnecessary.
>>>>>>>> What I was trying to say is that we need to map sid0 and sid1 to different
>>>>>>>> context banks.
>>>>>>>>
>>>>>>>>   From what I recall, so long as we use the same dt node, the iommu drivert
>>>>>>>> provides no way of doing this.
>>>>>>>>
>>>>>>>> What kgsl does is having a node for the iommu and then subnodes for gfx lpac
>>>>>>>> and secure.
>>>>>>>>
>>>>>>>> The address on the lpac device doesn't really matter. I have very limted
>>>>>>>> knowledge of DTSs but I think we could just leave it out altogether?
>>>>>>> I think, you were poined to the Glymur Iris patches. Another option is
>>>>>>> the QDA driver being submitted too. Both ot them use iommu-map to
>>>>>>> describe the same usecase - a set of SIDs which are used by the device
>>>>>>> but which should not be a part of the defaut set. With it in place you
>>>>>>> don't need to have separate qcom,lpac devices, no additional properties,
>>>>>>> etc.
>>>>>>>
>>>>>>> I'd recommend following the same approach.
>>>>>> iiuc, the conclusion in this recent thread is to use child nodes for a
>>>>>> similar case:
>>>>>> https://lore.kernel.org/all/20260618151745.GD231643@ziepe.ca/
>>>>> Let me check internally.
>>>> After a brief discussion: it can be either, depending on what suites
>>>> better (and if you can persuade DMA / IOMMU maintainers to let one extra
>>>> bus or not).
>>>>
>>> One thing sashiko is pointing out is that new dt should work with hold kernel so, in general moving sid1 from there would break it since old kernels don't know how to handle them separately.
> The rule is the opposite: new kernels must continue to work with the old
> DTs. If the new DT breaks with the older kernel, just specify it in the
> cover letter so that Bjorn doesn't merge DT changes before the driver
> changes find the way into his tree.
Ah ok thanks for clarifying that.
>
>> + Bjorn/Konrad
>>
>> Not sure how strict is the requirement for compatibility with older kernel version. An
>> option in your case could be just do an override in the board dts file of the
>> Steam Frame.
> Anyway, would it be a problem? Does GPU normally use SID 1? Or is it
> only used by the LPAC?
It is a problem because, even if nothing touches the LPAC ring, it's 
firmware
will still initialize and that will cause page faults if sid1 isn't setup.
>
>> -Akhil.
>>
>>> Not sure how to address this.
>>>
>>> Best regards,


Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

