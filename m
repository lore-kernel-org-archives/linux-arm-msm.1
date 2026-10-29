Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267742;
	b=nQVjizDRWndC+bbmA0u0RPVBXC60wXH5q9q5LX16gIaLBHKKaz6wmQDEiwQYlHjKW7b/
	 VP3GkMyZJOItWnZuGB23/i4J44I2eBp80ZlkOo5cqALMzS9aZ+dBdzD0xZTFuyxEFo/zj
	 2qw9rlVwp41YgKv9ud2dHk1VuBMY+dfabolt8kJTyFuhu7FQfkO6PMja3FudnV7HC3Djn
	 SEc1PpNzIaq6D5FkWS7snwRM3XmnISrAcbfYW/qx1jgErbINiB6pH3WYbIA6JoOse+Cnf
	 4BmcNAqlcj++YS6CJV0AcJfx6KHvjMLkwJUjiW5me/0uEaRlAgJQy6vgW4yiuleMSeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=qj1A+8fQ57/dFas+MgBfkV8FYc5lnSyCDsAqeHMK2OM=;
	b=s6C04hs48fGzUECBRyBfBjY6CUnl7NyFoHEIVa7jHoM9L8fVBl64RkNqr108n9+uM6ET
	 oIofnccjhBLi9F/6wQmp8zrAA6nd6c8kVHlmUNkYEyZJ7vnR5LV4bh8/gzHXnB9wOvLmx
	 CWXYpy4lPUrefBBSbaB+d7WAIvcEYn1h7HumF6so9IOcO8Eylh68vvdcqNVJN5UioBR5b
	 BOxlnxm8SnqF1FiJcMmTR0na8ov27kibpCCM5ZHNhjJiJgwG+o09ytWiYDsCvMryZL7zd
	 vD8lQ7dbXpx8jSke1WMihju/nL049V0sWwQeA2uz92dSNHmNoGe2Zost8+3RaNv1GGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LfcpMvwM;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66571606A556
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66571606A556
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LfcpMvwM
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so6949565e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 02:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793267740; x=1793872540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qj1A+8fQ57/dFas+MgBfkV8FYc5lnSyCDsAqeHMK2OM=;
        b=LfcpMvwMy2IsdiCifuWJR8m1XONHAsorczxuIn2seORpERHF6RcRyWzCR8a8CnbBT2
         jG0NFWzUSAKTj8hm/TLOD72EBy6w+2oh3BAh8aXBMBoib1+3rr3k6PyUZHoGeDdoOqZh
         qeP37G/8FyiYP1myy6FCUimyJZKi5OuzU8r8LLLcjp9izJMfaY0rSkTd/ek5tkUVHkyG
         HRH8KVr5S8ac6RRrG+2NhIf/cwXFcMVAcA+DCviwhu86Lg1GlX9q7F6V0p8wLF5Ct5w+
         0VaWy7y3ETRd17DfRZd10yhBdSWkTNUHOdX1Nf37U7dcC7vVvUakFS+KVtc6/82Qiacc
         yS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267740; x=1793872540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qj1A+8fQ57/dFas+MgBfkV8FYc5lnSyCDsAqeHMK2OM=;
        b=0g5y3it4U1fhjvgvgPbzBjKUAV81sGyElfSa6UTCJFeKoqMEatWjhcmbkhZgR4wxPX
         OXFi4dPA24Gkoc8CCr8fnjC61rkw9yeonOe1wHzmkGQza+iQboMjPxCpSV3phUYMec2i
         55yhnYqXE8PSiVefjWPp9xNohMnGOZnZFpyQ29SrsYtsePg2CLyl1X87VRkVh9e+VARl
         af6Ih4s0We15Wr6zKMKFWBiIk40hvE4L6OHrSUim++VwV63UvPQexdiSfcYy+gj5WaA9
         xQL9sIkBgOZqqJxMIifz+KXid890xMAUmzXpO8phaLn04vUqxH3b3/ENRVlc3nDq/1G3
         +uuA==
X-Forwarded-Encrypted: i=1; AKwUvByBWAW6LoVEFlnYlTC9OUZlG+7vfdO5yyotM2w/XVtDb8e49HJAmxnx5hFX9nTIKraFdpNnO56Wrh7TfRtT@vger.kernel.org
X-Gm-Message-State: AFq9FYLAkAGD5LzUoQ4E1Ey912c18B9ILvKR5xBXQvzhy5KmD/nQONtg
	2SrF2s5QXRdgM/kiAYwawYs5atz05yYvHgzywdNKlH6Vf1WgG6IrxcF1hr970FW46Zg=
X-Gm-Gg: AYBFou3zApsqS9ePFQ/HwrJXhEaMN36C7DvZNHlIVfmhctSz/mAHUiImTrmM19UBW9u
	L98wUHWJ/271nuZsdMu99zrG2ic1osGvFjVo5cc0Ow8qZGha7IrWi3vPprYIPs24svZ1b8fisOO
	iG0IKgc2GBkZ0KOyNjr/4X11/EkR0VqeMaFj0CpBNufg+V+xUzaGfoK95ZXoq+7l15+TYLgH5I+
	s0rAB74u1gseq6qCm5SYv3pDuOJmntkyhdyHKxNtcW2CtbY2cSzqTlhVVKuntKnP6utg4d6IHiB
	370oIhWiITNFtZwR1he0kufQ4uZWDjNcNgOQ8y03ggbrEmksQndD2N9FzsjTYkjpJhtRgqBUzbt
	5KuMzP3Z/YXSyfn68md1rHYxTeAsRhLA6gs81PcuyWJH6aj0c6XaCpbdMUn0eU3dsYfJowvW4CW
	l3onNPJcfCcQbA3AVpHKsM+UruuNfbtEUEoUxlK8JpPAaoo4kLyO0LMB2W2LDF1i59WqApJ5GeL
	Ek09ups+ipEuHM1SQDjr3KdLC3BhZvMtzzJKLDdtUsqUUnbt9xcGuLf4qDIfoo0SXZPW8SyeAEV
	tnRO9x7XQx2KxU9bnws=
X-Received: by 2002:a05:600c:4988:b0:4a2:1002:223e with SMTP id 5b1f17b1804b1-4aa8a7ac780mr31852895e9.7.1793267739798;
        Thu, 29 Oct 2026 02:55:39 -0700 (PDT)
Received: from [127.0.0.1] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40437160f8f.44.2026.10.29.02.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:39 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Thu, 29 Oct 2026 09:55:22 +0000
Subject: [PATCH 13/14] media: qcom: camss: Switch on frame_sync_en for
 sm8250
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
Message-Id: <20261029-v4l2-frame-sync-v1-13-d37992559c58@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1707; i=bod@kernel.org;
 h=from:subject:message-id; bh=CkYB/VX6UaK/qcxlW34OVkQ2L2oUHrct4cBJHsxd0PU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq4xgOmyFPRvpDmvOH4dGKXFhNXHsGnJvcvO1x3
 CkKpJ3+iKGJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauMYDgAKCRAicTuzoY3I
 OtEqEACutpF5M1ef66iTNQm6OPGVR/ABdK370bGrL65E67FrXLBLlkdHRMkIU0zbeKDndGRQeAY
 i1PBoUYSK9Rr2AlPkJuifEpvJUCHj174J6WBDlC73/8wfP+TYh/8kGBOdd70tbawJ9qFAEhaSa6
 D9c4YGdAVg1RizDFcnlqJYh4xM57O06UQ2wbP6m2lJESw22+m3WW1rdosWmfDrdrAmEmUZp+GLb
 p3jU4uNmcMz7Fx3to4nfVm6bT/8Cwgxu6BCWl7Jf39a4YetaBm6kJKP852SOmOgvEBjWxswh7nM
 t1Oxhq0urr0v+GJb+NbGoZy/F9b37DMnTd/5bEI4GC5qdpF4lQL7pHSseo1JqlpDIUN1D3iCiwE
 MVnZ1I5hlz0GBU86ZlVM8jQ5w13sSA+VnKxq4+EBmsvdcRDz84G/KLKrDr6ljiwD1Fpg+ehc/UI
 /84vhaahc0vpVoHalEmOPgKPxpoY5P7ziYdiUDP03xu6uzwlWCga/QYujA5tAjtcDVAZygAuWFz
 nY9gt7xejhmjrQVpY0xswDbBHpyT/cac0SetO+Jo5cKCLMnXtdlXL1qpLL5g4F4Ao/IsNmutF8c
 3RqRjdmz+q4HA8IMNoorXeR2k80CwzmdtSt+cRAFb5Oux3iGBivyEsPm7nDX8xMVDoYWLvdonVg
 cvJkcYjOgTAYs6A==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Switch frame_sync_en to true to track and consume SOF/EOF data.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # rb5
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 10bf91b467f66..23f0b63580bae 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2058,6 +2058,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2075,6 +2076,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2092,6 +2094,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.interrupt = { "csid2" },
 		.csid = {
 			.is_lite = true,
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2109,6 +2112,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.interrupt = { "csid3" },
 		.csid = {
 			.is_lite = true,
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2

-- 
2.56.0

