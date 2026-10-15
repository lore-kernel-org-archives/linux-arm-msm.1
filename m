Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3093290AA
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031211; cv=none; b=TpKu7eK5ykvr+vjF1hkAE74+Wddi8eBjM18wr1kxurpZJIRB7DGjnyl6tX2O43AUytJVltUQbp3pWMk5aHwb56lr783kwwAo0RVYVkiYnhovokPECXSJ5vGlMnqs//m6478ZIXN1lWsddUF56xrslYRQvUb1vY7yiU8sNrtGhqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031211; c=relaxed/simple;
	bh=90EN1N7rNxt1YrZEpVX6CSLWyT6yYoLzsNNHcvGqQGM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fmAy0ezbyQFK1Tiud0M609RLDBqBMRQGx5rE3oqZ0mN5oB8fc4f0FVJdihc/sRr8K12OpSrty3EBTqRER/dsrBueDX7vmkJ/4k5UTeF2e2wPhDA7AGFVozphNWUm0WDfgKrTj912xB7LmmMo/jnqV8m1DChd5mxA/bcODGIsEtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oTOeLjW7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UuGmQh70; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oTOeLjW7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UuGmQh70"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F1P6ta1708064
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lOpJV0LCTFxPG1xszFrudkgMcOhE/etRnFGNtQ073ig=; b=oTOeLjW7Lp45vET3
	TmQEWfIwDTMDK4Mb0jA/xUx27Mg9MFHSa4/td8YIZxmnGN9v/Z62XhqpbtqL0lcw
	LOihwMKX1nZmOokD+b3weMmaJ6esH6NKPn5R2XbbIjCOxHRDlfeUh9iwR2RqxPTM
	H9Cgz1B04mbnpPbcYcBtufRpBWLGoCTOH4oH5STITPSETgfmuj+VSead5MOrs2bK
	92aIAru+uGO2H5gegDrawvQ3Tto5nlF2Surb7LxoOh8Ys7EqYrokl0YEki9o9lDO
	Fi4RDryahVALm6Xkejvp5Xjyvy+qhmNqCf2T9rUCfB6pUkefZ+aQ95n0lejAHEtF
	eqMlJQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54r6j6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:26:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a8af172664so980826a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 19:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792031207; x=1792636007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lOpJV0LCTFxPG1xszFrudkgMcOhE/etRnFGNtQ073ig=;
        b=UuGmQh70kPbgCLyEaK9eXaqLXa/If4MbzmHjR96ZMsfJDASHf1sNiQGPn+bKhSW0gA
         8yrIbc1XgOjanDBtN9leWFeuuVXjYggx+d5jcKGY06JYbQUUCe3X4UqckzX7LLAqNigX
         Ae228bV7L54MsqV5WyRnedgFkLi5sJYcpsI4Ehl6rPqdwsa5iYSc7VS1T+OwiY5W/mQS
         4TjMHJfl+8/dmI5v9tztt2P2a/IIMxV8fp7UhleEaLYUDKd1hjs0hK400/m1RyskjfFT
         7vvtmqpCweLbGVfQKZaV+It6EQ1zukH0LLdN65SZpiJS8EHWxsgI08w3iwwu/7gv1Px7
         nw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792031207; x=1792636007;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lOpJV0LCTFxPG1xszFrudkgMcOhE/etRnFGNtQ073ig=;
        b=OvWY9XQiKkcHM1Lf3JeRPOVhUdKaTkfZDND8AFxrs8ZSQsTyhcdw8a+PyYHSu5T0A+
         euaa96VAK4VM0KyVsGbqunzgYpLqeurk0aOIf38dWhGkIUDvS3KwdWirBwv1AQFsL8JY
         +OWEbelHHi+NMKsYKft1gZZtYOpTYuw8Bf+wAKkRq8PgdhSwmoQmrCRUmqNugZF7ub25
         wKtIRQhPobwBjZ4YqUKPQ2M0UVFOw5B6lYwjQkY2p3doidRO5uMN37GykcJ2uUfr4cJR
         IP0W034FoH/zyXbFYN9WMrH4Dj8DWSf+V7iu3W9LNIihW4PSDhu641JAHI+8YJNrmJTL
         xOkg==
X-Gm-Message-State: AFq9FYLNwZpEXTY+pm4OfYwT5sIPQ3id+7gbu1QFM9q+AJH1OL/3rZvM
	ZbKN+hErJ4BgBUGG8dfuqP5zCkJ0jRXS+lZBIWU3i8aF2Cx/lyEAkJOqQoUiWfMni8ky7ZxYpBD
	J4N3mRExk+SLt6Iu/wnV0XVWDOzsgmz0gXlAc9mOIl4Ds+6wmTBkIy/4HQFgmsMdr19uy
X-Gm-Gg: AYBFou12FGSdYmv25el51O6YJQTITQboELVzAVzhzJj8dXvDEIX1li/M31Hbr7hlIeP
	oLL6p7/LS+bI59pO8i/9XC7w9GbwQhx/bWNmpaveAoXCJ40ECsNSQnZUFEHsS+CJth/HThC/2FL
	z7PvaAot9VaFGBdqNQ4l5mjzmLaqVkqj7ANkT/V4XV5AykpmVWLngdXHbXWmI15zytHJy70K/Ja
	d7Pgnw+jOk3vQML49zPRDpcUZaohf2dZRqwbV8Rz/IQKl2TBtdVb7/Opn0uL9EXWwZWKpBR+eUV
	OyzrDlSTUhfTfBSv+D80ze7cUX1VUoG1NWZhObd8vbG2SgoMPS3w0yfSAE85GtUjrQCAvDPWDdA
	ftH0v0TFUfQ0VAHd+3HJS
X-Received: by 2002:a17:90a:10cf:b0:3ab:9c73:12f with SMTP id 98e67ed59e1d1-3ab9c73097dmr8014628a91.24.1792031206763;
        Wed, 14 Oct 2026 19:26:46 -0700 (PDT)
X-Received: by 2002:a17:90a:10cf:b0:3ab:9c73:12f with SMTP id 98e67ed59e1d1-3ab9c73097dmr8014617a91.24.1792031206242;
        Wed, 14 Oct 2026 19:26:46 -0700 (PDT)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac937c4e7asm1203159a91.3.2026.10.14.19.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 19:26:45 -0700 (PDT)
Message-ID: <686fe87e-63a2-4358-a6b9-8b2107b369e6@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 10:26:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: kaanapali: Add CoreSight nodes for
 APSS debug block
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-0-c2a8c3225a2e@oss.qualcomm.com>
 <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-3-c2a8c3225a2e@oss.qualcomm.com>
 <f34b2632-840c-4761-bc35-deed96b9405f@oss.qualcomm.com>
 <b410aa8f-c4a0-438b-a02d-765da25dc160@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b410aa8f-c4a0-438b-a02d-765da25dc160@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad039e7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=XsdsdXCq1ZeDsYjCIU4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAwOSBTYWx0ZWRfX9YrD8L1RL1ZW
 LUas9GQWGHETffvFT8f6iLwQe4bj4X1QTb5IqjtTl7vn9xge0M8A68Au4uk79Mhnoc8NxIVJ7gi
 EeAj3YVmrLZF86bUzXduiy+q4ztCbejKXuOj3v2mF45X8liucRccqgK5Z0xLUfMWlUZQp9fQynw
 LNXgrk9C05MfoQz5f+2+8DUCZFuS5OqRQIuqJjtu68ZpTJY7I2EWvc3NjW4sChLshRE6a269KK5
 lD8RVG7w/uAL0xM207/VIzxh0nJ8upFuP+ziLfu8tscelfwDUofYuzNxKrsT6HqZW11ww0YUWg2
 4lEgVnpPN+EE8fFh3NX71Wexsfo7o30a95+g1EpPo38jicq4pubWDPvJESz3RRDZcs2Z1zMkOD5
 nZyh/9WheHF8K6ObpdAM+QTk+nF+XjRNC1CupdiTMaJ0lvmy/ntJGLwXrLeZBDjvkwO3DVbn9AU
 FZmZXuXAzaGPnqeDJ1A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAwOSBTYWx0ZWRfX52Uhrt/MfEzX
 T0rpIw3pA/DK91bD15ep/FdLwLeIxXIGW2NYKY9Wj3j2sKnfzwQHHWpMcH1SDID1cRIn37odLPc
 l2SfUq4RKWYfNysF+f2qi5K3P/Umm9U=
X-Proofpoint-GUID: PsDw5zriZFDhDB87hbLwCEYh0jP7vPWM
X-Proofpoint-ORIG-GUID: PsDw5zriZFDhDB87hbLwCEYh0jP7vPWM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150009



On 10/14/2026 9:23 AM, Jie Gan wrote:
> 
> 
> On 10/13/2026 8:49 PM, Konrad Dybcio wrote:
>> On 9/22/26 12:35 PM, Jie Gan wrote:
>>> The APSS debug block is built with CoreSight devices like ETE,
>>> replicator, funnel and TMC ETF. Add dt nodes for these devices to enable
>>> ETM trace.
>>>
>>> The replicator, funnel and TMC ETF nodes in this block are physically
>>> powered by the CPU cluster power rail rather than by a dedicated 
>>> always-on
>>> rail. Add a power-domains property referencing the cluster_pd domain to
>>> each of these nodes, so their power state is tied to the CPU cluster
>>> domain and the runtime PM core can power the domain on before the
>>> devices are accessed and let it be powered off otherwise.
>>>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 567 +++++++++++++++++++++ 
>>> +++++++++++
>>>   1 file changed, 567 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/ 
>>> boot/dts/qcom/kaanapali.dtsi
>>> index 131fd2a16c54..d9313de53ee5 100644
>>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>> @@ -218,6 +218,110 @@ domain_ss3: domain-sleep-0 {
>>>           };
>>>       };
>>> +    ete-0 {
>>> +        compatible = "arm,embedded-trace-extension";
>>
>> No power-domains for these too?
> 
> ETM/ETE device is the debug device of the CPU, no power-domain property 
> attached to the device and the power management operations relies on the 
> CPU itself.
> 
> I missed qcom,skip-power-up; for those nodes, ETE device should not 
> check the power state of the device.
> 
> Will send new version to address it.
> 
>>
>> [...]
>>
>>> +        tmc@1d029000 {
>>> +            compatible = "arm,coresight-tmc", "arm,primecell";
>>> +            reg = <0x0 0x1d029000 0x0 0x1000>;
>>> +
>>> +            clocks = <&aoss_qmp>;
>>> +            clock-names = "apb_pclk";
>>> +            power-domains = <&cluster_pd>;
>>
>> Is there only being a single cluster_pd a mistake on kaanapali?
>>
> 
>  From psci map, KNP only has one cluster_pd shared among all CPUs.
> 
> Hi Jingyi,
> 
> Can you please help to comment this part?

Hi Konrad,

We have cross checked the cluster info.

The PD configuration for these two clusters is identical byte-for-byte 
and is based on cluster_cl5. I believe this is why they share the same 
cluster PD.

                 domain-idle-states {
                         cluster_cl5: cluster-sleep-0 {
                                 compatible = "domain-idle-state";
                                 arm,psci-suspend-param = <0x01000054>;
                                 entry-latency-us = <2150>;
                                 exit-latency-us = <1983>;
                                 min-residency-us = <9144>;
                         };

Thanks,
Jie

> 
> Thanks,
> Jie
> 
>> The CPUs have a different Aff1 value in the MPIDR register, so one
>> would think there's 2 (also according to the cpu-map)
>>
>> Konrad
> 

