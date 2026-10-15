Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AEB40DB40
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 04:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792037574; cv=none; b=bQbEpt1FiKaf5OMaGERBmr2xtANLjSo2o61blaPU+um++0eC5F4qBKFhoPnk5lOfU5vvVyXTKgRK6ndV1ffYIrA2cxmhYCFfxLM0UWuOVMfRND5TqFRyBW2tGGAHsiMYfuA3Id02WmVHVNGHhJ6exlpAF489jHLtgoutLd6bBrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792037574; c=relaxed/simple;
	bh=E4A+3529DCvQc6RsCNPiKJ51KMeeH8suMBGsrnaqZh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V91nXyJFF+ZBOxyHBAs3xLx21M/GTupWsNZiyLScmTShOUBCLRjgv77qdQyZ7K8vIKfRm4Sz8AOe27QOBn3rtcJDBAUjZbEPCRRxyAlaOOR1i8yScK6uEZy+vpBOmS84HhdwghfzI091C7K6QE0DWscuRVUUR9AnrZu8LO1IhxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UlqcccOy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mo43g8sF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UlqcccOy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mo43g8sF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3xmZW2739406
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 04:12:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=h9AQmlLMV/P
	ahTudrlV4VavQD0Olf3XcGpTpP5eYDUs=; b=UlqcccOyc+v8efZZJVs0lCmAdDO
	QrkEYu6+DWxFWN7UpGbE1oKf+bGNhljun2GcVZ22CG/7e9VX5XqHmCk7TXKTx60A
	WKPqygHtnpSaP8cUwKxj2aJgIPC62VslkcHk+Tylni9HyX+BvHIXlI7/+Mk5pbHU
	Li6QBip/jVcn2RtkiuZJeDMF93nS6onr9NJSq5sery/dgtmpbfCKO1IDqwyQ2tpg
	glbMdkSElMO0AKUJyTodhCQdypVx7aZe8cgP+FlN6WhQmgjMhtu07L40rVuTdOiF
	TBfU90wZKbs84TvcZjTwbLmy0h4Oe6BA71TZoiJl/k/S6QlVW9kmnzN5thQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqds81fh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 04:12:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a50912f243so1224221a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 21:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792037571; x=1792642371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h9AQmlLMV/PahTudrlV4VavQD0Olf3XcGpTpP5eYDUs=;
        b=Mo43g8sFcvL5zUAlovaueIBCrylr23Yvkb34LGwrikWxE/wWJfv5N93hgI4rienaGo
         NMq+pVjrH3hwsnf5ph3P1vuC3qLBvRPsNy/2GRu43LD59/yaSBgz1m7Q/GUzNUvdw3fN
         wDncAwc7Ljih7LUZlw5M89E8AWDQ3GZjB9WWJrJ7M/k19JW00+PR2H/YDhMMWXGShkDM
         SnOzpgytaw4WJab6Rg18yKtaWlIH+xevYlNBt24cpiGMbDdNkPHs4f84dMgM4masjsab
         riC3H+2Ex9HR1vAShbBjAMGPi8MjxzjAzIVR9aiUH7OaI4czeAs/e/r6m1wPzKWnOW4q
         2rYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792037571; x=1792642371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h9AQmlLMV/PahTudrlV4VavQD0Olf3XcGpTpP5eYDUs=;
        b=wW8sDK3QT0y8fTL2QaI0P/Ze8IfhIuRQN/zsh6Us9kwBMJV8Wws0Udiy6ALV0mRNxq
         t4gAm00WUDCBDPGzBanIcsbzvW2vRR77aVQSWcvPKBycc9D0i9d7sHskiGmYsbz9gFxf
         EptZNop11IdfSEdsQbScy9JxIKpEzNDYbu1T3gD6H326UnHLaKbbAiImTMUycOfIWlL9
         DFBV0RzYOxM6GyDpsa3mhNLDh2PGpl2xmV9cUk7pfupcfp+ehV46R2/lRnZTuaiNXO+T
         1HIXDRxHGcGAVn1Io3nIoWYRrhnRQudKEHWaVXCcl9bMtZIBYLKDhC3rJb47GV202Rd0
         /06A==
X-Forwarded-Encrypted: i=1; AKwUvBwA4O18wLjdgG+QkjlLz+vms+GAscU8g44qkn5MZZHzi2oNQhDq8nMEqUU2QPAz+z07QJ2IxMQxBgghCv+K@vger.kernel.org
X-Gm-Message-State: AFq9FYKFiITiWXNZ0jdzR7GWjFfJzmjK0H8hTP1SjkF6pyn8uaZ9Gjht
	jTjDC/sPNqj5oi2jyjTpHLm4pjzKq3bqMKVM46x0QZfJx51xrwpbTyffS8RGPV7c9fY6EeynKhv
	gXZOQV/lSYCuYYTZI/8FyLZ9ZvGvMebDLEuZW8KM3xKT3z0mjR2s2QEPMgMIpd4TfX8C2
X-Gm-Gg: AYBFou2dCTBhB4jrEo4LR+ftNHaO/iLohNkSSnhBz3o1dG870ExDd3nDNh080BJb8Cn
	1erp1t9RYRMnWJYOlMuSvKZDDzgtot51JgE3WF7TE0F1ofFru6bSnFTN1c7IsYhnaf8KxL7GB3C
	vIuvDtmXsBb1X2RfMnVilZahGCiU72oQYXXq51S8NTEo9Fz1HJbPkxXG4HYP64gd8+E2LLCfPro
	0ioKcxOqu68a984siUhkZCmnLYzhTT3mAhKujoZ88zsyRtvYwPfoVMfcEKkIm8MGYf29ZEGfa52
	w8eOpJire6Qv2kHGuAasiogVuA/3X3SJ/NANTozNoca43SaKkzQRdY3JClNgkRlowipzyx4gvSg
	JZP99O1+6DIHFHXS6Y39NBRQuMd/x
X-Received: by 2002:a17:90b:384b:b0:3a4:c895:570 with SMTP id 98e67ed59e1d1-3ab3a8f8f1fmr25571062a91.4.1792037570934;
        Wed, 14 Oct 2026 21:12:50 -0700 (PDT)
X-Received: by 2002:a17:90b:384b:b0:3a4:c895:570 with SMTP id 98e67ed59e1d1-3ab3a8f8f1fmr25571027a91.4.1792037570349;
        Wed, 14 Oct 2026 21:12:50 -0700 (PDT)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944af2f1sm2267762a91.15.2026.10.14.21.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 21:12:49 -0700 (PDT)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [RFC PATCH v2 0/3] power: sequencing: qcom-wcn: support SW_CTRL wake IRQ
Date: Thu, 15 Oct 2026 12:12:38 +0800
Message-ID: <20261015041241.2186521-1-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: w1PwVZNIk86VpWi8CdEpKNjD6LvgvZ2G
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad052c3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=Hpyza0Sh0NQsHZQy3zsA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxNiBTYWx0ZWRfX/mHx317GpGJs
 79Yla+ORaOSaQkrivgy33Mf53I1ovdNFMOygaoMIQ2/GTtjFaOxMpuX8Tz9L/ffn17a3q9USCJL
 6lF7vFq7AMXnEXrEP+Em+zEUXg/p/i9LbjFy4rWB2q9MQ5yISIccVe08AWtZ2E5cteHrQam9pl8
 5TbEXDw9GeTXb6dJAc8aVcUD2x02BsXvCeLibtgdf7eynaxtUb0YuTyDPr7jXFrnZM9KbTj3Om9
 0lAt2JHn7YS+CvKuod9DbRK6dWQTIBLQVYKg8yKtj0MWHtV1V1RX08lmWVfu3WOMvQwnbKa8JGP
 cot0SlzXM21WccytGrn+0ql5V3fbyvnJa/IsikSWTvV4yv/ue8y7GTjSAynCNJKXqK+jVtCXT3k
 NmhAroGJOB9dTwmRbBJkjTZ6zi6EqusoejCdqEmh5XNAk3ojFNYyKscdfkBu0/3QR7F8OI5mAh+
 ZjxBVPEX1mA396Ap9og==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxNiBTYWx0ZWRfXzLk03wMjcvn3
 BuyL54xJXoxoZHaSHr2qFU5S57uaidTHbYYGHV4XfRU9CCWW9dm5LaM6m6PEW7SXuJDNZ6y/tlf
 zTbEUHqTlwvW9e3zgf/5GCG0+ECFO6s=
X-Proofpoint-GUID: w1PwVZNIk86VpWi8CdEpKNjD6LvgvZ2G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150016

Some WCN3990-family devices use the SW_CTRL GPIO to indicate that
resources must remain available while the application processor is
suspended.

Teach the Qualcomm WCN power-sequencing driver to use the existing
SW_CTRL GPIO as a dedicated wake IRQ when the power sequencer is marked
as a wakeup source. The PM core keeps the IRQ disabled during normal
operation and arms it for system suspend.

The series documents wakeup-source for the WCN PMU binding and enables
it for the Shikra CQM, CQS and IQS EVKs.

The series is based on next-20261014 and has only been build tested
because a Shikra setup capable of booting linux-next is not currently
available.

Changes in v2:
- Derive the wake IRQ from the existing SW_CTRL GPIO with gpiod_to_irq().
- Drop the separate interrupt description from the binding and DTS.
- Focus the description on the functional behavior.
- Rebase onto next-20261014.

Linghui Wu (3):
  dt-bindings: power: sequencing: qcom-wcn: document wakeup-source
  power: sequencing: qcom-wcn: support SW_CTRL wake IRQ
  arm64: dts: qcom: shikra: enable WCN SW_CTRL wakeup

 .../bindings/regulator/qcom,wcn3990-pmu.yaml  |  6 ++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi  |  1 +
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi  |  1 +
 drivers/power/sequencing/pwrseq-qcom-wcn.c    | 36 +++++++++++++++++++
 4 files changed, 44 insertions(+)


base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
-- 
2.43.0
