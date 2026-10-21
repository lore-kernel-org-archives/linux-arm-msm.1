Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792614394;
	b=h2Ubxwlkr+dJ0pYQrVXfQP44MgO67y5qlCRkPJQMau4ETHjrgD6ZR1fUP2KCM+MyH0wP
	 M15DED1xaAikRxEAV/r3SqMmplbu8DrJfqJCgy+RIv0iCdBJhWGxqjRUhq+OHiHjoibWK
	 Jx6Fpywfwj2TGMWQ3sxKkKgw2oRpjiM9yYNi8SNy5gg4JtyBMtZcJiGnHl8PIOXxJnRWE
	 yopPC2FWUDdpXzceYuKUbBZOzAXi9GO6jThqDq9JwvJk7fldh9kPKEzhKhxKyQOlA7UB6
	 vPq9ok6bVip/D4s+iVA3sv+pWINSq304DiDrJPq6qvK25Q66fLU5shyfJIFMfI0g/CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792614394;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=yMaByKpIrW0LSyYgQK6ZFp9Smoe+FCDXKYUFjdBbhF0=;
	b=KS1iARm/vl4p+VrMevC0qtON50yCWnq+ZhEOCW7HmJP6YEup+QSZPT9raUwvJUCuOLDF
	 ZrkHQWgLqR+R3L6swC3yrtpw0kXKy2hXFwJC60snr78A8CmKdtRnY7vPeV6hwLocOKQOy
	 KXv4V/lvvSs/8ixuBIviOB9b22S1TlGXW1xTBEj5ddx6+PREAMQmWa75b5rkq5SRmqROU
	 dDcFEVFkFOCPUBVUExA7uZVHi74Tn9Oq9x9w9GSTv1gsLEU01hFBx32fHTohpSpA9s5c7
	 pJ3mLaClP6ZILDuAtiT4Z0xC5EaUvRRssUe9hBd6fVeJHqanZpacYuslO3dO0cgZmpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=B9dG5wGE;
	arc=none smtp.remote-ip=79.135.106.31
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CFB606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69CFB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=B9dG5wGE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792614391; x=1792873591;
	bh=yMaByKpIrW0LSyYgQK6ZFp9Smoe+FCDXKYUFjdBbhF0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=B9dG5wGEQtC0HV+f+BE0KkdleNJlL7wLJR0n+SpH9ZopIwYCweo7qAU3OzkHFbeU6
	 ytYuEZK/8iYUOSK6mPffyJ326ARGSvvjL1GQoZR+Ayo5aD8gct6hHfIh+HB44d9ul6
	 JnVDHqSmOxnTVY9m8oLxaP0AsytHcQKbTKLpUORshFSXdb3xfg5RxZoxdbvNecx8hY
	 V/I8Y4x5B6zprJMhT4oOdjzxAU32aT4/X2TgiCg/CZkSkkM0xOPsz5NXDDltXrDuO0
	 WDkEgVhlPBh10rPedVuJirjuF/z709EE/hhKHnoXGy6MUpkg4esxXPT5jVhBc8b0Y8
	 Y2v3jjSJw833w==
Date: Wed, 21 Oct 2026 20:26:23 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
From: Birk Skyum <birk.skyum@pm.me>
Cc: Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Stanimir Varbanov <svarbanov@mm-sol.com>, Eneas U de Queiroz <cotequeiroz@gmail.com>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, Eric Biggers <ebiggers@kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>, linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, linux-arm-kernel@lists.infradead.org, Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: Re: [PATCH v10 10/14] Revert "crypto: qce - Mark QCE as BROKEN"
Message-ID: <179261435862.92690.4559755086697722828@pm.me>
In-Reply-To: <20261013-qce-fix-self-tests-v10-10-57162a38a554@oss.qualcomm.com>
References: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com> <20261013-qce-fix-self-tests-v10-10-57162a38a554@oss.qualcomm.com>
Feedback-ID: 21326998:user:proton
X-Pm-Message-ID: 26a209665153582a3536c663df4ec6c159407ded
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Oct 2026 11:57:39 +0200, Bartosz Golaszewski <bartosz.golaszewsk=
i@oss.qualcomm.com> wrote:
> The self-tests for this driver have been fixed. The crypto algorithms
> are only registered if the user explicitly requests it with the provided
> module parameter defaulting to false. There's no reason to further keep
> it unbuildable with the BROKEN label.

On X1E80100 the BROKEN label also costs deep sleep in suspend. With
nothing bound to the crypto node, aggre2_noc and mc_virt never reach
sync_state() ("sync_state() pending due to 1dfa000.crypto"), and on a
Lenovo Yoga Slim 7x a deep suspend on 7.3 never counts aosd, cxsd or
ddr in qcom_stats.

I built qcrypto out of tree from 7.3 with 09 applied, which is what
this patch makes possible in tree, and loaded it on 7.3 (with distro
patches, none in QCE, the interconnect drivers or the driver core) and
the crypto node as in mainline, with ALWAYS tags on its paths. It bound
without registering any algorithms, went to runtime suspend with both
crypto paths at 0, and both providers synced. The next deep suspend
counted aosd, cxsd and ddr, with about 13.7 s in them during an 18 s
suspend.

Herbert asked for the series to be split, and the resends since then
don't carry 09 and this one. Both should come back as fixes, for 7.3.y
as well.

Tested-by: Birk Skyum <birk.skyum@pm.me> # X1E80100, Lenovo Yoga Slim 7x

