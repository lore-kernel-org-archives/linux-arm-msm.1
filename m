Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983768;
	b=39Ho/h0x3OebZhqJy85YknmBbpy0j3T3qeBCxW5p2lRX8AN9Nzr+3c7JHtI48f/624bv
	 nnochDQJjHei/0MTvPmLEN3yZkR0A2VtLkrk6Op9f52kGbKENMSwev11ua6GgPbMh1tp2
	 cIb7Pjcsh1HgU0OozjD1I0zPF0PBE7s+VVaZoHKeCGOWAhzM03ErymuTMrT3F+OYLmGv4
	 rOdrW9nNHLfUt3j7P/4QyYUAW16t6IoDVZ5GaQyn9wTiQws+YzpyiyT/PInVMVbOKSbNG
	 OGvCG58aZxZG/Jkr4+hQAPrqTrFvVTheviZh0jy40Zf+EeyWLiNIkP4faeOR8bS/UNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983768;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0lm5kOt7PL3Mvrl2OibCI4467OpTHiJA54eDzM+N4uY=;
	b=eJHaBxz5/3kJ8eoFcerChfH0E2EpOHjXUe0EOWFzsiJaAHlTXyMBvuaKWMLta25CjHAq
	 CHj+c6TCXvEf/27SsAxEyAPfo5lV2vsqOrJdNrX+fVXfJc9rMedNzWNaC5nrAHXToXd72
	 hCmZGL72QcMLN63BmST5x2TZXP4GJsMTKw7pzstKe8JphsZ5iLZwdhJCucdRcRj9403Xb
	 bB4mLRH9/Elh2uEJd5ZIcsdLhg0vctQfFwvvqtZPGpSRcoEXRtv2tQDpRTGUixxLxp1qm
	 WBx4q+goUvufX2jc3JlP2g1NlEwD2oBn/KNFLqwMxW5Shcy5sjPAybghWlFf2/nf+nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Djjr3Fsl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WcfFPeAO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BB5606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28BB5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Djjr3Fsl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WcfFPeAO
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V64h2603443
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0lm5kOt7PL3Mvrl2OibCI4
	467OpTHiJA54eDzM+N4uY=; b=Djjr3Fsl419haDKoGerD3sR+aAULT6pjV2ByTZ
	wifMVxZEqQ0PNbq0yW7CwQVXsvBinseQT+kBfHbN9d7mMBwK2EYIR8n6NREpXLOz
	7kkvKdqaIM53Zj/950dekn+fNwLHlzvE783ILxdjfOAat/q7WXJa10WfKcafw48M
	pb2BckBm4a86hB+JA3n+RKMcV8pF+H5lONadBjJl8NK0sPE2Kt/37a3SluZZy4SR
	HhZME2GDBqvvDXlfXZsVxfn6/Owde7440L9WURane3ag5IgHqsGBYUtn3mSMz/4c
	o8Jn/psBTgNaBZYDZjQrK7GFnZOoou+I1ZeRVKP1MzzrbydA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv71kxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:36:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2efe8f2bdc0so6090945ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 22:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794983766; x=1795588566; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0lm5kOt7PL3Mvrl2OibCI4467OpTHiJA54eDzM+N4uY=;
        b=WcfFPeAOR5ok47huK4LMvLChPmfU5Ak1AO7E1Un8g424DngHGRT049XeVZ7i5wMOaR
         P9Lpsm1z0QXhHIY7bZmYz/QRrRmxvRlsPoY0Dp+kJ7Hh+vaEvES02dttgsUNfBvbaiaf
         wyugzRIt2pxtpReFbzsCLlTwHE8701vZp2AjGJ/rj0FUqYfY3YkGA604NQA4Q++Vq/NC
         No70nvv5S3Gtxic0ij4KIXr8rB6K58QSHZJfpCjafevicgHwIJs3nlT7vLwBa72NC7uy
         kT2F8WDBvTOtfwYkDKyz8jEh5AQckHXECGjSyhm6b55PILdkuw82KQZYwm0bUsE5+Eh2
         p1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983766; x=1795588566;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0lm5kOt7PL3Mvrl2OibCI4467OpTHiJA54eDzM+N4uY=;
        b=LBzO2dKg9wTpfoHcK012DNV0WnHxSiIZqeo93r7/TujlQnVl4aFRmQF2Yr0XkSCsa2
         6ytzWxO45OmTRzJo+BJkJnM+Wr6BRrTeNi8cmb+TyALWvsFVDF3mUdqzura0Vc5WiX+B
         cWnXOxhHBChCMypbx1kKckZEuZt2yVQEdX+JMME+9gwgZiek9qFpGbGufWSuWUneKxPL
         XgSfDwSKXdlY2AMY3tUkCt3rwJSrup0nHJ7HSu8LD2c2zedpPQ5IUpHYElaBcgkIch3s
         4ktBW6y0cjvbpmFbtIDoNQRtGZ5rS9tBe62n5tK2A6I2LbUZWNO4Lt742YrLRACF/e4+
         DwsQ==
X-Forwarded-Encrypted: i=1; AL+hErH09h8Xxxu2PRyzmFKq4yXsk+2GO6LPMNHZIDaIStyhXllqGzwK9fvD3tX4DaL0K/zylnsIAKeSDUoP7rMi@vger.kernel.org
X-Gm-Message-State: APuU4Z/pI/WK6JhoM2xVQo8LCgmsgfj7q7JSG28A9KBievrcFEAIHtWz
	0k39ydcCZ2F5ROL3tXjdEeOETz3p3TDsXZdHDUy/yGbB9Kawi0goD4CFOYcKy00Zjosr3W0Kv0g
	CuOW7p1287wBzBYu/TpBIOtEezOzYWSEUbsv3/lsPRIkWhM4vIngjRk/lyJDQXgdbBjYz
X-Gm-Gg: AZFdTZficBLemfhf3G4GyS7q5mYkK7FN3fJFr6kogjggYhCcqs7nrHLfhHatkKGTHnj
	vfLChIUKTbyKHqYzP6gl2VhaTNGED+XtzaI4FAcWNPGtsVatyQOI48Nu1LnxLroxCxMddujeWXb
	WFuQyKHhKZGzEHmDfkCFcDKS+3rH0SgT/QCa1oEtZuRAPIWk+XAAHys2JwNZhoze0dCmlWYKILY
	pKQZ7Decar055VdYvdtcckiz8+TtAO/kndeTyWDfYgGU6sW07UDsQc+nqhZIrHaW/iFC0Y5B4ws
	2BUZrvW+AkKjZ45ZXCdPc3vPGyd9dR3yKD6Ppe4ckYlVLG8567P2IsHXCifZ5+o7uwkmGKmV3q7
	5UlQG7lWzsFh1mxRyxuPrqot2HNmv8gnLv/yHSq2lwXUkM5TfEK3vNT6GxhIFnxNi3W0fAWXXfQ
	eB33+/
X-Received: by 2002:a17:903:234a:b0:2ef:e13e:779c with SMTP id d9443c01a7336-2eff7100df7mr17677035ad.6.1794983765787;
        Tue, 17 Nov 2026 22:36:05 -0800 (PST)
X-Received: by 2002:a17:903:234a:b0:2ef:e13e:779c with SMTP id d9443c01a7336-2eff7100df7mr17676805ad.6.1794983765320;
        Tue, 17 Nov 2026 22:36:05 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62876a6sm7337255ad.63.2026.11.17.22.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:36:04 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 12:05:57 +0530
Subject: [PATCH] media: qcom: camss: Skip disabled PHY API devices
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
Message-Id: <20261118-camss_fixes-v1-1-93e5b59e8757@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAExH/WoC/x3LSwqAMAwA0atI1haMf72KiJSaahZWaUCE4t0NL
 h/DJBCKTAJjliDSzcJnUGCegdtt2MjwqoayKFtE7Iyzh8ji+SExtcfGVo0dPPagxxXpDzpM8/t
 +AT5BiV0AAAA=
X-Change-ID: 20261117-camss_fixes-4f15a35a9f18
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794983761; l=1805;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=te+8IhW4wKHIeYTOHY0lq3MCORvUXQMMmr3zUOoMph4=;
 b=HKEHf1Ox5Ci5Q5DOX+4gMGNPjplTkTWQdL99fQPrI0XMGYLdEePwfvkw88rtB34MbfLaUSBAU
 eHszWNzHtjNA1hvCxBaJknfJ2zec33P0Y8txAmJ1gxoQb+ott/QQWZz
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: rynw01_IjjCR3UAubIXGzJeG0Q7I7iwg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX0ta7q40E80D9
 hAZfhyj2scK5rW5jckocDmPHDWAk9THTb7IWNJoi3OOOlxnFBE+3tEYpFs7jx/2yTgm4umrtMwM
 e5xYN3J9a3RIV5lyAe684cqtfQey81rkoeyo9hgxXLReUxSivMo53AN1tOc7+u1p30KRUaJnGaA
 XeJySGrYoWF/6RxIdFVQt6u8NZZJBu5ceLMiqor1KjRCOPwcXlmkZVufOYGnsjNSxQ590Ft+In8
 hJESGoMCGKEPDOK4ToQGbtsf0fhT34m1RzVbEUmjauGV+WsRnmvQ9j7MyeG3uZ9a3JkQS6WMZp2
 5Va0LCr+w4o/CeUIATgFULYtovbQc3E9SyOJJQC/G3hUxFK3IKHZprQXBGUck7il3uAtO/aQNKa
 mkGxxzv020PZ/yuIjI7wcZYZAKC3oHf2dl8bo8crtMuXxz1/MZFMDtGRmlJCqlnt7uFQc3ZCyA/
 3oY/MjRQaWrZlL5XMWw==
X-Proofpoint-ORIG-GUID: rynw01_IjjCR3UAubIXGzJeG0Q7I7iwg
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd4756 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=HOR-2n2DdBinLPp7n6IA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX55DzT7zeDzYS
 MUSQyv9ZFgUN1CP0JT0XDQauV9vHtH7+MLJ0RKEGy7fBNYE1vArZic5ejvM1dduzlc+XSnjw1tG
 Lek1esMl2FzGIrOTghtXtqv505v2nMo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180026

PHY API based CAMSS topologies describe CSIPHY as a standalone DT device.
The old availability check only looked at the CAMSS endpoint node, not the
CSIPHY device node. Since DT normally disables devices with status on the
device node, a disabled CSIPHY could still be walked through and its sensor
path registered.

Check the CSIPHY device node before walking through it.

Fixes: 0ee6c8a921b1 ("media: qcom: camss: Add support for PHY API devices")
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index f8e5cf9f3ff09e96d3b48cd5628489715385cc5c..ddb47c3ee271d2202228b089c3179d134b5836ab 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4745,9 +4745,6 @@ static int camss_parse_ports(struct camss *camss)
 	fwnode_graph_for_each_endpoint_scoped(fwnode, ep) {
 		struct camss_async_subdev *csd;
 
-		if (!fwnode_device_is_available(ep))
-			continue;
-
 		if (camss->legacy_phy) {
 			csd = v4l2_async_nf_add_fwnode_remote(&camss->notifier, ep,
 							      typeof(*csd));
@@ -4763,6 +4760,11 @@ static int camss_parse_ports(struct camss *camss)
 			if (!phy_node)
 				continue;
 
+			if (!fwnode_device_is_available(phy_node)) {
+				fwnode_handle_put(phy_node);
+				continue;
+			}
+
 			phy_in = fwnode_graph_get_endpoint_by_id(phy_node, 0, 0, 0);
 			fwnode_handle_put(phy_node);
 			if (!phy_in)

---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261117-camss_fixes-4f15a35a9f18

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

