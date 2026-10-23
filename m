Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756747;
	b=de5al9IXYBTkxCDVyjGlTfWZ9IuPDpQy0bMNo31cT7o2xDThr/tOABalwMGh+/REcIBC
	 DCghzQhYMjELRc5t2SQ6eSq1Jh+3BD7+5BYAVJFQ3kkrLj8Z5oSnu+1CHkqj2HD1AGywj
	 xC/lEGyAHitrKb6Rr2KDe/HLWdXXa1+0PlVeZHkvHTDFoCJdQBkW71WC6eL5zfMCIpJNJ
	 BVe+TNjGFd583HmsIRrlSCmzNIvNasw3mshU5b1sJdlmArV1mP/oKnr86eQ7MVWTrx4Yy
	 h1ox/6fV4qhBt19XsshDiG2/k6F8lIYrzDRS8/xtnCY8Cm3oRxgufjYHs5AUByasWlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756747;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=r1RgB/u4FYOFJ9I2v8cUNm1qwVXOej45AdlSUJ7c9/o=;
	b=C1ZwjQtgI2g5BeJnDgbtrohSRi7etZivknxPqaV2iRoeG9MfbjNWR/oki8PSUIb2b+6j
	 lpXi1aX6Wr9LSZp3ehLvCV1C3jAoBrV3tT27yaqwONnFJRyPN65xSxDIeBoXxySegsriY
	 x7RGRUAIfneHatM+NSexjdCB6j1TMnUlbzuSle4UO+KlmwwUeY9vQk7TRCjtk1784/dxa
	 V3ZbfqE7mnildGNh/2DZ/nW7iER818/CWI1Jc5HUhM2+rbqEOBGf+jLVjIjU6KhuE3H7m
	 atDpjPbVvB22/UrNDo8GRfHKlJu7d0rOBui9w+3SmKAc4/IHo4zZ+zfG8D5fY/NvJ6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eKH2JYuL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dl3qYVK5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6E0606A32C
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 11:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC6E0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eKH2JYuL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dl3qYVK5
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAXDe2489809
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 11:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r1RgB/u4FYOFJ9I2v8cUNm1qwVXOej45AdlSUJ7c9/o=; b=eKH2JYuL8vVAOhTe
	EcoKGbCgLCKN3DiGqlfrYPLTKRtWNvrJJBwqV/uOQMdg5ErLJQVenDE85CMtHD12
	As5qVQMIjkByp4QI720JNVUT8CSpS3L+hgoX5GGHR19zbVCTZ5NDOKOO1nAn+ere
	wUn7IjSg3frFL8I9RuGWw8j2bkEpGP2ZH+Xx4BQbxrqiAch1tREnNPDjt3EoOBND
	2KD4griMj0hRV0iJ5D7cvbkey/JnRmuW1kYYRnFXwSs3uBr0KS6Vl35SPAdurUpt
	UVH2S3x1vY0BdJuM48KPa57obMNvLpnn8iwjSXcuy2FJSjXbT5u2FZWm999Vu/Ed
	OS5lng==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hftygar1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 11:59:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c3c370b17so1289116eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792756744; x=1793361544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1RgB/u4FYOFJ9I2v8cUNm1qwVXOej45AdlSUJ7c9/o=;
        b=dl3qYVK5M9pOXYNGvRZdeao/OB1oyoCTgzPO03hdHDLIMjF/FnFoHXga+4QAbh7hl4
         une4OVS42Jczi4nU5ZV7iD8pJGNLM0HYf3LDfELV9O1GzbkairwxHzePtn3wdUVeBcUj
         5s0EbAI4O0/IIU0hAvL/hcwX1f3lCanzfBXUo0yXIjhuxUIesTqR8Q04/JNZeySmBAAH
         B+yR6QUrdTu5EFyv76mzD0RvwtIkxr7vg0us4EyS36i+RUe6FbLX8sYitjq8BDTZkQxU
         y4mr6lXR2WX1LJfZhytBP1+NcFbVX2oHKoZcxDM3WHb9VoO3hMTjUUJgxAUBHuTkUgj3
         Yz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756744; x=1793361544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r1RgB/u4FYOFJ9I2v8cUNm1qwVXOej45AdlSUJ7c9/o=;
        b=KCOwd1hPWYCUQh0duqkS7InsRjJbA2n1UdV/lyPCOXKYlsphPtTBOJSijJJctDkauX
         YUuqQ+Mi8dBquJ+jeIvqRtRsVZs3/rV+TFBUXzJA4npYd3W1+cOt/OG+o/x7GT6BoLTl
         P9scEb0j8I1MXWN7Ri7QJUWvdtBCUvMn3wufnVqEdVCXejeZYAfZXK3gpgGlDFzKdJY5
         htdzUi03Q/6iUsQCc0ADfmhelUxVOVtsuZcawtbwkEp4adR3+BDl4BRXehMXSgbqJaSb
         LsixL1qA3cmgXLcheabEx4agN8wl662rYdzxyxDHUZ/LBZf7IN7W+ncRY1TKSh/a6oDw
         av1g==
X-Forwarded-Encrypted: i=1; AKwUvByv8/fcmtw3DkLpVIP0Fcel6/a4Ibi445hJnte5tx+3jwThFQFSSpW58QntvvwcTOfO9it2rRsmabD883/t@vger.kernel.org
X-Gm-Message-State: AFq9FYLuusTIlHI3LX49CINkZo5ZKrfCpdqyrACIVL7km5O9VK+eTrua
	73pZILpCQQFH8LCp5xpKL8AATgOP8WOGATDzYf9qk89FJUa+OxulI17ow5Xe9iBFxr+DVDxeYvX
	amxiCF4XyMh91v0wRwlLJahFYk74Snvo47rz7NV60yvglN2ZfffVkrACfWVec3t9TWc8T
X-Gm-Gg: AYBFou3ad7wDkHVB5kuytXDCZgiNh0ChJwYr/swLFaPLdT/Ofdh10rf1ykLM4AqJKXy
	R2WmM8mt0Q0RJlqkceUjJhPxSY14s/Dfj9L13we1UewGLep8Esultgyy8D6rFeQNFi4L7DIJLnj
	X0W4Yrd9WeucXnryP/Uvt/nMr271f7MbF+tOkm3jvamG5KhM6GlFvFV5FUEfP6W4Hel4gPDS8yt
	m3LEB6mFp6LckKhqhIVcy1NAG8Br7UufqAfHWcPrrxvHePwlbcYHnnYNdP7if2rQOXNDeLNd6iz
	BQ+qQ/sKit1UoUjrpFGZeubc4dL88A+RsCEys0pYrYTPvOzIuz+8T3/N2r2SQ2StJ/pFttmaxnE
	bW+2phmMespNJsWTtgEut+1R8gM3JcsnYxA==
X-Received: by 2002:a05:693c:83cc:20b0:366:703c:5f0e with SMTP id 5a478bee46e88-369d98cf32cmr3125595eec.35.1792756744190;
        Fri, 23 Oct 2026 04:59:04 -0700 (PDT)
X-Received: by 2002:a05:693c:83cc:20b0:366:703c:5f0e with SMTP id 5a478bee46e88-369d98cf32cmr3125553eec.35.1792756743505;
        Fri, 23 Oct 2026 04:59:03 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9d5ea64sm8786134eec.5.2026.10.23.04.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:59:03 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:27:57 +0530
Subject: [PATCH v2 1/3] dmaengine: qcom: gpi: Add I2C bus recovery opcode
 support
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-20260826_aniket_randive_oss_qualcomm_com-v2-1-93572b453d6f@oss.qualcomm.com>
References: <20261023-20260826_aniket_randive_oss_qualcomm_com-v2-0-93572b453d6f@oss.qualcomm.com>
In-Reply-To: <20261023-20260826_aniket_randive_oss_qualcomm_com-v2-0-93572b453d6f@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792756735; l=3967;
 i=aniket.randive@oss.qualcomm.com; s=20260325; h=from:subject:message-id;
 bh=PKo2E5lKF0uiNOiX1SRbwpsFnqDtSbzKLjXeWX31X+U=;
 b=brNNiZEDteQb4CFP7id0C5NhBneYvT2iQpHW1zf9NMsf6TrevSuuWss+WiONX9IDVOASzd1y8
 SG/khm7i2iEBgep/hlN+zjnGSgpJSZ+3ASHoTzh646TEM5Okxy2N7ec
X-Developer-Key: i=aniket.randive@oss.qualcomm.com; a=ed25519;
 pk=4o37X1ZqGbCO/T2SR8kq/HnWvq0yb1RUlFuNukovbQk=
X-Authority-Analysis: v=2.4 cv=cZpHPXDM c=1 sm=1 tr=0 ts=6adb4c09 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=6qpgm5iOkbbos6gE2JIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfXx38BxlEog8Uu
 txWCHi42f755t0AkNZ3CQsMU6ZWO84qPtgEGjdGOz/IpNCMztCf24rGwqiTDPMinJiUHrqzk1Gw
 gPAYgvKWn747h5NDSNXhPxuJf2QUge0=
X-Proofpoint-GUID: xN6XpP6-8DVMLQ7bzvwNJ5gfBH-KhPcJ
X-Proofpoint-ORIG-GUID: xN6XpP6-8DVMLQ7bzvwNJ5gfBH-KhPcJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfX8Ph++4ZYC2Ui
 ui1ueHV3iCQ3gCfbR0mp7IsuaOufLwqatB2mwVGYgmfg2gTPtpvffFTvC9mLTEKAtjZbp61E40J
 xCQ20CtlZXu/xk+ZlMkj9vmIHB8wydcEhJXtb1i2zzv7GG4gE/yy9FmkGFH0PYaoGf9Oed4wAc3
 Ji8XRk1gVGcxZe7jkpHlcG3UPLyiwK0yGn+jAAXN12AOYEsQiF5rqG6AknC627jOFZf6GzR+AP7
 1TzXJJALEVC8m4EirFGQiijvpOI4aO5QYOL9So28pc1lZH0zqPQCjOHTG4fZfXC7ApUqyW/prhA
 b/Lf0eQ0DV5+zIZIrAVYXC2m53lhO+7wqEW0JFsWqVrtM9ec8T8bf2hDLydhfzEXLY/hR9Yixen
 lyXEjRHek1HdiE51qzAzvxnFY/yvPgBzIJoSjrmMS0OgcoBLMGnbxIgujz5giv4fc9M2stoF8Zu
 YK2G20ArlRfkzwwQBYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230046

The I2C_BUS_CLEAR and I2C_STOP_ON_BUS GENI sequencer opcodes release a
stuck I2C bus, but the GPI DMA driver has no way to emit these
zero-payload control commands, so an I2C controller using GPI DMA
cannot recover the bus.

Add I2C_BUS_CLEAR and I2C_STOP_ON_BUS to enum i2c_op so I2C drivers can
request them through gpi_i2c_config.op. Handle them in
gpi_create_i2c_tre() by emitting a CONFIG TRE (when set_config is set)
followed by a GO TRE with IEOT set and no DMA TRE, and reserve the
matching number of ring entries in gpi_prep_slave_sg().

Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---
 drivers/dma/qcom/gpi.c             | 30 ++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-qcom-geni.c |  2 --
 include/linux/dma/qcom-gpi-dma.h   |  2 ++
 3 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index c41bfac65ddf..394e7287f6e9 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -1620,6 +1620,17 @@ gpi_peripheral_config(struct dma_chan *chan, struct dma_slave_config *config)
 	return 0;
 }
 
+static void gpi_create_i2c_go_recovery_tre(struct gpi_i2c_config *i2c,
+					   struct gpi_tre *tre)
+{
+	tre->dword[0] = u32_encode_bits(i2c->op, TRE_I2C_GO_CMD);
+	tre->dword[1] = 0;
+	tre->dword[2] = 0;
+
+	tre->dword[3] = u32_encode_bits(TRE_TYPE_GO, TRE_FLAGS_TYPE);
+	tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
+}
+
 static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
 			      struct scatterlist *sgl, enum dma_transfer_direction direction,
 			      unsigned long flags)
@@ -1650,6 +1661,12 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
 		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_CHAIN);
 	}
 
+	if (i2c->op == I2C_BUS_CLEAR || i2c->op == I2C_STOP_ON_BUS) {
+		gpi_create_i2c_go_recovery_tre(i2c, &desc->tre[tre_idx]);
+		tre_idx++;
+		goto log_tre;
+	}
+
 	/* create the GO tre for Tx */
 	if (i2c->op == I2C_WRITE) {
 		tre = &desc->tre[tre_idx];
@@ -1692,6 +1709,7 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
 			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_BEI);
 	}
 
+log_tre:
 	for (i = 0; i < tre_idx; i++)
 		dev_dbg(dev, "TRE:%d %x:%x:%x:%x\n", i, desc->tre[i].dword[0],
 			desc->tre[i].dword[1], desc->tre[i].dword[2], desc->tre[i].dword[3]);
@@ -1825,6 +1843,18 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 		nr_tre = 2;
 	if (direction == DMA_DEV_TO_MEM) /* rx */
 		nr_tre = 1;
+	/*
+	 * Recovery opcodes do not require DMA data TREs, only CONFIG
+	 * (for set_config) and GO TREs. Since gpi_prep_slave_sg() is
+	 * shared with SPI, verify the channel is I2C before accessing
+	 * the configuration data.
+	 */
+	if (gchan->protocol == QCOM_GPI_I2C) {
+		struct gpi_i2c_config *i2c = gchan->config;
+
+		if (i2c->op == I2C_BUS_CLEAR || i2c->op == I2C_STOP_ON_BUS)
+			nr_tre = set_config ? 2 : 1;
+	}
 
 	/* calculate # of elements required & available */
 	nr = gpi_ring_num_elements_avail(ch_ring);
diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 5cc47b670bd1..60b6273f538c 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -34,8 +34,6 @@
 #define I2C_READ		0x2
 #define I2C_WRITE_READ		0x3
 #define I2C_ADDR_ONLY		0x4
-#define I2C_BUS_CLEAR		0x6
-#define I2C_STOP_ON_BUS		0x7
 /* M_CMD params for I2C */
 #define PRE_CMD_DELAY		BIT(0)
 #define TIMESTAMP_BEFORE	BIT(1)
diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
index 332be28427e4..b9b75c302825 100644
--- a/include/linux/dma/qcom-gpi-dma.h
+++ b/include/linux/dma/qcom-gpi-dma.h
@@ -52,6 +52,8 @@ struct gpi_spi_config {
 enum i2c_op {
 	I2C_WRITE = 1,
 	I2C_READ,
+	I2C_BUS_CLEAR = 6,
+	I2C_STOP_ON_BUS,
 };
 
 /**

-- 
2.34.1

