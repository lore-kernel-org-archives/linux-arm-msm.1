Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795876546;
	b=qOx1iy05JxrXv4CbbQPMaO1YFmirlrE3bs6XYfYWUL0vWkOKNh2F4WzyY7nsIg4M8xJN
	 2s3qz4Qb79WtDUiDmz33M+x6ns72XoDN6ar/2ktdIK8rHIpZjDoDg7uvbFH7HdVMOpB6m
	 M11SgH9o0UCdcgChzgm/eEWy86Bi5/YLDPiHc6aKpLTAN6XwBHTdoSK1XIK99vZJBDFkI
	 3K+xnc73mzI6yPbvaNjZehemUmP++OVSLqOjCn0Q0IKSwvNMWPb/QL7/Q01jbf/oLY3Vj
	 s17axLl69up0CaBB9lzGDtrCKUKnYhnhK3Kox4xKcnrIrKbrxVQk2rJHEBc33SY+muw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795876546;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=/erwlKU4Qt5qlsYt+hD47EAu/kfrXvbGjQdsXs1DRRI=;
	b=d904Mdh6H68vf8rdiiGydqPSrQvQW1ThfGmyD4llJAIkrxz7AqtKqzYJoxEDTDWBmojz
	 b/Wib/0kNl8yO7GAYb8zfT0aN446NoGivFGBbvVfYshGW60HMZcYbID7tC0ch3PCdGACk
	 HccRc5qkFaPrjnIWHGaiTokyK9YrYew1n8z29YaF8HN9fuDKTMFg6Ihu8Ds+tP+mCq+Ex
	 zdvmb/1jnnTM8oiV1JrqzLvlsVm4e4GpDepnjx4r+7yLzNM7S6K0n6/7l7eo1qAV2oRIf
	 BW0k/nZFPW/boJU7zE3MDguEBsQPORB6R4KrJN3qdnE1hr9w0A3vnPzGrooI6caamWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=VUY2wBNc;
	arc=none smtp.remote-ip=162.62.57.87
Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F419606A31C
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 14:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F419606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=VUY2wBNc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795876533; bh=/erwlKU4Qt5qlsYt+hD47EAu/kfrXvbGjQdsXs1DRRI=;
	h=From:To:Cc:Subject:Date;
	b=VUY2wBNc/YAUXNqwPc8kjJOmFk5sYt3zJNqw/dlXax3UDIxuM1qczDwpazUOOcvA+
	 UTbsf4t3F5L5ltDuyiHrTuNqczTfa2nx8VhQevuMvsVmLBxDNtMkYUNuF6lPPhHf5G
	 j2rYTbfnb4a49y0WdVAEm5/eWk1Y0bvzXNfe8MWU=
Received: from PhorusPC.localdomain ([112.43.31.17])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 8DFB9E06; Sat, 28 Nov 2026 22:35:31 +0800
X-QQ-mid: xmsmtpt1795876531t9h3pnkbg
Message-ID: <tencent_5ACF8B20776C5AA9A1C5D37C67600532AB08@qq.com>
X-QQ-XMAILINFO: MBHEkxMsYPCYZ9dLnjPj1Rv6dND3vQgIg5c5uuKSR+38MBs1zEVodlsBCpS/Uh
	 B4WLQAHZoDwdJDDDZ2eiJ+KD7UIqwF/fMrrtkSgH7kItfGC6o4mVZt7y5nJakywFaSZ7wn2he1Wv
	 E53ONqh7OIZb25IXWzi0n+4nXCYIgHOVWyZRnXbsNJ6G7FpM78xdUwJT+bfdsmkNoPf1fSj8VBGu
	 2P6SnncW8Rx3JA0UQMIbNOCb3b5ZbEnOUe+L3CZzKAuw4FP/ImRp5LADx1Dlb9mm+3hEsM3ojwm0
	 2s5RoHDOLg36bnSe4WjbO4TtZx8M7nNvnv6ESa++ZkI0X9nFxuC9MFgWja0KNZ3IF33/lCf8wSVJ
	 vWuKKbr4gSqlb52wmEYZVB1h8kVZYGQIF/3tfFbForUIeuxeh+SdLPH9Rq308kBcV5AaixjEqW/U
	 eVRQUQxpFshjsdVKrfiysXPGp2BU+aJfBNOIDQFlCW49qfVVKaSyXI2/dnNo+tNc+NfVCYyShi4s
	 uBfsE7i94WjNyyDdO6ke+ZAqgVdCNkbDJw1DAf4UbF+Zy6Or0pyDs/QzzI5nOR5ldXwyKFYCQiVZ
	 5PIy6pI6kVom3HsUol+I/KI8lC/f/yJQ8krslMkS7A41FungnpwaTVy4OMpx2ywLlOYCzQOyS7sB
	 3lCuh9cQqaup2qmteh4LqV/SkshnTJ+q74Uyp40SMHQRARNfin86Ly+lwn0lZi6eSnLNGzZkZlrU
	 a1MR+Z030UdYxqSFsDq15XU7xs1ey/1Gwvn0aA8o3j0vc0rsX+bRMzwIz3vniESxclvCso0geUlZ
	 6/tAWoNuQyh1AJQxmTCBXmKFsjp0La450MRnsgWpVIl54cOLHzcM2Iq8hn0TfdjTKIz1kn5QxmyC
	 YRAdlbX6a5jdCMcDR2DnrHykJaHQ0TW47jJJYoKqSxpsZV8RTvBxC5oljA6X0DB71h8h1JFG8uc8
	 dSTQ4kTAkl66+9GMYv2Nmc1rS0k9L/fMhfkIchqbSHemc3akRf5FAeYvWf564wwwOKksrJoSGCPl
	 fhh3Rg8d/Okc5G+QCs2dhMXgaNeXxXFiWP/ss5iVyb0goe5SUpDqOJW+Rm6vUiU9PtiE/be1PwP/
	 1SkaZNMxu/A9ogWE8=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Zhixiang Yu <littleyuer666@qq.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm/dsi: use the DSC 1.2 RC table for 1.2 panels
Date: Sat, 28 Nov 2026 22:35:17 +0800
X-OQ-MSGID: <179587651736.1390.6674853883021858176@qq.com>
X-Mailer: smtp-send (script)
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

