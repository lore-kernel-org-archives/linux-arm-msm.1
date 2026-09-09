Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEF1562612
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 15:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966898; cv=none; b=aTDHwnxUWuL5tglsGw3C2RIR0piDgpy8UrmoMs2zdMGE3lG/4cSBZX/nuM1k2i1XBa9XYYgxVXc9uNbT5rGdcdn04txZfNI5kk9rt8ntTipPQZ6OOygMTOp3K6ChZ4uMRl1k77IjJ3k8tZizVrTXCQRHk3QSjGMMo5QF8Q8bJ0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966898; c=relaxed/simple;
	bh=1GVj8X2p7lufsZ2voQnUOUhtIUq5oY3o4qE1B5AjqkM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u6fxC/fBsZt82LoDpvho0AX8CDAf5SP0/8ca4uPtBMTKtH/oZ93HKQ6KfgzW6v+V/kOKy8X7FWnsnfaFF2GnURLodLYiPusER9cmcW1lRMa2OOm8XHFtEy0DK9oUCYyJOEohy+AGFbZF+2+3ILTHq0s3e8O9Nd0WDVLDOTSVc5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hzK8gas6; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzK8gas6"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso3086985e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 08:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788966895; x=1789571695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3NMvm8qf6zXuBrsZ4ksCDxs4+LTSFOsWcxQZ6U5RW1A=;
        b=hzK8gas6mMzwGwYzJW6PO4S4W92fuaxlcM5mCt1Z36FdWxfpk9uCgFVX2W8f6vM6s9
         67iCyYAKOiPD/eWUAmY+oEEFqgdok17yRM+9Y28YP1KBZrdTOSedDUhKLtFtpUVyyiF0
         aBCQyuL42aY2fngRaoYGPmj/DHgwrkZr6fJt2lcyiwE5vCQa9WNBbt33796j0zOx54Vq
         53009QarmZI4GkCD33g+zeFrMK70DubcLOfEJrHscoLEcZqP3qpuNdSGKdXTFDbp/Osx
         EOz43cNngZIDBCwktP1hj/nhNtz8NjcdeAeK8IK9ZenPDcenzSOSGL9Caw7NeiZE8nTf
         PJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966895; x=1789571695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3NMvm8qf6zXuBrsZ4ksCDxs4+LTSFOsWcxQZ6U5RW1A=;
        b=eJcAkC4c5fADNHHH6Yz1fAM9psJ6COZu/3p0puw4MaaTFvxOR3MTJEDIp9a/lSxIZO
         ONMqyIL9e3VglNUwSWN5tJFGJDYQhFr8baN5KbxUfYsIruHlmPDd9maB/3VL796FYCY5
         Wew+CzMDzg/XB15COdxWnJkcpPnKziOm8dJJjsp4nEteotjlDrgR96D7251HB2Qpre71
         uV3IZHrvEUafifyl7bMw7XPgnvL8zJPjCwaHEo+1EWC1QdAC4bpP+jiugkdsT2MGy9VI
         xY6ABpLrkZ9coBcmCUvKIkLBtdDhEE1Db1zznOZkEqTGLCqAi8NCZscEKI96mKFkyJ/V
         m6Ag==
X-Gm-Message-State: AFuF++lmcRWIkNEvCYvfijNkj9CC4NW9LCu63C8iH6vJoz7qu+HERUhW
	CsVd1Hl+EbcIC7AqzTfTSQQyl4OmrjI5FMg/NaIekeL8L03RXtkqRUaa
X-Gm-Gg: AYBFou2IF/dDIcvV9XppxTcWJeaKNo3Cf4WtfU/PeDGIyZSIuQjfYYCot27edemeJrs
	1hIccnRpXusGBb0OVi16OBx9V8e7i8MJdn8+l4wE3M34r3hghsw/h2X03hPhhoRj6zzPXd8oJdY
	TlvywJuN7MzcdsESJdLzTtGSzjKK9w1gH2GgxZ07iOq+3oTOX2H0iMaN2oKXN2aDCv7AcF8Q6DV
	k5a+OCJJQUPW7LBGij4eWJhcFGagU40DOfXFvkVATSlMMcEG8cTncM3+EDVBKRu3FKPYgsq/u96
	nf1xOTrULq2TG3f8EX3eUhUYGPV3CjijLdH7Lt+G16Ai2L7M+bJ5JnYwNlz/ATX8cW6pRB0vvmr
	wP3X7bXaIvGvj7PT9tLvAaArPT386m0FETo4amV8cezgrcV3/PERFuF+bARXIg5N2OmeN3qDNxA
	SxaflSPay1RUfWD+7xn2iUPM+uXzWdd+oyxOzD358KwA5p+63wxMrKpUqUPfVbpqBkRZ9FobGZC
	tbish3xGUPHe9pAy//QI0DbiMpr/b+kVNiQYrlfGeEFfWRGWIKmmro=
X-Received: by 2002:a05:600c:150a:b0:499:7a15:fcec with SMTP id 5b1f17b1804b1-49d2592e85bmr25190535e9.13.1788966894942;
        Wed, 09 Sep 2026 08:14:54 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm483644155e9.0.2026.09.09.08.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:14:53 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Scott <mike.scott@oss.qualcomm.com>
Subject: [PATCH 0/2] phy: qcom: qmp-combo: fix forced com_init() error handling
Date: Wed,  9 Sep 2026 17:14:41 +0200
Message-ID: <20260909151443.10276-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two pre-existing problems in the typec_switch and typec_mux callbacks,
both on the force=true path that tears the common block down and brings it
back up.  Found while looking at that code for

  https://lore.kernel.org/all/20260909140345.4239-1-okerixx@gmail.com/

which is an unrelated fix to the same two functions and does not depend on
these; they can be applied in either order.

Patch 1 stops a forced qmp_combo_com_init() failure from dropping an
init_count reference it never took, which drives the counter negative and
makes qmp_combo_com_exit() return early for the rest of the boot.

Patch 2 stops both callbacks from carrying on to write PHY registers after
the bringup has failed and left the clocks disabled.

Neither is easy to trigger deliberately - both need qmp_combo_com_init() to
fail - so they are found by inspection rather than reproduced.  The tree
they were written against is exercised daily on a Lenovo Yoga Slim 7x Gen 11
(Snapdragon X2 Elite), where the typec callbacks run on every USB-C
orientation and altmode change.

Oleg Keri (2):
  phy: qcom: qmp-combo: do not decrement init_count on a forced init
    failure
  phy: qcom: qmp-combo: check qmp_combo_com_init() in the typec
    callbacks

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

-- 
2.55.0


base-commit: df2908090cda368b01ff43709f51890076c56157
