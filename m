Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793668474;
	b=fiMWb9GZRXtgrpUb8jCUP1LwBc39znd/J18qI5dFOqX+gFhz3Rudkcvz01TiM2dKS8+R
	 glbNPFnsYlmpN/MnGVxQU8BSjpH56x+Sy59i8AvBxKD3Vcu83I75LTsao9uo8q+wWR/Ca
	 GX4tiv9yKIYwvL90l9+oo1QSJgDYT47YzjvIxvvWsgX7podANz4wA9hFHOrMNUjZmomCB
	 8XQEhsCQ+wscoNWnMugX086DYJ7CG+StACkEtresBiZ7r8nUgly9y9CKBMfAdSHfqjisO
	 pEjnzdUQHhdhFdhiEXNx8EjyAr5LgVl7XIuhpXPToS/dsd4TADOZ8V+J/LQk1TEkXww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668474;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Fq98sHTYCsrFoomue1WOZStbEKhPD5S/Xw0WEXE/lKI=;
	b=eixLIkUqfwf9vz9cI+azKaNseeyLBdr5wvwxYTmWor9Q4z0gv1/jfA4nTHAOzEL3amm9
	 GYPo7OtqXmcs+BoMOsaBjKjP+XF4pb24Na1SZyxyFff6Hmz3Go7hfsE0wNTCx9Po3uw8R
	 s0s6YL0uGok29gHKmx61OH/zbFBaPI5ErxLG5PPb5TVru/pn/NPAUKER27SbTmU3l46YN
	 MytBZgRruMj3oY1hKe/1QyHI0Gwuil5BKZpo3NquCk+6ovznBfo/bZEW2A8/A5+09jTSP
	 IydEVLAwSNft4qQe9DvKmFzaJEQlbcxrSxFFbKdyowHtpmvQNUSnRPe/uZat/rLWm0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=NFPIPcJf;
	arc=none smtp.remote-ip=95.215.58.178
Received: from mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EEF606A324
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 01:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38EEF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=NFPIPcJf
X-Envelope-To: linux-arm-msm@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PJB7fKF+/loiiW1a3Y/RpW9YC0ahitzGq3HxxmTug7o=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793668471; v=1; x=1794273271;
 b=NFPIPcJfSbRhdYmTOTJQADzw8qsTEKYvtUqhYAD08bbYVF3eeY93ffhSM8mZC+eFozustoNs
 qSv4mkMmszpV0f1BHw7xYHG6QJ3OWr6rkg+APLQoUMD7dtEgQ7g7oW/gTC+pkEVZc/ZBehKVB20
 k/ReX3Zu5ekfY16DXjfzA+BabbAkGHz18FdB2gS9n1SeGrYhqhbUNBlIPA+Do1CEQj8MyZ8a5nZ
 8TbxJEFdHFZUTKCYZWx+/m2Vbh/joTgGXBdrlzSxfUQl2CafK9ARQrQmdrY2RHytmUB7B1YBXCE
 QGhrFVmZqyA/pTB6MB9P72mr/vsRoR8cIYHp4B5KwXriQ==
X-Envelope-To: linux-arm-msm@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 59894c97548e53e0;
	Tue, 03 Nov 2026 01:14:31 +0000
X-Mizu-Trace-ID: 59894c97548e53e0
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] drm/msm/a6xx: Fixes for a680 (SC8180X)
Date: Mon,  2 Nov 2026 22:13:49 -0300
Message-ID: <20261103011358.65398-1-val@packett.cool>
X-Mailer: git-send-email 2.56.0
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

This series includes:

* the missing gbif_cx sequence patch that's been around in a
  Surface Pro X downstream WIP tree for a while;
* new fresh patch based on a (rather slop-py but valid) comment
  on my report about Vulkan texture corruption:
  https://gitlab.freedesktop.org/mesa/mesa/-/work_items/15349
  GMEM starting at 0 did fix it here;
* an import of the hwcg sequence from downstream (kgsl) which
  is just-in-case more than anything, feel free to skip it if
  it's not actually the right thing to do.

Thanks,
~val

Maximilian Luz (1):
  drm/msm/a6xx: Restore GBIF CX config for A640 family

Val Packett (3):
  drm/msm/a6xx: Fix GMEM range on a680
  drm/msm/a6xx: Add GMU_SP_RF_CONTROL registers
  drm/msm/a6xx: Import a680 hwcg sequence from kgsl

 drivers/gpu/drm/msm/adreno/a6xx_catalog.c     | 58 ++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  7 ++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  3 +-
 .../gpu/drm/msm/registers/adreno/a6xx_gmu.xml |  2 +
 4 files changed, 66 insertions(+), 4 deletions(-)

-- 
2.56.0

