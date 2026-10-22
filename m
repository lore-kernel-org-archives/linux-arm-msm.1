Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792681528;
	b=vosY8y+B8yY2f6fqWbCR7Hc0L+Q84zrjpmmmMJDFiVRN4hIFPTr3Acec6xnfTeE154AC
	 QxuQ8l7hHqsP0aQXoBGpLkZ2ceRYfkCLfxKGGewKHZFv3dhvUQt3XR8Hc1/jOWWKyul9u
	 JqScPPYlZzzPT3++YWwF5YYflLkNyI7uthCDO+azQYT+G5CmzNiAmmd35JkfdIpZu88CW
	 LOK3CQJSShSNlrgQYLnTJRF6OL/i21131uu/Pcdx6xJPNpI+ouKNt2aIdhSyUaTz2Yqw1
	 6Cpk/ZMbczAW1Ms496MMtrv/FUkOyFrEa8Faqck7zopp95rezyMsO2GGOBTt+tkgyRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792681528;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=mHIYATDN2KrkydKOA/m++sLO2Tc2mh0OXohgIjQvZoc=;
	b=3gs6/cwBEfa+HVHpKDtmxHmpCbJeGGUx702jegtC+frF6hqyoZYarkMeuCaQnWBNrjsx
	 jRQUlGH7g0E8+/Xp+kWvUwrPNRYYHPZUa8cUFCvX4T9tJSNF0DoutE5/i6pZRVrOWgTBI
	 YzM7P8V7eV+z7cn/bgiSBqQfjaZczbXn0pdA5UJ3YrMkIHEjZMR542IIKM/3m6QhTCtiG
	 A5ZMXYEPrOq3dMk9Obkhc187IPjVQMDh3haoG4NLLxbzFDWQTWYJRMddQdJ1OQqfQO8n5
	 wwRL+IB0Y1RKlbi3y6I73GVfR5Wx34gWYLud0m5u35SdUT7D/lL32n1CG/cAOjyzkug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CBYMRvQe;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=BHv40pAz;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5BC60A383D
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 15:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB5BC60A383D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CBYMRvQe;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=BHv40pAz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792681526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mHIYATDN2KrkydKOA/m++sLO2Tc2mh0OXohgIjQvZoc=;
	b=CBYMRvQe/UomEE7KxpIXNrHpBZ7DiK/Nl4JdYIB+MY3CIBJTEZ7u0OWAuBdECRH8hzyp8S
	cIsgdITt8gR7mZuVfuihwMNL3smBUOSzgDBBIcRZQjwRUtd0OCuOKQptFybpXNwia4bkEp
	pUvdJRV867rmmodKdM2+zJzreIDGBOw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-3j2F4s0cO1qmKXHspGsbag-1; Thu, 22 Oct 2026 11:05:25 -0400
X-MC-Unique: 3j2F4s0cO1qmKXHspGsbag-1
X-Mimecast-MFC-AGG-ID: 3j2F4s0cO1qmKXHspGsbag_1792681524
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48c430f0f01so1688178f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792681524; x=1793286324; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mHIYATDN2KrkydKOA/m++sLO2Tc2mh0OXohgIjQvZoc=;
        b=BHv40pAzNDQh3OUNs68BG/P1mOww7XKXrmb/fJKDIzG2ipOZ6XVRyJDGT5CZWz5xYG
         gJCnfy38BKpI9PKfdB23Omv0MB4FD5c3uaLNrfcb6fxfWMUmqTBBFNYIAUv3oq8+cO35
         BV6gHrTy8+4JLQY9usqM/Ura142d4yYYC9mMyXb4YGZZwXof0lHNdMkqbEklPfAR1d5Y
         KxekEcTIOrCUJxPdvDYDq9+RFocLRdtfFzdmg+A81G+R6rtkaHlLGm6qLScMx2gan8FD
         FKmSSbrL7cp00+xJgoVXPyynAs+FAIrsG7GuE6B4ebRCy3AU7EH7iZG5CCjxpMeSBDoo
         WwfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792681524; x=1793286324;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mHIYATDN2KrkydKOA/m++sLO2Tc2mh0OXohgIjQvZoc=;
        b=l5tYUyJb8NfeNCIvMhViV/Xta5erThFI56ZHdTOglE2Jv9ULfyQJALWXuFdo89xl0O
         bNfwd6FRP0XGoKxUWBgW+ExcL5Zl1sm7cQykvvy9hE461Dd9MZmIqhZanOm0cQ4ajnNk
         Q3F/6O2PaMCzfFnITq1KAlBVdkYFxQRa6xBm9/NTQpNLbdtORcXrqr4Mp6yoFnQPlgf5
         WY7NAtHRljtRS3ONRXZxhyrwEUViZvVYZ4sDY6HI7vFK2kmaT+XAlqvB2BUcogKjl2Rx
         1IJsF+0kDmrEPWix1V3P8n0QMnSAvyH/JlLxytFeSck7bKUnAAEOGpyj8+6zi6OJdk+2
         LXrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDJwMx8t6zno3EPIE3IabraIWMkrEtvmsZ7vWnTkzQOTHiF8RMtoMOjd5kH4fB5RM3XqAflKpwE++1PSuO@vger.kernel.org
X-Gm-Message-State: AFq9FYL9PUgBXhSfhe6ynamMXQg1+IGSqy41yxDdtQiNCqarinATSBFi
	X/CgT+crEp6P/42w3n5Iw7Qzc984AoldIXVnfBP1L9EMXkjpnw06kHGRfpbU9PBkWy5/ojIpDMi
	TExcSNj8ni8fJQjhajne8PVrDPMPXoRaQl8TAlx8gwcMWz9dy1mjDLeoixeaGShcuNUA=
X-Gm-Gg: AYBFou1bXePCNrZkQp2lDisZi9svyZl05koJJnduTfioJc1nOyLt9IzF5uLGOkAA7ax
	Db4PyGY4/LjnoD3AXRBU/QzA33jyKDbqxV2DQu76Zg9hMcy8bImc/h6bIQEbpmedyQGQ5b9T4UR
	ZvYP46IF8BYIpj4aHI9RZ748BWmbouczFXNXNC9V5uQBRQUjMhfSQbA1fxfdU5LlzWul//N5TTF
	iXqmVI3ovc6IxuMTU9pI4/MMZCM3j22EhBISKNejhei9eGuit3Cd/TuFLhnY9xJsrk4K4dFYoyk
	lU+FRZrWbxjbWyo4R9OBIKxMRrT5P6gZFpBMnM1zJIBhc1p2Or6Vta8OFAgDRGyrNAI=
X-Received: by 2002:a05:6000:2c0f:b0:488:7b66:140c with SMTP id ffacd0b85a97d-48e26494127mr10574607f8f.28.1792681523947;
        Thu, 22 Oct 2026 08:05:23 -0700 (PDT)
X-Received: by 2002:a05:6000:2c0f:b0:488:7b66:140c with SMTP id ffacd0b85a97d-48e26494127mr10574548f8f.28.1792681523470;
        Thu, 22 Oct 2026 08:05:23 -0700 (PDT)
Received: from localhost ([46.6.57.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258420e4sm12200375f8f.49.2026.10.22.08.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:05:22 -0700 (PDT)
Date: Thu, 22 Oct 2026 17:05:21 +0200
From: Albert Esteve <aesteve@redhat.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sarannya S <quic_sarannya@oss.qualcomm.com>,
	Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com>,
	Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/4] soc: qcom: smem: validate private entry list walks
Message-ID: <atomMZYbzh6phIFk@aesteve-thinkpadp1gen8.rmtes.csb>
References: <20260924-port-smem-v3-0-fbc2ea81a654@redhat.com>
 <20260924-port-smem-v3-2-fbc2ea81a654@redhat.com>
 <a966fe74-4ad7-4212-a164-f9f6fe225dd2@oss.qualcomm.com>
 <CADSE00L+bJoy5AYYB_0PuJE0NEs-_=y20kDUzPkA=sdD=APs+g@mail.gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADSE00L+bJoy5AYYB_0PuJE0NEs-_=y20kDUzPkA=sdD=APs+g@mail.gmail.com>

On Thu, Oct 22, 2026 at 10:20:05AM +0200, Albert Esteve wrote:
> On Wed, Oct 21, 2026 at 2:39 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
> >
> > On 9/24/26 3:10 PM, Albert Esteve wrote:
> > > From: Sarannya S <quic_sarannya@oss.qualcomm.com>
> > >
> > > When walking private entries, use the uncached/cached free offsets as
> > > the list bounds, require room for a header before dereferencing, and
> > > reject a next pointer that does not advance.
> > >
> > > Skip the cached list when the cached free offset is at the partition
> > > end.
> > >
> > > Signed-off-by: Sarannya S <quic_sarannya@oss.qualcomm.com>
> > > Signed-off-by: Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com>
> > > Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>
> > > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > > ---
> >
> > [...]
> >
> > > -     while (hdr < end) {
> > > +     while ((hdr + 1) < end) {
> >
> > This will reject a header that's at the tail of the buffer, need
> > to make this <= instead
> 
> Roger. This is a bit hard to read as intuitively I would have thought
> end is the first free byte after the last header, so `(hdr + 1) < end`
> should include it? End uses `offset_free_uncached` which should be
> bigger than `hdr + 1` and it would not miss the tail. But being
> defensive about its value seems like the right call. I will change it.
> 
> >
> > [...]
> >
> > > -     while (e < end) {
> > > +     while ((e + 1) < uncached_end) {
> >
> > Likewise
> >
> > [...]
> >
> > > -             e = cached_entry_next(e, part->cacheline);
> > > +             next_e = cached_entry_next(e, part->cacheline);
> > > +             if (WARN_ON(next_e >= e))
> > > +                     return ERR_PTR(-EINVAL);
> > > +
> > > +             e = next_e;
> > >       }
> > >
> > >       if (WARN_ON((void *)e < (void *)phdr))
> >
> > And LLM thinks should compare against cached_end
> 
> This is preexisting but I think the LLM is right, and it matches the
> theme of the patch. I will change it.

I've sent a new version and Sashiko still complains. Maybe we can just drop the check?

We can continue the conversation in the new version of the series. I wrote here because it had the context.

BR,
Albert

> 
> >
> > Konrad
> >
> 

