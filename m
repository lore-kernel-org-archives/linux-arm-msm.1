Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7283C4B79
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 07:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792307829; cv=none; b=rVci5iC2i+kqjK44KOwkER2qjtuh9IBM93rLZadDmB4333kfQGnhVpDddKE7LGYOdQPUGH7JdyfavR6wlPbv9IEMsjYjqTeOJZAlmigi1SFcZ+ySe+iU3MBbVrIr6D1z2/okOPIZO/Rx6ZD7stvKfMK4uo3EDh1hs5BWsX2WV6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792307829; c=relaxed/simple;
	bh=uUan4TmU0vUxvbUxw/i2eIb5myqFE5YLG0wMDDAUu/E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m3hs5M9bLxsjNeNHt5/v9IBMVh9JS6AZn8hSITxjI9QcnCBfWA4vhmOy1/ly7GCfG7qOFVVwOKIVUD9zK8x9UsJQ99ELgQSBerByLgfdr/bijnuNid8nkJAEEz8QOwJ6352Ghje3hXVfZKCQAo1/KmqO/T5cW3FPjYsiYMWd11o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lpKFPpDw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e+S6+rav; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lpKFPpDw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e+S6+rav"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69I5t3JN2593679
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 07:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=O+gTfOsXpjgINoG1d0vg5N
	if4Ym3/qlhF0e0i8UvHMs=; b=lpKFPpDwAMkdN8XUQIndBQzvBZ2MBBV2NChvwo
	X5xKz5gRmM5EohMebsyGml3kp1uKLNC30de1L441yoJcxDiUpT6LcWqb//uHi9d6
	ZqtrT2gJePYqNwQBSlDu5zJQqp9FnOFwW7TtJWjV1h3lv2K/PcvJ1FWzQrBwDB9P
	Xx8f0/89zoB03F4Vi2briXkC22p8AC1WfY4s+EMfmGNeQfHEwbCblj4WtWaJ7bkZ
	NF2DdbvRR8WrpdQ0q1buJ8jeE7nwOk0j2cQ3OhFGAHAoYoj0FgupTFQZ2QD5vLxQ
	CaWqFLw3bFTdHsC8sbTdv9tFrTLkB9AoeE4Yler3OG11JyoA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1se2hr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 07:17:07 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c5aef2a74so3067172eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 00:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792307826; x=1792912626; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O+gTfOsXpjgINoG1d0vg5Nif4Ym3/qlhF0e0i8UvHMs=;
        b=e+S6+ravRF23bt1Whqgu9EWY6B1KqQkJGXWsiRzB8zAF30+vwYOThL5SztlpzVv38L
         cwNRHAfJv5ei/Zpat6RqaiE5pTiJrUht6nSsjPQsOFQ4fo3ITDCSTvCIuDd0SHfohL4V
         LUYilOONH54TclGmQOBNVPMSqvR1HP3iLt2GQjbXCus3uWDNmn565kKpCcsLFlGx/AVm
         jZeypybnv4DkmfhAQRIa1VKyraQ6UHPKItGxLYoeHcmqbls9hOg70nn69RJOalR6tiHM
         hU7JaGWpWu8DsWFzyB6EWySBkmi75kAcsYqYqgzJRslH1k3D+utzWMN+OylunJnSPgQT
         NeNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792307826; x=1792912626;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O+gTfOsXpjgINoG1d0vg5Nif4Ym3/qlhF0e0i8UvHMs=;
        b=YopCOsW84HwcY/FdjQFiLGDwah5jT+Crrfrkl1zQxkvC0Mmqj8GHdmhO+hXCY5G38h
         6sgYhICaubq3bndA0FQ6+03fCgmySkPkoqsFSi7xgIFZP8rK8Dex7LDgtNhaKQ6DJbDX
         ID4SzaqUqtv7Gxr2aDzB0P63Uu3wmYhHs0Ho9yDCcmVPnETQ2m+rNhzSEtxGqSVfo3Ez
         Jaojy/j40Sr/GLRR1cL8fZoNkXAk0h2slezvH1TpAURoVYPM7DgBbrqD7kiD78/VnmZ+
         ywZSJN2y08BuDsQFJ6oC387kORDCxbWhN3bGAv6/1BGwGz8eIAH6v2xE6vQYhsZ+HX6d
         7gxg==
X-Gm-Message-State: AFq9FYIsx16JzN1DUxP4q9jUfJht8s/JMkqksbteiXSz0JLFrKOnYUjF
	uif+g++F1n+Z5nZ8V2syjZxG/c86UHVIPyPU1UyjqtLswg1EQd+C/yW3fyHR7+/Kp/MeSDbNAkO
	lxhZyZsNvDjnRWLHc6H4eSYOcPdKQhWRsDhdhRnnTs04tMilzfXftWt5Tz4AmaorBQfKX
X-Gm-Gg: AYBFou1TnbyLbg+n2OkGII+u1bQIUHfIK6zAIe41vFCUXBvvLidymoqiUpFtoVduwZb
	GDUPn5JZ4P0nSak42+pi+FvRK4Uxq24Ve6D9yCE176aaMJ1/tzyM3r/0R6Z8rxcJK+9rj4K4FTE
	+kBny/O/HwoLC3F7LKt4yjkWmXJRMThmCvr6gdmZbNSn3MJVeDzAYc1LyWg+nJm2I364BdgccHS
	L0JAsQV1yKN4gqlDw0kVBGMo+xBtMZwqKh1G3Ej43EDZv3Z90RVYQSHvB0bYagHYWY2Dhxged67
	cmFhXhNiIwvSln22FptwbO8FrHgBveeRfAztQ0BjzOSQ4mkgUKlc0KZFNfkYZGgrEUinVEdX+cY
	4DB/UOUcYGjeiMWrgr7SRgXvrXvgFz5P2puc=
X-Received: by 2002:a05:701b:450a:10b0:166:862b:9bcc with SMTP id a92af1059eb24-18512f1b124mr6603209c88.18.1792307826258;
        Sun, 18 Oct 2026 00:17:06 -0700 (PDT)
X-Received: by 2002:a05:701b:450a:10b0:166:862b:9bcc with SMTP id a92af1059eb24-18512f1b124mr6603172c88.18.1792307825668;
        Sun, 18 Oct 2026 00:17:05 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm18646776c88.5.2026.10.18.00.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 00:17:05 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Subject: [PATCH RFC v2 0/3] arm64: dts: qcom: nord: Enable SoCCP remoteproc
 support
Date: Sun, 18 Oct 2026 12:46:45 +0530
Message-Id: <20261018-nord-soccp-dt-v2-0-4d713d316e9d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF1y1GoC/12NwQqDMBBEf0X23JUkJUF6KhT8gF6Lh5isNVCNz
 VppEf+9QXrqZWBmmDcrMKVADKdihURL4BDHbNShANfb8U4YfPaghDJSSI1jTB45Ojehn7FtnfK
 qqpw2AvJmStSF9867wbW+QJPDPvAc02f/WORe/XDmD7dIFEgkj5Y6rX3VniNz+XzZh4vDUGaBZ
 tu2L5+btsG2AAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: keLRKzlXvwSS8M5tLiED2f_8AcF9s88s
X-Authority-Analysis: v=2.4 cv=A4z5rKWG c=1 sm=1 tr=0 ts=6ad47273 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vAcK-UyUk3z7rgjP8dMA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: keLRKzlXvwSS8M5tLiED2f_8AcF9s88s
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDAyOCBTYWx0ZWRfXxYXKEL/cDEES
 1oaD2YyOkwgHhVb7v6/jSRu8owhQAfQgN2nAtE30ezraTU3fuBK7D1Vny1oplKHpM+dh9qo+Bkv
 rWeKrrM2FMEqpFtPQ55P2kErN4QqR5U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDAyOCBTYWx0ZWRfXwvDDO1VCx0jX
 ++hJB5ikWj4c9Xfj3hf6dImxejlCZcLWHMG5Pa/4gCTnzxBNiYVyfY6n7/KgJIac/9JjBnd4d5m
 Karu/690iKgVGEeOAuwiWM69Dn6s3DGZM3/AR6ga0G7ghidtL8UAJhq1exfbRhGLCzpIrD4x0Xs
 6SjhnzWKBoP0n/h8uLjw3q2wP0yViVnXEj1nw/FAIlLgn/RWFLs4iPQFy1811ntoOzTXdY5CGib
 bFMwSYai2RVJv1KRPu5bQUTo+KlUhe3nG4z+uVzN+dHWPMBiOIh/0AzreSPvvc+ijSGUDUAqSWV
 YivmG6hMDh+wfOKaOi5KAy/N8UzKAb0Pc/Z26DvoO/4BqTVAHXY1yXtvIOgEDsk7ufi99lYanTh
 5ZCS50zN3Kzymo56TC4M279+4bDaw8huP3d3uvraBtN1Me8acVpKJLeO5G1KAsLVtFyZ1WK5wx+
 fEznnBtvUxE9HYq9OBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610180028

This series adds device tree support for SoCCP
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
Changes in v2:
- Drop the BWMON nodes from the Nord SoC as they are outside the scope of this series. (Konrad, Abel)
- Enable SoCCP by default on Nord and drop the board-level status overrides. (Konrad)
- Amend the RRD and Ride-Embedded board commits to describe the addition of SoCCP support rather than its enablement.
- Fix missing whitespace before the opening brace in the RRD SoCCP node. (Konrad)
- Got Reviewed-By tags from Abel.
- Link to v1: https://lore.kernel.org/r/20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com

---
Anurag Pateriya (3):
      arm64: dts: qcom: nord: Add SoCCP remoteproc DT support for Nord
      arm64: dts: qcom: nord: Add SoCCP on RRD board
      arm64: dts: qcom: nord: Add SoCCP on Ride-Embedded board

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi     |  9 ++++
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts |  4 ++
 arch/arm64/boot/dts/qcom/nord-rrd.dts           |  4 ++
 arch/arm64/boot/dts/qcom/nord.dtsi              | 57 +++++++++++++++++++++++++
 4 files changed, 74 insertions(+)
---
base-commit: 601369ae08a35f1698a96bbcff02f3665a0cf675
change-id: 20261015-nord-soccp-dt-bbc2d288c560

Best regards,
-- 
Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

