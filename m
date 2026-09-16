Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38F048032B
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 12:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789563397; cv=none; b=u6rraDjPy8xM5/xu6oDk8brDfIB9xMSlStrS+nKqEKUU7zX5U6Fx5WHKGDQ9xZvaFifm9T0eMa86lpUzMsh+96tO/+aMaylJY4HwhtAXKzEDPDm/kcQFkce6Bl3ODJGyiJSoWRFYymBJDHGoW5xHO269rkgxDEeqD0FKY0r4cLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789563397; c=relaxed/simple;
	bh=kkUupmneTSkSMAW1kU9Nr5OuWucHdCVY8m2X3BfaK5I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vmde/kctC2XTG239xs0zJhUJ/D8OooATHtfUfKOfCyqZKM2N99m1mI4jqqiYN+NzKp0v3lMjlf4eP7hnl+FP9OozpRxrCibZKEUEf6lmwiBrmm8qYcFZkdaByczo0lIUmmy0/SSmzVofRpVe2FAdWE4HnTxzXOpXMBmBXHhyW7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DUxsUEnD; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUxsUEnD"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351832so438066f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 05:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789563389; x=1790168189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K65vKL8xh3jtkztbOsGnSCiF0lSalpJ1jm2FXDGayB0=;
        b=DUxsUEnD97IDCA5BfpC36ym7geAsAKwxaFed54vB0AJ1WunEtJhXbIZPjM2ZuBZcWH
         hnwyzrDpPRHN8h6LlqSHiZ30a3qEJcFDxdTf+ri0mdNg+RludLTMKARZY5tnaNa26Eui
         8ozyeqx2iuZOTcRpuBQ9z7WU546Qlf4uKgdNarKv25rRDJhFoJ6KBEugelbc0mj+lbnK
         s4oRPzGYBhCRUzeTyDY+2ugg/eu/c1zAo/Hubmf9e4P3W5b1AQHdzvh4tnH/gfuM/pGL
         oh/s2kksdWlq+SFxZyaaoBLvlA+YRPGPXiKySvZKN3Dos5yChoecItyrJRlK56h+D2ui
         gssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789563389; x=1790168189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K65vKL8xh3jtkztbOsGnSCiF0lSalpJ1jm2FXDGayB0=;
        b=rSamK51u9LPkRvt89gMr/h23EQe2ksm3UbR8rQIO05aNk/dK1vk53P4ZEti574uSmd
         WLKjlSY60+I4QaJgL//m10UQpUDWr7ZSUZg5SCrC+UcpEjbNGmcbkqAQXVS4tlngf6bc
         GGgVc1lxOOZU8W6qmWwCw/6Dfs4aqfvS/LWN2K+ihSv59194FptpSz2jx8G4cyKWx11T
         ZLDKeY2PitcGghY+v6/UiTSqWo/RGrjKYZZvl3BqkKVu2gqQAYlPqrRFxn1OJj+4ngCh
         Z8iS298TY9eI9yWXNmXvOQUui2Gy6pBtjrJm69MsdbN8cO6cxoSD5fhUpZevFh5QQEmS
         aJQQ==
X-Gm-Message-State: AFuF++lhAxrQjXfz6lFcz3veUnAjViVm/yrLLdBHynfZRX9eSxb/ms9v
	S91UzCZJphNo1QBZpFMsAVxS22XKz04kjCjBlkS/LN8SVlh/AGz+e7uH
X-Gm-Gg: AYBFou2sW0mHeY43egTL27/6nnrekB78olKI8LPSsVO3basAHEuBKiZXBz9clH+L3SX
	7+tONIAPbzXB4xGV+HHficwV6TK/HYePKIPA8wrKl1uxeQVvWoijPp7IZjwQHoMalcuL+RFscd3
	pCuV/TVc4y7xtH/7kgsj5xE9S54A6ATAzoWltMCrUstxrilITE7v16303iVeHqBpEXnN9HgPBHI
	SfzI2fM6B8HWpJ68kHuLagTjhZKW+UWmBtT7egDj+zQ/+PBuuyMuZ8lJgZRr2fhOVngc4gtgzbW
	/LQvNyihMnHkBqLm6DtVF3h6R7M/hxQJp4U8dYbKBojFUxuNbbTDVDJCUPiWMkI69nk4izrD1st
	PIem5CzjESE64gjTs7M+tfrPL7PCcjqYxRbmhGhiShKXjc73VJArq8hccS46ztmTLNJlp9KWzVA
	GV0+rIji5yySzRqCl1JBQTbdhVpapClZTa87HsXZFTWE0+QZnPlVbdrK9VPNJ41jeabik+x5zT0
	dP6nbeJ8YQ=
X-Received: by 2002:a05:6000:200e:b0:487:c4b:71c5 with SMTP id ffacd0b85a97d-4870cf0498cmr3375808f8f.17.1789563388825;
        Wed, 16 Sep 2026 05:56:28 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4870bf342a0sm6750729f8f.24.2026.09.16.05.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 05:56:28 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 0/2] phy: qcom: qmp-combo: keep the Type-C callbacks off unclocked registers
Date: Wed, 16 Sep 2026 14:56:17 +0200
Message-ID: <20260916125619.4587-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The typec_switch and typec_mux callbacks of the QMP combo PHY tear the
common block down and bring it back up with force=true on every USB-C
orientation or altmode change.  Two things go wrong on that path.

Patch 1: the callbacks hold no runtime PM reference, so releasing the
clocks during the teardown can drop the device's last reference and
re-enter qmp_combo_runtime_suspend() from clk_core_unprepare(), which
then disables clocks that are already being torn down.  Seen as
"gcc_usb3_prim_phy_pipe_clk already disabled" warnings from the
pmic_glink_altmode_worker on a Lenovo Yoga Slim 7x Gen 11 (Snapdragon X2
Elite) once runtime PM is allowed from userspace.

Patch 2: the result of the forced qmp_combo_com_init() is discarded, so a
failed bringup is followed by register writes with the clocks off.  Found
by inspection; it needs the bringup to fail.

Both were posted separately on 2026-09-09, patch 1 on its own and patch 2
as 2/2 of "fix forced com_init() error handling", whose 1/2 was withdrawn
the same day and is not resent: its remedy was wrong, and the init_count
imbalance it described is left for a separate patch.

Tested on next-20260915 on the Yoga Slim 7x Gen 11 with a USB-C DisplayPort
display: plug, unplug and orientation changes, no clock warnings.

Changes in v2:
- Rebased on next-20260915, where "phy: qualcomm: qmp-combo: Add
  preliminary USB4 support" moved the mux callback's teardown and bringup
  into qmp_combo_reconfigure_phy().  The runtime PM reference is now
  taken in both callbacks before that helper runs; the com_init() check
  moved into the helper, so qmp_combo_usb4_init(), which already checks
  the helper's return value, sees the failure too.
- Both patches carry a Fixes: tag for the commit that introduced the
  forced re-init path.
- Link to patch 1 v1: https://lore.kernel.org/all/20260909140345.4239-1-okerixx@gmail.com/
- Link to patch 2 v1: https://lore.kernel.org/all/20260909151443.10276-3-okerixx@gmail.com/


Oleg Keri (2):
  phy: qcom: qmp-combo: hold a runtime PM reference in the typec
    callbacks
  phy: qcom: qmp-combo: check qmp_combo_com_init() in the typec
    callbacks

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

-- 
2.55.0

base-commit: a7728f5e1fc3d472a314acdabca6039f71ec3a9d
