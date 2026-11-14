Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794621662;
	b=j9Bd5u7e4gnOG80HitV/4GHbeOm0TUX7ocsFCORLR8aoScC6/XyzHLTqNVlLnYahKXxb
	 aywaKvLpxD4DVrXSMZ8GsY4wLxTAwe/UsJkUM8/5P1ybrxKhPL7Cog6xkjK8oEkwQ1Td9
	 n8bNRR6/YcnnbttOCPnAIiPi/9s6EZn2cndJcI0cYzcTjxUcCpW8B8Eu6C0yBO/xysI1z
	 EhlfQDNc2YVN/toNKVWNzOIPhweXdjgTOWN/Ao8ok5xFdKIQ49+qTruJAvCoy0DHi08dw
	 xsh3gtMkkKqknXJiFwwM+UGfvDCjQm2EByJBlIuv6/Km9xVaTngAO/CJQ4cSgmar6nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794621662;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=w7TGz13hmATNS26qR25ht8QXbJCOX338Tixp/mKTVp8=;
	b=0B18ykpPHhKq8IULQhzuJ4dTLjBXCbPOfhh69N76pI7QYoF7F+4XDHhZ0ikcZRWLgYdZ
	 llpHUDIR25RokhKXDe3ibaayLkDjfye60Nc3cSwSO/jsbCReSuhxndItv+YUEuEHq7NMz
	 DbLmFbFb9nhJRofnOtlzdZMMajUhFu5ybBfuFSUANHq3XuIDUpE8nR7Fav5U9B7P+BsuM
	 vx/e8ryTaNX09zEv28+MAJjt8sT13JCezFE09PnrTrxBWEVGWMRlYwGOXjGQZHNE2/jUP
	 53Kdie4kvlgB2d37sfN653FTalqBI4V/2pNbWMqjRZMtw5oHmCKupKPA6VUv4OifkFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PuYMMSrJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d5z2Wvnj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7D8606A889
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 02:01:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D7D8606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PuYMMSrJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d5z2Wvnj
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE20NoX2356112
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 02:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=w7TGz13hmATNS26qR25ht8
	QXbJCOX338Tixp/mKTVp8=; b=PuYMMSrJtDA20dZj/OqRb2qzMNrjscffChgr8U
	rF/PhND+whNzS6hePQxGRXI5ZBLRnVZoOJ4kDUH1z3i4EuIX/rccZfGdjVrIUNPS
	o4jEwsUXDICmXUHE2kFSlEGhmdHRvONlSTbHhZCcB6/6mhtCHW36D0r8n5cgpB2s
	C1Cg9E8y6KJjGaexgo0MtNIdeNGCr5OBv25H/Kz/V0J0V2ybXO+WocMJyPd4bK/l
	G6rpFqj+a8rqW3CJN+FA1Ii1gYiLQqqHGz03zPzSsiPXKurjeUoEV3c6pTmd9tKb
	NXcj6J3xpisV7uwV/JcyzOvBZ1mv59p9WKXhmu8yFKMwSPnQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxahj0rt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 02:01:01 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a3451ea93so1613808eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794621660; x=1795226460; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w7TGz13hmATNS26qR25ht8QXbJCOX338Tixp/mKTVp8=;
        b=d5z2WvnjbLLwMmtLo4YYYBcp33w76ehXDF5AtpsCTJkVfef11wa/hVGM/NgOkudujG
         MEvO4XCUtHhOiR1mIaIJ2kJqir0yOSKynR6W2LinlWPHsXXJK5DqwvekEzYb1TD8v4lO
         iUtbq/No3XqzW+aerHYh4gOyxbNdQb5s3rcLdC9veF0m90gZhJ/uZHfbwC8zjTZbcGX0
         tLdmYXrP08YkvgqzrCVXWPgebwKTpHDaVoUxdavBQm20CnoEDAFEO1fwlGyHQ4S4Hfez
         mZcxjI24HCSdfAoDbBW56pWPpI/BMDuZhYQXfXFAGqQrIEoQeWCX1AMC7n3Xu7CQYzK8
         eSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794621660; x=1795226460;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w7TGz13hmATNS26qR25ht8QXbJCOX338Tixp/mKTVp8=;
        b=XRxfZUL6DbERcmS4MQwH8q8jDfCniYo9UpivG+egEKcFs7/xZX6TUuvt8MfUWXNXJb
         FPRby0ePj9RF1bPus/roZ8Yc0aHQx32dOT6Zq3ya6zk55U8ZFDNSGkc/TIPC1tFRseZ7
         HCEGPb/Cgot1T51OrmiA3A5G/tUYlcty+8aEgnCDsTf9rjlpMwlPsjSE6UfjxdM4c8Y/
         rJcH7DjtLEOs/ItvqydPGQrNniZiCZywcrpKncXaW94C0Revbz13kE0Mo0OVqlrjMZ0G
         47KBVXaDhrVW4v9+1rplyuCZyQlMI+TSFnSbVT7cIsFxt4auD4lnKURkWG6nqtENO8xp
         d4kw==
X-Forwarded-Encrypted: i=1; AL+hErGhBtf3tsPYDmdtY09XT0PJ7MA4MEHzo4rbiYAewajtSF9a/41J72LR14YhCJQwMe/DgDBNe89JpFKNhDF0@vger.kernel.org
X-Gm-Message-State: APuU4Z+wcqFInMEL9M12McxJed+7VqYVtcSVSw47OvwLnTiBdB1HMwej
	amnEOILlsWNnbd3PRsj/9Af/0wqZYAAKCkNWKUHlO2uf7o/jJHgxeOS+6N3wuBUOFpFCOQdoQF8
	3D5+J2zXx/N60tO0DKihHUHHzZanv05axlbS8V4MTN4k9wAbZ/95m7NAymK/5tytgalj/
X-Gm-Gg: AYBFou3UTbY9yZbaDwM1cUGZdahVUA57ZRIBCj/rfVQSFmYN4Ad8bHV2AuXYk2YFssq
	cuBB6XufHtKdEeoViPEBUdv+EOnylpbiZ5hghDM9w6htHTzjuruw8ezRNEDXIKEehESUui8k64c
	xpDldic6qRyfKoeh76B3w2kM+Eg18drY+8IygZpTctKdTEYpEqzl/x31qEmZit4N2iionSmILXQ
	Ku9fkS7zZfOkubEutFQSOqozpp0MmJU4mpRzz/To7TL3zgYZueteca7sMBtO/ud/YI4zEWmEdzJ
	5HqwXGPs33pp1Ktun8QJUE87RbID1buIHtuq2xeaAU2L2vYINsIdocPHIIxUjltHeoXLb9eNq6d
	tZAx0tpoEbYgvfzFMmQMlxJbtmLbX88dzcc9G2pW502C+P4sd0i594D8Ktyk7M5148q7+SfWsoA
	u72lpN1+tG
X-Received: by 2002:a05:701b:4642:b0:1b2:42e3:e5f0 with SMTP id a92af1059eb24-1b5030eb063mr3538978c88.12.1794621659798;
        Fri, 13 Nov 2026 18:00:59 -0800 (PST)
X-Received: by 2002:a05:701b:4642:b0:1b2:42e3:e5f0 with SMTP id a92af1059eb24-1b5030eb063mr3538941c88.12.1794621659118;
        Fri, 13 Nov 2026 18:00:59 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm9952742c88.7.2026.11.13.18.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 18:00:58 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v9 0/4] PCI: qcom: Implement shutdown() to avoid SMMU/NoC
 errors on reboot
Date: Sat, 14 Nov 2026 07:30:50 +0530
Message-Id: <20261114-shutdown-v9-0-5430c9f242ed@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIANLA92oC/3XQzU7EIBQF4FeZsLYTuMAFXPkexgW/DsZptbRVM
 +m7S8fEYTHdkJzkfOcmXEiJY46FPB4uZIxLLnnoazAPB+JPtn+NXQ41E6CAVAN05TRPYfjquxQ
 14yakBE6RWv8YY8rf16nnl79cZvcW/bT5rXHKZRrGn+utBbbendkFOtpJoBZ1Yk5Y+TSUcvyc7
 bsfzudjfci2vvDWi8bz6jXzTDinLLNpx4vWY+NF9dHJFE0QUti44+XNGyobL6tP1KOzybIg9u5
 j603jsXqsf+oCAw4cd7z694xC61X1PAVlFVo0hu14ffOMqsbr6l1CqjwKMI7e8eu6/gIJ/4hvO
 QIAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794621655; l=4535;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Cu5rLdDWJqafbz3+M6KVDjIsNv0OakL2e42N/mtr/lo=;
 b=k1j9Nc6d4s8kj5tRPQ8BtpVSXBOSpp0XcIYuCWX+0/UfRXfCVCfO/AymCOr/NZQPIeN9Dcwp0
 8UI4NTefO9mAsrdwQkS5Z9jEMhYVqv6KRPf1wU6gh2xe1fmZsWRFp5b
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAwNyBTYWx0ZWRfX9DJQx/WoCxwE
 AyxpqeXyJg/wMPgo9y59VFbTucF5IjmJPVskx7fKxAT76LkDyxjHAYlOny5pZ4rfpApGsOvzv53
 4bmpa5gnnAlBy6FSIw0jZl8y7pe5Kt1bKsU5GmvwxBvlR+/dU2WIzB8q39t3VAb+9K60AiVM//2
 Uw1O+yn75Rwhr04Rn7xdZVQZZ6+uCKFm1B1t2Hk3AEWHBKR0jIwLedJ8XkvkW3LgRzPZ8JYdGBr
 wobXrOOv1JabAQMp6lRuwW+jJXpCrMlghzALLMlnvM+6HrHN0Z06lSu1CH5tPOUFn0cGIRd2Zum
 aE2QsLlHSAepGAEIOFmqCZFz1S+n9ez41eA0DcNmui2B8t/8gFvOhGaAxLSUSEPwUzaMW38MqFM
 jOwbRY5icBAj2bzLiXEgm5z3ix+kR0fLkHKrP2Ge/a5kp/23/eLHrVwhQdhKXWwIus6iO9sp9+P
 wgrT9jDne3ZU1pX/Nbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAwNyBTYWx0ZWRfX2Xdc0JZ0Qur0
 lKHrfrnxkhqYDapkzXgVDLQN0LXXiuJa33p6nqZhGrYLv7UyGwe7tqtU2yNXroC21f/i6ANM1un
 ujPyFAQfo25NOuaw+6T9P9CjXUk6NFM=
X-Proofpoint-ORIG-GUID: czgBEqEVMDZeKGKURDk-5sr37eq0AVMc
X-Authority-Analysis: v=2.4 cv=Kv/YSmWN c=1 sm=1 tr=0 ts=6af7c0dd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bBQ1TlrZeL130n7Dx0UA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: czgBEqEVMDZeKGKURDk-5sr37eq0AVMc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140007

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
 drivers/pci/controller/dwc/pcie-designware-host.c | 31 ++++++++++++++++++----
 drivers/pci/controller/dwc/pcie-designware.h      |  8 ++++--
 drivers/pci/controller/dwc/pcie-eswin.c           |  2 +-
 drivers/pci/controller/dwc/pcie-nxp-s32g.c        |  2 +-
 drivers/pci/controller/dwc/pcie-qcom.c            | 32 ++++++++++++++++++++++-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  2 +-
 drivers/pci/controller/dwc/pcie-stm32.c           |  2 +-
 drivers/pci/controller/dwc/pcie-ultrarisc.c       |  2 +-
 drivers/pci/controller/pci-host-common.c          | 13 +++------
 11 files changed, 74 insertions(+), 24 deletions(-)
---
base-commit: 6633c535abc356ff868e72025ecd65aa0106630d
change-id: 20260822-shutdown-fe8139dff2b7

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

