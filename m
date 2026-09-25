Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC1043F8BA
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 19:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363820; cv=none; b=FmhT32bRnSYNyRAwW4+S3Kmh91YxyHUHpNQ5huIBe3DW5gqnRM/MXDzycLkcq7MK1dogPio6UBE0utXQljLKk034ULA1Q5ZTl8ZrQfN1aJVOjlxrQUmCoxEqO8jP+nuldjkL4yG09W20XLwrYrsq1owNRKsV0SMEDaR2Tz/yVOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363820; c=relaxed/simple;
	bh=j5qbuXrDX2plwlT/z3lSzoNInbPkdLmaRYkhQoo2lGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G46ZSEcazwoNkc5MEf10Vnl6AOidX1ZbmBlDHwyOd+MClAWXPe9QobLnrF6i+NUn3naNQOWrqDRbQqJ5TywEb1kMGcj5OlN9z9YWOW3mZ94uczkUp772R1pxsGeRrUtbSE2kh4YjXxd4PW2YZI1+voL4WrcgbSj9K46E0LAlXlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dlL1i+Bb; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dlL1i+Bb"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93c57cbb459so2678785a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 12:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363817; x=1790968617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lfjo9pAawGhp175tsWiMgt+u8R0WsNzuMBsHkL3MrJQ=;
        b=dlL1i+Bb52Um433seW73O7dcdH2e9hWMsQX+rkvscV9Wvdz1mMrjVsY8GOXoqxQPlm
         Aoaqyse9+uuHpidc3CS+twF+Jne+LMAUql8wYeQvqEMkUX1q2C73CiAjOZC8lHnh6+B7
         BCHVcgtJua85zps8cZCXW3c9BvLo5WwoJwOcYmzsIPYOaDf4Yaw6V+a3FF7crvYdg3xc
         6dBRCCT/+lKxH0RYDQC94f0gZioKD+dRED9+rvrHZSVRdWjgDxotXx9Qa9oL5K6c4NkG
         OTd8VRbToR4KaOvcs9VScSqpX6qWsbi9NHV/ECPPK4WJqhuLGfm/NiXe6HZ9B73Vbxwa
         MpWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363817; x=1790968617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lfjo9pAawGhp175tsWiMgt+u8R0WsNzuMBsHkL3MrJQ=;
        b=vrnEOxQ5oo0Cpzf2pLRDnW1Yd20A1xrBgW8WNK9J9FEXLvtgFRHR6pgq8IVHed/q4a
         hceuLzT+pkdfkbZHu4hvxmOZFWUqIJD6PgY0SrGMwulCaynTsZFm2dp9J2uuDB0neRsU
         jhi/jW3fKCJzIgjUtOaaxftaGxagizEPdmXmYxKlZARNYGTNs4oClDmf7wkjUbvgpAdq
         VncmvTPQHfKEm6603+mPyp/mBJQ4FSvFJcoDklZDhpXd/z5z3vyNxbYlbg/vS9mrqKtk
         J0735tK7TtDYGWU8mEbp5+PXlsL7vm9v11ds6U2e0/AIeOvZ2hnZf3yyEiVRMLei28dM
         ZPIA==
X-Forwarded-Encrypted: i=1; AKwUvBxPtaiT32NuY1CkOwJozODJfdezrdudN9oGvCArP7JOKGFxNqgL+cNYLcHCt7VKwlZG+phGsoPT4FaQoUHj@vger.kernel.org
X-Gm-Message-State: AFuF++mJGd6RpkJ6BUraLdq4NFpGUzu8piY4yuNdbUSqi7KxTpB88ufC
	0uTvm4REMW0JhNc4HwmSkvpiEa7qDD53bNXnahhniJY49tRCejFWKJVUDyJxk7QYWw==
X-Gm-Gg: AYBFou0XEfnWv11MLpj//ZwQ3Ak3ROxP9vc4gqtSQiiSf9OEgBpRdzoqmaZpckDDLgp
	XVKeBusyr3AjL4nUEBRU4MWbdrsqseKVfTd4YMeAPIIdakMW+iZYy5CbLxo+ivezCddLuc0PdZ1
	FCF5l4/WVPOaQ/vDtMvI2npOOX9VRspVmRpwA7Gwz9pcWjiC4u26IDzSre5vPrRFKA1dqxFvDvF
	oJMfx/tWFkcaVbJjXZZ0p6o0wd5U72jmINt2RMbxtXE9iKXFP6GeSoAM5psRQG8/Iq5cfMIw5hP
	l94+6pYqlu3Rqxp4H1YpkjbqeHBhXSpg44J4QCzjygeQwYk3N4FUBZ/5Cko88EiN/x9XhDDi4hi
	Xyyu/y4Ejr2uwDqsRHPJGhTPg7297DBDBIQ7xI4xUT5v/GNJjvIUZiB6HnQ0akNSgJhuMfusdwC
	kkYJqNmRMALSWwcfhkLo+k6FkDgwJnEISEnjcZ5k8jc95tewjL6kKwIVbdM43jvaiHb8GvJ7+sa
	14hLIssugrzr+CQDOYQfh+A2S/fy5LkrYgc7D9EE/TTF0ZUYfPCsCwVpUanOId/1YFIS+gQT0C0
	tKYo2l5t/7fjIlOoH/ax1/LKQFR1
X-Received: by 2002:a05:620a:4045:b0:93b:cb64:25a5 with SMTP id af79cd13be357-93c43c28e52mr647745785a.12.1790363817360;
        Fri, 25 Sep 2026 12:16:57 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-914309a24c4sm24142666d6.6.2026.09.25.12.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:16:56 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v3 1/2] media: venus: hfi: disable IRQ before freeing HFI device
Date: Fri, 25 Sep 2026 15:16:52 -0400
Message-ID: <20260925191653.3144006-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925191653.3144006-1-mhun512@gmail.com>
References: <20260925191653.3144006-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

venus_hfi_destroy() releases the interface queues and frees hdev before
calling disable_irq(). An IRQ handler that has already read core->priv
can continue to access hdev and its queues after they are freed. Clearing
core->priv does not revoke the handler's local pointer.

Commit 640803003cd9 ("media: venus: hfi: explicitly release IRQ during
teardown") added disable_irq(), but placed it after kfree(hdev), too late
to protect a handler already using hdev.

Disable the IRQ first so that both the hard IRQ and threaded handler have
completed before clearing core->priv or releasing hdev.

Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260612103333.5585D1F000E9@smtp.kernel.org/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index bd82066bb6e7..e7e4e78a186a 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1689,11 +1689,11 @@ void venus_hfi_destroy(struct venus_core *core)
 {
 	struct venus_hfi_device *hdev = to_hfi_priv(core);
 
+	disable_irq(core->irq);
 	core->priv = NULL;
 	venus_interface_queues_release(hdev);
 	mutex_destroy(&hdev->lock);
 	kfree(hdev);
-	disable_irq(core->irq);
 	core->ops = NULL;
 }
 
-- 
2.53.0

