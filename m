Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A42D3B7767
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787744042; cv=pass; b=tu44UvLBAsAbIh8mhYcqi76hA0rRnS2n7xHTDiVbW2gqckHuQIX9mDPTlU7Uan73qedXowRI9t5RyH2P01K/LE5xZxZTVEywq1KKY3zKilvSWYAmjU3XyaWeD2vSHe/ePssymx9iehxHNZRrNqZzxNv8UzGl9S+TCidOJGZgSp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787744042; c=relaxed/simple;
	bh=F5Bm/0SSJaRNsY0ywkSx+Iic4yb+uKAS3tZ4ccoODFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fsGQPO6xv4/iaYTzTbisPZZIrSm31KCNG8fIHzrO/VCv9hJxEtgsrUoumKpln6MUsUddxFFu4zOTX2vKje8OqvGBBBDODOUABTO0l1hYqeFtVbDa7QWJqMw2bH3Lqa3QeucEC+TE0BxzB2rlc/JZz1EaolEzhodeh1sA5JkUVZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gmKkSSnR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QimKZJsx; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gmKkSSnR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QimKZJsx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787744039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f3iwTM4/NXsDryyFjvTD6o3COBIMHHpvoiuq4PcLbR4=;
	b=gmKkSSnRNYMRaWuD2R5khxrDaQPgFUVFQOGrTTGXButFp8rWf4VGAcLxGKA+MLGHHvtoRC
	F7W7VP5yLL4wR9CSVqVQ2Z+sH08cBBoBiHytEBggA3ge7y2Jy2rlgyuOX7EOZy9ivoKmyh
	ucwZI3ND6j/1WVirLWy0SrTKru0SLrk=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-s-jCYDNEMVCx3DpRdic3mA-1; Wed, 26 Aug 2026 07:33:58 -0400
X-MC-Unique: s-jCYDNEMVCx3DpRdic3mA-1
X-Mimecast-MFC-AGG-ID: s-jCYDNEMVCx3DpRdic3mA_1787744037
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-857f88e7b3fso19590057b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 04:33:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787744037; cv=none;
        d=google.com; s=arc-20260327;
        b=Nlq5z4l0SNPDw3G5XeQmw0HdHEiYoOf7EbEJXQMMgSMYCUj/i2HOHJ4Gic+CLVrIz2
         bc7VU+L262W4yfYQoHzlL/b7CILaFxsuX/Hemi+mNYk8GcS97S7E/hShqIx62ZVmJQlW
         nFppbKjy5SekIF2CnPO8IbYqWgRpQelXhw3xdZVUCvuAGMYxT3cI9wtCsmmPOv7B1rXE
         OhKeayhJU/eTtQWD0Iy9qzv8ULkK0vxEx2O/yPCyh4IEVBXA476sXWXCPu/lAPJ20tzk
         whsk3ONJ8/mM0TpK9JZy17LZ7a3KQYl2dGkZyasTplyaO4Xv/OTvR3TDjuCmz3ebfmZQ
         mmDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f3iwTM4/NXsDryyFjvTD6o3COBIMHHpvoiuq4PcLbR4=;
        fh=LCaGMyPx3uM6ZA4aNgc3y46VMFUbev3FMwBV+Ka77Fg=;
        b=Rmtk5ajnmQFZKZh93Y+JlRGqwaJ49yaAfVg+dsVcpO2f6WxJgSjqKU+WxbAbHgMjf8
         WRluIEK6ruGYiqcNLVEZs+Dp+ocTUp+5dIXtf4tefiPbx4R7R72NFhvGC0jn3+CcpwGy
         mjFli63BcQlEoQx1NkKEGwl7EzGECldUtpF2je6h7FNF+7JaLpxAAMFUNU3o+uCuArpa
         u5bxEhLVWH4R3OpOu47u0EYT/+RUPrP1FFUuTYPJZexSgB6nTmuZVoK0s521wGqs1WNd
         jDpBXxOJgIwccTcZ9hHZYx41mAA+TrpToNPrM/VIpvKRriEn34+sLBzBnZX6u45c+NN3
         0xxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787744037; x=1788348837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f3iwTM4/NXsDryyFjvTD6o3COBIMHHpvoiuq4PcLbR4=;
        b=QimKZJsxSPBqSRiisywEtWkCHzUEIzL+RpvzApbj4tuZ5Hhs7//IeHYPgj57Aunsg1
         8ttWh5DzdtlA2MoWOxCU7L0Z1R+Wdo/Io6OjnPYsTlq1xEZzws9m3jR1XvWHuh6k3qe1
         0eb5VdUxver4awXm3wCarVzE0blZzjNqNWIR/gZhU8EHNdKBlq4GEmoFwa73eof3gCFU
         C6F9XXECFakuWAeTP0Dr1ScAH3+SMebLa+5mRgL/Lc+LkJex6owyfhu80DKJExP9GA+v
         F6brqqzTcUR5EW643IvwTIL3ikElg7u3M/+mFNHcFhT/Pd2KwElWeBChJJvgVR1SO6Yg
         gGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787744037; x=1788348837;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f3iwTM4/NXsDryyFjvTD6o3COBIMHHpvoiuq4PcLbR4=;
        b=KVKPnYwt/WYHItocBS8F5iy6TMU8+AA/jNaxV2Ilzs3m0q+sY6WXoeU5fh5aszQe46
         bs+sfawaZJ2BfWBT0HoHBTn4dE/Rn34MGxHhf2btvloy1T/TfwdtC2+SO3JxfS2Nx6pB
         6NxNxez6ADeFgCV1EmwxyRRC9BWxEpviTg4CpXRcgIo15BJ8mWXieebKI7B7MBvLLs2I
         HVao+MIFAMklfhFkv4tXiZ1csKBzbPfjF/+I7i48J0tQIEIWsda06N3e5ZAxeJ0Qg8LW
         ZRS+Dy8hXOUajAK5Eq0ZouvAZN/hyQxMy6YqLxJYB81/hkTt3fytPGMZ49CYo6sHrxZH
         VYvw==
X-Forwarded-Encrypted: i=1; AHgh+RqiSYXQxeCEoKDVAZc0m0NryZOFfro4NLrpliJLVLloxGx/HMyN6Lz7jj1KWg9wzpTdfsUyzGvxPtIm+0Hv@vger.kernel.org
X-Gm-Message-State: AFuF++nBOMEz5wyRhv3t/3RO0Eva8wsb3HLAacs8HSYjvfOvtS1sCT8e
	3flVRIuqGx/m5kYlkGoIVJEiMOqp4yBJFkP40h93vxHnFCmKeKuN5awCQM1Z7uPYhZfsJDdbjYn
	9e7vuiggn5f2XdkawZcMn2kKnI+Hpgdu3aG/cG3wt3kP3Ihz1xQ+n79jTYuuNCbzouj3d7Ahyi7
	3FzH5AqM8yXqsS+ML5XWJx383Oa5r3f9UOZ6du6h3Tyg==
X-Gm-Gg: AR+sD13w8x/Rq79DAEkRwywrl7lG+gUAuCjeQrWq3PJWQdJ/qxzamEk2q/jGPYdrqcb
	Msg9+k9SaEyLyeBCG9Z9cPVpbpl9S242vlVyi6B4q98L5XUcW4P6Cih3Ps8BVysg/u3Hhn/Gwbc
	EW6X5dM184CfTCU7FyMc/HhcJgsSz26YjSAL7VpGnLX6iHeL7I85Fwzwk=
X-Received: by 2002:a05:690c:c50f:b0:858:d554:79e4 with SMTP id 00721157ae682-858d5547cd3mr6008487b3.20.1787744037485;
        Wed, 26 Aug 2026 04:33:57 -0700 (PDT)
X-Received: by 2002:a05:690c:c50f:b0:858:d554:79e4 with SMTP id
 00721157ae682-858d5547cd3mr6008167b3.20.1787744036907; Wed, 26 Aug 2026
 04:33:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824-port-scm-patches-v1-0-1dfd69374402@redhat.com>
 <20260824-port-scm-patches-v1-1-1dfd69374402@redhat.com> <eee2a3eb-6199-495b-880a-7c94a697d900@oss.qualcomm.com>
In-Reply-To: <eee2a3eb-6199-495b-880a-7c94a697d900@oss.qualcomm.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 26 Aug 2026 13:33:44 +0200
X-Gm-Features: AcwNN1Uf-6mEaAa__uwo9Wqh9y-NbWXXV962lwGBnXUqi5hukOsCIU6XqJAp0n0
Message-ID: <CADSE00LgbuWkfQeTr6RgRTA3BP2Y5WccufjFypGVXwrVs_Q=Xw@mail.gmail.com>
Subject: Re: [PATCH 1/2] firmware: qcom: scm: Introduce new locking mechanism
 for SCM driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ninad Naik <quic_ninanaik@quicinc.com>, Murali Nalajala <quic_mnalajal@quicinc.com>, 
	Venkatakrishnaiah Pari <quic_vpari@quicinc.com>, Jian Shu <quic_jianshu@quicinc.com>, 
	Guru Das Srinagesh <linux@gurudas.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 12:15=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 8/24/26 1:35 PM, Albert Esteve wrote:
> > From: Ninad Naik <quic_ninanaik@quicinc.com>
> >
> > With the existing global mutex lock, there is a possibility that it
> > could resulty into a deadlock when SMCInvoke and smc call go to
> > firmware in the same order and both wait on same WAITQ in firmware.
>
> I think the commit message should be extended to better explain how
> that may happen (because presumably it did in  the real world)
>
> A Fixes tag may also be applicable here

Hi Konrad,

Sure, I will add more details for both this and the next patch in the
next version, along with the Fixes tag.

We triaged/ported the patches (see cover letter for their origin), but
I do not think we hit that specifically on our boards.

BR,
Albert

>
> Konrad
>

