Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B1A314A9E
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 14:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900775; cv=pass; b=iAG/Ax/iarq5EQY+1QpAnztqUJD5LOptNLa+aXb9gYmxwkwv+Jzx3CsecqLR9Jh0g9a3sbKzyQlhXC6wLecvU7rk21hOsvn1RNj1mt0sNLypuqQSdGz8SYJLO6FetubsVW3vdU24tAmv0kOlDPMB9obL44sDI0dK6RxXyuPky1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900775; c=relaxed/simple;
	bh=xLZbOw6NlpdpQQwlf9qc1ls0oU+m/TcpOZm+5XJ2btA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LVGnMH6H1JQAyYlPcIQkpEp9r8xL9BKdKFWw4TWjR+1AXxAQ9ZmvgVxiJBNLRVIowgVbqcMpHQNY7px/HE7sKQw2EgAjxyjS0/5oq4cDVNCY61uAp9Q2ZTy6T7cR9Xr7UQwTgjsZe7cvWyG8//pQ/WkfA7iPzmtpI+RukWyTWks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P3WSDt0p; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oqL7twmm; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P3WSDt0p";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oqL7twmm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791900772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X4f548bT13ES1ASPlNMKyS3qtXOvU5fyTD3IipYzJ58=;
	b=P3WSDt0pjw6WwXgry7kGJbob+Hpik1ly1bOvSLpa1Bdiopjg18hhJ81jG1x0w2FPVT2qW3
	W+g2FamnK1/3sT/5+VG+h0h2q+/HYrVBdYii59rl1F2OI23q9Pnoxic2v4ID352PqSk8Ex
	UHiqPHr9tmgexzsUV6BlKJ1jftuB3gQ=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-4Wx_1MVcPfSSVJDhT9BDNA-1; Tue, 13 Oct 2026 14:12:51 +0000
X-MC-Unique: 4Wx_1MVcPfSSVJDhT9BDNA-1
X-Mimecast-MFC-AGG-ID: 4Wx_1MVcPfSSVJDhT9BDNA_1791900770
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-820ce3bb94bso3617769a34.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 07:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791900770; cv=none;
        d=google.com; s=arc-20260327;
        b=j0FQrbUceCbBgCv8G82in7dWOxpGhF5SeTR0DEkBPM4jYQBCVlZ+nJTPNHg5ogF9Np
         k4MW40OlbbaDSwGWE+VHe4Rhchj7XpNzqZA0nizdhdpH/KXauJz6wJQ7qsQNoiIgOCo4
         Y5P8G9IjI0z3wJw/FcPyMZrJSc9gzJp8D39gZrLLwE8ky8MPSSx7t5P/13GfnHKisOcg
         MnPMnCXk7hF4GXhaKp0PPbh8QwkG+Uve1D/fMP05nR+YDYBuyeX3L5cCOfBQt0YzlkOv
         7BHBvgrq4hserE5Pwipdzoe8VKxIdw3zf0B+LBq/KXbJavWiXlTvYyU6yfmzzXqXyRRZ
         1U8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X4f548bT13ES1ASPlNMKyS3qtXOvU5fyTD3IipYzJ58=;
        fh=HWBtga8ceB3fUDXdWzGrnu3ShFZRGCbYF9nxMb7R9AI=;
        b=l1yk5NX/5ZrU2jV7AEUktthU1M5Ixq/ga3+TNeC0Qu35ii1M523QF/EnfPGOJgkUkX
         ZzrwPbh8AdOGYNsnRoIy/ltQJg6iVgC9l8lePOCFZLZou5GYCgdjT9CZJ6do9BukM4hF
         h2SGDtTVhZZFoRdg9Odp88qmeZwGTtoiWx+QK6Rd4h9LTctF8e/rQtHH6JZ7l6dsaiTJ
         SKMhK0mOq/siar5BAurtd61LIDJpUvuMyv01CqIRwWpRR6J6HTvKhA3dXYN7FYa4Ac0R
         lDKy6Csj8zqUNL9CsfD3XV3WTg4z3O8K3ZdGfCeA91l/Ft3pWxoBx8ZV+ZSeq8fjpHJu
         Tn6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791900770; x=1792505570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X4f548bT13ES1ASPlNMKyS3qtXOvU5fyTD3IipYzJ58=;
        b=oqL7twmm9f4hr4AUpHaPlcK7+m9bYQdYHPZXAkoTJ2ufdaHYVIXHjW02DIihF0gFGn
         Ok5XU4NWOQWnxPbTaPV+v3IWTqTP7naJ/E3T7TK17m2V+CXZ9OaSHIDlbetZe4wQibKH
         Q7AaKg48xKvsMbwq6L3eFCIlJPuUxFgrIN02GowM15iezNlFuk3/jWMmiJxHU7EBacYs
         KG13FkYc2AGEN5dYDa63klKLGvCouX7/rOcY5F94ZcY2Auw9rk9hJDA4pWkmoo9RsBdr
         Ue2OqOmMrQcYegNYrhBuj+7c71bURB47VRgZ7EyAsRzRMLNjf+BKg6nF2qxQTMJHqLim
         l3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900770; x=1792505570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X4f548bT13ES1ASPlNMKyS3qtXOvU5fyTD3IipYzJ58=;
        b=TpqpvtRh1VlblV9Tklr8qv82vMuy6i2Nom2KMxD3SXPNjJWgfP0/v6B/9GMjUAJSzK
         1ac5yZxh882hPYPdsNKh7tTkyLIe4Uk70/ixddqz1eHqLXTXF+Kd9OxnwTnF6cWkwE5a
         Cf49jR3BJg1sGqJMIqYJ5EpBnCdaoCCIVtNVDICau54CJxugUZEf3Dxjvp2L63yUDE2A
         RR2woJG/d3ljqUBwmY7zpQ5jM7DJyorSYe6JgKUlt9HTy5NOAPlxuDv2iEndZ2I985GS
         KInwf6iKNu71yRtny7h7jI6hZl/CdK8PiFWMTvcwOVbSkLmlM0Cb/TCKglM1tO/NdCWq
         WmQA==
X-Forwarded-Encrypted: i=1; AKwUvBztL9q0XalFcRGHM4ua5cZxEuNgJVuFIkuU5CZcsjPJPCmNghmWuWJWHDvIfBud5InOVcsn9rStLXLSyaw2@vger.kernel.org
X-Gm-Message-State: AFq9FYIh6tNQGBfZq/7/U7oIWoaXZf08MpaW/+bD+2fL90bFpKc1UECU
	ji0/noTKup44ICII4+tEl/nVY8uy5wpWZQh0P4TZ3Es+xaGC61Rou8ITb9VUjzqk4gboeM4Tbtf
	EOr5Afzu9utvuGbntcfF+H6N8LrEPSUz9T1qk1eJNjl1Nyod+ZV9C43sP9RxJ7KGpZcXl9Hs6tN
	rx/vFQKWu81qtBBCvxK/XXWwB+idMa0vljVe3BUtYdLw==
X-Gm-Gg: AYBFou09aqWVrMbuxsZcGgfQ+beCZpFnITETaFEKnqUDnGGjl0NynjIVBbN1zVJDW2m
	iq3AdszbnWkW6UGoIZM5a0V9Vg7xBDVC1FRfmSluFxq4ouo4SPDgIZpCe5as/woYQwzfzM9/5bL
	N35pyZ1TXEgeKhrAnz+LNKaLPcKSh5vIPTaXLD0/7PaL/ATK40L/wGfg==
X-Received: by 2002:a05:6808:1818:b0:4fb:bfc2:1a78 with SMTP id 5614622812f47-50c42a25b68mr11292920b6e.2.1791900770477;
        Tue, 13 Oct 2026 07:12:50 -0700 (PDT)
X-Received: by 2002:a05:6808:1818:b0:4fb:bfc2:1a78 with SMTP id
 5614622812f47-50c42a25b68mr11292886b6e.2.1791900770020; Tue, 13 Oct 2026
 07:12:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-port-scm-patches-v3-0-17520fa3c541@redhat.com>
 <20261001-port-scm-patches-v3-2-17520fa3c541@redhat.com> <687efc4e-e19d-4cea-9d2d-45de1ea2cedc@quicinc.com>
In-Reply-To: <687efc4e-e19d-4cea-9d2d-45de1ea2cedc@quicinc.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 13 Oct 2026 16:12:38 +0200
X-Gm-Features: AclHuK-MnA9uh9kbAvzIVnS8SQD_ihp4EByVodUv3ybcAA3lUVVpgaO2hPNIgdQ
Message-ID: <CADSE00Jf5XAf+=Ovz=MsagkA5DK-mpZ-mPoiMb1Z4Qx8GpmrGw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] firmware: qcom: scm: Allow the SMC request to freeze
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yuvaraj Ranganathan <yrangana@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 11:30=E2=80=AFAM Pavan Kondeti
<pavan.kondeti@oss.qualcomm.com> wrote:
>
> On Thu, Oct 01, 2026 at 06:16:49PM +0200, Albert Esteve wrote:
> > From: Yuvaraj Ranganathan <yrangana@qti.qualcomm.com>
> >
> > qcom_scm_wait_for_wq_completion() waits in TASK_IDLE. That is
> > uninterruptible, so a thread parked on a firmware waitq cannot be
> > frozen or killed. A long wait then blocks suspend, and shutdown
> > cannot tear the task down.
> >
> > Wait with TASK_IDLE | TASK_FREEZABLE so the freezer can freeze the
> > waiter during suspend; after resume it is still waiting
> > for the same waitq completion.
> >
> > TASK_KILLABLE is not added. If a fatal signal aborts the wait, the
> > driver returns early without issuing QCOM_SCM_WAITQ_RESUME, leaking
> > the TrustZone execution context.
> >
> > Fixes: 366f05e348b2 ("firmware: qcom_scm: Use TASK_IDLE state in wait_f=
or_wq_completion()")
> > Signed-off-by: Yuvaraj Ranganathan <yrangana@qti.qualcomm.com>
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  drivers/firmware/qcom/qcom_scm.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/q=
com_scm.c
> > index ea4481385412..92cee2263ed4 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -2664,9 +2664,7 @@ int qcom_scm_wait_for_wq_completion(struct device=
 *dev, u32 wq_ctx)
> >       if (IS_ERR(wq))
> >               return PTR_ERR(wq);
> >
> > -     wait_for_completion_state(wq, TASK_IDLE);
> > -
> > -     return 0;
> > +     return wait_for_completion_state(wq, TASK_IDLE | TASK_FREEZABLE);
> >  }
> >
> If the wakeup happens while the task is frozen, the task will come out
> of completion only when the task is thawed. I don't know if there are
> any cases where that is not acceptable now that we are making all
> non-atomic calls to enter w/o mutex.

As far as I can see, the only caller of
qcom_scm_wait_for_wq_completion() is
__scm_smc_do_quirk_handle_waitq(), which is only reachable from the
non-atomic path in __scm_smc_do(). Atomic calls return early before
the semaphore. So all tasks that can park on this wait are non-atomic
and would freeze together.

BR,
Albert

>
> Thanks,
> Pavan
>

