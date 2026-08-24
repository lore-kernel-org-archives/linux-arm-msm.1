Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543EC37E310
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787552934; cv=pass; b=hCa6KVTV+Wv/qnVWsy1kukpGO0qS7emedq0N6TbE3n3/91NrllxDRNQllLzcf0tzSpOAQue+Y6ZqMAmJ6Nr4TNZcn3hIT8EXS5l1NoXX8hZ5cZOmT2UunjXp9es11NNJt3aHKM5BpVYTVOl+e6ZXm4/UijdiF9k7qAZkTHNAZUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787552934; c=relaxed/simple;
	bh=8tQHV/73xtSPfe3J7XUwOfa0NijqGvcWe31f0juGljI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MHLearvKx3kVHJu6a0YSKZsx3doKxE7+SWcN07JZLBR8sNn5qH/sKkH3QU+G6s4N+JmG5JVGBP/tx0AMAfBYMDDyEgXxcwfp3lffqAeumD74G25vltaNQgwRzYbvxYi7I3ztqQhZUvFW1HtIQ4TmC6r5khGHlbTf0Y+xfR72yRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oXZO3xgC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QP0uuoeR; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oXZO3xgC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QP0uuoeR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RPx72602541
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l7lqGvWnslH2LeHC0QphtHUs/rofAEdSxXz59GB1W6g=; b=oXZO3xgCTEnzRx6O
	DCDjysNfCLa7odGctBwh7MOe8QIg27u7XXeWwHMucWEMPu4OA369rNwOG88oVJE0
	8TZHCxRnjx418fatitk1eFIgLogkBD4GQLGgpWZWvjNKZfuUrR4pZUG0pxtuOWhp
	wFksQVkIvhuME/8azW/Tfxtdu4LZ+mJj2xaHVozMfL8OBn7GiWC65sBODI4qOiKy
	2ZwA2+ho6HkAK5f0VHrgfABnnvcWSFHLgei9eLLsiV1EmTF0XI8J9oIqrFDwgm8L
	U1F6yBgwDTUV1sIDG8OrNr7H7JhNvaFEIMTyrBjaYwg5OqSB6s6l5Fq1IZKkFqCK
	xJqiZA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744wwffx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:28:51 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-836c8fc03a4so21249257b3.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 23:28:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787552930; cv=none;
        d=google.com; s=arc-20260327;
        b=LE40qKuX4/Ar+GjGyQj87rZ7Ru6/85LN2Y3sSM70mWkHhjsdsHggqufaO4Q83hH8DF
         L1erRwG43iXvDDxNu66SFAUjwZWKgLzzbPU4yt0GXaOrwNsM5dwRbjkA2zelu1fkThWW
         qnhfBXwH3B8Y9Dts1Wkx7jpSlktFkxv24JOBPJiUzMkG349f8U1grGczTjkiO2vARo4b
         2KSRiYp7ohEkIY0GJo6CPO1hGmHFfnG7f0Ea4cwX2t5tfaJvuMmQ2sf4oUQ4fZKtbRhB
         oTjIN4IynRvLPTNDQNKaKbjoISoIfcxab8ob5dUNlIJlZ8Eme9+vxpcXE9gtD0FUziUZ
         yu0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l7lqGvWnslH2LeHC0QphtHUs/rofAEdSxXz59GB1W6g=;
        fh=KP0bHJvJ3QSFJDd/H+N6SlslGL0sbiPx7LM09k6QbkI=;
        b=lJSMZN8s5q43JWvr2+mKS7u3tgWdBuTeRDnP1ZzNuzkYol8u0+C1/M1SGGmhLBOgFX
         5IlSXm8EKD/iIl6q98LMFZzL6z9TfGRAnNjYaYmGbqy4BhmqY5zAv6lHsAFLfgVcNu0b
         M6YjVn2tbyaDPF/8ImqVM+Q8/wB8P/URDTruBLRjk+Of4RIvBqiGWAASNO1kuTp3Hail
         es7GrWEU91i0hNZrUtd8O9wnBnVeGY7WfDokaenHrHocPJz2TtFSYq7JXF3UTDzHOf0z
         eWYin8dwPwnPVQ1qR7aan62XTs3l4UWlmwYdYVc+PliYlgmgc/YCHLzpvXu5G30+P8zr
         RRlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787552930; x=1788157730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l7lqGvWnslH2LeHC0QphtHUs/rofAEdSxXz59GB1W6g=;
        b=QP0uuoeRmU1dn9RGYExjbloly7qLDyMaVBjcZdrE0SRXGrydverdKVWeNJ/gvF38k1
         TRKJTrBcg1DTNMWr1qgn/XLEJBLYESFGNabSc3Uuu3yZpEmo5mjaxFwKa3JUT7DhODk9
         ojpJssoikVP3wvf4e3xzbwsd3pmIxD19ZMpGWAQITewEtJR1xReGI9NXoYQfsNW4CWZU
         23Mf32n7V2Idy4cRaUUOfj5yUQzX3gS5xVxZZ0oF8uiwHhwDgQOmMh6frA7Lo1vyNKNN
         NfX/xrF4AJHtoJSKTkvRux/Jw2RGu7YAjmqxZeaVv6hQdEfsaVZH7VtNpe7+19VV6vC6
         q8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787552930; x=1788157730;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7lqGvWnslH2LeHC0QphtHUs/rofAEdSxXz59GB1W6g=;
        b=CRtrBgjj0n+pWor5FZV9ExbvJ+hRro3MFO00hZAHIXYvvEvByjE3vBJ7w6j3B8I5CA
         JF1n1vg5T6/cQQum4APFM4OMiEekqT1Dhi0PNsM2EiFta7ouATN1ri9ydqGFdAMS74is
         munPNsDDL32wGjCfLDmz/G28GkDvub69cM7qGAlk5ANbbqcXL/aa1Vmrzs/tCUw91oms
         pfWOCwBoMhBvMK2M5QuDK37xPuEfzxQsA7LzSDCANEKbI8pazs3NKV4bitNb4LviAEr8
         2xM5xjB8h6Z1lUnmmzGtW+OJv5/meRKsQyT32tKwdRNz6M50ngNwNjS2mC8QFCJwuoPc
         Z9DQ==
X-Forwarded-Encrypted: i=1; AHgh+RqBMT/rjUeUl29TL2H71hweOdQOR/sySGolv3L9AMIc9R1E0PIT/EsqnbtuF51KNkyaMT3GmgapXfVG0vMe@vger.kernel.org
X-Gm-Message-State: AFuF++lcGAJdVMAwPJiIL2hIOXMEv0DAQFOlGwwf5k9Je2xef+GjaxVH
	+a4KUuhgrRTQ5PpYIBQDCLxTHQGJY0NqFL/rLBUFLX1g8fDrgBU5vDEHq7CXzZBiNHuUko9DXCy
	u3KIKNRYIT+zjL83WeA1QU1f/Ov2e/GhGTb/cezeKaxgAi7Ga3MvXcjmdJEWkhn+kK/uUosS3w5
	551QdLTYg5e1cb20xBFALAgBdYmtQYf91W2FpvmGp986k=
X-Gm-Gg: AR+sD13oowcHIVDcpaXrF80kfubJR6qKNUtUWlm25IB8+7ZaWhLsrzOG3L7gvznxQJL
	2hQovoHsRtc0D7J06UsiWkB3T+R9+IJxcFvkxIIuxoJC7YFbdaTA7XxYqiJidvU7fLSWJ297/5t
	wn/lHamiIIqnbl/TKJM7Som6KJ4gGkfBr6K9VwalOpuXRuiAc1UCJaTPXr4dg=
X-Received: by 2002:a05:690c:c386:b0:814:5f5b:6378 with SMTP id 00721157ae682-849f15b9f28mr79525867b3.12.1787552930632;
        Sun, 23 Aug 2026 23:28:50 -0700 (PDT)
X-Received: by 2002:a05:690c:c386:b0:814:5f5b:6378 with SMTP id
 00721157ae682-849f15b9f28mr79525777b3.12.1787552930314; Sun, 23 Aug 2026
 23:28:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
 <20260701105757.2779738-11-harendra.gautam@oss.qualcomm.com> <20260702-invisible-caiman-of-current-4f9baa@quoll>
In-Reply-To: <20260702-invisible-caiman-of-current-4f9baa@quoll>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:58:39 +0530
X-Gm-Features: AcwNN1UpF6blUC8b5vWuOX7xBCKB2F1efjn6d5UhHwQGZr16LeDgxEiVtbFWdHc
Message-ID: <CAC-tS8Ct2tSuScAr_cD0_LWSY4HnwaxLnONY4-P=r1o1JF48-g@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] ASoC: qcom: Add Shikra QAIF support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: MPpI4zQ_jFkorfKiLr_M0lVaWxhPwmJU
X-Proofpoint-GUID: MPpI4zQ_jFkorfKiLr_M0lVaWxhPwmJU
X-Authority-Analysis: v=2.4 cv=KuF9H2WN c=1 sm=1 tr=0 ts=6a8be4a3 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=aHnwCF0JnfQvHnxt_YYA:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NSBTYWx0ZWRfX2E//ymcJl2n9
 TIzNvnfgQZwrwl1e3Qx5oNlbcBaxFGtDzhfL213QcuRaYRBnbE4AYZSnrVKRN211A4imGFppn6J
 j9MHAouOQ1QfW+VNyk4l2WaBzRIQhd7m4fChO1J67vmh071d2UjrdZsLPZbz5oGzn2CrfBs7Sy/
 iTpZvKaGRr3WJpXxmQysuD5u0VKk+NDB79AcMd83md6qeAAPL+eLgHl4MPMCuGhfGSRXikm6R58
 Wk24YBjSiHuc4RcnYEtgVlojhlOKp1qWsfKSDoSZcqbRMcfMuZ2UsoUYdEeJ76wIaJB5Y5plJNI
 tS0uHBlAxKBAM+ayhtAml4SvD8ltJDGpuVh9bPFZ4MPm4rHP8O/98AsG0FfqKdxzIMXVxc6sGq4
 yxXPHX95AbCmHXW6oerxMAI3QA7AoMj94yhrI+YQZ8XdVD/M/9jFJRol9+RNYHFtZ5Wt0ppRvzN
 g6b04UD9kDdT3z2xieg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NSBTYWx0ZWRfX8AIO+Bo0tCkn
 rFse42nnydcpyb6avXQ056OCA6kdlwjZazc+KGmSDeWACj8EXLvE1PIDwnNS6R5VYPujDKB3haK
 1U2bzyJroHDq8Scl7J/e9efKZ2wKCj4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240055

On Thu, Jul 2, 2026 at 12:31=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Jul 01, 2026 at 04:27:56PM +0530, Harendra Gautam wrote:
> > +static int shikra_qaif_free_stream_dma_idx(struct qaif_drv_data *drvda=
ta,
> > +                                        int index,
> > +                                        unsigned int dai_id)
> > +{
> > +     switch (dai_id) {
> > +     case QAIF_MI2S_TDM_AIF0 ... QAIF_MI2S_TDM_AIF12:
> > +             clear_bit(index, &drvdata->aif_dma_idx_bit_map);
> > +             break;
> > +     case QAIF_CDC_DMA_RX0 ... QAIF_CDC_DMA_RX9:
> > +     case QAIF_CDC_DMA_TX0 ... QAIF_CDC_DMA_TX9:
> > +     case QAIF_CDC_DMA_VA_TX0 ... QAIF_CDC_DMA_VA_TX9:
> > +             clear_bit(index, &drvdata->cif_dma_idx_bit_map);
> > +             break;
> > +     default:
> > +             break;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int shikra_qaif_clk_init(struct platform_device *pdev)
>
> I do not see any response to my comments, so my previous comments stay.
>
> Address the comments and respond to them.
>
> Best regards,
> Krzysztof
>
Address comments, will raise as part of the next patch.
-Harendra
