Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794545741;
	b=A0WHeyaTsPaIgdoLGRnkQKvkG+to1/mgpYC6R02ErhznBSmtT5QlnJn5/3NHyoKouG4r
	 vhpficAl1W/EZB3lznVq2StR4dBMQ2SPciBNCrC3BqKLyLqNQkCYp7b962iChF+9DZzRU
	 QZHT9+euoXlxrTEutjzfSeGIqeJ5yPnPBAEu7UTI1TGt/kcKeM5AcQsqoFiHVhdDnyuNW
	 0ATP/V8iT9nJZm3wPxrWaimb2eQmxOABGbIg6iNkaqJEuE3e9wePDp4ENol+1E7T8Dse9
	 5NferTX+CZXjRcESGPG7yTFYuH6NJ3SpFfOjicXEuibZu1vaUMSAl37Rw5HXhD3kcPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794545741;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lIx2CS6fCKzreivxpI3mpRmL8+uVjdMEVbrcvV2S/hc=;
	b=L7ZJVhQQXvCQBUrVxEk7CX4MQAsecOkd7AmFxr3hg1fpdKGF/1wpVrX10Du6taxZWcHc
	 hY2jSWtrmiStXdu0VflCIYrUMF3gb1NEgoCw5HcaA1uhQe4h3mJPgggKYDb2vfUQa0F6g
	 FtoGrBDBIql9h2JJRIh73TcJDckY0HduKIb2j43dL+kbF4BA2CT7A6krZkBo9gtNSwf2n
	 HF/GjMXbunt8ZRpTzgmYuyXg7vO8XP5i59/zVIa7qteL31uQH2Ws4zrxd4YQRghYNp4ud
	 i8LHxggXYCbikvHibnSw4DF9Iwx6w2CKqFfeBEOlI0TXUKaHbB6DeJCnGDxsNpF+4VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=daFS2vY3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T4yh41oD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEDB606A323
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 04:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDEDB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=daFS2vY3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T4yh41oD
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2K3vv2636666
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 04:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lIx2CS6fCKzreivxpI3mpR
	mL8+uVjdMEVbrcvV2S/hc=; b=daFS2vY3tyzzpbHxBcyvg9JvBDBwIna96I7QNn
	dVU7jaOdRvYClEabSoM/8bNUlcN7wh/N+vteKMT0XKmuHqskSSUKRUmxmK5iWs0r
	dApJaVx00VcJFk5fvqKzkRNGudCO1LCdfj7lIBcEqihTkH+UOrVuNwIu/wqq4NMY
	Kl2jiPf44mW7NyAFxPmTJ4FvTtfVHH8xKsxCGrrYcmpVtUuSJCTfPPT1SxNAeoHg
	nWwBsfQzypRYZh+n63bQ/6CCZB8/ERTL/h2N8lGNSIHNkevWiUFb0XyLt0oQW2aY
	IswJEfj1AcGvrNX2PwBqBEtGP18Oz+vnewkiBQiahTOs+lDA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re4nns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 04:55:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so406150a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 20:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794545739; x=1795150539; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lIx2CS6fCKzreivxpI3mpRmL8+uVjdMEVbrcvV2S/hc=;
        b=T4yh41oDdiXb+vsbtQO/66WyQmqt5b5xUQLtoWFPViXMuLIvZw1HoHSBrpudbeeNxK
         Xiq7boykSSH+VGapAFcnT9IX43mbTiUTcgI7PVbK1xwkifUhw+d+QdwjQeGhTy2tUVXS
         F5eNDV2FvyIaxT1F+BHslptbqsX4ZZJv5zTm3LApoPkd1uZpRqWOPPmgRKBO2o8BzfnV
         wEs9sUQPuEECBxtYWlSy2DYHB6ucq+uG8ydVA10XKOUD9qhLImLpfmseyPbnp2tuVc4j
         x4AOkbBqiLPU1b+DtusAombiE7KXN/rWl/Mx3aUu0eGuVkVRwDC5vyVIwPh6OKeS4SS1
         qQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794545739; x=1795150539;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lIx2CS6fCKzreivxpI3mpRmL8+uVjdMEVbrcvV2S/hc=;
        b=PzZYMdNSt3+06mCgqVS10VhOy9/hZ8pB02YlUOhpwn1xjGPKZgYGfryaC7K3BsBNL8
         fT8aWxtognK4LEh4+vo9Bb+XRAI9bARofXqM3PKcGYLS16aZ+xtx0Cgo1Han58JU8tRl
         s2K2kOmqgVQmBcB7BJiJOTh9hzb0MSV0mzHjJ/pQdIUqzAYBLcZtVJEwi63AC2K8n7Qx
         anoYyj9qd6yny9zlzEfq2t4T4KfXz+nc5H2D3fJtz+SJOZd/BZBJhObnmD0EvZv7ydBS
         q4WiYjQmdLJrtrxbFaUW7fIdhW6IzaAUfDXpA4ymXdE+z9IEjvjHd907SicqcCymS2nA
         M6dA==
X-Forwarded-Encrypted: i=1; AL+hErGWchVsgQfo17Tcv4YqH720TMC0+bV8KRLTdSv4bdSBalyc9n5QlR96KFEN09KhqwZYzEK9ho+Yy7hbz+1J@vger.kernel.org
X-Gm-Message-State: APuU4Z+2OcOCTMsSX3eEC5OxXZU0vWWmsFkUB5GgROP67SwHg4qRCsrn
	5eCBQT1GUWJ7NouW/lSb1kY6aYGVcWSbvyzi/KtbUcFGsiU15+MV6w1x745QEbhwGES+EGKxwh9
	OuI8y8EFOr9iEXlRrVcQJm+gWnmuoAysMPJpwpEhSaxYDRpQVBWOzrpxXVUpzAEMAfxm4
X-Gm-Gg: AYBFou3Ni8w7o/eEXnMY2R4CIzvKBqKzScFEqSJfEq37bgzEkypVsbCrK5vaNZaCoVE
	+y5rUES/6XawrOsnLP9X1l6vy6WyI4vcp1gkxf+zICY4oMPfdX6RyClGYKRzkuTrfKTMbs3wmBc
	ROQ5ybsslGbyeIvr2CdEnmvhD/CWU1B0Uq5YW3HVsBrqK7DPy96Q9K7ot6pzhcHwtFOOQ9Kk+9X
	NIRvfbHmCJOF4rgY+MJNsMmn2scGGdsUc29hDz58ElILO/aKnVgSElnnqEWx/M+drSzcuL/vNFe
	qOqB2uUI6o4cxycA61up6tNAfJAkDLD0JxPdtXuVhYcU8/hktBip10/Qor21xNGT5Bm63dfJCMr
	OhspCVnK/rnGR9zVODab7vJdKy2XhE0XexrL/wK5nHEmTfI1UF5Z4HElemFFEPLq+SvXWa9xkoG
	Yf
X-Received: by 2002:a17:90b:5684:b0:3ae:521e:767f with SMTP id 98e67ed59e1d1-3b1b0a49a8fmr902239a91.36.1794545739323;
        Thu, 12 Nov 2026 20:55:39 -0800 (PST)
X-Received: by 2002:a17:90b:5684:b0:3ae:521e:767f with SMTP id 98e67ed59e1d1-3b1b0a49a8fmr902226a91.36.1794545738813;
        Thu, 12 Nov 2026 20:55:38 -0800 (PST)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0fdbdsm7739875a91.10.2026.11.12.20.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 20:55:37 -0800 (PST)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH v2 0/3] pmdomain: Support system-suspend-only domain idle
 states
Date: Fri, 13 Nov 2026 10:25:24 +0530
Message-Id: <20261113-s2idle_state-v2-0-ad604182e7e7@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIADyY9moC/1WN0QqCMBiFX0V23WSba4yueo+QcPNfLtTV/imF+
 O5No4tuDnxwzncWghA9IDkVC4kwe/RhzCAOBbFdM96A+jYzEUwozhinKHzbwxVTk4AqqaUxxkn
 tDMmTRwTnX7vuUn8ZJ3MHmzbH1ug8phDf+9/Mt95PffxXz5wyWlnJhFXKVVqfA2L5nJrehmEoc
 5B6XdcPk3VKo8EAAAA=
X-Change-ID: 20261001-s2idle_state-6484bbbf48fb
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794545733; l=4313;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=h+OJXS5GpG4CzdSwZr2uBBdlCOkcwJ/oouQ8a6ggKp0=;
 b=LBVhYye/0VIMpScQ4j/tbHUueTory6C/vc5CyqmBBCJSAl7K3uo4+SgPfL/7UrvaRuaMMWByO
 quEhUuqYTk4BG0yCSI9mcz4hRWer6Dh/K/K7oSJedBU7vYB4cM+RImQ
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: cn5nZwt6dyhB72cd7f4-u2jkAAu2gB53
X-Proofpoint-GUID: cn5nZwt6dyhB72cd7f4-u2jkAAu2gB53
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af6984c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZTPrOM7BHbsZ8Di_hkkA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfXytSHNiCKuNBI
 +2pNb7bxNNAMhmXxMVLvWY957aWmNckcfaMp5kk8xepMtreQg7XIHBH5xN6I7WbxU9XF2eIzhA3
 QbPTfSSzx5m6JyKqcIuSlnCS6uvy0Lg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfX6eC2eFEg98dW
 2u2XQTo61USbsytwUKvDyPh5oHWZvPwUM9o69l8WusgsR1A+Jv136Axj+vEZANxiImZbnH7M+r1
 tj0xwDGnSNwAFuxCUUmvlr9ZjoMBI4sVgZl0O24pVkD4MRd6cb04myhhmS9hatH6C5LlLtmVhyr
 Th+vTTWcPhYajRBBA2YaucqMj7uYMUx+NsSHDpO+D4uov8fXE4ik4SzKiaodH9ZmB67pGlE6cDw
 a9tRg/LDLBo4VZPXg/pqVyiKxJJIhP/gKLXK9XwvN1bmzTnDiT7y21uNd02nmZQyp88tTR+eKIj
 cEFnkdPU7E7K5XAKacmnXGctFrmNPBJTwLcqoI6NJPvJ1QLVNP2VoOicZmMSLc6alkDpl0VOmT5
 /aFRuhP375uuj9M4O7f6TtZp88hxYqzaimSfOUy4/DFutlj72mKHt1VmuDxS7l2odWlDKYceK8F
 OkmN0CnR4FLW6yITJOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130019

To achieve the deepest CPUSS low power state, which can lead to chip
rail power collapse (CxPC) on SoCs such as Lemans, Monaco and Nord, the CPU
subsystem (CPUSS) and the Safety Island (SAIL) subsystem must be powered
down together in a coordinated sequence. The Safety Island (SAIL) is a
dedicated subsystem responsible for safety-critical monitoring and control
functions, and can operate independently from the main CPU subsystem.

This transition is divided into two stages. First, firmware requests SAIL
power-down through IPC, after which SAIL waits for hardware low power
handshakes from CPUSS. If an interrupt or another condition aborts CPUSS
entry into the deepest low power mode after the IPC request, firmware must
bring SAIL back out of its low power sequence before any CPU can resume
execution in the OS. This recovery can take a second or more.

Selecting this state during opportunistic CPU idle can therefore cause
substantial wakeup delays and repeatedly interrupt SAIL operation whenever
the CPUs become idle. SAIL must remain operational during normal system
activity, so this coordinated power-down state should be reserved for
system-wide suspend such as suspend-to-idle. Shallower domain states
remain available for regular CPU and cluster idle power management.

This restriction concerns when SAIL may stop its work, in addition to the
transition latency. Idle-state latency and residency values alone do not
express that requirement. System suspend does not eliminate interrupts or
aborted entry, but provides the context in which coordinated SAIL
power-down is appropriate.

All domain idle states described in devicetree are currently considered
during the regular idle path. This limits which states can be described in
devicetree. Due to hardware constraints, some domain idle states are only
applicable to system-wide suspend, including suspend-to-idle (s2idle).

To allow these states to be described in DT and used only during system
suspend, this series adds a boolean system-state property to domain idle
state bindings and a corresponding system_state boolean in genpd. The
genpd governors skip these states during normal operation. The system
suspend selection path remains unchanged, allowing these states during
suspend while retaining the existing wakeup latency checks for s2idle.

This series applies to cluster idle states with the "domain-idle-state"
compatible string managed by genpd and its governors, but can be extended
to CPU idle states with the "arm,idle-state" compatible string if the same
restriction is needed for CPUidle states too.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
Changes in v2:
- Explain why the state is limited to the four-PMIC Monaco EVK and is
  not supported on the two-PMIC Monaco AC EVK.
- Push binding example and DT latencie/residency to the realistic values
- Use lowercase hex for the PSCI suspend parameter.
- Link to v1: https://patch.msgid.link/20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Ulf Hansson <ulfh@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Maulik Shah (3):
      dt-bindings: power: domain-idle-state: Add system-state
      pmdomain: Add support for system-suspend-only states
      arm64: dts: qcom: monaco-evk: Add suspend-only power collapse state

 .../devicetree/bindings/power/domain-idle-state.yaml    | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts                 | 17 +++++++++++++++++
 drivers/pmdomain/core.c                                 |  2 ++
 drivers/pmdomain/governor.c                             |  6 ++++++
 include/linux/pm_domain.h                               |  1 +
 5 files changed, 40 insertions(+)
---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261001-s2idle_state-6484bbbf48fb

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>

