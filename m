Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01A821A95D
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 05:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785131415; cv=none; b=EM556GB4BEgd25uT06mrVpwsmX9M1nRNlgStomU05dmgvuEi1x7DkwWn1QkK5NAzi0zKk4S6trojz+XGjdL0livHWV1ggenkkaPdQaGUx3rzTAE+erkI/uG2dEmrrXSDaAZN5/EoqJmSpeqq80Ckp2YCc0inmuUuoWT9DhDMPo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785131415; c=relaxed/simple;
	bh=DI7uquLPZfrzyLlmWn0qBbixBjxqqAUijuXsxGR4sbE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z1fGdnoLC4E5ACF1bD5Ny1nqvayGAtTT8hdSjpR/kFK5ugZfUCSxSjRSSoWqiomcLsglOOlN2lbOeEY2s/AaeYj00sS9iuP1u/Y4YoS0oe8p/sKqQo3+5h2xVzftqdZw80Dw1JaPfIC6SkPiCu+tQxAlkjxROfDLmIinBeBRaS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PSqIjbI6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UedlcmeR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSqIjbI6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UedlcmeR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1gLmV2417601
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 05:50:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DsLW2ScIO3HpYUASwYwisH
	IZJtfA6zMzHxtwObJo5JQ=; b=PSqIjbI6pGJ+fW0Dwa45kFa+a42UJTmICiqUhA
	3Fcy1xohtMwLSsnJmdces4hXMUAYYAXy5uz77b814gZwtpiE2GnbrS2n5bxX78u+
	9ZkwkkcbTOvGdkk15O6XOZaLbws5sxzeRmawLeLT8PU0SHhPLXi4j/T2yHTBBrfS
	gFy02uCGwf01ij4WVc0P0v6VdfX4h80A4ccMRZHrELgMSd7EuOZ56qZS0/HdE5IP
	4RDV1X4WYnVC1xO/vnDK/ZZ+JPdCyKLKFnAWSPm+Q8De7yp3MONznkUcjzsi+jez
	oIFj6J0XhBzCjxdzCcHgPkXIkZOukDCC1QZmx7LUJBTjY/ng==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmmqycq0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 05:50:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381250979d5so354146a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 22:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785131411; x=1785736211; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DsLW2ScIO3HpYUASwYwisHIZJtfA6zMzHxtwObJo5JQ=;
        b=UedlcmeRCvW+oPOdM0a7wi3uGo3vE/txzYNsTWcMSlL0cXIKrHkYT2wCcHVlokfv6s
         2jy0HDPnWZIl08rQF17gQoP1cmf/jWRehyUp/1e/muXBnhMScJ/dGh5mVCsIBA1Ld7yb
         +upUGjSEYW5hokId40zP5psy4s3J4Y43yWMhmQoxekJnOiGAAbiOw+tI6KpBWfPTy82n
         4RwXg+U+WBccED+LdQ4g05MEtWpSGrPXEzVBlmKuSXv2DAqCyFV11Eda98CuzTIms9Gp
         X1ZMh3wgwPZ5MrThvTi9Y5OBvKLeKRl1gadtPwhMnagT6svEtDI8u1YyToo3AUhcAJN2
         EMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785131411; x=1785736211;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DsLW2ScIO3HpYUASwYwisHIZJtfA6zMzHxtwObJo5JQ=;
        b=g1/TeaH6lP6Pk6OHQgxi727Pjpjt2ZmIf0UnsHQnJrXhuAdkwzRVGAIu7FCDuo9v4j
         GhDTg4t+ohAmHCxe5T2F+m/WPJr8ZlOeOCRUX3epLnMnxQe9nJYUx0DcVcNS3Dhfhc4N
         Cms6I+BCRVYZytT1nNSH9ocUlXtcA2oTUEZiNxYwxf3dRO/l8nMJ7gQiSLLL/BprYGBU
         A8hbPkkuMWXpUMFJXTl+sE8u+BnWpTExDeqWKe7jBivbS8+4ApZnGfDcSgXqxscnd7sY
         frmw0DeiQX8rL1mtzXsZsSYnVRW9GCQfsNf1KbsUBfNqStmP1qJisZsh87YiyVJhXpXV
         vkXg==
X-Forwarded-Encrypted: i=1; AHgh+RrPqlAql0azlNPlBcFEpLysYTS6q7E6APtn1wjrTj9p1y7LCROnT39rvxIqIAxqdTACUY8pUSNKKAimiJMd@vger.kernel.org
X-Gm-Message-State: AOJu0YyAZlpDQVAppZ1EpJqD8W79YpCLPRtyba5hyXZECCW12cn9joEW
	c+IyAM9FvSt0VxOIGZTKdv/SKsaF55jEasB80++xu6iEB3SX2yJeP3n7ReohtWDqKEEVWCo3TWG
	O/7hx7i+3T4XiB/WhdTND31ZU6KP8PpVeNO9NwnEruzlnfIqTRIDRgBYa0WZGPJisyyfX
X-Gm-Gg: AR+sD13OKgGjunzlbNJT/vLXJd/uaBgBECAGAv/OEV0h72e+jdGP2HF4W6JQXdneJRd
	lDS4WsLOrpIOi2PjtRjv7LJE5G7TBLenwqm7zh4kRxrifF3tmfISyIa57t6yKyxLjneayB4ZWAa
	gGNtZb9Y2ImZwa/zyCbXBw0gTEA9XATMaUlt2rnyjihA6xnuEwrhwXUelXZ8grnKwQG3Yh72ITc
	Rc/ntrTUz+iN1+GNHoQg/AeHXH9xynxo5SbXrh6VrHX6/GL9mnkVaTxOz17OhOEyyGTffX+bwTz
	5TbfOyP5J1pEtkR8mT6ow4qoFgMDSXsiR6zxxWM7E3PVgTFyNbRxY9OwtzOJuN4z0k40FNa19eQ
	+UQfccgEQ19PJzF6CT4AuCO26n3ALDHH/Vxpo5+tSAJPwy2eE7Q==
X-Received: by 2002:a17:90b:5347:b0:387:e0db:bc34 with SMTP id 98e67ed59e1d1-38f298b386cmr6564372a91.42.1785131410744;
        Sun, 26 Jul 2026 22:50:10 -0700 (PDT)
X-Received: by 2002:a17:90b:5347:b0:387:e0db:bc34 with SMTP id 98e67ed59e1d1-38f298b386cmr6564335a91.42.1785131410250;
        Sun, 26 Jul 2026 22:50:10 -0700 (PDT)
Received: from hu-doz-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc549cacsm27934761eec.16.2026.07.26.22.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 22:50:09 -0700 (PDT)
From: Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: Add GPUCC and GXCLK support for Hawi
Date: Sun, 26 Jul 2026 22:49:52 -0700
Message-Id: <20260726-gpucc-hawi-v1-0-224e7884cf9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIDxZmoC/x3MTQqAIBBA4avErBOs0KKrRIuYRp2NhfZLePes5
 bd474FIgSlCXzwQ6ODIi8+oygLQTd6S4Dkballr2Uol7LojCjedLDpsFFVNp7VByMEayPD1z4Y
 x23HclnB/75TSC/5zan9rAAAA
X-Change-ID: 20260705-gpucc-hawi-8c35e13866fc
To: sboyd@kernel.org, andersson@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robh@kernel.org, mturquette@baylibre.com
Cc: mike.tipton@oss.qualcomm.com, linux-clk@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        taniya.das@oss.qualcomm.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785131393; l=1260;
 i=dongfang.zhao@oss.qualcomm.com; s=20260706; h=from:subject:message-id;
 bh=DI7uquLPZfrzyLlmWn0qBbixBjxqqAUijuXsxGR4sbE=;
 b=SZivjTNAzXEcQE4VuJtqU6VaKkaDtSIc9IkNNLwn0voLKuYCve6bhnr8h5KfTJYQZylJuubih
 txLMWe3tMPwBUz6abqcRFT88RPgiFKV3heumKM+IfutPhEsca4ttU+6
X-Developer-Key: i=dongfang.zhao@oss.qualcomm.com; a=ed25519;
 pk=oRbMthG8BHvTvcxks87U5rUBoZiRXWKs6KZR6lV5C64=
X-Proofpoint-ORIG-GUID: CRo66rj0PdkyQkUwQU8PwDrt_7cwE89A
X-Authority-Analysis: v=2.4 cv=drbrzVg4 c=1 sm=1 tr=0 ts=6a66f193 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=LjwRoHMMlgVm7myvQdUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: CRo66rj0PdkyQkUwQU8PwDrt_7cwE89A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA1NSBTYWx0ZWRfX2NEExU6wcKKK
 ptIXX7lXeGAJ+VAJcZuq7APhewIGYIwygY5v65/jHcOJXr0OUqiINCxI9m5XsByvsxvJZ7pDYlq
 G4qnetFwvM63QzDmft32Ok0RhR5U1BdWLziTeF38IW9PZMnmV1/VTzsdu/MMpwPXDn3yYSRIhWM
 gRSPxHwwKZBWFJKcKBo0YgzYIXwRDaMAKed8vI1XYPP/nQVP6LWJ27kwut8wrZBADAz4iKjyx8D
 HY/MTG05UmO2sXjzzvgE2tjdm9WhoCK8T1kQ/aLfwea5C4uv8hMWcvkxoUImAkWvNqyItbJlr59
 9dmOa/qygL14xmfHgxibKL72eNo5yPAqGF4/Lv6+0AbXQjtPUfjRqc/zkSqtnWEhN3v7KKy6q4D
 vGHUZkGg3oq8gVRhrWow73n+VBEZXK4sOWl08Tq1FZ7YK+NlDOCXrh8iTuG3LTmtWW2O+kFSoiV
 YWh5vtSkGBsJGYYnSTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA1NSBTYWx0ZWRfXzXeVnEiB05vQ
 KNeiM22dOgGmWMrGViG1AlBNbWUOo2+BE4J/ScA5ndKXVf7BnXIJGtdn8ilPEzBAJKZEDvajICm
 rpYAPa6/4lkcmiygVT/iN+PnsqgdLmw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1011 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270055

Add GPU clock controller (GPUCC) and GX clock controller (GXCLKCTL)
support for the Qualcomm Hawi SoC.

The GPUCC provides clocks, resets and power domains for the GPU
subsystem. The GXCLKCTL manages only the GX GDSC; remaining resources
are handled by firmware. Hawi's GX clock controller reuses the existing
gxclkctl-kaanapali driver via a fallback compatible
("qcom,hawi-gxclkctl", "qcom,kaanapali-gxclkctl"), so no driver change
is needed unless Hawi-specific behaviour is required later.

---
Dongfang Zhao (2):
      dt-bindings: clock: qcom: Add Hawi GPU clock controllers
      clk: qcom: Add support for Hawi GPUCC

 .../devicetree/bindings/clock/qcom,hawi-gpucc.yaml |  78 ++++
 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |  22 +-
 drivers/clk/qcom/Kconfig                           |  12 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/gpucc-hawi.c                      | 461 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,hawi-gpucc.h        |  47 +++
 6 files changed, 613 insertions(+), 8 deletions(-)
---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260705-gpucc-hawi-8c35e13866fc

Best regards,
-- 
Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>

