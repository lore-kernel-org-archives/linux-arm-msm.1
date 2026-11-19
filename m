Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107876;
	b=LpleCOzezP30Phc5DTd5Q9lwSXrRJHtZ6cdR+bquCL343WBbGRSTlFTTZvTGzQq1Nrjl
	 hF/TzeRestkrSfIjrSYi3q9yd7zd8rM2oqOfvrUydF8IDqOHbyJpkJGlViOa3H7PPRuwk
	 wzp0vvh9U0JtDmMln6GjtDfyh5YJaFw6ySq1UatFq75Z4hWmM2unSQjxzSsiqyGlAQOxU
	 WlPN8puVT03DcGemU99Yfg2eL8IfWkf9lIVbOf/CMao4OO9bvCTRqCaJp1H6MBR3wLGlt
	 fEWdR5gnbvpADr72Yv++zRsFKBpWa8fZdduf1KJypUnZ0MZsUXWx1QhslH98ASQgt0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Y4YiOlg9vBcWp7cMSDzH4ZwuhUP6+NbvoiwA8GHj28Y=;
	b=06UEWoC7oJwD4sHa1JUdF8WfO+E6reNsg74XknsNBMHQ3mBMk5Nbxfyag8LML/Eshww9
	 Jw3wNZbk5ehybDFvm6K3pzbn2fyPwN7ygLnQ5oTDyNfZdwOk6yvZt8GG/aIGJSdt6X861
	 GaU1z3ZqdUftD4DCdZazqI0vSGr43Oc3Ag4s9B6T42CcR605qQI+Qs/qvdrQ8mEb6APhI
	 AF2o9J701t3iNZL2fjRDtF2nyyqO+r7O5HK4sMRh6zFDJQ6+OvpVs/6UNjEf6Ajxxaqks
	 AjSKuvUChWdja5WnmKWjDXDaPuBtnWh3ZW3b8wXx4Kh/E6sbjm2g/wuqgMuX0nSfQAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XaozYmjN;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3D460A2627
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 17:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB3D460A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XaozYmjN
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso3280082eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107875; x=1795712675; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y4YiOlg9vBcWp7cMSDzH4ZwuhUP6+NbvoiwA8GHj28Y=;
        b=XaozYmjNlK5S2WUDd4eFe21P7fsAnWJfqrF15MrWx3bI4ieixEZP2Ql/XGwiGJORxn
         tj+dYFKYBNW3b442ExjzQbaMyuAm5sLtSPqyd2GhRbLJwrOa06/ZSaT+IACMPLBGdFr/
         kdkNtez/UUQDs18J43GoqmamfUxy7XvHrp3TAEDmUjSH/3JFIFRC/4u0zS3MEu+KMl6c
         KiVHrdd6ja2K5o7kZm0KbiJTWurntWSjYyzrsSc3ZdODonk3H4LdzgouLB3AbglZiBbI
         SorpLkJZxrY6ksVxuMR4cWbS/hbGunCwdvVDkFBmJz9CHxWW9H/sbtwMWQcLaMqXBpHu
         Xggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107875; x=1795712675;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y4YiOlg9vBcWp7cMSDzH4ZwuhUP6+NbvoiwA8GHj28Y=;
        b=j8e/gP1pZ7J/VCudNTJAat78ecqJBwcHqFP7jZcj4a0PgsZ6hJXWWkZ4kUxqrdPWWC
         hPfur/cw2GLD5It3AbNjmvv/gS9e+PQe3glGiqfLaSfVaQYnT40e3wOc2Pgm5n+pM9xH
         9TLbNKyK3vHLSE7vEgBQHiKVLeF1eST0IMjbdMereaiWiNSdrzhBzPeGu6Bzxb/GuV8J
         vJQNdxGUyDN7pvfle/S9+e/lVwvJspPufRl23+aZKmiboiP/NKeDOxHv/piokoWzdHFO
         FDIeiVemTcjRGAqIhejgBnDP+IOZ38QFT9p2QKF5lqZWUT4SdizFHB4lCXm8XFcuJfYi
         neBA==
X-Forwarded-Encrypted: i=1; AL+hErF2FDe/4PSWffDGHpK6edDA1mk7pxr1ui80KxNS9nkwm5wsfpbrCl+1x6LDBb2iC7CSUcOg49GnvS73Ugx/@vger.kernel.org
X-Gm-Message-State: APuU4Z9dvXarI4WS/sJvy+xJ8NPLI9zBOe6mmXJvQI5LHmfmHMZ+Zpfr
	J5Jvs6sv83V42HypH7/LsKuRf0fE13rqHAYt4b0u+hYt5+N3kbHp/aq7XkGcDcVXdr3XvQDUoi1
	ogYBqhxE5iw==
X-Received: from dydd12.prod.google.com ([2002:a05:693c:61cc:b0:385:900:c492])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:b594:b0:381:5fe2:8008
 with SMTP id 5a478bee46e88-38281eebbb1mr7411711eec.39.1795107874469; Thu, 19
 Nov 2026 09:04:34 -0800 (PST)
Date: Thu, 19 Nov 2026 09:04:24 -0800
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170424.1512172-1-irogers@google.com>
Subject: [PATCH] bus: mhi: host: Fix uninitialized status handling on BHI/BHIe
 read errors
From: Ian Rogers <irogers@google.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

mhi_download_rddm_image(), mhi_fw_load_bhie(), and mhi_fw_load_bhi()
poll BHI/BHIe status registers inside wait_event_timeout() using:

  mhi_read_reg_field(..., &status) || status

When mhi_read_reg_field() returns a non-zero error code before ever
writing *out, the short-circuit OR wakes wait_event_timeout() with a
positive return value while leaving status uninitialized on the stack:

- In mhi_fw_load_bhi(), only tx_status == BHI_STATUS_ERROR (0x3) is
  treated as an error after wait_event_timeout(), so any register read
  error where stack garbage is not 0x3 causes mhi_fw_load_bhi() to
  return 0 (success) despite failing to read BHI_STATUS.
- In mhi_download_rddm_image() and mhi_fw_load_bhie(), status is
  compared against BHIE_*_STATUS_XFER_COMPL (0x2), reading uninitialized
  stack memory if the first register read fails.

Initialize rx_status and tx_status to their *_RESET (0) constants and
require tx_status == BHI_STATUS_SUCCESS after a non-timeout wakeup in
mhi_fw_load_bhi() so register read failures reliably return -EIO while
genuine timeouts still return -ETIMEDOUT.

Found by enabling Clang's -Wconditional-uninitialized on an x86_64
allyesconfig build, with AI coding assistant help to audit the warning
and prepare the fix. Build-tested with Clang; not runtime-tested on MHI
hardware.

Fixes: cd457afb1667 ("bus: mhi: core: Add support for downloading firmware over BHIe")
Fixes: 6fdfdd27328c ("bus: mhi: core: Add support for downloading RDDM image during panic")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/bus/mhi/host/boot.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index 19c84913cfb9..439bc9d0797f 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -158,7 +158,7 @@ int mhi_download_rddm_image(struct mhi_controller *mhi_cntrl, bool in_panic)
 {
 	void __iomem *base = mhi_cntrl->bhie;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
-	u32 rx_status;
+	u32 rx_status = BHIE_RXVECSTATUS_STATUS_RESET;
 
 	if (in_panic)
 		return __mhi_download_rddm_in_panic(mhi_cntrl);
@@ -213,7 +213,7 @@ static int mhi_fw_load_bhie(struct mhi_controller *mhi_cntrl,
 	void __iomem *base = mhi_cntrl->bhie;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	rwlock_t *pm_lock = &mhi_cntrl->pm_lock;
-	u32 tx_status, sequence_id;
+	u32 tx_status = BHIE_TXVECSTATUS_STATUS_RESET, sequence_id;
 	int ret;
 
 	read_lock_bh(pm_lock);
@@ -261,7 +261,7 @@ static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	rwlock_t *pm_lock = &mhi_cntrl->pm_lock;
 	void __iomem *base = mhi_cntrl->bhi;
-	u32 tx_status, session_id;
+	u32 tx_status = BHI_STATUS_RESET, session_id;
 	int ret;
 
 	read_lock_bh(pm_lock);
@@ -295,7 +295,10 @@ static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
 		goto invalid_pm_state;
 	}
 
-	return (!ret) ? -ETIMEDOUT : 0;
+	if (!ret)
+		return -ETIMEDOUT;
+
+	return (tx_status == BHI_STATUS_SUCCESS) ? 0 : -EIO;
 
 invalid_pm_state:
 
-- 
2.56.1.708.g77570a6a1d-goog

