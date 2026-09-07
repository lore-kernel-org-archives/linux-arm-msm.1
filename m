Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613C632B10E
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 04:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788755811; cv=pass; b=TWF7eEmSnJPq2hI3yhTbxMCcu4JWhz7JD8kIUk3qvUp3gsnx0aGIDDZ/389xeoUC7akTDjnqWdBrXY0dX9PlkmUz8tHkfxdFB2qEPoKlO0fyJV+imKkSBDgMEL6s3AQ2Qq/PSCgWs3VJeTnB/53EGLzS8xQ5qz0iDnfjhJI8EIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788755811; c=relaxed/simple;
	bh=hUnGH29frAUOv/0EuRdjA8PunMlslRH8ulu+jotd78o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hd27wZh9S1L0usrzNAVAdlBktKqRWa+/O1yS19EmXiulZq9wDtTQ+VYx+GvqZPLpqM7y2eLs7NHGGNzY5+VP2BBxmYhiX47eAVEMkvuowg0zRI+mLCM1Dmgymqz/SWOZW5TxsbZfy++nvDAOZEZGX9i05x2JAAPAZhZyyTXfElo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FiljLwxk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H8XR9sEP; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FiljLwxk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H8XR9sEP"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873lASn2916920
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 04:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bXvOVPq/0G9Af1iQjBbrByfRCSP5jsO6db1GgQhts08=; b=FiljLwxkZ+eG73E1
	RsvV7XSB2GVymZn2gg3R9KWDIAmbOy3hiL0PJT9up2MxSTuKpkyfzZXeHRhY5jZH
	mHBO2/NAqLIppSNvzn/Hl4/KdGdT2WPjFr3w+dJcyBpyJG6M+BWO/0Qk+mgdNAwX
	lrXC/20md7FR0ZW6PNiSuX4+a22ElBT0sOb6FTMQBKL/6r6uWCn4z2CD03mvr73n
	1NbX49uAYrxydeEGCjfuv+w2cLLwEHkNhrKQd1yoWWSO3xjh/Rb2vNtt6RJxDZW6
	WC+AuTSBzMOn/Nn/VcwawEtjkhRWSKRalQYGTqdrso3+BFStYZr1AVJWYxiLYy6f
	11KYHg==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj04bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 04:36:49 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66d1d35738aso473770d50.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 21:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788755809; cv=none;
        d=google.com; s=arc-20260327;
        b=l3LB6ETo7CnLlDKweNJuv6pqeE/0yRzbAkpoKe1KqBCjtW/xAhsmwUIpwYK+fi3wRO
         dCyukOgzvFXlZnkXuG0JIMZnufwJPyVynM9DYMWpb7C2q9Vp61FPq06iA8rhxJ5npylz
         xD/f2PrVp6C743Jjvc1qv5oi389njmIn4fco1hv9svpeIC/7LMHnWNzDqaHJwQrB0Gb5
         DfvD2eixd33fubvODp33g5P1gbBkzxNkyNcNjebutrjdgyYZcfyDvKHZCLJF87WTpJKT
         vPISOI+Ci59rKS9lNsx/5axevLMCLdAEYoNHX2FOgIDigYEp6vk3L//2xGSptSS6mZ8V
         fXWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bXvOVPq/0G9Af1iQjBbrByfRCSP5jsO6db1GgQhts08=;
        fh=GkvNkRX6Bq8YFybI9rxlXTWCDkuDohUEom3j2eV9S7U=;
        b=UrCcAQjsX8clZxBRGzyKfsZ4lMCWiQ86Kqg/e1L1XVmQGPpYZlhE+UN72apg/KSOao
         UoqXCpVrEw7YVpFkw8xmfsSlkIVuQyvfOaAAJgdP/7rBqlxAdM7aoLEhMpHhlZU3uxvX
         fPJhJgMI/2LNTsT4YZXm5+80ZCiWS1WvnM8czGKsLIbPBuGCA3QUEIJEnP2m8eElLfEZ
         vSZ8aWuOn5dBVJQ/QGHxNVFK5WLaSo4oGORpcoOXS26Je0iIF+EUb06ZZGbTxIOrrC53
         u4iVSr24H2oYkMtzCiw9v9YF3XRRlbVmJcHAHwfKE9eYMhbfByOg4RjzU+lByQ5ls3Gr
         n0xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788755809; x=1789360609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bXvOVPq/0G9Af1iQjBbrByfRCSP5jsO6db1GgQhts08=;
        b=H8XR9sEPNuAdIztPqIeF6oS7KntDjPjj5DRqiZwCiHfJ9BnNhQMFdSJ4VI6pbouHyk
         Zqwnj5+gJtGlNx9u7T8fNLjVTfDvGJFm5CqPb/TdYUXr+Fzdej7GXjjlZ4N0qGgD18eR
         FyhuKJkMYxfGsgUAPuDekZI2imqmUx87r/FMppCn46jrheyt1bo3LiKRmDeTHIBvsMQK
         CuGaZJ091I4HdtXpP5X+yBdd3Hhg24zmqct/Jtq8lKp5AUwNuZoa1mhrURtZAvSMa/RB
         mHtLGeCz3IiUyF17QmamBT12bbCxjoSVpIRsAZIBjcDI7B8IeVZFjfuX6fkhNT2iEjeE
         RcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755809; x=1789360609;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXvOVPq/0G9Af1iQjBbrByfRCSP5jsO6db1GgQhts08=;
        b=fgE/Dt7kEBTnYet5i2PVJ3f4fS1H3hTbGwWyCQQXJODH5tdAR7O1Kb1+r/d2BUCxpC
         oLyuRXrSe6kKPuNjiEz0I+8w8/hqns5G0FxB/ruKRBxpuzhkkJEvIE14g17f6fcHuuUB
         qVSY61/x65BM3gJyicuwwDSx7k600yJ9fUrUXSx5TY/GFehzcFHlLrX2ILdvYF3YStSu
         +YDzH1ql30HvK/g9q1lVMY6xrgV2h05RAQw4XdE/Ok74QiXPiAu2skh8DGD0JRr3dCBk
         JIWEot5u0xC/Ppmhb7lEYpIxytqLibPTNSdj0EHL6q+y/1eY1BjTBEWFc0I5Bq53vK4N
         dltQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3aDXljNhfPY46tFBzOzGmbBB6lIsyCBDk2uJr9/d19bUrUenh1f31nyZOXz8xna5ZB1CIOkIlBGCwGke6@vger.kernel.org
X-Gm-Message-State: AFuF++l4K7cTjg6aCDXoJwQwnDZuZs+Xk2lLxSeLj9I3aHGjYocjbvI9
	D/NGJ9jwJkwAybWiXQqE6XfY5uSPjP9XIQOpV5pFppzDVei2qGqysaOFZMdRz0t/VZjLm8lqyic
	tGB+nZi9elo1nXbXLARCh4K9ZNnKspFczfyhJHzIE4ef0V25g+FFzkLSBCAUXvMp1TiDZqlBG+G
	x4wwY6zQg/JjIG9Scx5wL201Lay6lpWDQNSunrm1p9UsA=
X-Gm-Gg: AYBFou2KRBqa+DTonBxuKOmdFYy15KYP09vWDlZsghalPRlMTwoqZRTkXKgbTyaEvf/
	S7uHHEo8V+zOIkdSmxY5417sdu7wLgPukQgZy17NNIxLsfcrQAHu2r+IWzEMV6vuicNXSg2Gi1S
	gAFvIcambQ1qBiL+qmsSKWkYOI5ul1jXcb0BYabjfDYQhag6ZDVqYTqXQsjpE=
X-Received: by 2002:a05:690e:4508:10b0:66f:c7df:1442 with SMTP id 956f58d0204a3-66fc7df14e4mr1070538d50.40.1788755808748;
        Sun, 06 Sep 2026 21:36:48 -0700 (PDT)
X-Received: by 2002:a05:690e:4508:10b0:66f:c7df:1442 with SMTP id
 956f58d0204a3-66fc7df14e4mr1070527d50.40.1788755808367; Sun, 06 Sep 2026
 21:36:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903072902.3870009-1-harendra.gautam@oss.qualcomm.com>
 <20260903072902.3870009-8-harendra.gautam@oss.qualcomm.com> <1bc82ff9-87a2-45b6-88cc-43acf92c84bd@sirena.org.uk>
In-Reply-To: <1bc82ff9-87a2-45b6-88cc-43acf92c84bd@sirena.org.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:06:37 +0530
X-Gm-Features: AcwNN1Ut4lERX0ImtklUb__wwFFA1e6nLSim3GBD2KDrKci5MjcsTbDpGSY4jXQ
Message-ID: <CAC-tS8CccoonxXUEeGhEd9Ct=DuQWALJJr6S52fonPG+SRoNXQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] ASoC: qcom: Add QAIF PCM operations
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
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
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA0NiBTYWx0ZWRfX4lSgB01Tv8Rp
 7PPfn+YLASJISGmAnhM14P4IIbRgCdu7nUgwcBnau3r34v7iX19bTivErulpFGwcWkk5SuQ1jlF
 OrldxU6ROZM0pbL8JTJBako0veNKFc6eNKbdeXHC7hOP5z7zZ6Lov7QYtVilE8UD9XquK0BEVeb
 /D7Qqk9w9Qqyu+cIt71WnXj1+a83KC4zg1hocJSCfr4Lk973BGX1flP4SM3KJXBbAIpwjOdOebU
 PY/vyYCnOBr9XESvmLY//QT1KUjrkcr79/xmYrzQZ27i7VoGEdln9/fPvqVEymFEYZNyaGYiPM0
 oari8033Qa1lVkVKGN4topm3h516f+sdZ7womQLKr9vqEu1GR8NkY+vKyVzXRAkHiKvXe0neLnm
 6PHliiIGA2kMBCbGFz4rxB/EHze6GSlKmtC3mFNeDjYhRZ+QQxO6IFVywkwtDiX+ztQvxAVqjF3
 byM+yljJ5/dG5R4aOiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA0NiBTYWx0ZWRfXxVj8X0sVwVOG
 r5r6yvn10jKcpV03eGNpz8k0S7rpRdiQjXCq5oEDOaqlrvKH609VIPJqXtJ8hCiyOgDRbuXrYLt
 eYO24LfYIOZaQU0SeajNcxzscIbJ0bg=
X-Proofpoint-ORIG-GUID: t3U8YGjLRiCmRO7ZoL7CtqFPpD9AsaLv
X-Proofpoint-GUID: t3U8YGjLRiCmRO7ZoL7CtqFPpD9AsaLv
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9e3f61 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=WyqP0FlduNzGPyTG3yoA:9
 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070046

On Fri, Sep 4, 2026 at 1:04=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Thu, Sep 03, 2026 at 12:58:58PM +0530, Harendra Gautam wrote:
>
> > Add the PCM platform callbacks needed to use QAIF DAIs for playback
> > and capture.
>
> > +static int qaif_platform_pcmops_open(struct snd_soc_component *compone=
nt,
> > +                                  struct snd_pcm_substream *substream)
> > +{
>
> > +     dma_mem_info->alloc_size =3D qaif_platform_hardware.buffer_bytes_=
max;
> > +     dma_mem_info->vaddr =3D dma_alloc_coherent(component->dev,
> > +                                              dma_mem_info->alloc_size=
,
> > +                                              &dma_mem_info->dma_addr,
> > +                                              GFP_KERNEL);
> > +     if (!dma_mem_info->vaddr) {
> > +             ret =3D -ENOMEM;
> > +             goto err_free_mem_info;
> > +     }
> > +
> > +     mutex_lock(&drvdata->stream_lock);
> > +     stream_dma_idx =3D v->alloc_stream_dma_idx(drvdata, dir, dai_id);
> > +     mutex_unlock(&drvdata->stream_lock);
> > +     if (stream_dma_idx < 0) {
> > +             ret =3D stream_dma_idx;
> > +             goto err_free_mem_info;
> > +     }
>
> Shouldn't this be err_free_dma from here on?
Thanks for pointing this out. Yes, you are right. This I overlooked. I
will correct it in next version.
-Harendra
