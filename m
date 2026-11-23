Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518904;
	b=YJ1olaC42vDHniaVBtPOI5c1ImK/hUjQcoZHutD70qrVC6INTHGpzzMxynFddwQzD5+K
	 uB77hh/gX5wCMkrFRL+K7GuTHcVEs5lcgaMNbcd/w1gnuHxVCb9OoNPHR8eGB1DrmUJ+k
	 esdjaH5hxh5+GPbgb5tZkDBlJYWsl4vKdVt+LebW7wKsrckfTZfzHRtBmgUvscEm39xuV
	 i4h7NkN/C1coYSDRoFjnrQhQVgtXJWFDbsFMIJJFymY96jYtRJoo/IZjyTYh3RyAqIYMd
	 2V21KHoltg3eGb3cR3e5fijl5UAmmhAnFuckAjWVUHPxl5WMvTWBjMNaDoVdUTeva9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518904;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=k712tPKcDlY3LS7wvPjtHKv8fAJgXoVETlFjABDeTZg=;
	b=0mUNpUGxkunag6HBjGskhlt3k9B/EPiipPMK/WFCBfUvWhKceFPTqakscwBRKrNo+X9W
	 rARUnQ30lzRYdrJDIv9Z/B0mCZhUwKmlDuSiSfNy+vs4qTCq+gUqs1muP37mWlx3is5wF
	 daluVOJ6P1jInzrxrVxImrvFICPrXAGUBBlQEMz68wYhdLV6z+LBp3/LtulMCfhAXBIQd
	 YUUyI0VHlX7jLlx1APuSe1nbG+rlsNbO4hYdXMi9w8wpolpYo+Xh2ZPju6VZL2oEDnIEo
	 YRPP408Q3k9GsVZhsJ0E8+2N3ZpSjyE8sma4aOlshd5anNEyPsHJCwXywYQDDWD1qFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X3A+Afjp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9DC606A32E;
	Tue, 24 Nov 2026 11:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X3A+Afjp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9E01F000C4;
	Tue, 24 Nov 2026 11:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795518903;
	bh=k712tPKcDlY3LS7wvPjtHKv8fAJgXoVETlFjABDeTZg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=X3A+Afjp934yphEYWUsXvAHlArezexx2UUNwTrAytZyEw/Kn7UqAHMI4gp8LAqim3
	 vYz2hpUXN6BpxJznrcOJMyRxqu3UN6lo8qVRCEPM7o+YpTxDVzG/6I1vAk9i+uIpvS
	 6bPUcrnn1w15tY6R4BALtBckLNiyKwyQ0SX9TLOo3z9BasGibMBBJwH7O4SYz+PtU3
	 5KlNSYrDbmzMw+VO3F302UNCzOjMiDgkb4D0OjXV5xY0YTcI5DQZlmSndwsmdLCsHt
	 y2YM0IRDn+wsVE4bJtaHajBkoEecjgKSQ90dDRwBN5nuD8QuOl81Jn2Glatii6X74Q
	 RX/OP8WpUpWMg==
From: Mark Brown <broonie@kernel.org>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261112071712.154524-1-zhujun2@cmss.chinamobile.com>
References: <20261112071712.154524-1-zhujun2@cmss.chinamobile.com>
Subject: Re: [PATCH] regulator: qcom_usb_vbus: Check the VBUS control
 source update
Message-Id: <179546234340.25092.18379371494170350660.b4-ty@b4>
Date: Mon, 23 Nov 2026 19:32:23 +0000
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145; i=broonie@kernel.org;
 h=from:subject:message-id; bh=wy/5NfR9kNh2+qdWfCma7Vf02vKuIfMwMmn930nkJaU=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZCzfzM2nINakpBv/TdFr6YdMVriIm5okzdBVqth39+
 VKL6b5qRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACbS1cbI8P6va+AVN86gX55s
 XB8XdW9p6r0f8XnHnstGznuimeoLVBgZnvpvXzZl9xSr1Z/O14tPknS0jomOuvBXWL0ofPXeI0p
 WjAA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 12 Nov 2026 15:17:12 +0800, Zhu Jun wrote:
> regulator: qcom_usb_vbus: Check the VBUS control source update

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.5

Thanks!

[1/1] regulator: qcom_usb_vbus: Check the VBUS control source update
      https://git.kernel.org/broonie/regulator/c/a99b77e7fd6e

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

