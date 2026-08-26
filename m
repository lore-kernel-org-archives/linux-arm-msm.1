Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857E440BCD2
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735970; cv=none; b=riJBvhjq4EMKsxeZWzIR6xeAFMZiYv/3/JSEhFzKSxsxBYM9SCA198PaTTc3jyHG1gK7d9ydVYRnkFLCJIhtA0MgPTPc/Y3dK2NEpDI09Y/SE8majtMvDOtTMUX7Taxbh5hBMKIVaIeJfvCwGzTCyJgjB785ITHBgnU64+UlwIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735970; c=relaxed/simple;
	bh=Vd3Yk6nmZwnwLRmrSLTTHNEwHmZHeVc9zJloqIv2M+s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=DH53O1StVEOJwVYwiXrGxSosozB5z2Ppq4i64R//6XOqguB0kOInH+VNoDW3GDRcMmqr5h9JXKw7lw+Bfgm1vakgXP2UJESRKsjOXUepk0HYqmB8ZxApTQRS1KDCQpnqD7KRKHFey/+k5n9SXei+V73kCpKCr8Zuzx+u/tiAiQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EN6AwctE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RAFj/wda; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EN6AwctE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RAFj/wda"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q9Cfp64157814
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7lxeXVG7h4jptXOIMKB+JMsQR5tbaUJ2xRI3bhcTvG0=; b=EN6AwctEh8P/OYbS
	6xdLHQSJ8BBIXBW+Ugw82q8AlZ+0ouo8es+thf0dNpD/89TwajY2y0l3cF+L/USN
	WFZTFjU7+2Ex2uCNcLOxsqUaSDu3UPPqDx+dPk9v6vSsWhJu2mHbnBkellEtSB8Q
	r3m9cbEuQ+54Hn1WBcHa9H2WpRYR7SD0zrLQexqEMVthh3pP4x/nR1eAMT2EztTm
	lgEp5ASTZzsJajWAUyqVaeJXCAEj1PpYISOtolfiQr6TdJIRBKnDM3X9a+0Tc3D7
	3Mc6K3CuIugc6Fo7ntsemicXyf2wWPT7+kevahRDDaKq7h/A2uXaBP9b4Y8oaYWR
	h195yg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9s9g93eg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:19:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso993311a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 02:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787735960; x=1788340760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7lxeXVG7h4jptXOIMKB+JMsQR5tbaUJ2xRI3bhcTvG0=;
        b=RAFj/wdaYbfHyGWfECcc1sTGCKRNCYSy8fdCBnOVxhgiIKWZ3dX44+9affK0cjL2vC
         /7C5Qh5c5Zm6ReZAYaI0apCdihBQn6F1J7OnV+XD/bew/Z6ZuQl0nodkhKktDN7L1SZh
         x/5+KDfbJoQgZ/ACJbL93mkd/srCvOk3fKdXAbMjjhfaTT1AJdYLHizFh3GprQiOIruO
         N2f2JXPI26LZhRbcTIrDUeGn1WIMtH8Mfx+ZoFsu5zO23B+6k2pDT1jnt7uJOdRDjwnx
         a4eUUtq5tcTgr3BU0rhFObtjJ06texNnqXXmicR+zhm0ZOK6X8BgeGbtYUsQduAdTtPP
         S7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735960; x=1788340760;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7lxeXVG7h4jptXOIMKB+JMsQR5tbaUJ2xRI3bhcTvG0=;
        b=hm65R2lGGfUiMrInVCDFJscklF6fjbwHpnl/N2EhftMY8BkqyS+hImJ7+hmLZp4ALN
         IZxQt4zUzdVAoHmQI6Bz9MmjFku7eG8GdqmMPtMyPckMKdwOYGRbtJQAJZaWgAjQRro7
         H0gJGARg1Dt5YAVqbsO2nQraJ+UeEALY+wqyEcAWE2YEFxlRPTwA0US3m1ntT51qMYSp
         aJUzXe1p8rAn8tkepF+bnaTRvA1swK3le7R3e+KD73cQarTOScrPrN7V65k8fU+72otP
         JOf/7umSoQOY+uJPv6gIDBi/zU+czyV07P8qYbTzo01gEAf2aBXnKi8ffe+5x+tNQj70
         tZXg==
X-Gm-Message-State: AFuF++nhzBTq/lrhKjKx1HKvJzzaphR3hR+M5lqehfdByeu2XzLKB6K1
	y+Q97X8UEGWWOAb8d/3J4NewhpCqPZFB7qDiqBsqSGemrSsTbAHgd840YxK/+mqu94sJtCmsBAJ
	TMn08E/rOAQXXOskAtpnpY4vQAS3HJwoGMOnQdOtoSeCSIgVOty/jhCKN0uE5RWDbjfaRlXpvMo
	ef
X-Gm-Gg: AR+sD13GwUFJFppoPKG5WiVQDQsek2MG83PApMb0Zn5bKymXva7yAUe4O4MHa3/lEoK
	ZMWxFN9otbJI9xfRxH6TXdYWOzyZqMhRgvmdhPIAjmtBE7Q4oMG+wS/fqS5qtMAPgAlxjy1rwEL
	O58TpyPSyivA8eM4aRBs8wMP/64jZPyA+87kM4q/JQLaay9SVhwqF7YmJbWgnf9/dnNvS7qe9Xr
	cNzxreNFHS84A4XtZwexLCkcsY1EjOxoBSdIGkjWyRLmBeOEf/HtdhEWsPnp2d6tAIzheWQ21yo
	AK/wzcECgp0Cl1tbXpBPQK34h//Lz7iVzuxlDxHPksQzviAD8iw0hRn3nd1sy7Z6JKSkmkk47nx
	MwuxahgIYPJWMZKBqJNRJ1llLWuJf
X-Received: by 2002:a17:90b:280a:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-3966d1e226bmr11889735a91.4.1787735959471;
        Wed, 26 Aug 2026 02:19:19 -0700 (PDT)
X-Received: by 2002:a17:90b:280a:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-3966d1e226bmr11889641a91.4.1787735958988;
        Wed, 26 Aug 2026 02:19:18 -0700 (PDT)
Received: from [10.219.57.13] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d769d81sm7054528eec.13.2026.08.26.02.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 02:19:18 -0700 (PDT)
Message-ID: <1b7a301e-9a2e-48c8-a78a-d3a800a2f9e7@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 14:49:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: NSP Images upstream for Nord Platform
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        kssb@qti.qualcomm.com
References: <ca4efa2a-41c8-4658-b386-0bc691e95179@oss.qualcomm.com>
 <kug342o2og57tdhortgabobe4vdjn2jkv3bxoqzfei767neg27@46p2slgpyj3w>
 <fa3ea7e5-2624-494d-a754-3ecc73ec832b@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <fa3ea7e5-2624-494d-a754-3ecc73ec832b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ge3ZgEJ_Zj1VYd7Io8TN8qI5SnWTJ2hA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3NiBTYWx0ZWRfX5tra7zB/n/yS
 qOx0zzMCKVtmJ+Qk6+vbrAbnfFgR6ayF2YnUaxQHMAqj6Ksfd1lJ/CaZbu8plERRRZ4Bs0Crii0
 yw3pbNIuOIxisc1f0XMJHALWOO8lWyNxJykQBg3O/ywErTYysGWPZv6c6qRhNsq+WBSfskaAMjE
 3G/gH8jz5bBewUl2pNmY8tn+Pemw5O0IFnBbdAEfUJh8JpPdr0K+CDL9+AptEDR7dd8jK9dL6wq
 Q7Qib/919x/mkBLk67+A6VdaKTh8zmf1zns7MozSqiZnWAN9mJbyzBNPRN97xtkBN3ZOS0ow1WO
 Ti5Wg6leYFo1IyLjWiptiw9ZTQXBRWNazhgiPjOSaK4xDoSJVPhH3dOQyCJDhwSH/cMATFQP+bs
 rvwNb9QAm4715LnijcScKnxt8ekbW8h5RzzYgO4/mJbuLHwKF5QDi4zwO00GqmpJCzmaZEsY7PC
 3iaU8wpAkFSkjOeaCQA==
X-Authority-Analysis: v=2.4 cv=Xfq5Co55 c=1 sm=1 tr=0 ts=6a8eaf98 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=vVJZOMr5DdfHgkBU2G4A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3NiBTYWx0ZWRfX47HMW06unqlh
 oYd3GCj9Tuo/saTKlvQRPK1GWxx3prKK61bUhtBztyvIpdoAQamcqJXjnIa2mznG95Rp/SRI4rl
 FBcEdX1dL+46tiMSLSGvgq5fClnHf7A=
X-Proofpoint-ORIG-GUID: ge3ZgEJ_Zj1VYd7Io8TN8qI5SnWTJ2hA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260076



On 8/26/2026 10:18 AM, Venkata Kota wrote:
> 
> 
> On 8/21/2026 4:22 PM, Dmitry Baryshkov wrote:
>> On Fri, Aug 21, 2026 at 03:50:14PM +0530, Venkata Kota wrote:
>>> We are currently planning to upstream the NSP firmware for the Nord
>>> platform. The platform contains four NSPs, and a single NSP firmware 
>>> binary
>>> is built that can be used across all of them. However, the current SSL
>>> validation mechanism requires a unique SWID to authenticate firmware 
>>> loading
>>> on each NSP. As a result, four copies of the same firmware image are
>>> generated during the build process, with each copy undergoing a 
>>> signing step
>>> to embed the corresponding SWID information.
>>>
>>> This approach is consistent with the methodology followed in the earlier
>>> Nord program where firmware was successfully delivered. The same 
>>> reference
>>> image is used for both QLI and upstream releases.
>>>
>>> We attempted to upstream all four NSP firmware images; however, the
>>> submission was rejected on the basis that the images are identical. 
>>> While
>>> the underlying firmware content is the same, each image contains a 
>>> distinct
>>> SWID and therefore does not represent a binary-identical copy. These
>>> uniquely signed images are required to ensure successful 
>>> authentication and
>>> loading on their respective NSPs. This requirement arises from the 
>>> current
>>> SSL authentication implementation governing firmware loading.
>>>
>>> Several proposals have been discussed regarding potential 
>>> enhancements to
>>> the SSL authentication process. The SSL team has evaluated these 
>>> suggestions
>>> and is currently assessing available options. However, any viable 
>>> solution
>>> would require significant design changes, along with the associated
>>> development effort and validation time.
>>
>> Thanks for providing a good summary. The mdt_loader, the module used by
>> the DSP driver to load the firmware, already supports loading ELF
>> firmware split into multiple binary segments. While this (legacy) format
>> is considered obsolete, it gives a hint on how to support the Nord
>> platform, while keeping linux-firmware contents sane.
>>
>> Please split the signature segment to a separate file having .bNN
>> extension (where NN is the segment index) and make sure that mdt_loader
>> can load it correctly, possibly extending the helper code. Use symbolic
>> links to share main firmware image, while keeping only signatures apart.
>>
> Hi Dmitry, I am working with the concerned teams to get this implemented 
> and take care of this problem not for this chipset, but a bunch of them 
> that would follow. This needs work from different teams and validation 
> as well. This is not in the purview of the image team to make these 
> changes and push. The solution needs to work upstream as well as on QLI 
> metas planned internally. The estimated effort has been provided to be 
> roughly a month considering changes (generic) to all branches wherever 
> needed and push after validation. In the interim, in order to unblock 
> the feature testing for NORD across teams for the next one month or so, 
> the request is to allow the copies of the firmware for now. We would 
> remove them with the right solution as soon as the solution is available 
> with testing.

Hi Dmitry,
As I understand, we see this release this week is the only release 
before December, by when we would move to latest Kernel on this program.
There would not be any update on the NHLOS post this till December and 
this is to unblock the rest of the teams work on their PRs. We would 
work on getting the changes done for a single copy of the image by then 
and post proper testing across targets and images, we would make changes 
to the upstream branch as well. The request is to help unblock the 
internal development activity.

