Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512073A9852
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 15:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788880184; cv=pass; b=IUmNqRwyd4Yq/oGafDbBRuL25gJjMq0D4mfNwdEs/RnyK1CDXSXLPsF5aLWo6cavNxe0oQ17YXAT3E/M2rIIVki1ULUEGCWb+CXtv4i9s2XziJ60CIf/09OvezG9UCAs690iKvx/7JoZyjE4bDv9SCKJbCRVlMT0yD35Pcq9TKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788880184; c=relaxed/simple;
	bh=6Zy0C1EjFJfOWizXIiG9XHODZBpgtje3VHdrwvLXvv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ldj95wcrbVUJT+EiWEZKX2cka3oADrOG6srBb1TijZ5YQG4lGrQfUlA845tUdYBf77EDuIHuRD0ERa8GnGRa8zF0cI55mA+j7nsumHaIinkw0XQNmUe7m7Z0msQfQjMGsaiZB8icssZsIP+xHJMkz/wvU/TBZlV1DRfoMIRreRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbKq/nUG; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbKq/nUG"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396673bd283so805503a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 08:09:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788880169; cv=none;
        d=google.com; s=arc-20260327;
        b=Ju12BFqDkV1rqIusVvhuaXzh5UkOczyTlxJAdrsmLJxJMntYhwApc+NfCmAdn4AtKf
         mkcQFQ01iWDXr2rOW1n6B138SRvs3nHrrnDoAf1dkHQwBItWZW3XuBqClDU3xP8PJMpw
         o3zxmRceuL09Oytxa+GC5PaMOcc2H3FtJCe4qZ69mvkd+W/JtAtJ2bIUqSdBjqq8TpLA
         N1QW6I/wOTVzH617leDlizNrx7H9C6oLEQVo5RJk9/SHToKO4csP+NmH2xnwvRe82845
         9dT6DRaqNwqH1TUnqB9eCkZbiid3bQwvvjIaNAccOG1jqEjsSEeHDKUQoakqd9HVSNHo
         rasQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7VyQi/ZkPUG+zy3skQVlnP5ix8MZF/MBT4Cn4vahwwM=;
        fh=oVuufDVXSa/Hv2XaIY46vcW9enAWH6tVECLhjn62+og=;
        b=Cup1J+Gcszmd1xDn0HLPv1Cnx9eZZxaT8hfdl5FQ8bA9gcVDqKwP7lxUR3U1ML3LTg
         r85j7wSkHEOcNqcQf8CU+2APgLS4FLFFd4hGg/B4cMK5kxycEm1mq4BXcssLsrUikxGq
         nOEb00m1B4LsQIqGCrUEXdf63/I9WMMci0lEoEAUUD8LE6r3MthZj1k4kAIPqeE6skmq
         Pk+Acrbi9tvZ3XiWMqGzXtl9HeEMqdzwEk9Jr7/2muWWQlwk/h4mz33hZOtne85WUUPx
         vSFq+ZBZ9lwqkLy4mIbQ9Y8Sh3ZZ+Mrss0YFn+cVGI4n1RaWN+9x9kseFUPTzs7x9Krd
         ircA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788880169; x=1789484969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7VyQi/ZkPUG+zy3skQVlnP5ix8MZF/MBT4Cn4vahwwM=;
        b=jbKq/nUGFTR8IN4wfWzXKd7fFAV4KoAeigcOy/bvCyp12i1CCuss2leAP7ljzelHg6
         pl9rjGAdECWXq3BwZj6u8pZux0qlQvBy1167e5JvGcXc8O4afvZibcLcngD0qY38DhtN
         7rM8gHBH1MlLkbg/FtKIjSDiOsGmTutjwiYfUFNXKU9p8luk2oaat/nNh34I8fvMeJzI
         ieRLHOh0nPEfTaWDs2Cq7XupyXl/m38/MOWPCxgNDAJUUKp66IPtnzYwCczQwtHVKcWK
         TfIIKQbOU+d9frF14p+r4L5Hwc/m/oqZfSgBE2rgTUQWErOQs1rbRCFF+9Qo6VbJfZdi
         xDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788880169; x=1789484969;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7VyQi/ZkPUG+zy3skQVlnP5ix8MZF/MBT4Cn4vahwwM=;
        b=ltcgVmO6CJzlq1s4VFkdoZ0zhUOGwJPHOiVMFaeyI14iDvaohrN0ywXTAn+OAHzrmQ
         rmJWfU/5eDG8VKKuINMnvprhSZLed6k2LPgqESL22YJs/O9veU/4m/4kPVbri3iTXhwz
         efz+4CKLLCa7PDQGDqHMgd/khhX2gO3NqBQ9H+eljeaOyy064SVwyO/GsZb489i+Q7eL
         DFzTr0hYaCUjPqRubBRf5nS+P5sHJqjFntogpUoOLshcfkx6/b5S4T7gb05uvgCZyfZH
         HoR5WVEcrRYIrBna6uJAR/5FQLLh/EmIdcEnOf3gHzmilpHtwXN/yOVe/rK0JkqPpATE
         HkGw==
X-Forwarded-Encrypted: i=1; AKwUvBwl61fuDJ+9UYHDvZqiaBPHPL/ESKWoNHXkWjdv63SngXkZS9dCNUPis+abUhPOCnxQpcP80VpS7HrHkUHE@vger.kernel.org
X-Gm-Message-State: AFuF++mkW4dJH7XsLavH9o15C5SnV18X/0eeyorkya3EDnPs3ZdkNLf7
	5KVItGFROM+hUBgGwo0UW/GI0TlK3kXrsvp8uHbwrpyojPLeoGN2sZ34Fjfc4Wtqk/eiX+ZNa8/
	22hRVZnx0LmwWv2SyHxZKT8EjrndASGM=
X-Gm-Gg: AYBFou1mc93NJlZhofV2HGmFKXuJXPh9v4NtJzprPld4KafF99wZLbkV/Eezm809MCj
	rbCJsgskrqwzbgYZ4+vcy1u+rV2CONcq8fPvL0OCLMOQJfVakPHP8OmjNLB927+BgRaUvxuYUVG
	RV/fkyB3ofzTDVA0yuv9siFx/c/otWg5HAKH+eNI/mUUvh60a2S7b4QWhyFQ1dmLhgQecrlYknf
	jfvR9NYeAjiusL6U700kFeAFsxZMn864sb/c9EYWe48TLK+RBvt1anfnFhHAdLnEpdbFOyT6Pbo
	9GHtiVuxdNRAH9GtGEVbNN0Vb1P+gNv0chwK9meSu0sAThOFZlDmv379ya8s41+jO4cwMLKwEtQ
	6
X-Received: by 2002:a17:90b:3ccf:b0:39b:34ef:3b24 with SMTP id
 98e67ed59e1d1-39b3d5aaa70mr21302626a91.1.1788880169185; Tue, 08 Sep 2026
 08:09:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-b4-adreno-timestamp-v1-1-273525da144c@oss.qualcomm.com>
 <CACu1E7GGdxTOsn+MRDT+7Guhjs-DDkZVx0Yet=RTxgQ4CNCKhw@mail.gmail.com>
 <CACSVV00BtmA0CotRucd8jG=cQLQw0YmLKEkTOV70qHBx=sG0sA@mail.gmail.com>
 <fl5uoffoh3gyod3f6jxgze33ut4jj4ttmgivtyoa5oykbt2aqp@rkktjz4yh4ll> <CACSVV03ShOw8D8d-5gDPYdzH3_Hp7EMz2CdfA3x08pCKAtw57g@mail.gmail.com>
In-Reply-To: <CACSVV03ShOw8D8d-5gDPYdzH3_Hp7EMz2CdfA3x08pCKAtw57g@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 8 Sep 2026 11:09:17 -0400
X-Gm-Features: AcwNN1UlPD6ctgDPf5NWumSwcQmlkV-egtOEnEpVqtiYB2PLdBiSmUTMS3asYaU
Message-ID: <CACu1E7H9KsUU=dV+iwQPOOX62+V8S5xstFf2LXhzeE7oSb3V4A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: keep the GPU timestamp monotonic across
 power collapse
To: rob.clark@oss.qualcomm.com
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 10:51=E2=80=AFAM Rob Clark <rob.clark@oss.qualcomm.c=
om> wrote:
>
> On Tue, Sep 8, 2026 at 4:41=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Mon, Sep 07, 2026 at 04:20:43PM -0700, Rob Clark wrote:
> > > On Thu, Aug 27, 2026 at 9:07=E2=80=AFPM Connor Abbott <cwabbott0@gmai=
l.com> wrote:
> > > >
> > > > On Thu, Aug 27, 2026 at 7:13=E2=80=AFPM Dmitry Baryshkov
> > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > >
> > > > > The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU =
power
> > > > > domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts =
from
> > > > > zero whenever the GPU is powered up again and the timestamp repor=
ted to
> > > > > userspace jumps backwards. On an a702 six reads three seconds apa=
rt all
> > > > > land in the 500..1200 tick range, stepping backwards twice, and o=
n an
> > > > > a530 the OpenCL device timer conformance test fails because
> > > > > clGetDeviceAndHostTimer() returns an end time below the start tim=
e.
> > > > >
> > > > > Save the counter in the suspend path of the affected generations,=
 while
> > > > > the GPU is still powered, and add the accumulated ticks to the va=
lue
> > > > > reported to userspace.
> > > >
> > > > This is useless because the entire point of clGetDeviceAndHostTimer=
()
> > > > (and the similar thing in Vulkan) is to match what the GPU itself
> > > > returns, and now you've broken that by adding an offset.
> > >
> > > Just to clarify, the timestamp needs to match what UMD reads directly
> > > from hw in various different ways (timestamp queries, shader_clock,
> > > etc)..
> > >
> > > If we can _restore_ the value (ie. write the hw reg) on resume, that
> > > would be ok.. but it doesn't look possible.
> >
> > Yes, a quick check shows that all relevant registers are write-ignore.
> >
> > > Otherwise I guess we need
> > > some scheme where an offset value is stored in memory somewhere, and
> > > some coordination with userspace to add the offset in various
> > > different paths.  But the kernel shouldn't be adding the offset to
> > > what it returns to userspace itself.
> >
> > Ack, thanks for the explanation. I tried to match what kgsl was doing.
> > It reads the GPU timers directly from the GPU, but for the CPU timers i=
t
> > reads the value from KGSL driver which accumulates the offset.
> >
> > If I understand you correctly, we need to export the offset to the
> > userspace via some extra page (like vdso) and let Mesa read it. Correct=
?
>
> Yeah, it doesn't look like there is an existing GPU_READONLY && !APRIV
> BO we could re-use, so I think we need to create a new global (TTBR1)
> "vdso" BO which is read-only to the GPU but otherwise accessible to
> IB1+, along w/ MSM_PARAM_VDSO for UMD to query the address of this BO.
> (And update msm_mapping test in igt to validate that it is read-only.)
>
> (I'm not married to the name "vdso" but not creative enough this
> morning to think of something better)
>
> I'm a bit curious if kgsl handles this differently.. maybe there is
> something I'm missing.  But somehow timestamps need to agree between
> what is read on the GPU and what is read on CPU.
>
> BR,
> -R

I think the kgsl timestamp offset stuff was only added for the new
A750+ CX GMU counter which is not read-only. We do need to port that
over to drm/msm. If the offset is applied for older GPUs, it's
probably another case of kgsl not bothering to keep support for older
GPUs in newer branches.

Connor

>
>
> > --
> > With best wishes
> > Dmitry
