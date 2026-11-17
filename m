Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906853;
	b=YtlvZ+5mTzklso77uhdOzHapUshAMIT7VsI/OUvHk3SaYRtCrnwLoorWZ6Htn2R562iz
	 LxERPvr3Z/4kNn9b/bBZ/bv9WtSFJli05YEZ0BSkg3vtxickIc6HlfaeOLWiarbs2Swxp
	 SOi6vFXTMx4D3ZWrlD/2Dq69Cvlb569WikZvdhz0OQtvo4zv2YU8xddet6NaEufoVHJ5r
	 VZYp/G9LXZso5TxDDOPY4wt/Tr1399t3KjSLufKoJoNpYZ/bVMdbkwB0ZWAnpjkOZXcN5
	 8dqPpciiENf2wvlXiVJjuhJke50If17fAcEjnwsrMPoXZuPox8NBUAxQFRSQEHSFjFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906853;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=pZ5s6RoGkC1ZyNr/O6eROnVnYOQpUVLD9YWFjmstH7U=;
	b=eVuVpM+lVtfw+lQ11kquV6ae1GSRDMHWX1LfhiQ8n3IDy/Q5kWzZhODwJJQcw2QNKED1
	 /mH7XMQLbWp0vcYkEye9SNCgSx/c5xuQocS7b3wS8lF/w3UJvsrJXzxEyoAPAlb2FPLQF
	 W+ZYJFrqyPQmOT8HrjwrAYc9tdvNlGwU4CXoPIkzzM4rqhoURXxFwXs6gAl8EYInkptto
	 CruxFrG/e3PmB6nnQxKp6vgLzgKXriximv+ir+7/OMBbbrawlcUXK6utP4NvsQ4WQH2+p
	 pxKZRqZ+nS2NXkSReagfjix0QTWGgOHWoF9S7ZgcmOTtS/mAsa2138xQndY7l39su3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Vr4AegD5;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93500606A331;
	Tue, 17 Nov 2026 09:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93500606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Vr4AegD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=pZ
	5s6RoGkC1ZyNr/O6eROnVnYOQpUVLD9YWFjmstH7U=; b=Vr4AegD52umo1lC73M
	8VzOnaRO5aWJ03q1y0BpxZGGgTo7QaJpntmmAoFrnr74KR7DfMPkuI/RV6u6ZEDo
	SgD0VIZf2nQkaofydyXrlyJe6HsYvyQLRlrmf77ivl9V+M+jeL5YHzkvsASHuzz8
	qDjqMY00rjB/JTbjGWpLTbuII=
Received: from GHT-5854251031.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wAX9iK1GvxqVX_fIA--.31468S2;
	Tue, 17 Nov 2026 17:13:26 +0800 (CST)
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
Subject: [PATCH v7 0/2] add Rolling Wireless RW135R-GL and RW151 MHI support
Date: Tue, 17 Nov 2026 17:13:22 +0800
Message-ID: <cover.1794905977.git.zwq2226404116@163.com>
X-Mailer: git-send-email 2.53.0
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
X-CM-TRANSID:_____wAX9iK1GvxqVX_fIA--.31468S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JryrJF4kXr1fCrW3Ar4fXwb_yoWkArg_uF
	Z7GFyfWrsrZFn7CFWxGF47XrZ5Ka18Xrn0qFyktF9F93sFkr1DWwn5Jr1DJrn5WF4rGF18
	KFyUuw48Ar1YvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRRApnDUUUUU==
X-CM-SenderInfo: h2ztjjaswuikqrrwqiywtou0bp/xtbC0heN5Gr8GrcI4wAA38

v6 was not merged on mhi-next. This v7 series is standalone again on
current mhi-next and includes the full v6 Rolling config plus the RW151
SKU update below.

Patch 1/2: device config and PCI IDs. Patch 2/2: ADB wwan_ctrl (split as
before).

Signed-off-by: Wanquan Zhong <zwq2226404116@163.com>

---
Changes in v7:
- Resubmit standalone series (v6 had no maintainer reply / not merged)
- Add RW151 SP config for 2099:1502: QMI 14/15 instead of MBIM 12/13
- Use 163.com for From and Signed-off-by (same as send-email identity)

Changes in v6:
- Resend as standalone 2-patch series against mhi-next
- Include full RW135R-GL/RW151 config; split ADB to patch 2/2
- Drop no_m3; RW151 MBIM ring 32; SAHARA SBL; NMEA on 60/61; all PCI IDs

v6: https://lore.kernel.org/mhi/cover.1792573876.git.zwq2226404116@163.com/

Wanquan Zhong (2):
  bus: mhi: pci_generic: add Rolling Wireless RW135R-GL and RW151
    support
  net: wwan: mhi_wwan_ctrl: add ADB channel support

 drivers/bus/mhi/host/pci_generic.c | 152 +++++++++++++++++++++++++++++
 drivers/net/wwan/mhi_wwan_ctrl.c   |   1 +
 2 files changed, 153 insertions(+)

-- 
2.53.0

