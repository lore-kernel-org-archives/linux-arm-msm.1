Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603124;
	b=t2tvAZqhUDtIX8ThPFwCoVA6AQPVaqH/zm1SjoYEuUrb7b9fQ0ET/DefV83T9/+uyJT7
	 8aX0OIynqAZoPDs4T8wY/GtohMUwUDqgFcvwCLDBkQU3CQa5mm0FvB0I9Xi2r+DsS8aIe
	 80QHcanU1uFOyqi9acvdH/XE+1TgY5QkN044jutJVZoQOcVttGgEqm4+msnGG/b7i73tv
	 EG9vzehDyUsYf3+KSqrSZPwtjlpYGSaZspTfMT1yFzinovSTArfzm32/hlyQGQBeN31fd
	 XkBh7QjmrTRxUnliWXQPLha0TTa2FpTDjer6RMMEl9ZiWoeMi4yzoYvyQlw0AshKzmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603124;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fzicQ3QTuDErVEBVTep9aXtdHMEI3HyITXZ2yUgy0/Q=;
	b=YY0tuSyu1G9qO6GV5j1qgoPfA5WLxed9JqZTlayDONOg8IqqB9DZ2NFMPtEhGnb+Meqi
	 WbqVXXtRN/l/mVw1UeO0A/cZ5H7+z6uPxT3Ait8KoOmSqpMfwGml5MbzL/OfEEh4pLMvd
	 ZMz+ccHYUAB3a994KG21dOWTW87vViB7Ph7t6T+jId+CO1H8Oz4k6tEs2ahxF52j6vCEe
	 hM96oIFSJar9cZJgpNeAm2kkSFbvYRETTzIN7Nzb7kbpbkWyB/MFgd5aFe06CbZR27Fzl
	 uJ316rJaPqL77hGw4xQHVK/aDSjAbI3667CeCvuUNZbcpuvvOOda7+K9CIqvVAi4vwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oKFrx1JK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MLfiqVcU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CAD606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69CAD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oKFrx1JK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MLfiqVcU
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mlaP3611422
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:38:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fzicQ3QTuDE
	rVEBVTep9aXtdHMEI3HyITXZ2yUgy0/Q=; b=oKFrx1JKXh7wg7Hbh/H93858FAt
	UH5xZQnK6nqwNikrqK4nKFQaASqArhPXNgc+vBf/J7X7rDngR0H6KprAfYJ4G7CE
	aAcDe/jGB5S7qbHJFrnpmDE1A5MKn6ZGOdYq4yArhMWBJ9FfaU3gNeTHLNVnVcTW
	8i453HHDP3wMBlEDWTR+p/f3PN628tQJSLMETKx85x435wWhtAJIJ+rK/2RWm24O
	USWegBM9/fmrNmtHF9UpYFTLV7aE6R7h3CYiskyX7a6gnVA6ayyiLrQXvNq1gJNk
	zNwTjwA0XDYLF+7sh7sAhCDdZYkLqnrSgOKGSywkn61LBrMhWgdOwkjl2+g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsb6d6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:38:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94960131b4eso154345085a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603123; x=1796207923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fzicQ3QTuDErVEBVTep9aXtdHMEI3HyITXZ2yUgy0/Q=;
        b=MLfiqVcUbTrLe3rSh+xiEdB7i415t8acB1LtnX/eZOu3c0c43mDcg423GHibkXkXM7
         7pJArmd/hn8DgDMbsmTa8ElB7UWhXRxxhaLuKwqHNowCmWxgZuc02JflqqJVAuyP0LU1
         DygtPEvAMFTsv9bS+ruqYhOSAJU6XN93ITaH6bKgECV+0KspbK6QL4vOwZubh+b3D5U2
         Y60KMq1kdTsNovOdq670pJfCtW/tQodbRy5/Lzj/k203gpUR98zDobQQB/wx2yr1wTsf
         JQg7WZxrk24g2LEP562ozooz4u5i/imN3SPBJHKg7JdNGiHEg+VQ6lXpvCXq2aNNL1su
         W61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603123; x=1796207923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fzicQ3QTuDErVEBVTep9aXtdHMEI3HyITXZ2yUgy0/Q=;
        b=V6/yWBjv105a5IN3x7SsZ/j8VcMx4zjnJFmAuOtOsh8Ld2Hs7+KOYEkKF1tpAd0iV6
         4TyBlDnMVIob2jSpZPphOELCN96zN747lBkQWmqvexx1GAa4oc14MnjoYg/X//Itp6SZ
         T3TdO/nc5JaehlOr5VhryEVtji1F0/PNLZ4JHtYX0A7M62D9QCKsnQgChquXYPSvYMsk
         R6ZKOZHCNv2jn7xd1LNnngVGhCa3y1TXQ8a0xt7hDl8bLBcukrGPT7ccuCpkbCWf8vnG
         OUvIuscryoO1FnYAz5MQemW0p7OrprqC4Iw/1gn5B72c08LgWnNs9WK25GEQuYczttbj
         EuNQ==
X-Forwarded-Encrypted: i=1; AL+hErFryDhidWsF9TOGPzXI4k7Fx7WGuUdp8FCka3+2Q7RtWo0CPiJYWmankoX8YNhzgdwWAOfWuVsY6Q4xK+tS@vger.kernel.org
X-Gm-Message-State: APuU4Z/2hCuvhh3gCIbVuRhJXXEoJ6yaI49PyYebQC17DP9FdB3fX7E5
	Uyi0eDEZB2APtMpG8D/VLH6lbSxoEABVJOpTihVO6Xo0J2Zwa3/aIQIXpLAJSm8yVuVi/m5Xm28
	LAdf0OEWAzlckXUmBqrq3Z5qRWtZPZxFyRM+QOY79ilzPFaTW0tQSivEJxTq3K0OmKI0D
X-Gm-Gg: AZFdTZf++p745iJLJncJuDxZaKcaMFn9BkZXGH4NOg6pOSm5U21Phn1IiMcDy9B95n0
	Y6PQGss0IZe2fKJD92zNihXBl7aQVFRy0g11ewWM6LFvOsl03knStDZm8CCR7KPcuFWyE9GVy7X
	66SYIiPsUiCvZfCI+AQbl8xT2k3p5xuchpdZmdOFM0v1CjKR+IYUEl/hHkIC+t1dOYHvpw9eZeT
	zPmmpKWorfswerqUAeq+o467w+W4pNsv4P8wO5SNKLKxg8ydJFBPIZPdYWpBVx7/m1QtS0EtSjy
	ch7xMwuFzJxGFJNeapnmjIfGhx5qv+vpAx0zS1C48OuVqzPAJM1KmPayWs4MO0YgzkQ4wOWsmMk
	UJx2GSXrmcHgIraiB012E8gMwejx0yYrYForc99SmzL0hTVlVeaYwlilBHUw2BW6N
X-Received: by 2002:a05:620a:7001:b0:949:74d8:4715 with SMTP id af79cd13be357-949bab40c18mr2679226885a.52.1795603122569;
        Wed, 25 Nov 2026 02:38:42 -0800 (PST)
X-Received: by 2002:a05:620a:7001:b0:949:74d8:4715 with SMTP id af79cd13be357-949bab40c18mr2679224685a.52.1795603122064;
        Wed, 25 Nov 2026 02:38:42 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm34171502f8f.48.2026.11.25.02.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:38:41 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Srinivas Kandagatla <srini@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/4] soundwire: qcom: program SSP period on multi-master primary
Date: Wed, 25 Nov 2026 10:38:25 +0000
Message-ID: <20261125103825.936939-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125103825.936939-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125103825.936939-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: WzQyjqoj7tnEUD1UOo7UKnqteW0YswLU
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b06bab3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=_oLpC3fVWoo8R2-12qgA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX/A1wtFRJosWV
 gMvdntQ3zQp41TyKYOm3WyrKCbOkDSxTvvcaWK+Lsh/4HA8tnf0Ly9SeO3Rj4+5xvMQsdR1SDGa
 1qv0kcHhdOmzDwDzboJutjyeSGTxLug=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX30bKUvJyS2gB
 CiU4qzzBdD3aK6niloqhYt4fgqdliNBUQw7cdw3hbMNSKZ/rtWZT4VeAAd1u9Tk1rP2cyxmoL84
 aP8CfQwUXfYrBk9vMRESpY4W+dEKcSSPRfb5BfYqi/1AaEJg8gYMyquVClf8ys2gyOcSrTp/8/y
 fMsjJeZ5iRyrLauYyw+9B7O4BFUfpmmMF9fqP3wXUkmnNHYGsRxF0IyUMPOEIWnER2vk69poKCw
 l4UYO5dHs/NTCCuiawqjUSnmJ5p0zkEtb/HUIfOiXyUkblG9uUdT7C4uxyRJFc+GM8S6I3mZis2
 KUf+A669jluVuy1wGMeoda3b7t73NXEDSmE0ulzkZGZjRrlvpA2NGDeboGTYsCbCC7wgFUE2QRV
 /1zudjSERM8zNVEVAlqDluMugNKEhbKUPnpDNf0aMXRFL8ru/qjT5XjReaTQ1FlHmGmbKppYBoa
 Ouj44cUPKfne4I2RYWQ==
X-Proofpoint-ORIG-GUID: WzQyjqoj7tnEUD1UOo7UKnqteW0YswLU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250042

v3.1.0+ frame generators derive the superframe boundary from the
current row/col geometry via SSP_PERIOD in FRAME_CTRL_BANK. Program
it at init and each bank switch, and zero CLK_DIV in the same write
so a stale divider does not survive.

The primary owns the clock; the dependent mirrors its frame.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index e0392f3cda34..3476edd7c423 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -108,6 +108,12 @@
 #define SWRM_MCP_FRAME_CTRL_BANK_ADDR(m)		(0x101C + 0x40 * (m))
 #define SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK			GENMASK(2, 0)
 #define SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK			GENMASK(7, 3)
+#define SWRM_MCP_FRAME_CTRL_BANK_CLK_DIV_BMSK			GENMASK(10, 8)
+#define SWRM_MCP_FRAME_CTRL_BANK_SSP_PERIOD_BMSK		GENMASK(23, 16)
+#define SWRM_INPUT_CLK_HZ					19200000
+#define SWRM_SSP_RATE_HZ					4000
+#define SWRM_SSP_PERIOD(rows, cols) \
+	(SWRM_INPUT_CLK_HZ / ((rows) * (cols) * SWRM_SSP_RATE_HZ) - 1)
 #define SWRM_MCP_BUS_CTRL					0x1044
 #define SWRM_MCP_BUS_CLK_START					BIT(1)
 #define SWRM_MCP_CFG_ADDR					0x1048
@@ -1005,10 +1011,16 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	/* Clear Rows and Cols */
 	val = FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK, ctrl->rows_index);
 	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK, ctrl->cols_index);
+	if (ctrl->mm_role == QCOM_SWRM_MM_PRIMARY)
+		val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_SSP_PERIOD_BMSK,
+				  SWRM_SSP_PERIOD(ctrl->bus.params.row,
+						  ctrl->bus.params.col));
 
 	reset_control_reset(ctrl->audio_cgcr);
 
 	ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
+	if (ctrl->mm_role == QCOM_SWRM_MM_PRIMARY)
+		ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(1), val);
 
 	/* Enable Auto enumeration */
 	ctrl->reg_write(ctrl, SWRM_ENUMERATOR_CFG_ADDR, 1);
@@ -1191,6 +1203,14 @@ static int qcom_swrm_pre_bank_switch(struct sdw_bus *bus)
 	if (ctrl->peer_ctrl)
 		ctrl->peer_ctrl->reg_write(ctrl->peer_ctrl, reg, val);
 
+	if (ctrl->mm_role == QCOM_SWRM_MM_PRIMARY) {
+		u32p_replace_bits(&val, 0,
+				  SWRM_MCP_FRAME_CTRL_BANK_CLK_DIV_BMSK);
+		u32p_replace_bits(&val,
+				  SWRM_SSP_PERIOD(bus->params.row, bus->params.col),
+				  SWRM_MCP_FRAME_CTRL_BANK_SSP_PERIOD_BMSK);
+	}
+
 	return ctrl->reg_write(ctrl, reg, val);
 }
 
-- 
2.53.0

