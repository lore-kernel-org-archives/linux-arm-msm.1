Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEB5368D67
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 10:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785754434; cv=none; b=obbKZxqxS7mzD4DnCQ6nPrRZGdWZozgQ7Xj8m914TXNL71ufK2A4SKKrA1ICEnfqEFDD3yGC2JOKae0rWU5pLyMoolncXQbW8Nq7+Y/ThfHP4lkm0t33oWyvu5RT3SkncsZ/dTX7aPyAd69HMT9iP0zjzV58NZsJ0Yj0+4fmPDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785754434; c=relaxed/simple;
	bh=W4pjUQoMEum1rTBka7R+6cyJe1uJzGSmpQoSoqotukY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ERJwASlLgphyn6Fbv4NaBHMO1Ba+fqINcVY83X0izodF7+A5IRof25Cb5V/D6Fa5hhzcrCxNYqboYYvp3H+fdi20Ls3yxlR2Lz/Twz3ytddFSmqzVxICEyhieBsdIArauV60/e95ZFECtvKxPjCSxfRKb8d07s1CqjqfWWJKsE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eiVC9egI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FLDkX6H+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eiVC9egI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FLDkX6H+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673AYu1c250911
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 10:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eL2H0jG7cWNshG9pGpR0BK3e3nbsXkAHLazXPY8v5m4=; b=eiVC9egIHMMMr92n
	lN+F0/F8ujtHP6bInwATQerx1UVy7WsSWQfNyM54hSY6Y7bW6QQZ0oU1PD01qnGP
	olkgnM5/ullIeDEBC7ewLwQoYKtWO6Q4pzcnOtc+2HUKrlkjgOR3TmP4KcnZKHwR
	aBQ5k2x2RE7dJ2MdkSdq/mR9KQ+2bKyBS5ItBLGeFbp0DgpVCuZ0fVnb43ommTEd
	ld1RRpvIQrMiw9hHTZDVi0EOltfpfEc5ryCQ4CHsCVHOvhWuD24QaQ86ILNV6TL6
	0MCUPFE+EEdd3ljSsMOM2qMik8zKgyRLpzgRWFIa1KsexykQ/+VYlkVbpxCyRv6h
	M12fcQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrd952t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 10:53:52 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so5126182a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 03:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785754432; x=1786359232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eL2H0jG7cWNshG9pGpR0BK3e3nbsXkAHLazXPY8v5m4=;
        b=FLDkX6H+W6vMICMpDZ7iP76IztzTo49HJxInNuV13WkdwDHQzigD0q4Yv57SSgm6de
         JFXCWsZQvuLUVgkvmTwNXOfDboa+3EmY68lBj66lKjunHrRm2fYcJjrAOV1JsFk/AZrP
         xiSwsYM6ldfYMHt/cvOPJI1uZs4q0ZculuoBOQ7rJhe/yXRvcEueeJlaMVPJjkg3BkQu
         MiGQECdI5X0eSP6F0sgO3IBYz+ymqubPJEU5r6zUnboNruaprjBtEely944ozVLntWax
         /aTmit5fZms1uiTFLz0ONsD6pkPLnBO9nQ0QqeNultr4VAYz7FDDO9pU6qYJp+gkkX1j
         kHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785754432; x=1786359232;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eL2H0jG7cWNshG9pGpR0BK3e3nbsXkAHLazXPY8v5m4=;
        b=WMQryxndQQWBbD8zv0573EfiTNLeB4Hviob1oRfK1Lm88Ri3pRchlZY40sCUzt5Y9e
         k4JPcf6gMdXIs+hhbamRo3tTevbteQB8oMpSBiPydPofkNYXELawNidA3cj7Jm4naGKG
         qnInH3ytcLLLyWCqJZU88wH5FtvWBRwTPItA7aM8ClYieKyPsBb1Lbk4gxI4DCf0pHkq
         fnZO2Ty3Nq9zyEb2Z3AtoVy1GxHdKE7KtkTbGkohYgq+xSjR2YpehdDxm/zNUbUjAoKO
         jFiNfoL2fKMYLXRkvPto/xtdrEghrcUFOwWWJvneu06+gUJG2e+pQHhS/Mx/Ag26/PKY
         mxXw==
X-Forwarded-Encrypted: i=1; AHgh+RpVB60k5kZEXG/WuHBmLsM1hZdI3tDSIZp6hwnW+hF69Jp29d46HsUbh5Jv3NUUWkPY7wLIpRgbrFeFOcQt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0qlJ7xP4CO26K+dgXjCCCfrDUMbdS7FmnrMSVKNA26JkOhYj1
	wpXeD+vnl8iYmKgf9d+DeE2n31Q7jQywgGqCkClCFPY+KkeBjE7ED6aPIw15USVIU+ZC0evEO8J
	9D07goa3P4XtcLLaqD0I53tWd4iyBgHT78F2hS9Xb+fupmFQTuXBxpOhiQ3E8+7+7ywBCFNZkWU
	lB
X-Gm-Gg: AR+sD13ULcDNxGEbIf8veZ8bnQFEd1VpnOb85ae1YBF0zWobyy794Du3tg9qGsBt9O0
	b3X7Ajns44VB6t9c626tuSX5O1X08lm9DK8iu2Vq40g46iWp2qoiwO08hWkqcXsOA0+5BjKdJSw
	ezes7t2Nju7r+94qqa3xbI9HiSHldXKgcWeIceb2J85cZrhUoN5WMybTMypV1V9GREmKfB6s40v
	rib2rk2kIoEIfeRvS+XgY9WqBVDP6hec6+hyrjou6cDlIl4bn+w+IsMJP73uBkMysNpCdCmP+Ph
	qSuxBTN/0tmUMY8y1pX1KaQNQypsz45Ix/pYR8DnLPXXWcNwTeLzvo+ZDOquKV48F9/gX6DfyTH
	X+tPzIH3GU9Y6EUbVKQvEmT6Mcmd903tVsw==
X-Received: by 2002:a05:6a20:431d:b0:3c3:bbe6:95c9 with SMTP id adf61e73a8af0-3c92a524e5cmr8551440637.16.1785754431906;
        Mon, 03 Aug 2026 03:53:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:431d:b0:3c3:bbe6:95c9 with SMTP id adf61e73a8af0-3c92a524e5cmr8551416637.16.1785754431473;
        Mon, 03 Aug 2026 03:53:51 -0700 (PDT)
Received: from [10.217.218.252] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153ddda5d9sm44339354eec.13.2026.08.03.03.53.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 03:53:50 -0700 (PDT)
Message-ID: <8a7fa505-1102-49d8-9343-0fce37850b48@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 16:23:45 +0530
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
Cc: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
References: <20260720-master-v6-1-671261b05c61@oss.qualcomm.com>
 <amZkf3lu7gjWhw04@zenone.zhora.eu>
 <0c0d1406-949b-49ee-b203-3833b9f8433b@oss.qualcomm.com>
 <ame2tX1RwOo4F6Lk@zenone.zhora.eu>
 <cb1e00ea-658a-416b-aef6-46c151d15685@oss.qualcomm.com>
 <amh5l4Yvwemws6Cx@shikoro>
 <fc90084e-c9bf-43da-bb8b-43a8d2d0cb7f@oss.qualcomm.com>
 <amoaEGX8Q4zwHF2i@shikoro>
 <be5ba8e8-15d0-4fe4-a66c-fe7ce8da6cc3@oss.qualcomm.com>
 <amuy0mdHQlYCcRfb@shikoro> <am5e6yBm-4ZH1W27@shikoro>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <am5e6yBm-4ZH1W27@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX7eNlDrO4fPUx
 YjubXDGWYbabyYBzuEHFzG/KQTyCfOCDAX3xyDVcHJBeT6HUMSGkVmmxNYQGxQ2WzVpaaspPxua
 IHJOF36Hqva0BQX6Jqjy3XBAdMXZMfA=
X-Authority-Analysis: v=2.4 cv=f/94wuyM c=1 sm=1 tr=0 ts=6a707340 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=wk_Bz9T5fIWzqFoZPV4A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: BASY9wTLTn8wMcj_0RBws8WW0VdoC6j_
X-Proofpoint-ORIG-GUID: BASY9wTLTn8wMcj_0RBws8WW0VdoC6j_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX6uHcuBEncbnc
 Ov9Z4XgK8byMqJcZ5HmZ20/8agbH09WPFLDWXiQGTI8k0HMt5xXLGJDg3EJB3ItqOqrki2nBW6Q
 zXOAxmtCXO4GRJlTvHOtnlhVR2p6hbNFRxOS2f7pMZ6tVLSVJxpl/qgc12DezQA9Lno1a4bTbgn
 ryOVtn74mkaNP10E9ef+5dTIG4RBhGDyixd/Cz0H+8XOCL1A0VKWTaFtIYdK9bfC4rFAdeRpKNM
 xW1BBDT7xBuRTLLzpVlyKwiRbtIwMbFEj7dYypH3gmoetPk+ATVXr9qsx77tWRKgoLoy7RTX83Z
 4wekZsQdFPmSJ9Ki6BEiWME9/c32o+CJf30LP4X3jscRNsPnd3DgIaV0C+aV7oYxD7SnBjjWvIJ
 dI4OjGIC0E6Ki9oLaegM7QzmAH5cmcsEY15Hp8V+ecH5Z/KcJlG1oQt+hSCqmyj+fI48ktF6Q9D
 uYk4AUlB8yDlBYqIzHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030096

Hi Wolfram,

Thanks for the suggestion.

I'm okay with the Kconfig-based approach, as it would avoid regressions 
for platforms that prefer the existing static 1 Hz timeout behavior 
while allowing controllers that benefit from dynamic timeout calculation 
to opt in.

I have reviewed the patch series in [1], and my understanding is that it 
does not directly conflict with the dynamic timeout changes. My series 
calculates transfer timeouts based on the configured bus frequency, 
while the referenced work focuses on dynamically changing bus speeds. At 
the moment, I don't see any functional overlap that would require the 
timeout series to be based on top of it.

That said, please let me know if I'm missing any relationship between 
the two series that should be considered before posting the next revision.

Thanks,
Aniket

On 8/2/2026 2:32 AM, Wolfram Sang wrote:
> On Thu, Jul 30, 2026 at 10:23:46PM +0200, Wolfram Sang wrote:
>>
>>> Given the feedback so far, would maintainers prefer that if i drop the core
>>> helper entirely and keep the dynamic timeout calculation local to the
>>> qcom-geni driver or should we continue exploring an opt-in core-based
>>> approach?
>>
>> Well, I suggested a potential way in my last mail (Kconfig option). So,
>> what do you think about it? Does it handle your use case?
> 
> Another bit which may be important for you: there is currently a patch
> set under discussion [1] to allow changing bus speeds dynamically. You
> probably want to base your work on top of it and/or help getting it
> discussed?
> 
> Happy hacking!
> 
> [1] https://lore.kernel.org/all/20260719-i2c-mux-v12-0-a5010d623a57@gmail.com/
> 
> 
