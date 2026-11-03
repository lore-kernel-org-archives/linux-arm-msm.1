Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793715547;
	b=wKCPPsCaInAdDEA6XSYW1V25knlQrW7UINlGSDTK+AEDQLTzAV9sQOcSZueWNmaaondp
	 1ellJkMDW9flu9RNgPVzhSerZQ9PqJ0yDggcvlk12BuJTV006QdonBaVB1ObELb6fjoKf
	 Ix4NLK2Z09SmWMsjB++19Qtz5zOWfAsEarQiE6MSXrokNXx6lrF+AVbXLq4vWLWMmodCY
	 fDbsZwjMvoM9U0/6eIEl4ZuJ/qpb5bVjHlifFIdh9Kl5SO1j23E8R5+92CVJfn9BeL6ht
	 y2djN4cB51B1VyTsrBFTlvMqsQZ6yw6PfLjd7tI04jst2uM8AL2pWf5W79bzDzzFj4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715547;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3S0r6B204EHHeKzI68P1lldrfNMyDu9t5rxXVOUyz+4=;
	b=3eDsvMmV1J0gtFkudNbGe3eBRJQrICS6zM2ccu5LF1m5FfRt4DhwWKqT7ONuLb1M2l6V
	 rzKZbYtBREgkLly+RcxmaebK697qgQYQhuh0VZZvr3bJhIPAEK7hC8mOcZCTDKiqJCo3n
	 na7N6g2IZSQcRLA+zyyNSSJ8VKGO0vA02Dl6LnwKp2tkRXoiwgpxAgRZhjx3fFt6AgxTS
	 yGnz4sUSFi0o6iMILMK56YjDyJ2/hXI+czciLSWmxWIIV1K8sVBSzXJ9yNJt5CNR2okqX
	 pdtOvAFo4wz4x1eVpHIu7DO37CMcs7pZjZ5K5Xllv8525G7PYozQyZIvKpPlmhWIxNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IbjsmXij;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LCCnl+JS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6C9606A324
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 14:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB6C9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IbjsmXij;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LCCnl+JS
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EATYA1453605
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 14:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3S0r6B204EHHeKzI68P1ll
	drfNMyDu9t5rxXVOUyz+4=; b=IbjsmXijZsAVSSS5s1JovtdiZOPSJ34rLnLdvH
	rJGeFUyCqpXuvetCm3KjWpLAv7B7FbIjPuSWdTaVABNBz3Y8Oz5eIEL/NlUawPqr
	H2FLjF6qpBFLwFlMfKB9t8c2xuljzdiEktYDEa7z9bF64NNJWyCWZbOmc7QZMVH4
	sfYr8eQ1wC7dCziq1f5WSBGmwBKpL/ZsYFAERxgsvW7fFsQpAgPKlKhMqNgFZYNC
	BANtA2iAojHZWbPZjtqgqB5UTmNYnpmZrDTrzSUAuiBDc1Wp0tcXVkh+iVW/W56g
	5QfpfJ/KbYr17n00wmMtdJyJ3aHMBMfTljUBX5WsI88oUcvw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07em4dt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 14:19:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd6532dbd7bso2604112a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 06:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793715544; x=1794320344; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3S0r6B204EHHeKzI68P1lldrfNMyDu9t5rxXVOUyz+4=;
        b=LCCnl+JSJQE8IKQe3S0PH4B1trnPt+2j3DidmTOHRhxfcpYzhf6lR6cs9xkIFuquVw
         uoGlb3STLrMUekKHBm38hQX/vSwaJnaTZdiU9RptaMLcB/BGTAS2RjKLZ7OlA5oED8pO
         3zWn7GW/S8mkzmuEmrGJ0yYMWuP5C4bTQgXk1bEyUEeGH3rUAYhHSi2JzlyLAEOC8WxH
         HxyMtFR4VtRykwJY8jLgQxP3UfyMdiL1/Eyztv9K+gVZTza/NiPIZiNxa3xJ+iyWc4kr
         Pu4V5lflwG9fnIc5Lm5AM0OzZ9kG1pE7egk/cCUU564HQ88RoUH6+t7ZKIekrrABDQAi
         sI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715544; x=1794320344;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3S0r6B204EHHeKzI68P1lldrfNMyDu9t5rxXVOUyz+4=;
        b=Jra328UbL7Dcz0Ejx5gxhrxyVTE88YWPu+aUIovkwKIBY0KvyD7gnnsDo6JuvxaAiG
         Jkvd5hW2kNoCC6MO+d6K5AovyCMzs9BDnimVtvLv2MjjywCtHcmFzFZ7l/RaPwM2EL6H
         V5HBShAPh14NRjteFZQyP5CbRlMjKN0mQogPprsutz6kH158UgHCV9M5bdhXQ6baZdBp
         694UfIHKAn5PmjC8jaxkJU3/2MUMJekYzwiJnYhoO5dQi094ymoL5oZzvhrAxwTWQc1l
         Z8EXOzlJumOzVm+j+3NEb7QqgceNEOMktxlF9JlDwH2Sd3/H30gUjvkIZ3+4UPtTEcuk
         6SmA==
X-Gm-Message-State: APuU4Z9WO0Ime9jSYwblzsb6lZnBQF4QqgTJyuCTZL4cctuQnmTKaGM0
	/AdWiPXr72O1Dl+mUMgzhV6vw2uGvkuF02jx7Xgv4hjQsdqxK9MLOXddCRcXBVJwWbb1hoU2hLC
	G7VMbwm1LDrWNuWK1ub4GqGS5TqNCHYB1nrFuEHjG6+ueAJFQX4TGNR8HAxUY7E2YFy7D
X-Gm-Gg: AYBFou3SGlR+KJWuXF/EyagZS+fyg9ycqj9D4pp0qUYCcmFzpZ1hMExrrxEz0GyJHS+
	N0xnnHjo3C+/l+JaCqt6+gBIZxtqdJqrDDGWZ/BbpfzFAIZGAf0ATSJpmC3Zrly01ATcmKBbkz2
	OWcKSMvnDz39mSbfkDAnUEMT8/AO9XL+NRCSpFrarY6mh+17KW/3fP3NB9rQBijdlchFbM9KP/q
	lQeEbjq1TLLLDJYzCMREV3IT0f+DU6nB61yMiZUU1euJ8TXDkxFqkMdIxhcjfPFuxsXgN+7VEvF
	loobdGGZV2lUB/LQVT09iozTHJKmMK+7J0R7Wl+sOD4DVK2lNXx7blzGDtMbawgDC0rN3jYh+hr
	+mmNsPhMBknAOZvlqdofiGeRopZPqt7+YF76mEkF9GLBdda4F+3tgMJ6uqLAsXho1r3JR5SEyfe
	jSipY0WXWi
X-Received: by 2002:a17:90a:c2d0:b0:3ae:533e:7e3c with SMTP id 98e67ed59e1d1-3ae8981bf57mr9838899a91.35.1793715543985;
        Tue, 03 Nov 2026 06:19:03 -0800 (PST)
X-Received: by 2002:a17:90a:c2d0:b0:3ae:533e:7e3c with SMTP id 98e67ed59e1d1-3ae8981bf57mr9838876a91.35.1793715543484;
        Tue, 03 Nov 2026 06:19:03 -0800 (PST)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb36468be4sm1442126a12.12.2026.11.03.06.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:19:03 -0800 (PST)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Subject: [PATCH net-next v4 0/2] net: wwan: qcom_bam_dmux: Add restricted
 DMA pool support
Date: Tue, 03 Nov 2026 19:48:40 +0530
Message-Id: <20261103-qcom-bam-dmux-vmid-ext-v4-0-3690cc5ca0fd@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAEHt6WoC/4XNwW7CMAwG4FdBOc8odljT7rT3QBxC4kKkpaVNi
 YpQ3x2rh+2yioulX/79+akyj5Gz+to91cgl5th3Eg4fO+WvrrswxCBZkaZKWzzA4PsEZ5cgpPs
 MJcUAPE8QGqqbcDaoPSo5vo3cxnmFj6rjCTppqZNsrjFP/fhYPxZc9+/wgqDBtNQEZ713tvruc
 94Pd/cj/bSXscqF/rSG9KZGonH76R2hrY2tNzTzq6Em3NSMaJ5DwLaqUZr/aMuyvADdv3StaQE
 AAA==
X-Change-ID: 20260714-qcom-bam-dmux-vmid-ext-d9289db310c1
To: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Eric Dumazet <edumazet@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793715537; l=3232;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=6Zmq60a17c0joTxpTILutxl9UiqcuO9gfe8ueBT+e0E=;
 b=X19BQGEzJct/9OMvaulxhVdjSjIQqCoOboF9i5oQXxdSGvCZR3hw75w4JUB+/QRgxqhonFWBO
 AkAYajxC94eA14SZXEJxZ5ABN2WRYRdfK3Sqoas7KMYmgwPtWU23vhK
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NiBTYWx0ZWRfX4SpyhHmiuPV7
 dWVCb+KwvoDbA9pRW22E0z+JD6Dx2fyTTRB9RyvBRIx4J2Jz/pcZqwcnLVs9Zz6y1P5H2XunxXi
 Gr8fvmP3z4G1cxK858PJ0VG6uGPzCF5B/tQZfaf+3TwtL8mPWs+mQdBLsy+5LRi6qJu66FoHeZ5
 aHbknL+hKwANZKf6yWtDpdAxfkYlrKTSL8XpsyNbXrDw6bE/ALjW54wwy2iiahfDgyQRU2txt9E
 k3gFOy76L5NeB+IcVPzZeLKQgBMGzW/YgSuEaoyeT7G1WViDTPQorQ2WEVv2oP0foFPW0pjFqic
 A/RLQe3CcdAJO0Sk1QLBWGepWN04wR+hIWzOpySvs5nVnrd/EGbMNFhPaSw5UMQ6sdVysN18FtL
 NZmBRorgBtyFPd8jWE5Bhw688se4CmXIhZ6VOmyLGrD8uhiSlDAR+Va8IGX4r+Syuu/p6RtJtLf
 Q6IpoUrd2YeFR4O3YWQ==
X-Proofpoint-ORIG-GUID: UvVzI6usx5Zew8mE11fxZs0JV1rrRxbM
X-Proofpoint-GUID: UvVzI6usx5Zew8mE11fxZs0JV1rrRxbM
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae9ed58 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=b6zUKPCi1xLaIh-VD8cA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NiBTYWx0ZWRfX2gLDoLnCO2Am
 7c4xatwmRulKGDbbQchATLWCFWoz0cr70aEK/bUzuF4mulZP/HQJZmWv7EX3keO/2Ociyn63Wqq
 z+M+wsEtq3DPFw3e/uJ3GSQaeN9WJo0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030056

Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
domain with restricted access to system memory. BAM-DMUX DMA mappings
and BAM descriptor FIFOs must therefore be constrained to a designated
memory region that can be shared with the modem. Accesses outside that
region can trigger an XPU violation.

Add memory-region and qcom,vmid properties to the BAM-DMUX binding, and
a qcom,shikra-bam-dmux compatible that requires them. When qcom,vmid is
present, the driver SCM-assigns the entire restricted DMA pool to the
local and remote execution environments before requesting the DMA
channels.

The restricted pool then contains the BAM-DMUX mappings. When the BAM DMA
controller references the same pool, its descriptor FIFOs are covered by
the assignment as well.

A related binding change allows the BAM DMA controller to use the same
restricted pool for descriptor FIFO allocations:

https://lore.kernel.org/all/20261021-qcom-bam-dma-vmid-ext-v3-1-299355e8dd3b@oss.qualcomm.com/
("dt-bindings: dma: qcom,bam-dma: Allow memory-region property")

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
Changes in v4:
- Decide the pool reclaim on the remote power vote after disabling the
  PC IRQ (Sashiko)
- Link to v3: https://lore.kernel.org/r/20261021-qcom-bam-dmux-vmid-ext-v3-0-cedd1f681102@oss.qualcomm.com

Changes in v3:
- dt-bindings: Add qcom,shikra-bam-dmux, with qcom,bam-dmux as fallback,
  and require memory-region and qcom,vmid for it (Krzysztof)
- dt-bindings: Drop minItems from qcom,vmid (Krzysztof)
- dt-bindings: Drop the example changes (Krzysztof)
- dt-bindings: Drop the statement about the local VMID from the
  qcom,vmid description (Sashiko)
- Reuse remove() on late probe failure, since the PC IRQ may already
  have powered up the RX path (Sashiko)
- Skip the pool reclaim when the remote did not acknowledge the
  power-down (Sashiko)
- Fail probe if the restricted pool is not attached to the device
  (Sashiko)
- Link to v2: https://lore.kernel.org/r/20260920-qcom-bam-dmux-vmid-ext-v2-0-ef5ca2178378@oss.qualcomm.com

Changes in v2:
- Replace the Shikra-specific compatible and coherent RX allocation with
  memory-region and qcom,vmid properties.
- Use a restricted DMA pool for BAM-DMUX mappings and BAM descriptor FIFOs.
- SCM-assign the complete pool before requesting the DMA channels.
- Validate the remote VMID and restricted DMA pool configuration.
- Link to v1: https://lore.kernel.org/r/20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com

---
Vishnu Santhosh (2):
      dt-bindings: net: qcom,bam-dmux: Add memory-region and qcom,vmid properties
      net: wwan: qcom_bam_dmux: Assign restricted DMA pool to remote processor

 .../devicetree/bindings/net/qcom,bam-dmux.yaml     |  36 ++++++-
 drivers/net/wwan/Kconfig                           |   1 +
 drivers/net/wwan/qcom_bam_dmux.c                   | 114 ++++++++++++++++++++-
 3 files changed, 148 insertions(+), 3 deletions(-)
---
base-commit: 7b6ab4dbc156e2f96419715130b3d5738a306c93
change-id: 20260714-qcom-bam-dmux-vmid-ext-d9289db310c1

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

