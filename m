Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793247585;
	b=XcssBZduW787DjUnFHPHhA80+Z2DuM4Zxc6hXJ2n7qKN6rSwugqBreKjDkSeUDoOIHvy
	 p3pkBVcfBvml3cC1i/UggiNo5//YFIq0xu+Zl6BerdVX62S/wBb9ZJ8f+lji5tjg7jBOc
	 SUKXDA2rJvq9An8rrolqu/piUsQARQ2Zb5ZrlFskay906yo8F048YyHYTn0HUs3ccTpqh
	 8i2UdNatK8tHYSfN5pQfmrs0R/MrIgZFYkq/v6C3uat+pvHRbmBCI8RxyG2tUsqpdjhp4
	 gansNPR0eWq73u4fq51BEvfxxbuusguaRGuGNWBe0nY+1NoWjsuQiDrcp44eu8/kJLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793247585;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vtdbgHkkmkI6BxWyVf0K70f1fLFUUYjVeM62+DS5GOg=;
	b=u7x36jhmYWlmT/12CRNCYpW+D4fSPsY/yJ7M6Va2iOFUpJicD/cI+buVocoLTHRL/efn
	 rkpnCO84Rs6QkJjWhGQSv8wUpalMvsz3weEMgMAULXGUxzGdTp1s5n3Fl2kTklVtQDDot
	 YfcXtiycIXh+XjP97LbSkXRRh4tTiHcuiE/4y5CXcv/xHBXX7Ixsjf030BC+lF9keq6J/
	 nASnuvQYbQqv+NrJVQQ1hcqjP+UVggDWLEMNDkPOWl/9OpFIvWxukrwsXbwTdzptWjqZC
	 AC8dqG9XOxi6cDQuJzJ5J9ApK2M0GjrEHJ6dvGymmo9mS28py0W11evdBOR1VRJ2kMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mEUXBQkD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VR2KOB7V;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9DD606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 04:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A9DD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mEUXBQkD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VR2KOB7V
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jedS3920318
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 04:19:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vtdbgHkkmkI6BxWyVf0K70
	f1fLFUUYjVeM62+DS5GOg=; b=mEUXBQkDv5KiiyBa0l7FgDNzMwMOkxu7jm4hNV
	zmH9MtAgHJUehtYtDndR9U1GOlRq9Uer4DRUXIDIMhOf0CfpO6u3Qt8RlfMdf36r
	RqCbigf3o7XI4XYIPqkSojGSx2pafuqMHs9WZAfgdI/DYoatkuOk7r05BI7NfGNI
	Y0VubZuonix+l2sisQGPvS9QQAcGZaiItC/wLDkCd+L+I/2lcfrlfRoYAxH9KKq/
	zSRO/XEwV/oFnbfUygLrDGiPYdASFiWJN79eMoA+kwYUYUhvrcu0VkLnwbCZjMdQ
	Op54ukTbUUJGjxkQ/S1rmdJfygy10SGvW4jZ4H1abeMyX96g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehtubk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 04:19:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3662e7a9299so6835789eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 21:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793247583; x=1793852383; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vtdbgHkkmkI6BxWyVf0K70f1fLFUUYjVeM62+DS5GOg=;
        b=VR2KOB7Vfgi/TF/D23xxnroeZuiKG8PnDdXMR3a9iC84ni1MJnUbxEZTyeAhN2Tvc+
         lQhDR41+Lwfzd8KHdGruQ6F0IqkdIpFoAz60u+71v+Vkf6x8u/22rBrLhDoRrghBwHPi
         ZiLceK6uxyfFcJbmOOyiswa13FFOKpbrtxvzEQItPZj0h15qe4U7P4EyrP3jI78zySfd
         gHOW9TtwlGHlvaqllarC93IakK8LEom4q+oMxGQT5BEA8yfLIWuV+sIA2hK8souGLAgp
         C+dm1SJLlJTNeDCva/qmfpWNTKPFAxnAOWrWKuq7ZWURsALZ79f9/XgRwdJmqnQrqkfj
         jQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793247583; x=1793852383;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vtdbgHkkmkI6BxWyVf0K70f1fLFUUYjVeM62+DS5GOg=;
        b=pDgAZUqafwgm1mftV1yS6MgJU/5ns75J9vvqu+f3/Q4pdLrU/f/adBpXsdVyJyuGEx
         Lb2Ttu/nTXg8zJloWeqY5Ey8YnmwLlTScXuNjOCsk4V91kgyUzbqThzj4WoclKlEtSQm
         K3zVdWzrsJ0NFgy/rSli97CStBY/mOo2Dms2YTEWYG3H930Sotk0FmK1fg21oh55tW4V
         8/8V3wBtEIomRR9O3m402bBwFVh25BG0tadNam0SQrQEnK3mpZiHiDGjohDzAkQVm9gM
         XxxpQo3ThDC/VKK1RKl7+XzSeMk2toghkbJaf5+B9xqnU/spzLwAIwrFNPVbFMs1Aka8
         Mx1w==
X-Forwarded-Encrypted: i=1; AKwUvBw9J2XUxyuRi9A8ki168/k1xkZRZKmJIdUWBnoD9DyYhmFWdXRcQrOgVgk/yK0yDYctjbfULooAcxeuHYmK@vger.kernel.org
X-Gm-Message-State: AFq9FYK0iDT82R7t9DvClL8RgEvOEnMU/cepIcare7kWpgMTGk/lSpge
	c5WEyJK4ymwdxeee7qGbeBebGeVlmq+Yu2IAeojWFLUGe6W62Gre3bL3oy/xcGPqVQbSggB7RqN
	ufN8EPxV9ff7iLgS+nRn26rTpDq8DZZvNBRf57Jp4NfjO7UH74ghAz1Awf5z+cpIj2vsY
X-Gm-Gg: AYBFou0voEYeRn4uzCQySEwrsC42qC0Kv95iJRufsBBq91TfqSvAtz6uq6Y3HIpTxyF
	2a1Mdc4wJq/leEbhpEEbvLBHtHS/98+Ppg0ERBBpwKMrN3G9mI+clVS1a3EKJzel9KzpTYwfC6X
	Nhmw56tgBnqgAARhpfhMkXKn1S21McDecygt2QX51FIFYoz5odBitXeDgBJKRXEfieOnNnY0Eit
	xru0SwmeaD3PfqKFtDd2DewtV9sxW8T4jwjuPgLCHKTAQODN2/x2X9Ri8T+AKf9++V1emr/2SvK
	g4A4trip+ISrhiiSwG6qaMbKvb+EDBm9mlpecHVKQFi5w2dvIPuFqDojnWP7Mvhlxc4puBrYcbN
	WNhRdT0lLf8eRhTs+mNq8qBdMpldBoq8vchOyBUzV0IUYzoFhMmi45u7vgrNBqw3j9pzfSbScXI
	rlVwlroMg=
X-Received: by 2002:a05:7300:56a7:b0:343:fb75:a5f2 with SMTP id 5a478bee46e88-36a203ac526mr5213820eec.9.1793247582851;
        Wed, 28 Oct 2026 21:19:42 -0700 (PDT)
X-Received: by 2002:a05:7300:56a7:b0:343:fb75:a5f2 with SMTP id 5a478bee46e88-36a203ac526mr5213789eec.9.1793247582229;
        Wed, 28 Oct 2026 21:19:42 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a237be80csm27504539eec.2.2026.10.28.21.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 21:19:41 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v7 0/3] PCI: qcom: Implement shutdown() to avoid SMMU/NoC
 errors on reboot
Date: Thu, 29 Oct 2026 09:49:26 +0530
Message-Id: <20261029-shutdown-v7-0-3fd7a76a6991@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAE7J4moC/3XQy27DIBAF0F+JWIcIhoftrvofVRc8hpoqMa2x3
 UaR/z04XZRFvEG60j13JG4k4xgxk5fDjYy4xBzTUEJzPBDXm+EDafQlE2CgWQtAcz9PPv0MNGD
 LRedDANuQUv8aMcTfx9Tb+1/Os/1EN21+a/QxT2m8Pm4tsPWezC5AGVXAjG4Dt9Ko15Tz6Xs2Z
 5cul1N5yLa+iNrLyoviW+64tLYx3IQdL2uvKy+LR6sCdl4qaXDHq3/fMVV5VXxgTlsTDPdy776
 ufVd5Xbwuf2o9BwFCP/Hrut4B3NOQGrkBAAA=
X-Change-ID: 20260822-shutdown-fe8139dff2b7
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793247578; l=3648;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=uRZgPWgYEoLVldUGAfakdjG4uT/MDZgecW4/9yDGcBM=;
 b=bT6Xaze3KWenOsMaOUYwqHiFc5Uldsm9VDZ/llFDDG26Dim9BVoTN1ogdB/wsgayULB0ji9rH
 LDk8DNaQcMKB1Zt12jvzGZozXuCW1GjY+IbSvsEf3hIfW1M5cYvwBX9
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: fE2BtytUQFY9Z9Tl8G5EtFPnZ5cDq95p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxNiBTYWx0ZWRfX2NO07KYA1RZF
 VetyZDbPnunCRO0PapSuU6CJ0LrCS9aUmRithJK0509TBur4ypVBumvghO9d7CZCdCFVHiJV5vb
 oXYasVPnjtnrHOdAvpI3kaoAQAEm9VoagQ6uCe0COcMeXVDqrlqNM+9tO5jnbucabtVBreGTxUr
 nDAj0WOCt2dP0shNrS8DHRkxmo3+cz8UhnPCJB0+aaf5tlqnp6n+Djm063WDKMUIyM7XPxPE/8I
 JcGekgXKFc8LYlLmUrGBilvbTu17RPG+Kof1eprMnJiCg5eZ6cvkG0Xf/pOsU50YBQFyGwn4rMN
 KGl1TsOJIOnV2Ek51rK/dYei3V4njdFf4og2tjMJYwdF4f0jCXwqYfVGut5u8JVg2ldTk1thG9B
 ULPtJx/a+n9fjHsx0gsldO2b0gV/XqklhNpcSP1z/yZOc1DdgkTF7IclKmkTS1jtkf9z5makf1r
 SR697bsK5WcwxfjwRXQ==
X-Proofpoint-GUID: fE2BtytUQFY9Z9Tl8G5EtFPnZ5cDq95p
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxNiBTYWx0ZWRfX6zROT+V2ibUH
 PPc0u5Tn6RuXrl1HT32euwdYX6yGblVdmJv8BE586/NgZVlPBW7u6lw6xYfC+5+PekWkrw9EJQi
 wEOz0n3PbQElwggOexN1c1dd7lZ42aw=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae2c95f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=7FPx-eIICnbx9kjoaAIA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290016

During system shutdown/reboot, power/clocks to the PCIe controller get
removed regardless of link state. If the link is still up when that
happens, it can trigger SMMU or NoC errors.

This series adds a shutdown() callback to the Qualcomm PCIe host driver
that forces the link into L2/D3cold before shutdown proceeds, reusing
the existing suspend_noirq() path.

Patch 1 fixes pci_host_common_d3cold_possible()'s underlying bus walk,
which aborts as soon as it finds a device outside D3hot and can
therefore miss a later PME-capable device -- something that becomes
common once patch 3 starts forcing D3cold entry during shutdown while
endpoints may still be in D0.

Patch 2 adds a force parameter to  dw_pcie_suspend_noirq() so that callers can
set to make dw_pcie_suspend_noirq() force L2 entry during shutdown/
reboot, skipping the D3cold capability check that can otherwise leave
the link up if any endpoint hasn't suspended yet.

Patch 3 adds qcom_pcie_shutdown() and wires it up as .shutdown.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v7:
- rebased on pci.
- Link to v6: https://patch.msgid.link/20260909-shutdown-v6-0-62b7bd123236@oss.qualcomm.com

Changes in v6:
- remove return 0 in d3cold_possible() (konrad)
- use force as a paramter instead of the element (Mani)
- couple of nits (Konrad)
- call pm_runtime calls for firmware managed one also as we are enabling
  pm_runtime_enable and get for that also.
- Link to v5: https://patch.msgid.link/20260905-shutdown-v5-0-f0c6bafa1d4f@oss.qualcomm.com

Changes in v5:
- use a flag/parameter Instead of poking the system states (Mani)
- Fix pme_wakeup issue by walking through entire bus (Sashiko)
- Fix Irq free issue by using dwc free msi API (Sashiko)
- Link to v4: https://patch.msgid.link/20260826-shutdown-v4-0-eb5fe9d454ae@oss.qualcomm.com

Changes in v4:
- removed goto d3cold, (Konrad & Sashiko for PME error)
- Disabling MSI IRQ's (Sashiko)
- Link to v3: https://patch.msgid.link/20260824-shutdown-v3-0-81c14bb7a1af@oss.qualcomm.com

Changes in v3:
- Added null point check and use pm_runtime_put_sync (Sashiko).
- Link to v2: https://patch.msgid.link/20260822-shutdown-v2-0-520a68f1b4a5@oss.qualcomm.com

Changes in v2:
1) don't remove the endpoint pci dev's only keep link in D3cold.
Link to v1: https://lore.kernel.org/all/20250401-shutdown-v1-1-f699859403ae@oss.qualcomm.com/

---
Krishna Chaitanya Chundru (2):
      PCI: host-common: Fix early bus-walk exit in d3cold_possible()
      PCI: dwc: Force L2 link entry on shutdown/reboot without D3cold check

Manivannan Sadhasivam (1):
      PCI: qcom: Implement shutdown() callback

 drivers/pci/controller/dwc/pci-imx6.c             |  2 +-
 drivers/pci/controller/dwc/pci-layerscape.c       |  2 +-
 drivers/pci/controller/dwc/pcie-designware-host.c |  9 +++---
 drivers/pci/controller/dwc/pcie-designware.h      |  4 +--
 drivers/pci/controller/dwc/pcie-eswin.c           |  2 +-
 drivers/pci/controller/dwc/pcie-nxp-s32g.c        |  2 +-
 drivers/pci/controller/dwc/pcie-qcom.c            | 37 ++++++++++++++++++++++-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  2 +-
 drivers/pci/controller/dwc/pcie-stm32.c           |  2 +-
 drivers/pci/controller/dwc/pcie-ultrarisc.c       |  2 +-
 drivers/pci/controller/pci-host-common.c          | 13 +++-----
 11 files changed, 53 insertions(+), 24 deletions(-)
---
base-commit: 17bb0e2f6c8043f70a693a5f3797471cbed354c8
change-id: 20260822-shutdown-fe8139dff2b7

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

