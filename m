Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6449D280A56
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739211; cv=none; b=q+FZADxwy1+fkwK9Ldon/RiL6KEAntPjj8igxvZhWjbLL4QWQjyPkPNboD7a1SWwvi9+ivVI7LFNS9OpArpoXCpqFcQ8KNXoOwds8tgQgaLRZM4FQ3y54qpapKhZEAH898bkbb+pBzPXK7XOGf3tYe+/YTIOgQ88XqeHl5PN3yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739211; c=relaxed/simple;
	bh=KIZQegHnKMBMCN5KurBHB75g+b3yGfCCWsKSLBYpYY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YxCFe803eL1tlw5/bTiP/GgEVvT7wF6v4cPFIDmktXn70SU/XDWzQv8kNd8wcEgdnH38YWgA57QNpLWhas4NFot0IBSt6HxoBwME1arNlPcueUW8LoqdBRP03RjSTVv995arRmyislWVs9BiBMArIZjGJ7FfxrKk5/+Rq/rnlM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oFoMEfi8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T/RjCRSh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oFoMEfi8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T/RjCRSh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q9Cp5M4170049
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MpszJFaxfFemeV0/SZwFeF4b5jqGx1fNaw5whlTiIlQ=; b=oFoMEfi8ydvPgb/Q
	ioRIl9UCE2Svdffnd0Tg0p/gufbbq0xgocIs0qK5aWaAyAIJUwscOKjw/i3F74bo
	CBz9bnjwHQKBKlXkxSKm3woKgReR/zTiza/vdfEx0b7ir6pR9Ttqx49Zho5GsOIY
	7TE/ArlrjxA3RbKx6WipaMnWzmRY2hICdkJT+SYnn2sSUh56Os+78JOLjCCiFslm
	C8zqWEJAGIZgztDcoERIqFbIKCZeNXqWgqnCWGJJB58KaEORqU153u0M/UUpc+Nk
	tKql6CPhu/5NWPRCTlcOSpxKG12c+34dELEm+Qb3IeP9MuAk0+Rp20sA6RUtn1UI
	yhzH/g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smx98nw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:13:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52de05de414so9267461cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 03:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787739208; x=1788344008; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MpszJFaxfFemeV0/SZwFeF4b5jqGx1fNaw5whlTiIlQ=;
        b=T/RjCRShlL/RFRxc5laapyD0HwAIw96rJTQcOGiRU0uPNrl7rhh8/pd9cNXY4GH6wL
         45pVplTxQ8vJjh8KiCrV/k06M4YhaXxEyofSBUFIYIPxJlfBBXDlZaxOKzals6cqTWMn
         1cZflyq36dm1YhHrTsbz+QWnW/LFo0WZD0x2qfFv+gjQiCT3sFHgXlZgM2EB976hMbDE
         864+HWcBvt5iM+op67wmODMOovm9hwWZyhhD+pEUsfA85CxycMefRq729NqL3HReskfV
         kiHpq79tRejCqK7LaWEvb9GqGTyNHkNRlMXdatdHAyb0pgB1fbg7qdyZXbhUnhWJTYT1
         R7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787739208; x=1788344008;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MpszJFaxfFemeV0/SZwFeF4b5jqGx1fNaw5whlTiIlQ=;
        b=dUS6zq8W0BAv4OqAbRdAeb57bgj4HgtgH1Ea1bs9Udl+USZCFrm5j3WftBsSrLoGZE
         6XINSmaAgGk58NkXSkNS6JwR1o39VyVtWMbp4JaCi09tb19ccrZUeHHsCDKzgvh9XgD3
         O1MXCxtX2Hdj9sSMpa58jWAz47r8zXqlHZCTvGh4k7RmkC+TI6hFGcrMjlPEf2XQiBo4
         vKBpBaAxtuvWExIgQQ1aqOnKe7NymRjnWTHTl0ILTTq7tGybEGFXYS2Oetm1yCRgS+Wd
         BLySOw8shdimiP62HFLEFkvU9FhZU0JCmfUJsnPL8OfM7Mh5mnMOckMIzUpat9Np+fiE
         BsKQ==
X-Forwarded-Encrypted: i=1; AHgh+RogTnVH2JwFN6+jI9jdgO0q4tx92GCx68sLUhYyk25/LEwCLDObJET/uU6GGHO4AkPwrT5nzIAOzA9EogN+@vger.kernel.org
X-Gm-Message-State: AFuF++kmI+v73E+K08QxUm3p/f0YV7jNRh9Zoqgp4BQf2gcMDveQeL4+
	U1H3YL+acO00UdWXfdl/RJ7Z0GuwaLmyua5ZUASPSgy+Rtn/TNGOmQvU5U6icCKuNL3+eXpunsO
	xdDdddUW/8M4GhGlkuw/w2CsipdouZN/xFAQiYuU8viohfmyr4/NYXpaDAXdJYqTsE0Jr
X-Gm-Gg: AR+sD13XGqaHIlcryxZ70l35k/s2c1UVZLokS8v/MZ9f4atxiac619fobNWHObroJjb
	v7lnPIKs5ga1VdzvyAswHINhUf5432v7yIoThRPKIh9OJ/UIt29WGj3N8MVhAiZ7LS0Q/ckrm3L
	tbmcB4oD//zoKIBoT1KNYc+9bQhrbur0j9Cjr7dwIeSMzDVp3jdzq4jtK1vL7eGr9ElI8WCn7zk
	EO6StycjXMUm9SQM67CqnIFfXzGCyPP0HAoYdNMLxOj0/ZLykXg5QYv7pJkUPVzmaBe/TlvRFUW
	OZgGqiRRRpJvzzkqEkuY+1JZmM8nNcrSMCkbCrWaO48BdLQYZhHsSXgDqiZ8Kcq9brIdbeq8m7j
	PNCOMFI6/dzDcwFoSGVHCZkNeLpg=
X-Received: by 2002:a05:622a:8c8:b0:51c:1c73:5945 with SMTP id d75a77b69052e-52e42320622mr58937711cf.24.1787739208583;
        Wed, 26 Aug 2026 03:13:28 -0700 (PDT)
X-Received: by 2002:a05:622a:8c8:b0:51c:1c73:5945 with SMTP id d75a77b69052e-52e42320622mr58934941cf.24.1787739205944;
        Wed, 26 Aug 2026 03:13:25 -0700 (PDT)
Received: from [192.168.68.107] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-482e28dc13fsm2201496f8f.24.2026.08.26.03.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 03:13:25 -0700 (PDT)
Message-ID: <d03353cd-90c2-4042-b7e5-2cab5bfd484a@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 11:13:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] ASoC: qcom: Add Shikra QAIF support
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-9-harendra.gautam@oss.qualcomm.com>
 <9c1dddb8-5f1b-4b7c-b810-64cbd6f7ccac@oss.qualcomm.com>
 <CAC-tS8Bwgqd8_dZcG50bbFCcVPX+=KMVzx=3Q_zh9dAzQiqSbw@mail.gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <CAC-tS8Bwgqd8_dZcG50bbFCcVPX+=KMVzx=3Q_zh9dAzQiqSbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8ebc49 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=DqJvd4i33UI3nbR7U2UA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: lipky9ZR7yF-j23DCZKbI3m44VqQkm4q
X-Proofpoint-ORIG-GUID: lipky9ZR7yF-j23DCZKbI3m44VqQkm4q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NCBTYWx0ZWRfX4a9DZUE3PdO2
 I23Q7G4cK03JB6diMOY3Jpb0Xb1JMCuoYxC9KoxiBDzywYDRqG1c65IuZRuWs9E6uTOwKOzWAsI
 1FeFjHj/+mzq917MSdge4eopNceQGZ9WDFHO1A2kJ05GXFUJ28id7YmTUlW3Yq7GJ9EgPkvDNkL
 wjE2/vU+uIwQLjzGA3qtYwze/8EL5ePsBQXO1RqMIcEWdX0RnLPiRSbhdXuH1AKe9o4AayVqVeQ
 wZiFqhakKlHegIpt6YmsXVChTyNTyo46KjAh7O+ITS/+3pHnQpmtrd7Zvwdx7x6s/wCI9HHifVM
 dS80VMaw62s/zhSU9ILmnvoE+0ILv5RZq8QcNpUlgquSBOlIVPU0dFzAJjKKRovdhjEsn+EP0Xw
 zmkbUs+hVnqekALBugYk8w3SewDl8SggVR3fqk4s8/DUADUd2Gb1NzeZGwrFq3+8ponO3y8oG68
 +FMZBKds9woggZucN4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NCBTYWx0ZWRfXwxfIVdMrEN7Q
 dYFvrVelOYs36AZ8sCP8GzTWhoDMdLbZQAgoZzxxp2YrLYJfhjKSKsOTXoNOblIDGsIjFLG0bl9
 F0QerVNxgRCISpxKSVfRRRFqR5mdHjs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260084

On 8/26/26 9:58 AM, Harendra Gautam wrote:
>>> +             .id = QAIF_CDC_DMA_RX0,
>>> +             .name = "CDC DMA RX0",
>>> +             .playback = {
>>> +                     .stream_name = "WCD Playback0",
>>> +                     .formats = SNDRV_PCM_FMTBIT_S16,
>>> +                     .rates = SNDRV_PCM_RATE_48000,
>>> +                     .rate_min       = 48000,
>>> +                     .rate_max       = 48000,
>>> +                     .channels_min   = 1,
>>> +                     .channels_max   = 2,
>>> +             },
>>> +             .ops    = &asoc_qcom_qaif_cif_dai_ops,
>>> +     }, {
>>> +             .id = QAIF_CDC_DMA_RX1,
>>> +             .name = "CDC DMA RX1",
>>> +             .playback = {
>>> +                     .stream_name = "WCD Playback1",
>> No dai for WCD capture (or) it's missing in this patch.
>>
>>
>> Best Regards,
>> Rafi.
>>
> On Shikra, capture is always through the VA Macro, irrespective of
> whether the source is WCD AMIC or MSM DMIC and the stream_name is only
> a descriptive identifier.

WCD naming is totally incorrect w.r.t this driver, WCD is external
codec, which can be connected to any dai. QAIF just exposes FE dais It
should not have any codec level information either as names or any other.
Pl remove and use the correct naming which reflect the dai name w.r.t to
QAIF.

--srini

> -Harendra

