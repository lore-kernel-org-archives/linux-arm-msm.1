Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D556569F3B
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 13:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960280; cv=pass; b=pS5TQQr79Md2L1SfNCFYDrVIvont2SA8cbTEMIAEYkm/mGxdg1ZnHYyOFPsBDusGaYAWd5GKDMXjU+SuFlzyF1gW6W0UfTNSc5hpb6ff5xzYmIeJ6QRevswZ54lBposdwayitqQUqTMOnV43AK8Ek5u2gkojMRBV24Q+3djufnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960280; c=relaxed/simple;
	bh=dAe+a4zELch82xSDA3dN2f8QTvE2pyX8JIAm1UCPsnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QytjZEQET2OukKDJrd0oAUvG/AdzEMuKilMYzra9PL98BDwvSd/sdz6Ul7uQL0/cObpxyEQyYpNPDViF0fjB2eBawBSPAzU3+ItQrXRMiC6Ip57NZ/KbktqQmTO12UC1FLA/pW/VFNUjKxsNfND8xlF9bwk1UZfn8L7EtDl9fQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8ib5qvT; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8ib5qvT"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad861b1so825528a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 06:24:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788960266; cv=none;
        d=google.com; s=arc-20260327;
        b=hu1DRQf+pqlcIzRjtGdnSyqPnOgZPvc4FJLXFausT+ZQm3ss9YFzZOta6fqpOcTemi
         oyN+VmZ4i+028XHtgeAvE1tfXsJpb9nSFBscalRivdBdQtt690fcF6W2fGy7TXiqZNG/
         ygRP79FJxEJixx5DNBoMabKY5BnHY5FT+n0eutVDxjZFXUsDvCtGDJpAGdoOtaLBhVuW
         S8Pe4SDv/RDvX+wWtrCMRJyX0DNxRcbvv8SAvLk5mLDQMs3S9fRMZI2ZCHg5L5RWglJ9
         1J+DSzk5GJNB6h6i0yBiKrpi1yrZgxXTNPCYgPUtrOQx6gazo6hJDUHq4EJKae6bIjJa
         a2cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nWDGOx6XLuNNayvEPs6THIuSRdlyzHqLn64Wfdmy9F4=;
        fh=LF1wj0S8wcx6+Sbip5fUMTjzL/XKZQkhhTSXOrc00jE=;
        b=kFs3G0QbyIm44O7bpvU1Ps5VS8Ucd7GhNsw1nf1J2UAUbovQThTWkkdr9/lUK5Bdqe
         pLKSBAEe6QY5vJn0B3+jo430i7ggHP5kHXzE0YBCoBfXetd79GExhSLoWYcPMBbhQ1DW
         AFa7UJTftkohZtzb8yHsWiDpcTW/svtB5dLhDy5Nk5q1+799qhK+wmnAa1gZ0+3PN9ep
         LNjmqmPUZ6emPdSqHvesfozGMJrt+NpEWyqC6KI/4dBCxn848O3JOrrsD7p0Fhjx5BTv
         WZF+S2QZyz2D8WV65i37E2WEPysRQ7oSto/16/9aVgkXMgoVt7CHIvwzd4v6pL2vTx+f
         4zKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788960266; x=1789565066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nWDGOx6XLuNNayvEPs6THIuSRdlyzHqLn64Wfdmy9F4=;
        b=T8ib5qvTWRROhnEESek5leX8Y098BcJfE5yet623iYqFyEWZECqEfOGQPWXWOBp1xq
         1SUNnEWJUFwICT1iW1GHcdBy8S5fndv5fKG+yocY+bkW4BBKv08RW63vGyIeyI7cirPy
         Lyk7s7hzjaITYEqXk/p7JdPgzeJG+gXktDf7I9rRsF30Wb/CmuO284rEJ02RGiQrRNGK
         KX8zQAa7KDeXzXRgTYnW2UdgL/TbRhsFozBUE32T73+/nOSbtSN4AwoRgXe5WE0F9+ME
         8GoUeLCA3vl+hQ6FEJCy83l8CUSTi7b/CuLkJ9e3lbVzYN8vc+fQFz+NqgJxHIy2tSUD
         W6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788960266; x=1789565066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nWDGOx6XLuNNayvEPs6THIuSRdlyzHqLn64Wfdmy9F4=;
        b=YoVLCCyNibrLbvqcaMBsW5sAC+K4Q+KpYgS9dJw5D2cSWtnPp74SuCnJvcK7NRRugB
         rlzq4fEnP0LVDKJ23h5eM9VdMrKxGni/YUeExerAqv8kqZ5Nccj/bLsb56v9sxc4LU47
         7yqZgfX3aa6smtoJonn6zlLZ3TsmwGo6X1FF/vydotmlmjC2Ml+RN+AQQb46yuYIQiKf
         fd7yAu/ArizVPerU5MN35Q64RlQOqGgh4gCylfgvINRqbaUEw/p7XjuAekFR5K5mtjwv
         pGQG5CIPtxwqH3L2x4rML1eHtC8GT6sR9zHO1Y82ZSCTLeqSEp9cjwfl93yBXrot1up4
         2AZw==
X-Forwarded-Encrypted: i=1; AKwUvByOhvK/5xhkKawnV8k3tpFB8dktCYqL1rEZSyi5z4ljTcuZgYDI491XT65gjWZfKvziy7rpxEziHGP52stf@vger.kernel.org
X-Gm-Message-State: AFuF++mUaGFLxA1HqavNrv/ckXuN0yOGjIdW6RyrWwi0AJABqs6LqoWL
	PqPRsfVliQifqUoGCLLS0tE16xaeDX1BH9l+C4gSpZW0DJdKsSTD6sBHhmX99I27Ds4IquWa/fH
	MdesPcknryOc7ECN4bTJ3IZfKtBnjeOE=
X-Gm-Gg: AYBFou2acEDRHT1aWMA4Stlx1Zo/i43T08wqJPqSefEOn6NAroF/82ov5+I0cPQDRHv
	k1NxYOmp9xQVFEnQLklnHUm1XEuXyccFl0Y/A/3B1c5lfAvQpsi+aL+nLZj2UYmmp9uXaa/NftL
	jCKXCRulgJI5avD47uQsgqJfbm3ogtX4lfLRQfcQSNSgjgx0zNPllF1NKwD/Phu1tH5KRdYNmNo
	gTMD3sEofjZWT2+g5MHTWV6aSPRLTJ1JgKYgnoM7SBh3jA4ylGOZSyd7ayZLYxVS77PLjyqlWRI
	MYwIV8A0errKDQGnm3CYbg2jMOyZl9pRQ6UCsn5pTbKq6fzf09FmIj0DetBsqPCyN69LhTIQolI
	4VSQpgBZiT8RxXIX3SCEGow==
X-Received: by 2002:a17:90b:3907:b0:398:bada:832b with SMTP id
 98e67ed59e1d1-39b3d8a3d1cmr27490020a91.6.1788960265594; Wed, 09 Sep 2026
 06:24:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-0-284880d6e68b@linaro.org>
 <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-2-284880d6e68b@linaro.org>
 <47f0399d-bb31-48bc-b69d-4abd445727b4@oss.qualcomm.com> <5bd35343-1bd9-43c6-90f9-d57d67e6d416@linaro.org>
In-Reply-To: <5bd35343-1bd9-43c6-90f9-d57d67e6d416@linaro.org>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 9 Sep 2026 09:24:14 -0400
X-Gm-Features: AcwNN1XDIGqxTwFTzYxc9ACHpOeiJfaYEzctXSxy3CZjTiBOkSiKBiUHjwpg3z8
Message-ID: <CACu1E7Fs-=sKJ07Pcb_7BCTFaXLCMVGEu=yQ6+hfG3Vjc2Y_RQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/a6xx: Use CX AO Counter register for
 timestamp on a750 GPUs
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 5:32=E2=80=AFAM Neil Armstrong <neil.armstrong@linar=
o.org> wrote:
>
> On 9/9/26 11:06, Konrad Dybcio wrote:
> > On 9/8/26 3:24 PM, Neil Armstrong wrote:
> >> The a750 uses the CX AO Counters instead of the GMU_ALWAYS_ON_COUNTER
> >> register on A6xx and other A7xx GPUs, use it when running a A750 GPU.
> >>
> >> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >> ---
> >>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++++++++---
> >>   1 file changed, 9 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/m=
sm/adreno/a6xx_gpu.c
> >> index f9de9329dee3..081e79ea4652 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> @@ -23,9 +23,15 @@ static u64 a6xx_gmu_get_timestamp(struct msm_gpu *g=
pu)
> >>      u64 count_hi, count_lo, temp;
> >>
> >>      do {
> >> -            count_hi =3D gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS=
_ON_COUNTER_H);
> >> -            count_lo =3D gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS=
_ON_COUNTER_L);
> >> -            temp =3D gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_=
COUNTER_H);
> >> +            if (adreno_is_a750_family(adreno_gpu)) {
> >> +                    count_hi =3D gmu_read(&a6xx_gpu->gmu, REG_A7XX_GM=
U_CX_AO_COUNTER_H);
> >> +                    count_lo =3D gmu_read(&a6xx_gpu->gmu, REG_A7XX_GM=
U_CX_AO_COUNTER_L);
> >> +                    temp =3D gmu_read(&a6xx_gpu->gmu, REG_A7XX_GMU_CX=
_AO_COUNTER_H);
> >
> > KGSL apparently *writes* the system time to these registers, is that
> > an idiosyncrasy regarding how the vendor userland drivers then use
> > this counter?
>
> This is a GMU counter, no sure why & how KGSL or freedreno would write an=
ything to it...

It is writeable. This is part of implementing
VK_KHR_calibrated_timestamps. The idea is that when the GPU suspends
and resumes, we keep track of how many ticks it would've taken and
then pretend to advance the counter by writing the CX counter (after
powering on CX but before powering on GX which initializes the normal
GMU counter).

Note that VK_KHR_calibrated_timestamps worked initially on turnip but
the tests started failing with v6.19. I haven't bisected yet but my
guess is CX was never actually collapsing for whatever reason and we
made it collapse hence breaking the tests. So we probably do need
this.

Connor

>
> >
> > Konrad
> >
> > P.S. looks like a8xx also has this counter
> >
>
