Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BAB3D25A2
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 18:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786990125; cv=pass; b=NheaChxfDaV94XHSmxcq42u4HQDAE8440jr7JrZoQtAwryG8Qd+IPD/vw6EO0EJ1fPVTxW57N9UsQPVPSbnKxIJS7SlhtVjMnAe9n3QjGl19AEvLcoocDXw5jwLHyaEcNtzlc6TKbddKNVNKsmRd246aq+7mQWfTa/YC7aSw3YU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786990125; c=relaxed/simple;
	bh=g9vm5w6edydR/psOaPLVrWIm43mfOABWY3KZ4s6f9J0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j4V8RlxwU78PBlEwDDqv/7/vuql6eUJr4PixoYQNeXqTtOZwmSnm3+HNLkK0/4DjvibO54BBJ07OG/zEQgpJIIKvdoIBFISqpj4WGf6Ur356wduZWwy+vljPN8/QgiHQrtBXrtgdHQ0yuW1cOTQJu1943bxtAK18Ur8DLrDdX7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWHhQg4D; arc=pass smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWHhQg4D"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5c2b6d3f2f6so145546e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 11:08:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786990122; cv=none;
        d=google.com; s=arc-20260327;
        b=C9mTFN5Wm8tN9GNznawqZwNNOeM7LBY0wDoMEyXP6AiaX/Zre1jvyFf0tvtrcb5Jcy
         ZzwLVlWz9na9eas/FYYwaEXTk0EEVt4p2aCJXgBR4w7UP1M0Q//4nVHSw7Q0kuoJeGjj
         4eTEwQTm2Lt8BCd9Dl5HYWb2rTMcn/IwiyTSlu1ioR1gLLjklXupNEsBre3UmSfooVoI
         VERk/iDVWwkjf7IkYyChcNtnWh1mIkwYvGmzfeJuCv3u5r5ZYRiNsjAf5mpRqJPBa2qw
         Mx42w1FPY5XdSQkR6NUE3zjeBfTePVtrQ1DfxOMoZ9ZP5Igw4CGznCsMuvucHtQdlcn2
         X7ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G5mJBVeRBN256FUPWqFXAEOzYwxXlado9G43KCVVgU8=;
        fh=WqEhPGa2b++s5UPSYCeWVx84uLTNotNDGNmcWJC4ipk=;
        b=B2/W8umuqs8pStqyepekEn0hlwUgjSec0BoxXghrmmzIdzpS8a8UXMQxKn9T++cnKE
         EfRRglanSjQT5YMEFNAfXOBf48nsAYIHixXd5eAbJgODtSaY2t7SHrn1xQYX5o86sJkQ
         6Oc8P5Ubygf/14/7uFgMZh5at1uzIWh1lfIuuG1Pwh+rpFXWwdBfPHIgh2NSDtA+PVyW
         Nnz0j6PefwciKinVsoCQV4yPfE2IynCn2VKAqAgwDIgaSW5fTf+t/E7dywWhOVHelgxf
         OzHkQGvpilDg2YcvDlMqKtQXEDQOUU6mpi5JHZ413bf99yDit8lFsEFCvuqm+dQcBwjN
         q4KQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786990122; x=1787594922; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G5mJBVeRBN256FUPWqFXAEOzYwxXlado9G43KCVVgU8=;
        b=BWHhQg4Df0G4Rm6VKsGONzMO4otwcPwIq8sHSLOt5GLLVFrjMsFRPRS0akYr9QAkm3
         CsbGg2oTdBDbAfDUlDnz8Ea42ugJaOJLwKeyS6nrq4pE0/2LZWB1kGcqyv2+XraQ4Bdc
         Pc//YYPeKcf8+vNfOz6dBX3w+UMV+85clBEM+NYLoZza36N30MnVzEZjeqsW5gG1Tv7T
         D1Q1RE/MtUM694HEXDdoP89V5KzDxZC+pxbhictqby7StjSesm9eVjgGqBJ/SiBmdLVa
         C4DcqaiNhMvhqvKSsaRDsqiah82WBC6VjfxNa6aD4Pp3FVzVKZm6OE9vgs5SYOpamCm/
         a26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786990122; x=1787594922;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G5mJBVeRBN256FUPWqFXAEOzYwxXlado9G43KCVVgU8=;
        b=YVODtOfCt4JDwwRQXpXc+okRsS3MuMBGmVgWcHhWfyGlFoO2wvcYS9AGxacP2nQd1W
         xvI/3mMmWZFgoQFI6PyjpxVszLEecwndhs7tOuB/VC0P+GwGYtrqNBfBGCP9IKTLuuMD
         4iya1UBgt5qxrVlqeVtfrD+pr9gBqF2mFyy/qWl+rvJ+WsTJJLTz8cWDbm3VbP4tXtMp
         aVotUnT3iRzo+yMQRc2bUm1bNGUGpXGqCWj4Qp3QQgfDEcfrIG1jhrdBqpRC8skQuHji
         eG2OjFKEqYiby4ad6cFyU6czuPhGOycXsr+3PVTSeaCbXw47E4bh2wTl5XdtV27ylv4m
         kHsw==
X-Forwarded-Encrypted: i=1; AHgh+Rp4LNve4E9WNQG3etXIdpvXHTxmnkKwNYsGFC9OEOZY7lRwVojC1MwhZYbPEDjkYFa+yQJF5YDfOmYt6Z+o@vger.kernel.org
X-Gm-Message-State: AOJu0YyyIwFA3qkl7ya97rQkUDmCoZy2as90AJpI2nNUIw1o8JTIjPdT
	Zo3yRv7AegUIQOCK8oXC3wrBFiaUWI99zduZZf7IP5ziY2omH6+Q9eMTk2p84Ah2MJ6ERWK+EMz
	spz48HJSqN7N8dBDMYYv+zLbRmK1J71I=
X-Gm-Gg: AR+sD11qvXmNfyUzwp0Q8SrPWYR4FLgLgmAR19+0MyG7ywuNA3xbPPSj/7t36JrOQWe
	VXo9z7hoyGqcU09pETY5ZCnE72HIDpU1Ico3dMlAP+F3+8XjTzNB9TOD12UsoHquGK5vghoR7dg
	EYqxvz62CUlXkvUbw7nb0bqNNtWSkXVAUCoHaKFIWRZ7gQO4enexUNp5sNbPCsT7a7Qw5lK5i/w
	Ioz6OIKIKp4eiX6svmUfWo+hZUEwE0eR9mmLKNX7qjU9TPQZ+cOP4m2CwdeSfcKKwIrxiN8DbLQ
	k+kSbF8EwrLeo52W5r+a4/dNjWQwDEr2o5FwIdbAj4FkH9o=
X-Received: by 2002:a05:6102:6888:b0:745:17b0:10d5 with SMTP id
 ada2fe7eead31-76f2cd6ba90mr1698150137.3.1786990122356; Mon, 17 Aug 2026
 11:08:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710194638.1502-1-saileshnandanavanam@gmail.com>
 <bc13f78b-287c-4832-b2f1-a68e7b35b57d@oss.qualcomm.com> <CAF+TLO0F9jQ0+pPei7iFDqcC-gKd44gc5SXa-o_dBKzNsHKU=g@mail.gmail.com>
 <CAF+TLO0S-Sp9PWKhvGeRfnxMaV7ZH=Ncr-p4NAu1pvE8odLTjA@mail.gmail.com>
In-Reply-To: <CAF+TLO0S-Sp9PWKhvGeRfnxMaV7ZH=Ncr-p4NAu1pvE8odLTjA@mail.gmail.com>
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Date: Mon, 17 Aug 2026 23:38:55 +0530
X-Gm-Features: AcwNN1XbJOOIvkV8kvtl_H-i18dMwgL565JAwIvCltqfJM4L9alfTNXqZpQAn-0
Message-ID: <CAF+TLO2YiAUe0Yqzg5fa7-wKUVcjWUzULszhxYbzLqFak_zk9A@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Fix off-by-one error in
 regulator error cleanup
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	quic_akdwived@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Konrad,

Following up once more =E2=80=94 still hoping to understand whether your
comment was a correctness concern (the err_enable/err_set_load
fallthrough into err_set_voltage) or a preference on the label
structure itself, so I can send a v2 that addresses it correctly.

Happy to rework this either way once I know which direction you'd prefer.

Thanks,
Sailesh

On Sun, Aug 2, 2026 at 3:12=E2=80=AFPM Sailesh Nandanavanam
<saileshnandanavanam@gmail.com> wrote:
>
> Hi Konrad,
>
> Just following up on this - wanted to check if you had a chance to
> look at my question above. Happy to send a v2 as soon as I know
> whether the concern is about correctness or the label structure.
>
> Thanks,
> Sailesh Nandanavanam
>
> On Sat, Jul 18, 2026 at 1:27=E2=80=AFAM Sailesh Nandanavanam
> <saileshnandanavanam@gmail.com> wrote:
> >
> > On 7/17/26 3:01 PM, Konrad Dybcio wrote:
> > > The first two labels only unwind a single regulator
> >
> > Thanks for taking a look. Could you clarify whether this is a
> > correctness concern (e.g. the fallthrough from err_enable/err_set_load
> > into err_set_voltage not doing what you'd expect), or more a
> > structural/style preference (e.g. avoiding three chained labels in
> > favor of a different approach)? Happy to send a v2 once I understand
> > what you'd like changed.
> >
> > Thanks,
> > Sailesh
> >
> >
> > On Fri, Jul 17, 2026 at 3:01=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> > >
> > > On 7/10/26 9:46 PM, Sailesh Nandanavanam wrote:
> > > > In q6v5_regulator_enable(), when any operation fails for regulator =
at
> > > > index 'i', the error cleanup path unconditionally calls
> > > > regulator_disable() starting from index 'i'. However, regulator 'i'
> > > > was never successfully enabled at this point, resulting in an
> > > > unbalanced disable.
> > > >
> > > > There are three distinct failure points:
> > > > - regulator_set_voltage() failure: voltage was never set, load was
> > > > never set, regulator was never enabled.
> > > > - regulator_set_load() failure: voltage was set, but regulator was
> > > > never enabled.
> > > > - regulator_enable() failure: voltage and load were set, but
> > > > regulator was never enabled.
> > > >
> > > > Fix this by introducing three separate error labels to handle each
> > > > failure point correctly. For the failing regulator at index 'i',
> > > > only reset the resources that were actually configured, without
> > > > calling regulator_disable(). Then roll back all previously enabled
> > > > regulators using 'i--' in the for loop initializer to skip the
> > > > never-enabled regulator.
> > > >
> > > > Fixes: 19f902b53b47 ("remoteproc: qcom: Initialize and enable proxy=
 and active regulators.")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
> > > > ---
> > >
> > > [...]
> > >
> > > > -err:
> > > > -     for (; i >=3D 0; i--) {
> > > > +err_enable:
> > > > +     if (regs[i].uA > 0)
> > > > +             regulator_set_load(regs[i].reg, 0);
> > > > +err_set_load:
> > > > +     if (regs[i].uV > 0)
> > > > +             regulator_set_voltage(regs[i].reg, 0, INT_MAX);
> > >
> > > The first two labels only unwind a single regulator
> > >
> > > Konrad
