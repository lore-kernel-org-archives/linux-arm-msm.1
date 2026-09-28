Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4ED9485949
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 09:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586433; cv=pass; b=FVQ4wWPET5qXK7NSvGerb3fOjvgoDWDvJ+ZVrnVrq2d12/nqLSt8T6H0yiHHTypIEbCQSQb6BM+uimtlfpmFjUhU1PCNsASpwtr8yYfDtmLGEx+qXNz8lCV8L9xhO83yosyqiX3IwukimF1fg9rpu7hFdnlb179VI7gYPMFqRPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586433; c=relaxed/simple;
	bh=s2Enupyeibtnt7iImD86TsDrfkpy6GFHBVU2jucmNWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eYQv5ceV3wFqMfWcmd6NLeoS5WqCWAIe38jULFU26+nMzLasEojbAMN+jp1W9A5d7TBpy3LdsadCvU/b3a+rVLtkhlVHZTrW7omNcM6kquxKGbiji+lnDxacvuUmq+MfSSnvDDS3VYnGKd/Pp28FNGQtCs0141rgmO5yb7vuhys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IROmiQzM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BRgV31EC; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IROmiQzM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BRgV31EC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xtwQ361445
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 09:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n19NZ2DZer6lB8ryYO/o4o4W
	WUSxviNywHDQ+d++mko=; b=IROmiQzMOCN35QWrXMKhPyYSyMmuA6jkxAyjmPhC
	0UETZgfIDwCqiu4QPlZUilAG1nVma42171hArilj2c7EALEaPO5jZc65CbeUadU9
	V9Q31Ks1rNu0G+K8HpRwd+cR1xTDB3VwgE+k2ieRVXXmzwWn2X7MITPKN74sC5sw
	ZQxAQ4aDFePZX4BB7nMOYUJiAdd8f/I6EJ2HsZdZadi7hSE35qV9t1cEIKDCSeml
	eK7v6lV8WzUmVpJyx+z9bOf9YA6EXyBYTqwGRw3U9/tadcoaOYG29myWOTpoMNd6
	kBGF8GMBR0iUv68rTTsWx+vGkZmb0ZzCxIOdPfLng6zgYg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav49q3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 09:07:10 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8881abf79a4so37273257b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 02:07:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790586430; cv=none;
        d=google.com; s=arc-20260327;
        b=oqCJtsAWfOGolIWDG02bNiTEqjRMzOpJXlBcKzRKRPbt3Ki+nwRZpLP+7FaeY09pqm
         Yn+TRTQrgpCkmSyQlmAlIuHcj46rY1aIkgqfiAgRFYaWyWO9IdHQRRnya5lBSgSe0WZ2
         azcF/OQGzyOMVH6xkTBqBqkMaQ4qYUzpNUTa5dAFzQJIzIfaocCoHBNpFs+BTIazG+/C
         MWvf0DwYqagfLlcpzoe04idv8yZChllxBPrOXQTl54JzOKyC0u5CGAQ386K0sDEwhEQv
         TGFs4NeDJr2udBvSiVmVSl1/fufupKZChqBAL7r0Y29bsueA1xy+xAFi7Zg7CchgkYJn
         bUYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n19NZ2DZer6lB8ryYO/o4o4WWUSxviNywHDQ+d++mko=;
        fh=dYQlEyF4hgrI27Pnq/C0d7bRiQFxmLQ2NON9/RcLYk4=;
        b=Z028xPKMhOZug1s9xKR8hJnFTuhA5DTguh5mDcF74LgQ2ykXwvZ9Nb9/omr5+UBLU6
         WSvg6bQPm71Ug+CcYDCSCtBAXC3cnFcRd1Qo1KAFsYzyOqQDut3ZaqHCXbzXSbpTIquI
         Mps1IV12IsCW7z+XxGh3rOKTDsLZ1MsaNpwnS+fE2i4n8Totl2GbAzmghFA28isT398q
         VRnxy/gHCPraFCvp5t4i3xH9tLJTNka5cuwP+aLKAiCfhw0ae5zjmofjZLuWZyzwzEc/
         frPAj74fqCh8HGKTMKHMKdut+JJlVuOGbSlH5D/iZK6IDSpKkoVQ4mgBZ4XLieiLX+mC
         e4aQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790586430; x=1791191230; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n19NZ2DZer6lB8ryYO/o4o4WWUSxviNywHDQ+d++mko=;
        b=BRgV31EC1wVDSY3eTEaG2gDR2V2Ay7vsWbRTpcni1sjY2fL9fzScoaX7ysyKzql+xS
         ypST2GZCO8b3W1RhJg1xkUx1Vx2cUsYyuqv+8g+vTQ033yLG1POBVWMtXWDn+6pEbVPR
         Y7lYUhKFVIVBZtlg/EoDnXedpATqN4A2qShCxKOB53bRzkwLseG6TBWGt8EM5Sn6Y7Ot
         QIlBhukufru7wyEb9g0RFQ7tgu4VvaNWfUbolBBdZEon0MhdjopYcWY49YPPjyYsVL2w
         +9TVS6oXT1/5e1SajbZQ3uS1eiNkD7aAIzOZ0NWUOgQVbjVcSNhl1WQCx3z6vPjRf9oB
         eNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790586430; x=1791191230;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n19NZ2DZer6lB8ryYO/o4o4WWUSxviNywHDQ+d++mko=;
        b=GQpMn6Cm06Gugysdsp5i/XaIyjG0+IBsnSWlIUhOkb5yd5gLUtwFUYNpSs3vxPIXSX
         u0bKeKW4dNMFvdNEwbbHI+JGzqUMc1CgJwZNo8glaas7xHIo4nmMg1ppEqi3J6n82wq8
         6tvspfeDY2/0485DKTkLf5ZBvEXk17ijYN7Z+KDL2mzWtSKTIKeXnoD7kC2bSigJDAVJ
         CNcwFDermDjI+SqN3FRJ2w+1AZShDGjoBK3uvMFixWj6nUcKWdQp2B5v6PV285ZWPiJ8
         /Y5e40imbHASkj4bJ4TVM8rUN4pPVaZ7MnTlCcSGlKRinP8A78cw1Rkq1GGi1n6Dx81w
         hYFw==
X-Forwarded-Encrypted: i=1; AKwUvBx/aI9Uss96vXUTXiTH911my+3akzRFYmQePlxh/vpM8QQY+Gf4ZO96MDcAqjAze4N0XdWkmlfEEoeOcC31@vger.kernel.org
X-Gm-Message-State: AFq9FYKTNGml2Gj8IRQ3chYKZQXOAhBMmKklM9NP7C078SiCZe7UiY5k
	F59rnWVrbz1NIppKG82zMT9W/XX2lemxhDNSOt8xC9F0HICklAN3zw6iTQK/pn/pqnig4o1jVAl
	6GqmGtF+ekjhZn5ClUu4pu7D8fxZyPHmyZ4N9RZt7b8FTfmqU6toSiQk3IGiD+WP4XPdJ0BinXu
	/5SVUrvj+FHgJw2S/q7EgNjdJt/tPeFc+j591MV4QLe5A=
X-Gm-Gg: AYBFou07LYwa64MLv8MzXHjZaOL6gvWkrAz9UairV4N+ao+k6yhlzdPNLx/VqNJs/w8
	PV2+bxqrhrx9eDsWh9cwhDwdsaGH/sIR32CzwUjMTULJISLu3QVIkncty6OBJvNH44Rqa8raOn5
	z7v+HF++iS1x+eZ8d1qjbCdttT1Sv0KV2dTqAbLlXYt7rKwNx0/C4p3Oo4uEc=
X-Received: by 2002:a05:690c:281:b0:8a8:8f62:e92 with SMTP id 00721157ae682-8a88f6217a1mr34619217b3.55.1790586430086;
        Mon, 28 Sep 2026 02:07:10 -0700 (PDT)
X-Received: by 2002:a05:690c:281:b0:8a8:8f62:e92 with SMTP id
 00721157ae682-8a88f6217a1mr34618987b3.55.1790586429555; Mon, 28 Sep 2026
 02:07:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
 <20260923-b4-qaif-shikra-audio-v7-7-d5b6f056568e@oss.qualcomm.com> <arOfufqav6zRT_Rd@sirena.co.uk>
In-Reply-To: <arOfufqav6zRT_Rd@sirena.co.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 14:36:56 +0530
X-Gm-Features: AclHuK-5ndE__5TsHzpVHEV0m6dGW20Hk6VWjJY3Bt2Guaa4yktx6YOghplq7oM
Message-ID: <CAC-tS8BscYoSU41qHTC9_8Ajq-MuyfOHWzt4p6v6NN8HzsRVaQ@mail.gmail.com>
Subject: Re: [PATCH v7 07/10] ASoC: qcom: Add QAIF PCM operations
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
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
X-Proofpoint-GUID: z3GpOWBcnCPGH_sfA5oSJ_aFTmYBka_N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNiBTYWx0ZWRfX6FKhIRwq3CVR
 sXG2G5Zw+85mEGCo9aw47wuAqGSZFBRb+eN9HZBTAcvE4x3k9L5paE2hqzpQwt+baUszvFCsBvl
 4+Iy4ff9mCNudy5iclVIjqFsu5E2xWWb4Svm7utD41Qr9EUnwqIk46lof1fqDzjaS3WAfOezGym
 PUl6rjJFwXVF44/ppXzhogpHhGK9ILhMGi2JXX45g9fJeCJq5ymUfzwU6/os0j8VcKQRbs8JRy7
 8K4S5BmJjenm4fxJPo2jrC8sG1bp780YaR3fC6aqKhQSIR7s1/BCz5VwQ4etiwLWNigb+/6x3h4
 84bVfE1B1NBMSuM/ekDxxIE5Njs8uojEzcNyKzMbEfeXYfPdZG1GgKksZzLYxdu4hqGWOeNzPi2
 jL4CO9veU4tidKMgQqkN7uULznGrfVRCLWUW7pZY6HATiruQ87TDQWP9I8iZKTabshnKm0+4B7M
 9Wdic5P4Y4tnchdbVhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNiBTYWx0ZWRfX+BY+82cVPDjN
 yygYsB0J3eUU4jj8KVMNAP5FRqpeY81vpjk/da08fkr50NziLMhg3Qn5Y1PRuBjpAKLG0te0cm1
 n+e3RKTCT/XfiVlMAqu9H9QkXnqYwjg=
X-Proofpoint-ORIG-GUID: z3GpOWBcnCPGH_sfA5oSJ_aFTmYBka_N
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba2e3f cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=r2ZyNpLy9wB0e1xT6XIA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280036

> > +     dma_mem_info->vaddr = dma_alloc_coherent(component->dev,
> > +                                              dma_mem_info->alloc_size,
> > +                                              &dma_mem_info->dma_addr,
> > +                                              GFP_KERNEL);
>
>
> snd_pcm_set_managed_buffer().
Thanks for the suggestion. Will switch to
snd_pcm_set_fixed_buffer_all() in a .pcm_new callback in the next
version.
>
> > +static int qaif_platform_copy(struct snd_soc_component *component,
> > +                           struct snd_pcm_substream *substream,
> > +                           int channel, unsigned long pos,
> > +                           struct iov_iter *buf, unsigned long bytes)
> > +{
> > +     struct snd_pcm_runtime *rt = substream->runtime;
> > +     size_t buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
> > +     size_t channel_bytes = buffer_bytes / rt->channels;
> > +     unsigned long offset;
> > +     void *dma_buf;
> > +     size_t copied;
>
> If the buffers are already memory mapped why do we need a copy()
> operation?
With snd_pcm_set_fixed_buffer_all() in .pcm_new the buffer will be
coherent and directly mmap-able, making copy() redundant. Will drop it
in the next version.
-Harendra
