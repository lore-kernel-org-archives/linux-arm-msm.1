Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF953B6362
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 03:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789528156; cv=none; b=TTbDCeljLSnI1ZurDCXVeAZR+54EnVv5Yl84rmLlffYBFK2QqibYfS5TG0KdUlshwK7Gx3e/c0NemGttqKaih/E9U8T5z+FhegL5eYMHqGIVZZODhs6Van4hgBbynqmhyXvtzqxr1uCZ7GwdIRbbjwSQMIc4A5+9ZFmowzdcnZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789528156; c=relaxed/simple;
	bh=yM62N2H1bOa/X/eOm9XfJAW2/IsPTDWnjWPkAJTwNSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WxrYcBm8WNE3Pgdr0eb0WUKN9HSVf9fW2lCVRBTeyaDRv7725wfdykCNNAzWve24D+Y/lMHxbeKGZYNQKKLUK+iS4ARFO8iyyKBlFf+5bUBw9SpeZP9OJPaZYBOACwmpFPNFmNNLVPK/v/5b4/g1ADdEeI00aicOr0qGPYU15/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C2+SAIH3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IYgCtG97; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C2+SAIH3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IYgCtG97"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYfuT721173
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 03:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ag/Pmmtchq8t/DVKB8xq+CT8w46MUWWfnfZyBXqWQgw=; b=C2+SAIH3viTGtLwt
	anuftS1UbBrRY8f6gP9mjistQDrN/AsiOiQf3x41sBtkTrxkv2qkMlbOelS7+vFH
	IxyGug34Y/8nBg3B0mKx4XygsIaqK+JD22LiMRTr4Iy5BUaoywgK+ha9vuy514bj
	Yv09UMS81I5PGX+OFQalGYMrKhGXhHuKYqG+0r2uQCrnEHQWgGabyWsvjY/Q0Lao
	VN5Lj1mSx7kknMqcLPpKj1pebCw5TB3fCq4/rVDxP2uuD8c9A8X/6FqQ3xbfhJMO
	olYD8haiGPL22qeTSxSnAJ5yAO7Drp62KAgx0RiblKph5ca7GqEBIgHXjfIu+Iaj
	ZhKE/A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9t0jy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 03:09:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381250979d5so5929211a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 20:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789528152; x=1790132952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ag/Pmmtchq8t/DVKB8xq+CT8w46MUWWfnfZyBXqWQgw=;
        b=IYgCtG97oCtgCwa7XV+JVsxNC/SVkSZfYICs+eB8xSAoGbzIHsWLwTf44jDRZQpXSV
         vW/3w7r0iSIls7L7DvyVSv2+mq86/HVSVnGTzhF/9UdIN1XO/4ttOIMTC+5WZkan1T1r
         udpsWj4YWdgmIKBzy0vWpds8+cGrXnA8q8w/zVtKzh3d4iBLU31FkY45Y4WuOXwo9cYv
         nSfFLxFuK8Wz1a8Ekv6+1waxsKwQm0D6Ct4kmsOpQYJI05VHodh8intXVnXvfqyIs404
         Sfq9ck2MdnLPMHVA0kT1K0JmaC2QactnZv0ux5OYeE+B11i15fXqtnpzkydD+gKCvwai
         /W+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789528152; x=1790132952;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ag/Pmmtchq8t/DVKB8xq+CT8w46MUWWfnfZyBXqWQgw=;
        b=Cal2CqewQ6Qa4a9cSUSsOzP/OO/WEaf5np+LqWuDEwymqJF5/0tYWTuqm/RDrdEQel
         7RszhC/fl2ke0vkXRY4Hs14jHBtJtNcpeRRzO/xpId9BkSdvn17VecNJEIhcJflJh5ej
         Sp7cGm5Q680Zx45S51wYfSMqToqJheRqKP2pWlxR1ihXXcb+cdnnSNsSGbPLfrVUTQui
         hrrfDdODooCdspkvNg9mSuS2GLMdql22yrarYLE73QkZNOwSfuGmLGMyYS1o/khGdS9V
         daSHhm0vHS4lzMwiySt1oV+/nYlO2MlHBslJu95zG+1xUR25lLsAvKy6mqbORVcguciZ
         bwtA==
X-Forwarded-Encrypted: i=1; AKwUvBziefFh568oYTbXOQNVLfnsqvL28azO/ioM5Pc4VnPq1uNR1H9q6dLWUvSxyBBiV+KS0LL6yW+GhAn30iuR@vger.kernel.org
X-Gm-Message-State: AFuF++mR1SADZ2fNPzs9k5SgYmCn14M0raLQPUdSMf5RKxSNwSxfsfAC
	Lcrz/gbXjHjkWSZsM+BQRCE3I38uP5AmzNNVH6OsScfHmrJtxexCTzG+qsiO1TyMJDgP1+Y+YME
	acvGPRloQV3pPITc+/Blij6fUyLPyWFBthd6ZDEStCWmlp4+10U/XLJFmdzQpAKwkBqBw
X-Gm-Gg: AYBFou1XJnAK5rU3mt+XPYJ9/BcYDT366cEj+Ukrd5csPziLcbZ1mJbgvB+lCl7ILy7
	CMp4/49t62t6s6oF1Mz63YkzptFRHjTDXViN6ACwoYkUMYl0kQJ8bPtHZyjfa5tARDQnUl6vr0/
	/7b1n9dUYbMp2IbbbQ4cgdz2ocaw1QVE0RESuOqsbzFPlDn+GlDcVJCKkWCwueon0KpKTtvKvnR
	9VslJ3RJyQ2uVJDZK2UG2bgU/Ar0jC1V3Fn9t961qFYWc2S1EjH0n462Yw1Soidf18Kxht03Xlr
	OHwJOHqYbxFK8sTj57S2zJLOZULru6o2KMpCL4MGvenu39B0mvIckUsEsNn/2OfELDoXocFvu+6
	hDtCcQ2zpxA64lYlKq004yrbyYfX8I7jz8M/+WPrn94UaiII2jASR2V001A==
X-Received: by 2002:a17:90b:384c:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39e1e48a0c5mr2015608a91.16.1789528152098;
        Tue, 15 Sep 2026 20:09:12 -0700 (PDT)
X-Received: by 2002:a17:90b:384c:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39e1e48a0c5mr2015526a91.16.1789528151476;
        Tue, 15 Sep 2026 20:09:11 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5e40494sm3191996eec.15.2026.09.15.20.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 20:09:10 -0700 (PDT)
Message-ID: <6257c447-788d-4362-851e-0d552bcf7c56@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 20:09:07 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: qrtr: resend HELLO on MHI resume
To: Vlastimil Babka <vbabka@suse.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Daniel J Blueman <daniel@quora.org>,
        Linux regressions mailing list <regressions@lists.linux.dev>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        Takashi Iwai <tiwai@suse.de>
Cc: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless <linux-wireless@vger.kernel.org>,
        "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
References: <20260909055846.16539-1-daniel@quora.org>
 <hcr4woicsnz3pbhzlguuwjlego7yli3znhjmsx4cdz66xa74zd@wjtle2yslc4b>
 <c99d9feb-0a19-4f8d-915b-c2ece401e3fa@suse.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c99d9feb-0a19-4f8d-915b-c2ece401e3fa@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aaa0859 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8 a=_wE0MnXGkHm9nJMVzvUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: RuAy7KS3n3kmwT1HI4kZ48SEl6mnIPHu
X-Proofpoint-GUID: RuAy7KS3n3kmwT1HI4kZ48SEl6mnIPHu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA0MCBTYWx0ZWRfX8qB9tfg7uft/
 ddUNVyTfzNKaBuaLUJ8DoxBKZBwrINg+KgwRghKp6rLrbVcskdLRb0RHt3qQLHmQDIFhE4BBFUp
 lS/BE8ytqG3QDs67etJ4ghkKCRddEIMkKkKgQTIdZwOv++xUfv5ocn78wubBmDnbqe7z5niS8cJ
 ShIer3MPl1a9HBxxF3Uu/GkDEhIQto8OrE2xE8AGkjsR2MlPjYElMQ0W22S1Pm6MGYHjuWb1sGj
 GpyqlAQfUHhelh1qicyRarxkYqFSshFT1O9r2x0fn8qi6cXXqhf/MzROKmKH8iHdsTEXyp2F8MO
 V54qI5rH7m+JShkgCTFws4qEToF914h288ToHfrNfWc3FKqh+B+2PMjhXBbCp0MoXqkJI4NJuGt
 h6omOUFEi/qfjcydo2YO8aHT/GU8j6C80iKfSvVSf+N+sD3kscnURLS6BgITFcU4G2RziGA/YDx
 CwikvC/mQGR2p8ItSRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA0MCBTYWx0ZWRfXxgkS5xC++tTn
 TnpACi7QIYhtCldKvkMZMUpp6vvbIboGOOA6wLeTwgpHUxkFjGG67afuWrP6CUxeCZxtFt16U7G
 s1JrjkZa9PKJ/hAlCSXPcty5EH/5Uzs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160040

On 9/15/2026 3:48 AM, Vlastimil Babka wrote:
> On 9/11/26 12:44, Manivannan Sadhasivam wrote:
>> On Wed, Sep 09, 2026 at 01:58:44PM +0800, Daniel J Blueman wrote:
>>> Since the MHI HELLO exchange was relocated, it is sent only at device
>>> registration. During a suspend-resume cycle, the firmware in WiFi
>>> cards such as WCN7850 indefinitely waits for another HELLO,
>>> triggering:
>>>
>>>   ath12k_wifi7_pci 0004:01:00.0: timeout while waiting for restart complete
>>>   ath12k_wifi7_pci 0004:01:00.0: failed to resume core: -110
>>>
>>> Fix this by triggering the handshake from resume_early in the MHI
>>> transport.
>>>
>>> Validated on Qualcomm X1E-801800 on Lenovo Slim 7x across 10
>>> suspend-resume cycles.
>>>
>>> Fixes: 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint register")
>>> Signed-off-by: Daniel J Blueman <daniel@quora.org>
>>> ---
>>>  net/qrtr/af_qrtr.c | 13 +++++++++++++
>>>  net/qrtr/mhi.c     | 10 +++++++++-
>>>  net/qrtr/qrtr.h    |  2 ++
>>>  3 files changed, 24 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
>>> index 78347c937af7..2ffcfc2fdb4a 100644
>>> --- a/net/qrtr/af_qrtr.c
>>> +++ b/net/qrtr/af_qrtr.c
>>> @@ -623,6 +623,19 @@ static void qrtr_hello_work(struct work_struct *work)
>>>  	qrtr_port_put(ctrl);
>>>  }
>>>  
>>> +/* Trigger the HELLO handshake after the remote has been reset, eg on resume */
>>
>> Use proper kernel-doc please.
> 
> Please prioritize merging this sooner than later (it's a regression from
> 7.3-rc2 that would hit people if it made it to 7.3 final) even if it means
> fixing up non-critical aspects later, or by maintainer upon merging.

Concur. I recently fast-forwarded my ath tree and picked up the buggy commit,
so everyone using my tree is now affected.

And just want to point out that many of the function comments in this file do
not use kernel-doc format, so I would not consider that a blocker. But it also
would be trivial for the maintainer to add.

I've tested this on my HP ZBook 14 where I've replaced the OEM Wi-Fi adapter
with WCN7850...

Tested-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

/jeff
