Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597921;
	b=wsvmrq1ZQq4FLIYrOpOWhtBF0BpYsWb3JjQMJV183HJ0T4rTxqYObI+IrIKhhgn9JDw5
	 oDy86zg5ldqiRau+d8Cjt/uz0pq4ocKrLrLMJ0vBfhHlqiSjqXysCwYP7GTuxyOMGg6a/
	 OAknhQiughecxCVPVUleNmi+J65D4Sg3ePHl5dR7vwf1qUYiiZOf5QtIhflPXqopyBC2P
	 SOTHRG/Ej1M1kd5d4dC87hp6KI+mNDUCQUDMqM2dv113C52l6scsewaTZpRyUUsTuqNSM
	 xV3rJmTOmVVxxbHMx5t3Uvm6+rLNtVNJi+tIcpEjW+Fk6a862F9Ts+gij5xFfyTHgcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597921;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=gouNuXBJ/VJmH4mgiTD8Nh1fdWF8sXBHPydQFNSIqds=;
	b=2UsB3v7jKzN/Cj4GCZCTXhZy+wGCatvPqkeXxMUVTrl/U5twsge5Fct3dRT7VezZCfOO
	 yH8QVEhk1t035q3wjr2NOH3rmiCUcF6q9ptlLveh/P57rC9YITgDg36GPuBgvZewSL/09
	 TfYJ87DWAfIg2xG9uhOTtmVGpRQ4FBe5Mcu+0Zt6LN2FiTdQQ16mBq2yMVlRunVEzGTx5
	 2jbU6drhjm08iQrXwVuxL9+eJRlSy2xNdYhEa7R5cDAvUF33MJbbavaKIk3AY8bVaeBGZ
	 GVA8qyjimlEv2vLImk87Syng0820JHer8q6VMOoxGei+6A3+E20HcxivHTnTsrCe5wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=h2g8lWBD;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8616606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:11:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8616606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=h2g8lWBD
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261125091157euoutp014e94f3ec5468ee5b9cd642203a65df23~rPsr7jTr61562015620euoutp01F
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:11:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261125091157euoutp014e94f3ec5468ee5b9cd642203a65df23~rPsr7jTr61562015620euoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795597918;
	bh=gouNuXBJ/VJmH4mgiTD8Nh1fdWF8sXBHPydQFNSIqds=;
	h=From:To:Cc:Subject:Date:References:From;
	b=h2g8lWBDfQ8cCBjrkLIfA3TTO5sATZmuSXAcWdcZgmat0Y7E4tAXwIKKdwFE5YKCJ
	 MX9t1sT3ixMUsJ9EYuvAKwDV2TE9JlDjdkd3q3ocsgoe029hOKUWTM5/HRKnwM5S+W
	 WZ7U/SMYTqdq3/gzD9YKOiuLrsJDJUuEw71854LU=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261125091157eucas1p2f4324315c65e38343c488ea16ce3a2cf~rPsrcgERO2882528825eucas1p2e;
	Wed, 25 Nov 2026 09:11:57 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261125091157eusmtip29a72a29dbb07225364b002f3267a2fe9~rPsrF2y9T0318503185eusmtip2B;
	Wed, 25 Nov 2026 09:11:56 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Srinivas Kandagatla
	<srini@kernel.org>, Vinod Koul <vkoul@kernel.org>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>
Subject: [PATCH] soundwire: qcom: skip DPn_BLOCK_CTRL_1 write for
 unconfigured ports
Date: Wed, 25 Nov 2026 10:11:49 +0100
Message-ID: <20261125091150.2145177-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
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
X-CMS-MailID: 20261125091157eucas1p2f4324315c65e38343c488ea16ce3a2cf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261125091157eucas1p2f4324315c65e38343c488ea16ce3a2cf
X-EPHeader: CA
X-CMS-RootMailID: 20261125091157eucas1p2f4324315c65e38343c488ea16ce3a2cf
References: <CGME20261125091157eucas1p2f4324315c65e38343c488ea16ce3a2cf@eucas1p2.samsung.com>

Master port_params are filled in qcom_swrm_compute_params() only when
qcom,ports-word-length is provided in DT. Otherwise they stay zeroed,
but the SoundWire core still calls dpn_set_port_params(), so
qcom_swrm_port_params() writes 0xffffffff (bps - 1) to
SWRM_DPn_BLOCK_CTRL_1(offset, 0), which is outside the DPn register
range. Since commit 55207a5b6959 ("soundwire: qcom: add multi-master
support") this also triggers the port_num sanity WARN in
qcom_swrm_port_target(), e.g. on RB5 (sm8250 WSA):

  WARNING: drivers/soundwire/qcom.c:1170 at qcom_swrm_port_target+0x68/0x78 [soundwire_qcom]
  Call trace:
   qcom_swrm_port_target+0x68/0x78 [soundwire_qcom] (P)
   sdw_program_params+0x374/0x774 [soundwire_bus]
   sdw_prepare_stream+0xfc/0x310 [soundwire_bus]
   qcom_snd_sdw_prepare+0x90/0xc28 [snd_soc_qcom_sdw]
   sm8250_snd_prepare+0x2c/0x38 [snd_soc_sm8250]

Skip programming when port params were not configured.

Fixes: 128eaf937adb ("soundwire: qcom: add support to missing transport params")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
This patch has been developed with LLM assistance and have been tested
on the real Qualcomm RB5 board.

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland
---
 drivers/soundwire/qcom.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index d74986a3dab3..613679be4b21 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1205,6 +1205,10 @@ static int qcom_swrm_port_params(struct sdw_bus *bus,
 	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
 	u32 offset = ctrl->reg_layout[SWRM_OFFSET_DP_BLOCK_CTRL_1];
 
+	/* port_params are filled only when qcom,ports-word-length is given */
+	if (!p_params->num)
+		return 0;
+
 	return qcom_swrm_port_reg_write(ctrl, p_params->num,
 					SWRM_DPn_BLOCK_CTRL_1(offset, p_params->num),
 					p_params->bps - 1);
-- 
2.43.0

