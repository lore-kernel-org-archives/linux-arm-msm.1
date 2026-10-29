Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793285507;
	b=grQEHcGvkVatlIyybdcxnfnHuQfI95nu0dX5kb2tbl3o8oRGC0WbPUobqD1TgS8XZVji
	 sHtxsBbhfjf91I386ePqEacdVleht3P/0eTaJ2rOtdbAaGAJ5u7UNePtTJeuyexFfmwzP
	 J+6Ds7LwzEvemqSexs53moeajsYWjBU3ijL+Jwn7V5bI1E5weRh+dA/j0tfHL9aIo7ens
	 iGuzcS21ea23PIMS9Dp/pmx5V9Usz15a6/FhMsj3tSKfQme87jruzfmXcfTz+kMNtZ7rA
	 8JB7ah/WfIasyCBugZyUXWXqQ7qaDNGTzhfChOGCuZVBZCPCin/gWQOjaSB5bodFM2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285507;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0srwOxBC0w75+XzAU+j2O9cViAS+CJV45HbLV2IBRY4=;
	b=pbsMTb2H59nZi4YeFeD0mDN80IlrluwZOu23wFrL9/OR7CTp/JPLmur+AQTfTxb91kl8
	 hsxXWpHdm5l5q+F/7SnUBhhYrYG6TrEOwkQ2xuz3TN6T93Lq68O45l0xQbJa11jvsoGTw
	 SrlnC7wr1wKQhtMcTb50cvSogflKzO30wyImqQM0jLjlghi0yWBZfo9l64zlwccgfzctY
	 YPvgpn7g2rwInmWU4affxEWWhkq1sSjg3+vIJ60jXzMhUUYqQ3W7db83m+M0BN6vBMElC
	 AqrLBQ1UFSdHMHHaGANmA7J39MN/iNm3wrhegU22VHje233tbtzHZV8phkr1Ctf7y5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a9ITikiB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MXxQaxL0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569AD606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 14:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 569AD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a9ITikiB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MXxQaxL0
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TDaEI23521428
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 14:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0srwOxBC0w75+XzAU+j2O9cViAS+CJV45HbLV2IBRY4=; b=a9ITikiBPCjkPmwp
	eBm/Fw+cyDD/KDj3Q8dQlAutk8xEuuQsSGJN3ft6Jh1MHKAa+hlsSEMf7fL9f9kj
	VAC4o/gIe+bO9YDAQcYnFprmcmZFGpWNZ0VlkRfmYWWXrDlBo94fWtiGWoTRkhFB
	G95+01nw3bDXWwL20I4qmDaI/asN5BPs3NXgKlNXsML+u2e8DK1d9nQajzaTzQQE
	rv1pM0zWyATn9uRG3lEk9tcZ0rNPjJy+jA/d3xThojaGxNMNR6fk8zE1ebpTW8DD
	gOdqyJs8DaJNmMC21vZc7GpDvMAcL+3cGr8nSve2oLfqDF54PcZ08CeNW2jyHaAc
	5+/gVg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm7620atq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 14:51:46 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ec3e1962c2so2362229e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 07:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793285505; x=1793890305; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0srwOxBC0w75+XzAU+j2O9cViAS+CJV45HbLV2IBRY4=;
        b=MXxQaxL0Y4lVTuCZlsadMEiN1Zaf/Y4n3QUO/h560Ya5VHuHFQfaOJLKoJcwNut7e4
         168vyu0OoBsMTCfhoWZIELTJS70Oum5/CUHTezdjAufG2pEG7nIrKAsxI3cWZkKVJHOw
         z1Eve+drCckDKGTc5C8v1QPVGnAiEmp8PZXNDbRlmfRFIr8WEJboZwdBc9U7D+Etz4e4
         Ox4p/DuRkmBtYeHx3Pb8G9l05RkLiO+4NQ8sUSrSJ4nhYpgONSHLS27OM70OKBqwXSD+
         emlf4zLR2bMHIIfVijS3v6vDpzC28MoBOo2qrq7czl0QGdtouEXe7Z/vaMbn54FQi3ha
         F4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285505; x=1793890305;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0srwOxBC0w75+XzAU+j2O9cViAS+CJV45HbLV2IBRY4=;
        b=qArdb0qXSu9iobbMoFXIIfKpafOitC2nKYnpr9s1A1WJAVYTzriFuAeonZsYRVF2IH
         NGumqVOk0OQYqQHMoiokEaRmy8JoAQl2ZHqW4iv0sqkbQGDRVPYmDGY979cqvCrXmJvW
         eR51Dy5YZ58OMd36XeoKpU3bIcnldSC8/oU/74SshTVNt1BIYWMU4zw0paBmLUArpbcr
         od5OF1Pt25tDtTyWwZkklD0IyGU9rXoJ8mUq+NPO+wBsTVXY7OUDcC7Cu4jfja0aKfAs
         pVhL3bRPwr+IbhqJbTeaUSEbxWXVpf5EiStBJ+EgsmbUYPbczG9vVt3lSjcQlxL/2bt7
         CGfw==
X-Forwarded-Encrypted: i=1; AKwUvBzbnFIhCMVOa01CVAcJh0f42nUb24Qs9dSfIV0pBp3Xizuf3vvkq3/LQ0ynUxgQ1dIxxSf67f57xitNePh2@vger.kernel.org
X-Gm-Message-State: AFq9FYLKxvdglfZkxYXbkxdSsDqHH94UTzosXKMzjylyJ2BeChBrBzRt
	ez98blIH7gmCD+ix/N5S7/hHzuwmgb/FRMsAPIl+cNIfFclb8ej0oeFltkW84YHbBerfsCJcKV2
	/MhovdHTkUoQzrJ0h5AxP/JM1r7CqwRQCQsWL7X6wbC82vjSbW0B8tA/t/7uO4E3/R/4L
X-Gm-Gg: AYBFou2OcWAXH31Xeo5jTDA91gz34c2Ne7m/EkNjXmLYDZKOB18eIIW/h1ETI/yE1Wq
	JTIiLNP2gODt2dOmEKBzXh13TfzGLSzcRml+zgFqtNDHcF5khjk0zbn9d3jXgL4OUT4hPrMLVx8
	hTmYTAslOpzdSNiauf6kPL5Tj4bHmOV4LG81Vjsgn8wxEUvXv24pp+hnzfj8+HJrS8fyxga96+d
	O7a6zQXhf6iondcL2TTH0oYsYkg9bP62O+saJRy306z4npLCA1c5OEXZFZ4EM3NqM5I1zFzakHE
	Q72EnS2+tl9D1RZYKoFSXeLTeldF860LkRb3PZcSdv1S+PrGzDgx5abOh776r5tR2jkG9ZcAj1u
	sQ8jxo9B81Cubg30m7R2a+EMZuvqle9uZnTSPeYs/jv901H89BNfNQfj8cU8DtorKkTsSx3vorW
	EHJCEQ28IGtZaH
X-Received: by 2002:a05:6102:83d9:b0:7cb:70ed:ff90 with SMTP id ada2fe7eead31-7d03a5bdfd6mr2411689137.26.1793285505271;
        Thu, 29 Oct 2026 07:51:45 -0700 (PDT)
X-Received: by 2002:a05:6102:83d9:b0:7cb:70ed:ff90 with SMTP id ada2fe7eead31-7d03a5bdfd6mr2411677137.26.1793285504808;
        Thu, 29 Oct 2026 07:51:44 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3c32sm36256864f8f.47.2026.10.29.07.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 07:51:44 -0700 (PDT)
Message-ID: <a3aba02c-03fc-4386-952b-d53fccd65465@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 16:51:42 +0200
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
Subject: Re: [PATCH 00/14] Add SOF/EOF sequence logic
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
 <05313835-c868-45b1-b246-f98cfb8a1d6a@oss.qualcomm.com>
 <22d2cfcd-045d-48dd-bbde-c1ac2d958737@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <22d2cfcd-045d-48dd-bbde-c1ac2d958737@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2KoKUf0cWtMka5nxNJMRiBI28xyBCqkw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1OCBTYWx0ZWRfX2fAhuuRorS8b
 T9QVBy0ZRoxUbj8IjuBPStCNlxQ39N2mTCB1lTOIftK8fNZ/ttbBdsfNFZc81sbxOTKrHMVbkIz
 0BeZObxx/X6vp9jswxmr6+MjUXvVHLOHJ39uRzXm3RKm9vCE2fhwDwzQ0FluXGGQ/Ckh5nrLp7v
 hs5zxdChS37BagEtNn0yTOAtYlRV22Hq5UO960YmwG0y+SIH+Oweb+DSBWgoAxT0J2EXuAOwVpL
 mdj6zxTBe+7ZGslVR+mWkdeaLc/ogqF91hhUzbeF1rHKhXUC7JRG70OCyyeblDOteBD4FTlzqD/
 Lip1Nfle2a+q57Vl4tRp9Oo2qQQg4JfOhpDxD6+xBrq/qstS+oJWoC34HArQdqE5XXVo/ZI/iyI
 ZJOPQSeLMdRb8rJRxRo2hSVWTJRa/b0b51fVnWjI3AygPHVkgOTHMgxJdILRzer+vr56l9UlRdh
 dHBG8KHWlwnf7J0rqhg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1OCBTYWx0ZWRfX0LggSjHSzQKE
 Umj9NImD5FXWdvpROSIiBaZY6U9FgBydiM5BI0tPjpdLUaKmTwTQpJUkKnJkjbq/XBM1zOx2enh
 a/XqOx6ZNRT5AWHqKLzg3ScImUcLi9E=
X-Authority-Analysis: v=2.4 cv=Kv3YSmWN c=1 sm=1 tr=0 ts=6ae35d82 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=o5BTqMlMTsaSvJmBCIYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 2KoKUf0cWtMka5nxNJMRiBI28xyBCqkw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290058



On 10/29/2026 4:44 PM, Bryan O'Donoghue wrote:
> On 29/10/2026 13:28, Gjorgji Rosikopulos (Consultant) wrote:
>> Hi Bryan,
>>
>> On 10/29/2026 11:55 AM,bryan.odonoghue@linaro.org wrote:
>>> This series enables SOF AND EOF event tracking making use of both events.
>>> Whilst the code is actually very simple the functionality we want to build
>>> off of that simple code is not.
>>>
>>> - SOF
>>>    Serves two functions. Firstly. Informing user-space of CSID SOF events.
>>>    Standard Linux V4L2_EVENT_FRAME_SYNC is trigger from this event.
>>>    User-space wants to capture this trigger because it allows user-space to
>>>    better align the time a frame begins to events elsewhere such as IMU
>>>    event timestamps.
>>>
>>>    That functionality is directly applicable in this series.
>>>
>>>    However we will also build on the SOF event in later patches to allow us
>>>    to begin programming of shadow-registers for the next camera frame.
>>>
>>>    When the EOF event happens, we switch from one shadow bank to the next.
>>>    This is only possible if you have the SOF event.
>>>
>>>    So SOF serves the immediate purpose of timestamp alignment in user-space
>>>    as well as the 'evil plan' to trigger off of it programming camera
>>>    parameters for the next frame.
>>>
>>> - EOF
>>>    EOF even on its own is useful because it allows us to increment
>>>    vb.sequence for each frame as per the spec not just when we have
>>>    buffer-data.
>>>
>> It is great to finally have V4L2_EVENT_FRAME_SYNC support in CAMSS. 🙂
>>
>> I would like to share my opinion on tagging vb.sequence at EOF.
>>
>> The EOF event is received from the CSID decoder when the EOF short packet
>> is decoded. In contrast, buffer completion is reported when the write
>> master has finished writing the corresponding buffer.
>>
>> Because the processing pipeline includes buffering and line buffers,
>> buf_done on the pixel path may be received after the EOF.
>> Conversely, when cropping is enabled on an output, buf_done may be
>> received before EOF.
>>
>> That is why using EOF to assign the buffer sequence may result in inconsistent
>> sequence numbers across buffers.
>>
>> I would propose:
>>
>> SOF
>> Increment the frame sequence and generate the V4L2_EVENT_FRAME_SYNC event
>> for userspace.
>>
>> REG_UPDATE
>> Once REG_UPDATE occurs, we have a guarantee that the configuration for the
>> new frame has been latched. At this point, we can iterate over all active
>> buffers being processed and assign them the current sequence number.
>> The bus-write active-status register indicates which address is currently being
>> processed by the bus-write engine and could also be used to detect frame skips,
>> if necessary.
>>
>> BUSWR_DONE
>> Complete the corresponding buffer as usual. Optionally, we can verify whether its
>> sequence has already been updated. If it has not, we can determine how the buffer
>> should be handled.
>>
>> This approach ties the buffer sequence to the point at which the frame configuration
>> is latched, rather than to the arrival of EOF, which may not be ordered consistently
>> with buffer completion.
> 
> Come to think of it, I'm not entirely sure an EOF or reg-update 
> additional variable is required.
> 
> SOF.seq should do.
> 
> - Reading SOF.seq @ crop is fine because the SOF.seq always preceds
> - Reading SOF.seq @ buf_done is fine ditto
> - Reading SOF.seq for params return stamping is correct
> - Reading SOF.seq for stats frame correlation is also correct
> 
> We want the EOF signal but we don't need a second seqno to accompany. 
> And with one source of seq truth we don't need to change the point at 
> which we latch since pre-frame-drop SOF < everythign else.

I agree. REG_UPDATE is only necessary if we decide to use the bus-write active-status
register to determine which buffer is currently being processed. This can give real guarantee
that we are not missing something on heavily loaded systems when irq-s were disabled for some time,
in that case sequence may not be in sync anyway...

~Gjorgji
