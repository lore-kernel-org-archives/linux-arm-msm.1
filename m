Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792654443;
	b=fdAFwq1OFDzDJX+ATQlf7GuRs/XQJvh2LhkUf19GCYXg4QAj/CSB3Ia+U/lvLrIcRcZR
	 EUeYHSYO8jlNtOscbQjcikr4BdQ9PrIrtrM70py2JjtGk1ujhEvTXd51sfTS1pV86uEV5
	 3JrOaHj4a45j46A7SYoVq7F5LRsTMUkVbZ5q7c6/bzms8Z67+zN8caEiuDo0QfSduj9aN
	 CMjp5PM0tBRj1LLziuyL6U+v3PBuMqxEujED4+fyVv3etdbrPrG6vtGlDe7ItqjvuEa3G
	 YVKTTpiEbDpBLo40koqu/2EdYyD2E894qDvNsM69Zis0vX+/m0aICKYbQU0wX5mOEsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792654443;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=BcAf1J/2lrij2CTltQkfDHr8Waxgr+ILRHzLs1xcgNM=;
	b=4/rodLO2R7I1qfFErcl+vwFb1SzMnJIkwcRocpUY/fVwa+3Yd8t7TrG1l2pZBtS1CMTD
	 2tjPrPxRUxo+n9PsTlNqVS0iCO6m8EMM2P9oLmhXt4uFV+NfiQ0EMAj8oAWoZ2nbcitsT
	 RgQVvLwYfwsB0Y0VEa5ObfH1uGvGXrEN9HKY3frc5EnzX5Mx30WGAS89kO+6BFBBGRW56
	 1Zvut/SL4CoJ1Y7AK/KSRrX/G7ee8xokRCQxomQzzkDLIU0ws4L9cELqaQ4R8ciJSNgX5
	 q4eKTty4pkBKme9VA2FB6lA8g8oLPSj8DiGygBXWpg/Kty4ldV+NWrKubSs2RkbYgZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=clg1p9pc;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=IvQzt39S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5AE606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B5AE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=clg1p9pc;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=IvQzt39S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792654442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BcAf1J/2lrij2CTltQkfDHr8Waxgr+ILRHzLs1xcgNM=;
	b=clg1p9pc0wIM7rO49uIB4aIKxK9egJSuSEAF4Oo2Nxf2l+HOwAnmhzNMoNt2jd61WzEo4H
	+o/1IkqLB91JfWXzasjP4fDc1YFCtFS+DCHY0cLTxnCh/wrZImDSxfFQ4R/mLZ4Zc38qKZ
	S2dAMJleQkVBI+JeCHvfoyiGMGxTagI=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-Rb0pnxhTMpuyizYdIn-Ihg-1; Thu, 22 Oct 2026 03:34:00 -0400
X-MC-Unique: Rb0pnxhTMpuyizYdIn-Ihg-1
X-Mimecast-MFC-AGG-ID: Rb0pnxhTMpuyizYdIn-Ihg_1792654440
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-677d93efa20so2464924d50.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 00:34:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792654440; cv=none;
        d=google.com; s=arc-20260327;
        b=IIVnRCkf/znaTq4IJ4A7rZkB1g9lRhlHfLrdigeC5eFdJ30kPEbCWKBGssEk6T8q7+
         NJpkfMCZELuifMymMxxcGnFqvIyzLwknVX3FLgaSDQnGR2UdMKt/eFvUzfGG2P2FDxvN
         E7Z6NuKe5qTo92IoGAMHc+9U+7o7XXpXCT9JWLepmrDVThZMFw8CkjpmXa8mFzv/AjqM
         LJM+Pvq83eozxEPjcWRHyWDniLm4cau7JhKK7gm833UnPg892eS+Iqjimkg3ratmPiks
         HtOxyymsPed/RTL254G112mHA5KzkPBsJCNnx0kI9XLRO0xFtx3eOzJKZRRav7PBeqAD
         WWwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BcAf1J/2lrij2CTltQkfDHr8Waxgr+ILRHzLs1xcgNM=;
        fh=qEAfhrIfdjrMAaQbOHwn+uaeg2KmwfhKJ05sbACsVN8=;
        b=gbhOx+2q9vtxtXqUaVGmABvnaIEVWw2w6ma02F0Mx2b8O1PgRQzLmKLf+vvBgIsU9Y
         XDfOjmIeSkUCfKUFEp7A9O5iFf3mnBe6l48/4P+wnA7c1d/2TFasyFSeniDPJ0CVWjty
         5OckGqcuGHtd1mqPFVyP8HL5wk8eXzb/s84ZHpsYhn1oIfY/K/zMeWdqyU3cro6uHfk3
         8e4+ADl66u3arpZ9y4u6XZna42Sn0guH+WFsE/VHN5sEbszAf0KZ+H2OjqL0Pcb4qe9l
         bVCTCF/lxlJIwwk5KLwGIzfoUSU69BARy3w9HY3KHMlK4VNUcTO/l+AkoLhkyATqXTvL
         GC5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792654440; x=1793259240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BcAf1J/2lrij2CTltQkfDHr8Waxgr+ILRHzLs1xcgNM=;
        b=IvQzt39S1T35lapZVZmpq2kydUoR2do2RmsqrgtDvU/v1xA+oz2nUZ5Zh7xGR8Mpuy
         GW9TnqAscnBCVBlSofhuMbFtk8ipqBRP68WI3lWf9XqGTxuzVw7twbs0wMzNGBcYAMuv
         Hqv4R9HTNMJrtLExUm5mhpKxUGGCASBQtqpUDAkQu0zaxMrwAFycDw9I+0ApW2GRYP3r
         XbtEL21RcgIQ4V7WmHPxkWGyjvzF1wIH7ytoW6xMywzGZdRz8ZCRJ/h1hVrterL7QOVb
         evxs9cPwjaPPPL3czrDv74WQ0CZxfGEbO/HhTG1N+6ELxuko818Z5oMjYHQ/HSqgClcE
         R0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792654440; x=1793259240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BcAf1J/2lrij2CTltQkfDHr8Waxgr+ILRHzLs1xcgNM=;
        b=qrGNGAnqKO0L24eUVZWnA81+X8DpfDmIEkf92lyL9WBU9Tv+c9JyYD+fXhwiCqf4mD
         rWYc4U2cB5Py0dg7syqveBfnF37zxQyxhm00hoO8qp72U7RsUmMA3CxfXC6F0Bjd9fJu
         zvFFXaDqFAv/Mn/CyVtZSqnF7yQ/boAIbbq+gJ5oP7JQyHYr9k4U+vcQkHyi9FOE72al
         KSD1MlMX3/3ATBj/1Lr3aaTT+SxDxXr7nWleSJcJJnJ0h42bpa7vk6K1PGnSqUSg751K
         TCuQt17Q05zQcjwpJKgq7M/exwWxgyo/jnAeRn+kP0pMk0pvslLz4W1sFPhyQxuJK7ha
         kSnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdRVRTR52PaL7GmsdSCRa9kVbDPvbEC1uH2ed6Ou5uOc1KisLxIxRS/IxNajzdGnI+DsPh9NTkECQdlY95@vger.kernel.org
X-Gm-Message-State: AFq9FYIQD99FKRhggPRziiGPQDQbA5bdbcv8P8IIO7B96d4HXj2EEPQ3
	uVdVTprRrJhlqwS0VqCH5i5oj5xfbeQcawt1erRRhlrtpVqGwrsowVaGaFG/BdpJY1s8g9wtIfP
	34saKFYfSuo0y1w4k9cimc+42fUWGCefceHnsK6yemqoWYxJD157D+2kopAfpq/BhwpMVbT2zyY
	Fj1GhLv0DKWNHU+s6HjmpJfSr4bplzkEHFNxoYduBwgQ==
X-Gm-Gg: AYBFou2BgyuW9YvJEjs61s7JixnDFvjlOzaqeLQY0dfgqb49rA0I8ev9ylm9JNanMI1
	QUAVtEweEio6G+dBL5XPVMi6CW8lNYD9v3MiB7Hh/KobwfmZ4enp6TgX8+qA3oUrKjvffDyDdTO
	43D8OvUSy7NxBelcMSw0sPXOU4of63mH+CBG58JYzoMWUQjc1XnPdpUw==
X-Received: by 2002:a53:ce83:0:b0:679:91c8:8366 with SMTP id 956f58d0204a3-67a0e5c7963mr1269262d50.108.1792654440117;
        Thu, 22 Oct 2026 00:34:00 -0700 (PDT)
X-Received: by 2002:a53:ce83:0:b0:679:91c8:8366 with SMTP id
 956f58d0204a3-67a0e5c7963mr1269250d50.108.1792654439461; Thu, 22 Oct 2026
 00:33:59 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260924-port-smem-v3-0-fbc2ea81a654@redhat.com>
 <20260924-port-smem-v3-1-fbc2ea81a654@redhat.com> <2c748a4d-b416-4f33-a6c7-195ccda6a5ee@oss.qualcomm.com>
In-Reply-To: <2c748a4d-b416-4f33-a6c7-195ccda6a5ee@oss.qualcomm.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 22 Oct 2026 09:33:46 +0200
X-Gm-Features: AclHuK9ZBhHeOzYstu_mP2ikq1hvzgJLewdIlmjd_fnmryXddeOSGKMDVXUUqwY
Message-ID: <CADSE00J1ys0c4RJgAno2U_O8SZuYNV1ZfNcPBM=RsdwoEL_C3g@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] soc: qcom: smem: add IN_PARTITION_RANGE helper
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sarannya S <quic_sarannya@oss.qualcomm.com>, 
	Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com>, 
	Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 2:23=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/24/26 3:10 PM, Albert Esteve wrote:
> > From: Sarannya S <quic_sarannya@oss.qualcomm.com>
> >
> > Add IN_PARTITION_RANGE() to test that a pointer lies in [start, end]
> > and that pointer + size does not wrap.
> >
> > Signed-off-by: Sarannya S <quic_sarannya@oss.qualcomm.com>
> > Signed-off-by: Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com=
>
> > Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  drivers/soc/qcom/smem.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> > index b5e7bd8c1512..6783a3c533f0 100644
> > --- a/drivers/soc/qcom/smem.c
> > +++ b/drivers/soc/qcom/smem.c
> > @@ -2,6 +2,7 @@
> >  /*
> >   * Copyright (c) 2015, Sony Mobile Communications AB.
> >   * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >   */
> >
> >  #include <linux/debugfs.h>
> > @@ -88,6 +89,17 @@
> >  /* Processor/host identifier for the global partition */
> >  #define SMEM_GLOBAL_HOST     0xfffe
> >
> > +/* Entry range check
> > + * ptr >=3D start : Checks if ptr is greater than the start of access =
region
> > + * ptr + size >=3D ptr: Check for integer overflow (On 32bit system wh=
ere ptr
> > + * and size are 32bits, ptr + size can wrap around to be a small integ=
er)
> > + * ptr + size <=3D end: Checks if ptr+size is less than the end of acc=
ess region
> > + */
> > +#define IN_PARTITION_RANGE(ptr, size, start, end)            \
> > +     (((void *)(ptr) >=3D (void *)(start)) &&                  \
> > +      (((void *)(ptr) + (size)) >=3D (void *)(ptr)) && \
> > +      (((void *)(ptr) + (size)) <=3D (void *)(end)))
>
> LLM is unhappy about the 32-bit base and suggests this instead:
>
> #define IN_PARTITION_RANGE(ptr, size, start, end)               \
>         ((void *)(ptr) >=3D (void *)(start) &&                    \
>          (void *)(ptr) <=3D (void *)(end) &&                      \
>          (size) <=3D (uintptr_t)(end) - (uintptr_t)(ptr))
>

I see. I will update it in the next version. Thanks.

> Konrad
>

