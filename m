Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7FB19005E
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 15:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584523; cv=none; b=FfYvq6O02RwTFQuw2cR4i7+k6tjOncnDF6mcHjiOR5snRT5hMyPXbYGeFT/WTpTzSgzM9r8Bfw8AeBYbTkJVhbNJNgNSAFQLASxq8GzPqkKSdZX3DjYVaFQJ46ippLSWRQ/e7MYNvG+6uWHHHZ1/iJ5doqgOu3p0Nab9rfO30Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584523; c=relaxed/simple;
	bh=qK1GwUEcsGrPCSm9TsEBc8oiljPcoxu8605ddv2YQNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLs8NpIDWpv08Ok95IHJ6jMlwQrETJxAKt8qKQ8P7V81gjJiSzxN9mc2fpAfFavb61jQrpv3REaDhbIeOZpPaxKq/oXnd+pGSlNWAkxrWb5GoTkREEnfWAs5pXo/jROg24DH+KYc0aNAe4lmWH3mHmfgbks/mW2aNQWVD99zWI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A3r3oEsJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rk8tUfzA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A3r3oEsJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rk8tUfzA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/hQ/sSTFs5xLRC8XTkDORGtcjc0aCfdkhYo3Pbbm9UI=;
	b=A3r3oEsJp2anXKMkSqQlVJUS0Eo6wFCIamz6h2C0neksO3xhZohiinKYcqCH/qZ72PK5CT
	BLWRaZKM6agv4QZmNoIAp76OBSoPHubT7jkP14SngkpVJK6tnwdAoAFrQtYi4405D1hQyt
	AcaSbSaVfY2qZTDwDiMD3LPM4BlSMzE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-YDhjI-nkOGOWFPtADtncag-1; Mon, 24 Aug 2026 11:15:18 -0400
X-MC-Unique: YDhjI-nkOGOWFPtADtncag-1
X-Mimecast-MFC-AGG-ID: YDhjI-nkOGOWFPtADtncag_1787584517
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e820609d9so386886385a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787584517; x=1788189317; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/hQ/sSTFs5xLRC8XTkDORGtcjc0aCfdkhYo3Pbbm9UI=;
        b=rk8tUfzAdkry9Zrf8HgdlN3NHCFhhA8aMvyWWF7lpzX7tefwbjZxuoPGaABcfgu9Lr
         UyH7bVA/5O6jkNfcmmTheyGpcz92xoFoIhZAROAM4+MXJTuhs0MbLqKBfc8HrgiNGr7Q
         KGIfel0AFnR7F9DunaGh+34ZWU4n9uyhhNTeyg+HGUFWcS8Qsjh/nNBoLjyZUvILJluq
         gLh7dUwD7+H82m+laVBlNmAaYwTlWh2boEf6bkpDjLo02biWUfynrPJMSOX2skZeY+rl
         Dg1snmD3W5iJd+6FiOBggGXotAbInOIs4evKN/aBlQOJ+X30ccBLwN5yK7t4tNmXd8TY
         tm/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584517; x=1788189317;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/hQ/sSTFs5xLRC8XTkDORGtcjc0aCfdkhYo3Pbbm9UI=;
        b=PFSJohNQXs203VYJgs+sNN+Wb9uiUVpMtKL3+WpsqXUGM3yazbTCWLe4HlSimeH1bs
         RY2QLT5lq0CSLQEX9f7NStnDHxx1jaf4BrRYWu/gazN9PIKfo6KwoSyR4h3xHmLzmf36
         CYvowlRuXTV1c3a9epFW0Otn4czcaEtp71I6ovjbvCLGAULoXZtAqomYGlRm+zQWe8aE
         ku+MA9L3eKgiPvTO0NnyZ7Dyo1AwVsVfSQ7+Wyp36udGpy+MR+v40gOwWsSqKIltN023
         Bugm3VnUSBrzUBd++b31bNj1a8atrBcuIyvRDy24tVRmRtUxF+sXHEcV9omshMavpSEc
         wrgA==
X-Forwarded-Encrypted: i=1; AHgh+RqKNm7drbPovX5hmPMa+L+PfX6yLC96Bf8/Ei0n5vyEyEq7sFW/4mgMbkgPZAOgToL/PRTDmCclHx6Vohit@vger.kernel.org
X-Gm-Message-State: AFuF++lF459YYN+FQq2WlC3fp3kP7PrLUp+7Mc1Lhj5qT+VLZ1dhEnNs
	zfgphLFCd7dACFXcePFKE7eHx26b0T+143JeujLj8545uGVUfIQkztqywLtc1O20+OJFYaE1jB1
	e25C47P98owW//756baM0XfI5zEVULngLkiP30S/yOqkmZAaD4aqdLRDZY7jUKuYFJBk=
X-Gm-Gg: AR+sD11QEpvNZRR9TqWGDhX7IkywKGQUP/ylwGBmbkCTndRvTh3/IH7dmuahUS6RE1i
	ujwUv3wed80sT2g86YTVzGNvCniRUylxsayoNaFFxuFNcHs1DfpsbErbUkj/cylPnK0hcAso6RR
	X1fSRgj8yDbpBP+DSQfPwve95hdJF7Ejpccvot8/bANxjAyNVX4hErFx0cWc0vpFgB0S0AQruLz
	sJB7Rms00ZiJ1iaNLzRc1P48aNC9od1IrYXdobvsM0g6Z6GkSsFv1jK+grHVAQSJrQlG3R36ju+
	8HjMy/ky22hyHSUVjSOoYWYMzmwrW+0Rqaq9KwIf7HjKmBAqeZB1du5TPPdfUlXzU2PU+KGaPPq
	SBnn2co34qg5MG+7zsxUukhGCkZLp/lCt2is=
X-Received: by 2002:a05:620a:a28b:20b0:936:9f47:e908 with SMTP id af79cd13be357-937394a1bcdmr1968165585a.19.1787584517486;
        Mon, 24 Aug 2026 08:15:17 -0700 (PDT)
X-Received: by 2002:a05:620a:a28b:20b0:936:9f47:e908 with SMTP id af79cd13be357-937394a1bcdmr1968158285a.19.1787584517040;
        Mon, 24 Aug 2026 08:15:17 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749abec47sm517147585a.1.2026.08.24.08.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:15:16 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:15:15 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] ASoC: codecs: wcd934x: Make sure clk_init_data is
 fully initialized
Message-ID: <aoxgA4ty6zhxEwIZ@redhat.com>
References: <cover.1787239902.git.geert+renesas@glider.be>
 <560811bcde4b8459b5e96c131e50a94ee75664fd.1787239902.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <560811bcde4b8459b5e96c131e50a94ee75664fd.1787239902.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Aug 21, 2026 at 10:52:56AM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>

