Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689724;
	b=XJCPHe+k+mXHS0bODof1/AqeuKyv5jh5kNRD0+MSfi/tW8C3EBe/ZoCmi3paOPeM+FTQ
	 g1WeSJaaS97Iyx47UeYuXlHMPJihHzrbQBpLDTup+yx8MT6Mw6lr1ay9dzfTeMgrFNr5v
	 s8wzX59lXiaHevpEEjqVbG3xfsDQFO33gsxwb/0wba6pqNCx60re0KXVDkOvtWTz6CRD1
	 z7kDrQHfMktS/vVZEoYjS2Ec7xPU+/pPn7hLFwrfdTJSYPKgINN0vWTtFI7+QmOwCJW+6
	 /Si5l+gUhcIItifjR+OBCHwYaw3f3rT0q+CGFq8puhCPcBeUpnh3IyI26MDG9NeS6YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689724;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=uheoRvhmn+YrPKS27YmgoKtAWg9YwsclVsNF7+M1D2A=;
	b=pNbnqXnbkNBBP9xDT/pNhDyXySrdkk8FxEUQUMd23EkUxppPTPzFAJQucfDlMrXRHYnG
	 DWdUGmxNsZB9WEwsXeMrTepzB699ga1bcgYvBUkRGW7UsknH45FV7EidCrzCnVtSbRTOV
	 3dvPIa8FpSs353TSS2z40XEtdYvvIOnc4Cwt2GgqZpG42OV3B1CCQwBk/IvIHb3GSzg1B
	 XvzjlvonXJ4qpnQBSgVR2IhM3eCd61CeXUxN50qsurKLojo2FUHTGB+1/NG+a9UbshZ0H
	 +CbF7Fyq54lLPOR4IaxhGn1ukUARuPBdxn852jJ6gmd/y3sqeOFXce47/p34OZBQU4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cTb4l1cJ;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CEB606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55CEB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cTb4l1cJ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 816E74E4179F;
	Thu, 26 Nov 2026 10:42:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3EFF06075B;
	Thu, 26 Nov 2026 10:42:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 364FC11E6B305;
	Thu, 26 Nov 2026 11:41:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795689714; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uheoRvhmn+YrPKS27YmgoKtAWg9YwsclVsNF7+M1D2A=;
	b=cTb4l1cJpCcYp3q2aGIWlRj7FvBcgz0uUKYYlYqqa5UwcH1jUj6SQXyQX9kJf5GRsaH3fE
	7nzKsqBjHYbI4v0yCa6EvGvnchrfXj/QG4Q25dBsKtPEHRP6nOAzZQdKNAcGel8NxWuCl8
	/UogoCled4Abz5qqLhRfe9EBcPYCKq0lj0YlM421XKJiKVLb8J73HWnTbfFaidWAakRDUI
	b8g6uiU/7Zm+9NDBBgVq+1RGa6wbQcoFDyM9l3vgGrsGxkIamS5EMGTKNmHk1jRT2TFSKO
	50QKKDM+v40MpF0N1CCiiA2gnNeu7HhRjnzL0TiEgFu/pSWGmX084+BB/y5b7w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Takahiro
 Kuwano <takahiro.kuwano@infineon.com>,  Vladimir Zapolskiy <vz@mleia.com>,
  Robert Jarzmik <robert.jarzmik@free.fr>,  Alexander Usyskin
 <alexander.usyskin@intel.com>,  Joern Engel <joern@lazybastard.org>,
  Madhavan Srinivasan <maddy@linux.ibm.com>,  Michael Ellerman
 <mpe@ellerman.id.au>,  Nicholas Piggin <npiggin@gmail.com>,  "Christophe
 Leroy (CS GROUP)" <chleroy@kernel.org>,  "Ritesh Harjani (IBM)"
 <ritesh.list@gmail.com>,  Shrikanth Hegde <sshegde@linux.ibm.com>,  Michal
 Simek <michal.simek@amd.com>,  Nicolas Ferre
 <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Brian Norris <computersforpeace@gmail.com>,
  Kamal Dasu <kamal.dasu@broadcom.com>,  Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>,  William Zhang
 <william.zhang@broadcom.com>,  Anand Gore <anand.gore@broadcom.com>,
  Kursad Oney <kursad.oney@broadcom.com>,  Florian Fainelli
 <florian.fainelli@broadcom.com>,  =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>,  Ray
 Jui <rjui@broadcom.com>,  Scott Branden <sbranden@broadcom.com>,  Han Xu
 <han.xu@nxp.com>,  Paul Cercueil <paul@crapouillou.net>,  Harvey Hunt
 <harveyhuntnexus@gmail.com>,  Keguang Zhang <keguang.zhang@gmail.com>,
  Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,  Liang Yang
 <liang.yang@amlogic.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>,  Jerome Brunet
 <jbrunet@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Frank Li <Frank.Li@nxp.com>,
  Sascha Hauer <s.hauer@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,  Manivannan
 Sadhasivam <mani@kernel.org>,  Heiko Stuebner <heiko@sntech.de>,  Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,  Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Chen-Yu Tsai <wens@kernel.org>,  Jernej
 Skrabec <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
  Stefan Agner <stefan@agner.ch>,  Lucas Stach <dev@lynxeye.de>,  Thierry
 Reding <thierry.reding@kernel.org>,  Jonathan Hunter
 <jonathanh@nvidia.com>,  Jacky Huang <ychuang3@nuvoton.com>,  Shan-Chun
 Hung <schung@nuvoton.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,
  Linus Walleij <linusw@kernel.org>,  Kyungmin Park
 <kyungmin.park@samsung.com>,  linux-mtd@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linuxppc-dev@lists.ozlabs.org,
  imx@lists.linux.dev,  linux-mips@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-mediatek@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
  linux-rockchip@lists.infradead.org,
  linux-stm32@st-md-mailman.stormreply.com,  linux-sunxi@lists.linux.dev,
  linux-tegra@vger.kernel.org
Subject: Re: [PATCH 00/10] mtd: use desginated initializers in *_device_id
 arrays
In-Reply-To: <awcZcuSbse5g3FWK@monoceros> ("Uwe =?utf-8?Q?Kleine-K=C3=B6ni?=
 =?utf-8?Q?g=22's?= message of
	"Wed, 25 Nov 2026 18:25:04 +0100")
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
	<awcZcuSbse5g3FWK@monoceros>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 26 Nov 2026 11:41:33 +0100
Message-ID: <87v75jyiw2.fsf@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3


>> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
>
> Acked-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
>
> with or without addressing the nitpick I had for one of the patches.

Let me know what you intend to do.

Not related but since you were removing the /* sentinel */ comment
sometimes, when do we get rid of those extra entries entirely?

Thanks,
Miqu=C3=A8l
