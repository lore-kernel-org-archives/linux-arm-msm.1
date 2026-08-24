Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1537356755
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 15:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584533; cv=none; b=Yhl0xQ8eg48Qf0PsHJ92KkI1Hf/2ZHZ+v6yeDZlq9cz0t6dR/aHG9/bEca9fXzLWwOGu5MYH8scpASFUe0aVkCwwluDlSO8jwINdE2hEVQTRhhmYDvPqu5z9MdeQp4iYIH/1pUfQ+PKnxkzRFE5rTfzyP4GBn8oKUsDjXHsNgkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584533; c=relaxed/simple;
	bh=rOXrxHiKVwq62hDB+l5Iaw/LvrpFfNRsCnnE/WH3O80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwrXULQmJVkai4urI1YdRzhySV2+l6rQlNJ321CxxmO3T7v2rT3yfQCFrs7TlmoMG8suBKbZnZVPGjwmPy5wB/zN9aLtKVknz6EMTVXmvGjY8Vm69wkUtVbvOJiEXUPWIrICpaI1+i6bmwFloJYjqMvoMAXZVRzhYVlm//ngebg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OHonTQKe; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PnHgmFiI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OHonTQKe";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PnHgmFiI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QomLv2Wl9amQb+LBn6L44LQaCfrla4njzarG+GnuCsI=;
	b=OHonTQKe2KAZony1/34W0BoerHadscdyBQdDvY3PeyAyditbL2wC0+jJ2A8tC/3PqNuhEo
	dZHE1Cu9v7W56f/nH34Mo3pItDvGZ+KsUsRrXwZ+OvPOn2CN4D1XjJwEmPLj93eh2Dhl/g
	61CK542WV99hw14Llyibbz+vZ97hu20=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-qtXR0sO1PGmWNUMDFDFevQ-1; Mon, 24 Aug 2026 11:15:28 -0400
X-MC-Unique: qtXR0sO1PGmWNUMDFDFevQ-1
X-Mimecast-MFC-AGG-ID: qtXR0sO1PGmWNUMDFDFevQ_1787584528
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e695a3b28so468801285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787584528; x=1788189328; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QomLv2Wl9amQb+LBn6L44LQaCfrla4njzarG+GnuCsI=;
        b=PnHgmFiIeEFOzJPRycTYNEL6DiNmOpBGvbKmkJOg1Wz1oZK3V4JXQ9ndew5HV6p+yk
         g3shBAlx9usB5EGdmoVtUrRk/oZyiB6Vv1yTRONK7JMNHg+j+R5iiVNs6bl5Jyn8zSFV
         Oj9c4haZfKMFOW//wY3w/bLbfgTk07hIcw5xRsmG1LI7P7U0V1nW2WIdMvUtil51L+gj
         udxxiKVI5ukxEd9AKc9tv+sEfv0XY9QdRw8fVZ7kAdYgBvDDkF+mx0GekZV3Rpy34n8+
         1uDi0aWj4vvCHuYyu7Zrla/Z6cSNIlHpnKGdEMbt+cx1iBdHHnXkNq8DlMLB5yT9KubJ
         hSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584528; x=1788189328;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QomLv2Wl9amQb+LBn6L44LQaCfrla4njzarG+GnuCsI=;
        b=S1i7U0QaLLk2IQRwlqHiMvuq4vT6Nd+HWP/PH2ns4kOA/ORV1xtPIyxvURCCRLd9FV
         FuIK59CQPM3PkhFRLbvf1Pib0L3bUF4RNLbu5FcdKXV/o5VGQWoG8VDdYBTbbwa3mGrR
         37qjugVjxmq2WvJWaFe4uRGp+YjRd9wM9QZf/cVs51a0MNTwGLK6xSfYGuogBrmqMG5R
         bvSefrfy2jUlCroVdLysrUVJrjjJqc2LTpKmZTE3sYlfYquFdsGTC0q48bavkrAQTKjZ
         FJiGCEVNRwRIEhd7aafbZEDhX2LBPEVXk4oDtOi7DVCq/mamSstWULyIfUMuuBtu+Ayb
         NZ9A==
X-Forwarded-Encrypted: i=1; AHgh+RohKZPVyaHwiT6C9z9yCA+FgaLrY82F9Q5zV+W0iBIGCrkmZuFavvOL/3Bm7au7oeJ1/O3Mmvw7Pvf+GN0h@vger.kernel.org
X-Gm-Message-State: AFuF++n9m8quqOrpN101Hy2nYnJKfyIMG1x4JsWZDUKKPrCyLP75sE5X
	Z1C43l/utQINt89qc7B4CrcZnqPUBZMlL0ZMFjYXn83XeW9SfF/1phMR4s4D/7SfJiS3GfpMvVZ
	NPK0+c5ShjKYICsCkRksDeV70srcnu8R9qEOyEcb9lDQxgNS8qifL4kInXTGHtv+6OdY=
X-Gm-Gg: AR+sD12jB4fqv/lzHGFESVeR7iy306A4LtiqcUlv5lWFaPlbxkSn4kiYf/x4pwLsDeT
	WHBFinkstssvraNaPF8HZbfLqk/iXlf2T91bGa+ZRa2UGWanobadKM5kh5HL1MO+jktBmoITKFc
	/VUQwZIjZ9yXx37320MYA7FItOHq9WOz7H0ZmbR4z40ojrAbH9hGzinaAJkuCrrrsUiOtcv5gjA
	7I2IM2RL32NJq6pYHDYgoCeaztHhEYvYrnNRWUWsnmJTNhjkZJi0wmwmanUVSL7S/TXEhVyKxdf
	dpelTCkDopo9NP0UKxtFKJvEFUOOmxpAJf+z8RICFDrt3Tafy12Uye7zGiEyBE23hP9otdRAcZK
	AfKwmstY10A33RhhQfwjEUHrdcgILOQ8VwVQ=
X-Received: by 2002:a05:620a:4594:b0:936:9f49:69ca with SMTP id af79cd13be357-937398e83c9mr2267627485a.21.1787584527673;
        Mon, 24 Aug 2026 08:15:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4594:b0:936:9f49:69ca with SMTP id af79cd13be357-937398e83c9mr2267611385a.21.1787584526743;
        Mon, 24 Aug 2026 08:15:26 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749e9f956sm515969885a.36.2026.08.24.08.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:15:26 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:15:24 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: tlv320aic32x4: Make sure clk_init_data is
 fully initialized
Message-ID: <aoxgDA7ZR6aoy9Fo@redhat.com>
References: <cover.1787239902.git.geert+renesas@glider.be>
 <7acfe448928df59a62418233d716b0c9806559d5.1787239902.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7acfe448928df59a62418233d716b0c9806559d5.1787239902.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Aug 21, 2026 at 10:52:57AM +0200, Geert Uytterhoeven wrote:
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

