Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792657222;
	b=EbpRLPt9rL2JWeCE0/8ogiPzgDUZXJJmubkONUwcFYzMvlTAsgqceqJzYpi/M9l/H3DF
	 pTGMeLnuJ6CNpRxxsT1okeaDHKfpvq0/QkWAHloWKsVlbO2g2k9IW+6Fl80XiQlOzzLn8
	 YmfNHR7FD1wmBa9e57TiA7x70cld6SN4UWZv0jAUli3WsO1de5g9qAF1CQxXn3PysKRnr
	 RIHV3QRo/+g1updTtjp6JIEEBmu85hGCoHekx0i9dTmfcxwYRQZkxf/AXw0WmvhnaSqYZ
	 1QwCClxgLyUAbtXa8AdbofGTkfl3h7Uwa5bSEXMa3icZGD4Dq0IrcJvEZu8/wyAsa8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657222;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=mOPML5U8VEW36czGnII45orJwLqdlStY1KO/yC+n3HU=;
	b=Zjxrl2ny3aodmdCIBWV5hGfr9qKjvgcLHYAL/0E5Ip47a944RiXtQ9e5KX33pM8Mt1F9
	 YsdJGrieLIO0bH3Sr2kkctpdXINZzWC8LJ1g556cYkUKdgkAvTsJ6RuVGsiGpkSuhrX7/
	 +jk7G06BV/nyD6p921spZKtfAjNXKCsqIG9onr35QeWIHCojvWI+TWo0v7oP59ytAFm7J
	 QLf8+p3rtaIu7r3Cs034nw4zoyFHWCkFO06G+BRMe6EUs2Bc/nudFoQKZHQlrnZ2AMJtO
	 oXCOAMNe8uzYuW4Rmr8YsjVYy3vCKmNpmx8qSuh5wa6OpygDQrUUaBOgYl0Ptui0Jow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hanFPtMi;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=i7v1zPBz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E99A606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E99A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hanFPtMi;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=i7v1zPBz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792657221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mOPML5U8VEW36czGnII45orJwLqdlStY1KO/yC+n3HU=;
	b=hanFPtMiCBmFdggCVpFu+IoQOCKmqd7BNEhuqKwm1ZR9NcZw78I7EQ5y/Uv0H1fs8ED4zm
	Uc0NgT6m4JBNqEztI1DrUiiScFyl5sqTFLix/WpVMTNMtdnWh5A8+vXHI7Fxk5yzkU46dF
	Pwe3tG2YyrugmfcWlEWX+2B9mb1xv0E=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-56ZtsUUvO4moQ9hUzypSRw-1; Thu, 22 Oct 2026 08:20:19 +0000
X-MC-Unique: 56ZtsUUvO4moQ9hUzypSRw-1
X-Mimecast-MFC-AGG-ID: 56ZtsUUvO4moQ9hUzypSRw_1792657219
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6790b1d3bc9so3355871d50.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 01:20:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792657219; cv=none;
        d=google.com; s=arc-20260327;
        b=gnenpRWLB6kE43AMx4t/sPpAl/BtEwEZnWe+NtS3gOEo7oFywbZ49AgblZBsMU/yJF
         yqnEwVLtbT7B8G/BkAgMqtj9RkLGD7BrE28+JzUBa5GqMvRk7yraG7sMzH2cBppVKg2E
         6DnW9sylteHJ4fqqVQlS8KuiQ/4W0o+85CUzKj8GXC6Ju8+uaYfkH36xuW+R1WQI7gHi
         XNLKX7E069940AnA/F31gUO5rGbNYFXfUlZtzMoNXOVCy3KozjxSG9/SrGYBJZBhRuVh
         xt93vkVJRj/PAcXVroZcm8g2/jsfk7yCT5gNEu5JoW/wt+Hfe4yNxZqyA6xzHH8AGJd2
         B0lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mOPML5U8VEW36czGnII45orJwLqdlStY1KO/yC+n3HU=;
        fh=Wh11tOdRpNgaHtf7Hz7A8NuJlDpn5V0YnTerp6ase3E=;
        b=R19jdVfQOHSwQhtkbW6SVch8GvoRFKSM4ArCT/i6Yx+YfbbyU+L7SiWmz8QUDe+7jX
         K8J3BwCPZL8t2lcO7aIzW/ivNVbkcRNoCF1t7v7vC+gvT5BfXKqrBw8CB0Tsf2OCjpWF
         TlhW0/IpYVhbIbf0QRchypd5q5D6iKBtZp3DAicLoAbuTGCl6WFjfiqbr+hdBrgl7Vf3
         Uk5nj7qlZ6nmHh0XOtMV/6POFaMOY944oukz4z+R5GaMBaWHfcnbNpQu17dAkqtplg1H
         8OYVfgBCPXL+YpWqjAqE5ZEwmwZ9rRZ4jQV0gajXr4M02fqn2x2SMIJNQ4dX9g6X/g8s
         a9/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792657219; x=1793262019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mOPML5U8VEW36czGnII45orJwLqdlStY1KO/yC+n3HU=;
        b=i7v1zPBzdSSIKJArIdZdoHl29jM+DoRGp7F69B5Jmi5XMLcUYFzLMqjRl6hpcnm/St
         2WF94FiPrPjfNu2e6r1SSkz1H0m5cN3WNxlTIDglaINruD6mM4l2xzCv4pRjQFdfGapE
         mUjEYIrwgtdFpyfF128BRonujc78bAROMfgM8NWArvLaVfzH450rqHpkrod5AkrcXgdC
         QmqpszVemkQYBgl7LJMcqM+UA4uZ5BvvsplD2Wx0rRbZayb2KAZt0J7SSq/t5lbXsXJ4
         1B+SZkVnL4Q9NpvRNT4L9AQocKOmoVX2hYTspfqLfLiP7yPkVTrmdh0YYASF7E2fVtwp
         UKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792657219; x=1793262019;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mOPML5U8VEW36czGnII45orJwLqdlStY1KO/yC+n3HU=;
        b=p3jl53PLo29drtPKnS6iJIWSybkAX4Deu2qJqEkaJsFPPZsNZ9PpprpYQMrI0vRa2g
         Jxt7/qUI+TnVa62GNOHS6HKWi/YZ+E2U3GN/w8h31hMCxoAzBKAe597IonhhnbtsrzE7
         VLwdtJaFN6mhBg5nN5n5HK3iT23w52RYbg1UR63qCe3edaU2rHMx5ZE92qAYQnHAu8aE
         q3/rrQcLhO3x/vWXkZOR4s/cTH3W/tdPfAdFZgufqLTMXKgcOum224BEc+WtgMSWbXiZ
         XKZth0hvNkdkP9wDPl4mQP11DMkfdVm1qlrMJ7n0UXuRiLfEwNvVWx/TrFa9BOO/uSMH
         46mg==
X-Forwarded-Encrypted: i=1; AKwUvBzGUSBIBxMOgHrqFbr2OR8DrOgp+oS7Y2JkABhS0Tc3JULyARsFV+ybKVVVA436lJeXEWiU5ArXNQnnZvrS@vger.kernel.org
X-Gm-Message-State: AFq9FYJoqEEd7hN7l7ndv6aalu/WMf0ZifSv/WvfHSBZqm1ciIyTjKxs
	hcKtfff0BApfAoaIHiUoIK6nS3qLyGSBrZXZQ/KpKYb0ZQ1orGMSRi7myn+XfqWNbItoPibta0R
	ZT0MoQdnsWmIYX7n167uVVTFIVgtNLvcflknmFSGoZCWEmjFHYkVS6NLG4EKgJHKFQzP07SylPr
	E40ER8+9RRIrpPwcTAXIRdJ/Sfg42uxUUJH/eYHBxPLJ+9pveeQo/2
X-Gm-Gg: AYBFou3P99OEB3VcZsr0Hf5NEihIAcIbKUeI8CkbG6WW35YO2wBWTGGhb71wKzq81eL
	/pwPR1p2cel1a0uKb7wQgd9Ih7LIK1IvgkZL23IILyQrE/OKcZW8I7Tn1qZ5CzskmVRis3pJr00
	/RP1AAV8kJ917N+892gftFH7GhEZuE//Fy3bQS8v/fM2F6aHss7ghDzA==
X-Received: by 2002:a05:690e:1514:b0:679:b744:a2f7 with SMTP id 956f58d0204a3-67a0e4bb145mr2614742d50.59.1792657218793;
        Thu, 22 Oct 2026 01:20:18 -0700 (PDT)
X-Received: by 2002:a05:690e:1514:b0:679:b744:a2f7 with SMTP id
 956f58d0204a3-67a0e4bb145mr2614726d50.59.1792657218363; Thu, 22 Oct 2026
 01:20:18 -0700 (PDT)
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
 <20260924-port-smem-v3-2-fbc2ea81a654@redhat.com> <a966fe74-4ad7-4212-a164-f9f6fe225dd2@oss.qualcomm.com>
In-Reply-To: <a966fe74-4ad7-4212-a164-f9f6fe225dd2@oss.qualcomm.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 22 Oct 2026 10:20:05 +0200
X-Gm-Features: AclHuK_Tyqu5hIV8_npEM13kfzEj0eIHEeaQc2EWnm4Yof-uZCDUZ3gkXffsLrI
Message-ID: <CADSE00L+bJoy5AYYB_0PuJE0NEs-_=y20kDUzPkA=sdD=APs+g@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] soc: qcom: smem: validate private entry list walks
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sarannya S <quic_sarannya@oss.qualcomm.com>, 
	Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com>, 
	Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 2:39=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/24/26 3:10 PM, Albert Esteve wrote:
> > From: Sarannya S <quic_sarannya@oss.qualcomm.com>
> >
> > When walking private entries, use the uncached/cached free offsets as
> > the list bounds, require room for a header before dereferencing, and
> > reject a next pointer that does not advance.
> >
> > Skip the cached list when the cached free offset is at the partition
> > end.
> >
> > Signed-off-by: Sarannya S <quic_sarannya@oss.qualcomm.com>
> > Signed-off-by: Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com=
>
> > Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
>
> [...]
>
> > -     while (hdr < end) {
> > +     while ((hdr + 1) < end) {
>
> This will reject a header that's at the tail of the buffer, need
> to make this <=3D instead

Roger. This is a bit hard to read as intuitively I would have thought
end is the first free byte after the last header, so `(hdr + 1) < end`
should include it? End uses `offset_free_uncached` which should be
bigger than `hdr + 1` and it would not miss the tail. But being
defensive about its value seems like the right call. I will change it.

>
> [...]
>
> > -     while (e < end) {
> > +     while ((e + 1) < uncached_end) {
>
> Likewise
>
> [...]
>
> > -             e =3D cached_entry_next(e, part->cacheline);
> > +             next_e =3D cached_entry_next(e, part->cacheline);
> > +             if (WARN_ON(next_e >=3D e))
> > +                     return ERR_PTR(-EINVAL);
> > +
> > +             e =3D next_e;
> >       }
> >
> >       if (WARN_ON((void *)e < (void *)phdr))
>
> And LLM thinks should compare against cached_end

This is preexisting but I think the LLM is right, and it matches the
theme of the patch. I will change it.

>
> Konrad
>

