Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795508;
	b=RTcUrxYDXn/dTEFVJS1Wkl1sAIcdzwu4KIHrEWApp8b9V/tEVh525Qcl9oamCURyowyh
	 M82S0YOqNl2zX3vekIh2hjL46BYyTYQdA98YSnDQHhX0pzg2B531AysLPUVX6Dm8HR6fr
	 Ldczk5iGLC6cpCDzl5cPY0vD7of/UexlmBuOG310qyQMsqOnwhYPLtOIzG6Mu+krFrsK0
	 k18YE1Nih0NgficpthUvly1a4lCjh0KpZb4EDch3UTKM4FHpgwGsVM8QwwLLW+QEdVsib
	 J+GiBlfKnKr1xG9B9AwvffApuQv/o4wxDD8QGYd6HrkLIZdDv/+WBBol2UOS6rPbzCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795508;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=F4Rb0/Cq2Rzt5GU6gqKqNCgJVrapLl5fEKClVP7hm0E=;
	b=EXxOZ6dyIs4N/gmk1fBdVRR/H+RctqFf8t7upp/Vyr8Hw3WLSNpBKqEUy7qZcfoaIPi6
	 R1pqdqhW6B6JvveRCy9oDveO4DGUjWjfAYrCD++Fiw41g3iXVT20Xb8Xjy+VYvfsK7GEh
	 pZ3RUOjUUo05Ll2wq9LF9z2lHeLDrWxcIgRiC4f8QekwCawqz1XrLkZqcBpzbZU8Qkb0F
	 5itOFasYjh0f++5hIp+QuWwlxaY4Zldnbai0FRJ0RMXa6joaLzNTpsa3fW5onwUc3pr9H
	 1J8k5W+vAwxebVKFq3KSEXMWIZaTJNCdZpfT2AXrOTncpkvrQ96k57Cknrn/2coQGNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g6sPHNo4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF45606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 16:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g6sPHNo4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4559F1F00924;
	Fri, 27 Nov 2026 16:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795795507;
	bh=F4Rb0/Cq2Rzt5GU6gqKqNCgJVrapLl5fEKClVP7hm0E=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=g6sPHNo4sqDsMcavc/lSihYG2yLF5kIrZXuHPiYc9L+uaHXoMtsWeiIkTwTFK2xNx
	 hJgdCyIVhtyQwDwncj3Y0Dln8+l1ba2RVO3KxXiahWw/QcEZ5IAg//pn038IKBG4sF
	 xcbM8KqHCOqoWzAMsutqGNUPwUk4YymC3PYVmi8KtZVgAcHbXqGIRmQSMIqRdCdfCJ
	 oO2u7NOkb2/1MjwworRm6TgAzvnT2iZl9as/8tCKjey+xdT1KDA3boA9wzEAHjH106
	 Bp8EyXEY2IKLLa2BOXN6iLPtJEerxi7YlNrElfrG+0F1Fr1XIPQaBIG/O5s+qXHPsl
	 oYMhBkhR4FBfg==
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
Subject: Re: [PATCH] phy: qcom-uniphy: avoid build failure from duplicate
 PHY_TYPE_PCIE
From: Manivannan Sadhasivam <mani@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
 Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Kees Cook <kees+treewide@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org
In-Reply-To: <20261124105939.1440586-1-arnd@kernel.org>
References: <20261124105939.1440586-1-arnd@kernel.org>
Date: Fri, 27 Nov 2026 21:34:59 +0530
Message-Id: <179579549935.13164.15609895718346972637.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1630; i=mani@kernel.org;
 h=from:subject:message-id; bh=ei5NXO1FgHaiNYGejkUUu+GhsZC8gWHSCnLUJpVp+o4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCaouapDsFGRhG4kN2bXKaVHoqM3Oj1zJlj5mj
 CXrmYYm2p6JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawmqLgAKCRBVnxHm/pHO
 9YwnB/0WfkfQfUsHQmyPOFHJKmGS6xJvkpP2LOZeK6+9CljJykwzaCJ3gWsuZG4jIJByyrANlwl
 vWrofvIe9KUZp01xcLwcHZVxRF802zjrhE5qg7KTtJPve6PFMt4kFClzNx6M5+djjoUkwD3g/vQ
 jCKSkgZs2j4QXWEm/pRs0DUsNMLqOhd9tTpYMkezxQXi7jtS+bbHZcNGriqQLniQPL7sTaNRppM
 1uBX3jTXEq87dQv92T+1MlqQKZffAYkaBBWr4buK0ACK9uEIDJMY9uda1QGYyZrZnohrYxgaczo
 xeZ4TYLFEKOw/i6Be4VuTpUR6avZPIziphTVyKd1vaCapQVs
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-24 11:59 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Both the DT-binding and the driver define a PHY_TYPE_PCIE constant,
> which clashes at compile time:
> 
> In file included from include/linux/phy/phy.h:25,
>                  from drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:15:
> include/dt-bindings/phy/phy.h:15:33: error: expected identifier before numeric constant
>    15 | #define PHY_TYPE_PCIE           2
>       |                                 ^
> drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:47:9: note: in expansion of macro 'PHY_TYPE_PCIE'
>    47 |         PHY_TYPE_PCIE = 1,
>       |         ^~~~~~~~~~~~~
> drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:127:27: error: 'PHY_TYPE_PCIE_GEN2' undeclared here (not in a function); did you mean 'PHY_TYPE_PCIE'?
>   127 |         .phy_type       = PHY_TYPE_PCIE_GEN2,
>       |                           ^~~~~~~~~~~~~~~~~~
>       |                           PHY_TYPE_PCIE
> drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:135:27: error: 'PHY_TYPE_PCIE_GEN3' undeclared here (not in a function); did you mean 'PHY_TYPE_PCIE'?
>   135 |         .phy_type       = PHY_TYPE_PCIE_GEN3,
>       |                           ^~~~~~~~~~~~~~~~~~
>       |                           PHY_TYPE_PCIE
> 
> Nothing uses the definition in the driver, so just remove it.
> 
> Fixes: b28eecc89399 ("include: linux: phy: Add phy attribute "type" and associated helpers")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


