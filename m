Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594220;
	b=V+yl9mirMR/puhojUgQFYxkJ5KV7b1kHGqfa0ZU4/o46Wmn2fAinYH1zqVhJU+qajAGq
	 X+Fcn8m2UaYr7PYkox+vWES2gH779eWxZrJD5U2T1MHp8fg25zGd0wns9+6CTkJVrzkvp
	 g2chUmfeehVR+M2szxVFPHgZ0S7JccE9Y2Dkx/ehjnX/TdAnHqxbFyRhodl1SCcteZA75
	 0Npwnmps47egiAF7E4GDywSmFxQSOkAr4bC7Fg8/aIZOrq4tpZj5eM4mV8KZGVS2V7uQJ
	 E2c0bsYo1ATlQJzoULJ0j0t1K7WLUK4A29Uopy0t0Lw6mkFNMYWzv1Yvzl8ls+NlLDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BHutBPzebl/J3zCV0MJgpcVp3sq4NEl1Vrogec/7Cx0=;
	b=uMm9NjV4eBvGQaAhEc/w6/6eqQj6l9W7mfNJk2S5ZpAxLrQ+pLgFo7hlqXOGpSUoPRJY
	 PnRNBeBSAFYOcAwsBoCnqiYZy1MZLT1dBXoY+VGT1uhxr+6GjAx9YkBrO85pFNM+MyXY+
	 wzwhYrWEqx4dc4rcVZzON3kJl+vmlVT0ZCL1LbI/AJ5LfKXU+vUydHpZKKj8teizQA+Yc
	 1PAVDGtHERQdOn6xEE1TxzMHPvRcZ0CSW7Iim+DXkfQW56/YKngvBkG7Bl1xOLycy/pkg
	 53l/plDBnAHgJaYGP3MDm77CnIxLU6mH4A9XU7GmYQln0CgO4vIY9g5xmH4FIsncZDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qFE4XIvC;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B10D606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B10D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qFE4XIvC
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b3fff0d993so761817a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594219; x=1796199019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BHutBPzebl/J3zCV0MJgpcVp3sq4NEl1Vrogec/7Cx0=;
        b=qFE4XIvCt23IRfOwY3ry1L6pAFz+UK00kqi6i1TVSMdpVQbNFtwN931JpbTb1zw1In
         XS6zBN8UnNH1gebIuuo5N56bwsfAbG410X7yamdDzzJEB9SyapRq+ZIEkFEDm9Mc2OHN
         Jkgfta8hMmoIhyHJBepMrHAs+01o5xP6XMlYtahsgMJM0W5aThJTIOUkw+bkwNRK8gZI
         fi2SyNngFz1yS1ORSHWcRLcW8sxP34kDNV5tTPOoU2h6XM0athMW3PvVK07CzQoLYqjI
         P6BFdhq7KVo7imLPTcYyjP/WBywDeZy8oitA47bYCEF8PXQEHXzxDGAAuh4FfUuyflVV
         2Edw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594219; x=1796199019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BHutBPzebl/J3zCV0MJgpcVp3sq4NEl1Vrogec/7Cx0=;
        b=v9b17tXiVG7uKW0lW4yS1imjuimnIWG/S6fQARvhTdUaYq2zJfRHpGF74YRc/EaYUI
         0framliHMi086dXHsLkSaaF3BuOwk7NZaem3KQeu2m40+yaKt5PwMHOZppjua6qlLN+9
         Ekh8EKm8EaPRus4+S/AFdChsyUjV04Rjwln4+Lbg12jrnihgx8YFV2wQ42HB1MY7DPY6
         i2kqLlVdXyBNwIdJ+/OxEpBJ2+w/gAN1bGGOiSiG75tfCBgDwD9D9jz5UaXaE9aN7JqG
         oNtbN/vKhbJ8QPr0oaaaonjot3cpksOxVWN2gVRPlDq4VW1BoqCKdzepp6FvatIzWytN
         yw4w==
X-Forwarded-Encrypted: i=1; AL+hErHAEBV7iS/pv4tzYhSTCIqIoXD3cO/+/YCl6dE5RrQIK/OlhjPHNQlVaYfbj0eoU5rwlOk3Do40Z0M4S1ms@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZGd69l2uq2iOMW4OBG/J3+drVk5fc5bDFNI/pBkgYwCStv4X2
	K7ICSbJe6PoWs3Pk7Wlsda7nUmLyoXbsKPJbqftLitpKaVPx1TNAPOZg
X-Gm-Gg: AZFdTZcGiJ3nzDXB8H8aq2Q66p7LxKYpzb3xz/ovilBbz2LkS9frI+HK96C5F0wkDN9
	yiSLC+dhep/ggP9aWy3csiWYVl6hhPoK0svDuqq63+FSiHbAJ6aXGhYQutZMuLCSmUXaI5g09LF
	QCgtsSa0+jA0QrdMtmMARqnImoEwLjzcGfLMy9PX7nqMmGwnlvnk15BCgU28kj4xjOya+RdQ3pG
	hkxI2OhUoqFWnLj1GKT7lLteomf/peCGv1lQHLaUcdtQvjAObw0Xcmdhi+t66NegZn0LcwqmQh1
	JwFTtcCn3rMLb6w7V2Nsm7nswY6l7dsycszC/o/C18D/YFwSMbPHmDFZhsLfikZyIdJeeaUjqah
	tQnOKOSB1+2x/tkM4169/4RdibetkLLWQwG+iHKbuzIieZb1GYjymC8FjoUT9/lQq6SI1MYwxCn
	SgZZ6PtEgJCEL9Sf8l63IqWFm0iXSYeEPst1qJZILmXgKQaNVZ5aGTy3vkMcBq9lQm4IiAFDxEy
	YiVlES+i+o/42P+8JhEW5eTrPD5z0UlTrxDiQ9yOAgUy/jlT/V1EN2Rwhi9+t/ZAFQs6nQZHiiM
	DhaMjeF1QrjCkM+xk4usFfATPm4wZKxJ
X-Received: by 2002:a17:90a:e70c:b0:3a0:c1b1:45fb with SMTP id 98e67ed59e1d1-3b41c58aebdmr26491950a91.0.1795594219507;
        Wed, 25 Nov 2026 00:10:19 -0800 (PST)
Received: from localhost.localdomain ([240e:36d:b09:6850::a60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b420e1307csm25528081a91.7.2026.11.25.00.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:10:18 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: andersson@kernel.org
Cc: abelvesa@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	kaipeng94@gmail.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	robh@kernel.org
Subject: Re: (subset) [PATCH v6 0/3] Add device tree for Acer Swift Go Pro AI (SFA14-11)
Date: Wed, 25 Nov 2026 16:10:11 +0800
Message-ID: <20261125081011.1243275-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <179416929522.628393.2913043282200216817.b4-ty@b4>
References: <179416929522.628393.2913043282200216817.b4-ty@b4>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bjorn,

On Sun,  8 Nov 2026 14:20:10 -0600, Bjorn Andersson wrote:
>Applied, thanks!
>
>[3/3] firmware: qcom: scm: Allow QSEECOM on Acer Swift Go Pro AI
>      commit: dd851d601d63bd157562e7fc054eafdcc2ffd936

I have see patches of dt-bindings and QSEECOM in next-20261124, but the
devicetree patch is missing. Is it dropped for some reason?

Best regards,
Jianfeng
