Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C5D3EB11C
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791961764; cv=none; b=ejLpGj7OGPoMbTJ61pC4dc7DBmu8Z4rhgBtFNKffObzQPhvlHBD2CYsRETyz5mWjrJLybDt2nK8hu3S/HRKLcw2Tfb2P4x3Wy9cYRVOQw4QEmKjze4LPAj1OjraURSKWvVnZKcFwM5LsywCbqnEDkTGl89lw/nGNvKbFwcRFhxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791961764; c=relaxed/simple;
	bh=Vqo8WZTmAqLfeBfKRErwPtgdcy8AHcIFUZaWa14fRVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bj8/qVrDYjTZg/6wDX1UFmDLA8Eb51ChzF3s/WrFgOc4kzd1lzaOygs+tT20tjxd5E0xUrxwgj1o94P0+5WFQugg2/O9huUqBz9awW8yqYq8YSq3J7iuK7ciyvBPnKtsWvGvdJEg+ws59NpxIA9NnvrjejVLACm+tx5WcJvekdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GvD0/BR5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z7fD1Syp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GvD0/BR5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z7fD1Syp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E224Ti1592427
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bDimXCojMVGcvs0uonLQ7d+VBtHE9WDGJuZuAfpDOhM=; b=GvD0/BR5zn7RHbt9
	tGJLDyKHaaIRIjlimjqYqS/zHeYc35ydJFm8Yc5OXsZe3kmiKxldKg0IniHgmv5c
	5uSoEc8PiiPLqIVWHaEEUcqCqGhofbNfPLLtkNUUSrFnkYtzBa+YFgMD1JeqNNlg
	L7uXwqmpGPsyDCqheJhMH8liT/r+2K4r8g3tIdohMcrEFB8O34kGz12pKHuc6qp2
	Y6HdNvkGtb3oOsoGauYzl/EDD9DImFODjaT6nJZSOHGZlGtgtJTcOHwpJvAxbGtR
	uFcOKz6jfmNkNCLY5Q6fao/NGfIxLEsFQJ2+S/8d3SxtJBUhjmI05yQ99FGDe3Mv
	MrBM3w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s1tjvvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:09:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso4094729a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 00:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791961757; x=1792566557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bDimXCojMVGcvs0uonLQ7d+VBtHE9WDGJuZuAfpDOhM=;
        b=Z7fD1Syp+syWJBwXxepbOVA5hgBzJhyT8+vXXNomaPCx/nj9txXnD7R6Ka01svZG0g
         +3iF/7SM+hLK2wfkTKAGU/GdbSq3HqWvPOHa8HR6T9/xlHrDA/U3yu3fLoCgav3xu1l2
         j4xucI5Fm3becMDlz7Y3Jpw+q9WXDk3+eXFWLuL4h4okt+cJrthTrIg3tAAmDKL9GI4h
         Sb6SC750iD55LK6YQM9F8eS8+t3rSeTmrTXVdmL+SHXQptfJ00v92ajfVn3nknaL/3c5
         BftStkwTddQXH1DyqJ7tyVRvHX8v/ul578xaixInGmME9+t18FlcGzpEkEncpcWFPWsO
         TOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791961758; x=1792566558;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bDimXCojMVGcvs0uonLQ7d+VBtHE9WDGJuZuAfpDOhM=;
        b=QgOic7HqxcMjscNoTvN+5f8qzUegQ7XUCN4hS3HVWeChg+u3m8jQ0aPzx2GYV8MDAT
         3CvuyvUz/dmYYfB2GWpRDOoFJQZzpiYMqrIDZYijel+g8IZlD1o0dRkR8DhAC7XeSkWw
         u2PRQ86K7BW/1kQPCQ4oC9w4PhB6pIhJ0nucEEcVT9Xb80RlXvVt6Bn4l745MmbgRptx
         RNNywotEkX/NwsII/laBFVZsrfFAKB1a55FFxf79K1uly+3w4UzogEkiI6eUfW+6AJbB
         M3cm28EHbD2e2HOdIX8FckpaUweH3OqLAKAwubp9h57HxYzCG0iKf3or/jZ1wEMLyOvK
         yYlg==
X-Forwarded-Encrypted: i=1; AKwUvBxEnX35EHGZqyvDB4bIrJ+ZW7Fqmwrgwg1NnLVv5aPAEvhbUR3NyBjf0tGuzavGxVK9YZqAmFIl5W9tIwl3@vger.kernel.org
X-Gm-Message-State: AFq9FYLZaWERZnHZso4wthS9UJAKieQICWdQZjHdbLeUIx47dqFKGg6S
	CF4mke8kbgtdUHC4J5Ez9JkVztCfQQ6+tzZnLIpgShCZUS96aL0V8c/eWcKi2mkwuVpmv2P1jrW
	IApKoA5x93iHvUnIjeGxZe1pNwN/4YaZ1mG6WfJCQO1strYZY7qLYW7C4DR+3n4Zavd1v
X-Gm-Gg: AYBFou2ObH5WHNIEWi46RNPWCEa6x536/BQRaKuXubsT9eAd889GlXeAd/uYd97pgHm
	xflrYvIXLbQ6B/ZZ8GEq8vKPhcf1Z/ybhwZ0Lhzd5V1jW6KzPSnKePtOPjPjXjudUZl5XNwz1Uj
	rMRJq80eQGOadyXyw5ri4+I8zyNor6+RQaR7Vhw/1uvJ+skovvh6TOP5mWqAY6pyZDQxusIk+nO
	5i4Loy5p1nnikN9JdK/gzI0Lfyyb0ll7peH9lHfRWj1KZHSF87SV2ndVsXgDUg1wnXLfyw8dINd
	u/UuYoN2kh+HR82DC8YyTsi3ct2cwGEbWPIxlGxyO53haSSQctocVZB7buzd6TH5j6jYunsEl/p
	RmsAGKL+apnayFqpqXVSTF5LF22iJ9gQiUDYkR2VWoKxx1qGr0ZfydmiA85X6aQo=
X-Received: by 2002:a17:90b:4f41:b0:3ac:6e91:3f1f with SMTP id 98e67ed59e1d1-3ac6e91416dmr978156a91.37.1791961757410;
        Wed, 14 Oct 2026 00:09:17 -0700 (PDT)
X-Received: by 2002:a17:90b:4f41:b0:3ac:6e91:3f1f with SMTP id 98e67ed59e1d1-3ac6e91416dmr978130a91.37.1791961756667;
        Wed, 14 Oct 2026 00:09:16 -0700 (PDT)
Received: from [10.133.33.145] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e07329sm6432925a12.5.2026.10.14.00.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 00:09:16 -0700 (PDT)
Message-ID: <86fee017-c9cb-4583-beab-4f29919fb518@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:09:07 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM v3 8/8] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
To: Ben Horgan <ben.horgan@arm.com>, Rob Herring <robh@kernel.org>
Cc: James Morse <james.morse@arm.com>,
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
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <6e06228b-827a-4321-99c1-3e0e961abd61@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IpOL47/g c=1 sm=1 tr=0 ts=6acf2a9e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=lWq2qqVSSi_Om9X4mrcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyOCBTYWx0ZWRfXyFltRDlgkcbS
 jeO3twaze+xnBdQ/TIDgT1KDiyYLwEhAXey26KmG0n3D8jDxxf3ZIQrx4d62fIrmnd4Ikngpq+C
 jPRD3b5bcHLn6iGEvgPEmrrIGKONsYRAhu03Dwza8Yk+6EVinp3lRDr4IIPTtU7Wq3C7RcHJRHj
 ECWr9v4jk38Wkchv51MKyYRH+K9tW1M43DpGTK45mQryywLZT804I3QoQ0lHPcBXOA+MOufmWv0
 WP21HfBt4p9UkvhCErcGgBioMlBwMvjz8teqdEAV0Gg9dqCI88mfTz5VmeqSQKIhdBUryD1nMjF
 aZY3zShQpt4i3qViDVctWKoVqABggWM9yl56Ygfzd/K8U3ORRIE/y6B/sV25zKD5s6VyBm8oh8H
 Mapuexj8O9n3q3YZQPNnk7tRB83TqjpDlhgvJRHE06VCeoqWK+WPwej1Ml71cIGbbRH06JSm5lS
 3fBsaOup02srq7MUGOg==
X-Proofpoint-ORIG-GUID: xekt5s_UfrOgnK39jDU0cZ8B-kljqSe-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyOCBTYWx0ZWRfXwCDzzjsv/2J/
 Xur7fGLsGzc7PJtVzMpf1OdrXQ2up6tQGjZSJ0u/X5HlR+rJ+NoOmF6fyfiCnfeCQEeIW8yLDvX
 6zIjoG8Zk1lmhg/dqqzUdPYDcG2hNvA=
X-Proofpoint-GUID: xekt5s_UfrOgnK39jDU0cZ8B-kljqSe-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140028



On 10/13/2026 6:37 PM, Ben Horgan wrote:
> Hi Yin,
> 
> On 13/10/2026 11:13, Yin Li wrote:
>>
>>
>> On 10/12/2026 7:27 PM, Ben Horgan wrote:
>>> Hi Yin,
>>>
>>> On 12/10/2026 11:48, Yin Li wrote:
>>>>
>>>>
>>>> On 10/9/2026 5:00 AM, Rob Herring wrote:
>>>>> On Thu, Oct 08, 2026 at 02:41:17PM +0800, Yin Li wrote:
>>>>>> Add an MPAM MSC device node for each L2 cache. Each MSC is nested
>>>>>> directly under its L2 cache node so that the cache node is the MSC's
>>>>>> parent device and its CPU affinity is derived from that cache.
>>>>>>
>>>>>> The L2 cache nodes are placed directly under the root node. The root is
>>>>>> the root of the physical address space, so each cache node only needs an
>>>>>> identity 'ranges' property for its nested MSC's 'reg' to be resolved to
>>>>>> a physical address. The two caches use distinct node names (l2-cache-0
>>>>>> and l2-cache-1) since a cache node has no MMIO unit-address of its own.
>>>>>>
>>>>>> The nodes are disabled by default. Production firmware does not expose
>>>>>> MSC register access to the OS, so these nodes can only be enabled on a
>>>>>> local test setup where firmware permits direct MMIO access to the MSCs.
>>>>>> This DTS is therefore only an example for other platform DT authors and
>>>>>> is not intended to be merged.
>>>>>>
>>>>>> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>>>>> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>>>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>>>>> ---
>>>>>>     arch/arm64/boot/dts/qcom/kaanapali.dtsi | 50 +++++++++++++++++++++++++--------
>>>>>>     1 file changed, 38 insertions(+), 12 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>>>>> index 131fd2a16c54..b1dcb1e9c570 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>>
>>> [...]
>>>
>>>>
>>>>>> +
>>>>>> +        msc@19870000 {
>>>>>> +            compatible = "arm,mpam-msc";
>>>>>> +            reg = <0x0 0x19870000 0x0 0x10000>;
>>>>>
>>>>> The MPAM register length is 0x321C.
>>>>>
>>>>
>>>> You are right, the MPAM register space is 0x321c per the specification.
>>>> Will update accordingly.
>>>
>>> That is the full extent but truncation is allowed by the architecture.
>>>
>>> Section B.9 9.2.3 Permitted truncation of an MPAM feature page IQGXFF it mentions
>>> some conditions but these haven't been updated for the introduction of FEAT_MPAM_MSC_DOMAINS.
>>>
>>> Does your implementation have domains?
>>>
>>
>> Hi Ben,
>>
>> Our implementation does not have domains. So 0x321c reflects the full feature page for MSC.
> 
> Truncation is allowed when domains aren't implemented. I was just trying to say that that part of
> the spec (9.2.3) is out of date and needs to updated as it doesn't take into account the possibility
> of domains.
> 
> It's only domain specific registers from 0x3000 unless you have some implementation defined
> registers (9.1.5). Is that whole region just reserved for MPAM anyway?
> 

Hi Ben, Konrad,

The original 0x10000 reflects the per-MSC register block size as
allocated in the KNP hardware — as Konrad noted, Qualcomm DTs tend to
use "how much register space is allocated for this block" rather than
"what the last used register ends" to avoid holes.

We'd like to update it to 0x321c to give other platform authors a more 
useful reference, without exposing KNP-internal details such as address 
holes between blocks. In our case, we don't implement MPAMCFG_MBW_PBM, 
and — as you noted — the registers from 0x3000 onward are 
domain-specific; since we have no domains, those aren't used either. So 
the actual footprint we need is smaller than 0x321c, but showing the 
full 0x321c gives other authors a complete picture of the allocated 
register space.

That said, this patch is marked DNM and is intended as a local
verification example only, not for merging.

Thanks,
Yin

> Thanks,
> 
> Ben
> 
>>
>> Thanks,
>> Yin
>>
>>
>>> Thanks,
>>>
>>> Ben
>>>
>>>
>>>>
>>>> Thanks,
>>>> Yin
>>>>
>>>>> Rob
>>>>
>>>
>>
> 

-- 
Thx and BRs,
Yin

