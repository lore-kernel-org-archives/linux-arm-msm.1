Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CD74A2A63
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 15:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790264544; cv=pass; b=dnQTRnJBJ09jtu/iXY9N3ncFUB4MHN3w2E809v8PalHtkuatOp3vleIis2EXKKnHh7eOCn9d9XmU1V+svxcjfSQ0c70vu9vzIfRCjlPdswC+mlD74q9OLJGMsv+EE+32dzxyJQcxJVxail5uuKFbXhv1MzvItOR2ooadNY8JydM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790264544; c=relaxed/simple;
	bh=PyIrnipvkBWRV4hHOpoG3qPK65aPl0bzHYIyrKbgTzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zji3/6zSns/Z1uG+1SGH3hQR3DY9JuB+7A6CwZHmuy2Do2b3b/SbOaudZ2M0VnUWDc1cR/xoLsWYSjMM1g97PC7at6QuJAImNesQLJJKx7e8ydEdJjaa6NOG7V1Cm+WJjviTg60WJptQNDRNkB3qQxKkuTZe71iddBY4hNBWjuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N5nJqjG+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UiSN36fQ; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N5nJqjG+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UiSN36fQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790264541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/64YUvNMf9EIe8aZXp3DzyY+LbONkg5uQf4LZYgGwC0=;
	b=N5nJqjG+CCqiKOUMIy+cAq9Ow0QOH/g8y7qkqripLHY+xA52Ulvj6QjC4UgfhNAE8f/NTQ
	ERP4l6jY5/34bDLO8j/YOXLeTbisjpqVsIkISSyPKLuKvnUmIF7dbd50s+oyMss6RvkYIO
	Gvg68S8FqYiBPUh24USVfCB6mx3/9Ew=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-_CpqSotlMDK4uwH2RpYGbg-1; Thu, 24 Sep 2026 11:42:19 -0400
X-MC-Unique: _CpqSotlMDK4uwH2RpYGbg-1
X-Mimecast-MFC-AGG-ID: _CpqSotlMDK4uwH2RpYGbg_1790264539
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8881abf79a4so39044007b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 08:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790264539; cv=none;
        d=google.com; s=arc-20260327;
        b=fHqI6ZhR7hDbIHgpA53K9G9z3a39JqPaf1Qp9Vaan3QHgkwz1uruPZ1zbUil8+0reX
         BDpujzvehquuGHhbkCFPnxJ8UtkPf9dvyp+7kZI2urNRgpMZDoySrNdX8pex02koQC5E
         +Ic0Ym8fuPsJDYJeLsgPFSZF/vu+HuirL5WHrIaA3Dj0S+MPcEK9eJZXepskJLlDyBhU
         8fIup9vwgHxmN2dAsLb6fghizy8DFlZnUaThyrDNyTQtNicmj9RD4/UJ0gIAGOzPWnpp
         ni5Q+ZAmtD2e+tKhyd5HFZ96EbXezYXUwX6tjIowToQZkJ4sR952q5t8ik3jV0i6Aj6E
         rKEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/64YUvNMf9EIe8aZXp3DzyY+LbONkg5uQf4LZYgGwC0=;
        fh=bCFMMR64T5hqKKfbM5V+kGX8slrlTMYktp8lWJeA/+I=;
        b=NT7cFdQ5gUyx5FKW9UOyfFGhhd4MMsXuwg697JwOk3Tk+StjfJ3dl0qpw16c0xnh7M
         Fsi/zssgxBn3XmRM5I53Q40jBetfadpyCHT2DciiWUxi611+mixN2kLHUBXlBZvYl8E8
         3jeWP7fDuCRLWONn03wLUaRFwjIvls522QVVxOUE+QsUsNDszMNJKzv1hAFKDSf6ROQx
         4l1XXIDDuo1yZe7S75cbqQblqFUG7B7EhIzcDea2dmCB8rjwEfCK70PwBSu7oPW8vQse
         naqv2ZhcxBe1Va9YfisM7fdvf+2PZtPTIdsF+WTPiqJB3/FLpWKGFLaAT9Ye/UpQWIr5
         mc8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790264539; x=1790869339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/64YUvNMf9EIe8aZXp3DzyY+LbONkg5uQf4LZYgGwC0=;
        b=UiSN36fQL6QI7gOFKIRAXpB32KZvpgTZ0bYV/KBNmlIN6qm7jax60KwKrEHg+eMqa9
         udWcnbLBthounfjlspUNpVzA/a3M/L6qNzbO4BzIhnzqgD6x4PLAtrz7dbs16BVvHAlv
         kRf0aJ8GyBaHFCXd5a/GnXw3AuBUbbSzs4kH5Omcg1UxWjIYTVTLXFzBfq911Hg0J1v4
         jdF3NvIiJCHTWsgehT5JMOrPtI/KTgdCt2uGvHlNfNm1ZXHO0vFWZ9SJQXMWytDuNWZh
         54MEXb0EiRLNWgTC8Fbnwm5byWnbinwmAgKv+DglBTsNlbOPHxpIWgvG4r8ffXv1kwBs
         rFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790264539; x=1790869339;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/64YUvNMf9EIe8aZXp3DzyY+LbONkg5uQf4LZYgGwC0=;
        b=wZ3XMi6t8AhZGUoLp1KYwy1QT7+krr06ziKp+eYoden+SpowYnqiwPzqt8RA2uU1OV
         konwUSj8A7swg72xtLHwv1dOT+Woo/y1g3xtGpBLTXeMyeFFvrXR3SzBrsEkuLaieZtA
         uKgP07P9pUHsVinDSbUg6rEn4pap2sGw6xxoWqu2lJNUx7h8BV3ARK5EdywruDi3ddt5
         Xs7rI5R0Jt+8HaNGW8xZ+WAPUB5KU4dRFN+IsePw1q4X4KY6nln/A2b++kBmZuAUK0Pt
         akpB8veJFkgcOq8jRYOo4TrflG7eem7riqbU/1+bKsIl4Z7efYHE7ot8iaHTRwHK65A1
         80tA==
X-Forwarded-Encrypted: i=1; AKwUvByPsNLgSSzDXmb5ZuUaGJ0/M886NxgKlrjHn9ANr/okD2vnHhdaDhGglhJgAlm3xHX3nKPiIOpXzfXUMzeW@vger.kernel.org
X-Gm-Message-State: AFuF++l6UG+7UYl+hvsIwFnsrrG8D5FgzVJz2Sn1l2Pz+Bi9Mp1/5YrO
	90T+O5ZK0mhkx4RDj7N9dG3rrPkx9cysqz40n1G6+HmGe3QKO+7SdYa5zGYz4zMIhO2Qs/Mvs5D
	6R7JlW77TCxl0CG0BkQGyeMvX5bX/ukds37QOhDDSLS4ZFMPZIQyyrSPE/iBBlhV74sVD9uoqEk
	pHsajKtjyoeC/+36PAxpc+G46ET7/OlFy9FGuiABD0nQ==
X-Gm-Gg: AYBFou22kYyuyC5/mDfBoA6JO41coinJpw0x8Yce2l5rObSY3ZyvYDHp2WykL6V2aVe
	AuRJGpLuBnM0AIckEP0Q60sH6RNVGDwjSHTGvvHAZZ1hJQAuLSxe5Fz8fg6oB69/QxNyfTo8t6n
	BSCBDPkwcQBlhciVwdsPXNONjIOYlEZPX+1kLsE9qzZK1ZaOh8Oz3q6w==
X-Received: by 2002:a05:690c:6e87:b0:8a7:91f8:1e8d with SMTP id 00721157ae682-8a791f82a3bmr9357257b3.53.1790264538807;
        Thu, 24 Sep 2026 08:42:18 -0700 (PDT)
X-Received: by 2002:a05:690c:6e87:b0:8a7:91f8:1e8d with SMTP id
 00721157ae682-8a791f82a3bmr9357067b3.53.1790264538368; Thu, 24 Sep 2026
 08:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-scm-device-api-v1-0-3573e2596c51@redhat.com>
 <bRb6NzJiFvNGB0X3BeiVytgZNlRv88LFlcaBwwFIFa3GtVZhn5bh9EoRRDliRtgsnlQNMddvcIPK-5HK9x7z9Q==@protonmail.internalid>
 <20260914-scm-device-api-v1-2-3573e2596c51@redhat.com> <49153dff-b4e0-43ac-aa82-15175fea6445@kernel.org>
In-Reply-To: <49153dff-b4e0-43ac-aa82-15175fea6445@kernel.org>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 24 Sep 2026 17:42:05 +0200
X-Gm-Features: AclHuK8NibWpN40MLtS8tk1TsaU8ZJKSI8cLr02zuHOUyaXDRMTCkw3xFezOa38
Message-ID: <CADSE00JcFOY0r6doD1Qpc0xtZ6HKsa4kFGsV0_FsNbb+yemmKg@mail.gmail.com>
Subject: Re: [PATCH 2/3] firmware: qcom: scm: pass qcom_scm through the
 exported API
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, Jens Wiklander <jenswi@kernel.org>, 
	Sumit Garg <sumit.garg@kernel.org>, Amit Kucheria <amitk@kernel.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Brian Norris <briannorris@chromium.org>, 
	Govind Singh <govinds@codeaurora.org>, Niklas Cassel <niklas.cassel@linaro.org>, 
	Kalle Valo <kvalo@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, iommu@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 11:08=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> =
wrote:
>
> On 14/09/2026 13:41, Albert Esteve wrote:
> >   static int spm_cpuidle_drv_probe(struct platform_device *pdev)
> >   {
> > +     struct qcom_scm *scm =3D qcom_scm_get();
> >       int cpu, ret;
> >
> > -     if (!qcom_scm_is_available())
> > +     if (!scm)
> >               return -EPROBE_DEFER;
>
> Is this equivalent code ?
>
> Its also a bit confusing to me that the next patch adds a .available
> field to the qcom_scm struct.

I can see how this can be confusing. The problem with
qcom_scm_is_available(scm) is that callers did not have an SCM handle
yet. So drivers needed to search for it beforehand. Once I had to
repeat that a few times, I instead added qcom_scm_get(), which looks
up the bound instance and returns NULL if it is not ready (and still
uses qcom_scm_is_available() internally). So, !scm is the same check
as before, while we obtain the pointer for the following calls.

scm->available in the following patch replaces the __scm publication
flag when the global is removed. Until then, readiness is still based
on the static __scm validity.

>
> I see where you do get drvdata but I haven't managed to find in the
> series where the data gets set - haven't asked an LLM either - I think
> the logic to associate the scm pointer and get it should live together
> in one patch so that the logic is easier to find and reason about.

platform_set_drvdata() is already in qcom_scm_probe(); this series
only adds the dev_get_drvdata() / qcom_scm_get() lookups. I can
clarify this in the commit message so the set/get pairing is more
obvious.

BR,
Albert

>
> ---
> bod
>

