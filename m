Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603122;
	b=BZBhwtF139rX2fvLOojyg0H4d7RWUIWRxdofUjtCKBh3fWUJZOna8wt1DnRJOap4/8cv
	 eVny7GDteOiNVPPvFSgRuF1ys799nKKgCtrc4g8+VMIWyacbCdv246xVuqrW2zlEwlieP
	 pTrlgLgWw8PMtWmnK3nWogzZU+JQ1dO7UL8336i29f3dC1Wk8CfGOrPqQiGHy57XXNKbQ
	 65pkKyx7py4fkua0HfwPvTeZOXTJXM+8Blnpw7dmgPY+mSN6HVY7OGIJWFbY2atJf5Jxx
	 tGA7TPkXaQ5TC46hgpHoKrOz+baCrKYkAID8JtiDUPQcgFg5XpSA+1qHY8rC9H9VCLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603122;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+hZ6yiArMMGW/4xOEf/vgB/V37r5/1JqrJZy10W2Qx4=;
	b=wN0AvgywLNTbXnETYTBONdp8+GKzWut5F6y3flrgQxQnPb3Ps71+wfAPWrDCSRCMLRLK
	 dOApXnBo0/Dvs6ydumfD2bcgqPJusjNQji/mCcDjgS/9g3YXKeL04IwY6PSaH4xhuf1n/
	 Y4IrOahw+dAH4ytVXt/T3jyHIvcOx5/iJyJ53yDV6n9odI8ETF58nirnWkBFcuZu6x2QB
	 VBBZePdaFcyNyTGPDpPM0DKMHv+euzoVJlC6nlj8Dggz5vKpkzWfRO2lrz+GGOlFyvWGc
	 b6DKw0sq0nasBYy1Q2JbkT3RlRrmNM5jDvTDhExzFYF22VnFbS+4M7b6ZdxNoCNoo1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ohXFrsaC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Pz/MkxiX";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2036606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2036606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ohXFrsaC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pz/MkxiX
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mAT5115100
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+hZ6yiArMMG
	W/4xOEf/vgB/V37r5/1JqrJZy10W2Qx4=; b=ohXFrsaCJZZOCfG3HGTW/uKYT4+
	0nQpEVTZUyRrr8A1sCqUajvSxC+WUmgHJbAlW19DR+L60bILvZwpSNI2Zy/uafld
	dxqcfBHyORRp6WmC8zqXii4p3uVyXlW53A7e/Ed/hrloyxIVeJm64sqffckEWKJ2
	AjgtBKSmdCrxPbofMWCnwaVmsk9d4wXrT+wfbgqcbSW7lli0XtQKmZotCzrLzhn1
	hf/ojZeGFM0MtcGGzGDjflkl7Q1X0zlPYwtUhVtTh5zRwvyuEgkcIQMj9GmO4F0k
	UTEAKvtgFnK9Dx+zHJcIRIHas1fDioIW0758krbLY/whGvXCG8NZyxJ6B2A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxkcddr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:38:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94967c6d4f4so611622785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603120; x=1796207920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+hZ6yiArMMGW/4xOEf/vgB/V37r5/1JqrJZy10W2Qx4=;
        b=Pz/MkxiXKPMxnpbAsl4sTfEoGSVKuz5rTdXUgVJDuwkBbLnO/f4KaMroOwIUsb+NyK
         I12IgE9DIanlfbGUA9paTigU0/+93DFFYP5pIu3cMTlrfik1oFiX4u6sLYEf1IH5Jv4X
         vki5xDaXdffBl1v3b7tFowYk31joh0np0wwPh4N2mXaqndbt1dYmdtVL5NYTvHDZ2mFy
         DBRYVEg8SN5hgDLxX+WO6QnfPulQo8RaFR9z0UGun0FiTGVv/eazmqwnhAFfcPAbQTcj
         JQ/VZcyy50GUl63e04vyfORC380tH/kERD3uGQhbV2LiKu52TRnNhEgqp9gJaHhUTGqC
         sGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603120; x=1796207920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+hZ6yiArMMGW/4xOEf/vgB/V37r5/1JqrJZy10W2Qx4=;
        b=sDIGjh/hPzjGe8PYRH8PzFuT1GyxZx7thcV3lQwHmtOHWrXvwIs3e5Ml7CGPt22D2X
         4KayYnI66HqYxt9opQzAfxMMli2jvkO2AQDq1ESYj5XaoKwKRU27SNPSs/GZ/BV3QYAe
         y35/POADskZSmymGfmByu8a9bmCa5qL1/KHU82HRGMAzULGolwWYLo8A/pKsrjkiyRyj
         QpAQ/ZsZK5JyrzyhjWGAEe80knHS39khOZx/DuNdvvXQ6wrDFHxca41OORhSHKleQy0M
         dwyUgtqU/d8gxWiqGLs9acjm+vcoEQIosSv8KguXoFSgYl8sG1wnBwDM5NFKpbcq4s62
         31Gg==
X-Forwarded-Encrypted: i=1; AL+hErGsnTAryXz9JS7mAjKm6FkSB3PsJQDiQitrK2UfS9WWG8R8GCkCn+2ENU8JxlT4wAGosAeufb9gnoWplxH0@vger.kernel.org
X-Gm-Message-State: APuU4Z8huJxNi8J1Fd1+1oaC1rUMBNumRspaJX7wrtBi+ckehhcFFQ8W
	PVydDy6BxMgphuf9JsMZyYQ0WuGytvZ7YX8Qp6Wn1tPxUtWeBDi1pBe0Cck+tkzUTJXLmDTS/ZL
	EvC+W1PQG3DqVEC7Ik16tbSN0VALI7nHe24i1sfJ1H0LE0kTmlZNcUJCLFKf+uvpYQkPG
X-Gm-Gg: AZFdTZdZNJ9A7eiEX9OmVGfj/Hfu/bGy6lelfJ6Bb93Wb+92Jknjh/iedGgwX+ZMO3a
	2qHKN3K00bWRHdHKmL2vo6dqcL0dt9wcc6LdiKwBLn1mDkC9WfiMlg3STEYw6BGLeod2GPntovh
	sWEAVb/lt6Vtrml4jJ28G1NgmVN4JEWFhfO+OBbmW2RyiQulnB1YgzReYM0xZsS1rbdNSDIEBQn
	DHb4eH2lN13Qm/llGXsRTcSiNLgLt1pb5OTcHX1wj6s2ZHf12tEz9FYRQatTKZTICbpkzmEuUUY
	33nW2wmqm98DqPDPm98KfytzlCUAz0QheTUo1pmPb+fmHlwR5tNVSsjGFmLKoWlvkuJjh2MmD1/
	PIT1PndWOrB6llbh0gX0MsWRK33oHaTPX3mquZyAvA5sqibYV9G1SAq+/e21YiYBL
X-Received: by 2002:a05:620a:2a12:b0:93f:102:566 with SMTP id af79cd13be357-949bab5ee1fmr3046339685a.67.1795603119949;
        Wed, 25 Nov 2026 02:38:39 -0800 (PST)
X-Received: by 2002:a05:620a:2a12:b0:93f:102:566 with SMTP id af79cd13be357-949bab5ee1fmr3046336785a.67.1795603119456;
        Wed, 25 Nov 2026 02:38:39 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm34171502f8f.48.2026.11.25.02.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:38:38 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Srinivas Kandagatla <srini@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, stable@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/4] soundwire: qcom: skip offset2 write when unset
Date: Wed, 25 Nov 2026 10:38:23 +0000
Message-ID: <20261125103825.936939-3-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX0yh04A68xZP+
 Gu7Bkci2lGjfXwhWTLOgvzXYVJ0my5a0jRBBwtRXIgX9lSF7oU9bVWB25p/MfTuABpSICBqpb/C
 dLnx5351DTcNz2XjZ7iikRrLymxF3q/ddY/t9qkg7P0/6Gr1grqxB9uZv2YDSlOX6wdmDAbOPht
 rHbsdMN8KhT5VxPbHkkaGf6rTE3suUHp80vIUUgid+PxNYpCvK3cC5Zp7XvEUTey3bQZ7HMWXUf
 wIQIRlpYn3ON0TxUQ0Y06g6GRO363LBfT8bMSk5+TaG1uWo+tp7KTPS58/A5xP7wPfSp4yGibxx
 /uAIlOe1WkNrHwD9IdlD7I44+ho4LQXf53CixuiL6BAxAc+76re1Qmm6QdbpPpmf71VgVXqxlAa
 4f8n3LuuNiNRz7pf4vCxfW7w1+np846HPCZfJyo+4gqqymPkcFCp03cnUtBJN8Qzo4/+HCoP/v0
 lRAQwPxuzlmWsriXVuQ==
X-Proofpoint-GUID: IIVoLliVgpxC4wB4u1NYrPPMNI0GwKIz
X-Proofpoint-ORIG-GUID: IIVoLliVgpxC4wB4u1NYrPPMNI0GwKIz
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b06bab0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=h8pHtkhTcpIEMHaiu1IA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX33OoaAsFP/nZ
 UKe7jRaYmqnp9AN6UBfVCC2d/R2bN76T2f/qFp8YvkjIaAhbqZ1+k9BCWp2m2KQbYtuWXwu/7EJ
 jbwmOuiSkR/UE2mmG6KUYetCjMp7mAk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250042

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

qcom_swrm_transport_params() writes offset2 into the port control
register even when the port does not use it. Many DTs mark such ports
with 0xff (SWR_INVALID_PARAM) in qcom,ports-offset2, which is then
programmed as an offset of 255.

Skip the field when it is unset, like the other optional fields.

Fixes: 02efb49aa805 ("soundwire: qcom: add support for SoundWire controller")
Cc: stable@vger.kernel.org
Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
(cherry picked from commit 65aca3ef0d1fb2f6b20892f0d1a3a1ef391ccf7f)
---
 drivers/soundwire/qcom.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 95444eee4c0b..b29e2aec4ae3 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1232,7 +1232,10 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 	pcfg = &ctrl->pconfig[params->port_num];
 
 	value = pcfg->off1 << SWRM_DP_PORT_CTRL_OFFSET1_SHFT;
-	value |= pcfg->off2 << SWRM_DP_PORT_CTRL_OFFSET2_SHFT;
+
+	if (pcfg->off2 != SWR_INVALID_PARAM)
+		value |= pcfg->off2 << SWRM_DP_PORT_CTRL_OFFSET2_SHFT;
+
 	value |= pcfg->si & 0xff;
 
 	ret = qcom_swrm_port_reg_write(ctrl, params->port_num, reg, value);
-- 
2.53.0

