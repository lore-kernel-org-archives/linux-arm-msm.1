Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675018;
	b=YFHmKRTSf7EYfXOIlFJsZI18rBfTI9wNTXRn0lh1644Ia1rn7WYQj8Oh0DN8SETNiqr2
	 /26Tc4ZeeZirPd6QJWH7Jwl5J87uGCz6ht4lHPevxQsAa+UhNLgRduGEjpHNDbxaety7Z
	 IXxqXU85oUXEMW+aOuOOE+JikXnm0ktRFl73Bu5ry6MfcFM5au1P7ULtSWBCCFM1smqiY
	 HzXPY73o8yjeKBKD09qWwf1xEc6QrvS+1gDRjwsFnl5xj5m3vnJc/5oW1uZNIJdQ/qHbC
	 +H1XRqjVBbyB+fyrMyuZZk/2p/KSobsqNgVaIFJ0Z4IX83CouSEBZgUncUiZDnH/zBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675018;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XHogjjLeWyeXgDWwoK6G0mFCe502abfVqfNNBKQPSw4=;
	b=R7YxM5Ab6DxYQjew4NH0sO7Y15Mq7/Z44oxLoVXY9mt24m0kC3pEoadIbyyzfh5y6Bpp
	 b5yhphaSE2sgXU0LbO1VJi5MYT2vKfOFXUEqzo4Inj7t9b+soNiqKn7LXh7vd6w/e7KX6
	 yG5Snj3vdBq8gesyt/O6eJ93Uw4QkgMhfUbiLNVA0uVxs1ZRkp9+std4jKzPcR4R9Juxw
	 /+dU3efoO/Ms47RPhYu2V2EqeKIZ9vCThTRvKhxcQkdnRur4WBpH0GAxdqi9aM0J3lstX
	 nLGjvFVk2GbyV4HcWr/kDSSdxuDWgNaeCcK/4/1pKxCC21S5M1BceiM8GcvSOvy5Qow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Htisf5nt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bsRdZ23T;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC687606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC687606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Htisf5nt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bsRdZ23T
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xpKW2574043
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XHogjjLeWyeXgDWwoK6G0mFCe502abfVqfNNBKQPSw4=; b=Htisf5nttZX6+P9C
	q/ThzSJassydYAZaByeoerQywISTTBPBODEVQu7cwEWbvOIn2MmfD6h7h2/sUcaq
	wkVJFtpbkP+8DZoJRKQ4JI7ME9UfqdKIVBuywb5qn03QjHPNSTJSSRYxnYDMfFH6
	JnFaQEecUO7/LcF49suyOv0gOiDb1apnoVrZnmsR947Ksfhv/7N+KxqtdyNz3bpD
	0i7ImNdSO/nj2t3yt6q/vHYfJwAqHZ1A8a/4d6Z9SCHv5HFeLK7c9ijIFYRaJXQZ
	viEqHh6rXaCcmF5TLq6/jcrIQYKBmlODSZPyyN4X0Ouix9ikKB6XjqoMOflAGSN3
	Ugzt/w==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93akp26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:16:57 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c97957d83bso85275e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 06:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792675016; x=1793279816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XHogjjLeWyeXgDWwoK6G0mFCe502abfVqfNNBKQPSw4=;
        b=bsRdZ23TMX1PgEXN/usj3Ify/MN9xyrL07PSSz4Sw4i6DKY5IuT6gU9upDqg58fkZr
         MJooRTmamSwhzvsIL794ZltjNdpYHWR4yBzgnwpgBQUOgdmZJjONjfV6QZZuLvQBZaTN
         ett88t7BTkUSk5h/UzXCZDqaFugxSz482oszUiad9q75nyBrer5EzASlCTNLWt9USPfJ
         reAuJLSZvctTSIa/qcWZPTq0aIcBl6gIlkuXTNyL/N24oejSrs5vxaoCbilqrs985Nu5
         n4yg4IgncTQHYCrV/sfq26ZPWZ8KkqvZMj6GoP9aZxNntGFS/0+uPzKYJga46i588xXW
         uNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675016; x=1793279816;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XHogjjLeWyeXgDWwoK6G0mFCe502abfVqfNNBKQPSw4=;
        b=0MdnfltQa0wtvbBiyrFST/mWOmFDx8V8sZ9WxQDUzo3/Ilg3xR3TNaxJ4WYEjpravQ
         DdwZ/2iojOyos/fUXO7Ybh7AZCWTegAtJjMcf/duXoYQL5HCFpDvDy3nP6iQ3LDwrEJz
         cQVp7rTNKzd37cVL0JtvAMAeTYtafZMu5P60mStZApulCNrQauX9MjMsXApmO6f3fN1B
         0laQJ7zz33jQHydeC9Eh0yp7wcLWUY+23ZvIzAozIOh62FcA/VM6m8jXrofOmnhGZ6F7
         CKSDPtyVd3eQJYOnU36FnnnMoHOwCiLLLaSFUHTRGidKHwNg4ASQ8cTZnprPx9n/QNpP
         QM3w==
X-Forwarded-Encrypted: i=1; AKwUvBwHzMKeXaNjTTGkBEcblaJuyPW2PSN89qdfVLaMKfFSmjP+1ckPoK6kSjLw9M0EOyP0Ty08KfEIoBu1oN2F@vger.kernel.org
X-Gm-Message-State: AFq9FYLMoUnUyi20WV4G/7kCNeUftgroRc3Dtyoo7XDWBMuNXufVo8gE
	JoUcxgd1QjGgesC7GojmToU9ktVozvgHBrx4xaGC6SWiQjeeodp1Qm+W5jT1uUzqwcf4T+Hm9/x
	gDVcwpbkvIqMlvo/9QWvn/CynDA0z54ep+V4NStjDk6mMP2cogYaC4MboBNgE6SdKs0DJ
X-Gm-Gg: AYBFou2EsUQhr+mgqwR2Te8qhMe+D9IwNDuHmoiX0fD5m0O75TNtbgXpw9Q/7gVU9iC
	nJhAkY5bPdKbsMYVhbRR7DOOifTHNYHLQGuGv6RS7vRSsy0RGLmCWNRKDGsXxCM5FSXxGZZ6LBM
	M0nxnW5eUyk0nfBbFFe1xkDiKqQJzbvpgkyZ1mB685fDmjVXZpEqlrE2tGwmU4Bxaf3AIzLcXK9
	WANakSERGbet5no7jgGJQ/r7abuNdnrRIAU3m6N6q0E/VsS42Pfo1xjhZiaWl+mr+76vGl1PFqU
	CEOmyNQ+qtjDKnYG8k3YrG3EAreZQZac3PHrL6yWi5Jx0VokhEJOJlDg6Cj48jWLV8d48I79R2c
	Fn++gE+Ct6sHwcSiwXH7SDQ==
X-Received: by 2002:a05:6102:1626:b0:7cb:fef7:3763 with SMTP id ada2fe7eead31-7cc92623e94mr1737869137.3.1792675016065;
        Thu, 22 Oct 2026 06:16:56 -0700 (PDT)
X-Received: by 2002:a05:6102:1626:b0:7cb:fef7:3763 with SMTP id ada2fe7eead31-7cc92623e94mr1737835137.3.1792675015533;
        Thu, 22 Oct 2026 06:16:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a1eecbcsm105632466b.7.2026.10.22.06.16.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 06:16:54 -0700 (PDT)
Message-ID: <b18e5577-9d16-40d9-891c-35af4c653108@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 15:16:46 +0200
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2
 Key E connector
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Wei Deng <wei.deng@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <0303224f-4c2c-46ec-9866-5ea1fd0fb4a3@oss.qualcomm.com>
 <20260825092715.5794-1-wei.deng@oss.qualcomm.com>
 <isbrpaztfrgwfcleujrn4w26cshbi2mgn57tbh5bubvsegn6lc@jh3ab6htvd24>
 <83b67ab2-ab68-427a-94aa-881454f457ba@oss.qualcomm.com>
 <CAFEp6-2KDxDrfTZLN7KPRg=aavj8nqQr7ftna23n9C1Cpbwwbg@mail.gmail.com>
 <e26f0360-aaed-4e40-b1b2-956c92d34db5@oss.qualcomm.com>
 <CAFEp6-0b15kV6ehMN4Pv24UmMo7xFYr=H396dvdD1Teh7h+K+w@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-0b15kV6ehMN4Pv24UmMo7xFYr=H396dvdD1Teh7h+K+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wXkCjTu9fpflTmrCrYf_lRIHjPaJ0iLX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MiBTYWx0ZWRfX9HLhyT3uH6BI
 3dNGGtxI0s50GdHft9Kvz7IKj0DKlGzaNohH0/sE6ZwEH6Gtrlr2EmS+KG+bIEMRQlKeNaR5QwI
 GHl6C2I3yV/2OLFz/Ts1gJ+F4GZmLYA=
X-Proofpoint-ORIG-GUID: wXkCjTu9fpflTmrCrYf_lRIHjPaJ0iLX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MiBTYWx0ZWRfX59P6P46N/3eq
 vD5TEEJdW1wP4ZB+w21CUaYWS6VtXYTfkshYSoW1NN1Uy2+Anmo6mWvodiEafbLoGo4SICpIaQp
 wUd2+CFX/VdrqoLNqj7p/8gCD4odLAp4yMOw2XTf7m/z7Gxh0EIWiBJJ2JCtJawP35cBHq0U9Ia
 0ZcibeLi0ILdcaBps0FIcMfmwsNE39Z6XOjaCEM6z9wALuY0IRAFMR26X+i4/Gz+aUcgFv1KHhm
 oNdVHP4bzj4exdP2ANKfxKN5LAw7PwcMOCIabFMAmKYXpTHXwosDygYWxgoq5Sa2xBFEze6nRWd
 y9C1dylHFKKDWl6WFk7JGRQwbgwf44PzBBzD/46jL7nMD7nbkRQaWBnM+XRunB2fPjZ/CrHccRL
 TYr7pVZ/IPZzuJmzRPIfP7Rh59XRVsp7dMq1tYO40lAYMUrp/oXT5XE+bHpC9TgxNC4nVKtWxjH
 w74cCHUjR0upSK6Ftgg==
X-Authority-Analysis: v=2.4 cv=dOszC+Zb c=1 sm=1 tr=0 ts=6ada0cc9 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=5fzcQa2O_f0PTkyQNbAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220052

On 10/22/26 3:08 PM, Loic Poulain wrote:
> On Thu, Oct 22, 2026 at 11:34 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 10/13/26 10:13 AM, Loic Poulain wrote:
>>> Hi Folks,
>>>
>>> On Mon, Sep 21, 2026 at 2:38 PM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> [...]
>>
>>>>>> We are adding M.2 Key E connector support for monaco-evk [2]. Konrad
>>>>>> suggested moving the port/endpoint anchor nodes to the SoC DTSI
>>>>>> (monaco.dtsi) for clean DTS layering, so that board files only need to
>>>>>> fill in remote-endpoint for boards that actually have an M.2 connector.
>>>>>>
>>>>>
>>>>> This means, the dummy port/endpoint node will always be present even when the
>>>>> M.2 connector is not used. I don't see a compelling reason to do so.
>>>>
>>>> I don't really see a compelling reason to defer re-defining them to each
>>>> device DT either..
>>>
>>> Adding an empty port/endpoint at the SoC level is problematic for
>>> uart, port is not always expected, this depends if the uart is exposed
>>> through a connector or to an onboard device. So we may end with an
>>> unconnected endpoint but still have a bluetooth subnode, which can be
>>> a bit confusing... Also why adding a port/endpoint only for a specific
>>> uart in the dts, and not for the others? This is a board/SoC level
>>> choice to use a specific uart for M2 or not.
>>
>> From my perspective it's removing boilerplate. Currently all USB and
>> PCIe hosts already define their ports and endpoints in the SoC DTSI
>> and if they're unconnected, then simply nothing happens.
>>
>> Both 'ports' and 'endpoints' are an abstract property that signify
>> 'X can be related to Y' and I don't see how that's a problem here given
>> UART is very much expected to be connected "somewhere" (with the
>> "somewhere" perhaps being external/a pin header)
> 
> Yes, but in the UART case, where the connection can be represented in
> different ways, we can end up with devices being described as both
> unconnected (no remote endpoint) and connected (via a child device).
> We can probably live with that, but if we go in this direction, we
> should consider adding a port/endpoint definition for every UART
> instance in the DTSI for consistency. The same would apply to I2C once
> endpoint support is available there as well.

Guess so!

Konrad
