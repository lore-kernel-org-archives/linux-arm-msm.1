Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982028;
	b=FhsXOMdiHOwE/JiNoAg5gdLfRTBowTs/ER22IJdKqPhecVlrripMI65yVoEYgF4Ma2+J
	 pSrgwqCw7jxssftbrwsO4iUhKY28i/WVs8c1xH4zZY0MTO1QoItJgSsACdOytwlEbISq6
	 G8Vw9JSG3DERNgpck2rFheMpTteYtu0/suyLdx4goCpFZJeKmGPzcwspXhWbF7zHgvkiy
	 Hm0r3XUmruebcUhwOEim314b8XT9Ec1JWuv4jVW5Ap8WtXdKF54/hk4oOaLUy0j6tl715
	 c8ZhWrngZUc6BSs8Q9d+UD71BaxD9BCFULII5dNz0SuFwKa3UJMiIoPGIQ/mTRnFvfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982028;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yOCQbA2wY5BnvDNCmEwPpHQ2C1R6OpFI9nR4EwL4mVc=;
	b=bZlmjPtpMWcdXS+blXrMQkcid+hoThjLwNvB+yNceLbFX/FD79mqQk7DJCpBRDMOnlgv
	 SowoUxrvusrUMEqgXrdV8KUzuNMUuR0/5WC2ZCAfzSXnOTZw+mfK4ej9Rrl4iNilVhL4N
	 YDe0Otackp4scJucBnTXz7P8R6HtiNnlAMYWpZKmagrz31XHdKgHIOL2IAzD8dCpSbeEo
	 0+tgIi5MZcvyRH7ys4j+qzgrKxjbiaP8r2qgwrIWg/kSt5F55J5sl13+/ZpG4oJ3qkmGS
	 1noBd+SxpOW7YQRJ65mx8l9p+geN6I4dRHsL2W6D21OUn/TvbiiEO0hB4X2YgyuNuxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ocFocBd1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L1Vs55J3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA09606A330
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDA09606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ocFocBd1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L1Vs55J3
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uw8W472554
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yOCQbA2wY5BnvDNCmEwPpH
	Q2C1R6OpFI9nR4EwL4mVc=; b=ocFocBd1+X/sFdLPGnl5ewkR9MWzKhmO8zM35z
	Z6A7DBz6+yIvrTICliYcvxBWbMdLulaXxP8wuOHig/o3aUvET/YjG7pHn+aqHPDj
	Le3hkvPqg2acr5gM3e0czCHTsAYnYcqtShHsQzusIysyYcYMDambB1POfCIyvVSQ
	UZ4v4g0oJyhoClg7KCmeeegBvkryzmBHtoqhRY90cGaaSQi5H6eQH+o8A0CEmPe3
	DG77vGcFwHJFsuxjl5MRCpt3r/AwAr1/5ODFQbZI3ot3x2bTS6E4Vvyb0DLBJNbC
	62sOIWTRa/ofEleMpx0trbiQi90O/pkOe6UhoLR+79KeUmEw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv89f2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:07:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so797488a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 22:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982024; x=1795586824; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yOCQbA2wY5BnvDNCmEwPpHQ2C1R6OpFI9nR4EwL4mVc=;
        b=L1Vs55J3Iyqg2BbaPOj172i8z3Y5YLke5TrCM3igEkPqLyk7cqvmlq2SyjUwRbEleo
         c5BZJ2uVDHsMI4jtSDg2RzQmEXzHlzbGawWjYZEKUUsxzt1YCUIxj5pUPgjIpF2JhvyV
         xs2U5Y24pd+/TgHLiHTJLnN20rX81wQxwV6NlFQDkyhlmdyBIFaJGswP+Bv9pXw4viU5
         j0zxjiOVMMlkJRqnkT7y/7oMXr/6WMu9A5JrZDN4kgPEDrb6HyWHTFqRFXgfhEscPIk3
         /edmMmUJ60yILsuDqRP6/Yr4rLShRNpgcpqfeipFHTeBfHUZ9BFaPL99+31XYtdXIzLp
         qP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982024; x=1795586824;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yOCQbA2wY5BnvDNCmEwPpHQ2C1R6OpFI9nR4EwL4mVc=;
        b=hzFQUoWRSMTUUweL14gJEeBgsO6UG743Pc3gKtwOSWMLpCFCi75aTiLxMpyp5D/AyW
         nzDOwIq4io3BiWENuVvY7wVJf098Wtou9X7sKyS42tUDZYEIuTnk6drH9oPJ3MzXcO4f
         vWWlYYxV+ojnlxOBXDxNqJ4+i0HrVau1Q3fQs4Kp4bzXJAkwPgqyYw8FJt5oeVaCglTC
         CZ+5Au4tkShgAt/J1O7Z0jqTiOnvHXEYkmKzTstgXcKa9CmrToiuooCSdmROsHcErEdI
         7q4GwpE2QPDeEg6EGRJFUgP9X/phJ2cyTRh/smbi6rtCTwUk2xeUrkpK3hswJsvBGVoE
         eiWA==
X-Gm-Message-State: APuU4Z/q2gjdfvCh3ZosOvsffO1WDovLFY+8Yws+G78BqgxGzZQFQ3Hw
	90eGFsnzX3IcCSUYqDzIJsOvH0Z2Tt0ZJkzFEpj5RTlc7l/zpaecPYPqKgfq4Z/0ifLEbOFhIoC
	CAOEEpqHSkhhiXa+Iqcd5MZIENk+My4MY8FziJNBu+bcPBTQ+lp3n3aEOI9+ZuToDraYE
X-Gm-Gg: AZFdTZdolR1zNgY3IGHX9Oe2zTVPgrtweURXRcowSYcJcN9nBEAWK6igHDIkIjaNBEL
	nUyvM25VKFlT7aaS1OXfVdtIVnfq3cahrBGcsVDPCxfTOuJPzYIWZDD5mePlFpXdgwE4LAN0MgA
	SkZdfm9xYhr9SMHbsWOLsOpQq+wlQ7/2/i7IkG45qohLJ2xepUBFRQExt4LH8uOzpwL8kcuEObA
	A8pDraFxABJbCn2eu0FVmtqUjHxnR3SMkrXrldkDUuFe/Pzm19/z8ffDNaF9O2BQS7Od5DEpuk2
	cUg7fNJlMwZUfnMYs0Tlr+HuDVUSyigW7sKfa8xrWOqkll0RzrdZqNkIaphSbzYRI7V7B+F2zBK
	VkzyDCXG3MkNup7UjihIGrP1UchITuoYna1Y7EVSGcYY0tK0dNM4D9g9s4vgOXUavX/0GhcOJLI
	O5S8k=
X-Received: by 2002:a17:90b:3890:b0:3a4:ad5c:d48a with SMTP id 98e67ed59e1d1-3b3d07d52bemr1757187a91.67.1794982023760;
        Tue, 17 Nov 2026 22:07:03 -0800 (PST)
X-Received: by 2002:a17:90b:3890:b0:3a4:ad5c:d48a with SMTP id 98e67ed59e1d1-3b3d07d52bemr1757168a91.67.1794982023252;
        Tue, 17 Nov 2026 22:07:03 -0800 (PST)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abb786ecsm7476382a91.2.2026.11.17.22.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:07:02 -0800 (PST)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Add fallback method to handle RPM notification in
 MPM driver
Date: Wed, 18 Nov 2026 11:36:17 +0530
Message-Id: <20261118-b4-shikra_lpm_addition-v4-0-46ee87e22576@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAFlA/WoC/3XPTQrCMBAF4KtI1kaSSdpGV95DRCZ/NmhbTTQo0
 rsbFcSF3Qy8gfcN8yDJxeASWc0eJLocUhj6EuR8RkyL/d7RYEsmwKBmNW+oljS14RBxdzx1O7Q
 2XEqFSlxqo0Cjd46U8ik6H25veLMtuQ3pMsT7+07mr+2HbLiYIjOnjAqrKmU9GK39ekhpcb7i0
 QxdtyiDvOQMX40zXk1qUDQ0jefIbFULNaGJHw0m382iaBIkamONVyD/aOM4PgFl3JlUXwEAAA=
 =
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794982017; l=3315;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=PRPGaYLGmhNCUHjIssf8urCHwf49nXM/4eEJNt3ORxA=;
 b=EOohxv1ZnOJUxvyvaTp6btqK3MNGqfePG9Pi7+5ki2K19SbkUJM2hFpxvgve1ZKveGwU5OPA9
 OJmGKGltEwnAtzn5OiFdoRv3G0qvfPM5LipyJ8DKCk6/jhtN2mvU6WM
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-ORIG-GUID: o2edyHP3YIs9jEi3D5PNShKM5HhT3f6e
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afd4088 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8 a=-g7Su3eQ9jgtFDl0TfQA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXyEXq0imrAkq5
 cEXJumAyBk1IBIY7JZ1Vc0S82+Ooh14OYWs4V0xnvaDxrN4Gm1m2WX9558VPFHEVs+QVCllqmMm
 BQLde657uySpasv4nCKGCarlOiCSV14py4dubIRGsM5+3RgAI3YFfaHYaGn5JWWeZzWvdUiDoZD
 TbGurLSfn4UL61JHU/XNhd9x4SBFSIDFKzbZC1LdZjBuhz6/Z5rxAqlVGXcqQdmadB+0fttF2Mw
 1qxPyMIMwFNgqJd8xpB/DksP9N09YUcKkikf/ijIHbkbKLBQ+AQZDdgMP6oapcNCANkyvdNWoTt
 4Fcqk6hFvPGkwZVaHafxJWyiVUnfiqXUhJQE/HO/182fIf3Kh0aFnSc3cMvg+Uf69ZL6UMyMrRn
 YoCBR9oFDR+C3KfcBrVNXHW80J5PTPH9nU14ufjgAgcjTmqVt2I51yQk75cGiCK9F+MREDac0ze
 Bh/orHyfA+UbJ+Gz5Ag==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX3MNG+TaWFFhm
 eMmuy/HxZyw4byNLJ+jLlnj3kj3HkGXoIW8A0tskiNyyyMurUKO7b20yr8G6ufRBnEuPjXpdWTd
 By3gJVSYyhylQWVUTLPCDfPO0PczNbY=
X-Proofpoint-GUID: o2edyHP3YIs9jEi3D5PNShKM5HhT3f6e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

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
Changes in v4:
- Some code correctness in the driver changes introduced.
- Link to v3: https://lore.kernel.org/r/20261027-b4-shikra_lpm_addition-v3-0-424abcdcf824@oss.qualcomm.com

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

 arch/arm64/boot/dts/qcom/shikra.dtsi |  93 +++++++++++++++++++++++++++++-
 drivers/irqchip/irq-qcom-mpm.c       | 106 ++++++++++++++++++++++++++---------
 2 files changed, 173 insertions(+), 26 deletions(-)
---
base-commit: 7777cc195ca1301a28008ca5cdb98bdb2a9d0def
change-id: 20260617-b4-shikra_lpm_addition-4a9bc82bafee

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>

