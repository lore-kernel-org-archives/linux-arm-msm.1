Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795105452;
	b=LTjF4mhDQFHzhkXM/fYk99oMJVD0sjG38vXMj4g9oQZ+6gbd0edcLeLmm4g9sj32v4NF
	 g+/gO5OO3TGvPXm3VAZpkHfgu34Z9nvapol4Ugnc681/7Vv9eSQu77FBszNFRc/sGJ15y
	 hu+rEg4mfkhKBJISK3V69DNBP9RzsYh81mtBGvhHDqTyTZyircWhcBjP5HYw1Ku/zfRN0
	 F0wS/FlzetqD2pHUATs4Rk0++L0StXaUh5VPNGWxkN+BmdaPQlhXCHxY/ZJOVu/KZ8RYC
	 2vA+76rL6wno0Hr0r8BfmnCSi2t9j629SVJry/YGVmDPnxCN//syjKI5uTJzIooBYig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105452;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=0d4XB0YTAQtRX8+hgqAgNWT6fwr6zYYShVEyknE8s34=;
	b=zstXsmz4kyEJSSWOKtHkZsmEpWuR5UAcoZJEAWLT4hcgNZGItSucl2Fc5rFK9goc+NZ9
	 eiDQsHfeOC2wsrt/l6ubPPCALAWlyxvQlkN3HVz1p6Z330RuIOm2EiVV+qUAWF6nmsqmY
	 Xgegis4mZi4994YIho1CHJhWXf59UuSNX5U+UbXujlDGcCgkn8BnaImqscX1i+g0FiYYd
	 G2PUSzGGPjBVxNpANaAQA0TnIvqtR0cuPHupPgG0qykZJcKcsi4AemyVCFNNBMZ7zdNlx
	 m+CWaznbO0WSM1NAqw/xdAO/4W4iFOXSEsPuhJNn3RicGTCu2VSMLbQ30PgUYJNqtQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="O5M/YeZe";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB5D60A2623;
	Thu, 19 Nov 2026 16:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O5M/YeZe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55BBA1F000CF;
	Thu, 19 Nov 2026 16:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795105452;
	bh=0d4XB0YTAQtRX8+hgqAgNWT6fwr6zYYShVEyknE8s34=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=O5M/YeZeC/FpBNKovFTnUVVEes2FAmmqEE7ghAKtIgRef6Wj9TpUFrjxfTvbCkMaJ
	 x/kxyNh+RcGQTnP4NqGmnIeNomLIPeOm/f66ua+N3I9JyqnJWkDEbTDrmlypEDtYO9
	 T4bYqcVtAelL9IbdAZUmZ9pEGH3ENlTeAou9qKpeORPKI4axXJWzj8axSQUIqcaKt0
	 amsFxJQgHSmVIid6h/gyv+5J+lbJ41Bi0bMc7CJsReBShxr8DcmJE83aEL3YoH1WGT
	 OvjGj0KZp7CGFgSRewCxE9WcpfZBi+kT/HMfH2X0J8mw4eS2taJqrRwXNyXB/qIG5Q
	 ox/bcFBHVMLNw==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-topic-qmp_aon_clamp-v1-0-141c2cb6cdf6@oss.qualcomm.com>
References: <20261102-topic-qmp_aon_clamp-v1-0-141c2cb6cdf6@oss.qualcomm.com>
Subject: Re: [PATCH 0/3] Fix up AON clamps on qmp-combo-phy
Message-Id: <179510544997.1370333.11528579298614736658.b4-ty@kernel.org>
Date: Thu, 19 Nov 2026 21:54:09 +0530
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


On Mon, 02 Nov 2026 14:59:31 +0100, Konrad Dybcio wrote:
> Various platforms have apparently not had the AON clamp writes end up
> at the desired registers. This fixes that up, based on the robot's
> findings.
> 
> Depends on (reviewed and ready to be picked up):
> https://lore.kernel.org/linux-arm-msm/20261023123512.1912-1-26rote@gmail.com/
> 
> [...]

Applied, thanks!

[1/3] phy: qcom: qmp-combo: Separate PCS misc clamp mapping
      commit: 391a14a0a31505c9202369258d47d1fc42c1fe65
[2/3] phy: qcom: qmp-combo: Make v4/v5 targets use the right clamp
      commit: ff2aca40e0d58c4f7f4fbddcb95f15d7d983af05
[3/3] phy: qcom: qmp-combo: Use V6 offsets for PCS-AON clamps
      commit: 478797c9284d2ad85a2fd1f61ba021932099b36e

Best regards,
-- 
~Vinod


