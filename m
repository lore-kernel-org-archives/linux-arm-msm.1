Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE253AD52F
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 14:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174983; cv=pass; b=X62Mw/oFGDpXvmTO4w7IomMt3WoBVUqsR9FWq7JpI8/GK2J2aOIjsazXvoWHt85flo5Xq/ezgf3hrHb9qoZVjmtusTt3EyVKqIQWHss9QSBSNEPbHvKRjMmE7Eh6BoOiVUKE0tXBu67sxvzwnGdtb/eg2z26ay7ZI/NY6Cpxj80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174983; c=relaxed/simple;
	bh=WebFz/x2kN4bRHuJPHFy9SuIkJELXXm1xUzthNsPI38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=obEDREVY5DV3cDKJcDLgtYTP80dXjusq5ZG6cRUrWfadwCuJRGaW7eytSSHV8qHMWdLRScJFNY425dcwPFUTKk3bFQrCRu8N+su1Sjon8jUKC9YtC7+dpkaOTBsbBTGDcGkL7j+cRy5laGXh8jXE/JRvxAtL/VhemGH0v0Zpi5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hZRfFUUp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ljOz8B0e; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hZRfFUUp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ljOz8B0e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790174981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tjtigGpmQBYCeWjN840ZGVkbkxHuJotFRoc5rNE0Iz0=;
	b=hZRfFUUpn2hJsCzOiVv6s9hVvzcr/PSe6xbbcoFPR1ZEkpcqNkwrLvuBz+HKHEjrqafxh4
	SZvtC1m3WRSp/XdlH4LyosVIcIEmK3RpY7xYA10nDOam1bWnDGB/3igH9c5eq5dVo1lJ0k
	VpeKF02ijphqa1gE8AxLNA04XO0o+i4=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470--uxpFqH8Mii4jNbYURcXkA-1; Wed, 23 Sep 2026 10:49:39 -0400
X-MC-Unique: -uxpFqH8Mii4jNbYURcXkA-1
X-Mimecast-MFC-AGG-ID: -uxpFqH8Mii4jNbYURcXkA_1790174979
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-891f27da5c6so12983627b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 07:49:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790174979; cv=none;
        d=google.com; s=arc-20260327;
        b=P7hFziYxGLHvQ9c6Vf/QlOu8rxWITuQI1L1BokXIZTRM7LwRP3d2SU3n8SrAQAKOVm
         SnLq/conzz93nbWoLv11cG77ilyt2Gj4Itdmu0XRo8i0OI6tvtw1K0hC7K6f+8d+/eZ8
         qpXoRD3enyjrN+ElJg0RRt7Of2tmk+wO+7PvIXrJA5W8sjckp7AluUyy8J+h+PN2o1u+
         GQj246SXlTU1JlW0Lg/1w2FPDmvvdmIbhiZOQgliF7XjeAdWmYgI4T4ON9oF979+Bfnn
         UD2+BOuCzPEGbuq9IlFjruP/UydBeOMOvUQdBwJD/1L84qw5oh4ici7ySqocR1cg9F0S
         FHbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tjtigGpmQBYCeWjN840ZGVkbkxHuJotFRoc5rNE0Iz0=;
        fh=XbkJEDjUiCGJbE/1dEgaH10jtq21TeWYwiaeCKFn09A=;
        b=RupiBKmyBXXajPR/QFBGPWJABor55PQM30qUVYynZ3lgCDBuABB46pP3YUAH7/gnsY
         lDh/nykgAEgh8/uNYBjXIwoYgo78x9rUg3kW9N6Gh04oOQ4ZNzhFKlOfPaxn7CfUnUcY
         77Xydg2eaLpwLjVTCy+94Bt0i1x3UgaSpqWyDQBgqXafQV7Pu2VhDNGNtGKuvyWCXJl4
         N/3dvhvi/RtxNnznxvy2qFBKGehwAYcw6eEwXi8RfT+TMFk8PYoeGZssXVAEHdn5nh88
         DAH0gamfyWcHTnTRhxepiao36u4Y254uT8pdHLLSmCVF/Dp3Bxu1eny6ckKXADRsmWKh
         lNIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790174979; x=1790779779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tjtigGpmQBYCeWjN840ZGVkbkxHuJotFRoc5rNE0Iz0=;
        b=ljOz8B0eTXfRZu74H5vh5d4lU26ogBQ5xFf32Rcmn8afynzBXCCcUroG9rxb/sc49B
         Yj4vUfvAJach5g+1eldy/hto4QtutX5sjD1u++Fcth4HovbWVhSKuTvOJfN6ekCxMDyw
         mqCmVSQw9E8N3aYvOxQ6XZc3vLf2EUdi9kIITFx9ItuizuOYwdfLdA2LgqUhJ/j/TsaH
         6SDNnFxJsJb4Jn7R7nAvvMuf131rL3Op3P5j8YqUAiKZkytAj3R9I2gy1LdG7rY5cZxV
         iPYD/Fko3RO6h+IAMnRh1txWri7Wg1LAdA8OZNCSU0vqFeiigLyvxH0DvRRBCkk5rKtm
         XHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174979; x=1790779779;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tjtigGpmQBYCeWjN840ZGVkbkxHuJotFRoc5rNE0Iz0=;
        b=MG8acWl/IdWuJcdjq2JyJkan0KO8jQRS2K8TKMjYk6UJqXzx4YSE7KKqwwCeam8EKA
         /xk6Tganf+UMS8PFLMqlrj5eNUG4CWhUkTriS3U5YF7qdlnLCr9DqKNwk2ATCdKhf/5E
         oJmsDpjJBXmgpmsOP+EQiZuKWFf7sD6TPVRvh1aZvu1KiE51g26ZDIZ1FXr/1cdbR4xD
         kvFEp9HDi2EggEv1I34Nd3fKv4bQMt6cPWy9MdHME75zFj8oaquqnxPubFWgPdBUXmVD
         8TVOPJcqqlbK0pABkob9p+VErTSgDBE4jLcVSeselyFxSxscE5evosfqKzvJHnp5aIvS
         ySyg==
X-Forwarded-Encrypted: i=1; AKwUvByoMhQ0/h0hazAXOH/iv0LBNnBiUYt7rtvntFDa8JroQt01w55cG7s4XdDlqWFX0zxKfisF53ttxqZrR3c0@vger.kernel.org
X-Gm-Message-State: AFuF++n9s1Df4uCc+2HTPX9MQP/GRVbJ0dIXlSxhyl8RtrrJF26ouNx1
	sBJVgjJ5AF7YPdF1X6OQuYLmSCajneaRdRP6ds23ZxDxVcdJVEg1YIFId41gvNQc1UJ53FZ7FlP
	/amIulY3MyPcupWMW4fAMBNdtTDYqCtKabr54ORGjttNqsGZhAUd5qlhgfz6oANiIpJKPVERMz7
	CbpjS4LEJYRRAsDLmU6uAJT2iCqDkuaP3yKAkpgD5V2w==
X-Gm-Gg: AYBFou1Qzj/jKlLjvNqwZh0J9j1zN3WwasS1doN9Q6v7GWnDAyb/GXb9asdiKL7oU1X
	XpnHYarTVFTqIjiEmeyjpZ4iQ7EaCdIGkkulsqdNdfYRWLPGllPh5BRJhXydzNp4yQ738kXnwBo
	6VtqLKbc2U68VxyC+tejXaK4WzkbVaelvv41+rPpnkPzAq2xNo7NtnUw==
X-Received: by 2002:a05:690c:5689:b0:873:5ddf:d85a with SMTP id 00721157ae682-8a45921c328mr11363467b3.37.1790174979070;
        Wed, 23 Sep 2026 07:49:39 -0700 (PDT)
X-Received: by 2002:a05:690c:5689:b0:873:5ddf:d85a with SMTP id
 00721157ae682-8a45921c328mr11363327b3.37.1790174978696; Wed, 23 Sep 2026
 07:49:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-port-smem-v2-0-bb497dd3c48b@redhat.com>
 <20260904-port-smem-v2-1-bb497dd3c48b@redhat.com> <b3ae48e9-c2fc-4d04-8926-503fa6192c1d@oss.qualcomm.com>
In-Reply-To: <b3ae48e9-c2fc-4d04-8926-503fa6192c1d@oss.qualcomm.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 23 Sep 2026 16:49:27 +0200
X-Gm-Features: AclHuK8MZPm7Kj81Y7Rq0M_C-YZuLWYmQS8ZOOU3IYOzjUo1jgQ8cF2XkT5Nu_M
Message-ID: <CADSE00Jrn4E4bac7xoym77jujHuE0+n3Ta_OXpRco2oaORUaWA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] soc: qcom: smem: add boundary checks for partitions
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sarannya S <quic_sarannya@oss.qualcomm.com>, 
	Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com>, 
	Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 3:58=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/4/26 5:18 PM, Albert Esteve wrote:
> > From: Sarannya S <quic_sarannya@oss.qualcomm.com>
> >
> > Add condition check to make sure that the end address
> > of private entry does not go out of partition.
>
> [...]
>
> > @@ -409,6 +421,7 @@ static int qcom_smem_alloc_private(struct qcom_smem=
 *smem,
> >                                  size_t size)
> >  {
> >       struct smem_private_entry *hdr, *end;
> > +     struct smem_private_entry *next_hdr;
> >       struct smem_partition_header *phdr;
> >       size_t alloc_size;
> >       void *cached;
> > @@ -421,19 +434,25 @@ static int qcom_smem_alloc_private(struct qcom_sm=
em *smem,
> >       end =3D phdr_to_last_uncached_entry(phdr);
> >       cached =3D phdr_to_last_cached_entry(phdr);
> >
> > -     if (WARN_ON((void *)end > p_end || cached > p_end))
> > +     if (WARN_ON(!IN_PARTITION_RANGE(end, 0, phdr, cached) ||
> > +                                             cached > p_end))
>
> strange indentation
> >               return -EINVAL;
> >
> > -     while (hdr < end) {
> > +     while ((hdr < end) && ((hdr + 1) < end)) {
>
> I believe the latter implies the former

Yes, the check that matter is the second part. I'll fix it in the next
version, thanks!

>
> [...]
>
> >       e =3D phdr_to_first_uncached_entry(phdr);
> > -     end =3D phdr_to_last_uncached_entry(phdr);
> > +     uncached_end =3D phdr_to_last_uncached_entry(phdr);
> > +     cached_end =3D phdr_to_last_cached_entry(phdr);
> > +
> > +     if (WARN_ON(!IN_PARTITION_RANGE(uncached_end, 0, phdr, cached_end=
)
> > +                                     || (void *)cached_end > p_end))
>
> The || usually goes on the end of the line, please move it there
>
> This patch changes a lot without much explanation, could you please
> split it up so that the changes are more focused? I know the general
> theme is overflow checks, but a lot of conditions change
> simultaneously in its current form and it's hard to track, even GPT
> is slightly confused

Yeah, you're right. I was preserving the original patch as is, but I
will try to split it in a way that makes sense, while keeping the
original SoBs.

BR,
Albert

>
> Konrad
>

