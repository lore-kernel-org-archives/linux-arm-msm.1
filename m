Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C5357983C
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 22:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788906268; cv=pass; b=QJ1MAHuVOYZm5+y1EQdVngxwXwYH+NdQj8Zj2QJsC1KlqqmdBQwLk5stxle9meHCIYtdtxq39nLBIETH4TPfI7HLy6evhyxPCni95wFK0nxEj9kNh387OWrpzHE56BIcbUyC4IulEgZ5TfbXv77p9TkJb8btXyXY3cy31lwosL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788906268; c=relaxed/simple;
	bh=s5uaxEY1oEGlpLSc8BasHuuvEs5Hx2/Cs6PiacTKyEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mu2tB0SEEEpID2genL5YavXHIWY++WiR1vOGLmTqtNU9V1spVSCxlYuRStPxx8MTLyQ6ettpHaBfudl4B9WZegEtFdJN2llu6EjViyBABzN0GuCOLVipWPQOZa8W4P+mIBFORTsGHAjPtKHQj+Ubc29/wGQiI0Kpbf/5ocx4bkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MUpChgIn; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MUpChgIn"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396673bd283so881913a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 15:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788906266; cv=none;
        d=google.com; s=arc-20260327;
        b=j7brtlt178aY9XYZm11IGN9H8ldEp7QHhTCpInYBkBhYKr8usgtc/h0DY/upMqmqxU
         tYVOfyKm34A8kiJBa+T8zRC82i5IUsu9dKxD52t3M2KxcOOccmZOQIpIp3pnC293pcmL
         cOAoEKfUPeb6yXlCEsfBvR4oMlB/+D0vNdALgqJltYhJ4n+9jqXVUIuGkyTvmhojpvok
         sxDjeSK869rIYoolk9oFnqyApgm2NLbHWYZR4RrZrx5Qz3NenSzO/o+AoA66u+4zF1nK
         x5HO9LT7T+TF71Mqpp/tQDEWwd0CuZuaCkeNFrbu1p0KlPKqqN7+JZcDWknbr8rpKLmL
         gDZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U8EkFagfl9uinl9KRuv/CDvRS8wFSFBw+B4s084qWz4=;
        fh=iDDsXCW60XdvKR6c1TKnVhp/gGk81IvKHPHQ1zfhIA4=;
        b=NJPcX75X2Nn0/MBmWUsPf7/9tnZJOUoG1uBEskjOyh0VimzTA+dfwikyKoHiqHlOxo
         TqskeTJyibAt1gwYBISnB9nP89D5KbbONUPuNLyoKJrim1DI42fsOz1o1y5L2YKCTfgU
         +15wTiyehK15wAwfPjjjNjhxyG7JlwEMhRxp/AAUtX04DPtRW6MTC98QHKIv80g/nQ/W
         4IVhiMMv3pBjKVikG71obxbNHBWJAB/R/MyLvBOxdPziWhwAwDKi2B1XrC2J7DxcePGa
         YxbT18M8aZQ2Ab2fed6R9va9tTfpGnHmhAXB09BCark0LSxljJ6xecYf5XI9ThqoRCRg
         NAGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788906266; x=1789511066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U8EkFagfl9uinl9KRuv/CDvRS8wFSFBw+B4s084qWz4=;
        b=MUpChgIne/ZIhclBOZzYfNnD42GEGynsw52npE/nxW8kHHUqqmXJZTLUdVrAJnxZUa
         NwYq6zfe/DQxfQ9Bu3iZS9s+9RDJR09Dth9qBcfmp6LWXIk8YphKeeeMdwRyjwTuorzt
         ATvQkuH6KWG8B6lqPWYhCa513aM/tJ6yXBIkW30qho53FabRFwljGJuEvB5gxReCOg4c
         7IzgniNkpoW9cVo50ZOqWTsO3q1NArsxyuIb4Ag6tMnd55O4iQg8pqIFKD1C1HJp9wVQ
         wsY/saKT0EILuND7mumm3E2O4lV7rYTlkGuOkQ9xdSHa9mLuiMWaHQwetERii9kHAvxd
         PIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788906266; x=1789511066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U8EkFagfl9uinl9KRuv/CDvRS8wFSFBw+B4s084qWz4=;
        b=KNyDtZyRLIJmn/9WLfnnWb6uLRMmjO1hcTxL+KVdnCCkUfpYpL+nBQ7OxvyUWLaMB5
         aH6imdQIEfTtaWlsq5wy1kFfOG9ZB+SCS1Ewpn5vgKB1KbbTon+73y6ZAFAE8RRPQ2C3
         AILgEoH6XgpWfUgicJbdi6v/jek4fJo7Ze14/cHWzw7ntL4fF4UXNo1z6bhfwhSUHxkj
         nCFInKT9g//my9FvSRnIh9PKV1YkaeljB0/dpVcRPYc7D+82Jc7p67R//d/h+7IuCec+
         8u+GXpKbWWgUin5y2mCxOYmz//J1Ql++SO+Wz//9GSwEBlaWae/f7cQl1iMmtafNaX95
         PP0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxx+oOaP0r7U9VtLjXBCq4oLuPwWbqOJJ/XzZukiUrQwyfVbOfPEEkNBOfE0vIFBOqdua2H6nsPivsBCbR5@vger.kernel.org
X-Gm-Message-State: AFuF++lWr3/h44JC3EC3IBKuyLnM+0bZOj/E8cQ+cywJITJvvYj2G8Ol
	KfJ6FFv3+Ao3iVbA10bt+IQ1I07mZLe2yUjqktY52oELYWI+aBl/sF52xHCv2+0eduS8GzNPm5O
	su4FxYgDkD8+AyT6MHrO3cnnCUcTtOuE=
X-Gm-Gg: AYBFou0lBK581/R2cYe3ZRC3EQ/uG/Tv1qW4vNRxS3ZOI9tBGmXeNx5/e1hbWDgEbRJ
	rvniwfsny2Ry4mDArOTj/zljC8g8RrwzqvLDIqflY5fnxPH7rBl91aQZfN2BnUAzFo0LpkWsGco
	dc9EpYmKJPpU8IWpgAUH+YrcWl5UgncFwC0G8lPVog+IsvsEmOTgmEVjbsx5UcoSg2+SHF1M3vB
	B1wf7KUfNt9v0pgX1m/v1bebzAwt8Nj5bwff1vXG7VRDC/MSpYDW981pRsZt8WOtIv5rH0jghe7
	ASu9AlzA4h8O0HsQtdvtoNYNTtsj8HSa9QMJ8W3gD8gjlv+zmzvfDePmofJ6ixPjiLiuL2r6Vp6
	F
X-Received: by 2002:a17:90b:4b41:b0:398:bad2:c0f with SMTP id
 98e67ed59e1d1-39b3d8310d0mr23157347a91.5.1788906266333; Tue, 08 Sep 2026
 15:24:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-b4-adreno-timestamp-v1-1-273525da144c@oss.qualcomm.com>
 <CACu1E7GGdxTOsn+MRDT+7Guhjs-DDkZVx0Yet=RTxgQ4CNCKhw@mail.gmail.com>
 <CACSVV00BtmA0CotRucd8jG=cQLQw0YmLKEkTOV70qHBx=sG0sA@mail.gmail.com>
 <fl5uoffoh3gyod3f6jxgze33ut4jj4ttmgivtyoa5oykbt2aqp@rkktjz4yh4ll>
 <CACSVV03ShOw8D8d-5gDPYdzH3_Hp7EMz2CdfA3x08pCKAtw57g@mail.gmail.com>
 <CACu1E7H9KsUU=dV+iwQPOOX62+V8S5xstFf2LXhzeE7oSb3V4A@mail.gmail.com>
 <xq2q6jazk2a5atfthzwktn7qhrinxg4duhdxg22qrutgdycbwb@47nosxhcqloz> <6s7mwjzglv5slukj73glmshe4gwfyh6cvimxyeyn6l4r46lkpv@74mpfroj23xi>
In-Reply-To: <6s7mwjzglv5slukj73glmshe4gwfyh6cvimxyeyn6l4r46lkpv@74mpfroj23xi>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 8 Sep 2026 18:24:14 -0400
X-Gm-Features: AcwNN1UV5foMtL6xVJAa6TgZb3_vfx9LKjXxP4r4sT9_mlJ6kDTMt-VInvhka9I
Message-ID: <CACu1E7G8K+7ACJfArtVOGMDVbO+A3GEmghHBurXXCsDvdteJ+Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: keep the GPU timestamp monotonic across
 power collapse
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: rob.clark@oss.qualcomm.com, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 11:49=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Sep 08, 2026 at 06:26:22PM +0300, Dmitry Baryshkov wrote:
> > On Tue, Sep 08, 2026 at 11:09:17AM -0400, Connor Abbott wrote:
> > > On Tue, Sep 8, 2026 at 10:51=E2=80=AFAM Rob Clark <rob.clark@oss.qual=
comm.com> wrote:
> > > >
> > > > On Tue, Sep 8, 2026 at 4:41=E2=80=AFAM Dmitry Baryshkov
> > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > >
> > > > > On Mon, Sep 07, 2026 at 04:20:43PM -0700, Rob Clark wrote:
> > > > > > On Thu, Aug 27, 2026 at 9:07=E2=80=AFPM Connor Abbott <cwabbott=
0@gmail.com> wrote:
> > > > > > >
> > > > > > > On Thu, Aug 27, 2026 at 7:13=E2=80=AFPM Dmitry Baryshkov
> > > > > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > > > > >
> > > > > > > > The always-on counter behind MSM_PARAM_TIMESTAMP sits in th=
e GPU power
> > > > > > > > domain on a4xx, a5xx and the GMU-less a6xx parts, so it res=
tarts from
> > > > > > > > zero whenever the GPU is powered up again and the timestamp=
 reported to
> > > > > > > > userspace jumps backwards. On an a702 six reads three secon=
ds apart all
> > > > > > > > land in the 500..1200 tick range, stepping backwards twice,=
 and on an
> > > > > > > > a530 the OpenCL device timer conformance test fails because
> > > > > > > > clGetDeviceAndHostTimer() returns an end time below the sta=
rt time.
> > > > > > > >
> > > > > > > > Save the counter in the suspend path of the affected genera=
tions, while
> > > > > > > > the GPU is still powered, and add the accumulated ticks to =
the value
> > > > > > > > reported to userspace.
> > > > > > >
> > > > > > > This is useless because the entire point of clGetDeviceAndHos=
tTimer()
> > > > > > > (and the similar thing in Vulkan) is to match what the GPU it=
self
> > > > > > > returns, and now you've broken that by adding an offset.
> > > > > >
> > > > > > Just to clarify, the timestamp needs to match what UMD reads di=
rectly
> > > > > > from hw in various different ways (timestamp queries, shader_cl=
ock,
> > > > > > etc)..
> > > > > >
> > > > > > If we can _restore_ the value (ie. write the hw reg) on resume,=
 that
> > > > > > would be ok.. but it doesn't look possible.
> > > > >
> > > > > Yes, a quick check shows that all relevant registers are write-ig=
nore.
> > > > >
> > > > > > Otherwise I guess we need
> > > > > > some scheme where an offset value is stored in memory somewhere=
, and
> > > > > > some coordination with userspace to add the offset in various
> > > > > > different paths.  But the kernel shouldn't be adding the offset=
 to
> > > > > > what it returns to userspace itself.
> > > > >
> > > > > Ack, thanks for the explanation. I tried to match what kgsl was d=
oing.
> > > > > It reads the GPU timers directly from the GPU, but for the CPU ti=
mers it
> > > > > reads the value from KGSL driver which accumulates the offset.
> > > > >
> > > > > If I understand you correctly, we need to export the offset to th=
e
> > > > > userspace via some extra page (like vdso) and let Mesa read it. C=
orrect?
> > > >
> > > > Yeah, it doesn't look like there is an existing GPU_READONLY && !AP=
RIV
> > > > BO we could re-use, so I think we need to create a new global (TTBR=
1)
> > > > "vdso" BO which is read-only to the GPU but otherwise accessible to
> > > > IB1+, along w/ MSM_PARAM_VDSO for UMD to query the address of this =
BO.
> > > > (And update msm_mapping test in igt to validate that it is read-onl=
y.)
> > > >
> > > > (I'm not married to the name "vdso" but not creative enough this
> > > > morning to think of something better)
> > > >
> > > > I'm a bit curious if kgsl handles this differently.. maybe there is
> > > > something I'm missing.  But somehow timestamps need to agree betwee=
n
> > > > what is read on the GPU and what is read on CPU.
> > > >
> > > > BR,
> > > > -R
> > >
> > > I think the kgsl timestamp offset stuff was only added for the new
> > > A750+ CX GMU counter which is not read-only. We do need to port that
> > > over to drm/msm. If the offset is applied for older GPUs, it's
> > > probably another case of kgsl not bothering to keep support for older
> > > GPUs in newer branches.
> >
> > I've been looking at the kgsl drivers from msm-3.18 / 4.4 as those
> > kernels targeted MSM8996/98.
>
> If I understand correctly, for those GPUs glGetInteger64v(GL_TIMESTAMP)
> reads the ALWAYSON perf counter through IOCTL_KGSL_PERFCOUNTER_READ. The
> perfcounters are all saved on suspend and summed towards the current
> value read from HW.
>
> --
> With best wishes
> Dmitry

I think GL_TIMESTAMP just wasn't ever exposed. The equivalent GLES
extension GL_EXT_disjoint_timer_query was written by Qualcomm, and it
explicitly allows zeroing on suspend/resume. IIUC it also doesn't use
the perfcounter, it probably submits a dummy job and reads
kgsl_cmdbatch_profiling_buffer::gpu_ticks_queued.

Connor
