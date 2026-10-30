Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793355236;
	b=xtaHAL9QTULbS6FFHdXbIAM5uILazUWGVbCdXUebZ0MaNIjIG+UsaXey6gRY8jSDiW+3
	 g1JXujR1uotDnZ+1s2UFx+J1ZIq0dL6ZjladrJaguxhJd+M+x9wKHoGUJKH2+rW/cL7GW
	 vNFQ61azT5aF8fBV0fl0csT6AUzpbDTfjZ+froLQnA8QEZ+MckQtaugJlPUGk2iNHw7BM
	 Rqj344m21JtlLbMk4jFu+F2GW9t60Ke755qAXMyciXVRP3D+LGy7Hy9Obr7hH/vX2biKP
	 9hiEc7JSKDMnyGZBdZRsteB6IIk5dih4m6GwjpJVZyT0sGnp2qu+LHLoldyaaf5B7PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793355236;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=H4AIkE0Wr9s3aoPUk4VSm4DxB3QbMtK2ceaPQ+A1kSs=;
	b=5ScG3hwXKJyPcZUiVBeqehNH35fQ0jlZRD5lgZi02astmJqHB4a8a7YCUDdWwYYPb/v+
	 6AIWn4B5E31HTe0ovXrOjych4zLrQ1fTWrO9Z7viWRHLwvKc4xp/SrSyrYsD2Vdg8bpLU
	 X/8hgmn7M/x07PxMUd/gyjVVG1gCT7C6GQp+sBgizpjEfs9NkRVGwAodouqGHUgSixsdg
	 ft8EmxSa7XU9azdiAWr82FHD7E5snZhYLFEsZW6iq+pQVd631Ws0e9sAZU4O91CE/etEG
	 B/BA9mpQ1WBjplohVZy5qhpadQBwLLd8Z5tYYHPW4Mq5BsZoG2XlK3u8QC+r9vpz9bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oV87dUe4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="WHlR/xfr";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BA3606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 10:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7BA3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oV87dUe4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WHlR/xfr
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F3qV3308822
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 10:13:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H4AIkE0Wr9s3aoPUk4VSm4DxB3QbMtK2ceaPQ+A1kSs=; b=oV87dUe4Oe0XHb7L
	osgVa8/dferZ9voPtS38V9XNxnxL0qAoJGwFo3/zDdGUBLLuT3m9FbXp23EJAwFI
	ZcWbzT21rtzgsPO5s+XtZ/vcLvpZBBWx0eTPPBQdr7zO7yS09P2ytEJrZdI2yIur
	Zw/YBsZ6SUS6UFvt5TK13WEkaGl0biKY2L3+fpfKaHdzw65D8ZiSFWRA6XAQ8wq3
	fLQENAbbqpUOPb0ubzY0Iqij+hD2ARoFVozSBE7jGjLVXpyO9/m8orK0Jlsi74k+
	D1SZW6OlUIq04svapFxcu+Yp+qUu2GHrqBfKaHtKp6hlk+5shcTi8Ku19HM6+29X
	lPL4vg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qtded-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 10:13:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53568f05f8bso770461cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 03:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793355234; x=1793960034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H4AIkE0Wr9s3aoPUk4VSm4DxB3QbMtK2ceaPQ+A1kSs=;
        b=WHlR/xfraB60Cz+TaR7w8V0tmctPRtUYWZie6l7yAnQACyBpddH4/HvT20uxbKfaWn
         o7cLBTZFGunlDtXR+MTMAKaHL40DEAHnLGiB/9ZvQ+9IvvAnU5OVyM4ht8e3Qn4/8IDC
         xCaWlcy4m5200OIXoaXMJ+Qoykeukmc15lVBo8/eFSeTWQhoAVzANbNp7UpoLKJXGc/x
         RZM+7Kb61qqq3/0XfLlyfHZP+4onyZMBAE+0EfXrvh8ilO9zH0biPHCV+X7iQFUKk8ff
         /1KX6xIZZSd8h6maydxe8lbs2CvPF7/iT584egpsKmlt4Yezq3TJhNBwCrLlLO20ZKc3
         j0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793355234; x=1793960034;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H4AIkE0Wr9s3aoPUk4VSm4DxB3QbMtK2ceaPQ+A1kSs=;
        b=SGFXsT7VPDmgxg5TbqSrUztTgaA0/xJRUcvnmEsEBozrwYyQ9hAxJFvXr9Vnr7O/T6
         5fL5wyTjZVMPUAobBg6FEstNUq3m0ZDt6N91YuIUe3nvZ6aKAMMpm2HSGm72utoLUBgq
         ZyktgvwhkQwfXXch/gadql/cEKEXyEe+0mQBCMAr7BDOYmzBA1YuPAarHix115YsS4Qj
         2a11TGy1JIGzHL/RC0Bso6edNX4PohQewq8TOs01Gye8Fy41p3RPszSzZkbr4cXXkWHu
         LW1hlsIFYcj+JEOyaBCaa4a+CsmHNcEaPwMZPCoKo5HCWexlMRkiBGjowi9GZNSv5UXl
         H4QQ==
X-Gm-Message-State: AFq9FYLL5dYweV4TvDIwrGZSQ8Rt0E9LUJqWQEG3i5DNEIBlIQC27pNb
	XMEvy9pmhi5eWqf+YD4KzaM0xzKfdMoW/vA0okXxHt5tJ92G+E5DIcIvHgARpUlXfZd4pLY9VQD
	V6/hT1JPGHogHJLytvOEzUYVtVFILF9uQgWMUk9kuN2yPgfuqfArorSVQ46c7qSQXMYCV
X-Gm-Gg: AYBFou0Q+5mDO2xcrDakptV6m/4UR8CmFbQkCo+VPvWLRP4+1dxa/mzA7+Ejprw8Ec9
	yI2yxpDKp4dG+MRk+8oVsYNIvHHwNnYu2dywCML44MmJq0szlaK2iGgKELog3DmcfuinbD3L5v6
	RkKaMWWpn1RS4waEi4iCPltMTyDlsJwAHIhoPcFaM9Nlphmv872SEMpelAOURlAIOiKN3rmHmSG
	8icbmwtbFftIewjRuI6zvq28RTaVo6zkCGSplRXB1i3vvBC+cRnrRtbMfc6GVKYqtjMJKMvDOIE
	3jTyPyOK6wNcaEF9kg95RiP2RUy8BUdNupZD1G8htdJEXELvv808tFFq2tI+Ttdq0Orob1tzUtL
	EFlPpHFfv2KSHwVcBpSBHtneUJjI7vHFLi0Z7aIW/Nu0cv4XBR8gJFuxAYVrcU0agCqOFjZ4=
X-Received: by 2002:a05:622a:e0c7:20b0:51c:2324:666 with SMTP id d75a77b69052e-542b687da82mr28448071cf.3.1793355228898;
        Fri, 30 Oct 2026 03:13:48 -0700 (PDT)
X-Received: by 2002:a05:622a:e0c7:20b0:51c:2324:666 with SMTP id d75a77b69052e-542b687da82mr28447921cf.3.1793355228391;
        Fri, 30 Oct 2026 03:13:48 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdc3csm47999066b.17.2026.10.30.03.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 03:13:47 -0700 (PDT)
Message-ID: <bb3f47e3-090d-4f17-a00d-acc38e45deb6@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:13:45 +0100
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
Subject: Re: [PATCH 0/3] Commonize Glymur regulator settings for fixed rails
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
References: <20261028-topic-sip_cob-v1-0-80ab6704aca3@oss.qualcomm.com>
 <af31338e-cd15-405e-9b68-e63f1f61dcd3@oss.qualcomm.com>
 <179334395403.1631110.13095672015433830957.b4-reply@b4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179334395403.1631110.13095672015433830957.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _Tf8Kh6hBjd7OpJE8pBI5EVht-jHvxop
X-Proofpoint-ORIG-GUID: _Tf8Kh6hBjd7OpJE8pBI5EVht-jHvxop
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MCBTYWx0ZWRfX2H4u+FPWphlv
 Nz4btyRLEsNodLIFRJYun+0xbjHSJQUD0Z+V/A9AunrD1FlTgD6CIDZA9xSTIo9szSIf5CKvnVv
 QlawW+XF9+z4GAI+y1Kwh1rIM+y5AfSmMdGiQU+fgFmZK9d8YZONlbJPmWzCyKz0uCtg5GgkXzZ
 bDZ2LbfCrLC0MAcGzkACX8ROFRmRxZGRSDoP8RtTrWXxRWf1wtTrBv623+DpgCrf+S8g1/6ssvp
 cnAlrwJYJuuHp1IU6woar704QKjzn5NgiK3bxANKrRo43xLspuv1YoCIYjiq5I0pVOE1BNZ4jig
 8WP7grbX4/tlobhjCnDOhV+jwHSy3iq7C/vd8J6OiJt84D/WrCO+rTzBB6sZttRArpVimf1KfHD
 PvDsXlUpQkJL0yDghbFyyeytj3Bnai7YxTM4iQAkaYDLVlt0VKdv7eUbXpVt6IWoWA36UyVWxv3
 aikNIlhrr+fp0s+1jow==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae46de2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=9IjwYbyievQIR2Z6wpwA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MCBTYWx0ZWRfXyPtExs+xGYoH
 p5d8GMoj+A/sANyfefuuM9TI2XoNhdg/pXTui9dS6ZGVBt71Q/1txMQDvWBSj9q3Ads5tj9ZzOm
 p57DE4f3wTfHh8n32QAtpXRzdl9J5g4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300040

On 10/30/26 8:05 AM, Sivansh Gupta wrote:
> On 2026-10-29 16:13 +0530, Pankaj Patil wrote:
>> On 10/29/2026 1:34 AM, Konrad Dybcio wrote:
>>> Certain rails are predefined and will ALWAYS have to be the same for a
>>> given PMIC configuration (due to electrical and other requirements).
>>> Factor these out to remove a layer of pain when creating DTs and let
>>> one have a better way to reason about the settings across the platform.
>>>
>>> Glymur-SiP will be the next target after/if this is accepted
>>>
>>> Compile-tested only
>>>
>>
>> It fails on latest next tag - next-20261028
>> PCIe doesn't comeup on Glymur CRD(glymur-crd.dts), seeing multiple
>> deferred probe pending: platform: wait for supplier for a lot of rsc
>> regulators and other clock controllers.
> 
> Facing similar issues on Glymur QCB (glymur-qcb.dts).

I was now able to test it on a COB machine myself and it turned out
that it the firmware was unhappy about setting the documented 1.216 V
on L4H0, looping it back to 1.2 flat made it work again

Konrad
