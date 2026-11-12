Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.214.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794490773;
	b=EzAiwWmxHy91is5XjIYL7HlZJ2hBcEBYb82iTAKPBzDDXj56Zsr8pJXP3o7Zo4Ay+G8v
	 YO9HgpOXuMhvdLnOXmX7gnV0aS2jJSY1tx8OrgWm78t33WjtaPc4CS2wO9tIWkxPMk4/S
	 bpIbiwfYMmX9eVoGTXJid51Hk8ZFI6z6jL9H1ok78UnkqStbRvwo4Mj/icE95JBVMTvDK
	 NI5sdPtmm7K6gssKqCOnChVUtdAhWHaXYt2kRyIFDIzwOMlwacE7yIvS+TtVW1h2x35U8
	 OmyPEaOmjadpp27dMdAAeZZFwpatK4s0CK+tcHN7MCcyt41qSVHyqjYGNTwVZ79Q5LQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=hinaE5bXyUrpJk+LwEFRwoOnfVOGtmBFwj0E2lD/oHg=;
	b=bNG0RrUcXPK0MhBVBGG4FZrqeUEaaROfrWYxqnHneUhjVPBsibSrYcsRH4b6P/vSsTeP
	 ktUCIy8XouXSbpwCUmJyXTi0rzvaY8sUdlUgdtym5txJEjlwfDZZ0CSV/pnK+YQLpsMFm
	 7yuGAVKPzQYKaYFpb8gvwgUQgc9OOK37Qggrfn+90WgdDMrKenc74NQ3wUfOOeLpoH/oq
	 e3LtLs1cmh61JAWxf9TLiUWVq1Q7gq7nY7FajtmfkH5rqnG0Wj5XrPPBgssfbpb4hI68g
	 v+sQAkYlVwvfVTCprzlk+LBo8xm1crk6iE8nKkNEb5nBIJP3PZ/cZoy9YOFYsmjWxNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o3+kfEWc;
	arc=fail smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784F0606A8A3
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 784F0606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o3+kfEWc
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ea7190aea1so18145435ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 05:39:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794490772; cv=none;
        d=google.com; s=arc-20260327;
        b=SJP/QuPhHhbKK4Sz+hEQcgxX8QCAsGaHfqZEVtmJzLIbsiFuoPrwdrgCksW7epqolM
         wQlYpLdhaeNeShnSeDFANYW91Xil0x9b6S7DZA7iKIRzi7ibU8sfoARrdhl1JfwB4ydN
         DgvTGFmChw1UhNLsPeK2SW0jy/S8m99n3ffUQlWwv5fk0bg4sMAMO35bVV0QrGr9GxbP
         MHmSy52L3JR66Tstv8XkJjbG9UTE5RXs9dHt+fh3D96/KK6v82tyQaEe5X0yMuKRoNlk
         xTUuh8G+6oAq4Eu7FEzkWDLgRUzYiYzplbcbTxMDoHXGP7SzDZ4h2cGWJGw86/5qWA7K
         Ifsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hinaE5bXyUrpJk+LwEFRwoOnfVOGtmBFwj0E2lD/oHg=;
        fh=FF2AvpVyQB2TWmS8upOD2qyQ0Vv5nWbt3bx1sXMqdG0=;
        b=hJxG6Gxgx5NNCicaqhR1lCRMkaOh7tyfFb08YS7TOyn0IchyZwvLVvLpSxqgJuVqi/
         iKahc3ES6+Inx6NntVL8IVAmc+Zl8HL42cMPCKBTLCq/dJnHppHK2VNVpLKaLz5t3KHr
         o85n93W8V4XpuWoM4XfPk1sbFvUwpbrrZW7Hov12AoC5LqUkwHDRkBPbw+8mRR6BNZga
         kgVnapLQ6xIEelt/dy7t73P3RTWwzIzg+WdZGWWwiG/iaVMttHSaFizUTCbHg9VaxECu
         X1qyhrSvu4qCPq7OPRdW3Fub5a7+BFtkNjVmkN/ewr7v6JEQk9Nkm0RJlAlzUgz1+mk/
         bhWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794490772; x=1795095572; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hinaE5bXyUrpJk+LwEFRwoOnfVOGtmBFwj0E2lD/oHg=;
        b=o3+kfEWcRSjRpnaVC5BXZKuL2kXjIQHclfzpt6+dHbhdh4Q6hf9C3pmuQuds+9EpGv
         XaxNNfh0D9MQ4cnsO6NytlHcJUL0RE6lWpqnrCQ+3QkxlmdR++71qXfGEXWn+N6dngcb
         bwAgvGl+3PYQ0cvL7dvepdIKzygBCUJqWR5ktSitplquzfJdrhZBFAF6oeC0H+IQ3zMh
         yHqyDIYw1v3VnagA0ZNV3r0N31Qb97+qe9VWSSm+I+AWbGmhoty5fvU1SQSIDm7H+bkg
         /ahGhTUYTNYcBepjiuZOI6JrH+7kYfWkSsHHi+vRV67EhJrWZUT04BfCTjUKF4RYk6uo
         InnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490772; x=1795095572;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hinaE5bXyUrpJk+LwEFRwoOnfVOGtmBFwj0E2lD/oHg=;
        b=sgI1UZBHIReGXYhBNz+eZSC95mgZVIsQWPlPCPUhwaPD8vWRnAccDVMg0Yd5qcQeJl
         DOC3YvoSMKCp0eRetCkfCT/864inzG+Hsflxx8lSQIAO1WvdtWDF98FrdRSBXY2SauEQ
         RJ6/i3gYuo0f8AeA2XuxVWFgtyAP2YxubamwdNE0dKMWUQKeALQZ7VsEzYh1GnBlRKDU
         mFN3LQ49vnia4MqK0gBvfc5Qwn4POsucchEPENtPEE02vvy3votjUANLOz4KDGxd0b0f
         ffJ1uont0RsWwt/GpiC/RqQvru3EAfnlAQE0DhUpPdicfRSfZkhQkizkTIDeHla0GhYq
         b0tQ==
X-Forwarded-Encrypted: i=1; AL+hErF3iEDGS72GjFujs8Hw3le1rbhDPEdyls9Pt9or1khkq9GWVyoFXouNyyAvSi9bEZeC0RAfZNUhywUg35MZ@vger.kernel.org
X-Gm-Message-State: APuU4Z8lC/QFZdBxc4DGGM6D12ILNH2ItHvthVpciGt72/RvKmk4TbtI
	wOyJjO4b8/Qu1hUaODe+f/x5YIShbg9ONw+hoVYm7y4Dwywu28h0lmRMA5wbELr+vFgpPwPYL9q
	DjyT42PLAcb3IYvfi3ftsvrE7YvTg6A==
X-Gm-Gg: AYBFou0vgkXmdxsq8Kzqxbe9GDTuQ/RVzJZ8bvCpL1fk16C/pBBbksnqE5dhLg3gpRD
	Vbe+yJUrjTanyRHiKg0qnYSF46W3K+sa+2u90Q3wcF2+AQeIYVIQ+RqXtKll+dXGKA+CVPW5cRW
	iWO+mIUb+5FfWxPJ3oUOGIWNCSYcd94vunN1efnPeWVMcBVHctFchDzYikbH8OkJ5LF0qMgD2l+
	FMYSpMNp83kiK6vTQ3CMt9aqMXfRqyICyRX+P1XZ/fPdRD0TzkIMWrKaf7wPaaHuK5HdPv/yzP6
	/q2mS/EUHZ8m2e7VBEux9cfO4wG1x3ADY/ays1n85E9dgPO8GMwZ3Boe8LkB3AdynQC+7EY9lwy
	WEzEo/QCUmH8RQzlPpvIPOUr+Ab7qxAIRWkJR
X-Received: by 2002:a17:903:3c2b:b0:2e9:723a:cf30 with SMTP id
 d9443c01a7336-2edd747589amr58537755ad.2.1794490772460; Thu, 12 Nov 2026
 05:39:32 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-m52xq-dts-v2-0-063289405882@gmail.com>
 <20261111-m52xq-dts-v2-2-063289405882@gmail.com> <20261112-sophisticated-peculiar-husky-c8ce51@quoll>
In-Reply-To: <20261112-sophisticated-peculiar-husky-c8ce51@quoll>
From: Asdlerto Korry <korryasdlerto@gmail.com>
Date: Thu, 12 Nov 2026 15:39:21 +0200
X-Gm-Features: AclHuK9wD85pxbo8x4o0sO-zJHkPTBWQEPCcLtvvrU2Ak_t5O0goATrr7wKH0Tw
Message-ID: <CAARotkfQxp0xE_XnixLeRLrcdrWx2PgC78BKv46e2NJiVnmmBw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: net: nfc: samsung,s3fwrn5: Add pvdd-supply
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	David Heidelberg <david@ixit.cz>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for the review.

Who will pick up patches 2/4 and 3/4 (the s3fwrn5 binding and driver change)?
Should I resend them as a separate series to netdev with the net-next prefix,
or will you take them with the tags as they are?

Patch 1/4 and 4/4 are the Qualcomm side (arm,qcom binding and the DTS), so I
assume they go through the Qualcomm tree separately. Please correct me if the
split should be different.

Best regards,
Asdlerto Korry
