Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E83348C5D
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 09:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790760699; cv=pass; b=lhugGPG+YBZOkA/5FbDLLW0cA0eNdx1YDjcSncDw3BLfDXHIjSbyYBu++VLYIvCpjrqXTr3ZHzwNsYiLLAdBdEB1gK900fdSfmGHS+uzpWxY01QDtgfv8w7EhT/yXOih29CUlxG1gtEGLxkLcsMq4eMtFFR7yomsUSpbjnEWabg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790760699; c=relaxed/simple;
	bh=sSCgviBed8zHf2g3xfsl2lv3eFzl+hoXf/vZ34TkSWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RzJU0A+FsceY5HLMnBohsk2P/YluizZ1D4h2uSowl+Ozokk/w2IC0PJhPhGhSdXa7XEs8Qu6x8KVscUEZhejhZI3pwR1hCV8M2geh4G69ZYfn+tGBwS2toSxv5lsuRfTTeRGpISoIj2iNXmFx5nMQYm9DBhr9iHTBdLXLj5m52A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=b2d8MHbI; arc=pass smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="b2d8MHbI"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469e25400so2062327b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 02:31:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790760697; cv=none;
        d=google.com; s=arc-20260327;
        b=cgVB8zdlrZ/MEd0Sm34fgbEdkIlbAJdH/ezjKsMWUct/TUNu9ANwsd1x+bLvNpsM6S
         lMEcnyXr+eOGHaq3/rqsxzRWDolkYyhjQyOHqvnNxChWEoUstbjtcNgEJ4qj+/6+9576
         c4/ty97dwRtiEoFwWmrqeMKT8ULbfRVwrPkRYvUD04N2lRFVmVC0jFd+dJwqXbz1ZrZe
         K28P/gM/fR4jcV+ZBCQTFCPHQoDBvOaApqfxRp1HFfto3EWpsW95fhh6Tox92HBIPaS9
         Sr8roYeZt5BPwDoZzNDiKbuzCFq+mTAsTKvmy7vgKYZJ6CHP1SUwBPx07L/hOuqq0KnU
         JSXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gmqdU3mh7HkwuHdawcYTNlsooyWkbGnJjJwr+HnDbhM=;
        fh=TMtHyKYzs0sgWPL545xN6RMQ2jVg65H17gs6NgrZ6jM=;
        b=QTe0RISdUlF8UIabagDUMe8CL/NNb4nl2Qxd32FiGK+iwMdSn6GOJwEr8FpXOW7cZ1
         JMMsq/eWSqkBcjGiAYzX4t14ahtND5wIrbzVV1RVX49kSaGGs/nq8VH7oqO5qVl9plBK
         Vph/uKmlS2PbtLLsExkHiTD0ejYAkFk0JzWT+X/qkO6Eb2zZqraI26MDNRqHQkNVanoL
         kO79fuZpbrfuxwzAlYPTDI2Nc0yCXXQKiFGF939pwYtxwjoYRFL73JVlLMibxojXT0st
         EViU9tRTJZkzbs3yQix9PZFmNjK0dF6YPKgFi3LWPbnylufthjaCjyP+C6dvEDcfqQfE
         hRxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1790760697; x=1791365497; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gmqdU3mh7HkwuHdawcYTNlsooyWkbGnJjJwr+HnDbhM=;
        b=b2d8MHbI/K2msxANIAUSGWXRSD3g+5IUfmA27J8SV/04s9iV0+KsuZX5Li5UiXboef
         Wdff3WdMdsHQUQDCTaVv5ggfVJK8iCIjpiXJ+OYjGYWv11Psi2r9KQeBS7qIhvGCu6nx
         jb64DZXN9rdOnehgUbQngI5VT46cKm1HcrgCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790760697; x=1791365497;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gmqdU3mh7HkwuHdawcYTNlsooyWkbGnJjJwr+HnDbhM=;
        b=KmjLSS4Dw/sTSEoiyeFls2kz0k5zDLUorccMFH53Pt3crkLaRq+GMj+oCp6EacMisE
         5FrHYqNEWDUa2Hk84m+XV7v1dQRiryTKycz4j7kg9IM285S+o9uIF1tZOrfh4jxxHR/5
         SJuBE0xY1yKjV2JTRtMpCZ2V7Y/Unf7DucyheYwSfKSe0/fu45kalNWoNRDXZDL/+TRn
         vClt3ygRMARSfDY/6AahcocSjHzVbl+66Vnxia5B5OOPxs4MVm4c1yPwSg1jxLk48Az7
         pyNc+aESJJNBRJaj5mZlkDpbeRjSfx7o5QgBYyF3lOGWtEwoei1R7JzGh8aXPohXSHin
         0RWg==
X-Forwarded-Encrypted: i=1; AKwUvBwdQ4yYe8bYP5Kp+kxQlyLfyvs2/tzv+mmfsIw8DTcv61HaWn5oFIjCS2YPww5f6sYoSW32TZCI/euVDAh9@vger.kernel.org
X-Gm-Message-State: AFuF++naIgAgXR5JMO5PeQJSqzoWkrNxOiQsAQv6ljVnSWUnpIr0yOft
	LYj2EWSZ+KhZ9b+5taKOr8ZaYW7YMJ12D1q2vLYnFesao+PGX+aN/DG9Wc4LsUSMVrLIj/YoNXq
	N+7x/ILvSSAwgsjk0ypnTZHgZ/6+ZlsJfhGylbFOuOgZTrNyyWqbePM8=
X-Gm-Gg: AYBFou0M319H7gq1phmFquZoDM6s5Rp9sJuUr3OZCEzLIUW+Ho0/tBHt89MJk4FE1q3
	qslzWFPQb6ozXGxTy5XLYRfkxeVwGrFCJLKlob+bIzICxCm7CHfrchnkUaIPjLU6BmC1ry7v8e9
	JAhP7ZP9mN2+NAkD3T9J0ubgjxk3Twja1X+vAi/PSEP+1QFCRXstX5cdtTKxzM5gD8mZzmd3mpy
	96/3aBlGiLuPIOhvdkyCPFvd6zXfBHOOkSOfH+tvS4n1vpfWoSyG8uykbviFZGmAIUngaqJp753
	kE7qGsx+b6miWJZi8Trv6OJyYMdxSpb4YMvkSxKyzS9NIWS10NOrSEj/riDSsCrCEUOAf1JVoNZ
	dxX/xxD8Z/QdJmJKV8kVTVrQl5AeSzhG4Gl2hYR28O1POYcUg1POlM03W/V8PIvCTUYTp4Invcq
	G4Hisrlw51C9h6UWr8dHVLz7xn2k0mxSZw/LPtjMoT8sIXdtc++G6zmipYwI9VSlIvolH/MX0Fk
	uuW13C4DdXhu3moI4Tdl4NRYVWbG+geEcs=
X-Received: by 2002:a05:6a00:1d93:b0:86a:c062:8af2 with SMTP id
 d2e1a72fcca58-887475beb20mr572280b3a.3.1790760696692; Wed, 30 Sep 2026
 02:31:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929041444.9837-1-daniel@quora.org> <1ca16602-fb66-4706-8e86-3b35372324b9@oss.qualcomm.com>
In-Reply-To: <1ca16602-fb66-4706-8e86-3b35372324b9@oss.qualcomm.com>
From: Daniel J Blueman <daniel@quora.org>
Date: Wed, 30 Sep 2026 17:31:25 +0800
X-Gm-Features: AclHuK8EAJhwPODS-uwXrHzCTd7v9hqYYiYnc0-_fOmkD3ZLxi8pO4B443j8vUk
Message-ID: <CAMVG2svsfP+6cpRq=kBCZFva_r8jXSm+-pp+qC9D372S10z12g@mail.gmail.com>
Subject: Re: [PATCH] i2c: qcom-geni: restore tSCL with 32MHz I2C fast-mode
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Sept 2026 at 15:19, Mukesh Savaliya
<mukesh.savaliya@oss.qualcomm.com> wrote:
>
> Thanks Daniel !
>
> On 9/29/2026 9:44 AM, Daniel J Blueman wrote:
> > Commit cb97bf3d4f91 ("i2c: qcom-geni: Fix hardcoded clock index in
> > SE_GENI_CLK_SEL") allowed GENI to use 32MHz clock. This changed I2C
> > timing, making the Yoga Slim 7x keyboard (ITE 048D:8987) unusable
> > on all boots, and touchpad unusable on some boots, resulting in:
> >
> >    i2c_hid_of 1-003a: unexpected HID descriptor bcdVersion (0x0000)
> >    i2c_hid_of 1-002c: failed to fetch HID descriptor: -110
> >
> > With this change, t_high_cnt 3 and clk_div 4 gave a tSCL of 375ns
> > versus the previous default of 521ns, however the I2C spec has a
> > minimum tSCL of 600ns.
> >
> > Restore tSCL to the spec with t_high_cnt 5 giving a 625ns tSCL,
> > verified on Lenovo Yoga Slim 7x X1E-80100.
> >
>
> There might be a final count which i should get and update back.
> Since this fix is working though not suggested per hardware guidance,
> should we consider as temporary fix and move ahead to prevent failing
> usecase ?

If you can get the final values into a patch for the next -rc instead
of my fix here, that would be the minimal path for everyone. You or
the hardware team can cross-check against the I2C standard as I did
[1, p44].

I would revert the original patch if there is hardware that uses the
I2C 1MHz fast-mode, since the current timings aren't to spec, but also
weren't before.

Thanks,
  Dan

-- [1] https://www.nxp.com/docs/en/user-guide/UM10204.pdf
-- 
Daniel J Blueman
