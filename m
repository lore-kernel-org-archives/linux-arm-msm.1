Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=103.117.158.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795414662;
	b=xcH4yRc/sPCtQBcvGUUPdFxsDyO25AM7P561UAyJnFkTUIQYKOLjZzN1aUXZFdnuBAZY
	 oTvLY9QFDsdn+74M+3SbWb43IJc9l8GXKoQABaQ/2SPbUQqr0J8KGuGyEYZnLK8CXeziX
	 3oD6TVVkV/0LhhAfZIorR6lk6QoCxeyCFkxs2O0ydVRNRQREDFJgBVadzWzIXNAlwoYi2
	 aff6h9UznosWJPTW5wD7+5U/MpXvzcxRuwqSLJC9bBR421hDP2vOVeJL5Nyc0ux+b06R4
	 haW78kW7tkObWj2/SKwdor7xaLhKiCWVaoBrSw449OgWp3SvgIr1CYeE064mdGgljgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795414662;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=a+n03QGTCPJ5nKnO5+5uxU9MPwB/7HXpcI7B4/4F7S8=;
	b=muy9EpFaFXrqJBG+Pur8sp4zL1qsiWCZ8e5nVv0vrm40MzNhoBp8EU4RJP4k5VkWDF0s
	 5kqT/iBmTlpIhWdSCLXFaPE0HgZBYaXg62ewsapA7U6NXE8ost+qh48IJEDfh8beDGpzu
	 vOjZ+XAO7g2puomjC+4eOHFoJpVt3WlhEsoOIpglrtzWsAWmzW4/27faV2sdrwqK+2aUb
	 oNGF5l8350VHRbeQX5sS3lGHr22LzLGTNLdsJbG153XyJ2wS2PFT5N0EaDsSnL8hQUmPs
	 AkK00rW6kL+D9WwCL6VVV1OshDsd3YZvyiKAtkRdued7uGnTMBS757k1n7ol4NFrfRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=inferno0230.in;
	spf=pass smtp.mailfrom=inferno0230.in;
	dkim=pass header.d=inferno0230.in header.i=@inferno0230.in header.a=rsa-sha256 header.s=zmail header.b=bU3JKmqS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=103.117.158.53
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE5C606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FE5C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inferno0230.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inferno0230.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inferno0230.in header.i=@inferno0230.in header.a=rsa-sha256 header.s=zmail header.b=bU3JKmqS
ARC-Seal: i=1; a=rsa-sha256; t=1795414620; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=cCDN8UMA7hvuI2TJbJYUjTA4Hpve4Eb5raMHbn6eyvDweoxom6S4SpKcA4IPbZ5YmW7UX3c80gkorgsNINFnjkDE/IGTUPOIGqih+WK6bzIOfVnXnUzmw8TC6B/CWJz2DlnfMYMU29xbY+koo72zT07/49QJkmp9bWK5lC5kInc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1795414620; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=a+n03QGTCPJ5nKnO5+5uxU9MPwB/7HXpcI7B4/4F7S8=; 
	b=EgKi2CxpJ0bJpE+HeIMHA5j2AEy/2SU2hKXMWwShtzXj6J/Y9BCuihkp1ePE5yVe3SdzlgSX9I/N9R/S0AM5fjzT6gq0gCw/E3Avf2Ap6g3n9Y2sJwBXbTeDm0gtLThsnbar4uxxa9OZmGe/NMMblmY04E9qgRXFzexP8guMdbs=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=inferno0230.in;
	spf=pass  smtp.mailfrom=mail@inferno0230.in;
	dmarc=pass header.from=<mail@inferno0230.in>
DKIM-Signature: a=rsa-sha256; b=bU3JKmqSRq2BCiGds+8o8cdfphOloNOhn5pLLN3ZQE900IzkHogZwizJFd79AUZSunbZ8YRWYtnv0wXjunpH95kDRD+zOyFQ9NOViLfnNQ/GW5O3fMOcgItoaKCns4wFUkFPOI7fSH4V5nmqZZsRJJYIsAiExZEBJqewjE9I3T8=; c=relaxed/relaxed; s=zmail; d=inferno0230.in; v=1; bh=a+n03QGTCPJ5nKnO5+5uxU9MPwB/7HXpcI7B4/4F7S8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.in with SMTPS id 1795414617990567.2511706401428;
	Mon, 23 Nov 2026 11:46:57 +0530 (IST)
From: Aditya Choudhury <mail@inferno0230.in>
Date: Mon, 23 Nov 2026 06:12:13 +0000
Subject: [PATCH] soc: qcom: ubwc: Don't use swizzle-enable values as flags
 for Milos
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
Message-Id: <20261123-ubwc-swizzle-fix-v1-1-2dc84e31e22a@inferno0230.in>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSw6DMAxF0a0gj2spDoUBW0EMmmDACAGK+QnE3
 knb4XnSuxcoB2GFIrkg8CYq0xhBrwR89xlbRqmjwRqbE9kUV7d71F3Oc2Bs5EBDRO5t8sxkDcT
 bHDjOv2RZ/a2r69kv3w7c9wMYXVZXdAAAAA==
X-Change-ID: 20261123-ubwc-swizzle-fix-0111b406505f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, Aditya Choudhury <mail@inferno0230.in>
X-Mailer: b4 0.15.2
X-ZohoMailClient: External

Since commit 31e1c3248586 ("soc: qcom: ubwc: sort out the rest of the
UBWC swizzle settings"), the flags field holds swizzle-disable bits, not
enable bits. milos_data still sets it to UBWC_SWIZZLE_ENABLE_LVL2 |
UBWC_SWIZZLE_ENABLE_LVL3. Its BIT(1) is UBWC_FLAG_DISABLE_SWIZZLE_LVL3,
so level 3 swizzling ends up disabled and qcom_ubwc_swizzle() returns
0x2 instead of 0x6. The downstream Milos configuration enables both
levels.

Drop the flags so that levels 2 and 3 stay enabled.

Fixes: 889ee1f4f663 ("soc: qcom: ubwc: Add config for Milos")
Signed-off-by: Aditya Choudhury <mail@inferno0230.in>
---
I ran into this while bringing up Camano (SM7550), which uses the Milos
UBWC config. Downstream Milos turns on both levels, for the display
(qcom,sde-ubwc-swizzle = <0x6>) and for video (bank_swz2_level = 1,
bank_swz3_level = 1).

Untested on Milos, as I don't have one. Testing welcome.

ubwc_7_0_hbb16 (Hawi, Maili) sets the same values and may need the same
fix, but I have not verified the swizzle settings those SoCs need, and
they are not yet on stable (v7.3), so it is left unchanged here.
---
 drivers/soc/qcom/ubwc_config.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 456995699fdb..9aecdee3745c 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -104,8 +104,6 @@ static const struct qcom_ubwc_cfg_data glymur_data = {
 
 static const struct qcom_ubwc_cfg_data milos_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.flags = UBWC_SWIZZLE_ENABLE_LVL2 |
-		 UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 14 for LP_DDR4 */
 	.highest_bank_bit = 15,
 };

---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261123-ubwc-swizzle-fix-0111b406505f

Best regards,
--  
Aditya Choudhury <mail@inferno0230.in>

