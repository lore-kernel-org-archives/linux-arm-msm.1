Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793058938;
	b=Wha0nREWefZwQElaZ3Udze4sHIk9lDLtoZU/BdXzub9FMujqZte8QkNEYxx4K7ZBJCP0
	 WNXlNg0hBWiTS7Y8AVYsWMO1QOI4DcbXCHoOpG1gNS75k1d+eHBMfngwz0oDxo1nIsZxo
	 LSyzkDNWUgCop+VL/CtVWvOqPiQ6y7+tigUXz++2t6c4qRuHbDQTufnPcfUu0jNfJReyg
	 Xuz7X501AIvoEkaq3WcRl9G1yoFpV9o6D51BiKzPYtFtZgDGpmPEtUwk8qWc39QM1YXTq
	 cBvgZrCckrCJOo4EqNeA7pgqo2iwly0O1ngJopiTKsKIgAsDV+2XGAoHSR/54BTstsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793058938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZzMX7mFcIWh7Kuz+dntrLxcfYo0Pt/pLtJ3pm/q59a0=;
	b=Dhg7w3ibUw16kO8YtpyLybbEOnW3+riRNx4zmoZnKbs3tGjfw94H4s/mxoJ9aX73uZYk
	 vmjx8SQeZC3Lv/yqtpBEvdtZzLmrDHbE8xw21ylZzlWAYHKB2mzMwAny69+YvjX16JVxV
	 8LVkNPfCYqnSXUbtn3j9sXwxvxQhPxnYD8fXvptFbQprRPGbftl+O+TCMkMIEawy9N6a+
	 zMZHHmKiQ8kjpcCvFG1z7wwT/7791vbkPA01eSof+kKnBtT0b4UjfStg1DqnMo3m6fFZi
	 P1Z1P3J6FMyekiVBIAKEjXvnBsyXo2GyhulbGBvI/pOCNYAsaCXBYvwg16cIWuzn7AA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TQpGK3pm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEC3606A324
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 23:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EEC3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TQpGK3pm
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-917c04630c2so39734716d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 16:55:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793058937; cv=none;
        d=google.com; s=arc-20260327;
        b=VeB4zWIW3yLVa0ss2VSK0xMOVKn0rXH58RboAnXAhmc/6RRv2RcHGi2mcGrpeJWJb4
         iwL2GOWF3QEFkXcT/Ep3dpPLTHkPQUKwkZvvidq3AapbcuYzPQnpmohqcq2KEovfmtPu
         EiuU/v8W6ymMOPGaL9ZtxgtuoTpRCqDSl4AYRkTk/De4+5iozUAx1RS0JFRb8lnffl+G
         9fvQM5smXjulLh0ddp+I/0jLDr2b0lvJhJ+2am9MWNEcbFdiXILPmZCiRx/tREAdRUpB
         1pAoSVcJdnTR42P3Y1rb/JjayIxlGAFO6URmAnFC7z/1hZD6SwV3Em8D0AvOxed4vSdQ
         ZmPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZzMX7mFcIWh7Kuz+dntrLxcfYo0Pt/pLtJ3pm/q59a0=;
        fh=sQLx5C9b0xPQfcuPIY5KiiFqOgGjJIbQx8AR67fVIQE=;
        b=eIc0vyZpY72O/CTXqNQKs2+7ftygJVsAGUk+lWcfd6c4szoQSUDnpUvAhecFbVotXr
         oDhx4EKFov/XP2bGpgxC84H6iiFCkgiUDQocHUaq6xHLN1Xivcqk/98qvFbOi3wWDFRY
         taYSQ5QZPsgO/8dff8ECo+eRHHXfxDdzhiTbYNHc8TdluSs0uwez0BHVDhRdmPqczkFI
         /DE9bOpn/NzMp8CWIJXeWhPS4FpJLJzNi7CgVS4uF5FzCoBWh5yjPyhV6pgm8z9Ezy+y
         ZrbOTUdw0mj0wqroXUrlKE8q7PI2UMonVcxsdIXam6ZiXpKAHJG/VHJGnMU05Pldu7Dr
         lcIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793058937; x=1793663737; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZzMX7mFcIWh7Kuz+dntrLxcfYo0Pt/pLtJ3pm/q59a0=;
        b=TQpGK3pmnxF9Uh6mGxtTM0eoOIkxVBX4Wm6rLvp8nWLojE4nxAZMlCEmoVe/K7O1IT
         lwuyAQWdQRiI3GNV44n3R9H/UshrkWSTq6oD1vkhet1APzf+TpbIQ4vwSN3zzqTDfT37
         Ed1rwH91/BFSMotyBHUJ7VCOgLkpiakvPiEM36ophgmxm6mUSd1mvTljS0SC/rl5+410
         OK142PrbY9MR2EtBXmHC+KgoYWYfkAgFwgXH/cxyXo4KGJhsDsGJzkTrTuf2YDyiXvxq
         kGGTVutZxXnosvs8t+mP2Baw0iZzSIYryGRjIidYlNcspZDzGGY18sntryGZFSDAi7Ny
         3K1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793058937; x=1793663737;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZzMX7mFcIWh7Kuz+dntrLxcfYo0Pt/pLtJ3pm/q59a0=;
        b=dnjwxZvjst3tIht5JpJ0MEHKSSIBFIN2f3XxtAeyQedKol0+JkbLSawX4oes5oZZHM
         swSaG1Gw2qWaOLF2xIiaPHoK0osBZXjcUQKocY1dfwEaL03Ljd/peCVhPcCeAoSJNxJ4
         lD33rfO01ONiq0Po+yt3e0XDIMrUtv9aQHwd/1cWFBNLBGvzLgpPV7sHBRabh4QTcNBI
         Rwy2H1T45/FE8HxEu0SGeykbTvR5f+61Ap/PR9AfLnqPB1GkHFTydOppKIdIBhC2vrgN
         HB3EtsEfzHlMkEV4l1Xdoz0stfy6YO+XHHD0MNZevxlEdBp+zNjtfhOD/O12V3d+bn2G
         oJ+w==
X-Forwarded-Encrypted: i=1; AKwUvByZgNHfQ+CMQWrbIHoFlyPEi51UhaXjms4omZZXUY3MINinGIaxdAaxJHW1EOrzsSQVDT7hYC1PETHoklnd@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7CKvqFg+5xtxwlwDQdFddNTVL1G9J9xj9ZFtVeQRv/ObQsj2+
	eDSoASPnvSVztRzFoB/dUh0yM0K2qZLXuqN3Tvo3ZNXG0cCCsyO9VQ8iR7djpERklY74fCpi4Bi
	7ol7EDqY22mVOQhLxixhdK5IiV4MdHPo=
X-Gm-Gg: AYBFou2Ce1F2QV/n21t2eG7JlLLnYTQiyGKOW7hfM9Pc5S1jr/IMVYTY+/HrRG1nGBH
	Wfa+gCupb+qeFlHuhD72hNaLQJURaCnd/ZB/UeB43rgWPsLy7RotaaO+uWwMDWEr/59rn5kMioP
	+OxvxUHn/Qozm3Yqzm9sdQZC/2oeyMbPuIGBwDVZcND8r0BpRJAs38PofJ5IjEUWhYz+tvwtVDG
	hDMP6qyCkVE8PZDUS9QIXaJtwC+ww2N9OohOtobW9GD0vYcNIg8iMxIq1ssQUFTJTy+HlNTkcIp
	mTQJm0ydzVvHTXfYJBEiV3Pnsu4YQYHwAMTQ+BMhoWjnQQEseyL/pt9Om5OemUykl+kqbSLtArx
	k4z1MOq/tFr4X9Z0d23KLAIkEghdo7Avcs+vEOg==
X-Received: by 2002:a05:6214:3c9d:b0:91b:a702:cc5b with SMTP id
 6a1803df08f44-91c48d21df9mr142161736d6.7.1793058937159; Mon, 26 Oct 2026
 16:55:37 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-msm-dpu-res-clean-v2-0-3d864435186e@gmail.com>
 <20261026-msm-dpu-res-clean-v2-1-3d864435186e@gmail.com> <498e2fa8-b707-4a06-9fe7-9e62253786c5@packett.cool>
In-Reply-To: <498e2fa8-b707-4a06-9fe7-9e62253786c5@packett.cool>
From: Xi Zhang <xz.ca.cn@gmail.com>
Date: Mon, 26 Oct 2026 20:55:20 -0300
X-Gm-Features: AclHuK8LbWKXuTefwbNDto9JuTcVHDIAbeMY8N4dmB0dUoKxhMwBSYQlkgp2Y_c
Message-ID: <CABxuLgMHx+ZvkL=Rs7R2N=cO8Vtyc8FktZ4nUzmCRD=WdorWMg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] drm/msm/dpu: reset unassigned resource slots to
 NULL on topology update
To: Val Packett <val@packett.cool>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Xilin Wu <sophon@radxa.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 8:04=E2=80=AFPM Val Packett <val@packett.cool> wrot=
e:
>
>
> On 10/26/26 5:25 PM, Xi Zhang wrote:
> > While this is not currently the case, it may be possible that topology
> > for cwb and dsc resource requirements change between mode set in the
> > future.
> >
> > e.g. when dsc support is added to DisplayPort, dsc may be optionally
> > enabled and disabled between different modes due to
> > bandwidth requirements.
> >
> > Set unassigned resource slots to NULL on topology update to avoid
> > issues in the future. It's good practice to do so anyway.
> >
> > Signed-off-by: Xi Zhang <xz.ca.cn@gmail.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 22 +++++++++++++++-----=
--
> >   1 file changed, 15 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder.c
> > index 0a6be69a3e83..8d2b4d2726f2 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -1205,9 +1205,13 @@ static void dpu_encoder_virt_atomic_mode_set(str=
uct drm_encoder *drm_enc,
> >                                                      ARRAY_SIZE(hw_pp))=
;
> >       }
> >
> > -     for (i =3D 0; i < num_cwb; i++) {
> > -             dpu_enc->hw_cwb[i] =3D to_dpu_hw_cwb(hw_cwb[i]);
> > -             cwb_mask |=3D BIT(dpu_enc->hw_cwb[i]->idx - CWB_0);
> > +     for (i =3D 0; i < ARRAY_SIZE(dpu_enc->hw_cwb); i++) {
> > +             if (i < num_cwb) {
> > +                     dpu_enc->hw_cwb[i] =3D to_dpu_hw_cwb(hw_cwb[i]);
> > +                     cwb_mask |=3D BIT(dpu_enc->hw_cwb[i]->idx - CWB_0=
);
> > +             } else {
> > +                     dpu_enc->hw_cwb[i] =3D NULL;
> > +             }
> > [..]
>
> I've mentioned in a reply to v1 that this was indeed affected by the DSC
> changes in radxa's WIP, but missed the more relevant one:
>
> This is already handled by the "drm/msm: fix SMMU fault dumps" series:
>
> https://lore.kernel.org/all/20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@os=
s.qualcomm.com/
>
> Namely patches 5-8 ("drm/msm/dpu: clear the ... blocks ...")
>
> Thanks,
> ~val
>

Thank you for the reference link!

Also thanks for the radxa mention. I have some msm/dp dsc work
for the older v7.2 kernel and could use those code reference.

Awaiting comments before removing the overlapping patches
(1 and 5 of this series) which have more complete fixes in the
series you linked. There may be other issues with my series that
sashiko bot didn't find.

(I'm using the gmail web interface reply-all, hope it's doing the right thi=
ng.)
