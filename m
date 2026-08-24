Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E8E36A341
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 15:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584515; cv=none; b=sUL06bhNsd0LDwJ4Q7NhlTyXyoomp+JFlRdGl9pJQRWn7NnVJluII4Dd8IiWQEIh8SoROQDFUzkaEkGfAumfoSLx4c7ZhhwyjQUHQ3t2fdrsS1rd+X1mwqxPPpCARrjUk/8gL0JeDx5+F3IGWBemcCVQNZAY4wNKwknmp0n+eUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584515; c=relaxed/simple;
	bh=8JhdYx7J0tlGsoGHXXE3+sEPiP/2ifTO/+3R6sQoj7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qOQ5/2PNCvKQ2PvQbfWwVDEutv4m7Nz87usAjrT1R2b9XeEcMTgjngJlr3SbinHUUg4zyPfdfMHET+wUhoJ7EIr07mXWHcu7euddJnCTAa11ksGAgY//9fvZseqgX2eAo9ePD6IVhQLtlkJT5rjodEMqvtSJc6Of1oxG5riRjho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JuxrtZyh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=O/MYVYVc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JuxrtZyh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="O/MYVYVc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZqeRDz9cJO18L1rBfXoSEkvn4bBP32YCMU3ziCPFmwM=;
	b=JuxrtZyhTBXZJzMlip9kcIdpwma415RIDzdZVW+y5QXQQRijurBxKn/cB66vQbTwHxH+tl
	e+uGPDnAfiD7Zx2GB6yQR6bgOM/BAVntDzeMPsVyQLAan3c/J8fIVtmrsvHTAJ51uh3lzM
	ttsY9v5I8IFfKqn5rgB04p+buYjbKuQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-6m3dsqJON6SR4IOG_4YIFA-1; Mon, 24 Aug 2026 11:15:11 -0400
X-MC-Unique: 6m3dsqJON6SR4IOG_4YIFA-1
X-Mimecast-MFC-AGG-ID: 6m3dsqJON6SR4IOG_4YIFA_1787584511
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d9cef8d15so68357051cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787584511; x=1788189311; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZqeRDz9cJO18L1rBfXoSEkvn4bBP32YCMU3ziCPFmwM=;
        b=O/MYVYVcxaJ7Gnnkrp93yJQCsv+tDLyUS4iujVw9rmpu7Yug6MXmaoezmtCht4CukW
         JO6oEolsFktAx16Q2LzwvKBadDxy+w/R2Geu/bAeDXcTZRUH1+OubDq0q80qrjHI18jN
         jNObFmWsRybGbQJN7yvuXG47PKMY1ILY1M/sT+9aVlsGNCnZesIxc8GKDBkYcsb9mwzS
         vXBLXQ34GSnh2uHhBnLuy0ViOoTh3eBH/PLg5udS3P8wUInDFKvbuOk02Q2mQYjMuST7
         8i4qBAhMeOXE4serFWZSYPT1VyB3jyPn31CWcrUGtFQzndvyDP3n84Clo3bDRWjrfic0
         TX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584511; x=1788189311;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZqeRDz9cJO18L1rBfXoSEkvn4bBP32YCMU3ziCPFmwM=;
        b=pgATAhbne5swPqB4Ii/7GdNX+fl9vf5XQmq5Y3Fsfa2lgoSv0SNbRI4iHfyzp8kJWM
         KrssBBANWhgpMeKRTGz7Pm3iBXraaSxWyb8U3ZS6mQSABH+WhofU6RScWX0ojZPfJktR
         KM61+z8j0Y/gTISMi6inz+r3bmiBLnzd0SJ3BPF+S8cit//IMgtCiU+2kbe3KwJL7VBl
         NQ3wghoPl7X2YyeIXpYH9Qgftl1K7tNZUCl65uDm/HjkAtLGGlJYOYyvQUo+krXDJiqv
         EPXf/tM1SXS2FgyvZ5eNyUhqL5gBTwEiFfohkIinxuL/uLAxytaWU88IBZRV56vDuZ6/
         adlg==
X-Forwarded-Encrypted: i=1; AHgh+RqeMlecGYwL1Sll5LqkUwOdz1rH4ja3PAEBIs8YzV0EqkNp9UW0pwsPTbMGO+vvlwolAK7WWfNVFB0uvP6E@vger.kernel.org
X-Gm-Message-State: AFuF++nWpSdWYhXZiCNTMUVRL2UvUN1y/wwhPYwLzoY87t/iCRqDmiKa
	Z+nZ7hrEXa231cTb+SglAh5y+4UxTTRW3OdxKXJF+d6n2E1cR9Ve75HmtW0RFIIV3IbiWAiDPlW
	9G/pvd74MyJUxqDlI7KyddgEO3aSQDwIQnom5uR4ZY6K0FmrWy5zRxR7IveJpvAi6xzU=
X-Gm-Gg: AR+sD12cEcD9gJRVnz9Wl+Xf9c/jF2MV7Uyem4WUr1GmLehAXpBWxCFZjt0AgNVybNq
	eqJ2N0+dsRefFGs1HQCX2iDNZkkrsU110qNn3gZXuVK6Gmil/eV/nIBO1RC22TKgtON4VG5A6C3
	LQGJnRfT0o49eWDVZ8jN4AXwGp8ePwNqSk+VLPGrLNusNI1Yee9br4/7D5Wc4OZaok/CoHo3tqe
	ybNZwT8v45yVQ2SAreYIgXUblgK819tQ8ruZUnqyg9T69vhRbMFbsyBnKum+38dV9vrwfJ/Izxh
	8HRonas2lDcVG4OWWNo7nne/ETt7F7RucoePBgQQRZFccHCseCtOLPtAMleC0+kg9fq9JUAiRcq
	fx8aItFl5uSE/HFkH36oAQ4f71RU1vkPKN0A=
X-Received: by 2002:ac8:5e52:0:b0:527:7521:3f8 with SMTP id d75a77b69052e-52e09d36c69mr182948271cf.44.1787584510692;
        Mon, 24 Aug 2026 08:15:10 -0700 (PDT)
X-Received: by 2002:ac8:5e52:0:b0:527:7521:3f8 with SMTP id d75a77b69052e-52e09d36c69mr182947661cf.44.1787584510247;
        Mon, 24 Aug 2026 08:15:10 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c9303df43sm64301876d6.0.2026.08.24.08.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:15:09 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:15:08 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/3] ASoC: codecs: lpass: Make sure clk_init_data is
 fully initialized
Message-ID: <aoxf_ONxLQatfhLu@redhat.com>
References: <cover.1787239902.git.geert+renesas@glider.be>
 <8f05a164722791336be39c83164a45b7a2d56d1f.1787239902.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f05a164722791336be39c83164a45b7a2d56d1f.1787239902.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Aug 21, 2026 at 10:52:55AM +0200, Geert Uytterhoeven wrote:
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

