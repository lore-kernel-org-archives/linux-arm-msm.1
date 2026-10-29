Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267307;
	b=NlK+N4RsfH3n1KuXG3BuokocTmVf5C6UqMmbgl8BSungCd6RiTcyv9qGAtg4wUvhbwIz
	 gDQHeCcQwGmmR/tecE+PuD+l6pUaAPUYxc4TntTXOIVSpdnoAaBz9yhgGAkDKQr7hduEt
	 lo/jZZ5QD+gtLXEdF9wYCEqY6AVnI4Avz4b5F2IB4KPSytGzJ5KAYm4TQ7GGjyPbyf5Sr
	 nevx0MkWApNJBUrDO8RmmdxlasQr8h0FWMAnaKUjQoErmVfAozWMvMTXSWodi1RgdN81U
	 Vc0jB3jMKYWh76e62Wr4tHnc1srHjH8FBEIl5lKouaYItM+HKMgcmSWE3gv1ngrT7mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=FGbueYQO3ZHl/HehdiAMR3NdzwozdadRj7RvSHj/9W8=;
	b=ysyGosIZOAWddvAKYxzl8p5O+9VNDjSA2jvuKjOVDLMdoOYDQjpICLu5PAUcz2nY72wn
	 yMTMw03bzIQQXHtpG7frf+e9EC7e9kOd4PzyEl5ZANecrnahR1Iui6XKQ4cMGDci4/ybs
	 r9DykNfiYugwQyQXA625ispk/n+BjLI7/bmT66WVAHa6ktM8zZwFXa5M4Dq3U+iRfjXlD
	 dmoUMy5IBkHW2NXQTzyOk83gJmpYDb79k95JnLCiXdnBJdPqXLVXw25z3LJJDqjqktSEm
	 owrl8141Tby2c3JCxI+DX8EV/0tK2AbVxeAjPme0roYaUkJgM10F73YuI0A83UvsJoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="F2mz/Op9";
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2190606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2190606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F2mz/Op9
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e29c25101so1095739f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 02:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793267305; x=1793872105; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FGbueYQO3ZHl/HehdiAMR3NdzwozdadRj7RvSHj/9W8=;
        b=F2mz/Op9BfW71oImSpDkMRFAN3aPWMxH7P4CDZWVg2SMGv07c1UNKMhBNsuKb90e6L
         9rFF8ySezG5ia0PjfPUd2suvDmhl0XPBF34cPBPK2dyG+aDW23lpguMVM18WxSGz9QVZ
         zia0FflQtfSCsN7yvrOWG2o/wXgj7VL8aIrj/V4RLim9tKejJ9bX2u20X2oqKxkTmWJM
         nRzKVrbl59tuiDgPVYUNDGWBmS8TZGiEVE1bqZ/IlNerMs8aDcweFwK1zMzYNBDMBMg3
         LZJDAZgZSOikYKT3Fbt5mNdjuSIAeJGBJ0KflEAyPex/hzs+89cWCojk3qlfN0TX5LOw
         hHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267305; x=1793872105;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FGbueYQO3ZHl/HehdiAMR3NdzwozdadRj7RvSHj/9W8=;
        b=gIH+cHpDzOCieYuKfZLircVULqfQ2Siimi+eVmrM8TlRNdCGE+cY4GFro/XwpimJZr
         UMUiWIhw3E7MalBRuR13tOEh+edafHOmAexYoZJ+ewKM5Zyolklo4eI8CiF2Xs7NVKfI
         /aAi7udFhefoKaYH2HxHnZnjDhHzJdulgrwfSBhrn042u8L12lfkmiBh9aPo87rM/a/W
         hHiT9yyYpjRBQ7q8jDDEUlrUzD/SosVmNrt1wwMUaDKhi4TXJBu49T3JB1B4nAuk6j/M
         sex9gzGfL7ZCHVXLVhRtYfxICIkms0UwySeE53dMGRr661nI7X77YQNU3YhgC/fVNxO8
         fCTw==
X-Forwarded-Encrypted: i=1; AKwUvBxE9F6YgNytfOtR6Ykb2z8fiuHmWzUb53XXs5G5TqgZyp0jFbSukT61FbVrcpU/khspenp3pvWg3XULXNrW@vger.kernel.org
X-Gm-Message-State: AFq9FYIlKvxt6NgP2gJDXJV8z+yC96reXfBkY7C5GcjUZBxT1m4l0v13
	uRo9YOEiLBbgKt6NcUhq0jHP/CeUysSfXV4fd3dmal1beWc80zt+uzYqGS1WA8HVHLb5CnQHa4f
	qfx7C5PpsGP3qJ/oSNw==
X-Received: from wrvs3.prod.google.com ([2002:a5d:4ec3:0:b0:48d:eee6:b19f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:25ee:b0:48e:5fd8:5822 with SMTP id ffacd0b85a97d-48e5fd85ac5mr9739933f8f.18.1793267305063;
 Thu, 29 Oct 2026 02:48:25 -0700 (PDT)
Date: Thu, 29 Oct 2026 09:48:23 +0000
In-Reply-To: <20261026-topic-vm_bind_rs-v1-1-6581465f2428@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261026-topic-vm_bind_rs-v1-1-6581465f2428@oss.qualcomm.com>
Message-ID: <auMWZyxtC1d_BUgN@google.com>
Subject: Re: [PATCH RFC] drm/msm: move VM_BIND op validation to Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"

On Mon, Oct 26, 2026 at 12:40:02PM +0100, Konrad Dybcio wrote:
> +#[no_mangle]

If you use the #[export] macro instead, then it has the same effect
as #[no_mangle], but it verifies at build-time that the signature
matches what's in the header file.

See for comparison:
drivers/gpu/drm/drm_panic_helper_qr.rs

Alice
