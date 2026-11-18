Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994148;
	b=SE6Fa1bleDsxA39tj7nmvads9V2ChG9Ms/ikQ2agJqtOLqWukzY9qq6NSy/03///90sg
	 gFJUIlJ45wKPWR7PU+y57MbV7h/nMZuYFaCigB7tpe0UDlfUR4bkVQ+khnSrnU6Tbd6qg
	 rmNlcmib3kYAC8OrvCwqBIT7h3aASU739sqnsi2XCe6z8MPnoentvZAkpNyoiFITuOqEF
	 l6i4U/9iYVtCmHCdr5wo6v+QSn+k3ndKoCbg4B5CsGdIUdUq530vXAoBMMprGH86NctYa
	 flUTjFZWrYE6dB817f172yEBKkszBg8B1jnPoAK7+4hVj+ffMlCG+vRnW8PV8lfJr6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994148;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=DSXfu1PIu59guvr7NrYh0tUSWG64pwaYKrdfFReWnrY=;
	b=c3xdiyYvF6U7+CQr3mZXHY4e5k6LhUXeMNOuAi/a8a16cfTVlQbe/+X0f7VAlt41/iRg
	 bdk1DaiZ4MSOQmTkATCA27vldOM7uoQpx2LgGOMlWzh4uANPjuE8+BCbTUqFDoDjSiahT
	 FlEUebKb1IiY0R66CKQ3C92M0CnU63dF6Y+6kIX4T0Ts5tI3OOTsd7DGKSlIXtE6sfAR5
	 kSd304++zYFNvd26zsi8LAOF1O40L2O17LLf04hpSXRfne42W5oK2lwSvH0rzmCN27ERA
	 xsO1N5m//19pAXVVs2u1xH4dqHIuXhXXbNA/EMLlpcGlolEb9Lz4Iy84+5t4dyuad7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=El1vMZNr;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536A3606A31C;
	Wed, 18 Nov 2026 09:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 536A3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=El1vMZNr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=DS
	Xfu1PIu59guvr7NrYh0tUSWG64pwaYKrdfFReWnrY=; b=El1vMZNrxCYt49Y/E9
	OVAPQvcRQBUN1mjyhcquLs2EWU5bgYjnA92kCHTTKcbDCVGvve0tZdzeTFZGhGhn
	XedB91loF17jvrru1mmYjQ7zP9gmsP/7nCnjSxVnLAzgKKQSRBo0VcuhH/sM/45q
	wZg1u26L3enVK52wK1mJHf9rk=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3307Eb_1qoFHsIw--.26649S2;
	Wed, 18 Nov 2026 17:28:40 +0800 (CST)
From: Hongxing Xu <xing1989093@163.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add per-device ACPI reset
Date: Wed, 18 Nov 2026 17:28:13 +0800
Message-Id: <20261118092814.2275-1-xing1989093@163.com>
X-Mailer: git-send-email 2.40.0.windows.1
In-Reply-To: <CAFEp6-1TrCaeP8DtHvUFnPYQw5+B=gRa2=ogjqCC+fKy9AXbKw@mail.gmail.com>
References: <20261109110352.1621-1-xing1989093@163.com> <CAFEp6-1TrCaeP8DtHvUFnPYQw5+B=gRa2=ogjqCC+fKy9AXbKw@mail.gmail.com>
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
X-CM-TRANSID:_____wD3307Eb_1qoFHsIw--.26649S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw48JF4kKFyDGr1fZFWrZrb_yoW8Aw4DpF
	W3WFZ3Zan5GrW0krs5Zw48Zw1Yyr4fAw4rWF1fG3yDC398Wr92qry5Ka1jva47CrykAanY
	qrWjgr1DAFsYvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U0jg3UUUUU=
X-CM-SenderInfo: 50lqwiqzyzimqt6rljoofrz/xtbC3wgo5Gr9b8juLQAA3o

Hi Loic,

Thanks for the review. Let me check that I read your two points correctly:

  - The reset method should not live in mhi_pci_dev_info, because whether an
    ACPI method exists depends on the host the device is plugged into, not on
    the device itself.
  - The driver should instead walk a list of methods and take the first one
    that is present, from the most generic to the most platform specific.

I agree with the first point, and with the idea of a list. But I would like
to suggest the opposite order: platform specific first.

The two entries are not two ways of doing the same thing, they are two
different kinds of reset, and the spec keeps them apart on purpose:

  - _RST under a device scope is a function level reset. It must affect only
    that device, and it must leave the device visible on the bus, so OSPM does
    not re-enumerate it.
  - MRST, referenced through _PRR, is a platform level reset. It power cycles
    the device, so the device comes back as if it had been removed and
    re-inserted.

The spec says a device should use _PRR when its platform reset cannot satisfy
the function level and bus requirements, and that a device may expose both.
That is exactly the situation here.

On our current board, both are present. The function level _RST succeeds, so a
generic-first walk stops there. But it only drives the link reset signals; it
never removes power from the module, so the part is not really reset. There
is nothing on the host side that can tell the difference afterwards, so the
walk never reaches MRST. A method that exists but does not do the job is
worse than no method, because it hides the failure.

So: would you be OK with trying the platform specific entry first? That is
my suggestion, but if you prefer to keep generic-first I would rather hear
your reasoning now than write v2 the wrong way.

Thanks,
Hongxing

