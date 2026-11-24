Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516553;
	b=Ss2Z/hB5HafPH2fTJp/VsMZapnC5DNhC3AglRD8WCbPTq76UmT1mOJR9pMwrpg4HoNYq
	 bTFBROCODseFC0QvJ/fXNHu1q0U0H/P4sMiztyiYoC3+T9suE3auV/Y4ZEKW+vG3EZCmB
	 1xykI0Zvg+jHu0rKe/30Dbu3C1h7ovRtOdFR+SB+++FsTFBbrbiiz1hddV0djBcRayxi5
	 CuuUDjb14pfwEbJFLgnXL6tglwi/Y8ybRo7eeyvPZV/DsFvOj1k4+jMjCYgI2mm9FOyeU
	 iazFUJ7OyITnnJZu+R/34ZWgLlPYmcuflXcbBO+wagADq5lO6lgUU3CgoggXooK4fSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516553;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JX2/SMoV7CGstyBTRaz7NuWaIewG3wQxjXWL82vlo1o=;
	b=deIK7fuXRTQv6Bd3XbHcpLdeDoB9w4xGrKVlY+QVeworK7PQ0W5ysGbBzMZFPNaOkEXd
	 JzICavKoPqKXCxcLKR1w7Dw76z3ybI7QZA2DSwPUAfbOZjcm3AdjpV7jlfAnNSHRFhMZh
	 wta9Fu2fmdyvUZu01y4lSfRChqQKHkiJ1gTAc+8584Evv7cAlxFh2DJzzrhkWWQmG2dS3
	 0mbX6U9UmANuoOLP4bdNoN7rueoAF0XCKfzMd4C/JWQDCjiVSA0sw1VoKSiXaD4sMdh2c
	 0nNSQXZkIYiJdCIUuVolR5yktdQQO2GHnul4wPQkA61JvGowox+dcaZHbiLrljg9xBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MAvuoFEx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hz+vTyh8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC87606A32A
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CC87606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MAvuoFEx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hz+vTyh8
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8hSow2209250
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JX2/SMoV7CGstyBTRaz7Nu
	WaIewG3wQxjXWL82vlo1o=; b=MAvuoFExTcMl671fRb/MStE2z57S8cVHT89bHR
	Mvt1r1C+i5hM5F55J4PLNpo0wWCGumwGM/UA43XabE0e/0dg6S7SHdTstIZsvnYh
	oXnS28KYv9//XyN3Glij6uhQbEoaeyLEFc5DztX+2gyYgz42xL/SmX0h5jfToi/3
	a/+vHhsfRe9Qdv6oDrILXAseA6YNPNLyoPrq8ID+8VY+MklqF1x/ipCFQVd8IFel
	xpF6yggCgqkHh3Z4dXumB0V9inU2ZD9pM2Q0KgqLteNEfOYZRdzzEgSfA4Z2BDcw
	JEkdexgQeRQ3GTTLhtpeepDew4OqUpICllEW5idGaKSYTuHQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yy128wm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:35:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdd77f53db5so2302766a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795516551; x=1796121351; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JX2/SMoV7CGstyBTRaz7NuWaIewG3wQxjXWL82vlo1o=;
        b=hz+vTyh8tZbYDetIN+ZqneMPHWVHLXNFTnsRhXhaA6oa0sNpFkZhjJYVsz7u+FZVGK
         L8xaCLtWpzIkHg7XdoLrRv6R5mZUQ8qPUebxsPAxaVA6b1dgGBeX3PuPiKhj//DRxNNs
         IAV7OvId97pLtjLxMFdfFA3RpiW1TfNaZYi5tqbGw43hgHHdivn6al3e30HHag5RgIHL
         xghJ6DE1hEhvdxEtw8ZBQ/BjAgLRBg7IXgXf/6rvdM/SY6vq+j5S2/jo1S5lv8YmEE0I
         F9qNMHqdommAUkQMC78LiaykySJwCqhNYy1w5nej6w9E5t8dv1WVRxj6qStl8GZaIUVs
         nOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516551; x=1796121351;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JX2/SMoV7CGstyBTRaz7NuWaIewG3wQxjXWL82vlo1o=;
        b=BkWPSR9eMklkyaqL5vNusuGHKPVWM2FK7fqxMCkubVaef54aOLHtVJOEU7A2oHXb4t
         1ntNDqzwNbowKIrFa7WSAlildBtNnord98gO6Fwrw6KexacjYzMU6lqs/xqotEcEEvod
         Oc5cIzeFjnIEIB0dxMrciBl+D3hbXWykdvD4YO2OwxnksXjIvSO/IHZ15jCt8oXyu+Mi
         6Q0iYtzMFj8sgPP2Aoxq4WCW4NOd+q9mfr2lOGBsFr57477mAAwrohujAL9aQcMDPZso
         G/9XskNoeRUK485vrgKzPLYlkEFjs+yr2wrZzmLqQisBkvGLStGPHy7p6uK5d8trgqy0
         4wHA==
X-Forwarded-Encrypted: i=1; AL+hErGOQIKmuXy/m82kIeXwM8S7H/z5QB+D8AcLJaQdbgCIBMogpOe+Pui59YM92/rL4Awb0XnMYuLWXwog3ITL@vger.kernel.org
X-Gm-Message-State: APuU4Z9rCO3HtDNWO3PM22nN+VEAdskxhEHz3OS8WEI6NrHBBYvgfmfH
	Kn23NT6mIQ/bb/A1OeW+D20nIRqnV71HhKS3dMma2lna7rkBMm1IK7IGZiMA8IZogJuQv2OP9Ar
	9tmG7PDv51VzIui7ymQjUErNFIB3HEedIqEupkLt2+Pbd2mcF5dqt7P9Ae0KotypFAvHg
X-Gm-Gg: AZFdTZdmRPkyflkswqhXhGtCW2uuCcsR06PFFTBerbJ6SeAVFB46s8gwFsvTEaiOlUd
	su3bjqH9ftXi4eQhGQutVUthjsZAKa3mPq51I30dEY4SiL5Z/0nWr2hEJ5XqTMIwIW3dVbVpmj1
	LJ0ZzG0yJ/qD99S8nGgnJv4t6dmsdwYp+Wkh0cJ6M/CBrLKfOwXj3jfp3XPgAtc0XKPqXtHAzfb
	32mNRk/k52NznZe2Y1lq/Jnopt8RHvbM5D8PWrGJ8CAjL9we2WDYFLq4bwpRErzWrHHMvBsq7pY
	lWJ/DMUK8lvgFw5XSGyeTfeBbBLoOBXZWMlWkyo6iJhpHctE8Xrtte9N7mB031kZJgpfg+TWqiB
	GCSkmNjnb6PewUQ/G4SwbtpS1LAHQwvZeAx/g0dL1Q+1dUTU5yJEmNCryp0oZnSXHb7LZF01wLp
	Gdy0Q2cP1r7Enpv1h+Lq17J4ps2gfTSvC1f6I5
X-Received: by 2002:a17:90b:268f:b0:3b3:a421:7e00 with SMTP id 98e67ed59e1d1-3b41c8d4831mr12491420a91.16.1795516550794;
        Tue, 24 Nov 2026 02:35:50 -0800 (PST)
X-Received: by 2002:a17:90b:268f:b0:3b3:a421:7e00 with SMTP id 98e67ed59e1d1-3b41c8d4831mr12491399a91.16.1795516550317;
        Tue, 24 Nov 2026 02:35:50 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b75f2a4sm9162295a91.2.2026.11.24.02.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:35:49 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add coresight nodes for the QCOM Eliza SoC
Date: Tue, 24 Nov 2026 18:35:30 +0800
Message-Id: <20261124-add-coresight-nodes-for-eliza-v2-0-48926f5a97ed@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAHRoBWsC/4WPzY7CMAyEX6XKeY2SUEjpad9jxcFNXBoJEkhCx
 Y/67rgUieNeLI2tmc/zFJmSpyza6ikSjT77GFjon0rYAcOBwDvWQku9lTupAZ0DGxNlfxgKhOg
 oQx8T0NE/EOoatXRmLdE0gjPOiXp/e+f/7Red6HJlTFmWXwpDmaGUaoAtUBJaCtHCOcWOoOsbq
 TcWnbbYjmrO7jATv3I6+dJWgW4FlgAtxYwafC4x3d/N2DCzPvf6nxKjAgmktmZnyTSb2vzGnFe
 XKx5n2oqH2E/T9AIs4FP+PAEAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795516545; l=1479;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=yrh3sL/QUEYo03QCJzG/nErshFwj89d3SRtuzzGr/dk=;
 b=/p3Yubc0pnVhgBpawj2oSxA8/3gluheRkdoxzs2DmdoqgS0b0Y5cIVIgJSllmDMAwIhKr2fv6
 1QTj23HrgWYCYKsu/iQymgpbPu/Br4ojoJBDyUxQA481/x6USnl7RBF
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: 8REzgCTXEXNZcMLIZkwrk68Ma6bKrV3l
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfXxE9uwhXH0s8C
 /Dl+ksKcnbX1olxYGS4IwvIpUPdDcI+sjPeA3DYcqasYfTqzjFtCnGVvmkOzvlntGBc/6iGOQA/
 yNczNmzDi625zszWOxpoHw9Zg4yibh8=
X-Authority-Analysis: v=2.4 cv=JYspPkKV c=1 sm=1 tr=0 ts=6b056887 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Pitd1UQUPAqnyXy6cy8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfXz0UuUYMYgdXP
 vA4gWmh5y87glu0ePXxLOgl7vuLJYWoKBh8MZiwTcxseSOBp6dSnLOpNaAYLBmtcNRFArAxtGv0
 Pu8ckSv8I5zcz4hjDnEO1KZ/G1L88BFCH/EUdtCwtM495FWrz8+uRiYMFzHn1oAuFU4xZoXIO+V
 zL1bWIfwygH8um11/IiNEse3jBaZTj+hzr5f67LnhIByQoL6MIs7TVAd4bbhERuqbo7HstJ6vFv
 CObPqxlW9rLKKDHNMvDb0qHTtiWMWfVQ6yPRF5jkqu5tvlzw8iu1xdQgfebmgEHDW94Uu9OGBnL
 W0H+DKgrz4/X7aWEmWwYU9Qd2whE5/uHukViioHNqV+eV3NtBsHbhfQwvUFmTRgcVZ/hXu81IP8
 fhqg54m6/rgiovjNlIIq/THIukLLnJfShjeSooxvp6HEv/lD+C12n0De3ZeMtKwii/IFFUO1Dma
 gzKWNlonWbCwiF6Iaxw==
X-Proofpoint-GUID: 8REzgCTXEXNZcMLIZkwrk68Ma6bKrV3l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240040

Add DT nodes to enable
ETE/TPDM/TPDA/CTI/Funnel/STM/Replicator/ETF/ETR/dummy_source/dummy_sink/CTCU
devices on QCOM Eliza Soc.

dt-binding dependency for fixing the probe issue of the TraceNoC device.
https://lore.kernel.org/all/20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v2:
- add qcom,cmb-element-bits property for modem static tpdm devices
- drop port2 of the wpss_replicator device as the dt-binding only allows
  port0 and port1.
- Link to v1: https://lore.kernel.org/r/20261124-add-coresight-nodes-for-eliza-v1-0-e1679ce78547@oss.qualcomm.com

---
Jie Gan (2):
      dt-bindings: arm: qcom,coresight-ctcu: Add Eliza
      arm64: dts: qcom: eliza: Add CoreSight debug nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml          |    1 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                | 2137 ++++++++++++++++++++
 2 files changed, 2138 insertions(+)
---
base-commit: 2c0da72bad5631bda9c70dcfbe3497a0ebd9f936
change-id: 20260902-add-coresight-nodes-for-eliza-44a20d730a78
prerequisite-change-id: 20261118-fix-tracenoc-probe-bf8025cad2ca:v1
prerequisite-patch-id: 1a8b6c3c6cbeffe85cf7e9ba18047b9e7f93a059
prerequisite-patch-id: 3e735b506605c095cd5145cbbf6d05e52865b923
prerequisite-patch-id: 54676cd3a27d629eae2579b3f806765d2d2f4596
prerequisite-patch-id: 90f74c034275c8673d6c5b44692297a4899e4bfb

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

