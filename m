Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106758;
	b=UwEy9mRvVbs7nU/kUMEJxmW5unHwErziU/oxLcZjznihtasW0YAmm+QhYlLhQN9DU01x
	 AHCeqt17nH1bcJnh1MwFlOK/yi7beBSfxoLyskzDNMZTD0HIw2PjACvrmFXg6SyeTtkdb
	 lVnP8vu1ci+ouqmp5Cof+51eyV40/72P1moKi69pM3caY1kZ4U2HV3h93d5pxovSDwOae
	 blsm0XZPS1LESARhjwzYYwiUPkhtDvOG2iVt+vlZj0OPlr6hF1yheoEviXR8AVTaspvdY
	 QkkpUtmNtL9SThRF3gaiE6HEgZMxg+eFlg8/BUNMAs3ltaQxT7eEcVm560rMbyer4cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106758;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7CPyHB0PycX09hhRl0EtJfUyTlgtNRaedU8gXCm4IuE=;
	b=yU/BesYbIA5i+uS/U6n1ag7oSzCokKaSNFJALFdnkxLet1B/IDkRmSJ3KR1EVo5E+Tgb
	 fGXFVDnIJsLJ8hnLtN8hXQ7VneGsoPM5ZiZ6KFmgCYlEMXiSjwK8okMmYaVtRypJ6OIVN
	 itrT+b1nfVB9aRq04EFB2bfIvKKN7ND4gHeqpdV2D6uc4P7EbGhB46cMqZtdsS/w9Z7kV
	 l+NoyooSg0EV+vwsGmso8T4BmO35u005oNi8AIGtGLnK2cL2/52vMKe49eeTwB9r70yqI
	 EqXRsvYO8wwUViCd1UMsJFZGMuuc3GAa4sC0klRZkscUKcO7nfft5Qfe4k2VGn4uE9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dqtSX67V;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NgbPH6U9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1D2606A31F
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 13:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F1D2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dqtSX67V;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NgbPH6U9
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe85B3026300
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 13:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7CPyHB0PycX09hhRl0EtJf
	UyTlgtNRaedU8gXCm4IuE=; b=dqtSX67VOxPgfEiyDDPG3frfOnqYKsK6jplLSX
	urY3NnlFg4fAH3nQiEe/QGFAHqteb9SezZIF2c5caoM62aRaA4yVxL9YJtPM7B95
	r57tc+PkwubQWlsXyx56ZtUFkUddUi+PPryQXJm5nktHzh9ZXPm5x0X+YcfaIOPe
	Vtu1EfLL0lotWw/mnGsr3mcg+VFJccykpJj5f7cJ/7ShE8BPO0XrgRPSH9iec4tM
	o2X2ZMcgcbfjEuf6P7BLcRvtt07GomwPgnrH+SRRFC6HvNjcaLwFKfFOTDEhYsZS
	BDFoF897ELwV8YhHHVcBUiyKVq8XZO3exVfR5T2EGBYHtkOA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh91akx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 13:12:37 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8ace1d95f5eso69296737b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 06:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793106756; x=1793711556; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7CPyHB0PycX09hhRl0EtJfUyTlgtNRaedU8gXCm4IuE=;
        b=NgbPH6U9vTnKAJgr21XPe95ujVHVFvmNFrjFPydvJ9tWqYebG999VYTUI7jLFkSdIf
         I8mDMLu5oCivPxxwzBFk6aCZ0TMHNHiifpWUK1Z+BnrJ6pfUuvp6HQmwiOZY/1oCUMjt
         LRt60Wi6UZuCJ+BR6IyQw3FrAcF/OYQzjrDz7GCtnJMXEvexq4GAr1ty/VyQnDqKpHdX
         Hy+PXF3C0sVH3CQ8VRpqtiFxkpzve9bj6gleQRqIJ0UQMq2plSDlovxVT5V/otyhDl5X
         /U5epFXfpZEiU+wfxY2B1foK8x5UQgDKgylcK0nYFaLNn7X/RTt452vzOqqohrrAx40S
         u0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106756; x=1793711556;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7CPyHB0PycX09hhRl0EtJfUyTlgtNRaedU8gXCm4IuE=;
        b=DdJ1X7xvZ9Kc2fCmc2xkbuS9C2bzt1oaOE56YYWpUZk+btuiVpNPW6rWi6/2j5NyFc
         ErN52qpeBSiCw7J5qeyKfEbtCAJBIegEY2b+++EMZ+wUOb4ZSsRrSau6A5R9fOI8BzZo
         Mu6WvemYGD1+91wkaAL5HkwMNpnnjz1u6/cqmcqyRCWFuIiQwL800piCY0BeiM4m21E6
         0OM0FLYi4x6ojsNtM4LOAYQIlsNav5LLON5wmbdwbJaZmPMD/gBBbUGSOXC4oxs8UdUb
         5ywPkdQqpU+BdqNZoeCjEZVI6ayu3SzV81tjkuQyG2xC9CQERncDXrcXVch0cciGTP9W
         HiSw==
X-Gm-Message-State: AFq9FYKmRTXYg89Gb5wEAQduYHm7qEhVtc73bLKNytpGF3zy0vTyDuGw
	dfKIEUAHi6I3Os5HsH74wJg6xs8M1HRQIRcie/FO/7lIV5emgXGLjKn2/5RRLKG1Y9vwEAJ3aBt
	e9meRC+BzJI3Q9pO3n1waejlmX7Y75XY6x8OknL3v5CckH1XNZ3RK6DSqOUB3ah+mb+rT
X-Gm-Gg: AYBFou1Xnt4YiWI+cv2R1BGD/NeZdu81TH4VkIzuVS7jPYRBABuDdinmwch+3WDBjii
	RpjGGQzg3y8kEmKjZJqtPb2UDyhyQcPdxzlJSQ3bGxV/qgzk+Op8JUiee0uyHZd+tBRXIlZiS1q
	x7REUa96fMzP9KptQ5FkEa4/s3y20iMKDb5mdZ+gKUtzakMFS111qv/m5U4FuJ2dDOmGfGElWOw
	yy+vjAyE5dkAriOyxvZE7p9hV+qXAG2X9EjnU3WAke6hTNSnkXUnjceilxeJaKa9rl+okzFDqwk
	FFtoKu4XWTN47xDVE7DXolSB884qUrdmDKO3vGVT2Lj9zCqTOMp0doM1kShnJF2HZNt35gBUrmt
	YUL/R7VEmSJ2PdIin9MG4hj6VXxBV
X-Received: by 2002:a05:690c:34c6:b0:8ae:a9c6:2740 with SMTP id 00721157ae682-8b166c51804mr49998407b3.48.1793106756024;
        Tue, 27 Oct 2026 06:12:36 -0700 (PDT)
X-Received: by 2002:a05:690c:34c6:b0:8ae:a9c6:2740 with SMTP id 00721157ae682-8b166c51804mr49998167b3.48.1793106755356;
        Tue, 27 Oct 2026 06:12:35 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e5ea7b9sm10743547b3.32.2026.10.27.06.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:12:35 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add fallback method to handle RPM notification in
 MPM driver
Date: Tue, 27 Oct 2026 18:41:08 +0530
Message-Id: <20261027-b4-shikra_lpm_addition-v3-0-424abcdcf824@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAOyi4GoC/3XNyQ6CMBQF0F8hXVvSgaG68j+MIR2lESi22GgI/
 27BxJVsXnJvcs+bQdDe6gBO2Qy8jjZYN6RADxmQLR9uGlqVMiCIVKjCNRQFDK29e950Y99wpey
 UJrDgRyEZEdxoDdJ49NrY1wZfrim3NkzOv7c/Ea/tl6wx3SMjhghSxUqmDJFCmLMLIX88eSdd3
 +fpgFWO5KdhhMtdjSSNy9pgjlRZUfZHW5blA6AQbLQRAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793106749; l=3131;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=dVjgtspMHCfwvvtmrSjG/EOepUcFqgdmazLjIBANgoA=;
 b=y94OO4abN6gpgnWCw4Zq9jfs820vIQuUECd0oY9D+Gp69WkEXrz7LytSRldQWzTV5qgWqKa5C
 qgX8fz/A8XXBiEEj8jWhhy0Zi+JFaFhTIwRCYV/w1u2iyNc36fuuOhA
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-ORIG-GUID: gNUH6XOXJrNi4vyz1UVM5JzqQsW9V8tF
X-Proofpoint-GUID: gNUH6XOXJrNi4vyz1UVM5JzqQsW9V8tF
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae0a345 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8 a=-g7Su3eQ9jgtFDl0TfQA:9
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfX5h7Mt1MYcXYg
 vC5Ma1pHbNcRUS3ULUC49wFhF2HTd57AN5ml9+BE83uUsAA6m3icGJAGMlw0Fmy2k5fFixfKY3u
 wyOlgTaflJzK0Ru/hP+HcoX0+WUTKoH1dDiDlx/QAcoM60PIGkSweS1bgcAaDUr5kbHJ9v6JSN3
 rdf591U96ry+28jxyXyvt96Hs0DIbn3a4dxWO/zHTMoqMkVVJ4rNYjhQ/4rYsuPpKsQ+WSHUz18
 15s/Mfm6Jo3iFFLeE9dDTV39PuWut/dIkAF/oELw/CCzHIXS/GXKriVXxQfCb8M+cgYj0fTk/dg
 l/8xp7Q5JY2fIu5nf/Xkdr7aGaAw4PMCZe66RWS0uCIHysCM983nmN9nErLxq+VjpeVia4kZJ7M
 0h2orJZVhEVozqBN5hm8sQt/27v4xPE3oTw8RVqjz5ejTxStDPGMOewIjzIA2Y8g+aYZESrMDBz
 k3I1MVg3YAkAdrGnLtQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfX9pmk65PqYsrZ
 sxtNp0rHCYTPcN/A38ZfgOMvPpOCF3Qynl9xoRp+qOwqnHDUAMl/t2llbyXI5tqUxkri0pDt6Ar
 KlRvT74P+3lYDQ4bZ4L45u5w5DJA39A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270052

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

Add idle states for CPUs and CPU cluster for Shikra.

[1] https://lore.kernel.org/all/20260909134240.685115374@linuxfoundation.org

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Changes in v3:
- Skip timer programming for now till we add support to register MPM
  under CPU cluster power domain without blocking its idle states.
- Skip modifying DTs other than Shikra to prioritize Shikra LPM
  enablement.
- Move genPD/cpu_pm registration after mbox_request_channel().
- Link to v2: https://lore.kernel.org/r/20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com

Changes in v2:
- Enable Shikra LPMs in the first patch, following patches concern
  MPM driver.
- Register with cpu_pm as a fallback to manage RPM notification.
- Move USECS_TO_CYCLES and xloops_to_cycles to common header delay.h.
- Reformat qcom_mpm_offset() as per feedback.
- Avoid deleting cluster_pd node in qrb2210-rb1.dts.
- Link to v1: https://lore.kernel.org/r/20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com

---
Sneh Mankad (2):
      irqchip: irq-qcom-mpm: Register MPM with cpu_pm for RPM notification
      arm64: dts: qcom: shikra: Add CPU idle states

 arch/arm64/boot/dts/qcom/shikra.dtsi |  93 ++++++++++++++++++++++++++++++-
 drivers/irqchip/irq-qcom-mpm.c       | 104 ++++++++++++++++++++++++++---------
 2 files changed, 170 insertions(+), 27 deletions(-)
---
base-commit: 7777cc195ca1301a28008ca5cdb98bdb2a9d0def
change-id: 20260617-b4-shikra_lpm_addition-4a9bc82bafee

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>

