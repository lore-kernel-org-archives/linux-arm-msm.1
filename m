Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316222;
	b=DOsMuMmpWd860cXpjFsF2Bv7i20wjGRyOq82JWFGfCLAxOIkWUAfp672WKEY5Xzc1yVJ
	 o/1YaRVpC5OBGhLEuzVaRTl3gfBqO+HbhupOYKc4Z07sgaHcTpFknfxqqxMWXs5PyS60K
	 xpYs4rk3FEihS7psW3KcP1Yljnu8a943CiafpksuPpUlsXQ9bG077R/APMl9oJb8yZ7SC
	 7FkWaFSPk6Gq2PQ7KtMKWpooMQ3egUHX8ZVVaBbCYblY+okQ3OOSfxOTWMEFoSiirO1ZC
	 4Z5WHmaeEZnMMq4/NIBtt+l3AbMGMSG7Cqv/ZHZTdbt1aIZRh0tRKzOYPzC+1JZNv4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316222;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RpNdZRCvOUqczt/I6p/62SfdiYMe0geYQBIESrCqGvM=;
	b=H8I3lHcmTp6rB3hTovE0PdlQHvWhVPv+ubd3USC8gUITRqNwh9WUVdhOAqb6NP5VZc8C
	 9G0GHcLkGFsqdlc4E7gdVdhNwLK7ZFcGDW8vvEvMp1nUJ5ZceCAIWnRqKgl+rhFXqr+Es
	 uhNZ1EPdRA9L9y/UV9jPRuEYg68rYK+PdEjI7M4yLQdqZWCsS1C3KpOQ0z4dG/mUkFrTw
	 KHRCapV0Qj+TxkGGkQBNA7ckexLZ0bfAWO8+2+94rL4bz1DLKF/LqUQZj3niSfpAmyqjK
	 wmIZ6nEpfkPfW+FaWA5ncRsV7af2dzGPh0tm2RF7XGTVr4oM3HwcKEtY24b6o5l7vSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K71w6Paw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nq6ghdv8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF8D606A331
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 02:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFF8D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K71w6Paw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nq6ghdv8
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM099rT3598739
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 02:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RpNdZRCvOUqczt/I6p/62SfdiYMe0geYQBIESrCqGvM=; b=K71w6PawdporSph0
	dnKuzUY4F29USvSCrf86yHj625sjEf14XoUba8J3V2lF1Jio/iZSLyE4RW2A5yUf
	PxRYAEkNM+mz2tiZ63EvyUC9At1Pl0PT6iJonVfQNJro4WxQ7Q6Hehu7XaoJA0HF
	tvr/AvbScps78NkPhtQsg6JKhuq1wXzVf0tp8pFadlU49zsFyEISoEqjNWyM/cqe
	p4IgsWcbjHjx9VlA3cajuYFZsoYMyktl96jPYtgvdgXqanrwyftNhOM90NqejHjs
	eBAJEXT5l05FJH5Fh8uQKUF0COBCkWxyDsUtkBJeGOiMypg7DCaTeCDt5zriihmI
	kalV0A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32w02k62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 02:57:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3056484eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 18:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795316220; x=1795921020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RpNdZRCvOUqczt/I6p/62SfdiYMe0geYQBIESrCqGvM=;
        b=Nq6ghdv8MvY7aj7tfhoUEUAlZ5do7jEfscF4NkgVUuGFBs/MjxvLD7WQb7mMUSxsDl
         N/wAbQclsc/vxW/YpziH2bJhSkyvzjbEzkHm3YJ8rY/Gpd8b/KkPfylI1qMSh2hRWlNZ
         J01q/HBfQYo6xiyKbRLe+fOhBD1KUqJpOFZ2xbXw0hwvrN5lrPKE6kYpSz4Q8AJFkGd7
         uNu/jPH/cfX+aHZJz1jZf3mC1EsHWiBSiP2uYGNrARY/Fclql4LQk6IZ2E4XkSYupvne
         NpyBIDSEGtIp4r5e/X0mxeI6xuJ2uGV3E1fcrHna1kZqnLxQdcEaCeB4NM4CCRVouGi3
         670g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316220; x=1795921020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RpNdZRCvOUqczt/I6p/62SfdiYMe0geYQBIESrCqGvM=;
        b=N0xqj0ygqifT8rNtHdLajBciZAeSPXRZOZrK2bNRGiTsAMBlAPwg67uz4TJT+rlwqw
         drH6UsqB6PeBx6Lp2CgZG9+DeOkBa6aR0iK3wsXtGkIufVFKVB23rW6TDc/mnhy8hla5
         ez6dEKvspVKkKXumsEJzB1IU6QMra0Ky5k75a3N1onwW9/1rKbTjbTBnrFoOz8z1hDVG
         s0OpJZ0dfJhMNk090wTIKybK/t62rLvBv/64rqhdMlQzcW7oWMzVOYNrubHh2/4F6g50
         8PlKKq8tZemsn17T7oxteBfzh+ZwMm4lo4bI6cmVoBY7lgpUf3HOuZCmL3xefpRRqI88
         sp1w==
X-Forwarded-Encrypted: i=1; AL+hErHLAdrQdKVwC+B0bF16HlZIxD6bw3TuHkwxUxuEcSkvXuV96h2yv3f7ruoUadrxlcK1KoPjiRUrz66lS9pZ@vger.kernel.org
X-Gm-Message-State: APuU4Z+kktyVeo0SAQ22nogeIuKQlTxLaZxpzVTcf+XXbZsJOm6Rl0Ig
	t61bNQNZuoXPC2GhuUj1mRfWl5V3+maLRPdti4nqvu+Ocj7ILc8QNbMfrwi0YFg7eLI7X0gqfq5
	QssslpiyJI/njx7IXMX4ZA3n3ppGRZUZQWcqgMoqNZq6VMgfiX/8UmNMA48H8d0t2nrDA
X-Gm-Gg: AZFdTZfSSXWbPm/jruC3FnqqVV7LlvjKYmcUoFj3+r5GQG3g3Z2Q9iZO9x2B51gOQor
	czB/lWCnxKur52gFId/UST+6ircrdTK6nhOTAEw6LWuL55eqNQNdToocPnp4kV7tjiQFfgiNype
	vr7DD9yG6NIHsNhmatPJFCCAya0dxckN1sJl7V5yHad6FESVyhBPOw6zV7MPymM+0df5Khrc4iT
	NNoA7BxTmy149fbNQR2RnFrmIADVb0GC4B+C/MXYvNWi0pFt3S9QVjd8qe9XiVPTgITCRmYEP2x
	5sBd76mLW6Ub7lTNaiHAHlYA0Sm0N+kwVyP5ftTKIo9KxHnVYUQZe3J3sixZ9Z/hAF1Ei2I2+TE
	AsLEwtUmG3pk/UdnJvmmwQ2NCKObFGJAUnOiHavd+eWJYiavs6b88YecptO1XaI/WVDgaGHjEi9
	m5NKOaJoHh
X-Received: by 2002:a05:693c:6010:b0:385:2057:eb95 with SMTP id 5a478bee46e88-3857073f2a3mr10087777eec.31.1795316219711;
        Sat, 21 Nov 2026 18:56:59 -0800 (PST)
X-Received: by 2002:a05:693c:6010:b0:385:2057:eb95 with SMTP id 5a478bee46e88-3857073f2a3mr10087748eec.31.1795316219213;
        Sat, 21 Nov 2026 18:56:59 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm312044eec.18.2026.11.21.18.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:56:58 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 08:26:17 +0530
Subject: [PATCH 04/11] PCI: dwc: Preserve glue-provided eDMA HDMA channel
 separation
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
Message-Id: <20261122-nord_ep-v1-4-6d8839ffa9aa@oss.qualcomm.com>
References: <20261122-nord_ep-v1-0-6d8839ffa9aa@oss.qualcomm.com>
In-Reply-To: <20261122-nord_ep-v1-0-6d8839ffa9aa@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Niklas Cassel <cassel@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795316183; l=1310;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=rD9zOfPOcAYlNN684/JsuvviV/gb5ok1TJTsrxdDyck=;
 b=/lOwFB1qjP7iTr8eSfhVpDz71Nc9Af2j4lHx6UdjaMj/dm9tVfScEt2jnKrs8S68TXY5KV5yF
 KEyzdXp8En6Dfq8cCoXNyUl6qyeeiGruxZavENr+qcudrrjvKu9e4aG
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX5wGCoMdqfFfB
 WfTP4Q4e4YNZHbdyTK34Oi7n8eDxGFGMXQOtLzGfqVWPS292DBcLUDOeakrNGtpSPtULVB+gH9S
 9umeIFnTJrxYc9AiN77ku0LWD5bjtWgTLk21jWb6xnOivHexOArSLsJqm+XsVi5RlTNRDoMnWpf
 oZujCe8A+f6tvTCRjzjHBYrIUlliqwrm6KQkD00D4wA8O81LteyH1Uls/DhbJ8jVkfs6my7ks4h
 nuFJc8KbTEox0wEr3X0ZB8JyJCiywr35sEzsLTVbG8YW4PJ0IRSWuqO0rwP0yxknQDtBlZU0JQP
 inh/c6d18Yg3brUr/Odkzn1P827qzwsaoSD7Z82FfF7AbJbHtIJTnztIAI82Lulk1ErrVjRMzSX
 36Xtw6pltjv5l0tpsuezZeH055UUmD+f52ehpDb89xd+RWFpM7R0vXJjMxTs2cEZMqu0Qwys9jS
 nxZcJt2t2JbJPRsjrgQ==
X-Proofpoint-ORIG-GUID: t_789MueqYdwjAsU5rA2FnQd7cZQy_NR
X-Proofpoint-GUID: t_789MueqYdwjAsU5rA2FnQd7cZQy_NR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX9rmSdnIw3aPO
 pAaQ/ouOUHMK2zjn7rcC74GjYX+PvLmd56nxAIqY0tWtQEUQEQcHw79Q7Ghf1BjKIk8mjx8pb9f
 waVCZgOeEo7W7n9Z0g8n+VXMuiHkMRI=
X-Authority-Analysis: v=2.4 cv=S+dMU4sP c=1 sm=1 tr=0 ts=6b0259fc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Py5lcOcq67Lbq8UMOfUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220011

dw_pcie_edma_init_data() unconditionally programs the HDMA channel
register space size (ch_space_sz) to 256 bytes. Some controllers space
their per-channel HDMA register blocks further apart, and a glue driver
knows the correct separation for its hardware.

Only apply the 256-byte default when the glue driver has not already set
ch_space_sz, so a glue-provided value is preserved. No functional change
for existing drivers, which do not set it.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 12f102f48d5d..d55d4213be33 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -1041,7 +1041,10 @@ static void dw_pcie_edma_init_data(struct dw_pcie *pci)
 		pci->edma.ops = &dw_pcie_edma_ops;
 
 	pci->edma.flags |= DW_EDMA_CHIP_LOCAL;
-	pci->edma.ch_space_sz = 256;
+
+	/* Default unless a glue driver programmed a different separation */
+	if (!pci->edma.ch_space_sz)
+		pci->edma.ch_space_sz = 256;
 }
 
 static int dw_pcie_edma_find_mf(struct dw_pcie *pci)

-- 
2.34.1

