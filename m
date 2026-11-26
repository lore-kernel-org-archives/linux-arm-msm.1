Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670238;
	b=4ASzG+wppDgRuZnlxEp9B5JLauqZGX+AUPRXL03nfoAfeWrD+zoPRXg/B10Zp/WpqrjH
	 KPSmgu79eC4aaDseKMY55pQzFP3HsioxibwDxEupBuUDUEyoyo9+26Jcf6DAtS67YkYLn
	 PMv3f5mYeQN24ZBb2UB/oZ5+jHj63pDZpO5tAPsIeImRhmPCELIU+0TcLGLylmbKg8+YM
	 DIusFIrgM0J6ru5VkH1DGFSeQ6zhXKVo5+8MmnLoOpzGjS0IadVMByuce419rK09ZI3Wq
	 IYmmL1C2GXwiH4Gp88Y6me3ERaUJ8SqwpTwhZW+lvWDhSmtc5kvYJAncG/liqai9wPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670238;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bEGMaK4wwjIpqggcJGsmIHCUpfo5+MCGKH9gaDkeTOM=;
	b=zKCa0+bUQHQ+1m+V/W0gErPlipigp0caTPcYWNbWTSn6BLDbH0i+rrW5v3aE1X4jkM7O
	 PRWzts7oCZogpP3cM/gaRh7jv0+qc/ug+Gp6fTnGHiGToF7uAEzbkmjLl2ECUhxwKFITQ
	 5HJltF6c7t8g952QJzVGZg5alWn4JkT8YbauDXyYQAdLzdjsfCGElNrsEzU/ni+ZxomP7
	 EdvJQoOM7/MD6RvaWP1Edzye4KiaeVyuM+idQtKxHP9yXQ55cPlj11a8Rm4zLwnsE7YfB
	 HrqDIkFZNRYwT0UpUwues8awBZKDU+WwuT/pa+M7ZeKxjBaxXZoX2kNkTQNJvNHlBpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xz8uJtzA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d2V4TY1Q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EEF606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:17:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0EEF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xz8uJtzA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d2V4TY1Q
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36Qmg3023415
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bEGMaK4wwjIpqggcJGsmIH
	CUpfo5+MCGKH9gaDkeTOM=; b=Xz8uJtzAPDWLGSZ72W9RFSakWa6hZqu1q9OPa7
	t2ofqvy9icHMjPg61mYt83hRLAz8rdESfmZ1oj34xb2/2uiSCTKZl45b9GPupXN0
	DizsXhC2pyY8KtR5sseFTq0zmswSA50WHDwWaeFs9JBoIM50NP2rBmHpJ7BhJ97n
	hQfwssJWiLucO9H8IgIXoGUAIrCY60hjFuXhmhSs3+S5Ianm4BbTXkk11fuftiCC
	K04/YXT3QBdtZvNXiTjtbs2F5N9USbHMkXnuJo+fmHOXU/9xpmFbiPvJWReLnP+a
	uxgyXa49YtZA4mz8REYdJ73HqCmco7mm5A3FNDNKqhs3mzKg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vatc8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:17:17 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386df943355so201908eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 21:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795670237; x=1796275037; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bEGMaK4wwjIpqggcJGsmIHCUpfo5+MCGKH9gaDkeTOM=;
        b=d2V4TY1QW6eOdnDabNxXJ+bAdg2uys/UVyG13t42350uisGqZndaQ0hhWgJZxF8Nl/
         1Hbs59K4ARHtdNJwAPDsHmmCK9vnoAv8TcGaj2d2W5oyXwwtVvsxrczIRNhdzkz2z0sJ
         AiTpsnrfPcr8pmOZOawsloD8H7Mb4XGQaj0yxazcGp7zGjWGvNgwktWv4+wzAWVUm/eb
         k45vLRvwfCb6k4VWXZ8WrGOKmMJ6RfIE9XnKUQpYLq+ffwFF982+CeLVmpwrXHaduoKS
         tH9CqgV6tkwHk8DqTxY8NhV5J0QydOpX/24QeI8xCsqPOOe0W5hSSbTyJzw9KuHbvSqi
         gV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670237; x=1796275037;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bEGMaK4wwjIpqggcJGsmIHCUpfo5+MCGKH9gaDkeTOM=;
        b=lPRFrBuEclwhHjMjCek0OcPQpKJ/7+2vdqMFH+DGbs2pAlhJiDXjL2fxD/LpvkyMDB
         zOdAGNRag02O9u9VN/Orjs1MU6lV8v16vdPxQt3dQunoqAH4me/zYIQxcbMoyCWtnz6y
         gGCy0mdm0W4DctpQjC9TPt1ECOub0nGUGHPyFO9atrhjmrK1xo4XDC7lPOBSnS8Fmdon
         mkn80nGUkd7bkOd8TP3SSg0cws4IzJU/7p6itAN5RwFgjQJXdkkTbckpegmhnBZOqhDf
         L6ynyBZ6Oc4txjPxJopSIrnI0n5lcNAxwOM4y/yHTbxX9G+ogzjSi4LPiNyw2bTa2rbr
         eRYw==
X-Forwarded-Encrypted: i=1; AL+hErEkKyosYjXm09Zcy0bZztMJ1PF1r8OuFdWxZGvZ0xY+jHGFTRnCQSM+F/Mv64oxqP77QcKRCJ655zOJc6y8@vger.kernel.org
X-Gm-Message-State: APuU4Z9yhAvCjZnb8KstvkOofeJS3Fx5PfPnhUjiE1x/Ylxfmj0X/ILC
	797DqfverWBaQqvkERYjmfkKZyMHYJeNclNBncX45MOjc1kXz8nq+a4bkJDS2dSzbUbPvTbRFR0
	8AFlSC4IcQ5DHfcyjIJvBIKVWr6mX+zHtREjxP2fgfiE/alQ1xam4cLsftsKqbTkpgpvUdGYUPI
	Xh
X-Gm-Gg: AZFdTZfgkSsRGSdOj2n3C5oc7gpxgJvsu/dsGPk1b4qv5TCwBotji48m4NwYZCJO3PX
	UkOW7dgIHqtdPsl2iwECRalQnuz/ggjArhtinDf3FNU5k/HVpSG78pd+z0CdqOtZS3e5WtVJJtD
	7nro7pKFO0D83oV/gdfIrAgUooyiYQBVsc8vJbTUOivxNqjbdmaTDm8hcgzvyHry+q3n8ggJy9y
	vKC5OMwB5DugXAdKITyT+UliTeZzJf/Svofq+DJKqzGrBEhpRw1gCKqJxDRUNAuXlxxp6ynagH4
	Ae/FLUr3slB2enPeJ0Mg4atPOKhEZV5DveQC1EQuIPiWKS0J6QJuYqbs6bVAHzrJGefq2hWgPSa
	Olv0H3ijMVGyj88vLQWGkJM/1+/fGC7IHOCkRzaUZCwF5Xeub0r2TOhC7vrtmFbQCWlMp9f/4+l
	OMHqtFeEyM
X-Received: by 2002:a05:701b:4550:10b0:1b5:337a:6456 with SMTP id a92af1059eb24-1b55247eff6mr19016849c88.5.1795670236532;
        Wed, 25 Nov 2026 21:17:16 -0800 (PST)
X-Received: by 2002:a05:701b:4550:10b0:1b5:337a:6456 with SMTP id a92af1059eb24-1b55247eff6mr19016819c88.5.1795670235825;
        Wed, 25 Nov 2026 21:17:15 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm52132934c88.13.2026.11.25.21.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:17:15 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v10 0/4] PCI: qcom: Implement shutdown() to avoid SMMU/NoC
 errors on reboot
Date: Thu, 26 Nov 2026 10:46:58 +0530
Message-Id: <20261126-shutdown-v10-0-fed60d9687f2@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMrAB2sC/3XRzU7EIBAH8FfZcLYbGGAAT76H8cCni3FbLW3Vb
 Pru0jVxOWwvJEP+v5lk5kJKHHMs5PFwIWNccslDXwtGHw7En2z/Grsc6gcBCkg1QFdO8xSGr75
 LUTNuQkrgFKnxjzGm/H3t9fzyV5fZvUU/bX5LnHKZhvHnOmyBLXen7QId7SRQizoxJ6x8Gko5f
 s723Q/n87E+ZOu+8NaLxvPqNfNMOKcss2nHi9Zj40X10ckUTRBS2Ljj5c0bKhsvq0/Uo7PJsiD
 25mPrTeOxeqw7dYEBB447Xv17RqH1qnqegrIKLRrDdry+eUZV43X1LiFVHgUYR3e8aTxr92+2+
 wlOvUkgIIY7fl3XX7nGgPF6AgAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795670232; l=5042;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=+WWgS+bX2l/PaHsh8D5IFYg8kX1jVnle8MGRYE3+veA=;
 b=Jfya52DyFFcEJijHNUqsC/VGwUyGDN8V5H5SpaIkyIvthkyXpXJf2Dvn5Q94TWIVv0LOo3Blx
 /MqeZg2MXI0D6cbWzSOF0SG2fBPLqiF0DtGjg7/TCYdr4+35aG5hJQI
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAxOSBTYWx0ZWRfX7zeAQQFQQBFI
 +1ysirCUprpSEiUjZfqJ7gPj5njHilVQkblZGTENiMpTg8WA6e+iYo6g6w4iNCuT6+o4RoWVtxb
 Igsxif9Gfb/T0YvWQkDNt7uinW8mkJI=
X-Proofpoint-ORIG-GUID: WKboTvRsuvvC5sl1_a9xyL7Jka4HDzXc
X-Proofpoint-GUID: WKboTvRsuvvC5sl1_a9xyL7Jka4HDzXc
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b07c0dd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5_YdMucviHHNaXn7sfYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAxOSBTYWx0ZWRfX5Fc/c0ksxVud
 75VSFBMWR5VAQ3i2fGND/He55DZ4VLGZcDQLD1W67n9WniYRVN6rMUK+jkZW4bAa/w6M3jBGPXq
 5F/9UDWITMZegdwIFCmhmzuC/VutlcesQS351iDvDyrmqzvvRuaTDuOErXj+S9c/aMK2RZZvmlo
 80JW1g9HDN9XJLjQvK3tAmTbfvVE3zQN6iqQdwvxkrLsn4g69O6uTNNd4+MTU3MzfzVPQh1Sdur
 EsahKJcqCsX83peKrzw1UrROiQcSCRMrx85yBUufxhs+ujmx3SwlBfWxD+dFQ+wip1Y1zp+y7pc
 yjXcZenLREtf6MBzhq+wL16BsKKkm71BmdvuDFA4Vr1XJKs/KtNlZf2h07QoOuo/KNVtRGVz67D
 M22QTBxYYg+oEYZJ/Cnz3//h9NqxqJSW+iaaknlM2YwfL6kp3JB5vorWMGzQntAb3FuXsRFrP7o
 2euy56SIRJ/AxLRb3aQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260019

During system shutdown/reboot, power/clocks to the PCIe controller get
removed regardless of link state. If the link is still up when that
happens, it can trigger SMMU or NoC errors.

This series adds a shutdown() callback to the Qualcomm PCIe host driver
that forces the link into L2/D3cold before shutdown proceeds, reusing
the existing suspend_noirq() path.

Patch 1 fixes pci_host_common_d3cold_possible()'s underlying bus walk,
which aborts as soon as it finds a device outside D3hot and can
therefore miss a later PME-capable device -- something that becomes
common once patch 4 starts forcing D3cold entry during shutdown while
endpoints may still be in D0.

Patch 2 adds a force parameter to dw_pcie_suspend_noirq() so that the
shutdown/reboot path can force L2 entry, skipping the D3cold capability
check that can otherwise leave the link up if any endpoint hasn't
suspended yet.

Patch 3 adds dw_pcie_mask_msi() to mask the chained MSI parent IRQ(s)
without tearing down the MSI domain, for use by the shutdown path.

Patch 4 adds qcom_pcie_shutdown() and wires it up as .shutdown.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v10:
- rockchip (and the other callers') force argument — the build-break fix (Sashiko).
- dw_pcie_mask_msi() using irq_set_chained_handler_and_data() instead of disable_irq() (Sashiko).
- Fixes: tag added to the host-common patch (Sashiko).
- Link to v9: https://patch.msgid.link/20261114-shutdown-v9-0-5430c9f242ed@oss.qualcomm.com

Changes in v9:
- Use uniform structure in shutdown covering firmware managed one also (Konrad).
- Link to v8: https://patch.msgid.link/20261107-shutdown-v8-0-bf607c6429b0@oss.qualcomm.com

Changes in v8:
- initialize 'pcie' to NULL to fix uninitialized
  use in firmware-managed mode (reported by kernel test robot & Sashiko).
- Added new patch "PCI: dwc: Add dw_pcie_mask_msi()" providing the helper
  used above.
- use new dw_pcie_mask_msi() instead of dw_pcie_free_msi() so the
  MSI IRQ domain and downstream MSI mappings are not torn down while
  PCI devices are still present (Sashiko).
- skip dw_pcie_suspend_noirq() when the controller is already suspended (Sashiko).
- Link to v7: https://patch.msgid.link/20261029-shutdown-v7-0-3fd7a76a6991@oss.qualcomm.com

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
Krishna Chaitanya Chundru (3):
      PCI: host-common: Fix early bus-walk exit in d3cold_possible()
      PCI: dwc: Force L2 link entry on shutdown/reboot without D3cold check
      PCI: dwc: Add dw_pcie_mask_msi() to mask chained MSI without freeing domain

Manivannan Sadhasivam (1):
      PCI: qcom: Implement shutdown() callback

 drivers/pci/controller/dwc/pci-imx6.c             |  2 +-
 drivers/pci/controller/dwc/pci-layerscape.c       |  2 +-
 drivers/pci/controller/dwc/pcie-designware-host.c | 26 +++++++++++++-----
 drivers/pci/controller/dwc/pcie-designware.h      |  8 ++++--
 drivers/pci/controller/dwc/pcie-dw-rockchip.c     |  2 +-
 drivers/pci/controller/dwc/pcie-eswin.c           |  2 +-
 drivers/pci/controller/dwc/pcie-nxp-s32g.c        |  2 +-
 drivers/pci/controller/dwc/pcie-qcom.c            | 32 ++++++++++++++++++++++-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  2 +-
 drivers/pci/controller/dwc/pcie-stm32.c           |  2 +-
 drivers/pci/controller/dwc/pcie-ultrarisc.c       |  2 +-
 drivers/pci/controller/pci-host-common.c          | 13 +++------
 12 files changed, 69 insertions(+), 26 deletions(-)
---
base-commit: 647e1e846730c6aad27e9b858df292f5d4377f63
change-id: 20260822-shutdown-fe8139dff2b7

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

