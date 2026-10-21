Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792564801;
	b=dXTxTyX9ckB6u2w0geDFyYnvDTA4y2DHKGPubnI3DNYmVGcfdiAce64h/QbHnO8OqFY4
	 zaZCKHbnT2B/FPUt0RRZuCJh/lF01y9MYbUp4UGKl1QoXIrOINj8r1koSZI/EpeqNq21Q
	 I1/EQnUmCB988DjssT6CyhKMYksqky/TaBnz5/KzYluiwCOnrr7zmMSm5UqiTpAhrJmCe
	 hfXJu/Y+XtXi6lLCDgO813ikEScKiLa1DUT0QL0LBkZRsHpR5nkHVS5uPRdTo2SBjt1iK
	 qUmy38lSiK591miKFFy3CBkirdOIyjejRsECyuOEmA4cdX3Wvuk/f6dnua1RfWlgdrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564801;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Go5/h6FVonbcrlXkL4gMkuNu7d2LqHDLKl45lEDPQ6U=;
	b=eelrbKJJRZohga2jLi4+9EpU6s4xY1b/kaEUftgGxHWmjZcGn5H5/e4/1ZqyFlzrHEn1
	 w4XCabLlF3z9sjYnxf2IAN2qzD1cTlFiTWHBcPeEbjZLhwvbc04UK9+Pc/7DUuvlaKG/G
	 dTwugkIqsRmLtT/GoJ4xatIMl2Z/zE5SWEJvpFsONnWOi3sxMOKHLbEo8icEbvzC/R8M0
	 2518yXeRfUK+oyKlAXjD5d1aEX9BccpBes+B9wK3ZGsTKnLPujS85NzyoFUlLcaMKW8dD
	 Yvb951MfUGBK6mDrL07VMym/p5g4wUBTrjMIMwLTgu4boYMFDZ80Ks4DUBka/yctd/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="IWNUfv/s";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FlDdU22W;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D65606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 06:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7D65606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IWNUfv/s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FlDdU22W
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jBQW3711810
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 06:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Go5/h6FVonbcrlXkL4gMku
	Nu7d2LqHDLKl45lEDPQ6U=; b=IWNUfv/s7L0Xbv8mDtAt7iV0x60ZltrkcK0mRw
	ykwrWpYMfshPknfyU/05WonEVlWILfhh3m4sVpkM0DqPXGwCS4LVQzQV+a74yOjg
	K6uNtn38nVpu2be43MnhL3fTzmq2khnYHPelByNe9XSk//8B24UZ/YAPQyqs0F7S
	HvN/FvkozdilSF6Q3/ATqp8pHvAb+ALfZb+A5HlfmJGkYHXjyof1H88VmDVmX6I6
	BJYxW0c9mv84h1tQ0WzioTP04g0e0zT8GNAcpmwNO3yy59/Ai3bko9DHQ/Ge4EYI
	eLJYbABbI6flJ3m+7BS0YkS2etZWQQQQplnq/g4wlQg+9t4g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v2da1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 06:39:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab67ff8ec3so385042a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 23:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792564798; x=1793169598; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Go5/h6FVonbcrlXkL4gMkuNu7d2LqHDLKl45lEDPQ6U=;
        b=FlDdU22WMSHx/t0NRsDkdDxsD/BAEpR7XcYRL1QEY+AJ88x2vV/9a9+7lSupyIXdzP
         jgMfwktu2P91t4xNhCqLlywA5bWhaEnWDENBmJDIR/PtgxwumFAOv+1OF/oI8OhRvLXg
         bSlXMOaTWAdZq7PA9utcXO//pg4E/xXwxSQwQzYfFxPM9ymvKjlVhPWmB9AvEuuemGW1
         pLXyafBLi5XV5yqkridZrV22X4fFVelG3D/HguRCcPHZQLqJFNFXTo4Okha/NWDYnuC/
         ftRfdrZD3HL7EXCpntO2mc9FmBTiM7H0jvX/IqqrZJKr1Keo1GN/P/udYehIBdOoRgkI
         ba2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564798; x=1793169598;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Go5/h6FVonbcrlXkL4gMkuNu7d2LqHDLKl45lEDPQ6U=;
        b=oq6j6RHxH+lLyPEOyv9M+Ts+d8r7v674Py4RqyG+fWMFt15ZFLtRvc/17lijaNcuZv
         5tlrlsTDqE7B9e3C3KMhqKsfqEgm0rUYBqUDphlAUm1b65WggSpB8T6bo5sn213211hJ
         RVT6OtgZavGmow2mV5tlEh5UYNUNe+UyIYvhOMEtckalSIflgXmsIDLrKGM+218bx7VR
         GK2pr8t6eV/sbKph011Gf8uEcNCAe2UkDhKyKv04S7TRNWrhEny8s+eUo7vkzA5zqEfF
         DDLcxq+ciByxh4YVx9VxUtbaMMkxk1HOFkIJ9Z59Fhib3yOc7qdRVy6mC8S5BzFIe32b
         YO5Q==
X-Gm-Message-State: AFq9FYKvFwiEkBq+gMMjHuYXc3SDiWfYAnFdqzYB1Mjc1OjZx2cRZ/7y
	ZOabg5k30vEvQtFNk+Axb6bZhWz2MfLjvWO3QEv4L+PILSSo7nfj2o/hLvPf4H4yo/qL5ireabl
	SAzDlErxqsjr6zbjxCF0urbvJmmQwDc3lU4VtpoIY34ewkvOs3MpxFLkjWaD6sMRKl6+C
X-Gm-Gg: AYBFou2S+DRiHqWXo9KBmpxwOXIehevyojOHgG4dbPm/YzgV4/ay2Q+2ShDXuZ2CJ2K
	czfWTBXoUomJa3oo+u1aykT2UgskinrwOX5RLkv6C5nVan68apNXEBOkaJjYI0kxXHD6QhOKOwM
	E/MCkRIVo7J/z7SLo9PcPz+EzfH+X95+AhrIqSoDpVZ0dINIi32XV76Zh83NJLoAKgMlBvoLqwl
	cI9k2YcmHloHgrlaQ7iE15VcN9RjXEYZ3qUG/u4ecb4/a7rbPyrliA1zoK9Pz6uDajWPfQZyfL8
	C4b/u3+SsRlmmW2dgy1KvLrU6NjUfFp4ATpevH4uLqbz1F81zNnK/vVSO57SpUPHDaipx1xE0/b
	NylTpghB01MVxvLJQb2NiMdo4NIQ/8GrY3/w=
X-Received: by 2002:a17:90b:4d12:b0:3a0:c276:1ec0 with SMTP id 98e67ed59e1d1-3ad86d50c08mr1005127a91.28.1792564798363;
        Tue, 20 Oct 2026 23:39:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4d12:b0:3a0:c276:1ec0 with SMTP id 98e67ed59e1d1-3ad86d50c08mr1005109a91.28.1792564797759;
        Tue, 20 Oct 2026 23:39:57 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad82f0c0b1sm1163101a91.0.2026.10.20.23.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:39:57 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Subject: [PATCH net-next v3 0/2] net: wwan: qcom_bam_dmux: Add restricted
 DMA pool support
Date: Wed, 21 Oct 2026 12:09:42 +0530
Message-Id: <20261021-qcom-bam-dmux-vmid-ext-v3-0-cedd1f681102@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAC5e2GoC/4XNTQ7CIBAF4Ks0rJ2GHy2tK+9hXFCglkTAQktqm
 t5dwsaNxs0kL/Pmmw1FHYyO6FxtKOhkovEuB3aokByFu2swKmdEMW0wJ0eYpLfQCwvKLiskaxT
 odQbV0bZTPSNYEpSPn0EPZi3wFTk9g8stdMub0cTZh1f5mEjZ/8MTAQxsoJ0SXErBm4uPsZ4W8
 ch9W+dR5EQ/WkfxT41mTQ8nKSjhLePtF23f9zdNitNZGwEAAA==
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
        Eric Dumazet <edumazet@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792564791; l=3014;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=Wm437G/2TEyo8uw1Mal26euONCvxGzUjWUp+GjfVFiM=;
 b=M/CCaVJWr7jkoQByJ6f99qQqnw+PM+8ClscrF859MYpuCSFQk4sJdg8/ie3XKEiXGCeODGB/T
 AV44PtlB15lBJ6cIWOyHCONbd9BSecCHJuQeWKMkIxZTAWBhXey2229
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyNiBTYWx0ZWRfX91Cl8+YVAjdZ
 9d4eXXfruNS+zzWStTuyP+95BFL1kTW04qYqADJmujUzSGVB0oz0mxq/Q31UOBxZ8cLgrbz/lnA
 mvI6s8KjY4rkBkAR0SNAr41qsjWka1g=
X-Proofpoint-ORIG-GUID: _3KXyDXPg3XUzMUc0fnR9gt3MvzbQ--O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyNiBTYWx0ZWRfX04FEQjNeM1Ch
 WL4MEd+8PRilcPdyIpccHvbNmyAwd237lnzU1QFL/jSsfCTr4Z83Mhbvp5buUqrnSYGPHh4CZPA
 vl8fYerAcRO6lIfdpd5eshjJxq8iYDjVgCllhwR2nq4ggvsQJdsvc/UqCdP+Zc+lPsj0NAxJ2g+
 XQeGaaH8NMO4r39yFIYqisMFk/CzfiWnIwlcTJ0TQyY7xtl7YOXhLbDXTp2kKpyWHEL6m0DXDAV
 lIpnbjiJWAGAHyyjJSZgncroeqX2RHSWO9XfB2S8spAWmYrm7CGUS9IpO3C6+PSQJVEcVhebpMU
 0EJyLaqJYBQTkuj46o64FTX/JUwwuktuYqAKhwLF5jXI8jVzvf8Rq4Odv+riffdwAjL7GbcKm4v
 fGOtXy7P20bwiNPqS4ScyLbIgJZGBiOCLHN7yWv8lvnO4iisT4lN4GwBeljJiuDvSGHwuvYQ6zp
 GR8uz9Wiu0Sh/+Tw3dw==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad85e3f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tWlRu96VJg_J4rp9qAYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: _3KXyDXPg3XUzMUc0fnR9gt3MvzbQ--O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210026

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
 drivers/net/wwan/qcom_bam_dmux.c                   | 119 ++++++++++++++++++++-
 3 files changed, 152 insertions(+), 4 deletions(-)
---
base-commit: 78974bac98eb0581f85aab56ccc0377cdcedb964
change-id: 20260714-qcom-bam-dmux-vmid-ext-d9289db310c1

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

