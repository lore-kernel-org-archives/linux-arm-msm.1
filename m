Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3D54334AB
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 11:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787225678; cv=none; b=LXs7Xz2MR+8ew7JYhbdrGchDu+PYxNk4HQjMOz2T6C/uCj7znXesWVNZgXfJY89iBWmzy81OvfMDrAIvVmqJIFsAYAnpnyNAbktoPZPa2VajbTuK7NTUdcfGFQJ6Xouo50mLjIBCOe8ZMT9av43ZJzHANMQqF9hBHAPzPtQXo/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787225678; c=relaxed/simple;
	bh=DmjuA3EwLAIQQwMSy60CfXr1eQBK2NPnof6WbT9c54E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j66V8d5dyp7E1ms2zWD96GTCp+Y8qN+bWT9FXkGw9QWGW975WJUPy+7JjZmyp6y6OtnfxQkaBIkUv4nYIAcDTc9p4GfbQQjE0RfjTUkS3H26mipO4QqsJK/lSPkDbuTjE5POsCqU18M7MonG3I33pNIbyfHQ3Cc8cKIO181TMcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JAeIJTNV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JAeIJTNV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787225675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wYMxTh+VJQGvzrp3oGiAam5NAWD2/nWGeTlnP6it5ZA=;
	b=JAeIJTNVhq+/uGAiQ5M53DHsLpLHmcBr/a3EP7bdvx7PTEUB5V388g9me22WQ4acigASYV
	0O5IsCHWexWQOofjI3Q9TtzojQpEKSig8kq0KI9clvpsbA69R97Tps9VhnU0OPHun1Y+74
	rgZUkqB85Rqe+BK0ZTgGwdH+oaYbIDU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-26-lIiLCHj8MCGnP8zALHw0cA-1; Thu,
 20 Aug 2026 07:34:32 -0400
X-MC-Unique: lIiLCHj8MCGnP8zALHw0cA-1
X-Mimecast-MFC-AGG-ID: lIiLCHj8MCGnP8zALHw0cA_1787225670
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 46E6F1800365;
	Thu, 20 Aug 2026 11:34:30 +0000 (UTC)
Received: from [192.168.1.153] (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1EFA21955F03;
	Thu, 20 Aug 2026 11:34:27 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Subject: [PATCH 0/2] Add automotive SMEM hardening for Qualcomm platforms
Date: Thu, 20 Aug 2026 13:34:17 +0200
Message-Id: <20260820-port-smem-v1-0-d19a45f583bf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0NL3YL8ohLd4tzUXF1zU0OLZHPzZEsTQ1MloPqCotS0zAqwWdGxtbU
 A3GX21lsAAAA=
X-Change-ID: 20260819-port-smem-7518c77c9415
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, 
 Sudeepgoud Patil <quic_sudeepgo@quicinc.com>, 
 Sarannya S <quic_sarannya@quicinc.com>, 
 Pranav Mahesh Phansalkar <quic_pphansal@quicinc.com>, 
 Tony Truong <quic_truong@quicinc.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787225667; l=1716;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=DmjuA3EwLAIQQwMSy60CfXr1eQBK2NPnof6WbT9c54E=;
 b=JXMpqYJvwtbBeQbJ7apU2hLRYKPt93s61IzKiImgC9RMnHg+rabsSggPewktyoDBHMarUOdOf
 ytZ0erOx4siCupEUKZpeAgJfX4/e2qwxuEn7pKJ+g2LRcpMvUO83ph4
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

The Qualcomm SMEM driver manages shared memory partitions used for
inter-processor communication on Qualcomm SoCs, including the
automotive SA8775P platform. Vendor trees carry additional validation
and partition-enumeration logic that is not yet present in master.

Patch 1 adds boundary checks when walking private SMEM partition
entries, ensuring traversal does not read past the end of a partition.

Patch 2 skips multi-remote-host partitions during enumeration. SMEM
now supports partitions involving more than one remote host, but the
driver does not implement that case yet.

Both patches are based on public vendor patches from Qualcomm [1][2].
Adapted for master. In particular:

 - Dropped the xarray partition rework, which is already present in
   master (79602b750b96c, "soc: qcom: smem: Switch partitions to
   xarray")

Built on master (Linux 7.2.0-rc6+), and tested on Qualcomm SA8775P
Ride V3 board. SMEM platform device binds and initializes successfully.

[1] https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/3e521f2641c8f01f00fd74a088206942ce23d6d4
[2] https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/842dd28b0276b3824a607e067b3c20e266bcf230

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
Sudeepgoud Patil (1):
      soc: qcom: smem: add boundary checks for partitions

Tony Truong (1):
      soc: qcom: smem: ignore multi remote host partitions

 drivers/soc/qcom/smem.c | 111 ++++++++++++++++++++++++++++++++++--------------
 1 file changed, 78 insertions(+), 33 deletions(-)
---
base-commit: c21bb4193868a8de71fc4693fa741e195fdf5d86
change-id: 20260819-port-smem-7518c77c9415

Best regards,
-- 
Albert Esteve <aesteve@redhat.com>

