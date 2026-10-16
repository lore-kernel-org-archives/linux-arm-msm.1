Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC6B501F49
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 16:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166941; cv=none; b=TG8+BgHanG2TLwtZcgXbb6lZ0jHEwNm0JUzKezIxHrDQZ1Phsne9yI3lCq9iMtz8/dTHIP3ORvdyOGjTmRNy6uzDYyrfEP7yydttNbxEFUm1VVWdyd7frlqhA/Jsy1p9l8ATndQ8tjbTCPWDZexcCsjoYL9C7+ZTVCLUAOPsFVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166941; c=relaxed/simple;
	bh=BX8jpYEOlAnaKcl8q9t92/d9RE4Fbo+mDDNxrXC25F8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKdyst5p3Sv9Th1HArh9KsD148YnNjp5x+3VhN6NqowjC90+0Rowbsv8jHwdJb0kKVNsDThmUTjoicFYvD4ij0OCiSb1lXPIF1pGJhBI3a5DZ+udjA6sqU7h2iY5pPSYtvOWyBX1vl6oiW2lMhwYef3TbLdwdlMNUphK647dtoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V01rT750; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V01rT750"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-486e70f2457so1349159f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792166938; x=1792771738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BX8jpYEOlAnaKcl8q9t92/d9RE4Fbo+mDDNxrXC25F8=;
        b=V01rT750maeN/OBqsYYim3ffP41BONdL4nuWkChBF8PkUVB4cTbKrk32IctOteMJsy
         PlsPMgZBMHG3NgHAjp02KlpWCB9DHfXPSNZAENzwezSjGAhLHrUjUOW2LB0NP/96h2Y+
         FXHmuvVM6IzOapmUkyDXbAUDQHvekv4f11uU116vfer1pkJHU6fFb066YdyT8l60xIZ6
         tccRreHP9AgpMHtMzzz3qpchYdpf6xS/l+SIfLMsg60cbGxKLZo14NdAeB40x4kbXLhS
         q4AHBajCwVYwbxEHHQbNs7fd639z1bgESEWex7hP34A1Otae4Kdo4lTTvyHLUve6qsEr
         cAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166938; x=1792771738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BX8jpYEOlAnaKcl8q9t92/d9RE4Fbo+mDDNxrXC25F8=;
        b=yVA4wljG0J5/OiwOLhtQt0e2rZVlPNYe0y8VyoudpUeWFCCy5JOcyLwEH/SD7keNNo
         qeHxTg0EXkH9+xO1MVpXjTyZCyssN6WNgvNT6UsZIsuTlqpM9xm8q/F9Mc0AWxTtYNBQ
         5iZ9/kTJnPc4YN9yWhii5O3K0UeLCNUB84KHt08wuC1LLRi8NBPm7/FCZJBfy1ZLLLno
         uGYewbGaItaMwTA2WHKii9T80wpJ0OaHKOJJu/OE/4zQNxV4G3A4Ratwkkxww/lV5ivg
         Ved4PaxSnqMINQBs52MY6qg9eIX2fNF3E94X9MPIqdOx9Yoa+hhb+195M0TNjV9g2i3O
         iX0Q==
X-Forwarded-Encrypted: i=1; AKwUvBx/i9qQ7t0HNo/lItTJADltMnzzkPzxuRi6iCp8Iv4zprsx2VdcMnkF+rfeUlgkh+0rqmzoY3txdJK+NaFA@vger.kernel.org
X-Gm-Message-State: AFq9FYILvlXG09vq0PuFFfqu54+ljfP8v+CWwaf0vpomqiQLwI2nzrof
	vNoFBqYrPf9MMOq98o56QQ5iVROxQcaeNpBsITzsyF79MWNPzA7swuME
X-Gm-Gg: AYBFou3o4u0F09BQgBXeCxUKUWuRSqHK7o4PH6h2IyhQxyTXl/ju8qVqyac5YwHVj+x
	aDjlTVAVSBz91JFIISi65+IoS+/zLDHb5gkg85zvS8B/I6eVwYYAezbowt+PHje1ehRxlsXC+Jd
	6G7TM1hVPcHcaH9AZnhMq5lmxr+KcqEkFVLAbmsFdOjmWlI4EhK+ZRB0H4SsDTe+my+ths2bzcV
	Y3wQQGH60Xsp08vTduzuCpgse+DqFKLDgqwFL17/MymToHYrjZxdC7AwcCeqd12GD57Mwz0qW/l
	CqyP1xB/hk4MZ+AXlVB6jzPNSJ1c7KKL3I4Y5TKo6evUCbXXgAJwRPzNvFWZAMVDBUSu5Pqq5hx
	Q1UV5g/KTXicPFHfS2kxxihr4wBTtFb0IqyZRg9mlIJd9resH8Wt9t4M/VQUlmhNGPbmSkJuZse
	PHcjqMOkeh/hGRLKvpwHVDfOyUIbDur01TDKZkRZ8m4DBId+/3jM3kvVjNYdA0W4tZf7vyT8ojq
	fkMbEoL1XO4rw5tJ7EactcRODB9901hXvvTLryRkjmKK+OW8oS6GqVZlE0ndWS1p0QpwQAeoA==
X-Received: by 2002:a05:600c:e555:20b0:4a1:77db:45d9 with SMTP id 5b1f17b1804b1-4a1d75fe6d8mr4483895e9.6.1792166937933;
        Fri, 16 Oct 2026 09:08:57 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8d1esm6219143f8f.39.2026.10.16.09.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:08:57 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Sergey Lebedev <lsa.uz@pm.me>,
	Andre Gilerson <andre.gilerson@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] dt-bindings: media: sony,imx681: Allow a C-PHY bus
Date: Fri, 16 Oct 2026 17:08:55 +0100
Message-ID: <20261016160855.193463-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <e5d75c47-2051-4b09-9d33-d2eb64a141f5@kernel.org>
References: <20261015-imx681-x1e-v1-0-fd22f5f3b0c5@gmail.com> <20261015-imx681-x1e-v1-1-fd22f5f3b0c5@gmail.com> <e5d75c47-2051-4b09-9d33-d2eb64a141f5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bryan,

On 16/10/2026 16:59, Bryan O'Donoghue wrote:
> I think you should constrain the existing minItems for DPHY mode and
> then add CPHY on top of it.
>
> Your commit log says Add CPHY mode but then it goes on to do other
> things like this.
>
> Break the two things up into different patches.

Will do. The next version will have one patch that constrains the
existing D-PHY data-lanes, and a second that adds bus-type C-PHY with
one trio on top of it. As agreed with Sergey, it will follow once v8 is
merged.

Thanks,
George
