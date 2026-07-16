Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58AC3939B0
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192874; cv=none; b=TeRlYzBpGMDddq/vbb8is6i6OxhiOmuT7pcfZpUB3h5rgw+pmW5PFwKyaqs/02/zn5CciIAwInqmgCBKI3OLL5wGTBUQ756jUdySB/Yhf/rp100vTJy4M7n6vcTdWst63/MmMKF+jmmiKrugNqkR1+MCupPFKi9ejYYDWU/z+/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192874; c=relaxed/simple;
	bh=gZisI131OsW1JOfB9ZtrAqnDtGusGcVOsUKQdK+pbOE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=O4TKmYIpn1HlqA+ZPaTuBVsvVP69ofwO+UF8NS9tky+nrz6Sk1/wqfNgG4uSFIZ53LSaTVd0lJ77j0+B65644MvQkg3Grb4FS1+m/DDFAGIR9JsaKdtj1fuux28sySK2eeeBwIdKTvc9GXIGE4S7vf9vLn73tNxx1VWVNTlR52I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mmxgVxmu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hr6zErbS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mmxgVxmu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hr6zErbS"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G8372K2123402
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cuy1oYaAtubcYKQKuKf5EG+7bdtALDSZBRiiK8hfI7Q=; b=mmxgVxmu26fymKxx
	k4DN8/I5q78sOqklkyn5lf75wVLpPMVXBozHESeDlHPRdWQoOrcjZNBXaZj7JzLy
	VN8t34mAlZiWq2de64gnDLC3fxMw+otiQBLqmAT8jrDpUxXnN6dMDr+xUM82KskS
	tyWENLgSAb40JfkU+Val4zx+s6IuXni7PomvTZ9gvNmJXSslACYwTB1U7ZBRGj0r
	Y5GqrL7fskZXZhp2IZKl1IIlLIhOqsdANtrbSXq3JASzOhNHZeYAt4zoLzfDCTbs
	uDlY47bXinMN9MJed/khXP7jyUB4V09XOiQxNsPviDEmfFzTRJ8xN2OmKXUA/p18
	sQWtIg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feuex07tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:07:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38db4fa2e25so8973811a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 02:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784192871; x=1784797671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cuy1oYaAtubcYKQKuKf5EG+7bdtALDSZBRiiK8hfI7Q=;
        b=Hr6zErbSCfC+dIAsCmMAHuLef+DbE6jX0u+aPKnWofASJxkzu/GnSjsXrXkSw8ra3a
         9FCPojIkm6Lj1X/B9/5e/slo9aAfsHsA57T4WTpHN1C2PkKAWOklrHSvmKOxF/fE1fru
         f8XKhyeTJkhJ5HM+a+MeG6NaGgHAfTA7iIKJjHsVJP7W+XG8wo/XBMnKkw9nw8S1vrsF
         VE7uKCMpsT/eJII/HyhYdrzufTHGL5/hm6xzztangr0WJuMUuGY7q/ddJfR2ierH5xNq
         0dWpGYYAui1kLtadFrlsL7JjrwK+vi9jwUbf4ZGHRBbAQKx91hBuALqjaxLGpJMBnot4
         gNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192871; x=1784797671;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cuy1oYaAtubcYKQKuKf5EG+7bdtALDSZBRiiK8hfI7Q=;
        b=cLkPDuGlVFQsfcwIW8dK8CTeWJn6lSBSHegAdUMpXZ02gm/cPMI4a27QQ0J+ueclGF
         5wRGzKUPEIlHJBc6bL+0oYKXDeA8zMOopc9ISm/LexeCwC4Y2JBaFGEC5odXOQwga7Ws
         FkXfboU+Ji7UQatGCHvHtTaeh9nl7OSGx4hC1aY2tCLvnsNbXRsyofb9T4ZU7CN8jKZ6
         /i0corpZq17+mWkDYrw9bVZ7yAH8ZEQDAoANdel5QhJFHxyokQNnb06yhUEQ8ccYJPXL
         wx/whoQfcg7Hc6tdXDyCXaKD9k9nacDzkhIrh+pKVUGhBW1AF8DQqNiUs905sa0MMMzg
         Hxpg==
X-Forwarded-Encrypted: i=1; AHgh+Rql6HJrTsSPFwS6t0oB1dvv5ioKaixHEKlUed97RY/VGSzigtKagUMxX5mN2zW423ct3D2jJRwNyzcqj8gi@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg5A1ucdyCwrw8sidhTqo/GWbNJF4qqmSNWvLiluKHpqw4UDqt
	LVi9ImIQXbn7CgLRKZdC7EEUUGlAcjV0EsuFvCaNzgD7lTi8z8FMsfcybO3BToGJwe7Qd5E1ADY
	6+BfKxJkitukgGv/zwE91WJ3j+laqTAk/2j4odkoLIloT+1nE9/5LPNTRPpHROm3f7XBq
X-Gm-Gg: AfdE7ckdZdD62szjnVmqbld1ZwemgZi3fMaayZc+dGDvSeAv2Z2wcSu0TT9W9CVlwDx
	8ic3CqonKROTLuIoIACfmlLONOLg4IkMMELDhkvXazJvUEqXxVujcjXs6+HOA+7V9h0MI5g4VTW
	Pw4sF5kaFG4diQANfKwB3YwtYbEtttqY+mxMeWBJWU7xkKgFCwYQPfRfPjlN68PBNAb3oy4lf/o
	H2HcW0EKnzadqju0nZDFGH11qTnXqK3imeW8U9tWs2wuuep/I70S9ebOsa/AN1DczRfTVw3mK6s
	aRvJwBaZ19VQqGPknU934108OkAdLdbEEQcQkusiQEx5VN7xkn+WaMCcneyU6utYMGDOH7ZChHk
	PM+EwpLBIIocwUNRX3f/Qt9U/3v5bv5Kz
X-Received: by 2002:a17:90b:5825:b0:381:dc88:7c09 with SMTP id 98e67ed59e1d1-38e1afe7912mr9768145a91.33.1784192870620;
        Thu, 16 Jul 2026 02:07:50 -0700 (PDT)
X-Received: by 2002:a17:90b:5825:b0:381:dc88:7c09 with SMTP id 98e67ed59e1d1-38e1afe7912mr9768095a91.33.1784192870090;
        Thu, 16 Jul 2026 02:07:50 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e4fcd31sm10601985eec.4.2026.07.16.02.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 02:07:49 -0700 (PDT)
Message-ID: <3128bff0-98a6-44d7-a390-27537e74e9fc@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 14:37:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/11] arm64: dts: qcom: hamoa: Move Iris IOMMUs to
 sub nodes
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <63t_fLehIKEom4-JPN9kAGFEjUG4_yFoHMhB2aEAppwPHb2oPbK666eGkGgXxEAHRJnfTRRUwuf2EqNRYe_gjA==@protonmail.internalid>
 <20260709-vpu_iommu_iova_handling-v1-7-72bb62cb2dfd@oss.qualcomm.com>
 <5c8af0d5-2477-48ca-bd7c-0f2475a9dd62@kernel.org>
 <xrfd2dbhmpiy7ftpztcswba6iyzt3dsajqtr4fpq2iyn6tbeny@4wijspe7n2ig>
 <00df448b-b492-4c85-bba9-84753825c265@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <00df448b-b492-4c85-bba9-84753825c265@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JeeMa0KV c=1 sm=1 tr=0 ts=6a589f67 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=Rdlk7PUvzP16AkN5vSYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: WaPGYkUBzyYqzKkhW_Yduijd2m19VMxb
X-Proofpoint-GUID: WaPGYkUBzyYqzKkhW_Yduijd2m19VMxb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfXwrtRnj4gkvEf
 /jyYT4DW/YI8rzdCjsRxa45ytxztz3NuLzuOBv0cTeotKLvnhgzD2QJk810T4DriK4UjE4Eq405
 EffPwbJH5r2nC/J3QsVaPTwe8sduIAM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfX9HSfSz1a/AY1
 sfnWPC7+S2dLzObj53WdQWueiilhmBaeI9LB5RIgRtEqA0CFUedD+xcIG0C/xhevUwSD3l350sh
 7bpp/xJ86xoeImqD3ZZaoya4G1dnVdASvNB8viU3i6admSY6z6evXCQcRnAj7cKxmORGiRwOIJQ
 wnirOgdUao4cuEchYH3EpVqABj5syI0h0suVy2JkEfwu8UJwYux6GKi9TR/GwM/QlzyeN6V6vd+
 ItsUtXm5K5UxWm0E550HFd+DCpxNczzJPfLcL44Hf+33yNeMAzYWUJiySWJDJjrPtNv23gBom8S
 MS8OGFroJP8UFZ7+x6fn8W7XXw2DsTFeoPvIsyeLG08cG1PjC/P1B76F5Pa0P0TLoPOt5Hcq+8y
 CE0D4pDI2D8/DAniFyZVbynp1xPP4lLSAbvdzMZRxDTSf/Os8W5URdfKZexF3fcoCAj6VcLIsLQ
 5xiqk3QzOD8gm270zsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160091

Hi Krzysztof,

On 7/13/2026 11:32 AM, Vikash Garodia wrote:
> 
> On 7/12/2026 5:49 PM, Dmitry Baryshkov wrote:
>> On Fri, Jul 10, 2026 at 11:46:58PM +0100, Bryan O'Donoghue wrote:
>>> On 09/07/2026 13:35, Vikash Garodia wrote:
>>>> The Iris VPU has separate streams with different IOVA constraints. The
>>>> non-pixel stream must be limited to the 0-600 MB IOVA range, while the
>>>> pixel stream can use the full IOVA space.
>>>
>>>
>>>> Using a single set of IOMMU entries for the Iris node does not describe
>>>> these per-stream limits and can allow accesses outside the supported
>>>> range, which may lead to device crashes. One such issue was reported 
>>>> at:
>>>> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
>>>>
>>>> Add non-pixel and pixel child nodes, move each stream ID to its
>>>> corresponding child node, and add a reserved IOVA range for the
>>>> non-pixel stream.
>>>>
>>>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>> The thing of it is, this _is_ a bugfix - perhaps its not one that can be
>>> backported, actually scratch that, this isn't possible to land in - 
>>> stable
>>> realistically.
>>>
>>> So what is needed here is a strategy for fixing -stable.
>>
>> I think, we need to start with defining, which platforms are affected.
>> sm8150+? SM8250+? SDM845+? MSM8996+?
> 
> All platforms, including venus.
> 
>>
>>>
>>> That could be apply Daniel's patch and backport it with Fixes: - with
>>> mainline then say applying this change and reverting Daniel's patch
>>>
>>> or
>>>
>>> That could mean some other solution for -stable - up for debate - 
>>> what's not
>>> up for debate is this series needs to _address_ what happens to 
>>> stable for
>>> all of the target platforms - and then transition mainline to the new 
>>> and
>>> shiny way.
>>>
>>> That could mean
>>>
>>> - Applying Daniel's fix with Fixes: and cc-stable
>>> - That patch needs to be extended to _each_ Iris platform containing
>>>    this bug... all of them I think.
>>> - Updating bindings
>>> - Updating DT with new method simultaneously reverting Daniel's fix
>>>
> 
> Ack. The proposal seems a good way to me addressing stable, i can work 
> towards this.
> 
> Will wait for couple of days if there are any alternate suggestion on this.
> 

I would like to seek you suggestion on handling for the -stable branch.
The approach proposed here is;

1. Pick the workaround from Daniel, and mark it as Fixes: and cc-stable. 
I have the series ready to post considering for all _iris_ platforms.

2. Update the bindings with subnode, and at the same time, *reverting* 
Daniel's fix on mainline.

This is due to the fact that #2 might not be easy to apply to all stable 
branches, #1 would serve as workaround to fix the bug in --stable trees.

Please suggest if this is fine with you or any other way you would like 
me to pursue.

Regards,
Vikash

>>> And I do mean doing that in one progressive series - a fixup for 
>>> mainline
>>> alone isn't enough.
>>
> 
> Regards,
> Vikash

