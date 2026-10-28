Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188967;
	b=JYRKMcC4rx3KhPELKsfGhvT0+J4bjxjoCNs0S/3XPdFQ0Z5cYtC+K0wRyKHTL2ugdoAr
	 rqhJccLi50UrEd/SKiZ7M8RxbRVfcGy+Wvr/5mYWt2vcIkBGj9ih9G8mHcKve/9Y3Sa4G
	 DCGbwnuzXzBoL1LtBd85EAD9u9n+iTel0aCWQgeENTjlurFrnYCW6KkU1R5FKMJVGwSOv
	 KvCUEsBUpdOiQu+vJoSTHa2X/kvBD+5kF0wN10/WhFJic4agL9NuY0zaCyQl/MjFuuLBp
	 BYUTKnDFwF0id/RoPln/9Gb3Rq7Vh9EAqlx3/JKeB278XeofhykntWCu8+aziKafDjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188967;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HIrlthp+nZ6mkyIpoQSPilbZ24G9okH6PlYynTxe7dU=;
	b=w1VOwwGirQkeJq/+VC7UuSlKvwK0IkEVrh9Om6QJkM3w5HToylPNNqQQg/dhDlNbjtQ+
	 xvvz4jahVjGksDYStYcm5lEXghi35NErR1YIA0o6GMcEMnkDYOTvBkAVih+JcOPBIXuTb
	 bEqnj1f5NR1rHbB1WLQZtLTPCbj0q1mPyaRKZbbHF7nnCODhDvLXKQBHJhYWcZLsW/DqB
	 Inb0zfr0rsND7wREEzYZJWvT8nU2rzCpbAzxRShjA4jGU7fcN6rmZJBRYoJNXy4VHlifu
	 73T2nmGNkwcUO6Urvpp++X5AcsKKQRttHReX95Tt3tHg02MVOL4y56HVqzt9XNg1A6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mtHnINnJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EMLkayf8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3AE606A324
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B3AE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mtHnINnJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EMLkayf8
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdq7Z137457
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HIrlthp+nZ6mkyIpoQSPilbZ24G9okH6PlYynTxe7dU=; b=mtHnINnJIejV7VQr
	7XTk20uGRV2y/3Te1QAhRDX2iZ5DlHcXVE1IPb/I5sk80IV03hjICUm0v+XdboOL
	b0+QbELzt0N1/AWIqSBWtUzaEi29PIkXKRsdiua9fHWiIZNZ9kvp/tddr33rdd9Q
	1jaZENQnCG2vsEFsy9F4G/MXv/wjKUgziSuDPbNzaZ+XEADcwV4ZvNdRohVzdHDz
	wPlBvpPQgtNpSTOF0y+QyE1CWRWIHdKD90E3tTmdck7jvapy8s2Svh+r2LGTxVhO
	TuhUegkuK5agRkpK7wKAmQTCfBxZcsC4qyupOf4Etfhq34joM52wkBcYcNwl3WRi
	D1IdtQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f929sd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:02:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e60770381cso9503275ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 05:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188960; x=1793793760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HIrlthp+nZ6mkyIpoQSPilbZ24G9okH6PlYynTxe7dU=;
        b=EMLkayf8r1DkJAm2glvnQw8+iNyujoH2H1vr++lEAgb8i0Fup4tamPLM+ohDX3RquF
         jJImMXLWRZHzVXkBeHE8Z/E9tVpkGXA4SOCz6XII0/7HREahplPGLI8xsNoJiavfYUQS
         eJKkQ7lWwwo50UFqwqoCHHOD6YEX2WtS+ZIK7MzP/ST0Jbci1Sqofh0W0s2SSJTG/3O6
         T/yapMpkumERrwjbRA032EsEldckGSj3JgPerG+fn48iuaKi4xSg8uQkANzEQmZo2MLD
         ZWXaon59AGKjL2LxnYiD366bT1NIBwS0UKLSb9kvZJ91Ji8iy55vdrHrjtpogta1vI8U
         C5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188960; x=1793793760;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HIrlthp+nZ6mkyIpoQSPilbZ24G9okH6PlYynTxe7dU=;
        b=GISG8yqA63EQ92hfiG7wm0eaOI5Q69E6jSteFTq+bbN7ZFXAtuJJZkGG77T/Mt0Ydv
         4SBlnsiHfr0HlXpD1WUXrC6SjXBo3tlRiSpg10GJv4dkI90qCjNitFDMZPgYGoVsz/d0
         dG2wJTO4Mu7cpvauOt8jWs8u8ORdijjY3rmKxBnes37IU/rcdeS/9ZRm7g7rNDoCI0vr
         9tKNGhZ7fMhKMVCqDgUCH1RJdnakcVOx+8w1VQuBW9eiZ3uMO21u5Qxh7ytfgZCQanHr
         3H8MJIvYUHPEmDL1tm3bkdHoX/s9X3efNG0KFIYLsYU2zsJut/8R02XAMgGn7nFFgYqu
         opqg==
X-Forwarded-Encrypted: i=1; AKwUvBynVqUBW0fXlFTKgSy3MHBmQKfMbFCRgDT2m8jHHP4Pu8xebBWZQqVXQ4QcgdJpAYLrmogJPdu19WianQFg@vger.kernel.org
X-Gm-Message-State: AFq9FYLn/S1WgM4mTQFuxoppEQCEChV8d4pV+jW04MVHNzImCqKKh+Tx
	YaP4dj38RenxKer6eQA4ZG/uuUOVLzAg+yxVPrMLrR70xJKxqUdit9HOJP0I8EMdVjja0Rf9YRK
	HFHETmux9TFQY9tW8NkA47nE8piOkW8SlhLrFPYjlNUOx7c8CjoAITPE+BeHY4Mi9gqFj
X-Gm-Gg: AYBFou3AZl9qc9GIZFP+MUIt2l18s26mqyQDBJHlxT88MzPLoySpBT8riQKl+iNYEda
	3dP2NB3qu/ZpgLKtNUc3Tlck0slMVI9RrBSoSTFo8j3uNCfGZU4VgCZq/UUIgPTkB2cLDh/K5X1
	iShQlbIpCMDu8jxB8CtTnhpVdvOxT9gq8OcSWppaCkgVgar6bqeEng8kJj24rlZyn+po7Rbs8+c
	0MTCHa4zhwikXexpP7B5UVEd9ORJfweiLhArrurdGz5HP58KyjjwQcDkh+L2a9peHWjpWHzd1aU
	8j7QC2KABKRL6TlKmw9j0e/RpTViMTT2XR8CqlvF3HjV6SVkM61pAv5unlBZrFA56DAbtG3c70i
	VcP0HROhexPRYhm779mmV4R9SthnsRBZzX7WOxsvScmpTHwjIkj5jyD/Tce6rJbC0d+2Ilsdd5z
	GW519/MHn0Nw+RgwgJWlYGWcfOFVup49kZY9bW
X-Received: by 2002:a17:902:fdac:b0:2e9:5714:6072 with SMTP id d9443c01a7336-2eb003ecf3bmr21396765ad.44.1793188959506;
        Wed, 28 Oct 2026 05:02:39 -0700 (PDT)
X-Received: by 2002:a17:902:fdac:b0:2e9:5714:6072 with SMTP id d9443c01a7336-2eb003ecf3bmr21396155ad.44.1793188958907;
        Wed, 28 Oct 2026 05:02:38 -0700 (PDT)
Received: from [10.133.33.208] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae64564b5sm21513925ad.5.2026.10.28.05.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:02:38 -0700 (PDT)
Message-ID: <6c74dab3-f00d-4567-b9c8-c8164867e8b0@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 20:02:29 +0800
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
Subject: Re: [PATCH DNM v3 8/8] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
To: Rob Herring <robh@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-8-35196c2b43bf@oss.qualcomm.com>
 <20261008210004.GA1318789-robh@kernel.org>
 <1d764a3d-7935-4e26-b1c2-92537e1d3811@oss.qualcomm.com>
 <893507ca-b956-474c-9124-92fbfc25e9ab@arm.com>
 <f17e31ca-817c-4607-a680-55ceb12169dc@oss.qualcomm.com>
 <6e06228b-827a-4321-99c1-3e0e961abd61@arm.com>
 <86fee017-c9cb-4583-beab-4f29919fb518@oss.qualcomm.com>
 <1feb10d8-75f3-4dbf-9fae-807dc5a22c25@oss.qualcomm.com>
 <20261026122300.GA3598537-robh@kernel.org>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <20261026122300.GA3598537-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae1e460 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JqYqai5FAWh4DW1MJkEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NyBTYWx0ZWRfX465qGA3g+Tde
 T9UjP6q9XGq4NRSVbSl3w6sBd/QmOj6cWrGbidJkyTruf3VLoKQKVEH2i9mOKVVCBDk1KGFYPnI
 eKgGOeHnPtNl6KAwSYK8UT4iMFn5RfI=
X-Proofpoint-GUID: iOHqDzckwo0q5cN_DHArGNf9FCfQgALA
X-Proofpoint-ORIG-GUID: iOHqDzckwo0q5cN_DHArGNf9FCfQgALA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NyBTYWx0ZWRfX/9oNCSqEk4Jq
 k8qTydWcUl3iDEPfFppxcGUHCNfkV3r4I2IA02q7OEOSI4lKmKEb3aO0CEkOnxgIF7wafVAngwz
 1Ptnx3yGVrI0TATkwWy8xkoUyJiey15N6t0rtd1GYbCfe1+JHm5vGWMVbTDqAeyTBzJsl/8SROt
 AlWHhDx0TmLzgJUIiEarsobQyDmbZQoHbkIwRgI0qjqFmKb9nJh+bJvfkXoTpbmKODA398Jse0C
 8YdzEXCwtMidOKKRp4NhNbhAobc45XjHRdVIuIgCV+vEIOR/xG9eR/KnsCp/MB8IGGzthrogw7C
 1bngUrpQKOqcAQNnHH2xH8urz2ERfntSUbQMsa2lBaxlPxvIm0TTZ3TcO0u2qYxiZDX11UwPILb
 CqjGobZba3YUqmzRQufyFnr6AFzGEVhltkDZTb7/v2amvl6rZXFIedDP68akdw3qQ7rLUhrdxtC
 d5f2tNAxD0qWL0ixaHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280047



On 10/26/2026 8:23 PM, Rob Herring wrote:
> On Fri, Oct 23, 2026 at 02:03:57PM +0200, Konrad Dybcio wrote:
>> On 10/14/26 9:09 AM, Yin Li wrote:
>>>
>>>
>>> On 10/13/2026 6:37 PM, Ben Horgan wrote:
>>>> Hi Yin,
>>
>> [...]
>>
>>> Hi Ben, Konrad,
>>>
>>> The original 0x10000 reflects the per-MSC register block size as
>>> allocated in the KNP hardware — as Konrad noted, Qualcomm DTs tend to
>>> use "how much register space is allocated for this block" rather than
>>> "what the last used register ends" to avoid holes.
>>>
>>> We'd like to update it to 0x321c to give other platform authors a more useful reference, without exposing KNP-internal details such as address holes between blocks. In our case, we don't implement MPAMCFG_MBW_PBM, and — as you noted — the registers from 0x3000 onward are domain-specific; since we have no domains, those aren't used either. So the actual footprint we need is smaller than 0x321c, but showing the full 0x321c gives other authors a complete picture of the allocated register space.
>>>
>>> That said, this patch is marked DNM and is intended as a local
>>> verification example only, not for merging.
>>
>> If you don't intend it to get merged, you can even put 0x12345
>> in there. But for future submissions that will have the intent to
>> be merged, please stick to the 0x10000 size
> 
> Why? That just wastes virtual memory space. I know it is "infinite" on
> 64-bit and *only* 96 bytes of PTEs, but still.
> 

Hi Rob, Konrad,

In v4 we settled on 0x2000 for the Kaanapali DTS. This reflects the
actual register footprint: the platform does not implement
MPAMCFG_MBW_PBM, so per the MPAM specification the feature page is
permitted to end at 0x1FFF. The remaining space up to 0x10000 is
reserved for this MSC on the Kaanapali hardware. Compared to 0x10000
(the full block size as allocated in the KNP hardware), 0x2000 avoids
mapping unused space as Rob noted. Compared to 0x321c (the full MPAM
feature page per the spec), 0x2000 more accurately reflects the
platform's actual implementation, while still being grounded in the
specification rather than an arbitrary value.

We have now posted v4, which also reduces the binding and driver to the
minimal set actually used on the platform: aside from Kaanapali, there
are no other concrete platform users, so memory controller MSC support,
RIS child node support, and related properties (arm,mpam-device, cpus,
interrupt-names) have all been dropped.

https://lore.kernel.org/all/20261028-mpam-resctrl-dt-knp-support-v4-6-bdda1e445cba@oss.qualcomm.com/

Thanks,
Yin

> Rob
> 

-- 
Thx and BRs,
Yin

