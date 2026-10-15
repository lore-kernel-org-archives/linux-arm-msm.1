Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C78497B96
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058138; cv=none; b=U+YeumiwUVEOgnrhWj5Su7fNhOlt3MR7t4VfJd8XP96i1Q42NtqJ66Spexv2vFAQv/F3vDs+9rP+GVXvfIx2rSvwfFSXidoHuU1Z2cEg46zkofe1duXZW85S4X/2oGp6Ax0nKPNPh3+rHQj0t7wmMWAWyvb8kGp0pCK0WYN17Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058138; c=relaxed/simple;
	bh=zuvXFCHS/nhMByhn2p8KGe6GFveXurDavEHYPA7bF4M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=q+a0LmcDU8qF0hf+wxSCqf6XF4e6f4ojO098O4LDUmh+vCJR5U7SnHn+4zqR9QzXKRQ7Lcx44XfSZ9O3upV66ZGZpg2EcyXKRnuNufgjwkUB8W0pf3hixNN25wuVK+NQ3p+rpR7N1qlo7nl3JYpfDOjB8qQtCFWs3PDxXD1pa7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CjuldHek; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dth/qEBF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CjuldHek";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dth/qEBF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jVeu2416814
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WyvZ8qBRw7K7we48lMPQ8H
	aYJ/8IJebU4K4q+EbfVCs=; b=CjuldHekRcv4/AMdaWpM6X8dp+Ef3pepSuvN6/
	piLKWiI1puXpU0TwZ7XLU7BSnVe8q2BwAHGiPWzhccsxHxVqR2HLXaUKhWSMMAri
	E3vt/zpLAKru1qTx4E2RYx+LgMb0SpxOPwMuqK8K6uEt7T2ZWyDDETNbmLsp6MUq
	dkVNsH3ImuRT/H/jBdij1ajJHjZ0IhCDgLUPGDawxFkBsWWuP/PgZFbrPeFzWLg9
	v+CjU5qp+vsp4L9siWAhMuByH1NCRs7/0aY2sAaFeLhRnnWB6VLkBpJq+N1K/HJR
	0qoY31BG33rRYg15D+eQuevIqUqFqoxdpMxeArRhVWJ4U7TQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhhfpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:55:29 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1663fb7e005so6516004c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058129; x=1792662929; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WyvZ8qBRw7K7we48lMPQ8HaYJ/8IJebU4K4q+EbfVCs=;
        b=dth/qEBFwA5Xs/YYztHMQqzkx46y0EZWKGxFjXw3M+2fN0z2G6hTWe74sPLIj5of+H
         b1UqFUdy407hRcmPZn02V1rev4yk/SwF3OF1mD2tuhifkLGpj9QTzaJQEtJShS+O/ADf
         9bqwAflUOvFrNGi94iNHGYCaj7HvBApJ46l3glP1QZBFsZX9fHW0UCp/XE2wvk0Kk11v
         X3BegfVH9EKY0yN0wWtNeD2/+OquU9PdXoMqMSs1QsLAvzTqOxITnhtYnEX6LdzsPgEE
         JK5eT8PpJIKrXt11IQ4nuIN6t4nrhWP+1FMxLo+foRfbAdBBlZqTueYZUopiw4K1g7GX
         z5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058129; x=1792662929;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WyvZ8qBRw7K7we48lMPQ8HaYJ/8IJebU4K4q+EbfVCs=;
        b=s8Kl2n9C9GFHGSfkjwyK5sZ2UAvLk08WDVXgImrqksDAlmpCEDVrONadgjcQXQzje7
         ZXEQ3YJgX8OLzkvLEmo2nZB4it0NYDKtoDo1zm8KbvxX8wDk/w4iZNMESYEz4wH71H1Q
         TNnnZXhA+jae62YjGIOmFivlRPx1XDEjOp9W/GNxI5ni4UUkmFQWg9iW38at8Lqzguc0
         iMj1X3jHQ6OFqRI/GLmM6GrLTXrN0Ep+3e5u1YPB7WYsxvTf95UEJm8Tdekeqnc2cUk7
         Tf7WtvjwFVstNPo2g9wvXm8h6JzEySyH1Z9yafm6gdQp3egp9zL17hM8H/nAC2hbyKn0
         /spg==
X-Gm-Message-State: AFq9FYJMYB73qFGvwJ+qhqdZeCXgKacuxLGLHs6SzUDWnYEMEFFsG5P8
	2Tv5Yy4aOppcZUt0q5KMMKeXEIF97HYUXcRFK+wEqWPEC1FOfsnnYgdAlZpV73NZ5m2oaNaTB/T
	7JjYEbWnNRHJnHQt/UaBx9Ko0OwMdOjJw0utTbV0BRO0Aq/dKRacTcY6MhR1A2o4BDnc/+JuXLh
	Qf
X-Gm-Gg: AYBFou0+7uW1YQx1kbbAbV/HhrQ4Y/W9ngiSIlFp7dfsfN+foooLoGuKOCe936GdJXq
	GR9xQKFmT4feiMZV/h15GKg0Ua95k6RmedrRspL8IHlzDCwsiYL9zyOaq/kkEiwTu/vKav6ZzsV
	TgKJ+0El7EZ3JsrPhIRfhoya4pYu56/4r9/BJEXpDB78I+9/FqNKKbzLO0Exq94vRFn5YjaYhtX
	7jWXFYz0yOvELRRxoy/+jAFTsKYYjhmjIrpmW64e5xrliVxbCOzpRFGs14q5jxK8MC6zNdpD7C/
	PULQ/j8ilr14j6NbanWJlFEi0NVL+38QkAme2Ui7B2aX8C+kjIvgGnj925maYdKzycOdyU3eON2
	tMg/dNwMESqVUQGqW827j3ods08pR
X-Received: by 2002:a05:7022:7e08:b0:144:fdf0:9d91 with SMTP id a92af1059eb24-16a61695832mr34478719c88.24.1792058128758;
        Thu, 15 Oct 2026 02:55:28 -0700 (PDT)
X-Received: by 2002:a05:7022:7e08:b0:144:fdf0:9d91 with SMTP id a92af1059eb24-16a61695832mr34478673c88.24.1792058128170;
        Thu, 15 Oct 2026 02:55:28 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm84476533c88.18.2026.10.15.02.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:55:27 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH v2 0/9] Add fallback method to handle RPM notification in
 MPM driver
Date: Thu, 15 Oct 2026 15:25:16 +0530
Message-Id: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAASj0GoC/3WNyw6CMBREf4V0bQktCOjK/zCE9HErNwLFXiQaw
 r9bce1mkjPJnFkZQUAgdk5WFmBBQj9GkIeEmU6NN+BoIzOZyTIrRcV1wanDe1BtPw2tshbnOOG
 FOmlTS60cAIvjKYDD1y6+NpE7pNmH9/6ziG/7U1Yi/6dcBM94butjbZ00WruLJ0ofT9UbPwxpD
 NZs2/YBUE4ZIMMAAAA=
X-Change-ID: 20260617-b4-shikra_lpm_addition-4a9bc82bafee
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058122; l=3659;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=zuvXFCHS/nhMByhn2p8KGe6GFveXurDavEHYPA7bF4M=;
 b=WTrWPEBOlhihxP5STVHc3U/9SmT+/GsHtaqtSGhtK5ss4NjY4PwYW3OHGhtEapOyWneHym7vl
 VgOrUS5UeqmA5+3bw5BKAmxpZ/fDLIZXaGuUKDGttS66p9mNmd7mwxa
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfXx6QxMJh8JXss
 7VG5Tw5Y0wlSxXxPn3/ioOQi3BERlP5nx76GoF7slRSTqXBd9X9otFiI0LrdUg1YMA09d2T7sHH
 mEhAq5N5NG8xG/BJsk9vNgstSo5JkMX8KCQ5+Bxgmwo5WsXBUZqkLp3vGYuXNC02lRJaKnU3b7F
 aNa+HnBBgKK3cYZWp2XTDZ1+N1V9R7OeviREoSTPZ4XF58y8pNiaAzjhg7bEcxyolebHcuZ4H2h
 bHZByibOtIXYukeuERJOG3fmnyjE3LFlCBj0xmkLfz6s75QM0KG01eoqEo5NYCJRSiMPPbDzszi
 LgsawG2/mosQ4qJrg36yP6qVWfIks/KMsGVkz0y6DjG9WLEX2js6o4YXsR9nwut50oirdVFfUy+
 26AKkHWAgW2HU8y3QB8PfXv59XrOkXUR/ysbDnxvaRwTnNRTKkBJ7NZo/eI+BBgJYzPk+Hufi6W
 UxM05Iwp1bU2X0JLJTw==
X-Proofpoint-GUID: 2k1CkWJ-XeDiteWAiKLSfaHNfpDEdsRE
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad0a311 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8 a=-g7Su3eQ9jgtFDl0TfQA:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfXxNxHVP/rThla
 xpLJOru+hvIaUCQNdL6W9QZhru740ejT/We+gCsmAvUxvA7frU93hwzf3HqdPFG2/Uf9XDZTTTI
 jXzyZLYvFHVEiI9ph8/tGKBTbGgnOxM=
X-Proofpoint-ORIG-GUID: 2k1CkWJ-XeDiteWAiKLSfaHNfpDEdsRE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150039

MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
the latest wake up capable interrupts when the CPU cluster is entering the
deepest idle state. This is done by sending IPC interrupt to RPM and is
implemented as .power_off() callback by registering MPM as parent power
domain to CPU cluster.

Such implementation earlier introduced a hard probe dependency between MPM
irqchip and CPU cluster power domains. That is MPM irqchip needs to finish
probe before PSCI power domains are probed.

The above problem has since been resolved after bd7f488a8e5d ("cpuidle:
psci: Fix support for probe deferral by dropping the faux device") / [1].
However, it makes sense to remodel the RPM notification in MPM irqchip due
to general consistency.

MPM is not really a power domain provider, all it needs is a notification
when CPU cluster is going to power collapse to carry out the RPM
notification. We can register for CPU_PM notifications for that purpose.
This way we can avoid such unrelated dependencies.

We cannot register MPM under CPU cluster power domain and rely on
GENPD notifications here, since that way cluster low power modes will be
blocked whenever some consumer of MPM, and in turn MPM itself, are
runtime active. This will add another unnecessary dependency for CPU
cluster low power modes.

For now as first step, register with cpu_pm as a fallback to manage RPM
notification. Trigger the RPM notification when the last CPU in CPU cluster
goes to power collapse.

Add support to program MPM wakeup timer when CPU cluster goes to power
collapse.

Enable CPU and CPU cluster LPMs for Shikra, and CPU cluster LPMs for
qrb2210-rb1 board.

[1] https://lore.kernel.org/all/20260909134240.685115374@linuxfoundation.org

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Changes in v2:
- Enable Shikra LPMs in the first patch, following patches concern
  MPM driver.
- Register with cpu_pm as a fallback to manage RPM notification.
- Move USECS_TO_CYCLES and xloops_to_cycles to common header delay.h.
- Reformat qcom_mpm_offset() as per feedback.
- Avoid deleting cluster_pd node in qrb2210-rb1.dts.
- Link to v1: https://lore.kernel.org/r/20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com

---
Sneh Mankad (9):
      arm64: dts: qcom: shikra: Add CPU idle states
      irqchip: irq-qcom-mpm: Register MPM with cpu_pm for RPM notification
      arm64: delay: Move USECS_TO_CYCLES() to generic header
      irqchip/irq-qcom-mpm: Prepare common access path for timer and pin regs
      irqchip/irq-qcom-mpm: Program wakeup timer when CPU cluster goes to LPM
      arm64: dts: qcom: sm6375: Do not mark MPM as a power domain provider
      arm64: dts: qcom: agatti: Do not mark MPM as power domain provider
      arm64: dts: qcom: qrb2210-rb1: Enable CPU cluster low power mode
      arm64: dts: qcom: shikra: Do not mark MPM as power domain provider

 arch/arm64/boot/dts/qcom/agatti.dtsi     |   2 -
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts |   2 -
 arch/arm64/boot/dts/qcom/shikra.dtsi     |  93 ++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm6375.dtsi     |   2 -
 arch/arm64/lib/delay.c                   |   8 --
 drivers/irqchip/irq-qcom-mpm.c           | 166 +++++++++++++++++++++++++------
 drivers/soc/qcom/rpmh-rsc.c              |   8 --
 include/linux/delay.h                    |   8 ++
 8 files changed, 236 insertions(+), 53 deletions(-)
---
base-commit: 7777cc195ca1301a28008ca5cdb98bdb2a9d0def
change-id: 20260617-b4-shikra_lpm_addition-4a9bc82bafee

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>

