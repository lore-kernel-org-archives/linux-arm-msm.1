Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=94.100.134.218
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794122609;
	b=ZWtVJLTdSRQD9jSzcRGjujbRy75ZBKTWNHUT9cG2AaVp6ccBqRAIjaM0iSMtD1yio7eG
	 Rg2XYPwb7MIx48k2MN+K65Oizli6d47ATG5d9JJEsgZ904kLLuJVbo9e/xmaFV2iVFBfq
	 aIgj0IJX4smpkbx4DGRtc6n22jHCWG08gjDZgw/XHtI3skkZSeiUL4Q66nj9kXfxe3zbn
	 l/A3VGEK+VSlIp2U5wL+IWHkadw8nKOXTYuzQeUJZUFWy0hq2kj9Qgo34UD3pOMIg5b7c
	 3h0h8vPd3cALBjKMv9DHQ1FtzRS1pX1zoi0/Om/G1TTRPnsj6hKwBCLm7m386kw+AFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122609;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-cloud-security-sender:
	 X-cloud-security-recipient:X-cloud-security-Mailarchiv:
	 X-cloud-security-Mailarchivtype:X-cloud-security-Virusscan:
	 X-cloud-security-disclaimer:X-cloud-security-connect:
	 X-cloud-security-Digest:X-cloud-security:DKIM-Signature;
	bh=GzELP9N6NjgWMoOc3csfVnuCmbbLp2kJQPAtwx4eXT4=;
	b=YWVX1zPrgtGwG+QW+TKa9Vag9PEpGx1wUMdzUBqsIeLFFTLYDIzdPVJPtTE/aP/UNlV/
	 7+5heBCV2TFx4OCRF6nBnEwfF9TdziEd9fDXphR3rAP9g8AbZJijsG+HIxBIiUrTzFLrF
	 jchBznszAuRIC7iNOpBMAEbQEvfAXqWpQ3uLCOP14GwE5WjKr4dOIUtEO2WF+CErTIU/J
	 Wu2152Bg++yJRZ6+rvmXAOkMXDoJlB3gLyZIQAWglaUgbPTWxx/QgtCstWRsgLe5tVc+/
	 sWcQDh9OJXXY4BzTLVF92hsbkXOrEzzD9j2Yz3pA/FBTSzsvchgELpo6cD6zvYlFK+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marcant.net;
	spf=pass smtp.mailfrom=marcant.net;
	dkim=pass header.d=marcant.net header.i=@marcant.net header.a=rsa-sha256 header.s=gandalf header.b="MyXo/99D";
	dkim=pass header.d=marcant.net header.i=@marcant.net header.a=rsa-sha256 header.s=hse1 header.b=szzyYAWv;
	arc=fail smtp.remote-ip=94.100.134.218
Received: from mx-relay48-hz3-if1.hornetsecurity.com (mx-relay48-hz3-if1.hornetsecurity.com [94.100.134.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A960606A320
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 07:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A960606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=marcant.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcant.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marcant.net header.i=@marcant.net header.a=rsa-sha256 header.s=gandalf header.b=MyXo/99D;
	dkim=pass (2048-bit key, unprotected) header.d=marcant.net header.i=@marcant.net header.a=rsa-sha256 header.s=hse1 header.b=szzyYAWv
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=217.14.160.69, headerfrom=marcant.net)
 smtp.mailfrom=marcant.net smtp.helo=rossini.marcant.net; dkim=pass
 header.d=marcant.net header.s=gandalf header.a=rsa-sha256; dmarc=pass
 header.from=marcant.net orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=GzELP9N6NjgWMoOc3csfVnuCmbbLp2kJQPAtwx4eXT4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version; i=1; s=hse1;
 t=1794122593;
 b=Cm8gD/gBsVLQWsGjEX0eca6D9qIunFlmhH0lugZV876iDfXIYRobBPTtQYUq9S+907FLdUfa
 qsqCGwzUPkpfaelGW+YuzEfXhAOgr2zhSff9XIDyG9XCfhi7KqwT2rJrxZRdNsBR702NV+5wC5j
 CSK75vdoZ3PwnLH7Wumg/TWWmWCb7mecHx+3GltcAhxZRhyUxZ3fkYzxyTOc1fbZcwmoDxkKjsG
 OnRnqhXyS/Sw1y2/tebbQ2XeDLGtgd6/QDk0hzpMq/qXL/ZeHvJpF/qt5sR5VQ6YN7ZZTPn3UcV
 PVk2MG+THeeJqJkZkyzzy9GgKUmtkqpa853rS5pG2gGsA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1794122593;
 b=E7xMCKSOewxLnbO/M/rBswLwXZbSHH0txH0hSjR8o5hvo+jKuFFUx3BHnHFjuC+EAx2fodHC
 kUi51KZ2J8Ktq7P5dlHCDHN8GBKIrO7hxgnZXDiVuFDKQI6QsqMxX1SH9GwrzSQQTRaFNonwjof
 tC/J4IVP8t60mtyOi+bqHd2gcB632j1Ctrq20MIuFFLwqZ5FlZH0Q7RRt25yqjUO8y+I+9igy2H
 TvLHO1vTnjpWUADmCb5gXzZX22TsAxMp9Qf664SMhtBv6LMvWob2yZVSy5f6WRXQwOYDuH/EJ01
 RS1Z8oLwWbwG0y7x9FFS5PfzH7AYp/coP8rLwdxH7Kcng==
Received: from rossini.marcant.net ([217.14.160.69]) by mx-gate48-hz3;
 Sun, 08 Nov 2026 08:23:13 +0100
Received: from futile.kalnet.hooya.de (unknown [192.168.203.16])
	by rossini.marcant.net (Postfix) with ESMTP id A9FA9960126;
	Sun,  8 Nov 2026 08:23:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marcant.net;
	s=gandalf; t=1794122582;
	bh=GzELP9N6NjgWMoOc3csfVnuCmbbLp2kJQPAtwx4eXT4=;
	h=From:To:Cc:Subject:Date:From;
	b=MyXo/99DbB+xo4d6YWFSTX/VnPG1er9ywKlnexkEgUv2UwKgM5mqpuTCGEq77FHfJ
	 YGbxXyuJba3jYXEpcRRx5OdEE/jt5wp3A0EUIbiu/czmbfXrhWKwd76kYNLETrkJ9P
	 +zmqNfmq1dsPArw4BMkEet/w4toWsAY4dNnvhfr0=
From: =?UTF-8?q?Andr=C3=A9=20Valentin?= <avalentin@marcant.net>
To: Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Julius Bairaktaris <julius@bairaktaris.de>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Valentin?= <avalentin@marcant.net>
Subject: [PATCH 0/2] clk: qcom: ipq6018/ipq8074: keep port 5 on uniphy1 at SGMII rates
Date: Sun,  8 Nov 2026 08:23:00 +0100
Message-ID: <20261108072302.2311227-1-avalentin@marcant.net>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:avalentin@marcant.net
X-cloud-security-recipient:linux-arm-msm@vger.kernel.org
X-cloud-security-Mailarchiv: E-Mail archived for: avalentin@marcant.net
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate48-hz3 with 4jMksM0nFzz1kNbgM
X-cloud-security-connect: rossini.marcant.net[217.14.160.69], TLS=1, IP=217.14.160.69
X-cloud-security-Digest:33fdc7937bbbd520f6405a31ea0f80f1
X-cloud-security:scantime:1.473
DKIM-Signature: a=rsa-sha256;
 bh=GzELP9N6NjgWMoOc3csfVnuCmbbLp2kJQPAtwx4eXT4=; c=relaxed/relaxed;
 d=marcant.net; h=content-type:mime-version:subject:from:to:message-id:date;
 s=hse1; t=1794122593; v=1;
 b=szzyYAWvuU2UtTXKTrbNfW3j9SdEASfkq/LZPzjRxM5yJCp/4gbl85Zg8wJj1TkJT5OlXOcp
 CJa1FFFN6kOyed2bRLNomyK38+ZLkwhXG/vx+3NHhPWn2LfFV4bi1PyWPxCv9relqSRhTw8ReuM
 UK3PWE6Tc/O/aHAtoEKWl+TV5CYxvKfCJOBDDex71UYZnTj5vkePwH8MKQMO1t4PBSeUJPVINc1
 VmxKytIwoBJ8Nb/K0bvtfXXQHc/R+TNQjZQk5BrzQB6SiLCb7FWKYvKOsJgf52RN48ZAy2vhieT
 +nGrpbOqElzDGNnMjTxVdJEs6uITuPGyQYJ/eIT6IkymQ==

On IPQ6018 and IPQ8074, port 5 can be clocked from uniphy1. Its RX and TX
frequency tables offer uniphy1 only for uniphy1 at 312.5 MHz (2500BASE-X).
In SGMII uniphy1 runs at 125 MHz, and a 1G or 100M rate that reaches the
RCG then picks uniphy0, or stays on uniphy1 with the wrong divider. These
two patches add uniphy1 / 1 and uniphy1 / 5, which the port 6 tables of
gcc-ipq8074 already have for uniphy2.

This came out of a review of an OpenWrt fix for QCA8081 egress corruption
on port 5, where the port RCGs were left on the RX clock by the
bootloader [1]. In the sequence I can reproduce there, the rate change
stops at the divider and the RCG keeps its parent, so these entries are
not exercised. They matter wherever a 1G or 100M rate does reach the RCG.

Tested on IPQ6010 (MikroTik Chateau 5G R17 ax, QCA8081 on port 5) with
6.18.55 plus the OpenWrt patches: after link-ups at 2.5G, 1G and 100M both
port 5 RCGs stay on uniphy1 (CFG 0x300) and pass traffic at line rate,
without errors on the port. The IPQ8074 change is build-tested only.

[1] https://github.com/openwrt/openwrt/pull/24566

André Valentin (2):
  clk: qcom: gcc-ipq6018: keep port 5 on uniphy1 at SGMII rates
  clk: qcom: gcc-ipq8074: keep port 5 on uniphy1 at SGMII rates

 drivers/clk/qcom/gcc-ipq6018.c | 4 ++++
 drivers/clk/qcom/gcc-ipq8074.c | 4 ++++
 2 files changed, 8 insertions(+)


base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
-- 
2.47.3

