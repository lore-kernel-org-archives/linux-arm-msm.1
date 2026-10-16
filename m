Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8936938C2A7
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 05:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792129206; cv=none; b=Bb2uCkVjmGqcpYiiEPRKEG3BoXXMZBXs6uccbVsoPTpc7do99fzCgeLN353aD3lX1VJvjixc7NzmgrU8JLIWuoBczwdg6XboObp6h9SDOq/VKRd7zNwFUJ7UoIiEm9UHSf56eWAg7b0bMk0ucDUjSiXL+jsYGymYH4u4ftLUrdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792129206; c=relaxed/simple;
	bh=prgi9uIT3cI074Yv3YoKapZT691AWKMKmIDHgwpgfTE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tJsrjXLGKlVFVn3ev0Cc3DD0cKlake9YuCc6hNN3LbOtmVC0sx+oi5dnr5MCJUfU3lTIgsoADuUo2zA7a2QgO9WZNjAP1DxiDhDKgB8urc8yZAq8oPa17L6/pA5mH/7QHYTir0XHwYih74PRiDqvvu+vPB5QN6hSxdq3Rb9UQR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mVd/9vnJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OW1wSIi+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVd/9vnJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OW1wSIi+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G4GKJG3462710
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 05:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jd/4RTHbYphJrMILDTACZX
	dVGSib89rNuWM42n/FXB0=; b=mVd/9vnJRu+t+rQ+gInLHU1ItJDUSZ57VdGzYn
	geM7b06d7gOjsMd+mlJknKNlUm69Kc8B0Aol/5ACEYNqcgeqazFQt0QJovCzhFLj
	aPvwp0r7aCV/aKQzMIkorcToEyP6eqDjrCHA6ve3JegVIvQcAHm6tweTUpH3d+ui
	EfgN0WDrb1AJonh1G6iGP7o6xz4fSScjyZ4WbNHUL/PC8GySE5wxdFNMDzJdsD1L
	IDcqeGE8QXPtMcLwiXknLBcnM1x/xOXQG4spWeCZiSd+dZ/bzp287dhafCwAH0OF
	P9bSye7juaSRkENnN4dlKmvb8ORFN+RXQa/hhsBZgPbagrtA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hayu6bb4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 05:40:04 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so12335243eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 22:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792129203; x=1792734003; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jd/4RTHbYphJrMILDTACZXdVGSib89rNuWM42n/FXB0=;
        b=OW1wSIi+rHnnpZ/l/mEvKkmvihxiGbGYTP8cvvpJhbupKQlHLm9xMd6lp9yYDJ1aI4
         waVP9vMayPLwz+2N4Ad2qpbLtoD9vYPwDzw210uniXmZ8keZa3uv8tl5N3KrjrWm4Hmb
         VRD0soEx6C25HcioeF9dCkiJomJmHd8uj2lwbjLm/aTWsOjmrH2OWs3yGVK88aDawQ+L
         hrPaQuuH5gD9TbuYmszw1YiFYBwjBS2cPpOTbVYyKKGPPTxQKseI9DpoK1Z485WC9tkP
         vHj7+VYnZs4SHkuKCnvqvMlLRf9AcDYKRhxiLLotDCHrEmlufeSx72gNHY5lXdq/zVQT
         4uGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792129203; x=1792734003;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jd/4RTHbYphJrMILDTACZXdVGSib89rNuWM42n/FXB0=;
        b=T65BGtwcLB6BzkDLrPbdSkQxuXhQVSaPx+63z7xdl+YJ5sDJxa7oLPPsBpdXVuCbPb
         jhRmTwQs6KyPlXRvRFDL3yQ+DhTwZYAM1V3gf/z5UPGzAxaXD1/rPfaBUGLEwB2SYwY6
         kQhl1yXvTNuMf6t3dz3BB18nt9kwAeiwYHOiHRsJ+VletX7lzoQFwEEAOIa2eK6bMs/C
         xwyNgaHmp97x2TqU+eP8fPEzYYQ2BZ264tXmAT04pi21Qygp98MF2T+PcinR25j3wUfC
         F14OtSvwvn6wYDKYMEHOQpJ5/DmAlbXtY0MyInO6BeoVdnr2hIoXd29Mmv8pDZu0PxtA
         fXjQ==
X-Gm-Message-State: AFq9FYJad0QzNZBaixbeGZ+aY4AivdMniAIx7R4dPYNpVZphE5pHRTKc
	W5/jQZ8S83WyfDwcPQOSA3i2SOrFVZxm8bQoXifrtc8+tQN+ONB2tQbdelw2QOLnpmoFj2NGJyF
	6Sr9kvtDqqJt8De/EzG7dIna8UaJ1TZGJOPbH+0p26+MQtzgR33rVfuowHF2p40sJpegS
X-Gm-Gg: AYBFou05Z5lXHHrzwewrR+t+qSH0GvPrSg/2WXPeCVk3vlxg5r8ILM2JpD1iH/PgyI0
	NhM2KjuXHjJJ8TW6WfOeksGOZgxEm6Q7kQXYgYa0scAyzKdX7fu80HcXeB926spzUAkYWvVdjc8
	RLh3wERHRr14SiddjF5hV1QrRE/rvEImXURGHFif9aKqiKZjx3f+iLUw1zaHQcKVBqfZjFII/G9
	Urga05G8v+OO9arXMzy1GUJ2bvZpN4WtusmzsUOIiks3+IfX1f1yWnGI++cwbvgzJPTCd+ODBLp
	RRvSzH0iePh7nRf/Qc9D7itHfhiC4NfODmnJ6Ue57HsNPw5Wf2M60MUz1/OpodXTnAEWjdaOb1b
	s84niN/NFDz2ur21eYvloE4Rsz/AqER/W32qh
X-Received: by 2002:a05:7300:3398:b0:35c:ef18:6a78 with SMTP id 5a478bee46e88-35cef186bbdmr12882156eec.2.1792129203031;
        Thu, 15 Oct 2026 22:40:03 -0700 (PDT)
X-Received: by 2002:a05:7300:3398:b0:35c:ef18:6a78 with SMTP id 5a478bee46e88-35cef186bbdmr12882121eec.2.1792129202394;
        Thu, 15 Oct 2026 22:40:02 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6791sm3811393eec.6.2026.10.15.22.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 22:40:01 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Subject: [PATCH RFC 0/3] arm64: dts: qcom: nord: Enable SoCCP remoteproc
 support
Date: Fri, 16 Oct 2026 11:09:53 +0530
Message-Id: <20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKm40WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0NT3bz8ohTd4vzk5ALdlBLdpKRkoxQjC4tkUzMDJaCegqLUtMwKsHn
 RSkFuzkqxtbUAQSYwGWQAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: WmrvFZecgeaz7-96b8-bi0SMmcCiAzFh
X-Authority-Analysis: v=2.4 cv=ff04WEQF c=1 sm=1 tr=0 ts=6ad1b8b4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DBOEi4bJulm4djh3SG0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: WmrvFZecgeaz7-96b8-bi0SMmcCiAzFh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAyMiBTYWx0ZWRfX3L045p9+y5sY
 KVor9Hw0ajUDD2Jux1rRcs4Qn7xVDfnjnX51L7Q8qu97Wes5CzYfs6FFYRsdclGAQddFZWsF4TZ
 TjefMD23YyT57ZZ0Bg8Lz1W1eQhH5sfldOdP2Binc/lJw2EivVJvEufjHJVgHUd9iFal0vw0DMt
 2b8yXQAN471kPt9WKo8VnKkA98BmlfbWZP4qGtzkb65Wi0wuN3n0xENug+bqGPRHGxay0MLVh7U
 u/IeoZ828lRtHNuLVycXBQOmsMQ4Mj4AHNpgsmKcD4IClQf75X89jH6/u+L37tKnLKikQCQeEOb
 w1ji7C69r8RoT8ySQ4zNOg+ahVQlfJteoa4U8EMrydRS/CSBF7TNvRMLVqxxT9qLhiAKBfisEDh
 0uk8OTAMfBJDW9qGKD7JiXCp8XV4xt8soGKuQj5M4JZGcurj4XUpeDbJHHMWuPQUTqH1/A3tX0a
 +a/M4v8TkkxuF13EGdQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAyMiBTYWx0ZWRfXzVIHwEDDx3P1
 KeYKAJk+i/Vqt68YmSw/vZN6jN6J6wDaq+TGa6DxtsNYJrBFT5o82f5cj9rYyv3j8+sfn24wlCP
 SUOhb1DPdO84n7ieO8VoekxTqI4/Icw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160022

This series adds device tree support for  SoCCP
(System on Chip Control Processor) on Nord platform.
SoCCP is used for hw fencing for display and other
use cases on Nord.

It has the same interrupts, SMP2P states, power domains
and clock as Kaanapali SoCCP, but its firmware ships without a separate
SoCCP devicetree image. It therefore takes a single firmware-name and
memory-region.

Prerequisite series:

[PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support

https://lore.kernel.org/all/20261014063953.549379-1-shengchao.guo@oss.qualcomm.com/

[PATCH v2 0/2] Add binding and driver for Nord SoCCP

https://lore.kernel.org/all/20261014-soccp_driver_dtbinding-v2-0-09d9c1378e9e@oss.qualcomm.com/

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
Anurag Pateriya (3):
      arm64: dts: qcom: nord: Add SoCCP remoteproc DT support for Nord
      arm64: dts: qcom: nord: Enable SoCCP on RRD board
      arm64: dts: qcom: nord: Enable SoCCP on Ride-Embedded board

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi     |   9 ++
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts |   6 ++
 arch/arm64/boot/dts/qcom/nord-rrd.dts           |   6 ++
 arch/arm64/boot/dts/qcom/nord.dtsi              | 126 ++++++++++++++++++++++++
 4 files changed, 147 insertions(+)
---
base-commit: bf2089c6d55a812b133ba2dabe59413746c2328d
change-id: 20261015-nord-soccp-dt-bbc2d288c560

Best regards,
-- 
Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

