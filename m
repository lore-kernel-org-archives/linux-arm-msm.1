Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792448159;
	b=Rjvsi3oJHcKl5+ojyCUzGyrRJgdVCqYe0lngdiEfnmZeBxo65fwiJ8pjXe8tZ2pw1w2M
	 HidQJeEMx68pO2K38MZ2DkjirPqKYgAWUx2kej3aaTXzicQItEELSForU1XLq38r6yeLh
	 cjiOpFj7Wpl+tEF8ZASEVdkdZhZnh22aWoo2bVmO+lhv+yYjohkEOJkTWZPwGceHfz0gP
	 Rwg7AYqnaELFC9VPjuVIrOq2H7xQN6276dWQHNZXDWOJw0btQJsRJzlkZ5HFom8xxe51E
	 ABq/cJh4j73pJWSk9oxK/Y3lgnoAUiqxMfhqZx4O7U/fsViA8anyVNhVipJMRmM1E/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792448159;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=rdyNMiM+XBlxdbJkKkHd/PYJIa4td4GcgNTCZeLOXak=;
	b=d1NQazOPDB1Ir0zBq3ph40DFZ+VGahy8Q7Nrk6HVA7LcVh1NBx6p8Egoft8j+Jz19Jbj
	 3EIMFrgw+BQq+KB92l1ZVuS0ZKMfk+PYZi9/GSoZsbGZflOyHRSNTcQ/i9vJ2Wro31Dar
	 nE8N7Te0WqTMo2TjtdpXv6cnE7uppBcvod0M91B2/ZpjFNQ7F3MjIBEzXRXOwsIjUfqtH
	 LHr2JGzKjg+kiHtHSO/P/v59xBEnQwQf7BSpf4kAcIZhsUpqz920qvYv3xjA5al0ubDrT
	 WgxCiZdKFFlA4f/gcZjI2A561UZY6ebQxSMtXLMVohW0lr5FX0jbdmWKW8ovytwAELQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Z+jFQGuM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8789C60A3813
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 22:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8789C60A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Z+jFQGuM
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-18cdcfc05ffso1193798c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 15:15:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792448159; cv=none;
        d=google.com; s=arc-20260327;
        b=PCtzigqnAAmawZllv5bW5WfannB9BU2AqUcqNldJ0eaJHZXMiKSvlHOC/ecu3Jxci3
         rtgGJ2OfzcXoRGU354Aww2OBWHYHjw6bCumpKB8pNmTp7+wBs9DRNyANMCBEGgMEDAEd
         IT+0UxA0xNAtaHzuuWGB2qiulEVQGjZPl439oj0duC0uwPbO9GZW9s5TgzBN8o/xHwrB
         MhNkIK+9CGzjzEuZQyEKrE8jLRxjHDwojZU7duObkvKVoBVnXl0n3H95ozG3Cj0IB1En
         58SVtGemj0xTXaYvaNoeNwrs3C2/1CrbWvizgGOA70uHwi4LnTEtLy2/eWJaxf9/Lki8
         qiUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rdyNMiM+XBlxdbJkKkHd/PYJIa4td4GcgNTCZeLOXak=;
        fh=+EtqxphG5xULjuDBaNTevsnneZ32TmMyZZ8dsy0IAPs=;
        b=mDV4pkTV5wvBL9XbrRJ5WNoa6/7mKPspsldOvOg6vfSANXxmeVtAjfes06htW3WJNZ
         yh/k6zRFm8PW4He2P6tkIADPLLK84L72rnri68wbN2W2O711LaR57RVFqD4hBLwn2g4Y
         UMyaZ8rADWDihu/7N8Mxi/SwUb7y42is5dK9AEFSSDgrkwbcrK7i6p5/xHfgqRVchsdu
         fYC1xJCEXLWj7wyDvjofu8F+RQk6RsgGUqWnum0tvT9OcixUbss31HcZi2PrMrl6+Xpb
         uzJYn71CEZ+pnuCvC98AsPDHBsCD9YzoTu/tXPiBtOg5hpiJmXvzwiNSlBrg4yXv76hO
         7d/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792448159; x=1793052959; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rdyNMiM+XBlxdbJkKkHd/PYJIa4td4GcgNTCZeLOXak=;
        b=Z+jFQGuM+R8S6JsKAZwv6LyJH/Y9IcZLAIfMG9qO65yJSvvkJip1WU0/fePsvMvrdM
         yYvyExnOZ/UDbo7f5/ZNZaPmFvXELK/csgabOGxEJuKLv3eMRHi0j8pbMorAeDeWXPy6
         if+FoWjEM68ZMFBEzCawUsBFbTdl1flplJBqveirwOvMyeYZfPexKkwMexScRX+ZMfIr
         Ox3ItrAbZ0kYTh5IhPqoMCvUaY/xYlw4WvIn+vC4GqdKa9wnrVccc6+xEDQgnJXnzfr7
         XOxauoWlOliEqhaFDaUzCO1Lwi3uB1phcKCIy2wQzogQzIQowzJ6dIzbRPaDUO00JOoX
         JcKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792448159; x=1793052959;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rdyNMiM+XBlxdbJkKkHd/PYJIa4td4GcgNTCZeLOXak=;
        b=1tKf7SGFs4NbHKMA0sal2TNU8O4REHm+l/lDycjMfYC0qQI4xZkrMIIgBSr9rz1wWP
         wgrbwJBXm2KUbwmDYh720XlhkQFVrM6VhWq/AAFtqsghzsm8VVwrpwhAnB2NmdXUfJyY
         R2OACgbsoD8fcz7P4g0BR4V6xXEjYWCCxqhNnJpJERswegbOyx8K4VwewQdOakLaGVCR
         oRb2ySes9XHOyHUtXJg4NnZtkxXWHN0r2wO/haBU/6d+C9O7gwrWIvCipY7RquU1YhnJ
         /0zwDz7BNjtXu339sLfjWechBTysoI0fIzzpI2aNPQBpwTiJYXCpls58A89w2VrAUZsy
         8Hbg==
X-Forwarded-Encrypted: i=1; AKwUvBxWjLc16LRamU0j5jkfzEcuOAdMJYlvqr26vC0p63QOCtnGaPxIX/8y0qIywjmCyCH+UdgWwzfXpcf99K7A@vger.kernel.org
X-Gm-Message-State: AFq9FYJb4DEPw1wLU12zuA8vvQr+TbzOBJoi6on0E+6DxR6WybV1wzYu
	HA6AYTCZyelw+NFctcrXiK++G3SR6J6xNJtz3XD7uwaIn8L2ync1wDJRmK/KNy+HRTa5yzHvbB6
	2LyHE8wdfCG88zvoO8Gh6RoLRt1E39Yu/uYBL7rnx
X-Gm-Gg: AYBFou3yop7UILQlQPYesMz+AQOK3a759AewJeqtuNENYx3o53DA1h5wxYt5GVX8Agu
	LPy30WThfL2S9FybIXkyi5+vQGjUEG4Qu/GFEg/hrHLRtTqrcfkIe3kyD+aySXqF4QCITRulLvp
	GsA74lnJy8FTB2iVrFrdz7mpKNLkXNt7tuXIoFz+CpiEkrAqFeuVkQtO5QcSiHZMffAyqulPNDK
	5x1nokaqZCD9mcLHT7tHSfh8GZQCUAbZwTOUFkRaIxG5V18QghSJakV6LmWczuCajsgcqzlwa0C
	nEspO17KRh2vReRyNJ71TbRIhARc/pvUlCM5ksm+cdZQQ89n13A2vy+mGql4B+9O2lHN5atE2It
	217bECdFYmb0=
X-Received: by 2002:a05:7022:7e8d:b0:151:2e62:fe8a with SMTP id
 a92af1059eb24-18514256ee0mr13912895c88.40.1792448157775; Mon, 19 Oct 2026
 15:15:57 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261003214516.128573-1-zoone.rupert@gmail.com>
 <asIRkK-uUz4FKQBN@ashevche-desk.local> <20261019004509.68409863@jic23-hlaptop>
In-Reply-To: <20261019004509.68409863@jic23-hlaptop>
From: Marco Elver <elver@google.com>
Date: Tue, 20 Oct 2026 00:15:20 +0200
X-Gm-Features: AclHuK_a0n-l-qngv8FVuS94ECxKd9nndQfPACOvwyf1hlN0WIx1_aiPJEfhYO8
Message-ID: <CANpmjNOY2=M_G4uaRe+QENQRaet342UZDfXVkh3=gLaVBwW+Wg@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: qcom-spmi-adc5-gen3: fix lock annotations on
 mutex helpers
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Rupesh Majhi <zoone.rupert@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 at 01:45, Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Sun, 4 Oct 2026 11:42:56 +0300
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
>
> > On Sun, Oct 04, 2026 at 12:45:16AM +0300, Rupesh Majhi wrote:
> > > The __acquires() and __releases() on adc5_gen3_mutex_lock() and
> > > adc5_gen3_mutex_unlock() name adc, a local declared in the body. With
> > > context analysis enabled for this file, the build fails:
> > >
> > >   error: use of undeclared identifier 'adc'
> > >
> > > The lock and unlock are split across these two helpers for the ADC_TM
> > > driver, so mark them __context_unsafe() instead.
> >
> > Doesn't sound right to me. The __acquires() and __releases() IIRC are sparse
> > annotations. If clang has something special, it needs to be addressed in
> > the compiler-clang.h, no?
> >
> It's in compiler-context-analysis.h and for now I believe is clang
> only.  Reuses the older sparse definitions. I think the intent is to avoid
> churn.
>
> I currently have no idea if this is the right fix. The only users
> today are places where a lock is intentionally skipped.
>
> +CC Marco and Bart and putting back the patch content for context.
>
> > diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
> > index c68c6c5f6aca..6a3cabedf4e8 100644
> > --- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
> > +++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
> > @@ -663,7 +663,7 @@ static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc)
> >  }
> >
> >  void adc5_gen3_mutex_lock(struct device *dev)
> > -     __acquires(&adc->lock)
> > +     __context_unsafe(/* returns with adc->lock held */)
> >  {
> >       struct iio_dev *indio_dev = dev_get_drvdata(dev->parent);
> >       struct adc5_chip *adc = iio_priv(indio_dev);
> > @@ -673,7 +673,7 @@ void adc5_gen3_mutex_lock(struct device *dev)
> >  EXPORT_SYMBOL_NS_GPL(adc5_gen3_mutex_lock, "QCOM_SPMI_ADC5_GEN3");
> >
> >  void adc5_gen3_mutex_unlock(struct device *dev)
> > -     __releases(&adc->lock)
> > +     __context_unsafe(/* releases adc->lock */)
> >  {
> >       struct iio_dev *indio_dev = dev_get_drvdata(dev->parent);
> >       struct adc5_chip *adc = iio_priv(indio_dev);

You could probably stick the whole
iio_priv(dev_get_drvdata(dev->parent)) expression into a helper
get_adc5_chip(...), and then
__acquires/__releases(&get_adc5_chip(dev)->lock) should work. But
that's only worth it if the declarations get the annotations, because
if only the definitions have the annotation, any calls outside this
particular TU ignore the annotations anyway, so __context_unsafe is
reasonable if you don't want to do a larger change.
