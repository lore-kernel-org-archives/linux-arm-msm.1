Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795505345;
	b=QLUMvvCEUy1PFYOoDz6xdelWrTxXM8ptype9Jc7j9nwnmAsXp6tM+m8lV5De73QOdATb
	 oS78fcnysqnjg2I8fMhC25YZc5BqvfJdte6ljne6fUpqe978OAVWR7StmMMzvDw+WQ9UK
	 2LrEyYUm4cnmGZf6Zx3PVK6w0wruC4X8ctfP1cjc6rEA1NhEjAPRvCr7Cw/+l2k0mCmIP
	 fkDRqeTGejxiDUAqzO29s4J8ITDYbIyuDPemuuQvj3FR15NZkms0RN70MnxoGn/VFtpns
	 qENiU+o2DO7aQzofUam5xLFOszBq68LxvNzpAkRK+IvA8J2uxGmW3INmDEm25IBCmtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505345;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=jchSLJsqV4qE+3DYHPFPVhJBS7qk1PO5V8blsH44owM=;
	b=qe5z2XK87c4na0/+4GNNtsHyFbQ9P5RMSvolJETKdQT1u6/tDQLhwk0zL1NnIjEwAVKz
	 gz1PLYLwEap81T9n6k+f7vhX35Bd6IEWQXz8svFiZnqvu+EeAvF2xVeqtGT1vufHlNSeO
	 I4fDC8ryjI1Rg/GENP3cEKDik/n/UOXyqVwTZaG0BWboMNnV/v/Fq4MI812fBvjybN+2B
	 tnp56ayXK8ezVT0o5jcPKfsU+NyCfxViVJg13IEhL2bPO1dm4I/cVZM7dpKAp4SWGCK9B
	 iDqni+cgXVpkC/a81H8tYnVGQi3PBPUpytCGG4UeVNS7GQAo6K2qsnyV2xri/Nn9Z9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k+lCVSWv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13868606A326;
	Tue, 24 Nov 2026 07:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k+lCVSWv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A3A21F008B2;
	Tue, 24 Nov 2026 07:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795505344;
	bh=jchSLJsqV4qE+3DYHPFPVhJBS7qk1PO5V8blsH44owM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=k+lCVSWv3bjRodISlhG7FCo3FHN8ywi0Fjzt6a2a/CV5dcdf3tI7fbUwI4ReA2SjJ
	 DkdOr0tyDHnId9V92+vPHLyXjRXLBn8GRtwAwKo1fkYm6fejFst3pWHigGYH1ZRtMA
	 ljZsW4Y33EQgmIrcHLWEmlDH/Rl0aTgYUCY/viaU9mAJWYUKQ6DyWGsqenbam+5ALl
	 /TsSD8eSmawHGOio8NJaLjC0Ce0kNAHKyuZPl6YMzvvgY13rNqpxOJu6TQ1Dh0SGrV
	 IF8dONHlysNau47ceXfYuRKlAg9NX3bSbxUjm63n28mK/r+MB7ufhHLCWUOmznUTLP
	 TfAswFLJtKk+w==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
In-Reply-To: <20261123190541.262138-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261123190541.262138-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] phy: qualcomm: Allow compile testing a few SATA and
 UNIPHY 28LP drivers
Message-Id: <179550534221.327723.5344267836374338084.b4-ty@kernel.org>
Date: Tue, 24 Nov 2026 12:59:02 +0530
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
X-Mailer: b4 0.14.3


On Mon, 23 Nov 2026 20:05:42 +0100, Krzysztof Kozlowski wrote:
> There is nothing architecture specific relevant to building of
> PHY_QCOM_APQ8064_SATA, PHY_QCOM_IPQ806X_SATA and
> PHY_QCOM_UNIPHY_PCIE_28LP, so allow compile testing for increased build
> coverage.
> 
> 

Applied, thanks!

[1/1] phy: qualcomm: Allow compile testing a few SATA and UNIPHY 28LP drivers
      commit: 910b8ba234c00f91aaaaf102e17b8c5b539b3e17

Best regards,
-- 
~Vinod


