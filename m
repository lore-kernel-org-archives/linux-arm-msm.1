Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779979;
	b=oMv1k8KGOUD5KSaK1L3jTyYBSsTloJH0909w3L95u1wz/Uj8gpp5aXLhhxol7niH9YT/
	 /dcCPamJh6Y3DOB7S2VfESuNeJ/bwqjf4ArBimUbsTOKL6SuqwLGgl1fpLV4o767D02c1
	 N3nT8i0uhyCWADTuKVYDoM0f8ipG29mM/SUPajQVos68dsdOc48+v7gkXARYTIpKRToOf
	 Wa1RoY5scdCuvsM9T65CDZBE02WxkRv21ldbLU72sVsg6O4Fy3cfMJpWVFjboNZr62IVe
	 FJUE6XyEatOGXCv/75Vz5JDoPyBJRi14J1NwPsJ61lOxsDu/bRA0e9joN9C2fsbFKng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779979;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=hDE38ildb/m8QpK4Cv4GoDJgJeQFFRZzMq88sVk2Y0o=;
	b=FH0n2Xd5IXdnahQJvRYZ1/sFVGNBNgmORLJIScr+pn0r4Nt4836qXCT1MNDu1qZXRO3+
	 xcux3VlgA2Cpk2HDEkpUH290SI1YhM2m6A0oN2N7XKvvyii8yL2SLv4ff429CLJlgpbti
	 NHDwnV/8G63zj48U3X54zxiumxOxttGJ5xSN3E5yKC1ckGL4eh6IFChMg41/Gnbu8ttOw
	 Z8OLmb4rpVTgJ1h8j9IpW5vWv70H07/XwEOBzO3t7HUpWGt55iv0Y8RcS5MC2JKKx9Xto
	 6XQK0UV2yS9lxyyQPT8S/ZeYK/FL1v6fcftWGcHWHB/jd6Qdk2A9nkb2bFnYpOIx2Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NmxxlZ35;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0EB606A33C;
	Fri, 27 Nov 2026 11:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NmxxlZ35
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D851F00923;
	Fri, 27 Nov 2026 11:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795779979;
	bh=hDE38ildb/m8QpK4Cv4GoDJgJeQFFRZzMq88sVk2Y0o=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=NmxxlZ35KMtuxLfQos55vwJ3klDxP8nwO1RbXInG43AKxfM2pdEw092D1xL/ojo3r
	 bHfLSa+hdZI/xdKOV8rPdsP5tDeQdwozoA5Ypxm9yynwSZuQ4jI3yTkjCxZzvffLkB
	 2aZkU7/R2KCQIqCdjl/8aVwGpUPG5L4kluFoS1nQcOVrZMlDEcm/86usGITC0OgQvw
	 bM5vbRfK6MzJJhJdy044NOAU4ImJnWExH16aPtmhG5mZoIyZtbfqnjGhgDHuysdjoM
	 pYG6VtCy/AU3a98sghYmKAWdGjsoUOp2+S/ZfQ9qGAy6yjTxKLZZbphtGKg5ADT9rK
	 7mhfBYr63tw8w==
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
Subject: Re: [PATCH 0/4] phy: Do not request resets by index
From: Manivannan Sadhasivam <mani@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261106-reset-deindex-phy-v1-0-6a9c9f428be8@pengutronix.de>
References: <20261106-reset-deindex-phy-v1-0-6a9c9f428be8@pengutronix.de>
Date: Fri, 27 Nov 2026 17:16:12 +0530
Message-Id: <179577997271.13164.8916074772303090339.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=505; i=mani@kernel.org;
 h=from:subject:message-id; bh=HbXhu7ELoyyCBk4+Liocm9WY8LgJ6dugTmbT2N0WVjk=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCW2HTIryjokwPa9ucHcX0bYVwG/PcKr6MnlPR
 Y1BTmfn6m6JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawlthwAKCRBVnxHm/pHO
 9eYmB/9o8gTQd24KjP0mGMVzIYPBdX3KT+Zh9RdEodwD0OVvNk4NbWFRJIa+dKPRCcWTJal41yR
 tWzKWtNv0TEDULo7aY6jn6OEMGrZa3yA7xmyP2n9jjJF1iPWxluV83SB+hi7l/amrkfN2n+5Wjw
 XQgssnvne26RwfhnQH6HKL6N8IdOvcinN7al9uz/TI7sykiq5EprWgdYY6PGsQCq0V2Fs4mAqyx
 WiWmJ0rR9SeadFycBCH4COLnjajMfrA/oMYc5CK3zRUI4SW1ffMniu+oQoiNijVjNRsIaJKBGrH
 1pp40UJmZidx3jCUv6hUe9I7/nPMLJpkUk+C7sLR27U4e2E8
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-06 16:01 +0100, Philipp Zabel wrote:
> There is no need to request a single reset (or even the first
> of multiple resets) by index.
> 
> Replace usage of devm/of_reset_control_get(_exclusive)_by_index()
> with devm/of_reset_control_get_exclusive() so the _by_index() API,
> which is only ever called with index == 0, can be phased out.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


