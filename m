Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795876683;
	b=aqIq8A2JFdkgXOIxVXpG6913AvkO12hAhsZcfP7Hf47tOR5rap70rr2GT1D+PrPFsj6m
	 meVU3QV7YoH9XCTyS4eO+A7BQjej7en1nbq55W7EnrnQ1c6UyHNoIm0l1V58nLo2zMkeq
	 unBwitONNhqEzOHXCt1n6PwhXMmMqqV7TyBVI/zkJebCRFWtWfd/N4nvrPiUk37Lh6Zki
	 XMzJAiMcmoez9ce/OTNDLQYtXDoFADGhafaZRrEc3ssuV/kU7YH294L6pItgGjd0RGRJx
	 IefIZP5VZUI9nE7s6cZ0AXkXBb1PnOYwz7/XGYWtEpCXaCo2nV0YUNymuCcWoYWdmdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795876683;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=bclc+UrCWkqE/Q6i9Fo0k4c7+1YBHLWtEqXI4UaXYkg=;
	b=eD7+4Hc20sFpMdP5Et1mdD9g43yUE2GY+DjG8mGSZKsczv73V4rtmSB589tXh/ogjzJR
	 nhezHNqJudjvu7PDR69sxKTTd/OvMwLOvBSQcOhFOYXyMEG9cRRtyczaJfg2HJGT8j20n
	 uIg8gOYf7pgpxOqt4195vsNK/IPgSJeUL/vXj8bErJyrEihQy2EpX+Ts8prDb+50BsjNh
	 rmmCaQrdA8+zuAj1VGGqfNT3Aam8h8W4KJoFxMixDTRGLptykgJUWluLg3WyS2UdVxwNd
	 JbPveaR/VYpVTKD6DxpgRvU4PSaIq5aSfq+Dceql3IXNjGGPlSigYgAh90MZaoj5PrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=KHPAdh2r;
	arc=none smtp.remote-ip=162.62.57.210
Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558B6606A31C
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 14:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 558B6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=KHPAdh2r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795876671; bh=bclc+UrCWkqE/Q6i9Fo0k4c7+1YBHLWtEqXI4UaXYkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KHPAdh2rb4+IOAVNMd9VH50dEKcjQitArIy8URBMKAFvd0beJwvmO9Yd5am7RWm5l
	 WXYrfiebgfxmrDBp9BEr5mHQ8cBtT5KAcptm27iwmpWwbcxS0K9hWSiWDdTR4JuhM6
	 kopx0AVZhEvuh+K4sJFjOvhSjIo46lF54PmB+Bt8=
Received: from PhorusPC.localdomain ([112.43.30.154])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 971218A4; Sat, 28 Nov 2026 22:37:49 +0800
X-QQ-mid: xmsmtpt1795876669t02ax0wpo
Message-ID: <tencent_0D8198B109A402150BF10D834DC9F43E530A@qq.com>
X-QQ-XMAILINFO: NhUkPfKlCtQwkJCi+Lg/LDyB/T8w+uYckg5P70wZYbQ4u0hzMg29TY6ypgdGPo
	 7ohV0yC8Eyz539sy9QPTM4PD+BdptKT6ArKuFyfThzbowSoiANpVvyMlJY1elW67RBwtKPcqS8NV
	 3oAbLqqYGJNuaAKBiF1Piuq3J3j2cQ84LnBcaku4uvlXWwX4cmxxbOU0qZye8jZWr4N67KLrrnsJ
	 Pwhr1gyvYXr5dElIZ/JibSpdcULp2HZrJXV7UeU8OrakSWNpdbYkJ1F7gDwGFIxgH2zZuZUMwqep
	 6S31x2UmYsXC3tVPaXS54VLBdZLV6yPuFvE8CLFrcCNl3QkKzfMfmEU+12woWIk66OaXt+LgwIRI
	 GCYK5+xgqXOQN1fmDydzpjuPZdXrYebeK8cUUvyw31WBsRhM60zvswEzFoWNymHa4z5sahbqXIfH
	 oSy7XVMo5fa6quZqelWEnh5eAPh0egSXuspLcc+QWmw9xkKGVLGkh9xncGlst5fy/YF0tbOYuR6n
	 wIrPHuEy9eGxDqOn/Gb7A9OZNXF0CqduvWx4bUDtKhEeyt0gQ87bIWKEpLmckMzWY6qcCcWAJuw2
	 YlZOIp08DfZugPA7NXNCqHbP1fWOChY1VXQPBcL3h1JmlO0zBn7F4dNuVdTCwUwdex0lcdto2W13
	 5xfI7r4BJ+5BM2BXly1pyvIL8xwuW/b9rTewyMnpOtlKOtmNjKj34GuVwZnwuZd73Cb3oDdHjDsd
	 T1XQfXHADNkEb4a4arZPz8AgLz0P9tgsGfsG3Ei9Jre2/kE2Ci0DpFNKrJrOPq5TfvUQynA9w4tV
	 PlScHgyy+x/iXsSKDa6dxckbU02j3+E1elDvP7LgpgW/VdTvbTtzPNpKhaouKslufAau9Yhcywe9
	 aoV26zYLrzuFdaRV7AZconBKSsufkqtGgpSXTFlZk290eh5Xduj7pBa3lxFXHM/FliA+z/bBHl5d
	 7akdBlt1qcFKjjvJk+aq6p6lcHVH3i2tBojY55gDYjGEVvH0+oixusYgneJ5p9cqmzuPjSDeCPuW
	 U83fLjIWSYTllbSVnWZkZciLmZVhcpa/mx75oHyjWaxpAfrGjmhOpg1SaDW7creyfQC5uacdMUZz
	 w5ULQeS9RC54Ns8yMiPneoH7JODVwUiBIKxvCv
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Zhixiang Yu <littleyuer666@qq.com>
To:
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: use the DSC 1.2 RC table for 1.2 panels
 (resend with the current maintainer addresses)
Date: Sat, 28 Nov 2026 22:37:34 +0800
X-OQ-MSGID: <179587665445.1408.12490717564230529329@qq.com>
In-Reply-To: <tencent_5ACF8B20776C5AA9A1C5D37C67600532AB08@qq.com>
References: <tencent_5ACF8B20776C5AA9A1C5D37C67600532AB08@qq.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi,

the original submission went to the lists but the CCs used the retired
quicinc.com address, and it bounced. The patch is in the archives here:

  https://lore.kernel.org/dri-devel/tencent_5ACF8B20776C5AA9A1C5D37C67600532A=
B08@qq.com/

Nothing else changed; the body below is the same patch. Sorry for the noise.

dsi_populate_dsc_params() always programs the pre-SCR (DSC 1.1)
rate-control parameters.  A panel that advertises DSC 1.2 needs the
1.2 table: with the 1.1 values the decoder reconstructs the wrong
quantisation parameters, and the result is horizontal banding across
the whole picture.  Solid colours still look correct, which makes the
problem easy to miss and easy to blame on the panel or the PHY.

Pick the table from dsc_version_minor, as the DRM DSC helpers expect.
Panels that report 1.1 keep the pre-SCR table, so existing devices are
unaffected.

Tested on Xiaomi Redmi K80 Pro (SM8750, o11u panel: DSC 1.2,
1440x3200, slice 720x20, 10 bpc).  Before: every non-uniform image
shows horizontal stripes.  After: the panel renders correctly.

Signed-off-by: Zhixiang Yu <littleyuer666@qq.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi=
_host.c
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1910,8 +1910,12 @@ static int dsi_populate_dsc_params(struct msm_dsi_host=
 *msm_host, struct drm_dsc
 	drm_dsc_set_const_params(dsc);
 	drm_dsc_set_rc_buf_thresh(dsc);
=20
-	/* DPU supports only pre-SCR panels */
-	ret =3D drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);
+	/*
+	 * Match the rate-control table to the panel: a DSC 1.2 panel given the
+	 * pre-SCR (1.1) table decodes into horizontal bands.
+	 */
+	ret =3D drm_dsc_setup_rc_params(dsc, dsc->dsc_version_minor =3D=3D 2 ?
+				      DRM_DSC_1_2_444 : DRM_DSC_1_1_PRE_SCR);
 	if (ret) {
 		DRM_DEV_ERROR(&msm_host->pdev->dev, "could not find DSC RC parameters\n");
 		return ret;
--=20
2.43.0

