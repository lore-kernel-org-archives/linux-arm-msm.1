Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96F33DB31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 06:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792390469; cv=none; b=F9mmUmTl9x6Z0i02ioGQJgJ7Xy7rEkNDLW9zFqLl31mxJ0BNZiUOxO/rfmAw8cFLwbj5yJ4dkC95du8zDEJPnuDfXgDO+85HIsHjfUMM/wGHrDhcs73HMXVaUVKnBbjQjnFxfMPSxeClQgHfAipyx+fx3jEXLKGG3aBxXt0Ym/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792390469; c=relaxed/simple;
	bh=a4zYuxAOTe5hOZO9exG0p9T3Y5OYZrqCGPDtfN0/quA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SICBriC3UPGpIT27HjDEgCIPdlkIlMgNSmhHFXbvVdV14y1yks/u8Uy3VCVr4G5nCKyEA/uhX/F6Jujs8eDl9Hz9yNck5TNST+HCYr8UR6jM+MuqUcuoaSl2l60cEyOklR7Gs1sznuIVZPB0UHzLm2Y2rC4mryg1qsLgjN9/0HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wwx52QRw; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wwx52QRw"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48dfdd431dcso1372969f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 23:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792390466; x=1792995266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a4zYuxAOTe5hOZO9exG0p9T3Y5OYZrqCGPDtfN0/quA=;
        b=Wwx52QRwECmAS08gpuFlTTY+yO9Ek0YyyZq50YKLVFBgZw+z4Bd7lbvyx9uOPNO59m
         o8cWZC3Rrk9N4HuqZVlXlM8Y9asJn70lttbQBWw9Cd2gpLDc2M0J77BKMfvSW/1FH+Z+
         dHPiTJ14Npnjvo76bbjzWzbPFnvDqCpF+Z6G13x+Oy3tgZ9Vv9THa4V8gr9pTDAYXZkp
         TF7FzkhUoiu+wdspBCqoOf5605dMaCpKut/S7KVswt7bFu2Sdx4qjqz1bsaU8JH3Owa8
         EnmXJF3PJs6k0Q3L+WqZWT9PRnH6srXEUK0mCpnd3tD0qLETvmaSQIS2FXz7dgqZ2dan
         ZpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792390466; x=1792995266;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a4zYuxAOTe5hOZO9exG0p9T3Y5OYZrqCGPDtfN0/quA=;
        b=lzXxpa3x5dqXLysaHSfXoR6j+yz8yPrHuJWNxevAXQYCM8is4+0R/ZNOkQ9PpaQy3S
         0+3ZUa6UwW4P7jlQUttA9RMHc5ZWlSaJiNmTkocvYnQBmt4Z/0QwlFKAL7JBKspgBB/F
         mXIVVkafOFuMH18PHP4DWeUP86kwQZh/XcM4nokScpEMS908ItDF6UvI8TOJiS4GQmZe
         3pI+py19u9CGDMhLlH6b5iBnyt94w9SEmuAsu72STGP72g+a7gVDyJlFPlGdxrt52OOo
         X0scSRZwAEJQLRdbLgLnKpy3tjHrfY+kRlrrhCFZQbYGZurJx4eIp4hsQk6cxbaPSmyP
         3ozQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6ElaYVlr2BwygYSF3+hFdtZiQG4Lrs22u2oZ7xzYHULryLZSDB2GE2o5j5R8rQsSKecjS0rMf9qyesl49@vger.kernel.org
X-Gm-Message-State: AFq9FYI0OK/MEHdPuQm0HSmAGZBQcWNs5WllvQGTVggP4SubJWgEYWQP
	NT3fVb+T10Apt7nPsgf70lXXJHF98eXUm5856PYDALMNjSGy1P6MiT+i
X-Gm-Gg: AYBFou1EEfkHISOFHWvnldBNh8LqedHgFC1HDWT7Ur7FwEFnAiQeYGsITfplpa5I59R
	JsUtVPieACMwqJGWOBfGmtjD+Ay6cRfG1U6DAQUKH94NZ7P1o+XynigXcHa9pzkLZg3KNq5b0s9
	2pFAAELMDAAhROJ73hTUxMjxv1Pf/olh43fBFodl1g7rjTM3gH2D/86Z7n/3GS2WwA23mRheWeh
	2GEEvQHk8muGuWNbP8QDBYQv7kz/OjLTpUVzjSNFF7NKgbNgdpiQsWJAt35ec0yJoX7Lr1bYK1M
	7eXqfi0ASTRBKsOwkrt02nWw0/PpwmTPKCxqQae2BCKTMJZPnrNYVifB+WljG8f5guza0Vusyai
	WhVE/smseVegSZNqDP17A+C+ATHhbJXQ3ZmFqRRECDaTQD6LTlDMzq+yQobdm6cMjKs6iC+zKsJ
	EAd4FzCcV1Z4TnZQZdz5Q4VVPTAgV+jxdcPjZhe9TYD//8UZITjSEc9wK9VrKl/T9Wqt38XqAZ7
	JxA0EPmGa2Ozo3KvEXvDDw8StRua/yacyorpZcQUxoa8c9EoF3hMcH/pducIqx8SK16bWSx
X-Received: by 2002:adf:edcc:0:b0:48c:7d67:8ee9 with SMTP id ffacd0b85a97d-48e07f98e75mr9489300f8f.19.1792390465937;
        Sun, 18 Oct 2026 23:14:25 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ec8dfsm21937786f8f.26.2026.10.18.23.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:14:25 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sergey Lebedev <lsa.uz@pm.me>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add OmniVision OV13858
Date: Mon, 19 Oct 2026 07:13:21 +0100
Message-ID: <179239003370.10232.14441777373870206418@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <366fba16-a479-4e4b-b6b2-7d0dc6ae4fd4@kernel.org>
References: <20261018-ov13858-x1e-v2-0-cd35434cfcfe@gmail.com>
 <20261018-ov13858-x1e-v2-1-cd35434cfcfe@gmail.com>
 <366fba16-a479-4e4b-b6b2-7d0dc6ae4fd4@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 08:03:11AM +0200, Krzysztof Kozlowski wrote:=0D
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>=0D
> Tested-by: Sergey Lebedev <lsa.uz@pm.me> # Surface Pro 11 (Intel)=0D
>=0D
> Did not happen.=0D
>=0D
> Add only applicable tags. Otherwise please explain how this code was=0D
> executed and tested.=0D
=0D
You're right -- I mistakenly carried Sergey's Tested-by onto the binding=0D
patch. His hardware testing covers the driver/series, not execution of the=
=0D
YAML binding itself. I'll drop that Tested-by from patch 1 in the next=0D
revision.=0D
=0D
For clarity, I carried your Reviewed-by from your v1 reply where you=0D
explicitly gave it. I intend to keep that tag unless you consider the v2=0D
changes substantial enough to invalidate it.=0D
=0D
Thanks for catching this.=0D
=0D
Best regards,=0D
George=0D
