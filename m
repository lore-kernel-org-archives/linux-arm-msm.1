Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07D972621
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Aug 2026 06:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786170744; cv=none; b=mZ3bkGVi6VMHIxB7hARrSxzDRac4qVYMuHQpkSWRwAVwUcZvVFfV9yhstNwiw/J332YfaftFtr6ALYJ8yfLgP93g021Jlid1zD3lwDwqI9P+PtdnDJSVksm1ZYR9x2js5mmJRATvL3cn1jkHKK/P/uZ1Pc+4/RBSs7k2gr6WVWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786170744; c=relaxed/simple;
	bh=utJwx9x/emAa/FX5+FqoqFvE8ykdtMHfQcVG1Wtfo0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VKsksz33zx/FYVC83Dj0TFRys2lPUFeL0Ws/fVPDg/XECMG0oZF90sCzDT50E2g8KRxKvYdAaSxQRNrr0b2qCiJCufIHhNY7xbtFoMuTjHn0Z52gSfohutEqreM3L+P2BhTKsQXswwFC9gSrMJa76rSEA0MnqXLKd5aRrwbkZbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxCVNOkX; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxCVNOkX"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ce7d2adef4so4382295ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 23:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786170741; x=1786775541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=opM1ArZY9ycrOafIY5Aeu7mw/sEReWno9u0hjjJ5rx4=;
        b=hxCVNOkXSMuFBSbNMW30jXBLeQ0IcQ8xe4k9PCdTAgq0uUcKhJYW1KdRduDTdEFKtD
         +Ddrq3GxkSrwG+5soBTlso4AkdFFRbC/IMWlXadiJemrVc/Rj7GHyUDgV/0qY5CZXSOY
         3oyepKS+0mWt49431J2mHodKW8QEvbljae4A4gSqG8L5fJ+uZZTrUxKu6NtZ3//MfRJ8
         NjtqiD3AduAcwQ7TJbKGAIz551jJsvar8cDwubb9V9PsWAMV+/AXLn16GLFmIWlNbgFT
         7+HOEWEvmJTfJDEWQQo1W7b9VqPuI+lkDXofUJfm84PWbdgB01dEhWVCgtWTvZf2T70q
         plNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786170741; x=1786775541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=opM1ArZY9ycrOafIY5Aeu7mw/sEReWno9u0hjjJ5rx4=;
        b=FiiGTBjGkADa5vWG8LN5yvlOlXKV+IAnfw4AGDurZQOlU95qtz5fKu+CS8JCCRnx2P
         pWcjVajaOeUQoZoO8Ts5JHaKQpmPRvKRUHtkSooylfuT+C6IT7MHzu7uFWXxm2t3b5YJ
         B+5xtDMkeuFvWzzuDCkty1twF8lotYCE617HWgkPS+QBX4wlblT1GuThqnMaSecdqQ7G
         g7XVRCntcjqNhDIqAEXzm9qGMHUfxgNXY8/z3R3N+SXVshHffHbUE7F3Fa0rO3NmxvZW
         hS8VxxtoFNI64HzBbNOQ3hMQUSiLllDbC2e2Oscizai0Y3mgPXnQnxPk00BBlrJttA70
         OO+g==
X-Forwarded-Encrypted: i=1; AHgh+Rp4r0GzfIUBd6hjHuW4WQanisRhFIzyQvEMEXt3o6Yfa1RZj9cfc6T1A+uAsG76UlXXExLREaN6+sSz6Jlj@vger.kernel.org
X-Gm-Message-State: AOJu0YwvjYDvY7f7hxAtsoK9dcLvpILyZMgO9SRMsDGQbIVXovibBviq
	fVj6O7a5aVkPIns94rYK/cIEh08CyyIpAwd0QyRuQw7hk+MvYf0ENftO
X-Gm-Gg: AR+sD12s+XQuyaBFNTU5b99IYexT5ofZWm3sbzWTc3GZ8WXZZ9rLg6j76sGpyb7Prs6
	Xgqwf4mnkN7yaoC704TP7ojN8//dpjYLmnPG0mBdkUGLu66bO2TCXtcKd28X5IxN4zJ6gwRhcBG
	hYlnWach//5CYv7KXWVwywcxKIU8sk6MX/x7wnKFqhweHZFVF1sG90SYGu/rvjabn8cMe4DVI6O
	RBXYKcu2ODUiR3nj9QNFfNaxl+XmIX0d4wHb/tYzgQxCLEAJv3vJLOgvQmotMLJ2JKKOYA4ATOT
	c6yZ4zMRfyv88NHRtzqQWXTXvUdZgTRLCMKISbdvpHVj55F+v1rZ4jBJU2qvs4ZIpJhdZzU0LI5
	6BPo4s/vyEop8iCmN873e9nQxZgIZE47pE5/BK6RoaevXDvJ52VL3SJOGBS+R1fiPIjllzr4OFR
	RyxSgHrVnJ7j9dLorJZRKxD36Z9gl8jic/jiw8YrhgPfk=
X-Received: by 2002:a05:6a21:6f17:b0:3c3:724d:ae7a with SMTP id adf61e73a8af0-3cbc0175426mr12832407637.9.1786170741232;
        Fri, 07 Aug 2026 23:32:21 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af2d8sm1484585a12.10.2026.08.07.23.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 23:32:20 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>,
	Daniele Palmas <dnlplm@gmail.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Slark Xiao <slark_xiao@163.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] bus: mhi: host: pci_generic: fix usage_count leak when autosuspend_delay is negative
Date: Sat,  8 Aug 2026 14:29:16 +0800
Message-ID: <20260808062916.2604668-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mhi_pci_probe() calls pm_runtime_use_autosuspend() when runtime PM is
supported, but mhi_pci_remove() does not call the matching
pm_runtime_dont_use_autosuspend() during device removal.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during driver teardown, this reference is not dropped and usage_count
remains unbalanced.

Add the missing pm_runtime_dont_use_autosuspend() call before
forbidding runtime PM.

This issue was found by manual code inspection.

Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/bus/mhi/host/pci_generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 0d0d9c7ffa4b..8efff3e0a31c 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1479,6 +1479,7 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
 	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
 
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_forbid(&pdev->dev);
 	pci_disable_sriov(pdev);
 
-- 
2.43.0

