Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975366;
	b=RUotsi+BEAeoCvNClDGO+wbM4OgKEbdXxu5VabNC2wTEuRe1Iyh1aVcnJdrkBuLvbjkK
	 k+uO4mme57TLNcwMyKJPXX2QVISYl4HalV2EUeUZ7zBZkIpR87cXQvnf0NoFdMWR2GFZz
	 kJYlZ8yFFkdpyWeMhgTvyuVem8FchR3jG7+H3cy7Xl0KZinSgMQAUEIM02SaSp3JFexAS
	 dsLm/02xaVFk6BYTij2/y/ht+YyzTt9X5YP08wxdkNlo14n0pkDnwopWZp7+299ktkp3P
	 mZlALTmiKAmUC1wqil5jR/nCe74Jxujjoq3GM7pxY3LIwdKRsgjdSAMyeFKmB9ZjWJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975366;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gT8k/UqrXcceVrd65LBPRzbdDHfe+aeDILXl24N3ino=;
	b=XFixtEr98jRFBBqO+cLs/QQjEozz8V5HKp/DDS6khXpm2/gD7sngh+CiaZ1YyeL+W3mh
	 Sj6O+YMZAkkuqvNErgKsQIUwA1xiX6vrgIJ5f2S8Gf7gl1xQEQAWhdlSprTqE4qbcLG/2
	 Q7enOaXXegxP8i3aCWPRVR29a3PKlu768tayQ7y0vEMEA2i/zZGd11saRv06uksVafcNp
	 BoibWIr0Hsq4Mcj4zQZLnuM5R49L97buSft3jADSJMDuoDvs8AMqQlqCIXJ8PCV3PL4Zg
	 rhY1pDeWdFbY4vDnSzVUpCwhB02n2OIslYWArNg7GjU9DsM54wOz10pYTSzQe71YjvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LeR9nlih;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jbgbw0HJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB88E606A33A
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 14:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB88E606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LeR9nlih;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jbgbw0HJ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6EQKeT3648162
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 14:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gT8k/UqrXcceVrd65LBPRz
	bdDHfe+aeDILXl24N3ino=; b=LeR9nlih/O6bd9Pof1XTFMZQsfDvQ0pjgpcyZR
	GuvROnJOl4nDeQ2henoBCF3Gb39vXv7jr53x5E3NHRJMrVsrUPaD7i7MwY+6VWSE
	aKh1Vc+v6HpLblcXNnI8I5be7XPKz0EhrhvAyTiHFy8P/ef8UmjG/iT1evqmRc3u
	01Phy9aqBARSsabcjivqQGnghVaMgtoSNNcmCIYgdsLwCkTkdQ/lF869lKy3qMwd
	d68JxymGoeBJ56dxiAxIIvtq9s9zdqpgFzri8ysuYfkHMgAartqCv55QLx0FsWvq
	V1cJryZph/OP+t9G05/IVczq7JXMp7zGXuu/kul+rVIPWGfQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9k3h6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 14:29:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a06750c74fso576988b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 06:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793975364; x=1794580164; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gT8k/UqrXcceVrd65LBPRzbdDHfe+aeDILXl24N3ino=;
        b=Jbgbw0HJA6CpNAozK7ruLE/T/xlmr9LtgLSeVMWNzMK80yRREQ172Pdk1pVp31euHO
         8jMVfc+RyEve/5wlwtlL2+m3+xQ82myMe3uT19X6SeBhgeJYq3mkXl5fzzjPzQvcoXkQ
         Eza8FacbNjApHYzSV/v6knFO0n4lJGiNaXely1Zw2uX8u+eYXO4+CPYD3o1J+CCFo6ta
         bx1u7ObT3f5pKLJY+OJlcj/K3MLyzjUycuH3G9OhDyiVF/LBbIhNfEB+hFeln2f5as5u
         0LHz372rfJ/DRBxdWHd9w8SzfRKXQk1i+/Qdii+S11SMrJ60ciuv3VDLaQuavrzqR8FR
         ruGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975364; x=1794580164;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gT8k/UqrXcceVrd65LBPRzbdDHfe+aeDILXl24N3ino=;
        b=vjSidz0vOGsxu1vaNgQKQHnj0gnrg/k3VtjO1B41/GuTg4U8wwO75ntqZsbkTok6cb
         x5G8uz+FaOgitsZhjJ1KOf5qtWUBTQJ+3qA1Uar0Vmt64aoZkhpP+TUown6MurUoXiRa
         HDdlOfQU422N1bF0bJhfPOVIPkPN6WzqqeR3e5KypsOOWc4flpyF9KMMLghTV5HROZrD
         N49+iaigdhq5efIaKRzweDn9mRayPXz5mmJLd54ILLQ4oM7ab9LVghBBCT/wNuLRrNgO
         8xJV+XVcMJgDU24npJnzAUcoCK5OG0fgmVIwH2+0hFn3lrRGgcRwvE0O4nWglMRebR0F
         rTXw==
X-Forwarded-Encrypted: i=1; AKwUvByhbIZE1QY9xFNTvPxbp0EaiViRw5fVljqWtJSjbVXZCtGJ/EIbGw8ubiPsbHTE4ePMBahdwg+6+yYGBzcU@vger.kernel.org
X-Gm-Message-State: APuU4Z/3k0Y/WAOyieGTlpizKohw+EKaoD7onSDgh82m69d/Zs3J4pdQ
	zTjsZt+HmBBE8fnKmuJ2+kzM7Ola54kS6jGDoplHOCGlffTX7Tw0BmoM1+xGhSThiuRHjnuKe5p
	Vny6FYAjb8+LYken8YglYPCzV+4J93FALNxKI7Iz+ctSnqQB+jZLyIvlF/cjPNj8vTe9L
X-Gm-Gg: AYBFou3GjP79CXodvm+m9ApmidzID1iAQHQXZFuKdGBU0X6fMI3hXoXz7I2Ee3RUFDI
	WiZO1soOoSPThSkyIq7eg7PAL1vNOnUj+sfGqIyM6yDALc7WqJ6nPVnq9R4MGEtNbLYtKb+NqGn
	w0DsleWqUjkROp+LthwCmm614ewwgvD6IyrEr9xPiWlsUHa88zSLXDIzVlten/SBs0vQr2bJvDz
	/x5h3JptXWIhdjEyVgI6cOhx7awuE/yRamGVE7Zo3f+3JJBUDuG8MBHvTHLifcGDAsGqLEBBAop
	Qo96Fzhmtw0lFZuV/P77uLGACq0zBPUnsJ86SI5NWXeA7FTkm35gjZjUb2cMOQftnKfgrCRUBcT
	O3TZ0cvp35BAbgyBVF5eJwZ09bIhEpWmqkD2B5vq1t+Ismh2Oqz/HnL7550BfiP+vGA+R/AOjLO
	kBX87/sQ==
X-Received: by 2002:a05:6a00:a02:b0:898:f575:7bec with SMTP id d2e1a72fcca58-8b37ac9efe2mr2503140b3a.17.1793975363989;
        Fri, 06 Nov 2026 06:29:23 -0800 (PST)
X-Received: by 2002:a05:6a00:a02:b0:898:f575:7bec with SMTP id d2e1a72fcca58-8b37ac9efe2mr2503111b3a.17.1793975363386;
        Fri, 06 Nov 2026 06:29:23 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b3597f0161sm690244b3a.26.2026.11.06.06.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:29:23 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v2 0/2] i2c: qcom-geni: Quiesce hardware on shutdown and
 panic
Date: Fri, 06 Nov 2026 19:59:15 +0530
Message-Id: <20261106-add-shutdown-and-panic-notifier-for-i2c-v2-0-d3011344fee8@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIADvk7WoC/42OQQ6CMBREr0K69hNaUkBX3sOwKO2vfCMttoAaw
 t0FjHs3k7xkMm9mFjEQRnZKZhZwokjerSAOCdOtclcEMiszkYkiq3gJyhiI7TgY/3SgnIFeOdL
 g/ECWMID1AUhoKEqRW51ZKUtk61of0NJrN13qL8exuaEetvmt0VIcfHjvVya+9X7W6m/rxCGDo
 815I61CaYuzjzF9jOqufdela7B6WZYPZjGvhPcAAAA=
X-Change-ID: 20260817-add-shutdown-and-panic-notifier-for-i2c-6723fc0f557e
To: konrad.dybcio@oss.qualcomm.com,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793975360; l=1840;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=64FEtBBjlH7O3UHiksty7i2Aaty9sIEf/YcPqDv1UyI=;
 b=Cw1HQQGcaCrsB8h7/fK1gkS71C/QX4vG2RCtxkK3GL5S5DEKkAupH5OBPRQLdKB5Vu4rHcFOY
 pmJFLMd0CVFDj6w7EmczWHeyw2qTmVgFkGAPrCBIevPnt880KeJ//O6
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: J3BRuVbxW25qcWmxFYwedrly2hGRKWMz
X-Proofpoint-GUID: J3BRuVbxW25qcWmxFYwedrly2hGRKWMz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NyBTYWx0ZWRfX1nK7SwPsEnIB
 JupRfDYOMZaUmcNzfZ4FGexEwcSD5uKVqb3jjPKI9c6TZ62Sz2j5FZvCw2YPfeFAw6vv8Ssz9nZ
 im3p9j3PjTK/4Q5oprhhid+1WCkTXlY=
X-Authority-Analysis: v=2.4 cv=XvNvqlF9 c=1 sm=1 tr=0 ts=6aede444 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=zZcfVseh7FeFBNu0234A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NyBTYWx0ZWRfX4gYphZuHJPpM
 cpCV99fpGP8pWstpKpn0k3Iktntnift51dvo0i39eU1A65yHUymdXA48RLy72h6E5aeNJiH5AvW
 9wahp0aso3ic+Dsw1UqvEW9XqiWBqQqWmoXYpJOAuqSOAj2u+jG+9eD+ymjiyMZI8P+WRobeR5F
 QtpC+UB0un+nM0eI/HAAzeHYcJa5itKQB5xMGKT1lwhUrO2VmRylNzaSoGrHobt+EUKGVyG8v/u
 0GLEmGvieLtsehY6vQbHdxgMBz83TATMWeeK6LxMeUWNempXz+GmF1GoPE8YSM9bxEsbgVl8VZC
 0SRdlWbm9ZrbiAGfHOmMGWT0YWMt84jSHlr5rb1jVPBB32T/VjK4pmPK0FUWP/bpW7X/jcSIsQ6
 WSedJIXmZyKWdB4q9yG8zpF7uOyxXn5o904PMPLl7hXhLQ2gH/z1qu1tiNcJkPP1bpPN206ZLRr
 0bM2Id11QX6PnyV6qWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060057

This series hardens the GENI I2C driver against two related VM-teardown
scenarios where an in-flight I2C DMA transfer can trigger SMMU context
faults after the VM's memory context has already been invalidated.

Patch 1 adds a shutdown callback that cancels/aborts any in-progress
GENI or GPI DMA transfer and resets the TX/RX FSMs before a normal
reboot proceeds, so the hardware is left idle rather than mid-transfer.

Patch 2 adds a panic notifier that marks the I2C adapter suspended and
performs the same cancel/abort/DMA-reset cleanup as the shutdown path,
using atomic-context-safe DMA termination since panic notifiers cannot
sleep.

Together these prevent both hardware state corruption on reboot and
SMMU faults (which can affect other VMs sharing the same SMMU instance)
during VM shutdown/crash.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Changes in v2:
- Log an error if the TX/RX DMA FSM reset times out in geni_i2c_quiesce()
  instead of silently ignoring the readl_poll_timeout_atomic() result
- Drop the duplicate i2c_mark_adapter_suspended() call from the panic
  notifier, geni_i2c_quiesce() already marks the adapter suspended
- Link to v1: https://patch.msgid.link/20260818-add-shutdown-and-panic-notifier-for-i2c-v1-0-9f31b5fae5f6@oss.qualcomm.com

---
Praveen Talari (2):
      i2c: qcom-geni: Add shutdown callback to quiesce hardware on reboot
      i2c: qcom-geni: Add panic notifier to prevent transfers during panic

 drivers/i2c/busses/i2c-qcom-geni.c | 79 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 76 insertions(+), 3 deletions(-)
---
base-commit: 4477a78374a57c3809b172ad30cceabda48c47c6
change-id: 20260817-add-shutdown-and-panic-notifier-for-i2c-6723fc0f557e

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>

