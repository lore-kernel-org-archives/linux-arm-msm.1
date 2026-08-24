Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E15640E8CD
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787571359; cv=none; b=h4N6lFmocxUkoheS6GR1zWWNYqlqKV7U0HxEVUHymk3IGiQX/BKBzb4SsMpCCCFfHSBl5gP9uwf5g/WX7oSvbpYHLXmccnOaanefydAEVW5ECP6zjhOt8KfvT4uZm4NO3cuPeRJHdiy956Id7jpYOTQVq6Rrvq915ccoL5vaAr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787571359; c=relaxed/simple;
	bh=tf/bP20RsQUxSe3cjazFZCrihbzFDnCA208qW6mTdDI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Hh+Fbq57DbpT5T+xC/gjEDZKBBvo5LAKesjP61MGp/17HpQrCA4zFsJ2cMotXF14rRjTB9QI8ycI0zyZKSKxRVDK0MDWjQeSTcTz+P01NGroyMrWpjjpxroCt93ODPUPisMuE2nDNNHC51i0fC92+CZJPFI7vJR3tcuPXpboNiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CD5bz6I1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CD5bz6I1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787571357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ClDf2+nT4Vy0ziFRSO90/6AZVDgNWLnb8xsEyPTMhLk=;
	b=CD5bz6I1Sz3jwOOAChxgEA7xb+SNn6/Dtc1iXXugsJckm/3p+xWrttj58XaUUub2l2e3HQ
	GJ5SwXbaP4g2z9c79OcWHPcJdMLTHGsdieelfQ5AbpGNXiYVkPnSed5m2JS4OASmotnF06
	ub6BQ/EMpiWw8SbRCnKHHx20lJA2Pp0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-689-nzmRGGeuOu-04gECsQPWng-1; Mon,
 24 Aug 2026 07:35:54 -0400
X-MC-Unique: nzmRGGeuOu-04gECsQPWng-1
X-Mimecast-MFC-AGG-ID: nzmRGGeuOu-04gECsQPWng_1787571352
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6335C1955BF8;
	Mon, 24 Aug 2026 11:35:52 +0000 (UTC)
Received: from [192.168.1.153] (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2287D18005B0;
	Mon, 24 Aug 2026 11:35:48 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Subject: [PATCH 0/2] firmware: qcom: scm locking improvements
Date: Mon, 24 Aug 2026 13:35:38 +0200
Message-Id: <20260824-port-scm-patches-v1-0-1dfd69374402@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBswQYmuEi3UpppFJY5EIN49a
 fkW/xcQSkwCU1cg0cPC99Uw9B2Ew107Ia/NoJW2atQK450ySjgxuhwOEvSbGZ1xgzeWoGUx0cb
 vv5yXWj8+SutiYgAAAA==
X-Change-ID: 20260820-port-scm-patches-bf58a5a1b56e
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, Ninad Naik <quic_ninanaik@quicinc.com>, 
 Murali Nalajala <quic_mnalajal@quicinc.com>, 
 Venkatakrishnaiah Pari <quic_vpari@quicinc.com>, 
 Jian Shu <quic_jianshu@quicinc.com>, 
 Yuvaraj Ranganathan <yrangana@qti.qualcomm.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787571348; l=1864;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=tf/bP20RsQUxSe3cjazFZCrihbzFDnCA208qW6mTdDI=;
 b=NCzNr8hVHNm0rVftMoblRm134ln72zvYrec+6OPN/nzs0oSmepbx5lRmJYfm2Yh/Ed26yoDxk
 s7QVD1XPE8EDhmkZWyEUvDGhZRmGHxCkr5lpkyFN6v3E3l8RWHNbCAT
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

The qcom_scm driver serializes Secure Channel Manager calls
to Qualcomm firmware. This series ports two related fixes from
Qualcomm's kernel trees [1][2] adapted for the current upstream
driver.

Series summary:

 Patch 1: Replace SCM global mutex with a counting semaphore.
 Patch 2: Allow SCM waitqueue completions to freeze and be killed
 cleanly on suspend and shutdown.

Adaptations:

- Size the semaphore from scm->wq_cnt (already queried via
  WAITQ_GET_INFO during probe) rather than adding call_ctx_cnt
  and extending skip_mutex helper
- Do not port skip_mutex unlock/relock around WAITQ_SLEEP; that
  path does not exist in master
- Initialize the semaphore before publishing __scm

Tested on Qualcomm's SA8775P Ride V3, kernel 7.2:
- qcom_scm probes successfully
- qcomtee platform device registered
- SMC calls complete without error

[1] https://git.codelinaro.org/clo/le/meta-qti-auto-kernel/-/raw/LY.AU.0.1.0.r1-16800-gen4meta.0/recipes-kernel/linux/files/scm_adci/0008-PENDING-firmware-qcom-scm-Introduce-new-locking-mech.patch
[2] https://git.codelinaro.org/clo/le/meta-qti-auto-kernel/-/commit/9319960e593c88e6d88bfaf0f6ed3e1235926ea3

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
Ninad Naik (1):
      firmware: qcom: scm: Introduce new locking mechanism for SCM driver

Yuvaraj Ranganathan (1):
      firmware: qcom: scm: Allow the SMC request to freeze and kill

 drivers/firmware/qcom/qcom_scm-legacy.c | 8 ++------
 drivers/firmware/qcom/qcom_scm-smc.c    | 7 ++-----
 drivers/firmware/qcom/qcom_scm.c        | 6 +++++-
 drivers/firmware/qcom/qcom_scm.h        | 3 +++
 4 files changed, 12 insertions(+), 12 deletions(-)
---
base-commit: 818bebeb63dd6bf5f4e07e145f6cdbace520a34c
change-id: 20260820-port-scm-patches-bf58a5a1b56e

Best regards,
-- 
Albert Esteve <aesteve@redhat.com>

