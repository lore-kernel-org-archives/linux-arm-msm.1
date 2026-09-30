Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EF02EEE65
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 05:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790746152; cv=pass; b=LSoQ34zUl9I1z6lheiHRw1GIkwoyhmisNPGHguPJe0ZnpPZRV940DK4mh1YC12nIwk0IVMY1syDRZjU3ceI1ScrxJ2ezVB+eu9jECkfICdp2BLMRJZJ/0zTpoW3pMRzjz8FIQLP4bEXTUfA0YDqTZTeY8+vLozPwll88KT1EfbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790746152; c=relaxed/simple;
	bh=tmkV2mmrDajYN4om5U0hwK0CBQDJGtjxBhnoqqbgOyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jqf3QUtUHu/wF4Gxc0OgjrjhWQLnKXO6LBm9ygoNZRxYOs+RPdQXvVWIn1sszZ6nmpakRcpzxRhuz179N4HuIOJkh0G1XUqnxdBdp5KgxYOX2P2BcZU2GgtGWQlm28YbvqOU8n6AQGym5hqavXSJVF4xdfK0OcqoEbYc8DdfrqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pjSZTXfV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CJoz0vFj; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pjSZTXfV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CJoz0vFj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TNPwT82876889
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 05:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dx/vIXhRvwG/JlTZaI/6ZuIX
	DRsDVwL2S+wzlVM9WPA=; b=pjSZTXfVK5pKLSc2tlWVvF+bggB8RgSlMVso3NBO
	in3EqWupw5bRKnJhOmltx77ioExVOUg90cnrtmtRENoKTecmwXTlD/dow5qZAYV0
	KP9Z+YtGZOTnWcjL7scN/B+8PH8jTT03tEnvuChgp203ZQ12res04g3zUtkKNVYz
	sstctbaGkJoGR4mgQ/wR5hOUrHc6d6U9nf+iRFSZhf7zivrYatuhSAUGUrnNL8nc
	KzSHnJmi3XJlc7oURLU9NnyB7mKBlNRVWWJQ61HWOZRm4MVUCzs/4TnJZ5n5J4Vq
	gnjoDIydEfNEvLzhNSBgr5yCr38lw1JIJEi2yZGsJZfoHA==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0et2bm20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 05:29:10 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67453dc23afso5774370d50.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 22:29:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790746150; cv=none;
        d=google.com; s=arc-20260327;
        b=Wy2Iz0x9bZRi6kNzpmrQspeGwzpBUs31b9/XLPSD6XWhRb6v+96vS+749NXC+Snvlu
         k8oCIBb6fS/XEWWWQ4DUmBsobYgO0rydqAJi3xoC48wQNPslyw2zaJNLBxVE4MqAxk/t
         Kf2lHO4KBZmQlOL+ju5QdFV7wmR+wrcR4FgVdZ2SNND6f6TggAVWmD/YOCnvajtrUXDZ
         qAiMaYdqOzN1EUo3Uo8xHz4KgwtsYTitCJNcEq4dJof4SLP4/Df6XeaxawRTzutK8YDA
         NRq0O9gjGEKXq1l5GbLYb/S6ZbhwzJXLX55TUjof830DlXqGIyDhlkAyWME1pvL9xA6y
         y+eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dx/vIXhRvwG/JlTZaI/6ZuIXDRsDVwL2S+wzlVM9WPA=;
        fh=7thsrLbPzKo33uhi7dowKMAzG3buCW6OXSEeH1tqMfU=;
        b=UU+eLvThiUfpwhrYWobIdJbLhGBO3eNfKPWid0dfYJw/RLNQ9dxFQvqZuaVUBwmj8/
         JOwEHuyc/i7Z3c3wkVlmcB+8z7R3HDVSe6KcCvJIwhHPdBQ16fmY2BaF+iQspC1nGMQJ
         DvjuUII3fdZkA5TmSjIKbdNXOqSlD+8mxMtgWoNeRsQMk9Bks1RWaiX7LBCzn5AyMCyY
         bWxATTew1y/JYPHWHxVNbQHhB9f0S/4e5euDGsxOvBajVGutWaSAihAYLKQprro1QzrI
         m9UQEUHFsvmC5+lCf3MFKlb5ozu/kuRu9bNCfYroKJUHYchCitGx2Dr/K+VORvQ7mrkp
         f6bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790746150; x=1791350950; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dx/vIXhRvwG/JlTZaI/6ZuIXDRsDVwL2S+wzlVM9WPA=;
        b=CJoz0vFjqksus96ZF0nl4mlNfSiDP6EkBClOsXIIYbZPHOBr4FTYHaFN9hNwmxUJ7a
         Qbhr8RG5KZx9CNyWBCd7/2KVdEzPqLzx66D7P89sp2Ga2lt7n6T5tLx9mdW3ER34eRYG
         6k1+xmiZeDX0uSBU/9L1UGh7d0OSXWkX9qrbfC8q0qmBeJtJJqLhFCiiLJ4jbHkvu7Aw
         WjPnkDDrtpEL5oUR3/9zuWeyZFjbQ1UVmoDolqEC0R5ACkvAX3BQRBBfQ0HIVoGhF0v/
         oDJGiVhCa17T7zlADd90hSidopTSjfUbABIRzwPzEJBqF02Yil9qdycNZhc8tqbwaVWU
         C9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790746150; x=1791350950;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dx/vIXhRvwG/JlTZaI/6ZuIXDRsDVwL2S+wzlVM9WPA=;
        b=E99ujedVNNWZwktdtwSb032qMsb07vePFhdUTUXy7no3z1RCAhGFrBjR+NR++LuI/C
         1WNxlXt/0fatxkHVefvWGEAKYyqf8zXp0EtvGAsf8o/IrSapk6To9I0+7BLpoTvJY3gg
         QonKJXHfnRroxBJDRXJJawZFyRqxkcrPae2cj6SYMuT2XA0MH+J2aXi7ophkmKh6kwWp
         tQu6j/08JwCxwtRyO6cvRzjtPMckego7ixQg2j8S+f7xVvBLbL/EdTamrZ/MXnFpuBP7
         FIiNeNJ6d80rA0bKAMoauv3YN5QWvAPd30gvtaeLYruWSk7d2LiL9UWd4MGY7I0xGBtt
         Uxzw==
X-Forwarded-Encrypted: i=1; AKwUvBwqaRP0y2kXexaVMiUlfnccNxNufZREn3kg3Ty6kX0HaR6/EEEg3mT1VycffeUV6LbRgrTnr9lRojRiCKC4@vger.kernel.org
X-Gm-Message-State: AFq9FYJoTqtyiJnuJ+3yomWtrnL60Nm4esD1f44uQBiKyHtidr1DQ+QF
	Nw1NfmbKiD7FpINltgYF2vLwy6o8E1PYLJtMV+YX86i3JW26DgZFwvx+ol3+9wBcxbVytitGf+r
	ThSZos9UOqcAMKfYI7LL6m3tP3hsYiKC6wQeii3tPcCb/GuRUxK59Qvk59SmDZfXb2NNx6RLd1u
	VGHkCQmiYmVrEuNIs3bqnwQV2RInkp7miqGmjZF2hA2ic=
X-Gm-Gg: AYBFou1l5zoRCfeKnvHJ9ZsSIC731Xa7ue1VCywZc0fNEGwSLJKZHURQDyz/1PO1T0w
	c1Y8GiVAteOy5t2uiiXyAGqgg3waUboOsDckIOM9ltuB9IqJ4wPn2aJbNze7pEXCR2Cib8Jdenw
	rXw7cwBoYbpSabMUO6WFoZs94x/3zAn4MQ9VYTGDX1So15RPfLgaadDVBCSnA=
X-Received: by 2002:a05:690e:804:10b0:66d:ca8:bed2 with SMTP id 956f58d0204a3-6768341b8efmr88857d50.40.1790746149614;
        Tue, 29 Sep 2026 22:29:09 -0700 (PDT)
X-Received: by 2002:a05:690e:804:10b0:66d:ca8:bed2 with SMTP id
 956f58d0204a3-6768341b8efmr88852d50.40.1790746149235; Tue, 29 Sep 2026
 22:29:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-b4-qaif-shikra-audio-v8-0-ac618057fe85@oss.qualcomm.com>
 <20260928-b4-qaif-shikra-audio-v8-8-ac618057fe85@oss.qualcomm.com> <35e41446-631f-49e7-83d8-bdfca469bc09@oss.qualcomm.com>
In-Reply-To: <35e41446-631f-49e7-83d8-bdfca469bc09@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 10:58:58 +0530
X-Gm-Features: AclHuK_2UWWBuq0p1Je2wHGBs_QJZlSZJ2ybw4Wpxuz_xTntYkBQ0_fPsF_Bplg
Message-ID: <CAC-tS8CTOcAZ-x+q7mnvJgc1ZgiRLmQgvsqAFWHOK7YLSfCLog@mail.gmail.com>
Subject: Re: [PATCH v8 08/10] ASoC: qcom: Add QAIF IRQ handling and platform register
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: bcCGfdTeeZQNIwu9rtVeVLtZCcfIXInz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyMSBTYWx0ZWRfX6Qx/112FQdES
 qgVqEDAjdGVjAbyEYQdVulhFMLfiloKAkP9OZf21PXE6BfSIN7qyK7u5mdKP2rnzhShByU+xUDL
 3sgPuGg/DRfmQXvdfwgpyniSLvG1dHHgHKah0olugBK7A06qPtAyheBRt3YNDn6YQCBf2bCzYc2
 ByBK+GK1FTruiswWR1sHeKvzXaX4rUNaPfmNaNDSp7Y73BtuAgbpaxndZZazBHUPRR+PxGPV+La
 heMvJHCNLhaqUm0pXFkBs7jzZzLgaNgyidiiL4Xk+G+h22HLxETI5Wc9dp0R0zXP7+Fk4sN0AA1
 VNMlyddXnKMt84EHLdN3cXXAC4pXkq+8qH4DM3Sma2QZSbcdXJGm2rHpyMyn0Hlf64aoHKnWN2m
 /+KZwUtkIPtEYu3hxi4vWGz9ITrRomWyh32Pq63d0zMCNZ/uspU1P740MF/DqflmRKgsej3KVnw
 DRzsYfbDDyILLf4af4A==
X-Authority-Analysis: v=2.4 cv=cokOAF4i c=1 sm=1 tr=0 ts=6abc9e26 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=ub4Fp3YvjE6bfjjF_tYA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-ORIG-GUID: bcCGfdTeeZQNIwu9rtVeVLtZCcfIXInz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyMSBTYWx0ZWRfXyo0O21SqoMmr
 1P6gGnqleABW+LTjxSf7NyjkWnUJcj4YzQOZK6fbVabAZ/hay9L20Ds8d3EKD8H3KtfnqcCz6lE
 HSgBgcNjdknkYYbCpeQUJ9V2eFTvoEU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300021

> > +             }
> > +             ret = regmap_update_bits(map,
> > +                                      qaif_dmacfg_reg(v, idx, substream->stream, dai_id),
> > +                                      QAIF_DMACFG_DYNCLK_BIT, 0);
> > +             if (ret)
> > +                     dev_err(soc_runtime->dev, "error disabling dma_dynclk: %d\n", ret);
>
> Should this preserve the first error while still attempting the
> IRQ-disable cleanup? As written, if clearing `QAIF_DMACFG_DYNCLK_BIT`
> fails but `qaif_platform_irq_op(..., QAIF_IRQ_DISABLE)` succeeds, `ret`
> is overwritten and the trigger callback returns 0.
This was overlooked. Will correct in next version.

>
> > +             ret = qaif_platform_irq_op(drvdata, substream->stream, irq_type,
> > +                                        idx, QAIF_IRQ_DISABLE);
> > +             if (ret)
> > +                     dev_err(soc_runtime->dev, "error disabling irq regs: %d\n", ret);
> > +             break;
>
> The QAIF programming guide's STOP sequences describe one more hardware
> completion step after clearing DMA ENABLE: wait for the relevant DMA
> shutdown status to complete, then clear/disable the associated IRQs.
> This applies to the AIF RDDMA/WRDMA paths and also to the codec
> RDDMA/WRDMA paths.
>
> This patch already has register definitions for the shutdown-status
> registers
> (`QAIF_RDDMA_SHUTDOWN_STAT_REG()`, `QAIF_WRDMA_SHUTDOWN_STAT_REG()`,
> QAIF_CDC_RDDMA_SHUTDOWN_STAT_REG(),&QAIF_CDC_WRDMA_SHUTDOWN_STAT_REG()),
> but I do not see them used in this stop path or in `sync_stop()`.
>
> Should the driver poll the appropriate `*_SHUTDOWN_STATUS` register, for
> example with `regmap_read_poll_timeout()`, before disabling DYNCLK and
> IRQs? Otherwise a fast STOP->START or suspend/resume path may race with
> a DMA channel that hardware still reports as shutting down.
>
> Thanks
> Ajay Kumar Nandam
>
Thanks Ajay for the deep thought here. This was intentional, on the
assumption that once a stream is closed the QAIF IP is inactive as its
clocks are gated. But you're right, concurrent or suspend/resume
scenarios can be affected without a complete shutdown. Will add the
full shutdown sequence in the next version.
-Harendra
