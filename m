Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B8C492E2E
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 09:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588092; cv=none; b=WKj2K2NkEegDaKLP7g8f8WRgCx5at9W/iqNcK2U888fEhCoHQmYthKQdGaSokFeU3NO+Yraa+ShvTse8meCAkQGjv3H3xme36hs+I7qFWKSC/S6ju57iNaS4GJQNP1y4SljYvEfLJSNwMPUcEqM36M373MNVb5wnLE2FKUTdSFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588092; c=relaxed/simple;
	bh=aut5EtV7EHnIQnhVgpWGAgLGS+IWWJeo0UTmCPk4f+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GhLy6Zlc5dRCWp+fw+cFf15qXVk6kcNUundgr9JDpPGM+i7zQZLcdmzb7a+g/swtdBJqzeyowztWLtoKQbuGTTYHqwUKYuKCKe3whBZw/VIdH7Ft/tvjuZG4pzwJGwf0dJoIL9JRtSz/PbFbHy7EivKiA/3iP9ok6zgcJ6Z4U4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aLkXJMxX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jsE2lCzi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aLkXJMxX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jsE2lCzi"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9M8YP805873
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 09:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cslUYpSyi91GFkeEotZ13vFtrVwZDY/B9c/HltZgtHA=; b=aLkXJMxXbzCJ6p6Z
	R1DN0vMl5w3AtEV36Um+luOaXUFYzgfWR2zIKCa3WBtp/4Y/sUhP276G4AgiWvys
	3oJs/O/B/KifdYqa4l/M9QEYeYXCkIQaCBsb1f9xv+0qypcfzGc19gHVjZPGahbN
	4fDfnc6Tt8wFluYbpc488aKZpPtjvajURfCEg+wU0zkkOsVJZuhs+Zq8Hu8HqyXz
	M5wCl15K+5XlP6Zkv0rwloBDRvaP+B/N2lm09lneoGQPx5IeXfi3be6ARv9FLCvo
	etyxotJivn6ZbarEhG4T38eXD/9665rybEHWBs3+qBtVtnHp3n+SFv3C8zfOpPpA
	1BGorQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyk5mrn1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 09:34:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a0be20102fso2514624a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 02:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790588088; x=1791192888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cslUYpSyi91GFkeEotZ13vFtrVwZDY/B9c/HltZgtHA=;
        b=jsE2lCzijKPzwdzujjkkma5+C5GBZ99Jn4g09o62nw9OCLT3pXoe9PmjQbHq81+s0g
         5o1o8XYAp08Pz0rE3NLhFB9m8OReN6GzETizYjWC+Q2JSFXyWDotf1hQtXDIqmjx45No
         eDE1s9Cp3go85RLfaPqED/rAbbokchq5Kzi9zltfwriGzPRazlYAjRAQlPl+KtIXcfuB
         67R8KXvqGipoP72TcbY/TsFLsY1nIan/NGL7W65qqab9+i5U3no87aaWKKBjXhfVDiI6
         /bOa6ku/0i7zVbKR9ZAxkoUqtPX1/PLzFjLLhFc+qpQeLWrsQk5i5cD9I6xTUOx1c08Q
         cR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790588088; x=1791192888;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cslUYpSyi91GFkeEotZ13vFtrVwZDY/B9c/HltZgtHA=;
        b=ZSReJ1dyw9Zc69QFPhyBR0jyAug+8cjQ50jM5nYymWGYEf23MuEw98yhIfl3YxvaDw
         dY+/DB+di2peKK8nKjXxC87N9Zp3vtA1xO3mdbjkPpesIeGXxJBG5CHeBhLb40WHiTak
         QHsw1NTLPZV6fOtZxZ1Sp4kHqn9fHqiX6PnwhE7bfgoxd9fBCip9Wm0yEjsXqZ6rFk8I
         qTkLQqRcfZ8mrxW7WGBwkDA5OFZvTZOGgJBzjiVyFzwLD+k6Cw4oDruldxkVc2Tgsyyi
         d/yNhgpDHro4SPAodDa2wHGoGp1rsW6ZaY9h22l3I+AdaibUVUFLws+D6B9guFb5ieky
         GGpQ==
X-Forwarded-Encrypted: i=1; AKwUvBya5Q+MmMREp9Q0DqzVdznwq2F+yCEYNKYgOklhoOynk+Eq/iDgXA5f2GfvKSMieTi2LjIs+g3fKo7Ra4Jb@vger.kernel.org
X-Gm-Message-State: AFq9FYK2Pf0aOy2n6ROe74AfIMKSnwjwOzzmf0vL1kS1xkXBbFLZJl21
	G5U/Jp+1EZrgrCInaNFJhoIVjjAk3GKPavm8vIA/zs+7NbNAuPSlPWTZ+Ru8FdAX64nBJrw0RHx
	K6oJHeYTV8pXGJ52wUz/Ny2+EZuC1cB5DDWFQo5nw991LIf38q/utz+k3wUlpWCGtlNOE
X-Gm-Gg: AYBFou2NxQCNVqosAfWTDzoJ6UCaZtG88wy2DOkSLoWjbyK4Ck3DQ+W7AckRYfTpAa6
	vSwH/ioy4+m6EevYVWaumE3fq4ghCkNSXChYwUg62NSeKWNRx4WHklqjST5o1g53cAcn3oXJOTF
	OlqHj0BG9kJi8vdCG2RpvUYitd62JJPJ9L5G9kLVzjAJTkA01Rj1oXC6kkyMRJp32SJGvQndD8q
	7GIzzy2vrMwmQmwyVv6pzgvITbgTGDvkhxL1QRErNhvAfDzQT4zqs7B8QvZy4S9mwbcKawi10yW
	uRVgFmlwytOn/IjT28+4iOTW5YnZlbmDBztT8CV18JMAFwJDJIL9CRb+VizdSiGeg1uMbGjmJDf
	k0lgIBE8Hf2Oc9INNBBBUd8ZTYx7RTw==
X-Received: by 2002:a17:90b:2649:b0:3a0:b223:683e with SMTP id 98e67ed59e1d1-3a0b2236bfbmr8129128a91.48.1790588088377;
        Mon, 28 Sep 2026 02:34:48 -0700 (PDT)
X-Received: by 2002:a17:90b:2649:b0:3a0:b223:683e with SMTP id 98e67ed59e1d1-3a0b2236bfbmr8129114a91.48.1790588087871;
        Mon, 28 Sep 2026 02:34:47 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9356f48sm19867799a91.6.2026.09.28.02.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 02:34:47 -0700 (PDT)
Message-ID: <bb9b3980-141e-4ad7-ac18-6ea7b9002dfa@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 15:04:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add TPM support via Qualcomm TEE TPM TA
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
References: <20260907-tpm_qcom_driver-v2-0-71a6b1752da8@oss.qualcomm.com>
 <aqyZtHynb2nuQT-P@kernel.org>
 <d555ee76-3999-4ed0-be6a-ca07354af6d4@oss.qualcomm.com>
 <araJKqHdeXstD7nR@kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <araJKqHdeXstD7nR@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3gpdZW9-6seMIsNH3AgLKHP9J-1r48hx
X-Proofpoint-GUID: 3gpdZW9-6seMIsNH3AgLKHP9J-1r48hx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzOCBTYWx0ZWRfXzhEggjMOqLcI
 WF5Z7BGjP3PWJzV7IGVF3fpinsTBXF0uWXNF9kSrB0NoR9V4059QkM4zvqG4iWs9McnAy92A4QG
 QXlUM+Ha1vnCluaeJpbWI3QhM0gHorkc76R4c0lRO+dTn/pyl6wXROU3KrcWHyEnSUUGv0mzTHV
 snrjy9nElKdc/l4Zl62S6M3qNoSsHCovFxcjvQ8MzfJ4K02xbCB0on7EixvvalB413ow6Aly8Sz
 pvchc1q/CmXNJInwFVTJHIavUFI7xvLRE7SA+b+hUg4IVI3BiH5wKkzpQ6bJUZEHvzPzLe3nMzt
 0jqUR80ipmIHugx739pmMKutYg6pP9A4CP6zW4Qr+bAwzUvSE695zjgw2pOx5iZyWnD4aE76ify
 ooxMFC24ajggdKeJornTK+bro6R4sMovyXB3F4NyzgQYmFYRQTTLTDZkXXBHbVDBsIija8lVUzV
 wMakH8oLgguO3/zf4Yw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzOCBTYWx0ZWRfX89rQrrsnjzMM
 9gIL/09EZdsf/c8b1nr8bRuALX9VdoXsAZi+1dzPyjPOzrU66+Bz8g39z12RvQH7y2wGqP5I/ep
 bTvmKn10oy6QKEs3RivKcP8chc5Cu4M=
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6aba34b9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bi0NzNZZtduFk6DORyMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280038

On 25-09-2026 20:16, Jarkko Sakkinen wrote:
> On Mon, Sep 21, 2026 at 02:06:43PM +0530, Kuldeep Singh wrote:
>>> Causes merge conflicts with my tree when applied with git am (actually
>>> b4 shazam).
>>
>> Jarkko, this series was sent based on tag next-20260828 after applying
>> prerequisite series[1]. Some minor Makefile/MAINTAINERS conflict was
>> observed IIRC.
>>
>> Kindly note for merge strategy, prerequisite series[1] will be merged
>> via TEE tree and current series need patch 1-5(not patch6) only as
>> prerequisite.
>>
>> To merge TPM series, it's better to pick from your tree and TEE
>> maintainer can ACK patch 1/2 for seamless integration?
> 
> So I'm just having trouble following so: what is the best option
> for you? What do you want me to do? Which route you prefer?
I took latest linux-next (based on tag next-20260925) and tried b4
shazam and observed minor merge conflict in patch 6/6 of dependent
series[1] in drivers/firmware/qcom/Makefile.
Makefile conflict was easy to do as seems recently qcom-pas framework[2]
merged which updated the Makefile.

Also, I don't think we can merge tpm series once dependent series[1]
patch 1-5 merges. I initiated thread to atleast conclude 1-5 so that tpm
series can be picked completely from your tree.

[1]
https://lore.kernel.org/lkml/20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com/
[2]
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/firmware/qcom/Makefile#n12

-- 
Regards
Kuldeep

