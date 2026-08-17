Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1753F44EF
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 10:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786964335; cv=pass; b=CafQbM6iRmR6Zz6fagxigf2Xdxf6pMBSpvevEpJf5rCoRgoyAijF5/Rj7LpGhNhK8b4ZQix4jgQcbIwjOdYfeIvRa3N9SM9xDVpz8HA0v8sNdM+VnAtKnOAJk1Hv4TLGdpSEG30byenvpm6nJ3iKkPpumsmB/94bHkH2Fwn7cqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786964335; c=relaxed/simple;
	bh=IMtbHlQWJKJmSSFhTgw7jWecL2Ir5wM0QgbUJG0kDxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j/stgSAhusvqDrnTUTE6jh2LUvnXCC7xABKA//9PQ6mQkxmk7mx++BTXdytgjLuEkqV1+g2NN9EIdMkFvTRE+dcqnAzeo1o+RJWXuIEky6Yr1i7Mah+Z54qXQ+J4DeJ3nAsWJ6C0W5ND+veLzOLzWKjNypY3UnhqLByU83OwZcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9yr17vI; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9yr17vI"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d01663d816so28028915ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 03:58:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786964332; cv=none;
        d=google.com; s=arc-20260327;
        b=o3hyoDYERLk92wCJGrHuyS0KjJShEufWzmCh5pKJGp6lBPXfPxJRQTiLNNlly2Uejn
         57KW6y6XFIBL1CB+ZslpOajll3b29GHavwxZpCS292v0Z2Tb6y/+Zsw/Khw9ZUPl6ODl
         gNKDoXtm68DJBrXt+LstWvCdX7nm9qL8bA8+mstSs6Ol+93tmv1Q9eugpeSpPSqo2PTo
         dLN8iJIDmc8eYWvDd4RuM1ttAHJjA2I/PxWtrEAZAAZ9pimXuME2jfmf5lbfRcY9rN4R
         wMsI6IgoGnvzYc4nbGL9nkYjcfovudQea1jO6TPaHPb042EjsO/u4N6jE71WBofMZOCh
         gMzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=M+b0jYgW03A+vd4O7ObKACxl7REgd1vcuWPPdy9fTX8=;
        fh=r6EmyaxlkGHh4T0NvSnr2mRXL6GN26mL3QKgomcIecE=;
        b=WBmZ85OWx2kKoOczWPXQJSXPWqecHZ7SkvN9AEBMn1vQyZt1j3Rx+QffcZ6+jlTk0N
         9jwl9fpeXv9CPwEX5KGa3b1fR2E4D2vQSA378bx+N63YVL8MsWeE03hC8DSQfcFjH2oV
         /xIAJy10eM1HAbz1PB5Jb7BzO9+zMG7PYYUOosHd8jeL/ZbOoBJrXwH482YJoDv8Hcjw
         JzjNQJEbyaeXIXD2I83c+di6NWG+W3QGDUwEB0T4mOwy5VwAFRH43iobhLkn5QB/jqBh
         HPMhYZJQebrfd2EcyhrjSxBpShMZdBazmb6Bexyh/V2GpfoFmuvb7QTdW0tREtNloGqJ
         Wb0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786964332; x=1787569132; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M+b0jYgW03A+vd4O7ObKACxl7REgd1vcuWPPdy9fTX8=;
        b=e9yr17vI3M3HjjDCmY95nLusd9hC7IJRh3QyNiCH19V7zrLSbktDCJS7zWKT2BSkfN
         AVQ5zCpBMRNKuHEt0eCOhdYrT/y1NrzsPgLcGLfjgCLnxBu8knJYVMKgZv9kxXS5iiHq
         gVIKmjruALQlLWIYWVCoNvFCmLKRIDRImf/dtDT5IG7ar9lt1l+B10bR1e0bznRpi9ID
         y47aKX3oLA37wGZvmGNVpE9UxdzryYks1y/cChiEg4fB42ZpassE8+qblGPZvS8744Zk
         jYhzkjvOXU73Fev7umfAJePtEIToL8/OJgDw9Yb5RCvdJzll7plZq8sWFOKFx+27t09z
         zoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786964332; x=1787569132;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M+b0jYgW03A+vd4O7ObKACxl7REgd1vcuWPPdy9fTX8=;
        b=oFgXCT9mm7/DeFutN7tNGePq/xJJACYntW22C4cvwTUWYReHsvIZcaUQKgdYADMdq7
         ZMQFXr8VrohlG6/l9E8zcHv4TBhpVyRzPdDPPfXK9K3QMLnMGP2m8Aa2s2jvNIwa5985
         i5XZOegVOfG9PAFuM76g4PqYCvkKfvZuTdKmsLxi2JowDv9RoMLRkPX49g+tvdeutS4v
         FCzsJ1h+QzQyDE8EuDitLl/ghoXhQxisxW7niGec8Cs8s1TCNSdBcWdIEmv0Yjn+W/s9
         ahTMK/P0/F5QWpxsjnZJOw7dRbTUbA9RTffM3nlSfskZ/5PbC1CBAi2cBh1gqQA6DmAj
         ongA==
X-Forwarded-Encrypted: i=1; AHgh+RpAKrteJYSrZ4F9IbYSqxG90fuCcBWycuueAJGDpgOb1n3Tauvak9UFNCq2zuzWwk9tt7eUtdf9htt/o7nA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1PBjyIb6f5Z0gLevwSP+SwnayAgT958xVgAZsQwBOP+X5uer7
	UDiIVxcHvU4EQTuk3NNaToj1o6RpwHZs9+BceEYbglCEVCwigVZNRLOnnLckZ/RXLz5iOUPbtIV
	nmlIk0NDEptmcKRV7KrhX2T6B7dH+OuQ=
X-Gm-Gg: AR+sD11IMlRz91wDzGiq4Jo633oD2ncKUeHdrpozqHPu+nkO8wdMI1bygl/i8C+cszv
	TFfTWc75R5MmoJfj2hk6wLJYLufOYDlfy3UFvUXzSIziSt3R5D20kmEOIXJR+vSRQoC9h18pE85
	K1Jyrim2A3vy/qdWU3WYoM4nc6FWjGij2jF2cgINEJa7CuwvHbtSC1N8yupk3XVD5sM+ePIPn6y
	g5+GDOtWPK4z4w7OR+BFJzaNMV33o2l0PyeicKl/aiGpukcQEhQK6RWzjNAtDnNeAIX/xAamrer
	ZSCF6OmmLIx3yXHstQBPiyLKx3LDNE80ybtUxJrHOidDyLqyphjfFpaHeQKdGdfa9DeCcsTALTi
	FfYLf4ChrWHw7HzI62Fz9N8+AOJIWeqZDWUYr8tc5Z1UVPbvqfE2dbbwU
X-Received: by 2002:a17:902:d4cf:b0:2ca:660:b1d with SMTP id
 d9443c01a7336-2d3b0d5eccfmr247797795ad.11.1786964331843; Mon, 17 Aug 2026
 03:58:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813042012.17631-1-phucduc.bui@gmail.com> <20260814170001.GQ265046@horms.kernel.org>
 <CAABR9nFxfzf8QP-wq5iaJRTL+HG+a+tNqqX2daj-=Cwp46hPJQ@mail.gmail.com> <20260817082119.GU265046@horms.kernel.org>
In-Reply-To: <20260817082119.GU265046@horms.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 17 Aug 2026 17:58:40 +0700
X-Gm-Features: AcwNN1XKH4dVb_0RJE6LwSHqmPfYDPdjDqVmlca3ZOszbhsVaf-YGJmUq6V8L8g
Message-ID: <CAABR9nEX8Sc3dSO+XfA5tQNjGeaRKikS3ijJ0Eaf0pAKq87LQQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] net: xilinx: axienet: Propagate errors from
 optional IRQ lookup
To: Simon Horman <horms@kernel.org>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Michal Simek <michal.simek@amd.com>, linux-arm-msm@vger.kernel.org, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Simon,

Thanks for the suggestion.

>
> For future reference, I would suggest including something
> like this in the patch description.
>
>   Found by manual code inspection.
>
> Others may differ, but I would find that helpful.
>

I'll include this information in future patch descriptions.

Best regards,
Phuc
