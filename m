Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B6B3CC7F8
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 16:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784910590; cv=none; b=gp91snVp/E8RdLaqJF56hUyDiY0vFNIuGo2SrCC/VGY7CcekKx/BfcqnbWDpl5+0IHT8jzFXqLJL9pxoyRktxx5FpMzeGzMRRF7R7K5k8/LazyrhefFx81q3wUC1Td3jPDfF/mla4LbjbrIS8+gG0eewrnnT7NiHmSvXVekE0wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784910590; c=relaxed/simple;
	bh=519jXsEOx2nmWF6tQf42pw3IycBl4FPwWx2Sr4UsdfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b1j49Bc0C7vk/tnqC8TIA7PkAQvTkuZSjS1AQfIctg1IaUnL7i/zosrIE29AVj/EgJJ6iKq+5m31jp0Q0/xTn0CRDNoQxPSqt41H+zAKLIHF6Oct0jr5GgIkFYu8P09JPyV2RvUO4FYxPEORS7fdWLIiwyz1rHyIEu04aJGK4NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MwFCVUG4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g/hK7+ep; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MwFCVUG4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g/hK7+ep"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbelD3072759
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 16:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LLcN47DbXTezK++pGJvoRjhYXt0+3r2c+iWJU0RjDto=; b=MwFCVUG4ip4G/YrO
	tr8iopJZ+2tR3DFWW3FOW+h/ns1lLINT46/Z3E5gT1aafx7wOvc77PZeL+W+i5TW
	TQNOywn/W7pV4Gd+nzUcsetrYj5pZS1UCu+wU6NDaRUOy4tkiCAt3RGlq2CazqBn
	S1ogl0lQYQkzbOkQO9/gWZ3numjq9oAsW4cDhGYPF08aKJdgraU07YuO33fSg085
	g9zaZ9vU5fasJ0IgVl+px+aNrac0uLQNrDHJKWxAHhj12kDTQnBZLNp5cRnn+2uM
	F+CtKDoJmJQ7GY40NbF+elDFasJtFoSPs/3jVJ4nIMmpje4YFcXjUW6/UTFt/QOm
	cdyHoQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0pwamva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 16:29:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5276aa86d00so10181601cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784910587; x=1785515387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LLcN47DbXTezK++pGJvoRjhYXt0+3r2c+iWJU0RjDto=;
        b=g/hK7+epinM/y5NyD8OyXNDN/xhvnpUTeVn/j6FWZa8z8GwwVaX1ww25+n8yvkCa/Y
         /XGgYMiVx4sgYXRw1E2x9R+kEVkvZz3kN6TSyzREj8++gL+Ms5mIqlZ2egx60FHZz4uz
         uCD4hIDzQyrDOf/eFAoTFfAPi0A3LMeaGS2BuS3cJf1dWVjDYP8As7V15xMUfxoRtIKH
         rud81lcMqacXc3xmon9gCAwoERRHqJapV9m5DWULjIwJ2Zj650rXupSaXPMmAUD3FYT0
         TrAWnaBEqe9xeuFgfK5zV+B/fS9fmPtTxu6IxxvvDTCxaedJhHIMmsvdWZA05xkn4yuV
         VAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784910587; x=1785515387;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LLcN47DbXTezK++pGJvoRjhYXt0+3r2c+iWJU0RjDto=;
        b=Mv/HI01pcN1AYCgH+rYTmRu4F1P4EZSeobCyil+hXrugYtK997p3ze91A1DX8xQDnF
         7NcNXckQOF0XcbVH1GEycInX/u2HrLgnawp/fj8BCmxwb3CThew37l7Fq2GDavUEVTRE
         N4frPv63dyk9oaqzWiduXXEfUbPZHzbMt+vuw/UiLHJc4FaCmfXhLAmf/oi55vzaPken
         lrNM9GOUux3mhxRFbyu2Hpj5rJ61HKXPvLECvhgMvl4mWdfKcHjAl/fZOeZ5Wa0CqRSN
         Ia5MkVv7NLJPcC+cxsRCV894hipsbnQLXAoyhxXsyF24LuEX+B7YoS6jzxWnYnmz2RXA
         48ww==
X-Forwarded-Encrypted: i=1; AHgh+Rq3Iojyg8P1WYrPZAINBnKLs8mdp94+bWf8VqVx7JflglLW85AnCiywGMA5Id3ZkEF6MnY9qDHO6itEcwWf@vger.kernel.org
X-Gm-Message-State: AOJu0YweAGkiDa3UrPFCJvqB4+LBUxXZH/d3rih6FGz7Dl4DQyo0snkg
	qy1BFUKsN4j9StBbNLf/L5Hhh6cOhie4HObhDHmPCdIOeFHeycmfAtItE6muesLCla/T91aRvv1
	VDcEy9daH/P8GGPmcD+ZA1GJsQF4g+XCjXvSUsCnwyr/vDdeU0XbAoPA+n1IP4e97Fdhj
X-Gm-Gg: AR+sD12rsDF+Z0nq0UwqSNYE5YgYub0/ajePf2V8Ya7m9H6vljZSIAKjmHhQ8/jauK2
	KdKc8qE4mTkFlG7uBgBHQIS40SsobIwp/m840mrU2K5hZXlUs/ojyoMHe0txrXViGb9CEvVRK1H
	DOwLaH1NJJdYuKmvH5iAMVe4vF8vbmPufL5mfPukWf6FJ6a2MiqFcrbctjWH64E6YcUayFRyCNo
	GOLQyjaPiwUMwL2L39bSkuCTt/F8JlD438pDQWCjmz7cfGsMvBFFj+qiKsFJhWM+VfQ4ECBmAqc
	/o/tUQLQMjwgzv7BvQu82sd8okXjifE+uwHT3Q5v9WHWxdY3sYr0qAJ2U+lB29nAkyJMipfso9C
	kd9HX8ZmqYYXzhC1Zr1qe+2PLcZQ=
X-Received: by 2002:ac8:610d:0:b0:51c:7b12:5ff5 with SMTP id d75a77b69052e-5283dfea897mr79954171cf.81.1784910586462;
        Fri, 24 Jul 2026 09:29:46 -0700 (PDT)
X-Received: by 2002:ac8:610d:0:b0:51c:7b12:5ff5 with SMTP id d75a77b69052e-5283dfea897mr79953671cf.81.1784910585797;
        Fri, 24 Jul 2026 09:29:45 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-496b486cbc7sm2053125e9.12.2026.07.24.09.29.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 09:29:44 -0700 (PDT)
Message-ID: <28811194-255d-41e1-a952-1c10c03f669d@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:29:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/8] ASoC: SDCA: enable on DT platforms and add
 Qualcomm WCD9378 (Tambora) codec
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <amHqO5pMFmKRNYTT@opensource.cirrus.com>
 <87452472-0ca6-4ed5-a891-3a688598b5b3@oss.qualcomm.com>
 <amNcM0AxYAe4bU95@opensource.cirrus.com>
 <6d1870c1-7fff-4569-8de2-bb45b83cde25@oss.qualcomm.com>
 <amOHgSiSfm2MgQqB@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <amOHgSiSfm2MgQqB@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE0NyBTYWx0ZWRfXwdOOeg7oXGeS
 M6R7Ng/0zqpInuZPKtBRkuC2G747O1NFSYUOkQw5MjSOlXlCR/oGZwZ1ZMxgVzRhxhJDGXVZQyx
 n/TaQdfASn+0e7zydP9QQ1X5gIwPB4Wv3Q0Ww4JQ0nQO9vfM4y37+6dHjAQBtxutpQk3W8BTvJy
 UuacQnqB1VX24lF1wmjDr23HSeyRLwHJncuqCrNBmXhWPBsoHsrVzxtUQz1hkodqFFNeo/3GLfu
 HQptCSpVOYcNsV6CiNOcYqLDHkcFaRyvHO96Kqs+/w6K7Lf8m2QeDU156zNfzc2YFFpeKAUB5Zd
 LmBhjruqA5nSPvNwj5FKW+q6y3HP6l7KPSBavi8lFy/vOqVqGHSnBRZr5V9qFqol1jQF0Klob4q
 TiU8GXavqTJNBsEu/sBgfQsgIpvlLXNmT7ohdRixbRnKwz+3llkU4XICvO5cTkVghIp0NCn90Nz
 0GxtGYovqFsLIuslizQ==
X-Authority-Analysis: v=2.4 cv=RJeD2Yi+ c=1 sm=1 tr=0 ts=6a6392fb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=RbUyBYV5fK3iINMusi0A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: GaWhJFU4is4Oilk8GyG_POXFNa08qkUC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE0NyBTYWx0ZWRfX7HkT4i5n97e+
 gP3tqb3tqGBur5gDYrF2qi7Cyp+NURr5IAx0yEVMddi6/Ua0w0pasAA1dt1QBR8MYoF7OzbS7UV
 A+OyBPM6bc+Z/cDIMAfjXYGBuqcwmQM=
X-Proofpoint-GUID: GaWhJFU4is4Oilk8GyG_POXFNa08qkUC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240147

On 7/24/26 4:40 PM, Charles Keepax wrote:
> On Fri, Jul 24, 2026 at 03:31:51PM +0100, Srinivas Kandagatla wrote:
>> On 7/24/26 1:36 PM, Charles Keepax wrote:
>>> On Thu, Jul 23, 2026 at 02:24:19PM +0100, Srinivas Kandagatla wrote:
>>>> Thanks Charles, for the feedback.
>>>> On 7/23/26 11:17 AM, Charles Keepax wrote:
>>>>> On Thu, Jul 23, 2026 at 12:42:10AM +0100, Srinivas Kandagatla wrote:
>>> Yeah agree be good to get the DT guys thoughts on this. It seems
>>> like a misstep to me to insist that the SDCA spec implements a
>>> completely different system of storing information for DT. SDCA
>>> is what SDCA is now, and supporting two different parsers seems
>>> like work no one needs when the one parser we have would work
>>> fine for both.
>> Am not sure I understood the two parser concern, what we are
>> representing in the table is something that sdca core already does after
>> parsing acpi tables. So we are reusing the same structures. Its like
>> result of already parsed acpi tables.
>>
>> I did try
> 
> Apologies for not being clear. It wasn't strictly a review
> comment on the code in the series. It was a wider point that at
> some point the world likely will want to put SDCA data in DT,
> when that happens there are basically two choices:
> 
> 1) Use the "same" representation as ACPI, in this case we can
> share all the parsing code we have now. But some of the things
> might be a little unusual for DT.
> 
> 2) Do something more idiomatic for DT, which would likely end
> up looking very different. But this would require a whole new
> parser and lengthy standardisation process.
> 
I'm inclined to go with this approach as well, provided the Device Tree
maintainers are satisfied with the initialization sequences. The rest of
the topology bindings appears solid.

This decision would also establish a precedent for handling other
DisCo-based devices in Device Trees.

> Mostly what I am interested in here is getting at what the end
> goal is. The impression I got was that really everyone from
> Plumbers was really more aligned to 2). I am not sure I agree
> that is the right choice, although willing to be convinced here.
> 
>>> That said I don't totally object to the idea of an option to
>>> supply a static block of information as you are in the series. It
>>> could be useful for transitional and work around situations. But
>>> it doesn't seem like a good choice for SDCA on DT going forward,
>>> it is basically going back to the board files that DT was saving
>>> us from.
>>
>> Either we have this at driver level or at dt level, both of them have
>> pros and cons.
>>
>> If we decide to go with dt, this how the dt entries will look like, this
>> should give fair bit of idea to DT maintianers for discussion.
> 
> Thank you so much for mocking this up, that is very helpful.
> 
> Are there additional constraints from your side pushing you
> one way or another on this? Or are you happy to do either? I am
> thinking things like DT needing to be flashed onto systems that
> have now shipped or something.
No restrictions as such, its just consensuses with DT maintainers.

--srini
> 
> Thanks,
> Charles

