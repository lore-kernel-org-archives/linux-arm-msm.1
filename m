Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906851;
	b=hU/Rx3/1UJ98wEu1hUp5h7zqlspHndfBWZAUrYQNo52b872jXw1e4oad9h7AUjU8SoyO
	 h1moetYHMyE1AFU47+IDNcDXo5QdZzELHvBDJ5jY3tRdkvacHb1hJsCGwKhJ5fKCkPxmY
	 aVJTkpGiSGZN5MuUjQ28eGMgQNubbzBVgVMEvmmQhoLIWeP+DTRpmrvCJHxiaHDD4lXbF
	 /wvTWy8H/GmiSV/aF063jwXCz8TFYZYnpJ941nb16vnxornhVvFEHixvwelYIn0oLH154
	 rkxUwlkJ98y1+Tz6dlS2ALV0Ci0Bz6zFDghJiOtE4YZas6DoZPFewpg+WVmAmduNV8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906851;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=pihHLLXNRAgzAP8rGYNfzLOQ+rnGj6xRXahw3WfbbtE=;
	b=VIxnt2yHc11OBGgTewNAXRWu50CwpvGr49qU8MEXIlqw3bWPEbdrb6Jl00/zcbYk2BSv
	 YiXmfx0vFruc4Fpc2hHnerOM9FZ226fe87umAx7FTMsEY9rdN9gaef1SKkCXHuYbnwD5L
	 xMReDqZGU0Uzu9T8qzpfawIjjSLd74A1ctomNukk7TgNSKOCvlxst9PUYo9lJ3OLCY87j
	 kzewIOVb1MmUAGIVQVgGM8JIGYuG0h3a2/LcwfInR2ZVV0N0jPdPxf14PBCBYVo0YdtX7
	 9dcNekC0HBR9OWDgSyeDsp/larBs6nk6HVn1W6DPqETvZZVVW2Z2KAcG7lh3bRlvAzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=NxHh1sxT;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664D8606A329;
	Tue, 17 Nov 2026 09:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 664D8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=NxHh1sxT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=pi
	hHLLXNRAgzAP8rGYNfzLOQ+rnGj6xRXahw3WfbbtE=; b=NxHh1sxTdKecGmBj8t
	PM+Ebr8OJlekwM5Kvfqth1NUAvlIcJRujy+fhSojKfexIMAvwctdp5GaKQYcnCWk
	HBb3RRCikdmg+/aFxcZDTNXH8pdgUtHCSsz1GJU85QOO/3+VjZ+l+LP+SWxWXTdQ
	lQkXp6c9OnwE8nw8nOZKN4iro=
Received: from GHT-5854251031.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wAX9iK1GvxqVX_fIA--.31468S4;
	Tue, 17 Nov 2026 17:13:29 +0800 (CST)
From: Wanquan Zhong <zwq2226404116@163.com>
To: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Wanquan Zhong <zwq2226404116@163.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH v7 2/2] net: wwan: mhi_wwan_ctrl: add ADB channel support
Date: Tue, 17 Nov 2026 17:13:24 +0800
Message-ID: <dee0cba42234dcc193c59e7847cfe1a8daf6ff3b.1794905977.git.zwq2226404116@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794905977.git.zwq2226404116@163.com>
References: <cover.1794905977.git.zwq2226404116@163.com>
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
X-CM-TRANSID:_____wAX9iK1GvxqVX_fIA--.31468S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFWktFy8try3ur15WFy8Zrb_yoWfZwcEg3
	srXF9rJrW3Ja4jkr42gF43urWftw10qr4kXFn3t39avry7XFyUW3WkZrs0yr90yr17uF9r
	urnrWayFyw1fJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_2Nt7UUUUU==
X-CM-SenderInfo: h2ztjjaswuikqrrwqiywtou0bp/xtbC0RmO5Wr8GrnjuQAA3M

Bind the MHI "ADB" channel to WWAN_PORT_ADB so userspace can access the
ADB port through the wwan subsystem.

Signed-off-by: Wanquan Zhong <zwq2226404116@163.com>
---
Unchanged from v6 patch 2/2; bundled with v1/v2 historically (Loic).

 drivers/net/wwan/mhi_wwan_ctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wwan/mhi_wwan_ctrl.c b/drivers/net/wwan/mhi_wwan_ctrl.c
index a31d8540fbb8..50a3a940357b 100644
--- a/drivers/net/wwan/mhi_wwan_ctrl.c
+++ b/drivers/net/wwan/mhi_wwan_ctrl.c
@@ -263,6 +263,7 @@ static const struct mhi_device_id mhi_wwan_ctrl_match_table[] = {
 	{ .chan = "DIAG", .driver_data = WWAN_PORT_QCDM },
 	{ .chan = "FIREHOSE", .driver_data = WWAN_PORT_FIREHOSE },
 	{ .chan = "NMEA", .driver_data = WWAN_PORT_NMEA },
+	{ .chan = "ADB", .driver_data = WWAN_PORT_ADB },
 	{},
 };
 MODULE_DEVICE_TABLE(mhi, mhi_wwan_ctrl_match_table);
-- 
2.53.0

