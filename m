Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8238376BC1
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 14:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790258811; cv=pass; b=HOAIDfIt7qrfr+HaaE+NcQ1juYkO9lAJPjtHVqwvaDliz8+0/XlEuyhcpI8yhzy8BWS461CsoP0y5kjzvL0OTPO6LD5ijSwVpCVo0q3299UMQnyTXvDna/2ijaBIREXdMLwj99DyQUClXZFwQnsAPh3z5pfvBqKqHKbLuRIgoGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790258811; c=relaxed/simple;
	bh=U48nhcTIb1O9uC38fXHDr78q+i4puswp1WXXMZmRwIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eUNcFj6FXt8wLfdYKcEspicj3hXNkV/wIK1hbz2rbntgEfKFZ2Pyvd8t8hz43TRGcN8GXqdNKB4Q/CyvSy2L2wXW0NJGES4I1+yarLrOJV6EhcWBGBK2p9ZyeeXv2RY1r8gkDtObot2QXGeRlTic2+xBlaSd/JV9OSUdKeqant8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQH6OqI1; arc=pass smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQH6OqI1"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0aa8aea53so39248a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 07:06:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790258809; cv=none;
        d=google.com; s=arc-20260327;
        b=OFFTJf9LTsQO5uQpvHbSg10rQGyxe20waI0qqFEVb+dDeD+hKvgrsWBZgbL5/vpSje
         v+XJZpdRpgatOJJlriS/y4PGfnGs3W946hTXSqmNDtQpmhl+nnXNTLZE62vdQOdg6Y9U
         ZaPZz+P79sO4YmHt17A6s7V9rAzxo/E5Y0EtnlH1gMlKXnQQ7v2am2UFtYu8vmV/g6UD
         y3JFH5TsCRsacEWODJtipzATYRCECDTbhV7LY8BNTfDjgqGnt5ob77ufvnyM3qirBSFH
         9sSPOeLQVMtb8fl4UO4IyuWG0Sd615F02md5XoOe0A+B16bllAJzXULHoq4A4O3hFrUF
         hWtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JcTZ3ffRCO1EwcSB6GSlnipqVfq4JrFIZdul9BjBkvw=;
        fh=EOlIiE7sSzoBVapWDA9YAk4/UDyWoTM+vmsjLZ09588=;
        b=F2lfS9FLRdiryxboWN0PX+sMr+kL4+sMJxSEiZw6/V8poTt5xHcX1SaZy7H5YmOFFO
         GOrjvpQJz//Qpl6pk0Eajm/6mU1ENi7N+rXbkoRY/eRYeDNNH8ZjkBNNlb9EnkvNyZ01
         MNDsAvON6atXD+TIFKCE15CkWbbXBJa2alCOUmkMyY7o/6qLShDTwFIi8P86xjNFeseW
         HYAHOVKU4ul2q9NXIat51Mt1KV0FsXnlLqAhlUw/00AzJJLQQZUVHqZ1/n1nPx3tc7pq
         m5m3YI/oz+f6mbfo37eluuXFw63KH1ZM4sL1JWAh5uJxoTeCyCKzs/kpXcCs5ZKAVjT5
         9FQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790258809; x=1790863609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JcTZ3ffRCO1EwcSB6GSlnipqVfq4JrFIZdul9BjBkvw=;
        b=bQH6OqI1uKKUqJodAQL4+Vo1bm3i/t+uSx0+Rx+0Yy61zEDmpRq+zehoNaDbsAsan0
         LPL55fckjP6sPsKS/vgUMEmuLw0Rl5dZQ2udDOvniqbaacyU4xFTj4oTXe3tN4BwUGca
         4/Jn7OMLFB49xiOXAUyfVrvBodvhQg3fb3KlXGuyO5Fdz5WIulGjW1HYN5UZL3BCESDT
         ms7Efa95WMXSiBOFR3adawbCQ3sI9pb1jTxEjADz1CNcB0TtpOAKD/wdRl9UWcr/XySQ
         f+lJ9HALMq05zN2fWZv0fPO9QV4pp5MXsQdAvb4+nRzzXxJ1rZC0/DVPlb+B7MvaPE0J
         JqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790258809; x=1790863609;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JcTZ3ffRCO1EwcSB6GSlnipqVfq4JrFIZdul9BjBkvw=;
        b=uciEN9f30PKS7e1iyujCxsXtC0vl0+0LOfSLeA1rCKclRcFpL9K8a3/segFTpPs/Bk
         nEf0/F/h+1gV1z59/eFu30WZilNy3B2kuGziyUP3mE/HSTmBSPwc2e8jtbN44DqLk5ay
         SsXanVvLVDxVNPkH1+qTrxEmLzFF0PBL+nGQn3qyLAUxlnj/TwlodBM246TqLN/SZ3NP
         iQe7Q0zvl13eFaQK94ULRKSNWbfidErT2qdGvG9fNwGy/IYhhJ3FtUizwno3XWjUG/Mt
         yL7hTSgggVFKJRl0np8Oj4rzry/3noaU+by7pR5k0WHw8ERFZ9ErugOW6VMGWfhu1z1f
         uY+A==
X-Forwarded-Encrypted: i=1; AKwUvBzyDV6WB7h5RXlBCJiG0icFlSpTYDQVrO4m2VgMHHiZwbHIASmzzDOfeMrMQHd2G7IPLhLeNOz0O/oN5dFv@vger.kernel.org
X-Gm-Message-State: AFuF++nbl4abmnKIleOARkQhQgU8k89/u7qGW4ZCnF6WZQQ872rmsahc
	1iIQuz4QrMrs0azEqFcjWEid14XdfHeQgdWfQ4e5e3xDGEtyE8Jd65d4pdIBAYY5PAoSaEzhcI+
	DYudx7sdlTpD9JE3wf7lLO234SyhI9t8=
X-Gm-Gg: AYBFou08XFbFv3AgF6N2aHP4ccBkaHEnjGxN0lbp2IiUji/4+ozULpKYQ4NfaLFKD5o
	121Ceg9Ob3lk8GfvpDMFK/HQTNyfCTkjtiDGYV5Z4PvZLCNcOSZKftZFgm+0nzoHsMqJ1JrCEhS
	A8eJhvmz5LR0GRvunp1Ed/NyrFclJAkA1qZHY5pkbu8PSweKXBLinENX3SsXw+wOCnE9puq4XT/
	QBdJgtLqumja6OeGcN1GmY9nEaMvbfZMz/jAsDkgpT6t0arGgJ67cYoaEAhSckK8QOk4aXidt5+
	Oh23oVwzjLp0AvakCz5gY/jWSj/tXgpPOsDDzElsxqc+ws6XMkHwshiSvSaCK6PVjwL7OHHreEJ
	0X31/kUlOacgf
X-Received: by 2002:a17:90b:3c06:b0:39d:f130:ba54 with SMTP id
 98e67ed59e1d1-3a09837f56dmr4405287a91.0.1790258809042; Thu, 24 Sep 2026
 07:06:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
 <CACu1E7GndBnSj75ZVqic9NxdSakZJL3ZJOuz7D+RbVWA4DUqTQ@mail.gmail.com> <692ff69a-330e-40db-bffc-a53987fa4bce@oss.qualcomm.com>
In-Reply-To: <692ff69a-330e-40db-bffc-a53987fa4bce@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 24 Sep 2026 10:06:37 -0400
X-Gm-Features: AclHuK_K3H4oMYks1o-_9RZ45Z4Udp7YxXFegQ_4Y9VAlkof6K_6cES08nQszX4
Message-ID: <CACu1E7FuCVhu_0gKmVVeBL=e4=zghvXJT=mZVfg8UjUzRrv3Yw@mail.gmail.com>
Subject: Re: [PATCH 00/15] drm/msm: Support for Hawi & Maili GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jordan Crouse <jordan@cosmicpenguin.net>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 9:41=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
>
>
> On 9/24/2026 12:54 AM, Connor Abbott wrote:
> > On Wed, Sep 23, 2026 at 6:26=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qua=
lcomm.com> wrote:
> >>
> >> Adreno 850 is the next generation of A8x GPU present in Hawi SoC. It s=
hares
> >> the ADRENO_8XX_GEN2 family and slice architecture with A840, but has m=
any
> >> architectural improvements. There is a new block Matrix core (MALU) wh=
ich
> >> helps to accelerate certain compute workloads. Also, there is a new Bx=
 rail
> >> that powes a part of the GPU IP. GMU is now powered by a dedicated GDS=
C
> >> powered by MxG rail.
> >
> > If there is a dedicated rail for GMU, then
> > VK_KHR_calibrated_timestamps is likely broken, assuming that the GMU
> > AO counter is on this rail. The AO offset logic in kgsl probably needs
> > to be ported here. Has this been tested?
>
> Not sure how GMU core's power domain affect the AO timer. Could you pleas=
e point
> me to the AO offset related change in KGSL? I will check.

Previously the GMU AO counter was part of CX, which is kept on by
other things in the system, so it continues to tick even if the GPU is
suspended. However kgsl does not rely on that, and recalibrates the
GMU AO timer whenever booting the GMU [1], which we currently don't
do. I don't know if the timer is still part of CX, but if not, then
this part of kgsl could become load-bearing in a way it wasn't before.
It seems possible that it isn't part of CX anymore, given your
description that GMU and other things have been moved to new
GPU-specific power domains.

Connor

[1] https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/graph=
ics-kernel/-/blob/gfx-kernel.lnx.16.0.r14-rel/adreno_gen8.c?ref_type=3Dhead=
s#L917

>
> -Akhil.
> >
> > Connor
> >
> >>
> >> Maili GPU (Adreno 845) is very similar to A850, except that it doesn't
> >> have the MALU block.
> >>
> >> We will post the Mesa support and linux-firmware support soon. MALU su=
pport
> >> will be brought in separately along with its support in Mesa.
> >>
> >> As there is no display support available for Hawi/Maili, validated off=
screen
> >> testcases that render basic triangles, glmark2-offscreen etc.
> >>
> >> The driver/dt-binding patches are for Rob to pickup and the DT patches
> >> are for Bjorn.
> >>
> >> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >> ---
> >> To: Rob Clark <robin.clark@oss.qualcomm.com>
> >> To: Sean Paul <sean@poorly.run>
> >> To: Konrad Dybcio <konradybcio@kernel.org>
> >> To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >> To: Dmitry Baryshkov <lumag@kernel.org>
> >> To: Abhinav Kumar <abhinav.kumar@linux.dev>
> >> To: Jessica Zhang <jesszhan0024@gmail.com>
> >> To: Marijn Suijten <marijn.suijten@somainline.org>
> >> To: David Airlie <airlied@gmail.com>
> >> To: Simona Vetter <simona@ffwll.ch>
> >> To: Jordan Crouse <jordan@cosmicpenguin.net>
> >> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> To: Maxime Ripard <mripard@kernel.org>
> >> To: Thomas Zimmermann <tzimmermann@suse.de>
> >> To: Rob Herring <robh@kernel.org>
> >> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> >> To: Conor Dooley <conor+dt@kernel.org>
> >> To: Bjorn Andersson <andersson@kernel.org>
> >> Cc: linux-arm-msm@vger.kernel.org
> >> Cc: dri-devel@lists.freedesktop.org
> >> Cc: freedreno@lists.freedesktop.org
> >> Cc: linux-kernel@vger.kernel.org
> >> Cc: devicetree@vger.kernel.org
> >>
> >> ---
> >> Akhil P Oommen (11):
> >>       drm/msm/a6xx: Honor perfmode_bw threshold on A8x
> >>       drm/msm/a6xx: Fix secondary rail vote in ARC votes
> >>       drm/msm/a6xx: Fix RPMH dependency votes
> >>       drm/msm/a6xx: Factor out RPMh arc-vote helpers
> >>       drm/msm/a6xx: Add BX rail support to GMU dependency votes
> >>       drm/msm/a6xx: Clamp MX dependency vote
> >>       drm/msm/a8xx: Add Adreno 850 support
> >>       drm/msm/a6xx: Send THINMEM config to GMU for A850
> >>       dt-bindings: display/msm: Document A850 GPU and GMU
> >>       arm64: dts: qcom: hawi: Add GPU support
> >>       arm64: dts: qcom: hawi-mtp: Enable GPU
> >>
> >> Bhaskar Reddy Valluru (4):
> >>       drm/msm/a8xx: Add Adreno 845 support
> >>       dt-bindings: display/msm: Document A845 GPU and GMU
> >>       arm64: dts: qcom: maili: Add GPU support
> >>       arm64: dts: qcom: maili-mtp: Enable GPU
> >>
> >>  .../devicetree/bindings/display/msm/gmu.yaml       |  90 ++++-
> >>  .../devicetree/bindings/display/msm/gpu.yaml       |   4 +
> >>  arch/arm64/boot/dts/qcom/hawi-mtp.dts              |   8 +
> >>  arch/arm64/boot/dts/qcom/hawi.dtsi                 | 336 ++++++++++++=
++++
> >>  arch/arm64/boot/dts/qcom/maili-mtp.dts             |   8 +
> >>  arch/arm64/boot/dts/qcom/maili.dtsi                | 309 ++++++++++++=
++
> >>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 446 ++++++++++++=
+++++++++
> >>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 231 +++++++----
> >>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   1 +
> >>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   2 +
> >>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |  25 ++
> >>  drivers/gpu/drm/msm/adreno/a6xx_hfi.h              |   1 +
> >>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |  16 +-
> >>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  21 +
> >>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   8 +
> >>  15 files changed, 1407 insertions(+), 99 deletions(-)
> >> ---
> >> base-commit: 1e9b8055458b92f9ebab6f39d97ade5265a0b012
> >> change-id: 20260811-hawi-gpu-05b4ecfc3c4c
> >> prerequisite-message-id: 20260923-hawi-dt-post-v1-0-e41473b6298b@oss.q=
ualcomm.com
> >> prerequisite-patch-id: 239c169e15da44519b2dad09ecd92f0052757929
> >> prerequisite-patch-id: 6c586be864944bb1eed773e8c211b898bb1289fe
> >> prerequisite-patch-id: f3d8748ccdb6760563f3e07f701a18388a9408ed
> >> prerequisite-patch-id: b1639353868bed10fd3cbfcd01cfb88b7e737ead
> >> prerequisite-message-id: 20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qual=
comm.com
> >> prerequisite-patch-id: 36f12c16bf9cb0411d8be2f396407c724162189d
> >> prerequisite-patch-id: 28ede1ab83d4b5b56423ebb09bae74b6599b3bac
> >> prerequisite-patch-id: 6b3e28c55c07bfcdca8bfa9219fa0c6c763c6f6e
> >> prerequisite-patch-id: a2007fdaaeaf2981860c54ae5514f5a6f06c6bb3
> >> prerequisite-patch-id: af8aa3c630647336bdaeffa9c88de3650f1e49e4
> >>
> >> Best regards,
> >> --
> >> Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>
>
