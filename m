Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D383B71CF
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739973; cv=pass; b=GI7VJRheOqFhSE3j/Azs4AYQVSMke+c1PPlxsnt8+YRPU9zaYKsyqwjhsQBTSfVEcW6d/ttjphMARc87vtPhK44Wz0nK4/YcFLhmRa4lmkAvd5bvB6g6XDeeciWqg42Hc1slpdbdAcdQSN1bZsHRF7IFKR4cA8uc95qL1hzZSd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739973; c=relaxed/simple;
	bh=BB4I9qT32mEHJGGxtBN6lIUg3w4qc7wbOQ30js8tGOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WnUzRjPtI/+CU64FTSlP6hH7YZsrn0msyANkN7SVH30Fq2uptGOYjNRtd/kLWHbDHw83cZo5OT/8RlsDvdbFVNQgXbRlhv9tzkK1GKRAL25tmKB/CJjsHcWVrvzVjGxe0BABdejpMDENCnCPfPDNHkU5wIEJiBAonLmMPaAINKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dEdIsTRI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ohn/C95d; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dEdIsTRI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ohn/C95d"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGa6x121378
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tKv8BpWJYJhT8iWpWEJQD4f+6SF8Bg5QPvkrk4vvVys=; b=dEdIsTRIWfbcs1r3
	+cWfkGJvi5W56c+fcDC86FubbrNajp2EBjifv0GBSv56cvww6p6LF80Thc9iR5Tm
	wrHiFwvTFuaCkfBiKHtwmdzcrI4vK6ew47ogYZenAvyJjfMkJYP0aXmpbusf9HzG
	RlGqt6xcLdYsGDzRMvSYBG3XneXTbURI5cSvSSrPReecHv9fqyrFpGdDDC52f0Mb
	pXAkCEWozFv7RIeNrvKbea0V4TXUGura4db00SzYfAgBlvBZfgsoRgX/gpPesqP4
	HfIYnlz+udgmNU8WruiDYcFKAFF20DpWKSjrZ+KkIg6H2VW65kFoog3PnXbx2hSL
	AXQfqA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smx9af9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:26:11 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-853a9c4c99eso24182787b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 03:26:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787739970; cv=none;
        d=google.com; s=arc-20260327;
        b=drIjmrUJk9krH6x0BltKJbTDdQaTk5oJN26nnMKo120KXcQpy6PAw6NB4DU/wPHW5m
         MhXj2QpN5AdaSXxlWZEravsaAx8eSTdZdhkvPvpWdf0/vy0iYPwaVRIRYGg1BIFgW3m7
         uwDIPJ3LWG8HDaVpYvJ26cVAg2q9M18fB4D8z9OxBqlAT7gGVK7ulPX46QBijohnSlqw
         EZ9b+uwfPiQGxLoYzB6yYgjdBZI1lIaURfJ7xJ7cqYMTD5l04S+FJUZvQrxuMx7JXqs7
         slaW4aU8wI6KbYlTpCRF3GvKh7iZKx4lNeL5+8A/aEbFygAUboxFAskZOfDbPKChWE28
         W31g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tKv8BpWJYJhT8iWpWEJQD4f+6SF8Bg5QPvkrk4vvVys=;
        fh=41bAqA9Z86wrhpcJIhr+7WVn1DveHvLwnoAc9yfvKVo=;
        b=KoCU948aU0oH3TTrkgvV86JRu42PNyhW07RDQ+8Kgxq7D4x/s5qmlOsL93FvP0Ep2i
         +heKjVc7V/IkyUJ6rYLOEh5nh57GH/R+NmYcBjX2Lzom0azyrM6RgkakoYATQu1IA/tt
         BqZVoOXMVlqYd96sYrJGTVw3/AfGXtT9oh7Mr4rPkh4buw+ZkXk8BJFgwMI64dBinZOO
         1Gkb815jvP1l5gEw7sqqQLD4QHn+FYlytqMa5cKb09tdSWtV370PtY+f/SoGnovMHcTF
         4lP93XWRQkzAiDzBoPDIMdzynSYorgGVLU6X6kUMwF0WslnYmpZJhxETKNbuxwdWyxl1
         pV/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787739970; x=1788344770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tKv8BpWJYJhT8iWpWEJQD4f+6SF8Bg5QPvkrk4vvVys=;
        b=Ohn/C95dzsb+SyPWu3i8MLJ+EMEqVS2a+fCqUOtnI0uof+5XFlQplcmdkCH2fyRhTE
         vxXhK//l6spD8VBmDVaCOkRJJYpNtxMeJcL+Zc1kOhEuqm7YmKzoxrbbCnJyyHeeIo7V
         uyfYZdQJggVSkCBcxKeRlvccQ+aZ8b6D5GVfdwQ0v2tuJStace3TBttjqIAE9DSbuU/J
         Vz2eZcJbSBjDo1v0Tp6uPEYt9feFtfQPGKlw0qHHpgI8Q91sQrPihqUVXkB7kdlKvnuO
         ma0X6WnJO8l06Z91tYt0fJN9k46ZrPbrYg/zwEitix2xWRAugSGI/+AP1eCc+jRfkgck
         eEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787739970; x=1788344770;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKv8BpWJYJhT8iWpWEJQD4f+6SF8Bg5QPvkrk4vvVys=;
        b=EcraNW0OMjGry8CDDsDEFZVQ6w/9WyiaQ7k2iXUb5pCBHEfsf4QoYAtEu2msllbDoA
         XeqZr4ggL5DeLOQ9yRyW8ugfNy72njVIOiANYUbaoTkX6yHS6H46HBg95viD6PliLHeo
         tdHa3+RKR5GooJoLFevdVe0khtkJ5B6MIr7SZqo2/9IFxjq0W6SGAj3J3v0PeC7rmzzi
         LFf5O9weAFIxRQEIDbn0ZBgW12rrmlSZ9/X8tYhUgccm2cQsAZVaU+DntWDkm3b98090
         y3mhes4/CC+Pq9Oy6aGoWQ2GT4RH9+OdRXYQyYs1fs+Lzrxu2jGDc3TYajbgSysqaVyO
         mQlQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpadigl+OmEFwfZVMZCTxSBrp4tT3cZWeK+hiJJH/WxNjkIH8rYUGAuPG8jqw6o6cpBpKojfC5Gm0asYqTK@vger.kernel.org
X-Gm-Message-State: AFuF++lMrrkrW1OaXwRn6m5hhhlPcq30L+8tMXaMovth1yU/TAh2npGD
	SqYgFuabkb237Q556EHlXR77UHSmtzerkrcQmKkhNfCwjdFCy3dnur+GnRZP96qJ9367IdN4+p8
	CbAgSXpnhlt4K+3HejY/SsWOqMhi5gACLb2Mc2MGgfnNPYwaFwlrD4SjrpvIwFKS38rCx0hkJVA
	j3YwvCaNH/XxCHDEDdcKumtET68N1FFwCQVecwR7yCp58=
X-Gm-Gg: AR+sD10/ve9gwR9odM1iAYv1WD0ePNqgQoUi6YvFXQHGJLGQdgk6SSW2KFdYRgygCmU
	9qUiQRN06k/BmS6ZLYj4p6fgjKlzM8Yaj57DTE4goHkYzt4sa+oEHfBreazTvjtdOD6gWe2TXgt
	rGyc/1HE07lfVWs+XzeAdEDxvSN4XRGgJ+FbvfPj6UYElNqwZnTPUXwz8IVw==
X-Received: by 2002:a05:690c:e3ce:b0:857:c27f:692b with SMTP id 00721157ae682-857c27f756emr13858247b3.28.1787739969762;
        Wed, 26 Aug 2026 03:26:09 -0700 (PDT)
X-Received: by 2002:a05:690c:e3ce:b0:857:c27f:692b with SMTP id
 00721157ae682-857c27f756emr13858077b3.28.1787739969294; Wed, 26 Aug 2026
 03:26:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com> <CAC-tS8CaVN8YgkUHJVvLcU1xWB3V5dOgS07CHVOBUnPtMjNxTg@mail.gmail.com>
 <08b6fd88-84b3-4b3f-a8c5-dd6bfd39403f@oss.qualcomm.com> <CAC-tS8CtA+wRuucDskRXSc=AHgNdbuq+khj85pFmCG8dGS3Njw@mail.gmail.com>
 <137d4a06-4542-488d-91e2-d338ffb9d47d@kernel.org> <CAC-tS8ACnv2rb0k5u1bLR=EeVtZFXiByke1TFhM_n-WBqJ+dFA@mail.gmail.com>
In-Reply-To: <CAC-tS8ACnv2rb0k5u1bLR=EeVtZFXiByke1TFhM_n-WBqJ+dFA@mail.gmail.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:55:57 +0530
X-Gm-Features: AcwNN1VMs14n7hTOaRexN1JzZTDb-s2xjShYdfLSLJ5Zt-pE_g4L-meUMRCHfNY
Message-ID: <CAC-tS8DYkX8iTfrqqOAXMgczvoDozrVQYT1otu8XH06rXyXvRw@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8ebf43 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=f6IBhYKpExAqpe2A64UA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: vFPbcp3xgDaOekZL9G0GiKcunzomjjqN
X-Proofpoint-ORIG-GUID: vFPbcp3xgDaOekZL9G0GiKcunzomjjqN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfX6RH7qM39tNV5
 6T8ougTYYReJIMafvX11fJHk+N2CfCYeG7W9yezqTbft+9wkGPyk8WfOVQSngMHiFQBfOb4RNn2
 b4qDslGVy4bQesj/qhrxZqI2EZ485/+dU7mIDdXja5njgKfcIgYoz8S2RZ7ptecVRvV0JL0BTw0
 s5r5OlYdLmx1A3fA3ADmLaEUDu8FmMyD0LVFjF+9oM2BqnBtKtdRG3ydz46Lor/GfE7NR0WHmhy
 PSDhVMuF3zIdGMZw66qmIpRparNfXicejTmGS122PoJpXFp1JxJHEL61EWMbXGnvfCXWg6duXzv
 tszpIL//sorVUaNH4oQoK8r2txO1otYTiH6M00IRe16CXRIu6AN1Pmx+/oE6doTFfUneC6XXUT/
 Nlb4C6voGMdsEuxcNI/Jyps/kzBAYrz26EwyNS0kZkZvgci6GTUasw2cjeTOhmT7UUyesGlDV7n
 sGGRzdoHyzmiwpN/IUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfX1cuBX5lkDNQp
 0KWOMmuw7+9L0xU/acy9DHOIJyY0vUAT8Ka0xwNtPzBt4U7JoYQgTW4JPNXgLc44Z7NzW/I1JvH
 MhJQAd2ZmryW+HqpZvE0MfsitEpV3gk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260086

On Wed, Aug 26, 2026 at 3:36=E2=80=AFPM Harendra Gautam
<harendra.gautam@oss.qualcomm.com> wrote:
>
> On Wed, Aug 26, 2026 at 3:31=E2=80=AFPM Srinivas Kandagatla <srini@kernel=
.org> wrote:
> >
> >
> >
> > On 8/26/26 10:55 AM, Harendra Gautam wrote:
> > > On Wed, Aug 26, 2026 at 3:13=E2=80=AFPM Srinivas Kandagatla
> > > <srinivas.kandagatla@oss.qualcomm.com> wrote:
> > >>
> > >>
> > >>
> > >> On 8/26/26 10:39 AM, Harendra Gautam wrote:
> > >>>>> + * CIF (Codec Interface) VA TX DAI IDs -- capture from voice act=
ivity codec.
> > >>>>> + * WRDMA channels collect audio from the VA codec and write it t=
o memory.
> > >>>>> + */
> > >>>>> +#define QAIF_CDC_DMA_VA_TX0  246
> > >>>>> +#define QAIF_CDC_DMA_VA_TX1  247
> > >>>>> +#define QAIF_CDC_DMA_VA_TX2  248
> > >>>>> +#define QAIF_CDC_DMA_VA_TX3  249
> > >>>>> +#define QAIF_CDC_DMA_VA_TX4  250
> > >>>>> +#define QAIF_CDC_DMA_VA_TX5  251
> > >>>>> +#define QAIF_CDC_DMA_VA_TX6  252
> > >>>>> +#define QAIF_CDC_DMA_VA_TX7  253
> > >>>>> +#define QAIF_CDC_DMA_VA_TX8  254
> > >>>>> +#define QAIF_CDC_DMA_VA_TX9  255
> > >>>>> +
> > >>>> These DAI IDs exceed the LPASS_MAX_PORT limit, which will cause so=
und
> > >>>> card registration to fail.
> > >>>>
> > >>>> Check sound/soc/qcom/common.c, as the current indices (246-255) ar=
e
> > >>>> beyond the supported LPASS port range.
> > >>>>
> > >>>> Best Regards,
> > >>>> Rafi.
> > >>> Thanks for pointing this out. We can either add the range check for
> > >>> min/max QAIF DAI IDs in qcom/common.c or introduce a common helper =
in
> > >>> qcom/common.h to validate the supported DAI IDs across Qualcomm
> > >>> platforms.
> > >>
> > >> You should add these ids to
> > >> include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h instead to avoid
> > >> conflicts with common code.
> > >>
> > >> --srini
> > > Thanks for the suggestion. qcom,q6dsp-lpass-ports.h is specific to Q6
> > > DSP/AFE virtual port IDs. Since QAIF is a direct MMIO driver with no
> > > Q6 DSP involvement, would adding QAIF IDs there not be misleading?
> >
> > These are IDs that will be reused across both dsp and non-dsp solution.
> > So it makes more sense to keep it in one single place to allow the
> > hardware description (DT) unchanged across different software solutions=
.
> >
> >
> > > would it be better to update the range check in common.c/common.h to
> > > accommodate both LPASS and QAIF DAI ID ranges instead?
> > No, that does not make sense because these numbering might conflicting
> > with other ports in future.
> >
> > --srini
Just checked the code. If QAIF DAIs are added to
qcom,q6dsp-lpass-ports.h, LPASS_MAX_PORT becomes QAIF_CDC_DMA_VA_TX9 +
1, increasing q6afe_dai_data, q6apm_lpass_dai_data, and afe_port_map
by 56 entries. Is that acceptable?
-Harendra
> Thanks for the clarification. Will add QAIF DAI IDs in qcom,q6dsp-lpass-p=
orts.h.
> -Harendra
> >
> >
> > THat
> > > -Harendra
> > >>> -Harendra
> > >>
> >
