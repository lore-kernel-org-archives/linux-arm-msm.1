Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9990535FC8
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 15:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178143; cv=none; b=HzFFIEwOGZqHKAH7ocgEuRGGNixU98hvVhIyhgdPPZmkEmuPceWlUIeKykiUtaEAvwqMpcSeNYDggKpiZe8VpuPuWr0yr0lAQPkwnKMaHDijW/gugRH3IqIMzbWjhilMXY7bJBsVOYAwOJa2zJ/QuEy0rXoeUGQnupTMJ2WDsxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178143; c=relaxed/simple;
	bh=m4SroQDjW8TNwKldqJ7a93glAT68I1794bo+GHS0J6c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=uyuJpdRHzk/aiitWW/gtd0/xtW/QytuqXF90wP4DAW9wqc509pZAUMUucwoLuMMuJ4Kc7zFVZDPWFQf+SL4YLxsrLZKdgLbIUQan3kRGLNOBzeJDcyeHz4b8REVe4HMa6Cfwko30YB3zOncYlSUm3y8XdYCkfBSKWlsq1O6MnnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jHOVjEwh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BH+rBqqo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHOVjEwh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BH+rBqqo"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDKdrq322110
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 15:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lAmI+4l4jOMpvFGgOUL3UKDgOJQ+P1Ua774K7isTWf8=; b=jHOVjEwh4O5Fd5TV
	s1O4AgA/k83pSLHZXHr4MCtkqPzjalzaR8gQnJeLLql8C+fZtkxV5fSBROrqZowY
	cn+WqQCfLkPs+qAkMBFHpsXVb4suhO0wkNo5plb4HeT3ekACo8kX5EkTKwTcRaD7
	i27vMDQbe9PEwDgFw2ya9MQLbOzGboRY7T53860rPRLuEMLzPHzLguhtRTO7zp5N
	/fQIW77qNgZ1zdmnlCoqOfSckoEUM7WVxtkKUyTejkRA9dHpV9udyaVR7bBs3Vb1
	XVCpdlCsR41bs8ksQZKG1mmZtcgwtI+Ev7GECaO1PCmZB47sPGE1z0db2gDkcZcc
	5H1h8A==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjsgngc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 15:42:21 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97e8d95121cso296791241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 08:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790178140; x=1790782940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lAmI+4l4jOMpvFGgOUL3UKDgOJQ+P1Ua774K7isTWf8=;
        b=BH+rBqqoML/hnsef3oSG5JZLJyygdQlw0xPHEOByHQBKJYc8lsP8hEm1KVVY/mBSHX
         7r8UnZK6EtmGAnI/6a+1Q+gYPpe9eAcjv3PKDzjdQkWRGOskmHysOlYtJ2Xj3W4tFZ9q
         buwhLfNhq45E8Kqbsa1LUq64U9hNut5K1vmv02HGKFQ1Suol4YarMI9Z30X85SPKH13M
         PeD+LsVFhtwffPgfjBWDxEm+Ya0n0xyDVhY8lHDm+ZQu3gNaMNsGFCcSJOJ6BiN3EX7j
         bQE8RNiJh8lXqjx1i26dAQ2CGWGN88wYCHI48ajAxa6PuPCf9wg9k+dXk6pDTeB93KZq
         SHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178140; x=1790782940;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lAmI+4l4jOMpvFGgOUL3UKDgOJQ+P1Ua774K7isTWf8=;
        b=FkgABp32HrQ7c+XrSXS6P8zHuCghS54NfMoKQuWFSIBYhVN4LDgoIcTvJ+JAuwgMdz
         804hAbN7MCO/eeGg7zihiDmCyEADkiNKXrdKXBX/IQwmGXrLoAdJ/cM2LSaJKJ0zTZTS
         loF6hs/FdWMnYaHgavFCv2G6IezkDI/WuihIC8EXKIE9mCJ41xSNH3uciHdaaQMSELeG
         fCd69Odq0v0zAKkI2GyiWWmS3R9yju0b2uxRG+lykAM1j5l0/Hn/NRo/JIPA/IfdoCt6
         Ru+iFXb2Q/6xJR1tfMwn9Ch+wcTENo18MEAQ1Z28X/xAWGrSHW2KRM03mNhY9kjpOJh4
         wZhA==
X-Forwarded-Encrypted: i=1; AKwUvBzEPp3hJI40CAGf3hJ5kxsqxkWadP9I/3TuNB/QqW5JlSprcbNqXGkjqpvdB+cZu0Tz0d8FOCLkbLJK0OxC@vger.kernel.org
X-Gm-Message-State: AFuF++lfXfqSVe5R/gyoTJbNqIyUSihCjPFJBxPwqe739E+fbr3QRb0N
	IBwEXOMTPajdRkelLdpRYvopCqj34FFhJwfPFZO7tLuhmO0X5rTfK8nkz7/f81KXj3M4UjlWwDq
	yaaP4yo8Qof7JK21Oj4Dr33agLL4PUPHZIc7vsaYgVX7UkcBj63btUu8zY92i+bPkD/sj
X-Gm-Gg: AYBFou2rLgos6kwhwPb5twC1zFkkDMvnM3frWOQIjTTwfL5IfCiyksMDqvYffT4Pf25
	sF5pGW7B2hz1feVUuaCS3aABM73QqmKCOsglCy/Bk+0xd5DILknAQL24fXRspnu94BQfF0v/SLt
	H5Dsf0DVHoivXFNFflH136oiAv0ger/iZ7wLgLwLN0gAH6wgfVfhuMYHba2sjCqsZNSqOfxlT7w
	sK173w03Oqo2SJu6dK15u60h/PX41RFCRA2aoytGhIHEfG+KC2RhMlGuL3iOxfsLo6upA5orDRE
	faRl4jX/NG7tNcJhc3Biys5zovuCmaj9A+rkojydwsXq8s8J5oo2/eL5Nspv2xiKX/kyNYnfGgf
	CBJLRixmCmJ9Ya4nr5bD+kjAcQPrShdG8rIwl4RvIwL+j2FC8WUUdZkk+Q4lceSSi39gR+F9npb
	BSKf2xmKYvvH/OOpdokT36mMKR4DSu02b69Gtkunv2Fnq4qAbsbOljrZP+NHdL1lKweg==
X-Received: by 2002:a05:6102:951:b0:7a5:213f:9a1f with SMTP id ada2fe7eead31-7ac1db33a7amr2601066137.18.1790178137737;
        Wed, 23 Sep 2026 08:42:17 -0700 (PDT)
X-Received: by 2002:a05:6102:951:b0:7a5:213f:9a1f with SMTP id ada2fe7eead31-7ac1db33a7amr2601039137.18.1790178137281;
        Wed, 23 Sep 2026 08:42:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c6022sm144907666b.14.2026.09.23.08.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 08:42:16 -0700 (PDT)
Message-ID: <839b884b-9db0-4215-9715-40549d1c6a26@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 17:42:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <arFKVhlgJge5EZyj@monoceros>
 <20260923-sceptical-mauve-firefly-f5456d@sudeepholla>
 <6b5a8300-ebf9-4717-bd39-952e89fc5e78@oss.qualcomm.com>
 <20260923-snake-of-magic-satiation-c3b857@sudeepholla>
 <a5e56180-b96f-4fac-980e-e837e84cd5a5@oss.qualcomm.com>
 <20260923-calculating-positive-inchworm-28d3cc@sudeepholla>
 <arPMAXs4jjUeu1DE@monoceros>
 <20260923-groovy-airborne-rook-e1efc6@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260923-groovy-airborne-rook-e1efc6@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MiBTYWx0ZWRfXxWIter5WXsHF
 +HewbP8t4XV4Fubl5/xMHo9E1oDikaBS+6rucBFGiPSu7WBxJGSscdbG1yHwdXtxfQ8grmoR5Ph
 Y4KQMqkB7GTeLsJIYd1cAUmjV+qKyGqNyuwOlhs7yBHWBaqWppUOjT6deS6WIKyelOWXfOpW8uX
 L2ToIHZPkXPZVUKf/hn5uFHZtrMHZcUMnHahZgYcJrW/3hVdUdD74vIhIvB2Xml5dtuAOcB0Iom
 wMEIt550zZPktUwIY/mUA4JbyeeINN5KuApRcAj5AtOCSADcqHK2v7hnLU3sh4WqqWo0sz6P0Hh
 ZBi3XmiaB3TyIMhn4IeIDi8vA0OrCBtFfuK6vksy0OuOuHqRvAyqfLbUBg8jvNMr7p4dXYN0bYW
 cW1dtsNVfIcfxHegrXH40MwbaktAJyCWrpFRdyEk4uHPUecdvtEAzBJuumXFCmvrHn+fqfSTa0M
 k75QMl34239BBlrMSGQ==
X-Proofpoint-GUID: fMyW5gmCxlPl4KD8eG_GQhTAYvrVRDdu
X-Proofpoint-ORIG-GUID: fMyW5gmCxlPl4KD8eG_GQhTAYvrVRDdu
X-Authority-Analysis: v=2.4 cv=K4+3jCWI c=1 sm=1 tr=0 ts=6ab3f35d cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=IpJZQVW2AAAA:8
 a=wmcOPm1-qqoyX47EQMsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MiBTYWx0ZWRfXz4mWKMI7a7eM
 XNYeU/E7/DtJRzwJugJE6puN3Nji9i+Dra9zoRE1zkjlcN9uzWmPifbfiTlRRAN3fsTfP1J/cWQ
 TCMGsJTdS6AIOOLr7gdcIk7Q29LfbJE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230062

Hi,

On 23-Sep-26 16:25, Sudeep Holla wrote:
> On Wed, Sep 23, 2026 at 02:55:26PM +0200, Uwe Kleine-König wrote:
>> On Wed, Sep 23, 2026 at 01:01:44PM +0100, Sudeep Holla wrote:
>>> If Uwe is fine, yes I can take v7 as is.
>>
>> Fine for me.
>>
>> Acked-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
>>
> 
> Thanks Uwe!
> 
>> The nice thing is that the device_id structs are not API, so this can
>> also be addressed later if someone comes up with a clever idea how to
>> implement it.
>>
> 
> Agreed.
> 
> Hans,
> 
> There were other changes in bus.c that conflicted with this. I have
> resolved the conflicts and pushed to my for-next/scmi/updates[1]
> 
> If anything is wrong or if you prefer, you can post a rebased version
> that I can pick up.

I've given your for-next/scmi/updates branch a test run and
the scmi-cpufreq module autuloads correctly, so everything is looking
good from my pov.

Regards,

Hans

