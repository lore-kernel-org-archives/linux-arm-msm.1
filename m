Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638404;
	b=seXlDvNvMkG7WyN4Db+/nknZcRZGr0pxocSz/DuX9sXRlD+Uv+8fOYpcHR3dLWnKs8Qx
	 6yeXC7irNjRf1uU2xALKYAWBMg+9szseEbeqU4V92njr94aTLa0d/fnOOpc+sZF6ZGyIH
	 w5gWe3BYdoPY+z2sR6TSpVX1gfwbLVn0Qwc+Yvmy8hlaBcZfAqsEd8JnqVYqCye8/L6Em
	 nYQvlg3yN74V12GMghFwsxnJqlOSvddluwuKJOw0l4F0Q8SEVDPg2z6gf6r+KSkLdtIEb
	 IkANAUHVKTHXbUpVV+KILRS4KDZ6avmGQS6eFJJL1aYxVvOY9TMtQuttSvSrDvQ9tpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638404;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=dyItsAdwCo4xMj3bus0BCLCIqJPEYeY2E2MYEhkeGY0=;
	b=ZjEoM88skhHi1Rkags1jpD9724ZAaSkobrf5b8BMmx9edXdpe9ThVxe6JoPrgM+Y0cqn
	 W7LKxIJsNdBREWmsDJ50rDIA7/OA3BPQmai4lZwU0JzgpVuILGsAr0XwDUB77O7zQwiqV
	 gkwvdpMs/F8P1XJvQOqzyveC1ZtJdqq50iBOFcZreTQabQs5bRYbhFZtzyjHo0+u4Toa7
	 BRH1RQ6aqe9HzAFUXiloUOKJBMyDXVzgyhhoJAtGKV6sZeVEpBbkkpFP/jSnPXR+rW2Pp
	 qmZ61Vu38rilBelj7clodpzeAv0KG7+VuFk0Htk8+ptG4PP8zXkWdMSIHtlpuOVnpAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=w+r1rJX8;
	arc=none smtp.remote-ip=79.135.106.29
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A60606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 20:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25A60606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=w+r1rJX8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795638400; x=1795897600;
	bh=dyItsAdwCo4xMj3bus0BCLCIqJPEYeY2E2MYEhkeGY0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=w+r1rJX8pk6m7kRJ7LnO+M/5aEticPshtEPxzXCH7DoKPTB/igFWWyttAXpehAcyy
	 3gzrXEgb1l4yWHYkMvdSTq+Btv2PsRlwgyq2abwyY52SI0be70pgU0nRwDh7XbQrAf
	 qLvmCjc9Zl9Sk/wv6nQL8g2MGj8128zNWS1rMN23pxV4ZOLavVzN2s2FC4UIyTJ/FH
	 h/7zadZw4alrwMik9AMRrFueJlSase7iaFq2on5bm/4KJUmHWl9kHd0pGxuVHsNO+j
	 jIJJmK9nF9lQE14I9EJgONbrGjdQOKcLT6oMIxKfSaDf34qVSs5ZY4BGbuezpX8+qP
	 6RUBOCYxpsV0w==
Date: Wed, 25 Nov 2026 20:26:34 +0000
To: nabige.aala@oss.qualcomm.com
From: Victor Mora <vjmoralesmora@protonmail.com>
Cc: abhinav.kumar@linux.dev, airlied@gmail.com, andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, jesszhan0024@gmail.com, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, lumag@kernel.org, maarten.lankhorst@linux.intel.com, mahadevan.p@oss.qualcomm.com, mani@kernel.org, marijn.suijten@somainline.org, mripard@kernel.org, neil.armstrong@linaro.org, quic_khsieh@quicinc.com, ritesh.kumar@oss.qualcomm.com, robh@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run, shengchao.guo@oss.qualcomm.com, simona@ffwll.ch, tzimmermann@suse.de, vkoul@kernel.org
Subject: Re: [PATCH v3 09/11] phy: qcom: edp: Generalize power-on path for per-SoC overrides
Message-ID: <20261125202615.74643-1-vjmoralesmora@protonmail.com>
Feedback-ID: 122405522:user:proton
X-Pm-Message-ID: 29c171b79d6c124dc6a3f80b30588bf4c7651e30
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

Hi Nabige, Ritesh,

On Mon, Nov 16, 2026 at 06:46:48PM +0530, Nabige Aala wrote:
>  static struct qcom_edp_phy_cfg glymur_phy_cfg =3D {
> @@ -1087,6 +1124,8 @@ static struct qcom_edp_phy_cfg glymur_phy_cfg =3D {
>       .dp_swing_pre_emph_cfg =3D &dp_phy_swing_pre_emph_cfg_v8,
>       .edp_swing_pre_emph_cfg =3D &edp_phy_swing_pre_emph_cfg,
>       .ver_ops =3D &qcom_edp_phy_ops_v8,
> +     .phy_status_reg =3D DP_PHY_STATUS,

On my Glymur-based laptop (Lenovo IdeaPad Slim 5 13Q8Y11, X2P-42-100),
the eDP panel only works when the PHY status is read from 0x114
(QSERDES_V8_DP_PHY_STATUS in phy-qcom-qmp-dp-phy-v8.h) instead of
0x0e0. With 0x0e0 the panel stays black.

Could Glymur use 0x114 here? I'm happy to send a follow-up patch on top
of this series if you'd prefer.

This was tested together with a v8 PLL fix I sent separately:
https://lore.kernel.org/r/20261125-glymur-edp-pll-v1-1-068a4d95a12f@protonm=
ail.com

Thanks,
Mora, Victor

