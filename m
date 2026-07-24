Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E303E9C23
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883576; cv=none; b=MyjauAai/cahyKGuSOcdmPDVWWPP048nnWOFmQHbweQNoKfag/Q7LjRIvC+c5A6F/JDBwgbikHBObqPncYSIJL88+N607rKON2uHvJZhrPdEeIBUyhYFGFb2Kjzr1w3IplWkfjm8aPz4vUooChLs2TqyHxcc3i4qcxZnHY2W390=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883576; c=relaxed/simple;
	bh=Hr21Ef44C0/l40hmrk4Hk5UG55mypQWcs3OpQwMQF48=;
	h=From:Subject:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=bJB9OLZLTH2xEoJg7L4I41a0Gl2pyb0KG2tFnCSEPelTIWcad3A1fdXy8Ic0fO04Xc7bbghir0z46bvlf/HFcVhv/PnTtsgLFK1nqmgxMfkf7WmrawpxJp14AyLNYCadwkSobwXRo0L+ALYeWVv1U/G9XtoWNhacslsX0BEp5o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FWBta0Du; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d53tylHq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FWBta0Du";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d53tylHq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lpDU1993084
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:59:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SyOBQsoBBSbgjvpJBtVfWA1ADD8DzVhTrrX4jNO1Klw=; b=FWBta0Du1TQITriF
	OQi0m9KBPmKgQ0PDkUsFJC9+v0Hm4LOm2hNsEHUBIdW4XEFugNjuoA7RZ5JCbjRz
	zsAdd5lsgtTTQoRrZFovAlBLGiTJg6cbbPUVv8ZBvMeVzQmsQy2cmMUMQKhk+ypR
	dBEzSj6xbcqAj4OoMVC0wb09PmLLTq6LhTJc2yEKCWo9h6GBGtOlKZP+yDMUfL4X
	xVmLNinuM2Bu61YG/aTHsyzaZPBjuSWlcqVJKsTOsKdoCqdABhpylWOSUYHywgU5
	NAl3sQoBjS3vnkmZue9r84AHAyAi4cpVX3KvvR1S6ls2DLJ5cUPYmpPYkR/KcbQ6
	wmmI6A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0p50yx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:59:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb6dd278512so166795a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 01:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784883572; x=1785488372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:content-type:in-reply-to
         :mime-version:user-agent:date:message-id:references:cc:to:subject
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SyOBQsoBBSbgjvpJBtVfWA1ADD8DzVhTrrX4jNO1Klw=;
        b=d53tylHqYjSJ7GAOaFSoKJzhvTOEarl6YhpMqQUJ4jNeP9EV1elhufSMVovaY6pXQF
         fFClB0P5C+sTkabY5GmVbP2PXUeVAHnZufkQJBNXRFCrcbrSMVLhnpP8TxIjGaRbdbJv
         ISVAm7qF/uzYId9IQnlcxc69LW1fFZyTx1rJd1MHAGMlI4jrXuVawgWYnriwY4HHuQtv
         TiJIlK/H5ppLjgji+XQaGyjfbmnbiwXIMyKYnHEeyL3YZS07Sq2DqLKfOBD0kRuFWtIZ
         jvKg6FnoKgjQdT763WRsE02H7DqD2iMdEeI3+NVPqEQq3FEMldg4nM8dSH8XSRkLJHKU
         C8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883572; x=1785488372;
        h=content-transfer-encoding:content-language:content-type:in-reply-to
         :mime-version:user-agent:date:message-id:references:cc:to:subject
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SyOBQsoBBSbgjvpJBtVfWA1ADD8DzVhTrrX4jNO1Klw=;
        b=OhTa5OZc5vdVa2A4KaHt7gMUcQyEeNK/0hare/y/ct5UUPTIpZYZlaxo6PQ6oopRiD
         a4W4La8xpcSTgNhN250QcMUdfpOAXrpZdVgYho9WqDY+ZAPQSimzSVDRmeFbnjlCImuY
         3Bom1G3fVovM1q66cby7YdZpiONDkqZJB14AgsoSHS7FtLUnX62mZOtfac9IT5Ya9JQK
         fn+uWxtWw+4oEBX0D3OZ107VfUoXvbFIyRM4TMWCV6tqGsyUfpqrtaVtVW+gRWtGw2sl
         F00K+QzOAgiFUnQ0H8jwI0N2fkvpRC5xr2mdyLn+qiTKczLi9uVAfmde+mgQjMUpKCXV
         5npw==
X-Forwarded-Encrypted: i=1; AHgh+RrRmZX2GHsAuEUnc8X6M/knEpikGhbay+Rw8B931RcjtMeT8Bgi9Pdc5LZgiVMtsFZYtrmoojdZ5+qCawU3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1qgY5tQMsHgCXsbxUZkDu6TevJ1WfDaRL4of8pTc82zxbJ3d6
	GpsoGvrOJZ/VAXMnyqOLTFeh8+jYQyJgngIej54vuGRwYJmMBIr6TzrB4dMtYPC/oegn6H15hY2
	yu1ZzXMEcruhAOi9XK1EBaANjdLxu8ux4xmHvnJdoV0Xs3FyWTulY9/Bw+XN1az6jhVgFLgpaBF
	Lo
X-Gm-Gg: AR+sD12sjOIdnVj27cklM7fW+cLKVmiJXC/DPnPyfNjWuIH/RnR7Yyd5sWSKyVs8m3z
	rdazm1Mk1LPup+VnpXSzj8dMI7P8mnfNEPgIxXeuiVEK+nm+co3E9/OR+/kZM9zP9tbIReoJzrG
	7vOLAB5/Pq4rKU5xV4AMXo0wxtWGNt7U3vfbyPVh29J68ZJnw9JPxvi2zz14duwC/uEAE26+LSY
	3LjIhSVfQRS747XAK0wVjduj3RKK3phLjbksO3fL8ljheGKbN/fn1kqeKQerv7yVSe3V6MA35yz
	NYS6tcz8NWDCejnu9gBfe6vEKLz93pETc1f+4x6uhhX7AM4Q0bKnAl6EYdBD/h9cKKBdTqx6jeO
	O/UX0w9B9yhVnzksyI9d0nemmqE8=
X-Received: by 2002:a05:6a20:c79a:b0:3bf:a698:ce4d with SMTP id adf61e73a8af0-3c44b244083mr7319268637.54.1784883572457;
        Fri, 24 Jul 2026 01:59:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:c79a:b0:3bf:a698:ce4d with SMTP id adf61e73a8af0-3c44b244083mr7319243637.54.1784883571908;
        Fri, 24 Jul 2026 01:59:31 -0700 (PDT)
Received: from [10.218.4.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f0eb2edsm4048097a12.9.2026.07.24.01.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 01:59:31 -0700 (PDT)
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Subject: Re: [PATCH v4] mmc: Avoid reprogram all keys to Inline Crypto Engine
 for MMC runtime suspend resume
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Eric Biggers <ebiggers@kernel.org>,
        adrian.hunter@intel.com, quic_dmukhopa@quicinc.com,
        quic_rampraka@quicinc.com, quic_nitirawa@quicinc.com,
        quic_sachgupt@quicinc.com, quic_bhaskarv@quicinc.com,
        quic_gaurkash@quicinc.com, quic_sartgarg@quicinc.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260116121004.1829223-1-neeraj.soni@oss.qualcomm.com>
 <CAPDyKFrOHqStZbsye9Quk71UGkzUxOkwG9yAGYFVvt+=nMJSyw@mail.gmail.com>
 <20260122011417.GB946159@google.com>
 <CAPDyKFoPVeu3xe7ZAxBTNFfHmf=f7OZ3iUG=pRG8mD=UOGNVPA@mail.gmail.com>
 <3e04735c-ce0c-b2b6-508d-57ec363b8894@oss.qualcomm.com>
 <625d16ec-052b-dfb2-61f4-bf0404297f28@oss.qualcomm.com>
 <CAPx+jO8rUwYV6q1-RrA4aZ9XnomSf82fgf8Jh2fUC0fE03RFPw@mail.gmail.com>
Message-ID: <4fe3977f-74a6-e74e-b217-2b07e4ad1151@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 14:29:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAPx+jO8rUwYV6q1-RrA4aZ9XnomSf82fgf8Jh2fUC0fE03RFPw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Pq6jqQM3 c=1 sm=1 tr=0 ts=6a632975 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Y-QaNR4vB-fFdNo4IRoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: zmiYblk9hwzcP8CORGLySFRkiFmQ8ige
X-Proofpoint-ORIG-GUID: zmiYblk9hwzcP8CORGLySFRkiFmQ8ige
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA4MSBTYWx0ZWRfX7iGg4o69WAqw
 yI63/1adpGR8dprJgTVyVRUD/L04pq48cY3X7jZ6FQ2UaeE6oNAvUQAiqdMHz92JcWS6dVuDSyi
 cDL7mrx8SwFBqHL9BnpQ3LFpp6FOLys=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA4MSBTYWx0ZWRfXwmTWcQODCWf1
 dbys2ZeAnYwVwrYvhqd7/hNoBE8FvWRXYG31trUL59VPXTyAzH+9J4tQLcD7VPA0HOj37nsPIPq
 JHaAn9LdeSZwlGgH3HMcQBKMdszEQdJni//Uu7mlrcTw65s/zvzaRT4ixkaOLgWodw3WGjyfyCt
 fyTYz/UyRv1RjQXLLVvKxsDXHR2IBkSqHcTmOYzZ5B0wZA4eBqgg8bfNKHHuDjwcl50MGi+Eb8P
 K9Qm628V6EjCJISFrMGVcS8jZyDc/TFdQp5G3tCDx8YocpU7NQhup7+n2zAM229i6YDg+n6Scbv
 QcndUDroWlHXlj5yec/uBSmlh/xt2lH9ajjTUh13VyLN9KD8aKcQWKyoRn/QbL91JJJ6a2VDYN+
 6up+xqqoBts/TjfymyQ03vEoPtDUgJ/kDAd3BnWLbKs+obYYjWM2FtQ9QTUX86VU0MYcGJmhqU9
 d0pFVCzF4Tq6w4icpAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240081



On 7/6/2026 6:30 PM, Ulf Hansson wrote:
> On Wed, May 20, 2026 at 12:50 PM Neeraj Soni
> <neeraj.soni@oss.qualcomm.com> wrote:
>>
>> Hello Ulf,
>>
>> Can you please help to clarify? If there is no more modifications expected
>> then wanted to understand when this patch can be picked for mmc-next.
> 
> Apologize for the delay. See more comments below.
> 
>>
>> Regards
>> Neeraj
>>
>> On 5/14/2026 11:26 AM, Neeraj Soni wrote:
>>>
>>>
>>> On 1/22/2026 3:44 PM, Ulf Hansson wrote:
>>>> On Thu, 22 Jan 2026 at 02:14, Eric Biggers <ebiggers@kernel.org> wrote:
>>>>>
>>>>> On Wed, Jan 21, 2026 at 03:12:43PM +0100, Ulf Hansson wrote:
>>>>>>> diff --git a/drivers/mmc/core/crypto.c b/drivers/mmc/core/crypto.c
>>>>>>> index fec4fbf16a5b..a5a90bfc634e 100644
>>>>>>> --- a/drivers/mmc/core/crypto.c
>>>>>>> +++ b/drivers/mmc/core/crypto.c
>>>>>>> @@ -15,7 +15,7 @@
>>>>>>>  void mmc_crypto_set_initial_state(struct mmc_host *host)
>>>>>>>  {
>>>>>>>         /* Reset might clear all keys, so reprogram all the keys. */
>>>>>>> -       if (host->caps2 & MMC_CAP2_CRYPTO)
>>>>>>> +       if ((host->caps2 & MMC_CAP2_CRYPTO) && !(host->caps2 & MMC_CAP2_CRYPTO_NO_REPROG))
>>>>>>>                 blk_crypto_reprogram_all_keys(&host->crypto_profile);
>>>>>>
>>>>>> As far as I understand, calling blk_crypto_reprogram_all_keys() would
>>>>>> only be needed for those mmc hosts that lose their corresponding ICE
>>>>>> context during runtime+system suspend, reset and possibly during
>>>>>> ->probe().
>>>>>>
>>>>>> In other words, calling mmc_crypto_set_initial_state() from
>>>>>> mmc_set_initial_state() looks like it's a mistake, as it has really
>>>>>> nothing to do with the card's initialization, unless I have understood
>>>>>> this wrong!?
>>>>>>
>>>>>> That said, I would rather make the mtk-sd and sdhci-msm drivers to
>>>>>> handle this themselves, by explicitly calling
>>>>>> blk_crypto_reprogram_all_keys() when needed - and drop
>>>>>> mmc_crypto_set_initial_state() altogether.
>>>>>>
>>>>>> For the sdhci-msm case, it seems like the only case we need to care
>>>>>> about is for the reset.
>>>>>>
>>>>>> For mtk-sd I don't know what is needed, but possibly Eric can help out here?
>>>>>
>>>>> The comment for mmc_set_initial_state() says "Set initial state after a
>>>>> power cycle or a hw_reset."  I relied on that when I added the call to
>>>>> mmc_crypto_set_initial_state() back in 2020.  In the following thread it
>>>>> was also discussed that the code was intended to reprogram the keys on
>>>>> reset, not runtime suspend as that shouldn't be needed:
>>>>> https://lore.kernel.org/linux-mmc/X7gQ9Y44iIgkiM64@sol.localdomain/T/#u
>>>>
>>>> The comment in the mmc_set_initial_state() is referring to the card
>>>> and not the host controller. There have been some similar
>>>> misunderstandings in the past for other functions in the core, sorry.
>>>>
>>>> In any case, I have been trying to understand where the ICE context
>>>> really belongs and recently Neeraj answered that question [1].
>>>>
>>>>>
>>>>> If that is not what it actually does, it probably would be appropriate
>>>>> to replace it with something else.
>>>>
>>>> I agree, the comment(s) could deserve some clarifications.
>>>
>>> Hello Ulf. Do you expect modifications in the comment for mmc_set_initial_state()?
>>> I am sorry i did not follow up and assumed that no more changes are expected in
>>> the patch but i stil see it is not yet reviewed or approved.
> 
> There are a couple of things needed to get this merged.
> 
> 1) Please split up the patch into two pieces. Let the core change be a
> separate patch preceding the change to sdhci-msm.

Ack.
>
> 2) Clarify in the commit messages that the register context for the
> crypto profile belongs to the sdhci/cqhci host and not the mmc card,
> hence re-programming should be managed by the host driver itself.
> Typically that should be done from the driver's runtime suspend/resume
> callbacks, even if that isn't needed for sdhci-msm, it seems.
> 
Ack. Yes this is not needed for sdhci-msm.

> 3) To avoid breaking the support for mediatek drivers, I agree that
> adding MMC_CAP2_CRYPTO_NO_REPROG as proposed, makes sense as an
> intermediate step. We can look into the mtk-sd driver later on and
> clean things up properly.
>
Okay.
 
> 4) The call to blk_crypto_reprogram_all_keys() that's added to
> sdhci_msm_gcc_reset(), gets called once during ->probe(), is that
> sufficient then? In any I would prefer that we don't use "#ifdef
> CONFIG_MMC_CRYPTO" more than needed in the code, so  please, either
> add a new function within the existing section along with a stub
> function or - if it works, call blk_crypto_reprogram_all_keys() from
> sdhci_msm_ice_init() directly instead.
>
Ack. Yes the intention is to re-program the keys only if the host undergoes
hardware reset. I will post v5 with the clean up you suggested.
 
> Kind regards
> Uffe
> 
Regards,
Neeraj
