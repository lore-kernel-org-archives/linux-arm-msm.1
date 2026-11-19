Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795065215;
	b=WHVDJpCCyZKyLVo+AT9A1poQcZbS/zOVZmLOblGAruAy9NOPews9fb/GdcMZMVcA+qrL
	 Ar7vh/HrvftACbD0tUmgvkqYhXMUFIqYX7WV3ocEf1YkX38bISvLQJXiFGQSLSkjC92qa
	 HCxlF04MSUeNsWV3NfJ2H8cw8yfiR0dDGGAemG2xWzvj/Zvx2rPZIn62GeaOZ3lQCIFOG
	 OBS2uiHTlLQSAwHINb4YDE5iZER1aoQ19BPk0JJNd1U/PnwsIvhAw23kDp87rGIRuI71x
	 T/Dx6xs5gV20qjadRoXnEuwf9C/qKAnQI4nsEIV4Sj3KGTDnz3J+xtB5NcDomUSNIvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795065215;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M6V4g7F7JpQ22Yiv3gnPU3mJcJaxfjEc/uWaBLMtZg8=;
	b=ETw/jis8jfvTK4/XoryEQS0pIFXG9umGYSF0ATFYgtK1Lc6OcDfXYJirPc3EN/bL/U3I
	 aVEZmy3jI/6tQey7Eu8W3F1xS3oSDJTHp2IKxmvoUcN57yQXIwBaNdCJVRKJCs3XcAm0Z
	 GlViAf9ARbYYm7SECqY0lDU7DECtXWiRH7GOaHIHpCuAHLbbHD9yShshiUWAKOQqXerWM
	 tG5bNmEZUtoOH0C0NUQj1cA5GwNTpiya9VEPUe3KbH4417i4QJZBSpA4Q+gYQA/2BeVls
	 5xXdNFWZluvufpULjnKM8eqAGKbkr7OxSBESeMRU8pKgtIxwLSRRrV7MIl1/swJmRlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="BbT8/OFG";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KmAmXZv9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8AB606A320
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 05:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D8AB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BbT8/OFG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KmAmXZv9
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1AwBX1215801
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 05:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=M6V4g7F7JpQ22Yiv3gnPU3
	mJcJaxfjEc/uWaBLMtZg8=; b=BbT8/OFGd+d8iwOFgsY/Ar3yc7GfqjRmJJ2tfw
	d0CMCFh971C3WoSVOwTxtXJxAAKMBDJbOFSyoDecgsuIaVy1KRp2rhIXu4yNtBfH
	I2pZ2zJ7O3+08uvhx5c8FEbMeXVxz8wF54NBkF5oi7Wbk7YrRFY6y4+ZHBbvr30r
	/rNwf1+m0rZEBjjqDA8TiTKmSmy1gQOwUuUrnsFvLHrGfeQYC8cbTgBBoFUmG6yc
	jSaG23odoYxaiacxYnBmAxwOnQqsVLh8uApWQ74P90YZOB3BAAwpshu9yxdbayNh
	x15IK/bd4dG4Jsmi9Ijzj7Wx0k20uXn1yC8xPe/GhucpseWg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1gxctdra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 05:13:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3c459a35eso1850104a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 21:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795065213; x=1795670013; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M6V4g7F7JpQ22Yiv3gnPU3mJcJaxfjEc/uWaBLMtZg8=;
        b=KmAmXZv9x+Qn9txM0YawUCNsNcZPiAmVWp6zUscu/k+jK6iY5tNXbjB25yusakzpYc
         4Y2Fu1s5ERAdYTTfD0DP8BdjtPujqoakYuw0FlrlIpBJhM2GeB33v5XMn/SoLsKnGyTG
         gHlJt96uDEok45NBQIHcs64KpPPMGgin1TDNWoyIHoVUPIY4DCrU2k9XSZh8aqcuL/Ly
         pE/IOt0JKunteoIceigIn8oo4wrbjafCTvjts66FDf7s8D6KXPrY6iXa9He/7MzAJOtT
         fknMvAicEDXlwLpdDhu+PRfQQ8r8XzgFesVJ/zRR38sqx5Vk8C4Sw0LMcGuXeSychr5B
         j9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795065213; x=1795670013;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M6V4g7F7JpQ22Yiv3gnPU3mJcJaxfjEc/uWaBLMtZg8=;
        b=YmR+yh1Hma/Z9y7ti8BKPyCun305k97ZwzjHIi3J9VGI2PXXaDyXjuwlWs6dcffZVp
         VHqCFwF57KsmU0O+4c1O2WaFi1CU3dA1toK16NHl8srrjXkqmvNuvFWnucUumjI1mSLL
         Od4vo+Ha3ACvsCeuF+wIIH/E4XpJwab5vPnIMFo/32E6ieSyyBsqtb5YzwM6OeE+vg64
         M7dkilq/f5aDA8SyP9nPO+B5xPYvh+96dbV768nsM6xv5a192pULRZEqh2CPT3Ov+lUW
         XBtpetrgLakc0MWjEUwMriTTS7WcEzec07HiNnWQl4+jcTS3xsxwzltnq08S7qpS74+K
         RaTw==
X-Forwarded-Encrypted: i=1; AL+hErFYJn/4yu+bxcogHnIkUVcA71eQfiSw4j5cuUkZDApnqj9eVo8ulcwFA8ofKQyiGt1ReuQuuY2wm/g/wUx2@vger.kernel.org
X-Gm-Message-State: APuU4Z95mWFCN7KS8SWnxJyOaUAYOCuIpxbycP5mJAaZj49xTIShMtUG
	f2z4uyDQmDNTTKrXRy0Ot8iP3Q5q2Yg3x0z+GNArdBIBtmMDfQTkQuSBXHdZ6FghSmkZldVPnf4
	9dB1K2rcO6JAAOqhYHM9EkTmjLkUvviPqEQcNXFvDR3NNv1y6KtrzGWE0uacUeUAudCkA
X-Gm-Gg: AZFdTZc9na/QXhcVwsMWfjssx4RIYxwkXs6aG9Mv88sMJ7UtHCIGSjOWr8C3Yufcn+/
	t5K3V1w7N2WnzZFAL5i0sCaGgt9x45w56YgQtWX1h9PZUPUAWAAOszC5yZNJBfNgYUaH3jddmfR
	5scjDgMfN1GFAfaADm2YD5LXXBT5lieZiK5h6M9MzS2HLxJKz2u0ausxNscHR08NuICTGyGE9YD
	E5gOhuwQoahLL5KvUaDkC3ADJywSQQCJoTKqx/Cksgo/XmcBcR/n/LmluY49nwW9X01xfVinTyf
	0yLOIDdM/vihrg7S7gaM+rISGY2zD3RiWSxres+SfetK0/6OogEq+BBQQzSB1g5jZ7DvpueYogq
	QeVgLXcsIbFjCroCgIK/HtST5jkCw3tLi+SWseAUkftppaex5kJVZF4n56jSDCojELSxZMEnNh6
	FxKbjwS69Y1xea9sKikudW2XBQcQBKhvKX9+J1e0y+t3NuzxU=
X-Received: by 2002:a17:90b:4d82:b0:3b3:b71e:b2ee with SMTP id 98e67ed59e1d1-3b3d07c613cmr4947504a91.35.1795065212856;
        Wed, 18 Nov 2026 21:13:32 -0800 (PST)
X-Received: by 2002:a17:90b:4d82:b0:3b3:b71e:b2ee with SMTP id 98e67ed59e1d1-3b3d07c613cmr4947490a91.35.1795065212363;
        Wed, 18 Nov 2026 21:13:32 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622c0a5sm24067185ad.50.2026.11.18.21.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 21:13:31 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v3 0/5] media: iris: add support for maili platform
Date: Thu, 19 Nov 2026 13:13:23 +0800
Message-Id: <20261119-add_iris_for_maili-v3-0-d47d047a3f7c@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHOF/moC/33Q3WrDIBQH8FcJXs+iHqtpGWPvMUbw49gKSdNqI
 yul7z6T7mKwsJsDR/Tn/5w7yZgiZrJv7iRhiTmOp9rAS0Pc0ZwOSKOvPRFMKLbjkhrvu5hi7sK
 YusHEPtKgUAsNwVoGpD48Jwzxa0E/Pp99wstU7evzkFiTkbpxGOJ132gXbNA7p5RTgC3TaORWG
 BvYVipUQXnVAhg10wPmbJZQ++b1J5Omh/42TIkWzimjyFxrXY2qpXgfc95cJtPPf21qeVtFOGd
 Ay3nqYr0212K6Orzv4+lAi5pRaZXxrZKhDSvoPOUx5uuYbssmC1/G/G9pZc7Kdj4Iu5UOuP7DL
 moRvyQBq5KokhYCNLQIwPyK9Hg8vgF3pt3b6wEAAA==
X-Change-ID: 20260914-add_iris_for_maili-f6e7273fbb03
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795065207; l=4033;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=LTzvzaWsHDL0ml4cnk8A9LfL19Pd2un8ZwQudfkC61w=;
 b=BnB73qABI8OXgt9EOVUn9+FCE2mGaT0Dl8zP3AdbzRtF4wsvagjik139+bQjTcsK4eNfYBPTP
 6IxvuwzzdJODHfKRaGt0+h/HDUO8nYX90V8f2B/kybeZ2xIMzyDmuly
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=LZapeTfi c=1 sm=1 tr=0 ts=6afe857d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kOeJLMkQAKGndRfPQZ8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: z17mKLqAMUFTl22J6zRrQpkDSRfWBpH4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyMCBTYWx0ZWRfX2edvGBbW/Bo+
 B9Ihe6djyilqmg79s5uWL4pTZRS5l5vC7zA7teeLCADde8bOb8qyHRSxEly1bvmgzj02e+0WgQB
 SgykqOK/XpXinLwMmTdmG8UkLKhtnaxq/oytkoUZpRm4QfLAIjUHM70boGTylwVrBU1SIyX0SZZ
 TLbp6GUGX5gbQqv282UWqYLBKh9J/Ad9M7ImaRDFbfKqfPHgxJJp6qL4CXO3yiwItNbbIekMcVI
 4nXXPZCfWg/TEW2SOlRf7q4lPfet0h9NeYs/SEjhb4j+w1VJK1wLgY6RBXlMSUIZrI8Fv1LvmCh
 kJRpdaZJdqh6c+1esaIVREcva4jzEaByV//pYXOvo6MblgLNTbbCMWFvuGPvDYCZXLDG3IHGHNi
 KeaRLJZ6ZaNaSCwf296uB/baW95Jtytx5nNkeMse5tJJD3tCv60T7eqGPzgB0JMElAm/0xThGAj
 WgO/GH/4lTl03iQ4qCw==
X-Proofpoint-GUID: z17mKLqAMUFTl22J6zRrQpkDSRfWBpH4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyMCBTYWx0ZWRfX1lt7KpcsiciD
 nG1JCHCkXly6h8sQ7BlwQzu5fqO+siMLv3alW6kmhNDBvuEAhS63iUwiWNe3u+TQmOMmRF8NtgZ
 I42srs47VE23Upvq3Q6DwuqBoe2A07I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190020

This series enables the Iris video codec on Maili, allowing Maili to
use hardware‑accelerated video encoding and decoding.

Compared to the Iris3 generation, this block has
- separate power domains for stream and pixel processing hardware blocks
  (bse and vpp).
- different clocks and reset lines.

fluster result:
H.264:
Ran 76/135 tests successfully

H.265:
Ran 138/147 tests successfully

VP9:
Ran 235/305 tests successfully

Dependency:
Dependency:
https://lore.kernel.org/linux-arm-msm/20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com/
https://lore.kernel.org/linux-arm-msm/20260917-glymur-v11-3-e0c8bc914742@oss.qualcomm.com/
The above patchset cannot apply cleanly; I have rebased it locally and 
tested it. And only the third patch from glymur is needed.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Changes in v3:
- Implement HW ops on top of glymur.
- Add firmware-name in board DT.
- Link to v2: https://lore.kernel.org/r/20260923-add_iris_for_maili-v2-0-7223738e330d@oss.qualcomm.com

Changes in v2:
- Correct the dt-binding's commit msg.(Krzysztof)
- Remove fix patches.(bod)
- Improve the readability of the buffer calculation function.(bod)
- Link to v1: https://lore.kernel.org/r/20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com

---
Wangao Wang (5):
      dt-bindings: media: venus,common: relax clock/power-domain/iommu limits
      dt-bindings: media: qcom,maili-iris: Add Maili video codec
      media: iris: add maili platform data
      arm64: dts: qcom: maili: add iris video codec node
      arm64: dts: qcom: maili: enable iris on mtp board

 .../devicetree/bindings/media/qcom,maili-iris.yaml | 229 +++++++++++++++++++++
 .../bindings/media/qcom,venus-common.yaml          |  13 +-
 arch/arm64/boot/dts/qcom/maili-mtp.dts             |   6 +
 arch/arm64/boot/dts/qcom/maili.dtsi                | 126 ++++++++++++
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   4 +
 .../media/platform/qcom/iris/iris_platform_maili.h |  58 ++++++
 .../media/platform/qcom/iris/iris_platform_vpu4x.c |  81 ++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 9 files changed, 516 insertions(+), 6 deletions(-)
---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20260914-add_iris_for_maili-f6e7273fbb03
prerequisite-message-id: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
prerequisite-patch-id: c790c17f7113da72001a1b83fa0dc0fb82e22760
prerequisite-patch-id: 5a2f89fdc7312d46f01aeb1507c3d179203c1357
prerequisite-patch-id: 1e1b6daab984b81b7ad83108fb532ea25345638d
prerequisite-patch-id: dc22e163717edf23b847a79af253c6b85bec58dc
prerequisite-patch-id: 2cc01cddaccf18ead1c1e2506f0182193afc1dcf
prerequisite-patch-id: a1e82173cdbb9c315bb6cce35108a7a4057cb235
prerequisite-patch-id: 4ed1c23d97cb438c917ab31f4193c58e3deeecda
prerequisite-patch-id: facfccd32a2f70f2bae3357106a3fe493b4c8c32
prerequisite-patch-id: 59bcb5096aef6258f4732dc8f8789c3e846e16c0
prerequisite-message-id: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
prerequisite-patch-id: e1330b5a848460d14cd6574877fcf607d269d9a1
prerequisite-patch-id: 20d099e89443a097b9ec5b297f0129d9874ca54b
prerequisite-patch-id: 2a36ab03d78d8e9c19c900e203b05739a9fd1123
prerequisite-patch-id: 155b1d8008509ce41a1c0c87b85967c8410e238f
prerequisite-patch-id: 9e71460e2d5f1e4e2993819f4d9fa27c076946f1
prerequisite-patch-id: dc5329d211e9bb5af1d54f82092fe6ce4690baab
prerequisite-patch-id: e34741f76b6919db19236ead27c966b789736e66
prerequisite-patch-id: 359d24229ad496633892e70b1cf88c2d88dfad24
prerequisite-patch-id: 6e2e9069cb620143aa305b7b29b8b1982dd0648b
prerequisite-patch-id: 3e5fe6ef2271be5263a4bf7ffbd77b0996037b27
prerequisite-patch-id: e051524017c9f39f8593fb9d2e982e6a4c39fb35
prerequisite-patch-id: 1b4863f7a7f3a8390c825d76805e8e99de97a2a7

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>

