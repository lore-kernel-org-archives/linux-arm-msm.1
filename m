Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C649341F5ED
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785233707; cv=none; b=QagdwUvvHokxkSRJMxaqPcc2QuByIMS5uWLkRxPmepVvBoCsfo0Ffvkp+we8e2A/eNRTiWUKWl5aMWB9Rumss3NTGfyij/xxj1b8setWD/yhgBSX0TqaJhrC8x2153eMxOPSYvq6zpWneAbVmY4fESSBphH1mzz/M5KwwQqlf+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785233707; c=relaxed/simple;
	bh=MMmeuxILIP+TAdSL+HmgIqFdpj+gmOWW38hJ1+E4IBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eR7s8L83fjdoDzFWXq7rVaWOpP97JTM2F6zbsVg5LlgwYloQuRcKmDxthGldJiyT9EbfdjO/GKGxIteG13kim0J9IghAr/orZHszDYqSxlWTqwKLohjjb4Z13nCW1O65qbqn4slvg7pYuRoa7OM/M40TMgp6QJ001xWNk3AhxsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C8y5Nkfp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mi73dijC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C8y5Nkfp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mi73dijC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82C1H2480090
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j0hLbfdy5mgjgFCzYatzKmlRtop8Ya/eJckf6yBTaIw=; b=C8y5Nkfp254qpf60
	4x3RqPMyxvx0inCaro3dT2qVZJEQqZcDbOG1/aLK75ptIBG0D6kuEIGRPFTMxbw+
	qs70Cp85rEZ2eFmgJM66XuyOkneca7pGinjbsDBfZEFNm3/58ew7OkFb1Z1v4tdf
	qIhJjmlZYc/MptbPLpXmV8Qd/igoSDokXrDS/s0bXdGTtis0wlEx/DZ8BEoABhrB
	fC38g9VRNWAHw9iPxKo75+ogsRriQooTS0qPzedYYvxOsn02JznoPxRPktb3T1gh
	N3DR7MUekdHAJY5FjWd4asX8ARiIJq0EgWbgODB+iqkxpUpuGujAy1Uw4UtB4Yv2
	iyUMAg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpmy11e85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:15:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb467e56aaso3880593a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 03:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785233704; x=1785838504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j0hLbfdy5mgjgFCzYatzKmlRtop8Ya/eJckf6yBTaIw=;
        b=Mi73dijCbs81F7ueGvNNBe89ncPEidxPAHcoRYRrzg5bDW6OwzS8w3jK4Hg9ZFMfP5
         ggrA4i16eP6cwE++mnCwmne10CtBhq2OMorL6SSddpEyzbMfob2epUeXzJ/TYWZSjK9Z
         87kxDPDkCEjD1Mtjd1tTnMCf2pgCndJsOUjaqjQW4pmrEUY3XuAesU2Je1aZ2vi3k/uW
         sc6RB4KsRA3SEoEwKLQZjuzlVAG69cXEeWGV1N+yhWeqjwJgZDDMz9VPt7IVPb0ck8YI
         w5OlfLBduPZn3/kkjBeB/cc7T9IeWwt7c9d9CSOkt7SI51HwCNod7pFPiNg0Gy+k8dlv
         /u4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785233704; x=1785838504;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j0hLbfdy5mgjgFCzYatzKmlRtop8Ya/eJckf6yBTaIw=;
        b=j1uVK/LKZqCN4A0QM1QgJMBxjc3Fg7D2dsJQEaKVJxhRK7C1CydBeMG0YHK+uEKyxI
         CMmcglaEoMytD4pv37xS0O3bQ9OvBwvXQo/Jn9NqQ6OCG6+wTCcXq3+x+hptIcioxc31
         3/MsE0v1X07bSrInxb3lfXI0zHcGGzFn++qwEKfIxzgh/svhvnWgx9h2ge5KB8O+rSEx
         +Jibkxqaeq2k4dJi63pb4IOPnWGwlHkhS62yXvVrC/lCF05/zqJbYBo8jFD0xL0xT1DC
         4DwngRtowH2QVO+UnKf5ph3go/UwZWnVHcbBI/0PbPUZi5c9FyHagiiZoYdP2gfpDBon
         30aQ==
X-Forwarded-Encrypted: i=1; AHgh+RreYWVki0LXjXddZJdXlexs2sak2MIUQPeLepi1QD59vT7ko9NhO+LjUGvMbEceAsjQpkOFEFjdHoqE2uIG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5LFeZIWNFTAy2Lvjt/gKm49LyD1bqWqDv4y33rvzOG4FNo3CH
	HxO3xEGa05MtAuFHy1jrrzDczfrJObwlYF0WE79MmspUSu9KPbVn8+qj7UlsrrK4LoN5ROMDtWN
	2Uyf4hT36d1N23pvF00UBl+gHdZs8Sjho1JtQig7iBIk4+lNQBmbgmFXzBzsIlE0qv57R
X-Gm-Gg: AR+sD13VokUi+NOf2znFMxakJrMBGaeEPXu2is83THZiXxk8LTvUVsU5OjMbEieS8jM
	D5HBq5hwj0swhQUxQ53/RIK+sYks0dau694DdiHAiFEwCTt2H+DmIxiWU2k0sAekl1lZc2JpHAz
	ZdTuHJZ8U+URiTDaRsljKxtXBV4iNuosXc+gRRTn4jah+W0hRNAUxG+fxRBumNYZq967Y/k6zUs
	ACpjbcwNqamQUp271cbAMlS5IfxjxNOrVvXXU/EiIBhOR7o+GcylIxFzUM6QDg9001u0Ye1aoSE
	zevQwGnStnoME42zTVyAtK93sVwGw31ONJ97Y45+QiNy0RYJI+cVSJgLKqvCsBHD7gHVgvl0YaY
	qHCHeY7RbF5Y+hG60G7UOXEUkOJKFJF9cFw==
X-Received: by 2002:a05:6a00:10d0:b0:845:e41f:9696 with SMTP id d2e1a72fcca58-84e9325b4famr1835429b3a.25.1785233704078;
        Tue, 28 Jul 2026 03:15:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:10d0:b0:845:e41f:9696 with SMTP id d2e1a72fcca58-84e9325b4famr1835405b3a.25.1785233703606;
        Tue, 28 Jul 2026 03:15:03 -0700 (PDT)
Received: from [10.217.219.72] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e532590bdsm4210071b3a.3.2026.07.28.03.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 03:15:02 -0700 (PDT)
Message-ID: <fc90084e-c9bf-43da-bb8b-43a8d2d0cb7f@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 15:44:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] i2c: core: Add i2c_update_timeout() helper for
 dynamic transfer timeouts
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
        Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
References: <20260720-master-v6-0-671261b05c61@oss.qualcomm.com>
 <20260720-master-v6-1-671261b05c61@oss.qualcomm.com>
 <amZkf3lu7gjWhw04@zenone.zhora.eu>
 <0c0d1406-949b-49ee-b203-3833b9f8433b@oss.qualcomm.com>
 <ame2tX1RwOo4F6Lk@zenone.zhora.eu>
 <cb1e00ea-658a-416b-aef6-46c151d15685@oss.qualcomm.com>
 <amh5l4Yvwemws6Cx@shikoro>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <amh5l4Yvwemws6Cx@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: glFifiS-acYtOqX32AxzjnTnM-0QKf3q
X-Proofpoint-ORIG-GUID: glFifiS-acYtOqX32AxzjnTnM-0QKf3q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4OSBTYWx0ZWRfX/ImsQo4QVIvW
 Lbdw7ip2BfroP59bTjn+DIDG31pTivp32FtKtcCINuHJOY9G39Fh3JVci039E3EJBxSKie67/nQ
 X183ZMxVM7SEkDyJ0aHWb/c78xsx6eRGqx+Vtc4mSLheaWkHZ4/rlRj9Ftvs+c926lNer+olsaB
 X5XsTbzAmnyC/z4OoQpqmfsvubUjDgUaMCpU6zbFtbouUZpYSq2j9zOmh7n7W7dNrq0fn7neM59
 v2M5eWEdFHjty5u0Y3zER59TM/9onn8uwBNwgSa32jmASAO7bFeXD6hsJF0S+PJswZRyreQV3So
 h+mdD943irP5lfmWFkzaEPCGWYZ4OXcSdKHO2cK45sBXlcJZaHTDcEfTyUmye5ubL9iwtMoYhD6
 J0xe6+t3vTadN1XkCBQCwE/zK7IkXURvI3vPAeL5dE+6ayUBTuM55sNx3PZVSaApVPqH2mGe++Q
 BSnUz+XSdQO+z+Mf2qw==
X-Authority-Analysis: v=2.4 cv=PJo/P/qC c=1 sm=1 tr=0 ts=6a688129 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=QebkMiaCAiKBxjCz028A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4OSBTYWx0ZWRfX75QLGJ9jq2s0
 tKfHIh3/jeDUWmfEtxo2D+JFQnKCP6CucRN0p4xfGpOVtyGhEeUsPtpKbrRHGG62fKIkBveqgVh
 JdPuFz+Ue1eoqtfSOIY8jxUTBdUxW24=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280089

Thanks a lot Wolfram !

On 7/28/2026 3:12 PM, Wolfram Sang wrote:
> Hi,
> 
>> My thinking was that we are trying to derive a timeout for transfer
>> completion, so the transfer length and bus frequency should already give
>> us the theoretical on-the-wire transfer time.
> 
> With my experience in all these years with I2C, this is exactly true. It
> is a _theoretical_ value, and the practical value is at least board(!)
> dependant. It may also depend on the environment in other cases. So, the
> theoretical value may supply a minimum but IMO this doesn't help.
> Because we want a precise value, but we don't know it.
> 
I agree that the precise timeout is platform dependent and cannot be 
derived exactly from the transfer parameters alone. My intention is not 
to determine the perfect value, but rather to provide a reasonable 
kernel-side default for cases where no timeout has been configured 
explicitly.

Since kernel-space clients have no generic mechanism to tune adapter 
timeouts on a per-system basis, deriving a baseline from the transfer 
length and bus frequency, combined with a conservative margin, seems 
preferable to relying solely on a fixed constant.

I am also suggesting let userspace add something on top of this if the 
core derived final timeout is not sufficient.

>> On top of that, we could add a fixed margin to account for interrupt and
>> system scheduling latency before converting the result to jiffies.
>>
>> The exact margin is open for discussion. I was considering something on
>> the order of a few hundred milliseconds (e.g. 500 ms), but perhaps that
>> is still too optimistic on some systems?
> 
> See, you simply cannot know. So, why not leaving it to those who do know
> for their system?
> 

This is an option for userspace. Should we expose device attributes for 
kernel space ? if no, then there has to be some calculated value with 
reasonable offset.

>> Alternatively, the core could provide a calculated baseline timeout
>> (transfer time + fixed margin) and allow userspace to add an optional
>> extra offset when needed. That way the default behavior remains automatic
>> and works for most clients, while systems with unusual latency
>> requirements can still increase the timeout without every userspace client
>> having to determine an appropriate value itself.
> 
> We already have a mechanism for userspace to set a timeout.
> 

Yes, and I fully support keeping I2C_TIMEOUT as the mechanism for 
userspace adjustment. What I am proposing is complementary rather than a 
replacement. The core could calculate a baseline timeout from the 
transfer characteristics and apply a conservative margin, while 
I2C_TIMEOUT would remain available for systems that require additional 
headroom beyond the default calculation.

>> Do you see cases where a transfer-time-based timeout with a generous
>> system-latency margin would still be insufficient?
> 
> Regressions. You could time out too early on boards which worked before.
> 

That is a valid concern. My assumption is that any calculated timeout 
would include a sufficiently conservative margin, based on measurements 
across a range of systems, so that existing working platforms would not 
regress. If a platform still requires significantly larger values due to 
exceptional latency characteristics, I would expect that requirement to 
be addressed through the existing timeout override mechanism rather than 
by forcing every client to use a large fixed timeout.

Looking further for common approach to be finalized considering both 
userspace, kernel space.

> Happy hacking,
> 
>     Wolfram
> 

