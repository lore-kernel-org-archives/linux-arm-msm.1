Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F015E313E21
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 15:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262048; cv=pass; b=KD/WJi1xdYMv3H+8shuZY86zFRFnFtZuz1Fyi9QV0OKaZM7m1x+aeUaICbNmnI5a3s8wyWpFIuroJlyHoxgTlXbYoKVtgsyUZZ7WB/TXDbJE1AFojwr+DTHX6mfGCya0DSK08Ycdw8kblGi7nhmttVae8awW/UqffDGoiw42pKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262048; c=relaxed/simple;
	bh=iuUfA02SH2tSSicml2K0I3xqm9pZO7ThoY25b+dKE6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NkNa6+cSEExKHw3xphmGJAjaR8EwlUnv+ULFFBl3NyoxXYrcrBjykB0EK7HhxrceDlUuf5ahKIyA70RuWh86AcVENfK2ytM0Qx6pcxCd2ZQ0hnRREOQjFz/AN/gS7vi5jlGxMlT7BTC5q4mEFF6HHr8LsldM3V0EUXKVo7Ycw5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TLHqpmOP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MVDl+InI; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TLHqpmOP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MVDl+InI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790262044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YKTy1DV5Z8HP/0nQigR4wkQdWVD6m+LzXDtQhSwKE3c=;
	b=TLHqpmOP/v8DhuvblEffEV93YjOTJxSFZLEs+RwfgB+NxVdTz/ygl97ONXzAbvTGfZCPgk
	eMTv6y8GtvNgLa1EC7HTLUxt2chtIVfXhXdkx5XXP8YyvZ+mePv41vBysotpRqobDBQjc/
	7FHbD5YMNAz4EW9ZRjZ3QSnNM9+xHRo=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-P3YT2ej5Mfen2ov5lxPdfA-1; Thu, 24 Sep 2026 11:00:41 -0400
X-MC-Unique: P3YT2ej5Mfen2ov5lxPdfA-1
X-Mimecast-MFC-AGG-ID: P3YT2ej5Mfen2ov5lxPdfA_1790262040
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8461ade272bso18335777b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 08:00:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790262040; cv=none;
        d=google.com; s=arc-20260327;
        b=PjJlAvLnZmfLsal5oT/XPip40pe3KVhury27STgbblIoqG6C65p9d+mz4rLjdIYZjl
         QofP2uYm9cIL3DYdj9AlQn1S8jUCph6wyxXi0f+dgQCYBW5Xg5rsAoEIz43+4coIVGTP
         zMF3JfPdFnsXt1c1JUCgyuGXLjLWyPde803vHBKrprSZLpvrrsTigkf4t6i6KaFXqlaM
         CJ2topEZyhfKrqLTAwlKJ5Rh0b4YZAtCwCMuPdBMIy+f5S1XiHmKSixG6f4suRTIUqen
         7ry+CdWf/7/cLjMDfKoxbpWmV14FF+Nw3YgZjaymJ+Jv2tmj5gpQ1hINMEyO34zs2MhD
         KjWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YKTy1DV5Z8HP/0nQigR4wkQdWVD6m+LzXDtQhSwKE3c=;
        fh=OfZ8N9E3g/5kr9u5CQzC3uzhGeay5oqwrQmo04c3Icw=;
        b=pm4rfqQLyCzLpNVsDnRh2AbIb1jzaiITsg6SmF0/yerKENwPV09spt58yzclbVqpn9
         XXh/6OzRtOFzQyCrxP5/isQurJ6+sXmJWMAukKMFlgfEcvHLT3AD52MAHW4SlLqlQUE9
         ni/HXzO9XH3T0I/vs4O6kXG9kxgI0tNbmJMjENhhxSUDminu6Ad3rmDGTs0qh6pXhJCi
         774B7OHPQkbmLFRGiAQ0M2H7Mb3h3thjpQbsMV9jluMvuGs9smpL8GC887PSJE1bLwME
         995MAQzJ9dp94/8g71A5HquA0/9IO1wiRUr0l6Hpc92+t8s82geVjRn/Ue00j6eQ4Or8
         +orQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790262040; x=1790866840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YKTy1DV5Z8HP/0nQigR4wkQdWVD6m+LzXDtQhSwKE3c=;
        b=MVDl+InINlRiSWNoJ+zSo3dPDLpLFAx8rHOQcJPrFcrb0dFjn331QV2IRGTQ7mSLf2
         FzOGnMoq9jW909FTyZADgpBVLgDHXWeUVGIDkPw+aeVry1O2IqecYbQhdHv53moD09Gd
         M6/R10IHRh/oSqPNOZRSalRoelc2p/FUbgk8NWsvk10oj8K0P0i/+6Kb2SJNz7+VGtS3
         EHiUnog1bSJUloT5Ezfcd6Fbhr/4NApXO579lYUqr0j5S8iaQ1FgRSVlUokp15A2kalc
         H92GZLmjxY5Dvm/8H/oqzwnBKNx9aSsXGI80NbQvadYeVqffYhdBjfmMsucgQUH6nslq
         hc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790262040; x=1790866840;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YKTy1DV5Z8HP/0nQigR4wkQdWVD6m+LzXDtQhSwKE3c=;
        b=t7pl9z85awI/WogrWKzqURbHCS5Z/OEzVvyQCaXdXLUEJsMk3/LG88T5fHLVIMhfdT
         xV7bnLHpIVTLsPtPd63mOcvvNhZRpTvxw7NHaPDfLOyuUdwWU4Mx+Y+Y4duvQajiWYbG
         lgt49GwWJMwd6FjmTq+KJnV7NcoOU7c6EspIQQCQXawowqtU19jSZDsTMpJm7PqQHbvN
         7LdwCqHm0TYd+WS743H4phev25v3RPnKee3/pWNtbc7BOTZt70VKQa7soQaKq2HpMBqU
         +lrrifSbz3cL0/wQt9qPsB6rhzTwcE7x3jFhh6AYkpP2abHdZ2RFtVILNEBrxyuH7cVJ
         le6g==
X-Forwarded-Encrypted: i=1; AKwUvByUjlLhZUjnmFl8BAB5XVaGru8CkJa+V8ng0Ksf76EQvsE8WJZIhDogojg/wFOxj3oiMRuUoWYCacNuF/qs@vger.kernel.org
X-Gm-Message-State: AFuF++lYGpBmcSt7UNAnkIBKwTW4SC7TFZha1PLst2pzkgy72TYjUJc2
	ebQdbAA1nyGBZuz3Lzq0UfeZo/1Eyuxl0u0uCE/I+gyuXCG6m96jGVyPvIB0wvPeIWxllGbVIK6
	4/AWrCMKZ1Ooa3LTGyixr6v1kdKOEDlM4x3yRtS/+rIyV9fCNBGlkzXW3BwToIWcnx7TjKAODC7
	lMaLNLfIsgzVnKqkYq7Na1IdkeFJZ9ahMvy3q+Gqfoew==
X-Gm-Gg: AYBFou2Cd4S7EB1XoPrFloi6Z/SA+4MstBemWs/EGxSej5+saLS3wRzhKzi9n8Ospr6
	ARemPtgcvEHt9BfvCyUy3k1V4TU8L6pEz3FXiJ+ewa1Ce//7uhrtp+DT9217u26Sx3+SlJ5rL+Y
	/2uKedYuDQsAlBjrfxLUXg/HKreGt3nI5E+CPHefoL+2AxnJW0tYlGmQ==
X-Received: by 2002:a05:690c:f04:b0:8a4:af43:6941 with SMTP id 00721157ae682-8a64e5d7328mr16132267b3.20.1790262039566;
        Thu, 24 Sep 2026 08:00:39 -0700 (PDT)
X-Received: by 2002:a05:690c:f04:b0:8a4:af43:6941 with SMTP id
 00721157ae682-8a64e5d7328mr16131377b3.20.1790262038827; Thu, 24 Sep 2026
 08:00:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-scm-device-api-v1-0-3573e2596c51@redhat.com>
 <EKwbCgCnxbNX4p95qJ3xoytzeNBBLc2L_HOVWr-S-y8n7pNOIToj37TyoXRcLyIK1gjq_IvbreQ331gw6jIK9Q==@protonmail.internalid>
 <20260914-scm-device-api-v1-1-3573e2596c51@redhat.com> <b1340496-1ff3-4ad7-87c3-36d2162efbfa@kernel.org>
In-Reply-To: <b1340496-1ff3-4ad7-87c3-36d2162efbfa@kernel.org>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 24 Sep 2026 17:00:27 +0200
X-Gm-Features: AclHuK_S1nrFMWot6v8DC6klfULfaNk07isgmJtfP7BYAekyrR84kzWx2Uw9qhE
Message-ID: <CADSE00JhFYhDV2cuVxZwVTX6LTe8zH0-BR=-Fhv+6UXeFxq_Zw@mail.gmail.com>
Subject: Re: [PATCH 1/3] firmware: qcom: scm: pass qcom_scm to internal helpers
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

On Wed, Sep 23, 2026 at 11:00=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> =
wrote:
>
> On 14/09/2026 13:41, Albert Esteve wrote:
> >   int qcom_scm_pas_auth_and_reset(u32 pas_id)
> >   {
> > -     return __qcom_scm_pas_auth_and_reset(__scm->dev, pas_id);
> > +     struct qcom_scm *scm =3D __scm;
> > +
> > +     return __qcom_scm_pas_auth_and_reset(scm->dev, pas_id);
> >   }
> >   EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
>
> Why make this change at all though ?
>
> It takes a pointer to the file static _scm
>
> The reset of the patch looks straight-forward to me but this change
> caught my eye.

Yeah, this change isn't useful. I aimed to avoid passing __scm to
function calls but it does nothing in this patch, it'd be better to
change it directly in the next patch that changes the signature.

BR,
Albert

>
> ---
> bod
>

