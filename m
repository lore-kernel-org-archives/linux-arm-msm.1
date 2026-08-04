Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3C046DFFB
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 16:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785862317; cv=none; b=F3eyNFbmHe/KgigcuwzmirIaqdGf+sXWk/h4muVqnlE2Fe5u5+M3YT8Wo6wr4Q6etsYS2e9ZOwP6Pe9dV9+EQrnbiNP+wekpu2FNDWgKiWDO03q4uaBClJPkM1Hdy3S2HctKBAnKiWfHL2cg4ubBCCPy1LlP5u31mZbLMy4jnIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785862317; c=relaxed/simple;
	bh=+0iaAebDZTu2n9MNDfpOO8xO2Pql0lKsfUHfy+zph+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OyOIxuM/8QlRFJKM8H9cDzMhByeOzGIqQQ34Mz0wSVJE29pbkkDx3sjNIpXom1V79eRZi+lLTV6rb7JE7zoPdTZsKAcwc9uPiMjyUGHkawXNwZM1QJrlMAcKQDa6untz3rq6mw86uJ3eKI7lQPFqt8GHsxtR6g/EUJLYizAcaUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=USmE76bp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I6DHe7KO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="USmE76bp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I6DHe7KO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674FfbuF069636
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 16:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HHenXeOrbWY/SXqKB8NPQYcUSj7j7mcQ5KUAGFCPsmY=; b=USmE76bpPNJK8Afy
	RPzOs/hbkq4Bu9+FeEHNf0bY9K7FOskdpOZXryrD6DSwvq9CTPY4el7gf/1gqtzc
	mkH95U5WJYCoNin3u4F1R17l1A6h1xJQ9Ic48LyuNLBA/8GDhs1JaOVuqnCkjtVF
	q5kLU6dAZACitTB6JjGFsrl0Z7Uzl5C9Is/YPJooXyOyjqsJXOFZw9ajT12Tcp1+
	15yK/NCWf1X2Zbh8r1zmdgL/bIikTlbRdrCqrERCPiWjcbSIGYjz6RNzpc7GWXow
	/LDMidhmjeImiWV6D4UskguKyUTQ4taYL+Q6tAA87jWvqYqaoLXtIO6C8Igh8pyF
	z2D+ig==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu5hquuda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 16:51:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca124bf0189so969042a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 09:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785862298; x=1786467098; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HHenXeOrbWY/SXqKB8NPQYcUSj7j7mcQ5KUAGFCPsmY=;
        b=I6DHe7KOBPOyp6ZY4K4HQcp2tcC6KA6Vf2yrjJXTPlWhyw1ImNWZktn7lnbKVr4zMM
         svK9euDSlf6l57VnLPWFRKFbz77Vn944XWdk7LSZmlda+55h38RCfXEGcuQ1FFcob4fe
         7r76PLGb2Amx0Ba7WELtafu48LdXqWsvaRrZSzfn916scqQKUVu6bA0I9w7IfQEUYtUG
         hJQFcSTyUK4C20O0afS+8uw8Fxe4azrVOxao8L6M9qrSFZK8m3DKeahevGhXh1EkiJ7+
         0NJYnPQX6GRwbSkH4hceuoVad92Q5wGbHwE22r0IrU0m9DaFfyBrhLKNJU7/IVoUuCrm
         0QnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785862298; x=1786467098;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HHenXeOrbWY/SXqKB8NPQYcUSj7j7mcQ5KUAGFCPsmY=;
        b=Oah0qQ3WBnCRhppGQFEaqir0GxDbZetTHjpGKoTiNZK7dmljSkEiNe4PqR2dsTrSD8
         ufXRPqI0DhCcnT3J5U2CHLj2EP4+hvSPLwYATwdwx7imN99Ih+XtMWJcrHsp4UUzwlNh
         beomNaYNELn6cYUk2TVQ611bJ08tw2e6own8Z+FjSaXL7ahJWkwMgr2ITxcdU1FYQBj8
         HMb5S+cFcQhFz2aPGt8/OdlAC46p1sj5F8eSoV+O59VBulGSWrB/wLSMPJBF8rctYkho
         Jgqs5N3k0mcYa1XhEMB67SNxSUzdFCUVeqhNtDgHKprMqIi0aYg9+jF8GflfnDtlX/qY
         aRPw==
X-Forwarded-Encrypted: i=1; AHgh+RoREyHP9NHNqrJaQn6I5OCed7lSlfeIQfPJLSZ0qxikFxTiH5+BGTv8mv+xKtuuAuPjeCgYWcm/SjUJeqsB@vger.kernel.org
X-Gm-Message-State: AOJu0YwzUQu8v5rZ7z4yy/XyCPkaesYyj7BKHBVsu+X9tJiF7zdHGf9v
	2P1FHkRkMSFLA/8oQIBDo0LoK1eyZRUGJifQKc9B/xsEsViV4vo3WtfE2KgWvisXv83eBKdbeRe
	4cLL3GWq43sVBR0qWVevloKcBRQBUeHafomo1XicutJUnEoob3Zq0ORDeovJthaQVtsGoGDXgDm
	zm
X-Gm-Gg: AR+sD10Ht7n7mSO8HCVeOcifpzv2SxpbdBZVyMtkxisB7YJHjQjcGyyhzALBu5xK4EC
	afF7asg5XNT4GQGdCbR+MiSwqHm2bftxuQFO42JkuPsae+0PxHOM4pSFMzxHrLtX4bX22QpqVKN
	cfVDuRHdBtxlAP4KPdaHWbhEFJK6Cnp4LxtWljMwnlG0a9ms9x192PyvR5cbms5kLaTMqJzG2du
	rPOnxSHq3til/3fvrXqCZ1Y7zN1VW0VO9zYLmXjTd4ol568xH2guyIsXgE+sz0/BwnSWjt/F9zj
	gYumfPvbjA44y9BSoq4A5qXkbhwYfVHH4Y9V4o9FH+9oQdejuQYAHVPF9FDjz1Z5W9LsDagIxnh
	wdNm3O04T6zOc/hQn9knbsDPE41mYrhaCVuwuI0o+JmGIwSvB06O+Zg==
X-Received: by 2002:a05:6a21:138e:b0:3b5:530d:d96d with SMTP id adf61e73a8af0-3cb859365b6mr531277637.12.1785862298434;
        Tue, 04 Aug 2026 09:51:38 -0700 (PDT)
X-Received: by 2002:a05:6a21:138e:b0:3b5:530d:d96d with SMTP id adf61e73a8af0-3cb859365b6mr531229637.12.1785862297948;
        Tue, 04 Aug 2026 09:51:37 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca50ad27sm4971328c88.2.2026.08.04.09.51.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 09:51:37 -0700 (PDT)
Message-ID: <3ce8f794-3582-4d69-8b7d-1f7c10689a0b@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 10:51:35 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Flush the posted write after writing to
 MHI_SOC_RESET_REQ_OFFSET
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alex Williamson <alex@shazbot.org>
References: <20260623145134.43976-1-manivannan.sadhasivam@oss.qualcomm.com>
 <cc4bb54c-fee1-4478-af17-8b48ed379210@oss.qualcomm.com>
 <af5gbjoe5eswhnofzsvvknt7dfqbgyfs4kjkwzt6viivb5vwte@wjs7pg54szz7>
 <6e2fda2f-ce14-4f81-b848-9fee4e6a221a@oss.qualcomm.com>
 <jmyr2afsiqml7pkz6jcty6gsgq6kchfkwebj4dkqtkutd2zafk@iifzpmhngrrf>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <jmyr2afsiqml7pkz6jcty6gsgq6kchfkwebj4dkqtkutd2zafk@iifzpmhngrrf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEzNiBTYWx0ZWRfX0mwnYrmxhlOT
 jw/qKzihup3RiWnH6kBmU3JBmvbFL9iDnjM25dcISKPeVhSsEPVX3Bukndq6ra2TbNhkRgz9trc
 jbWPlJ80Cd8kpBVmaCcbKzoUIFfflDs=
X-Proofpoint-GUID: fym0qf8WMfW4U-icmG4dZFouep79y7OA
X-Proofpoint-ORIG-GUID: fym0qf8WMfW4U-icmG4dZFouep79y7OA
X-Authority-Analysis: v=2.4 cv=EoniaycA c=1 sm=1 tr=0 ts=6a72189b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=ZXrcf1LaNO3NQIdrEiYA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEzNiBTYWx0ZWRfX/KdEUqSIM0Nv
 7yuyGTuicqDM1GCQjfWzQeB8HuM++7uqEzVy1sqEoxC26PPE6PraZrL9ZB5E4yHfQTp0VEMRWD5
 YhVihoVZDVtEtU3DiIeR1YJM1VqQKpT7BNrQ8GpG/Y3831RzTMqrrVH+Qmt33jtXt3mgYj0+IV6
 eLLk9bf21A+nTbVsOFSYYLhKvN6jI+9dVrgz7UKdDsTlDaJcrLUc8kNlsZ7WivGr8h4RAVuW9uh
 g8QUA5si3PbHLmJymZ/PvD9kyr6dY5opWJiVHS3GU9h2BbTDFk3BkDlyxJN7Q4lFDHK9hz4rXG2
 dkL0j0nuVFitTB41dDwmLnvY82MPj2BOOZZ+kWtKrl9AVWjGhYsP2guDfCUZ4Jt/9YRDq0VM4BJ
 9mTKJBTUnWIzkyMg6VADOa0xd678WZY/MxvhtkUU7m6UUYCLnTEeDzYwk4LucoQI02q737+Uaki
 4xt+c9XjcBzu11nfmfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040136

On 8/3/2026 10:57 AM, Manivannan Sadhasivam wrote:
> On Mon, Aug 03, 2026 at 09:57:47AM -0600, Jeff Hugo wrote:
>> On 7/29/2026 11:19 PM, Manivannan Sadhasivam wrote:
>>> On Wed, Jul 29, 2026 at 03:07:00PM -0600, Jeff Hugo wrote:
>>>> On 6/23/2026 8:51 AM, Manivannan Sadhasivam wrote:
>>>>> mhi_soc_reset() tries to reset the device by writing to the
>>>>> MHI_SOC_RESET_REQ_OFFSET register. But it doesn't do a read-back to ensure
>>>>> that the write gets flushed to the device before returning to the caller.
>>>>>
>>>>> This may lead to the delay (if implemented) on the caller to be
>>>>> insufficient, if the posted write doesn't reach the device before the
>>>>> delay.
>>>>
>>>> Interesting.  Is the delay tight enough that a few ms will possibly blow it?
>>>> Seems like a poorly defined delay.  All the devices I'm familiar with take
>>>> multiple seconds to boot (with some variability due to ddr training and
>>>> thermal constraints), and if the reset triggers a crash dump, then its
>>>> easily tens of seconds.
>>>>
>>>
>>> Which delay you are referring to? RDDM delay which is just 2ms? Yeah, that seems
>>> questionable. But this function itself doesn't implement any delay. So your
>>> comment was somewhat confusing.
>>
>> The delay at the caller of the API referenced by the commit text - "This may
>> lead to the delay on the caller to be insufficient"
>>
>> I looked at the thread referenced by this patch via the closes tag, and
>> while I can follow the virtualization flow, I didn't get a good view on the
>> specifics.
>>
>>>> Regardless, since this reset will either kill the pcie link, or disconnect
>>>> the SoC from the link for a time,
>>>
>>> No, this will not reset the PCIe link AFAIK. PERST separation logic available in
>>> the Endpoint should make sure the PCIe link is active while the SoC is
>>> undergoing the reset. Otherwise, if the host tries to access the device config
>>> space before the device is ready, it will blow up.
>>
>> Reset separation (PERST separation is one part of) is not always enabled.
>> PBL won't enable it as it requires loading the reset sequences to the PMIC,
>> which is outside the scope of ROM.  So, if you have a non-flash boot device,
>> or a flash boot device that has a non-provisioned/otherwise corrupt flash,
>> the EP may be sitting in PBL from cold boot without reset separation
>> enabled.  If the EP is then passed to a VM per the related thread, a reset
>> will occur, which will take the link down.
>>
>> Also, if I recall correctly, automotive products do not enable reset
>> separation at all for ASIL reasons.
>>
> 
> Ok, I was not aware of these scenarios.
> 
>> If the link is down, the upstream component of the EP should complete the
>> read with an error, not cause the host to blow up.
> 
> If the PCIe link is down and if the host tries to read the Endpoint config
> space or BAR, most of the PCIe RC integrations in ARM64 platforms return AXI
> error instead of the typical 'all-one' response and that causes 'Synchronous
> Abort' on the host. And that's what I meant as 'blow up' as it will crash the
> host kernel.

This feels like a PCIe spec violation, or at-least undesired behavior 
from the user perspective.  Maybe a DoS attack vector?  I assume you are 
specifically talking about Qualcomm MSM Arm64 platforms, and not the 
entire Arm64 ecosystem?  I don't recall seeing this in the Arm64 server 
space.

Do we need to talk to Joe about this?

> Anyhow, the motivation of this patch is to ensure that the posted write gets
> flashed to the device before the delay. But I'm not sure on how one should
> address the concern you raised on waiting till the Endpoint reboots.

Sadly I think the user implementing the delay will need to be aware of 
the specific device they are using, and the likely required delay to 
account for the various scenarios that device implements.  I don't think 
we really have the infrastructure to make this universal, and if we did, 
I'm not sure a blanket "all MHI devices reboot in X time" is going to 
work in the long term.
