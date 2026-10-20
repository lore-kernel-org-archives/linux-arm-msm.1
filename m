Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502679;
	b=mFIivN0dBq6x0UVJHQYpE5a7qwpi1Y9wRETmT/rOkGOuNsQNJsWBg/lAYdjKiWqu+E92
	 CuQFehLSzwTCj3JOWMiOBud7g3qYmp2EfKaFCmd4rMZ+gVm2DjB1KJdqyHOZZkPhQGlQN
	 iV9YNk4VekarZJe8CipdO03cm3brx5WUKqz5H0ouX0TU4CvevSWJkCp5yDluhVYkv2rFG
	 0Eas+MepQqv8BJtmxHQNEkHn/EqHVk2LtZqhORmrffoC0OcRRlWE+EG8ipJvM3wW1+jo1
	 e2bWgSpImpjzsHNkK22exECY+JO/jhJ9JLZ9/sdDiA6p9pPUZQCI2uMnMci3LxGHIWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cbkSJksY8o+Ofg/AeXbkqolH52cZOpuyoJMWdVSYS2g=;
	b=gG4lFdoRNQ1oncrl2S8G/1fggxOE1dPz+cIiBY18gdv/fhtAQoXq6fSwtSdy4sJ/jYOy
	 5LfqONK3bv2hFePt+XkXjOztTWWH9N61i+obFjBD/36Z6OIhhzAB2QA+HlfWQtQ7At7pO
	 P0sHzAyZWY3lCi85crD1+WHRAXbuWqwoHRYGlSXTOsxMiUn5fMtxAa60AHrKDQICVHakU
	 3QltycjOUS/PWWzD3Ah0oE07jDJj8FD9pdWZwwOl0RCmt2wigvNHVThqJ/LwTZUPdRhW4
	 LffH6vceEnxXc8SB8sRs0fRNH/a6b729pvSCeeAE4uN4AfrH/on78Gme9zW2+USgJ+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LM5bjUL3;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90D8606A33C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E90D8606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LM5bjUL3
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a06210b29fso855586b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792502678; x=1793107478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cbkSJksY8o+Ofg/AeXbkqolH52cZOpuyoJMWdVSYS2g=;
        b=LM5bjUL3+mj3TL6zTzf0NObne+OV9vWzb6zKGJc8M5qxVHNdtxpFDxYVG2tm7XZ0l+
         frrrxmC3qwL/RNgt79tE+upVvNnNly2L/kiG30GEpdYfAVQv8hyyHbtMJC3CwVpQvMmP
         Cf4MTp7HwiMuP2tliuH3qIot5CeowmV8D1foCvDUcAUI/tm39YP9rubXYgwPnos4/odx
         O1C65UUAjcHY+DENihTLTlOEY+TBma6z94QNPmFUaxX87US8lQTidF3yJqrzaPgjHTo4
         6kTj9D/5Q3an7MC9qbBpo8toDPjp1GmQzgkSIXzEyH4j2rIRZ/LUcpsBRtdMVEcZeMcT
         H5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502678; x=1793107478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cbkSJksY8o+Ofg/AeXbkqolH52cZOpuyoJMWdVSYS2g=;
        b=bz6fQJF6vapVzUGyx0eGELbHa6aiXX7Wlq+slnLw8gdeYuxDTXKssdv9JSmWgeE5g7
         ZvqQCr8w+h2UvPHwPV7kCno4vVsqbbYz89eO7ALrQaz8P+GTfkg+30I5yJXGOS+OekhD
         EK8cNcGCDjWeDUOIvmMxjbs4rftDH1VrFewkI6kabnX38aDbWNzQfEbN1D45g4A7G4oc
         GEONDlL/fJ+3O0bDV45sz3xum6ICUxQRUdWWhMNa6CteN6MlRFaDQ0Vf+f6ScPxbWuJC
         KU94AlbCDcY1j9gCNpGpBhVhW/I7neXhem/puWHpz128YTlbmdOdkbC4TVU1Edltt8lY
         ZujQ==
X-Forwarded-Encrypted: i=1; AKwUvBwD9wy++s2WWI9TtKxEzPnBPB7onG8ewInrpm4EpJ8YS29x//Iusk9I8ba5y0kKXgnww3zdIJ2GthJCeo1v@vger.kernel.org
X-Gm-Message-State: AFq9FYLrKLZB/kx7PHgYdc80VxaHZjNx7UxdcYQVk/GBBfGQHK6vKl9Z
	fkPxsnUv7OglJqnFPLBlYfoJbIlvYlwCn86eSbH42hfpKIvebgKP9Wym
X-Gm-Gg: AYBFou1JXdPKZgyisEHN9D/kA1rTLAPpajadfXNRIwI5t37k12lyKM7bqQhfWK+4/np
	0JUgXTn8gPG/r8Ut5Dnx7g+QU6aco/6jJ/N4e5ZNBZIdSB52z+zMfxodAoXeEC9I+MkvN/7MGhW
	N7XyCyBNFtxmgaHh9gcgx/ip+BaN1QH1mMl7iDxIyXIzLZZcjNceLYuSs703MlwZ9cwFoQ5N4h6
	Ygsn0jH4YXH4ru5CKjipqxnzGjbM0Vq1vRkFn5x1yyhoV0yFW+JDVTBato6U1FlK1UnMGL5YkZm
	Rn7mhgW/FU35XgMFV9vuCNieSzDiIYAo20RG4yRp/v7lL34PVx1HUGn03/EM5VTZV35sBjkv+PH
	bJOWLVGd5PDSvQclukyTu17LdxofbRdpxMwttV9fQpV0t5fb/c8m9tWaMJAH627eTvS0bpaGoww
	CKX054CAZl6m3dGWNgc9HLnQj0HZG0dH7ygsOdKsvmmkq1Gctho++6xSqogAo6ZYuPGv5pPwHse
	ysfNn85SQ+r7IwGti1CUVso
X-Received: by 2002:a05:6a00:a8d:b0:899:53a9:1dd9 with SMTP id d2e1a72fcca58-8a04d34d8b6mr8875311b3a.57.1792502678125;
        Tue, 20 Oct 2026 06:24:38 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f56c8b931sm4779680b3a.9.2026.10.20.06.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:24:36 -0700 (PDT)
From: joonhoekim <26rote@gmail.com>
To: Vladyslav Tymoshchuk <tvlad744@gmail.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Joonhoe Kim <26rote@gmail.com>,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	lumag@kernel.org,
	johan@kernel.org,
	neil.armstrong@linaro.org,
	casey.connolly@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] usb: typec: ucsi: Schedule connector worker on freezable workqueue
Date: Tue, 20 Oct 2026 22:24:30 +0900
Message-ID: <20261020132432.998-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261018150136.5896-1-tvlad744@gmail.com>
References: <20250205-ucsi-schedule-conn-worker-on-freezable-wq-v1-1-107d1356b77b@linaro.org> <dp5ohy5piss7osycibuke7kwnfl5elnmc6gfvqgfh6mzzrldla@sru3ylzrtuea> <20261016125044.1085-1-26rote@gmail.com> <20261018150136.5896-1-tvlad744@gmail.com>
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

From: Joonhoe Kim <26rote@gmail.com>

On Sun, 18 Oct 2026 18:01:36 +0300, Vladyslav Tymoshchuk wrote:
> With the connector work on system_freezable_wq, both unplug runs
> resumed (2 of 2).

Thanks, Vladyslav. So the same connector work runs before the devices
it calls into have resumed, and breaks three different consumers: the
FSA4480 switch here, the PS8830 retimer in Abel's original report, and
the dwc3-qcom role notifier on your board.

Abel, the RFC has not moved since February 2025 and two more boards
now need it. Do you still plan to respin it? On Dmitry's question,
7d0767c5cd87 took the same approach for the altmode worker as a
stop-gap until the PMIC GLINK rework, which may help here too.

For the RFC as posted:

Tested-by: Joonhoe Kim <26rote@gmail.com> # Lenovo Legion Tab Y700 Gen 5 (SM8850)

Thanks,
Joonhoe Kim
