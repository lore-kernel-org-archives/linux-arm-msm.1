Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2889E3BAD91
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628354; cv=pass; b=RM9IGmyHPsZUMlTBHsAjCucx+ehmyvA0vMgvuGTcJhikt+9/WUzdWE1UJgZ9P7efqmg5dkgvLupO9IngaPrnCF0UyblaYVP7VKWeHkpa/CEA2qoDJFMomdU2Fw3XQIhf9KJqwrD7J4305XB983mYQd9YcPq9LG3bklyEiysQsUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628354; c=relaxed/simple;
	bh=n0yBTMshpFZlGg7db9X4vZDxErgZuny/8U46+i1ShN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bNCwVd9x0xAVZCi7p6t2074NfNWYD2kJE89Yh8XUz8MVj70E77Y+QVp9SKs0noMK5EIaCFfjDFYiM3JXStsBpI4nDH6QQ06RdWusJ3su3B2WUC94sCcprgMXZkGzJtIXqX5rABFb+VGtya+bIjBw9ZtyH5W+K8uHpqFGAT5wzOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hKwZv+nZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H4hWlv6B; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hKwZv+nZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H4hWlv6B"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L8etSH037544
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x6gNNW2gqfgnrEYy1fWa9wYe+YE7XcQW5LYcNmSzPFw=; b=hKwZv+nZ24qtvWOy
	a9u7tvqYoR0GuhtwHWwOG/Tod6jPXokCHZm3rKXak6VwkQI1ZeDItzAMObn6O0mw
	1W1Zrx9NnoienRuehJ0TvKcmMCrGxjLORzacSM2vpIazfayOtDn/AoK5XQUsEUmp
	qEISJHlrfh2DRXuZULDhze9Dt192KXP25Iv2fX9edarYslQLPJn9eYQ0OAWYczf2
	kzofe+crDc83VtMQbePzfjUGfhQVr3k4aNc2821Oh+phYTUUq51I3zBTnAI+pUwk
	nsR1EAPwKwKAaVCHBEwwoF/Z2u80DemvDYiFFQTyiCWNKV8cBBz/H0MdnmM3wqDD
	filx5g==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1es1ner-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:05:52 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81e6ae12b42so116672837b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 03:05:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784628351; cv=none;
        d=google.com; s=arc-20260327;
        b=kI7onHbnxCmOubN4RoVcoy6CkhQbSYufF9l1rpvJmoyYoae/GrRkxL19Ck5blIX0ew
         Zeh/PX0PNrYjOKUyt/cwDHbmApBJh2Sx81rrUxjP7pBWRknkMTxtHsFS9rU7I9iNbl9Z
         hgRFI0pHRia6PbK4d3e8Khbc2xJ6f5q5WcTYoZFgRN6vybdua6gLTscujyjsVQC3kTPF
         WYts6IizPgghqvITKcwjUqVubsP2nRZoNlM1ACspvpdueWJoYrWfckqs4Y/Vaf8tGZRS
         buNwRN4P2bXuDb/7w3+ylay0P6hNyC/64lUXoXZS7E7rtz/G6PUZJ5v4q7jTuZa3oi0c
         W7fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x6gNNW2gqfgnrEYy1fWa9wYe+YE7XcQW5LYcNmSzPFw=;
        fh=7cRw+Z014P9Fx/tltqbRjCKptSSwH2qip3hE5QCaWCs=;
        b=Yjw1ueppSRVk3HQy8kCvkqxg2ARQVzQX4KtRBi1YpJq1NVamaqyi9x99PNFMxGL4TK
         nyCo+T4aB3IZhHwK1RnVjo45/twuST31jsDKJOH752Q1yGTRnErHfLTHxxSab5UX3bX0
         Oldod5ScikjkOwg0SpwRqj26rFkwm9jsKxqd8WTIYWRk1ORPbHHLYsAI7f05UvTmx7Lz
         Z6Msn6ZLqPzP6j6U4VfBN260FbVHT0r//xuqeaBj8NIPuo54Oxno+rOgb1yxkPy++WZM
         DqkCyMmIZUTDPRpjeFYKrSTrRT0yAs9/GjltCEsMPdtaXGTkPEwYV9Vg0NZAS4PT0CVE
         6zXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784628351; x=1785233151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x6gNNW2gqfgnrEYy1fWa9wYe+YE7XcQW5LYcNmSzPFw=;
        b=H4hWlv6BTjDFlt8keXPJUCryDSYjrSpWB19QAECfr0qyzG/qvDYwn7xmG6z4hhHtrd
         hZOeMmRQWYW4ymoJyrTDOAClH+vzU/kF7YZNR1bufPnqTZLlJHzUK/HsuC0K+dWzbtdU
         GB1QiVnLxnXZWlcD7Vg85Wb8WCqt6dpmvGoWSq3BX6utrpboWd9CTpNl2SHIsHrjRN9T
         oy3am6XB8RN77WpTdqtPcSzDhnilXxsjI2ywismfgIyJjNYAXXESVwUgqaWpbCDDVwHh
         ESdb16MxNPxdXeSI7kOqzT3yLIpFP6nWllbZqgqvY1xiqjWeK4MLpfELTUvVt7gn0W6+
         Tf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628351; x=1785233151;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x6gNNW2gqfgnrEYy1fWa9wYe+YE7XcQW5LYcNmSzPFw=;
        b=J2TIgURUEF5BMrIsm2zTTdHuN515ESv8wOEJKqOa1awwq0bRgsTE3cmnWWmwY5qvft
         91Vya2lxqBQ+O90mDdkgHqOuBPTDCWe7l5yvq5t4BSfOMJ7sHIStNrTCvg3O4k6jryoo
         FSfkQ5UpymCjvIorznrhmOY9enQ+UolmFGNCJ3xE/TaA6OI4hQqZRdXRLDX08cHXXz4d
         O/CtNEDqjTHIkyNJj4RacKgNHoEl59w6MW3Gko2Z2I5tNWRIxRKzPNcTKzHHH1+f8qpw
         j/qTn6Gy0oHIejHnLPZJBR8aYhdMayssUVaEaCGSOexXk5n0pWAGGCxALrSLcXIraEUt
         8XnA==
X-Forwarded-Encrypted: i=1; AHgh+RrV/NqeQ2gGC9h/M2LrFZszE8kOyQVW3sawfgbdPunnyH7xDprykwLwcET1e7YkirVxerebOxE7ByTYdZ0L@vger.kernel.org
X-Gm-Message-State: AOJu0YwV2ItwMJpfnC/06dttD8bntvnwuOifptNkVxyZP5tJw+wbawx3
	44g9DaIYYUVLKgA7W7/0i+tbj/Td4u+Nkydauue5++n4jBxl4QJ++1pLQM/KzMBcxc4mMGDHTbd
	NmhyQz+XHxiso+opoWKZMhHcuXN2DSC8lQjJ6a2YzITvIo1abfO5SYztysnj3kVSqVTAVWTS0MY
	Uuoiet7HdtVPfC1eOhQ/q1D/QgBuRVWlC0yGx4VcfiU+E=
X-Gm-Gg: AR+sD10yZVKs5jjzlKSpQh71zG4r86mKtVXiPNXVp1Z1gXEUQSp2T1Gc7Pr1mk4zz1y
	drTaQ+Gnvf0G9sOOCgZwEEDZK6yUCzlVLu4J5FoWxhOwltl90z3hOLDFjmumECYH75/FTqz0zqE
	hJ3cvNiTS6b5pRPM0vDQknPO30S6EQ1C8cU1U4lcr+JQ8000UTJGqVHqR/Gg==
X-Received: by 2002:a05:690e:4507:20b0:667:8b90:2ebf with SMTP id 956f58d0204a3-6683bd9492emr3251832d50.94.1784628351322;
        Tue, 21 Jul 2026 03:05:51 -0700 (PDT)
X-Received: by 2002:a05:690e:4507:20b0:667:8b90:2ebf with SMTP id
 956f58d0204a3-6683bd9492emr3251824d50.94.1784628350952; Tue, 21 Jul 2026
 03:05:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713045811.484554-1-sumit.garg@kernel.org>
 <b967394f-b1ee-4718-8629-b5814b4e129d@oss.qualcomm.com> <CAGptzHOvBZP4sC5+Tp0rCzCuJFU5szBPeCETbxrsQKkY=pNwkA@mail.gmail.com>
 <c588861c-bbbe-4f30-a503-c9c04d9361ae@oss.qualcomm.com> <98d6d638-bc5c-4a4f-b587-44b61df63d34@oss.qualcomm.com>
 <48619593-777a-48eb-8c7b-cfee1492376c@oss.qualcomm.com>
In-Reply-To: <48619593-777a-48eb-8c7b-cfee1492376c@oss.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:35:40 +0530
X-Gm-Features: AUfX_mylwDR3gYjcg1KFl-1ReH3x0AF_Hb5KK-SF94QX-t5CpbPthu-tSvR-QFk
Message-ID: <CAGptzHOphS9aFvF1aDdsjHXQOCp5eUZuiqwj5FcYE4YQ0eBq=A@mail.gmail.com>
Subject: Re: [PATCH] firmware: qcom: scm: fold tzmem into the qcom-scm module
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-kernel@vger.kernel.org, bartosz.golaszewski@oss.qualcomm.com,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=SPZykuvH c=1 sm=1 tr=0 ts=6a5f4480 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=TAhuZtUEg-GAQ_V2xbQA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: gF70ASGDP1btUBHzrihiN6iVRmjq0cPC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwNiBTYWx0ZWRfXxNygXU756+T0
 Q2Xzc9705uWgjfzR7bH1foZ3bylXnfnbRBgM8wbyoyMdCFBHV4uLoVdrWTNVkU7OZv1smxaGpzX
 dbxn+Xq5JCV1oKP4kWPDGCyVhY7NfuVElOwdSuRmPLssooWI/RclEAkXT7RzguSsDfwpWmHXGp1
 roeRTjb6GHl419MYO8CLh9H4YyppDwH+svFtehex1E5MjtaFZqdGJiumhsuTZiauFArX4iAdBkY
 dSqpSgD3/LiltnRdjFPd6gqb8NVo/+V64UfzI7fn1jaX0khNXom3Zlag08IyRXtZvwravp2n+Vf
 P+7slhi9Vrjzy98TxtzoKgkXueSjYUJysJtcFN3HboFUeDVO3y3/9XeRBqtnubMehZvpi0KpW5K
 p5BuTFykYKqx6eM/b6SWX33r3XgzJx0zmg3H8dk3mWMMJsLvECftk+k5l1gCs0hSmYW0yrrRRod
 lDhWXktWwvWLOBHS6jg==
X-Proofpoint-ORIG-GUID: gF70ASGDP1btUBHzrihiN6iVRmjq0cPC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwNiBTYWx0ZWRfXwTjuaQL+mJHe
 7RcyPckHL4QJ3AuV8oPJW1g1x4T0wQKHTeHlrLCTr692Xf9SI7NR0/EA8+hSaihwmj4xS4gqf80
 q18K0aSOKcW13k4KFlcfu5dDOq6OWPg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210106

On Tue, Jul 21, 2026 at 11:24=E2=80=AFAM Harshal Dev
<harshal.dev@oss.qualcomm.com> wrote:
>
> Hi Sumit,
>
> On 14-07-2026 09:08 pm, Konrad Dybcio wrote:
> > On 7/14/26 8:25 AM, Harshal Dev wrote:
> >> Hi,
> >>
> >> On 7/13/2026 5:05 PM, Sumit Garg wrote:
> >>> On Mon, Jul 13, 2026 at 4:07=E2=80=AFPM Konrad Dybcio
> >>> <konrad.dybcio@oss.qualcomm.com> wrote:
> >>>>
> >>>> On 7/13/26 6:58 AM, Sumit Garg wrote:
> >>>>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >
> > [...]
> >
> >>>>> --- a/drivers/firmware/qcom/Makefile
> >>>>> +++ b/drivers/firmware/qcom/Makefile
> >>>>> @@ -5,7 +5,7 @@
> >>>>>
> >>>>>  obj-$(CONFIG_QCOM_SCM)               +=3D qcom-scm.o
> >>>>>  qcom-scm-objs +=3D qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
> >>>>> -obj-$(CONFIG_QCOM_TZMEM)     +=3D qcom_tzmem.o
> >>>>> +qcom-scm-$(CONFIG_QCOM_TZMEM)        +=3D qcom_tzmem.o
> >>>>
> >>>> Does it make sense to squash the kconfig entries too now?
> >>>>
> >>>
> >>> Sounds reasonable to me, I can do that for v2.
> >>
> >> What kind of squash are we thinking about here? Moving the TZMEM_MODE*=
 choice to
> >> QCOM_SCM and removing QCOM_TZMEM? I think we should keep the QCOM_TZME=
M Kconfig
> >> around for when we boot with OPTEE and want to disable TZMEM since SHM=
Bridge is
> >> QTEE specific.
> >
> > Hmm, fair.
>
> If you are aligned with not performing any Kconfig squashes for now feel =
free to
> add my tag:
>
> Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Thanks, I don't have any v2 plan for this until I get any further
comments to address.

-Sumit
