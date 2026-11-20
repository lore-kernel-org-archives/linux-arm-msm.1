Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180888;
	b=dmqC7XySqjVUu0CwsaI/KZpBznt5I1uioAjqTueBk6K/RkQpqp8R12LwPWXn+dAmtuvi
	 3hPNblJiQ/DCv8QFS4sFYjc63RSP0DDLGR1kktg3VZvNKyDV3XkfLmE6o1FmBsNfrwF/k
	 wlKu1MyBz/nQ6IGJZKafw/geUjRcXMaJHSGkKOqtxWr/E6Ib01B8lAVtCQj0R2LvVFZtE
	 ZhITSBdXeP4jmoqGjPlUkjy+AEb+0HxhTnjpA4PfzEsQU6ViUTxSN/CZfKRYEtV4mESE9
	 z0xh0zp2BcoLFOAzJhmJPNXfg83QNrf3dMHgcg2oxIDv2EaGomr6Uz+YMnrUZtEdcig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180888;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vrg7+etryRTWAuLxtBfLDW2Eg3be2tf/bw8+JoHgpTs=;
	b=Rho5th7/hRy4fiAErxHa7XBuljzaAFjpZuZjANPK3OIXObzkAhaPgSrpNH9WacW9Za51
	 bO9o4xVJwT0FFh8WmLX4H4K6rISBGiXGlrfylGcdO1OYPIFBCDN+IyVdvKbj+I5iLr2nZ
	 8c9nhQHixr0IfknOZ7o4TajFXLgVun6yZdYuOBT2GmYp8xDfANvDGkMjHL2vXBBDcOj8W
	 QOd+3vhyQiJW7Iv7NCsAa6R2UIWssSNhopphCN+/ayYDg52Ws86dbp4uZLyh0ewpp0H4h
	 diOGbru7iDpzS/HD+qa/Vkz4k1KLNbBienLbpjlwKq9IqK4w6eVJv3XtZ8WrJr3vDAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TtJ4+czb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L2kpymPD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE2D606A32A
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CE2D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TtJ4+czb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L2kpymPD
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkBrR1017037
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vrg7+etryRTWAuLxtBfLDW
	2Eg3be2tf/bw8+JoHgpTs=; b=TtJ4+czbDjFczLGUkDuR7/B7HmxNuQO8lMsgTY
	X52BX3jltbAXLFtTGxbsFDny+yddZrZTHmGmA1XZF9arxQHPryp2MvyFOw6lopNG
	pb2sGBdti/xflgsmPgy2GwsB7w8mZOJIVoGLYRd1Tepw/evn3rbTSH+2jzB6Q/Vn
	5hjLNvQU4CcnxV29PSBIlcTCsNZg4QsTJfTS5/YU5FhHHMyf5+QorM7ubg6O3bln
	2oK1RieByqPx7ogJAHvGs2EquSvQC2e1M5XHCLXix/Hy0U36WtslV0dJ/DrBYiyO
	Ts8GvBCOoafm7XWyOAKvM/qoyYuhEbbf3jMOKLqnfwYt6ZSQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqsqvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:21:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so1333369eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 05:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795180887; x=1795785687; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vrg7+etryRTWAuLxtBfLDW2Eg3be2tf/bw8+JoHgpTs=;
        b=L2kpymPDBL1rX5zrjUzU5UfL2E6k1iK807t7d4UrkkQk2omIyo3nQHawYe6ej5itCS
         JZ00gNLB1glSn460ZK3B+mGSkpXBFQpXwTbFjT7S8u9bgT7F1IqOR3/VqybHRhi+Vh9l
         Tvx4Be1rRPNytsMHILy3UTde7EnYQ0akmmkWoAjaxdldeNEfWDTy2m0ZienXi10O1ho1
         imYSc3ygQM9+F/FVnHXzW5LZcaqmolWvMWgFD8I1On0ia1ExJ/jyRmHJrOq1O2VH8Dhj
         tKT3CXHjPBUYJFDPR/+YWuHKZvD2VMN7T9l7CylRA9jAWYnMT80EbQAEKR1nuvPYcatK
         m4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180887; x=1795785687;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vrg7+etryRTWAuLxtBfLDW2Eg3be2tf/bw8+JoHgpTs=;
        b=dAuzRkotl7J7YfIlLns8KgaCGvVDb48b3l0+RN+zjbO9eMZeVZcUzDYt2jNWIFQvbf
         czCIOdZyJLUT0mNuukXKU6XYHgj0TOpzNafnncV9c2ir98MOgbOwoTUxP+MMM7lWFJsO
         id05YcW75GSRTBaZVsAXRi1gNpth2d7KuhW0RArSsxKozXQK7Jao/m0OiFmMcEOZeXHu
         nuC+o3/rhmUBVq4fDNy+Q5JDo/YJVmZCfn28j2vSyzowk9fy5hBrqgNkECnzGQXZ79E5
         lmS1+B83Es4W+5PXNrTBomP7qKa/xIOfGJZDXJ0TzD8fQPYrsIJW9B6Qtdm2c+TCmAfM
         PItQ==
X-Gm-Message-State: APuU4Z+6QE2ZNTgTvi4vHagW3lVNtFhuIZ/LKE0Gvgqq2tPT3r6igQdf
	T1vR2pcPyGkmEmlsgmcM6qMQnbZgB5htX3KNtLH9asmXQ35XsskowB+A/nf+Yq4dxpTgI/trYOc
	Z0vlgwFIFpryF0Fdiv1vGQzgFq43kNJilsH9988Uh8LUnb/btU0TuBa+wN4MXA23LbM1U
X-Gm-Gg: AYBFou3KfPumTver9T/B+922K2LeMN4y0pLfz5pZqhZkUiDpINFFIKTHwk3T6b2+n0s
	LArqMLylskjcpp1dzsshcZiYEoVHDHTpzOQ8cWlzLyr5qWc195M872P3IIXwijZuVtqq8uA96E8
	1bG/7a+ffOzjbrtw2+0LAz0f6+nqOBl3H6CxWrGkzec+PodNFrzLY1ryGtBIQOc/7eehCv6YoGt
	iqyibwHpy40E8eBK8U5/uhE+jre4ujw1btXolYtBzOtuJJwuaiOYk0FhmSKVl+h2eqHMzAbY6Vv
	u9cAkrdYv2qZE7emIoPnYchtrqYt0RbFGvkPoX64JRnnX8uxd9KE9k+WPPI0KcinJidnF7IiTZz
	bvFut4G5fm+DnybtAL52VYjZung2PIoSgp/NZ2O2ssqiQ+mFUhg==
X-Received: by 2002:a05:7022:170c:b0:1ae:59d6:91cd with SMTP id a92af1059eb24-1b5568f522fmr2443691c88.38.1795180886320;
        Fri, 20 Nov 2026 05:21:26 -0800 (PST)
X-Received: by 2002:a05:7022:170c:b0:1ae:59d6:91cd with SMTP id a92af1059eb24-1b5568f522fmr2443662c88.38.1795180885600;
        Fri, 20 Nov 2026 05:21:25 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm6929628c88.10.2026.11.20.05.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:21:24 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v7 0/5] arm64: dts: qcom: Add EL2 overlays for Shikra and
 SM8750
Date: Fri, 20 Nov 2026 18:50:48 +0530
Message-Id: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIADBJAGsC/3XOzWrDMAzA8VcpPs9F8rd32nuUHRRHWczaZou7s
 FHy7nN72BJoLoK/QD90FYXHzEU8765i5CmXPJxr+KedSD2d31jmtrZQoBxEDLL0+X0kyUclmUJ
 0UQebdBL14GPkLn/fscNr7T6XyzD+3O0Jb9uHzIQSJfimAa8aIo0vQyn7zy86puF02tchbtqkF
 oKGlaAkyA6CUg1bIuYNQf8JCGBXgq6Cw9B5bbSLNm0I5l9AMCvBVCF69oCx5abrNgS7EFCvBFu
 FQIm80S1HvyW4pRBXgqsCcERC4+or8YEwz/MvT529xvUBAAA=
X-Change-ID: 20260918-shikra-el2-ea8969385c3c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795180879; l=6584;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Gn8GKKFb8CdZcuwQevOhAFcs7R26w3NdGhQp1McDMxE=;
 b=dM/3SNWgml9wXdyMfpjZaIYwYw+5Jn97cywblwWml6pxznFZDV1ap2gXzSuQdk1LrL0GaCWHY
 X7Njj+B1nqkAi/9gA58PgKIMXzWVZ8Cu4YYQVmAcwc0h7CmEMshRFzh
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfXyZEnfUBFLKh5
 Sdw+jtqWEJcJPx+GmSN60OkDBqPAaPoTgDAXRfnjcMpNstpiTLYs33COV6z1h6f52PiIRJma2Do
 5N6lu8otPRGEASgCrHqEtGFpHK+PUifR/B5tsJoSRtP5+k3ulRi8i+XigTlnsgSlkgO4J1sUemE
 3bOlZ9JYidnZtEnVc1t2La+72+HTlubvkeNCDL+DnKQNGOjA+jmdEz3kzv8g+yJiTFr1xiacnwP
 0kfLqDcavhD9JbubiOyth96TguJAPqIs9Oh3W2SCNokIHaDJCXUGwZqL9t71HJ6cpGDiTpeLsNx
 DyTEbNKCtiH5b3mgRS0e6+mC/nEz4XosNsjA0J05fehaCqu0MSxxlJmfSOatAxW0yFH+2RQMkcH
 QBq45psKpltHWXSpCI1o9MNYydvKrtuctPOknOaqx0F59aX3ra1k7G6a1ni7JY6QT927yiJYqVU
 z4pmzCa4iZ9fz8p0cLQ==
X-Proofpoint-GUID: 9U9bUKGBK_p8Acp2f8zTY2XH5t7Nais3
X-Proofpoint-ORIG-GUID: 9U9bUKGBK_p8Acp2f8zTY2XH5t7Nais3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX3EDPf2GsWvYm
 qx2ZieQ6Fm012fiWH9d2fAxW6lK6l9ZX9vha8h58Ev/+ULc5WLVmlnJNLjbb+ybbEW09k+SgeC+
 Z34YHZ54GSQULb18pMJvmyil5gJz3tw=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b004957 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7yht7nwCIrXBMJmmVpIA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200053

Shikra EVK variants boot Linux under the Gunyah hypervisor (EL2) by
default, with Linux running at EL1. Booting Linux directly at EL2
requires the remote processor firmware IOMMU streams to be described
in the DeviceTree used by Linux.

Add a Shikra EL2-specific DT overlay and wire it up in the Makefile to
generate -el2.dtb artifacts for the Shikra EVK variants alongside the
regular DTBs.

Add a similar EL2 overlay for SM8750 MTP, which also boots Linux under
Gunyah by default.

The series also moves the Qualcomm PAS remoteproc iommus constraint to
the SoC-specific bindings and relaxes the item limit to accommodate the
remoteproc SMMU mappings required for Shikra and SM8750 EL2 boot.

Komal Bajaj (5):
  dt-bindings: remoteproc: Move iommus constraint to SoC-specific bindings
  dt-bindings: remoteproc: qcom,shikra-pas: Add iommus constraints
  dt-bindings: remoteproc: qcom,sm8550-pas: Allow 6 iommus for SM8750 ADSP
  arm64: dts: qcom: shikra: Add EL2 overlay for EVK variants
  arm64: dts: qcom: sm8750: Add EL2 overlay for MTP

 .../bindings/remoteproc/qcom,adsp.yaml        |  6 ++++
 .../remoteproc/qcom,kaanapali-soccp-pas.yaml  |  6 ++++
 .../bindings/remoteproc/qcom,milos-pas.yaml   |  6 ++++
 .../bindings/remoteproc/qcom,nord-pas.yaml    |  6 ++++
 .../bindings/remoteproc/qcom,pas-common.yaml  |  3 --
 .../bindings/remoteproc/qcom,qcs404-pas.yaml  |  6 ++++
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml |  6 ++++
 .../bindings/remoteproc/qcom,sc7180-pas.yaml  |  6 ++++
 .../remoteproc/qcom,sc8280xp-pas.yaml         |  6 ++++
 .../bindings/remoteproc/qcom,sdx55-pas.yaml   |  6 ++++
 .../bindings/remoteproc/qcom,shikra-pas.yaml  | 28 ++++++++++++++++
 .../bindings/remoteproc/qcom,sm6115-pas.yaml  |  6 ++++
 .../bindings/remoteproc/qcom,sm6350-pas.yaml  |  6 ++++
 .../bindings/remoteproc/qcom,sm6375-pas.yaml  |  6 ++++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml  |  6 ++++
 .../bindings/remoteproc/qcom,sm8350-pas.yaml  |  6 ++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 30 +++++++++++++++++
 arch/arm64/boot/dts/qcom/Makefile             | 15 +++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso      | 33 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8750-el2.dtso      | 30 +++++++++++++++++
 20 files changed, 220 insertions(+), 3 deletions(-)

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes in v7:
- Shikra: drop the q6apmdai node from EL2 overlay (sashiko)
- Shikra, SM8750: fix the subject and commit message of the EL2 overlay (sashiko)
- Link to v6: https://lore.kernel.org/r/20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com

Changes in v6:
- Define iommus with a description in the top-level properties of every
  binding referencing qcom,pas-common.yaml instead of in conditional
  blocks, making patch 1 a no functional change move (Krzysztof, Mukesh)
- Reword the commit messages
- Shikra: allow up to three iommus entries at the top level, require
  three for LPAICP, allow one for CDSP and disallow iommus for MPSS
- Shikra: drop the per-item iommus descriptions
- Add SM8750 EL2 overlay and the corresponding binding change
- Link to v5: https://lore.kernel.org/r/20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com

Changes in v5:
- Declare iommus property once in top-level properties of qcom,sa8775p-pas.yaml instead of repeating it in every allOf branch (Krzysztof, sashiko)
- Add Glymur ADSP/CDSP compatibles to iommus conditional in qcom,sm8550-pas.yaml
- Add sc7280 ADSP/CDSP compatibles to iommus conditional in qcom,sc7180-pas.yaml
- Add a description for each iommus entry
- Shikra: list three entries for LPAICP and drop the iommus property for qcom,shikra-mpss-pas (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com

Changes in v4:
- Add a patch to move the iommus constraint from qcom,pas-common.yaml to SoC-specific PAS bindings (Mukesh)
- Add iommus constraints for all Shikra PAS compatibles instead of only relaxing the limit for LPAICP
- Add WiFi firmware iommus to Shikra EL2 overlay
- Link to v3: https://lore.kernel.org/r/20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com

Changes in v3:
- Drop qcom,pas-common reference and add per-compatible iommus limits for Shikra (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com

Changes in v2:
- Relax the Qualcomm PAS remoteproc `iommus` item limit, needed for Shikra EL2 remoteproc SMMU mappings.
- Link to v1: https://lore.kernel.org/r/20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com

---
Komal Bajaj (5):
      dt-bindings: remoteproc: Move iommus constraint to SoC-specific bindings
      dt-bindings: remoteproc: qcom,shikra-pas: Add iommus constraints
      dt-bindings: remoteproc: qcom,sm8550-pas: Allow 6 iommus for SM8750 ADSP
      arm64: dts: qcom: shikra: Add EL2 overlay for EVK variants
      arm64: dts: qcom: sm8750: Add EL2 overlay for MTP

 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |  6 ++++
 .../remoteproc/qcom,kaanapali-soccp-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,milos-pas.yaml        |  6 ++++
 .../bindings/remoteproc/qcom,nord-pas.yaml         |  6 ++++
 .../bindings/remoteproc/qcom,pas-common.yaml       |  3 --
 .../bindings/remoteproc/qcom,qcs404-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml      |  6 ++++
 .../bindings/remoteproc/qcom,sc7180-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sc8280xp-pas.yaml     |  6 ++++
 .../bindings/remoteproc/qcom,sdx55-pas.yaml        |  6 ++++
 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 28 ++++++++++++++++++
 .../bindings/remoteproc/qcom,sm6115-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sm6350-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sm6375-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sm8350-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 30 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/Makefile                  | 15 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 33 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8750-el2.dtso           | 30 ++++++++++++++++++++
 20 files changed, 220 insertions(+), 3 deletions(-)
---
base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6
change-id: 20260918-shikra-el2-ea8969385c3c

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

