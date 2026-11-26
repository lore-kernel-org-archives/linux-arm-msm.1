Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725800;
	b=qmnr5GsQjg/X6AhOAI283f5IMXe4/sTbNoEPeUDCFf4JUoLBVZHQCl8ZKSOOqSLCN1Et
	 rX4HmwLsD0ebFOyhzkjiP9LJ2eGGvhhLmSFCPz0LoluqE/4O3FLHxa1OPxMY0icQ3t1LJ
	 V94vNPYjIzGZZClmKKxldfdF+ycMLoGpRxmEJB6TXGmXkX8fJfYDJIkWTeD3cYBCxhsg1
	 0v0Np73+ekJZHhcS+9tNZ+ziLiSztNdTkyxEPxolKIrMYWAufPDVPW6NPM5o6E7S8ylU/
	 eAdLZUmjk7cKyu8Eln1lPuU35m08H476MKJCVfi5avWdfPhWszXW1HJIsCGmtvmBlpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725800;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bM3ZC9yu5XH+6bnUPNa+jdnnx+eGcgI8D08Xng9WN8E=;
	b=aeJC1KSLqj+QF0bWJTZFN+tTrONU4nTI208Ma+7an/7F7MvOuFj9cBdGkGckakeCb5zG
	 kQDf8VBP85WhEwqUlSjbiJ2xHgE8Wl1xZLQGL5P7Z1AUQvKT095lZNgAwze0d8/PVSAKC
	 FerA+NrbbRbb4ta99anut0uCbZVlSinT86MZdg3yYkXrtTybjBDsMMIhLF7Xfext2fUIw
	 zQtq3EGp/cvSjqUTTd+ZsCTibbdssOtECQ7/3UdR8DzhCxJiJxvCEB6RtNlSx/WVxmRE+
	 g0S91QkpQWrWY76Ts/jce10b9COJcztrxz9jTay4cL+60k+y/ZIdbj/TLkT8gX73ubA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E4EKObBl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234D8606A697
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 20:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E4EKObBl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A0151F000C1;
	Thu, 26 Nov 2026 20:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795725799;
	bh=bM3ZC9yu5XH+6bnUPNa+jdnnx+eGcgI8D08Xng9WN8E=;
	h=From:To:Cc:Subject:Date;
	b=E4EKObBlHAmUhpLsKjFSdoTnJ/NhxM4BCRxUirL8IM/r8aRM54FYAKohozTrB/b8d
	 Gt8z30g7oTksu5eXkKgQwu6huQiIlmwY/iNFySnXKNCe/0R9D7GHA9zLjjGhaMi1HL
	 7dojc6kic9Lsr/7Meu28a3snSU2Um9C6FQ1TJ/7UmiXlAZwNlo/9BINH6WsYdmSRox
	 YQ5ReWJEky8t5tNnp3utsZ9IYLWzikSluFxCxDdn77yaZ93Bq6AkRxQRhdIOHi3Fuh
	 5Ba0pDIz/2DvvMnjQwQSUbHJJLLaT9MrmK70uVVT6/Wtxg09UPIMS1FQbRg9LdUvxK
	 15T2Yu/7BA7Bw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Arpit Saini <arpit.saini@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm64 defconfig updates for v7.5
Date: Thu, 26 Nov 2026 21:43:14 +0100
Message-ID: <20261126204315.15005-1-andersson@kernel.org>
X-Mailer: git-send-email 2.56.1
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


The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-7.5

for you to fetch changes up to 1ff72de9902a955b8446bba2c56942028c1425ea:

  arm64: defconfig: Enable Novatek NT37705 panel (2026-11-16 17:44:40 -0600)

----------------------------------------------------------------
Qualcomm Arm64 defconfig updates for v7.5

Enable the ILI7807S panel driver for Shikra CQM and CQS EVK boards and
the NT37705 panel driver for Fairphone (Gen. 6).

Enable the PM4125 audio codec for Arduino Uno Q and Shikra boards, and
the WSA885X amplifier driver for Shikra boards. Enable the Hawi LPASS
LPI pinctrl driver for Hawi and Maili platforms.

Drop redundant Qualcomm SoC and interconnect entries covered by Kconfig
defaults from the ARM and arm64 defconfigs.

----------------------------------------------------------------
Arpit Saini (1):
      arm64: defconfig: Enable ILI7807S DSI panel driver

Krzysztof Kozlowski (2):
      ARM: defconfig: qcom: Drop Qualcomm SoC drivers with defaults
      ARM/arm64: defconfig: Drop redundant Qualcomm interconnect entries

Luca Weiss (1):
      arm64: defconfig: Enable Novatek NT37705 panel

Mohammad Rafi Shaik (1):
      arm64: defconfig: Enable Qualcomm PM4125 and WSA885X drivers

Prasad Kumpatla (1):
      arm64: defconfig: Enable Hawi LPASS LPI pinctrl driver

Srinivas Kandagatla (1):
      arm64: defconfig: Enable pm4125 audio codec driver

 arch/arm/configs/multi_v7_defconfig | 11 --------
 arch/arm/configs/qcom_defconfig     | 10 -------
 arch/arm64/configs/defconfig        | 54 ++++---------------------------------
 3 files changed, 5 insertions(+), 70 deletions(-)
