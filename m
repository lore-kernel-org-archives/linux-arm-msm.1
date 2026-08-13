Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850D032B106
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 02:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786586491; cv=pass; b=iGS4n9uMx9pnNdoGGQJ6M1dn5fHDTdSooU48O5hIr8MP0VC1wmncpRTQUm0+Wskbzky8zaGfkvbgRg/S4mYqbdhMYiyqimmjThhEpA7mFCaMQ7tClLz02ya38zdWj9KTYDFQwMF6dt0jBohHcS4XVT3KGXtc1D6TeGt9Xi81zss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786586491; c=relaxed/simple;
	bh=hlqE4YkW5qnrwzgS72oZG+BgbCmAWDd7xaZ3TX+rX00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XyIFD50qQh+QYZUp4nkInTtRdF+2GrI3q3WzYrOMTqAHy7NcVWCDkmNHcObsmdxSR/8cPKA9BOMlj3pwDWRGGkVMSQ/ZJUkhNslDltqZt8u9G8PTjjXTN+yuDUm70yQuoWX9PCjq8u1F6B7v9MrcwWNypBE2vUgNYjcDxRrknx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nfI5eyFe; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfI5eyFe"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso1896171a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 19:01:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786586490; cv=none;
        d=google.com; s=arc-20260327;
        b=gaAL60VnA2GzCS8DAoH2/wP+NPDyvmG4qehorV3gaBZxd4gvpOU3cP+09+lv43r2MW
         0omtxTCkXVhcU9VkvrsxaJk89TDTXNaYu34/LY7PiLbZsbaqAJW9yZHrScuisIKVLGAn
         NBLtl9fmo7uHFLX8l1lRg/G2Z175lgNp4BZ5nU/ngjiPyNqBDv8iXZstlhSrmVoMKDdC
         QSrmzh3aaXZufpfuTZpLMw57BI6xgN2zmsqCDvglTMCn/JBCkaHiFfkpe7NuvWLMTf/Z
         yMR3nfu5XxLpFZ+zbh010HaweiRljaxGPeMX8XGqYLuLoMi2AVvGNrQ7u7Z+ngxVyMCd
         k0bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ga93l35D89aJ2IHV9FDqwS6Op1XlfD1igClEfFwYr1A=;
        fh=qcRoQvGfYV/VdtHNmBmBD4Y4mn88yTM6AwhLavYJWMM=;
        b=n2L0fu8hswYeAuH5nCpmL6j0UPwAtK0ROMJ6SnXcuIMCUvozkpcRqwOtHs6+quCMxT
         QXsDja/pk6EqncLKwrj6ChDGlWM3RETkDRvz43g1cwt+O72IUPLKM0fSfVSn+lzOjcm9
         NNyleGH1/5vxycnpyEV11ggWuD1wjR6MA55j/M/BB5iPV9FGQUNkkLf9GLqurBpspN/X
         3atR5DED1sGmpKBoCZOt3gtCLBfwbe3O3M2Ip6/IYv9NXX8tzZCqRvar31amAHoBrtne
         nnazNOhi4vRSv0PSyQ+Wk7aEDBy5DOsNMeKlAMVyBb4YepQI6SE5pUL7/VdjIrGLT4et
         rpDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786586490; x=1787191290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ga93l35D89aJ2IHV9FDqwS6Op1XlfD1igClEfFwYr1A=;
        b=nfI5eyFeCC8D9jCxCQ+WcwCJ6bTPUaAJSzAOPKgHJHa9KypsKldr0sMogFvrw/Vpl4
         oW0+sJeX9nUvi2KYBwmEZnqlSkSLzgltaz0wNseM54GpY2lq8J6iowmlLcl8sjETut2l
         W8LvIPPzDKMWyTCuKz2LJwi+EeThkgIA0VFgU/4p4qwOSGRLlgZdwX2+FrBYurj1tYBu
         qvn5LDBDV8efAyvf9B5Nl+gTZVX/rLu5aKzAWwb61UVfJy1k2ZxhSBOTrcVetpJvBNS8
         /kGRuIbw7SM1ju4kH2lBiYXB6iAEKP64r/qXdLUCqch6nFl95JxVxwixL7/HZOIhxjeK
         H2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786586490; x=1787191290;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ga93l35D89aJ2IHV9FDqwS6Op1XlfD1igClEfFwYr1A=;
        b=gfrqCg5wdtxSRzln+ZuGdoOqg5mQP55N/pzJxw/xyEquiDDQcMfwoS1hN1heXY9upI
         v+0WFMaW6v+JzoUDVzSEDAlzN7Zcn/zP2w5n6vGnMCJGUa1HAVlOzhLPMvSGlL9l0fTG
         lfjR1YYQ7iSDQ6tAMhw5MqFBdFIs9wGOplYLwpP6+Q9QwTJW1sJ4/QZ+o9L+hF+XUk4N
         RZuHTV1af5/1ITfpKD75f3GJTAA9Cq7TZQqCDZ1jrnKucaJIhOl5y1duh4NkuJYZbAfK
         IpWX9bS6s0br6iMXa3kwdx8D9ITK6BhMdfc/U20K5ar/IoKD6QNNzo2/PjQi6aiF9t9r
         QhPg==
X-Forwarded-Encrypted: i=1; AHgh+RrE7zvRnXcZ6Z2Ybc4cTGY8a05O0MjowAsHpElYY1DLIuFhgzlSjVQzLTXYeRhGFe+jB7GBaKZNwBCrJOVN@vger.kernel.org
X-Gm-Message-State: AOJu0YxO4AuK8dRh1ByGzKxwDNCawWS/KajxWvWCRJ3FhXwTOALPE3lt
	B4JF7rz7yPa+C7mtNF1yCR27AMzjbvgriB9G9Lc46/olcWopiv/dA1UHMTQk4/8/wAz9SAWq9Nz
	zh2u8sdpjJhaGrIGPh6cAXAVyUtCdXGc=
X-Gm-Gg: AR+sD11J4pOxwNE8oC2QewQnpCAFWo+v7VuJJOX+fkXNBGU8Kb5wq6gBmZqdhun4hWx
	zCVhIBwhmZUHxUa9mn6TaGLrBMHuaFZGkECZb9D39UcWh3752ZPTcjd9bb8kTX+gk+V6Ih0PMh1
	l2y7Kr/iOX3bsMk7NVbs6xt+ySB9GzSw7SDCaUb8/CzZeXbJa5Mo5xLb+2+59yFqWx4d0T07iKP
	cJeNg+xjvVYspsRrNucVKdwdccSHgURa0nOu3Qyg6RgLRjxjaO4GLUhQz83slTGX7QobEci8SQA
	QdkU9jcwzOrEqj14182p8baasEpkOBT5rgm99d6o3uOCkVIls1KR9Rcr4s+0XBZRcDsAo8YrZhY
	koDW+oATBPENEpbaNpFI6AenZwnP+WOiy5pAyCFJNjtCzRKYxRvIFuYEw
X-Received: by 2002:a17:90b:2246:b0:38d:dfd1:7c1 with SMTP id
 98e67ed59e1d1-3931dfdcc9emr2607429a91.2.1786586489664; Wed, 12 Aug 2026
 19:01:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811034715.6034-1-phucduc.bui@gmail.com> <81a38486-d4d8-4ca2-8d22-d3d178c17665@lunn.ch>
 <CAABR9nF4q=eyUbzmo6-Co7NfVcg_bufHnffy8Ho4ZehHFZpqJg@mail.gmail.com> <017b2a0a-0092-4958-b554-45139db50cfd@lunn.ch>
In-Reply-To: <017b2a0a-0092-4958-b554-45139db50cfd@lunn.ch>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 13 Aug 2026 09:01:18 +0700
X-Gm-Features: AUfX_mz6vikeDAWQkBfvSuo0tedoVTQ282pGLuo_TeMhsfWXN6Hkhq6AgPX6zzg
Message-ID: <CAABR9nHApFe45RCcXoHDiNh6yqnyVLxgD=oFmpYohQ=QT9=wfA@mail.gmail.com>
Subject: Re: [PATCH] net: xilinx: axienet: Propagate errors from optional IRQ lookup
To: Andrew Lunn <andrew@lunn.ch>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Michal Simek <michal.simek@amd.com>, linux-arm-msm@vger.kernel.org, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Thanks for the feedback.

> > lp->eth_irq is assigned from platform_get_irq_optional(), which returns=
 a
> > positive IRQ number on success or a negative error code on failure.
> > Therefore, a value of 0 is not possible here, so changing <=3D 0  to  <=
 0
> > is directly related to the error handling described in the commit messa=
ge.
>
> I think this is a separate change. You can then reference the
> documentation, and its example:
>
> https://elixir.bootlin.com/linux/v7.1.8/source/drivers/base/platform.c#L2=
70
>

I=E2=80=99ll split this change into a separate commit.

Best regards,
Phuc
