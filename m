Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795533383;
	b=2eSUI/I2rMbCYRlUclT5U0j6nYP7fIoq55i7iuCKzeJfzaYAIKBzNpGrAHwvY+rK6b/X
	 xXBJ0zE6fbndb+b107LMdLjXnC1lJOrS0Ty9Qy/9yFfEFt1vGmGew3831S55S7nH8rDPL
	 nE0rVuN+dJV5C1jnhmT1xg5tuZVYzZfh9nxPNZQ6uUqui5e8qj9Fio3jlf8werUDdYDP0
	 0pJLX7otthzvpaJc/frGIkRtjTFXDawBc7b11UR1MHdeVRp56320lK1zKvdVGbvjSTioW
	 RrD+Y+aB9eMoumOFqOBRm8uOwX5sOxS6Qh8GtouPzp7B0+D0bwfEhENF6aH7rt6eYSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:User-Agent;
	bh=F96WSg5pTD28lUSUnHWWtFmWs2K3E3FdmPFxV73gVEU=;
	b=5aGVfv+kXYn2Ac4hpHa6hftE/vD2d9FBfldK6qvyEGBrcgArjCtZz+/K0xgprR4SOVa9
	 ujTFGjj9uD7tXErOUPsOdDOnVvIRbCalEv+Ck1pp0n3KRN7xaeLw1r3np1noaDanoe5Nv
	 IOxzK5z8lYlQFNQXiNlFrCqTUIOVApgRKr5F526wUSPittosPDw6oTs1TlPbyH7VGM6vH
	 HHdBW6X26OFwtJc6DD6o+LMmyqo5Mp6JFxR6+2U6OV+n1tfzfND0t0OwwMY7JiJb8+31B
	 OYxTZ7JBa0uKdrda6XYaxdk5pW0yQuXLuRN/g1xJ73HXPp/gJr2RYsnBCbcZTcmQtsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DkznfrrH;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237E4606A323
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 15:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 237E4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DkznfrrH
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b24f4b15c4so1925234c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 07:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795533382; x=1796138182; darn=vger.kernel.org;
        h=user-agent:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F96WSg5pTD28lUSUnHWWtFmWs2K3E3FdmPFxV73gVEU=;
        b=DkznfrrH3uEXCcf0Q1btCan2uPBXxFeUswMEvzg734hyFctGoIV4QJMQ3y0X2+xiLD
         Z+VtwkZxt5LrDR4mGXK6O9yFOnUHpKyt2M5214U4PUIzJ1u0Yz7Ml1y1/jqlflqJU5Wa
         fWdTjt/ikkvZgW9wyZeavDKWiUw5znQLYxMi2uuPLzZa/IPRoLPtoeqdk/6iTI+Sae7n
         D5SaXgyRZFarh0+sVjdXq1cIav69zCnyW21wjOfQRNzjEhqHpL6ZZDhKGGsyIZDM3wR6
         GqREMwHBs0xDmLXLML8OX1EO6/+BNpnpH5aXdyZBGGhf11REF/uIih2+M9YbsRf+qbV6
         ZFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795533382; x=1796138182;
        h=user-agent:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F96WSg5pTD28lUSUnHWWtFmWs2K3E3FdmPFxV73gVEU=;
        b=tnuSV6cZEqg33Nx+wp75hbiVX8M4aLINHXqaDZh+dMffRmWDtQRczPrwJmHOuHsXDC
         snI5Hfy6ksRW1RSgcWGcJQgSRUSR6CM2ynsNwXfX6ooa/lFbbEXE96YzVCWQbJl+ABRy
         TGXoYSEbWoR7NJ0WIqNQn66Ec8RrjHW9Bd9Nwi4BM5Ynjw1g00iV8WDWr2YmhcscMWV2
         B5tOQwF14Tq6m6Jm9WtxB5SP0udz1YgHN8Zkg6VfbkzQn8OQp5mC1NDGYnaIQvf3SuF9
         PoMJULgEPnG6P33XdAz4YcKtNAZzbfBrZq4JJ9vUJaf9sdqAD8mo6X8V3Qm8iYNbq3J5
         VDGg==
X-Forwarded-Encrypted: i=1; AL+hErFtdiJPrZJixNmtX5RFSt+tkDHoVpNCK3dgJ2kL73ZEhtmFX/xD35DC5BMezIIOJPcPVkCVFaL0TDWjhSYd@vger.kernel.org
X-Gm-Message-State: APuU4Z/WYFrItnA0pM5fUf98LcXactLjQbnwVSEzeZLb6lgd9zCUO0B6
	R/oBptyQEcnmQbVKF7VwKK0VyQJ1gQNV3t4dMwOZOZbba/zKGU1u086H
X-Gm-Gg: AZFdTZdnM7t2in75E526PkaxzkV31ok+CES/Wq8oAO2oBdHeQsIoX0rtb3177ZotZSK
	TtuCAQ0U2/JbsGn3ORKH93BR27ozwO9XXC7lLb/Bv9Urn2vhqgq67FvADoIIJOXEz4r+rqsIJBK
	0v3dNGdpPI0QR1Qicq2w/pNtGtiZxwD2yb5G1Siq/Z1chzCSEJp89SPrvitEka7XQ7qrqRvj6TE
	nRq92eSF2cYHeqShTVe3ICTXZhFAQlE4IqJCaH05lbD5TIYWrd1elHSBJXBajFE5Hdv7VRCD26o
	XILbAyOM6/l1xdnhcNS4hfh3/4DDEN3gknlgXbLIMqwlTdAGcSSUoJlmtYlbrGC1W+gAcoDdDg7
	afaS4Sc3BQRctO4hyEEPErZLNCcWzSuG4WoRPB3DB3oW1/OZmDUGC39C2k5MlE46lma+pt827I0
	C5lsRQa92lsFr2kK0ilzuiLlDKLv7W1iDPPZNsc0j/gcJ1XZ0Q8bk4OD6y64Vd2rSRX+Ps8uUA6
	ITYXw0XiAw1TQ/mk2plgJdlCxm5IGXDPN0MbWQEOTJUvFph/+/KtpZtyS57dX4l5yOQ1BN9Q5T0
	3pnG4t/8tQN/fk9EH7MmZtV4VnNj6l8hGGKw8wHR4zjPOnAXbkhaelakbDSTK5CPX3523/b2yj9
	dKR6qvhhKkDrBy2Q6LyQ=
X-Received: by 2002:a05:701b:4550:10b0:1b5:337a:6456 with SMTP id a92af1059eb24-1b55247eff6mr14816177c88.5.1795533381990;
        Tue, 24 Nov 2026 07:16:21 -0800 (PST)
Received: from asus-ux3405ca ([2400:9800:1ae:2539:58d8:c556:ab51:fdfd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55ff0e4e6sm28471337c88.11.2026.11.24.07.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:16:21 -0800 (PST)
Date: Tue, 24 Nov 2026 22:16:15 +0700
From: Muhammad Huda Nugroho <mhudan21@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] PCI: qcom: Do not power off a PHY whose power-on
 failed
Message-ID: <20261124151615.SjIkx%mhudan21@gmail.com>
User-Agent: mail v14.9.25
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list

qcom_pcie_phy_power_on() unwinds a failed phy_power_on() by calling
qcom_pcie_phy_power_off(), which walks the whole port list - including
the port that just failed, and every port the loop has not reached yet.
The phy_set_mode_ext() failure path returns without unwinding at all,
leaking the ports already powered on.

The first of those is not a leak but a refcount underflow.
phy_power_off() decrements phy->power_count unconditionally and invokes
the provider's ->power_off only at a count of 1, while phy_power_on()
invokes ->power_on only at a count of 0. Releasing a reference that was
never acquired therefore drives the count to -1, and the next
phy_power_on() returns success having silently skipped powering the PHY
up: no error, no message, just a PHY that is never initialised again.

The damage outlives the failed attempt, which is what makes it worth
fixing. On a single-port controller the very first failure is enough to
reach -1. It is normally invisible because a failed host init at probe
time is fatal anyway, but it becomes reachable as soon as anything
retries host init at runtime, as system resume does - at which point the
controller comes back with a PHY the core believes is already on.

Unwind with list_for_each_entry_continue_reverse() so that only the
ports successfully powered on are powered off, and route the
phy_set_mode_ext() failure through the same unwind. The PHY core already
releases the failed acquisition itself, so the failing port must not be
released here.

Fixes: a2fbecdbbb9d ("PCI: qcom: Add support for parsing the new Root Port binding")
Signed-off-by: Muhammad Huda Nugroho <mhudan21@gmail.com>
---
v2: add the Fixes: tag, and nothing else. Verified against that commit
    rather than taken on trust: before it, qcom_pcie_host_init() called
    phy_power_on(pcie->phy) directly and simply returned on failure. It
    introduced both qcom_pcie_phy_power_off() and the call to it from the
    phy_power_on() failure path - that call is the release of a
    never-acquired reference this patch removes.
    The tag was identified by the Sashiko automated review of v1:
    https://sashiko.dev/#/patchset/20261121113721.7OL6u%mhudan21@gmail.com

Notes for reviewers, not for the commit message:

Against mainline master as of 2026-11-24; v1 was also applied cleanly to
linux-next/HEAD (909ef7a9a30f) by the review bot's baseline run.

A structurally similar unwind fix for the tegra host bridge was declined in
August 2026 ("PCI: tegra: Unwind partial PHY ...", Pengpeng Hou) on the
grounds that a phy_power_on() failure means a broken system that an unwind
will not save. That reasoning answers a leak argument, and it is fair
against one - a PHY left powered after a fatal probe failure changes
nothing. It is not the argument here. The problem in this driver is the
opposite direction: a reference released that was never taken, leaving
power_count below zero, so the next phy_power_on() succeeds without
powering the PHY. That survives the failed attempt and breaks the next
legitimate one.

The same underflow was described by Vladimir Oltean in March 2026 while
reviewing "scsi: ufs: qcom: Drop the PHY power_count check" - "If 0, the
power_count would become negative after phy_power_off(), and a subsequent
phy_power_on() would merely bump it back to 0" - and the ufs patch was
withdrawn in favour of per-driver state tracking. This patch takes the
other available route for a consumer that must not inspect power_count:
only release what it acquired.

Found by reading the error path, not by observing it fire. The underflow
mechanism is from the PHY core's own accounting in phy_power_on() and
phy_power_off(); no hardware reproduction of the resume case is claimed.
I would rather say so than imply a bug report I do not have.

 drivers/pci/controller/dwc/pcie-qcom.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1445,16 +1445,29 @@
 	list_for_each_entry(port, &pcie->ports, list) {
 		ret = phy_set_mode_ext(port->phy, PHY_MODE_PCIE, PHY_MODE_PCIE_RC);
 		if (ret)
-			return ret;
+			goto err_power_off;
 
 		ret = phy_power_on(port->phy);
-		if (ret) {
-			qcom_pcie_phy_power_off(pcie);
-			return ret;
-		}
+		if (ret)
+			goto err_power_off;
 	}
 
 	return 0;
+
+err_power_off:
+	/*
+	 * Only release what was actually acquired. phy_power_off() decrements
+	 * phy->power_count unconditionally and invokes the provider's callback
+	 * only at 1, while phy_power_on() invokes it only at 0, so releasing a
+	 * port whose phy_power_on() failed (or was never reached) drives the
+	 * count negative - after which the next phy_power_on() silently skips
+	 * powering the PHY up at all. The PHY core already unwinds the failed
+	 * acquisition itself.
+	 */
+	list_for_each_entry_continue_reverse(port, &pcie->ports, list)
+		phy_power_off(port->phy);
+
+	return ret;
 }
 
 static void qcom_pcie_configure_ports(struct qcom_pcie *pcie)
-- 
2.51.0
