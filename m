Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7166E4CB8A3
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 13:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787003; cv=none; b=fY4y/Y4949S34pgw/+GDkLPXOzGpIm2E9Rb5lCcxk2lWDIcOYvUfoMhqjBSYMDQeM/mXtSTPFiYqn0ZpDRTK73kM9xoxjxGDvnjFXyPcKeXOIeYhS08Y3zw5nOqaQvs1brjWnD5iOhH8hMQ7Kel1KozWxEIS1fO0hJlICzznadY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787003; c=relaxed/simple;
	bh=G2v8Z4In0XdRAS7INMiDLN8saFBbHThX8C3LzAr0q6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XdXglFmE5kp8cPrAIGYrnAd1VzN2oD7qb+Ctw0fiEfCY++crpOGwrcmZzbl2DAf9ys5X2N8B/cNnFKErHljjcyS00n0gOHCaSWOQuZ9ogcb1OX5MYx93n/VOS6Ri0pqIdmNDICz5LLmg/ZZ37Nba+bWarQgEes3KzGFcTw1sDBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qi+be6Fj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DNslYb1+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qi+be6Fj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DNslYb1+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AvTJT496381
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 13:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i/JbXDPZNdiTi4gFT/05j7G8PAlG6bXM/OV5ZMst29U=; b=Qi+be6FjJUIG70fb
	i8n9PVOwpcdyzyQHqqPWVv3O9greCJcXmPMxIdfG+ksR8LHCmjZj36HM08ylYBW5
	lF1r43md/0MPRSyDeGKFRhJkeipurAGK2bLrEN/GU8wuQKdbW3brEyw7vPlpav5l
	4Gc5XHZc+8Wfd1uEali5tnAN/AnUyYbrWryvjCYETJhcPFQ8ujjR+ugccGO++lpW
	3+W/QNI4xmegDrTlsvrAZqgw2ScLoYCDz+7hnYaaMKMZQfHuhV9UqKCGml81tMsb
	GoBHOFNBFgZli0l2buLvHCXUh2D9C3bZRLYqTKds6JJPHZupKRo4K1wqXoAfq6zF
	NkK2dQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuyk8fcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 13:16:38 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97cb18cfa04so2509705241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 06:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788786995; x=1789391795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i/JbXDPZNdiTi4gFT/05j7G8PAlG6bXM/OV5ZMst29U=;
        b=DNslYb1+j03QCL+J0b7ynV9Edh93gYkITo3U75EMzqDyDIqkOs759oQK3i/F+7dht3
         QwCd5FqClUvopjkoIIfTw8ocndVG3E0kMjHjo7PdGKzi65x9RFvvLgw0s8mY/kcul7j4
         HpWji1Z8F+97yy1LWFal2ruU8LDMmVIJQQA8NL1oODNEChpNZxJ/M8WC0P61DpGDy23j
         bRAGuFB20Y5EmMcbjnPKt/mOjMdrhpVGtzZidoK6OHw30yE8Bdy2urxWOKyPw0wyout9
         IJp1S2uwwCtlhawaY+ENmHxsWahFOJA2a7keaY9/e9wSTaLwSmgLjqQODrG21gbsgIBx
         xyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786995; x=1789391795;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i/JbXDPZNdiTi4gFT/05j7G8PAlG6bXM/OV5ZMst29U=;
        b=ZPhcacyRHHNJXiydiIC0uqXljA4RHRamXyUvgBUbchMlPGjj4HKhAgPKXV7pfaCzkS
         sKDtX7la5VtFYg0Ccn4ypxbtybIGV2I/iXDwbIuvkGAX95t+5mPK1tHRouKc+xhNwGtW
         RiTrOBHsumcvrI3hFS+4fPP/9EcOpH3KkQBxg3NsOyuPE3AWAQl6/gB+vOO5d1Ums/FA
         uBETmMMIswOUvJNiOQSGOKiQ8tcpFk1BGO+O8Elr6h92geidM8ZH3BZXTKeoJUPGiHow
         3F5iYT1XZVgikFhX0o3Z3tkyfL6xQZE+mkOUhPu18Y8/fliuoMTreyBa+++zHrjk2563
         NDcQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1HjC5nV7VYOnfYGochvdJNqIrFl9DpnLkJVlH5s1j7BW2rZT8bxCt6NtY2gtiqdk0rn0EpG/b/4SEQXff@vger.kernel.org
X-Gm-Message-State: AFuF++kcwuKSH0A69v5iMDbFMHgwacXxBEKGbd8IwQyLZyiQAYtJNG3/
	Jsj8BKpZYXylet/bLwzC6X4yuv7Z6yLWNHK3MKQMo906o34B6D4kY6+reWusmun5GUCDf7X0jz0
	3Xrf0RM/xVsWXswqqrMNQW7aBOaFV7Hy5jTBwNZoqwaG++6jL5Hu/ttDydBwtEnb5I1Re
X-Gm-Gg: AYBFou1Cyh0C1am7ibIPTw13UFISxkZO2Tj7ztlETmfdonIPs78VFoz5ahVaZ/koIar
	Uqyb0oWjBiSAb7qq2BSXr7WsEEsrvegpRl3biKyizhPca82ypPUx/kXDQIAyXf2y1vrRM+VikFU
	ScIwudvkoutBxCbH4Rxv+NyP1iO4O1iTRPFikSMPsQqxiJOeZxGs/5+EmRSfYNjI2hjsnMenxx4
	bvHPn1OCWVlivvqshkBt1suk51NO/LQfYEUSrh0JPIPkANsPO2IlJ4gjPz+bwmwTg5Tt07Xfysi
	UuAM9nWQvUUsQu2ZIyc+Ud1s467cCxhNnegOFrbfOfgi/6oJxOUFsfAFPjWGMNXuuOhOZAau7a7
	4QSv99QWilIDY5K9VvIQf7bMvO6M=
X-Received: by 2002:a05:6102:560c:b0:786:aae:aefc with SMTP id ada2fe7eead31-78a4aa9d9dcmr9477031137.13.1788786995106;
        Mon, 07 Sep 2026 06:16:35 -0700 (PDT)
X-Received: by 2002:a05:6102:560c:b0:786:aae:aefc with SMTP id ada2fe7eead31-78a4aa9d9dcmr9477009137.13.1788786994613;
        Mon, 07 Sep 2026 06:16:34 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c28e9eb4d38sm176729966b.41.2026.09.07.06.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:16:33 -0700 (PDT)
Message-ID: <abaa945c-9af7-43fd-9f2f-ba20eec2a9bc@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:16:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] ASoC: SDCA: make find_sdca_control_reset()
 return void
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-9-srinivas.kandagatla@oss.qualcomm.com>
 <289d5485-44fa-4d74-8f69-7adc1507ac9e@linux.dev>
 <ap62OoErmU6lU+9l@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <ap62OoErmU6lU+9l@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0NyBTYWx0ZWRfXzavhSafULLxg
 DyQmQ3f+c8efWV+o/f5V/ppU/0Lh76EX0BMQLEOONBeIh1qikKtKu+VXoc+IuQSSGQ7QUQxs3H2
 gVgcmzr383QDVRE2gJW3QRE+YC7+KMw=
X-Proofpoint-GUID: BLw7styHMdPB51P6lQcgaZnb_6NHNw2b
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9eb936 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=w1d2syhTAAAA:8 a=zomqoF8P1_g83G_DeI8A:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: BLw7styHMdPB51P6lQcgaZnb_6NHNw2b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0NyBTYWx0ZWRfX8ViTazulZ+UA
 z4upU6Hhw5ufUZ7RSE3oEaLFcUIg5OeIiwEfuN7VuOknOKDxQjdVYn+Sp+fqpUJpr9X1Dy9NOQK
 SArHPB+MqYNSHjoXWxhYrvd38Wn3tCQMvSNlnbjSNYj5/P8ekwmqU+GcRz+gm9ZtP77tFU/gdda
 c63hVGcqWOKCdsAuny/YSZcP43ZSxXifEteSbSiANDofOEcdLy0kf5d1wKNGwm6c0dsEGijNDM7
 jl51oNuR54NXtqaOXC+VG8bg72EdKV1yXn/G32CIj2nZ62HnEUOWqgzBXVIXd5nqd7DLnpVRtpl
 vnWvCUPpAwJyRbR3x3bS1tNBANJ/C20uycUbKFSEJCK5akaz+9+yRAx05xO1IaAuAAv0vafvFL4
 U86+V/GR8LkXglTSedHXs47dAbx78Mh0ksLKlnn0NqZ3RMAOjcWGf2k4u6/40XXIOVIprjjU8B/
 SsXlVMHXB4W5jsvVXYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070147

On 9/7/26 2:03 PM, Charles Keepax wrote:
> On Mon, Sep 07, 2026 at 01:32:30PM +0200, Pierre-Louis Bossart wrote:
>> On 9/7/26 10:37, Srinivas Kandagatla wrote:
>>> find_sdca_control_reset() only ever returns 0 -- it just sets
>>> control->has_reset / control->reset for the framework-known
>>> (entity type, control selector) mappings.  The int return + caller
>>> error check in find_sdca_entity_control() are dead code.
>>>
>>> Convert to void and drop the check.  No functional change.
>>>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>
>> That looks also unrelated to DT stuff, not sure it belongs here as patch
>> 08/11
>>
>> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> 
> Agree lets pull these two patches out and submit seperately as we
> can merge them both happily today.
>

Thanks Charles, Sure let me send them out separately.

> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

--srini
> 
> Thanks,
> Charles

