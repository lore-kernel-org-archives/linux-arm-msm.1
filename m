Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793226905;
	b=DriqD5JNNhsikqUhftkMJjxhbRJ+el5JsIFG5KvyT58m1zrM1wTwshtKMW4Nc+7QOE/1
	 bAulUYxuhDaXkGhBqYp+0F//4dEuy/kl4t4ljKC0ABCFB5HPL9nKoAQGjGEOefkR8bwTK
	 RjqMphI5IV9DEzU0H0xb4275lVzxZ5ioBr0YTWu4uEtDbBMZlEHzGGbyxxOCvixzOS2Me
	 zOaF/5VGxAkABphF/5jTl+GeQ8TmY+Irc+Q5kgtgm4Xp8suHQHI7a0+L/6kWMR7yor+pK
	 TfOqUZoB47xaT2XFC5nX8VNhOEXMbTBtrbCNV/RcDO9LWmClxsV+lReK1DAh1BsruVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793226905;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=IKT3fon1/d2i1xCKh6MuLfmxqe3zW+ARzjd8XukPj2w=;
	b=00/TRi6iW0ZuY3XSubnm7bu2Gn6wU+ILgNuBW71M8W16kXszc7EMA6FbjCK/koFXTuvB
	 MeP0ww1T05/KH81q/1cLXwgZYErjI3INAog0T4IC0gjYslBqhpQcUB4IrSe52ZNX85+G4
	 S6Nhb6/1S/gOr35xzhsmc4k+fzEtcdjo72jiMZZkCRAUqGUWYWI0iM9v8zV36X26fskfv
	 +WXjWJ3O3Lx7Yse2Uw3vbUdqw525Lh1Gdk9bUH4gtdY4XvMXG4DVkSTW4apgKLmt0WEOW
	 sgAhK/5c/jzM2Yletie0pvVeDYCEeh6609eTIMbAsyBWi6ohUDG/x1jCsnuX4r9LtJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=uzgUEhhN;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEBE606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 22:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEEBE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=uzgUEhhN
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261028223456euoutp01238351fb3f1b9da35a38884472cf2233~i0lxuaQbL2793527935euoutp01N
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 22:34:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261028223456euoutp01238351fb3f1b9da35a38884472cf2233~i0lxuaQbL2793527935euoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793226896;
	bh=IKT3fon1/d2i1xCKh6MuLfmxqe3zW+ARzjd8XukPj2w=;
	h=From:To:Cc:Subject:Date:References:From;
	b=uzgUEhhN2VPvwWc7NCk977UDCWc0R+7u+3YrjcvLkdVWAsx9TGwmfmIxZ6WHGJyBa
	 Tfzhr+KwybuckEPex05F6nwZuXSSs6y2UOa4Fg4yrhySSB0vwF0f2MBbH3WjnGR4dG
	 2bHzXTMbYUs+Egio1F0OgioVsRKYd94GZ2BWr0TA=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261028223455eucas1p29b3028675c392f6c0ee012f08963ab3f~i0lxdtLPe2611426114eucas1p2G;
	Wed, 28 Oct 2026 22:34:55 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261028223455eusmtip23dad5630755bebd4db06b58c16fce3fc~i0lxDv6z01026810268eusmtip2G;
	Wed, 28 Oct 2026 22:34:55 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bjorn Andersson
	<andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Stephen Boyd
	<sboyd@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>, Krishna
	chaitanya chundru <quic_krichai@quicinc.com>
Subject: [PATCH] clk: qcom: gcc-sc7280: Use retention for PCIe0 power domain
Date: Wed, 28 Oct 2026 23:34:43 +0100
Message-ID: <20261028223444.2683120-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
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
X-CMS-MailID: 20261028223455eucas1p29b3028675c392f6c0ee012f08963ab3f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261028223455eucas1p29b3028675c392f6c0ee012f08963ab3f
X-EPHeader: CA
X-CMS-RootMailID: 20261028223455eucas1p29b3028675c392f6c0ee012f08963ab3f
References: <CGME20261028223455eucas1p29b3028675c392f6c0ee012f08963ab3f@eucas1p2.samsung.com>

As the PCIe host controller driver does not yet support dealing with the
loss of state during suspend, it keeps the link up and the resources on
when an endpoint is active. However, only gcc_pcie_1_gdsc was switched to
retention by commit 1a58ee1330b2 ("clk: qcom: gcc-sc7280: Update the
.pwrsts for PCIe GDSC"), so gcc_pcie_0_gdsc is still powered off during
system suspend and the controller loses its state.

On QCS6490 (Thundercomm RubikPi3), the Renesas uPD720201 xHCI controller
on PCIe0 doesn't survive suspend to RAM:

    xhci-pci-renesas 0000:01:00.0: Unable to change power state from D3hot to D0, device inaccessible
    pcieport 0000:00:00.0: Recovering Root Port due to Link Down
    xhci-pci-renesas 0000:01:00.0: Controller not ready at resume -19
    xhci-pci-renesas 0000:01:00.0: PCI post-resume error -19!
    xhci-pci-renesas 0000:01:00.0: HC died; cleaning up

Use retention for gcc_pcie_0_gdsc too, like it is already done for
gcc_pcie_1_gdsc.

Fixes: a3cc092196ef ("clk: qcom: Add Global Clock controller (GCC) driver for SC7280")
Fixes: 1a58ee1330b2 ("clk: qcom: gcc-sc7280: Update the .pwrsts for PCIe GDSC")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
The issue was analyzed and the patch was prepared with LLM assistance.
The fix was tested on the real Thundercomm RubikPi3 board.

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland
---
 drivers/clk/qcom/gcc-sc7280.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index 78399993cdce..9e141a7ac424 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -3101,7 +3101,7 @@ static struct gdsc gcc_pcie_0_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_0_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = VOTABLE,
 };
 
-- 
2.43.0

