Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160554;
	b=yD6jPAjtT6ajb1xFKvI0SqmKIfhbtr2eGzx/xsbGKDhbjgqvtTg47jUwkn383Katiib6
	 75UT1lS6bIFo5Gm8vNj6HpGpg6AV/Ggm7EVqu9OzPbE7GG1NgmR9s4yNyVoJY2mIkcu2X
	 GDfYYMpHOXL/rslkLWQ99V9bRrNoyLyo/gjZkvhJG6erbVuqPs/ouE9Pxfozxnz3E6f//
	 fLMh1cQZQ+M5WTZDPmVGmho0WG0Y+k/kqcNs5F3JDfUR2vHxMpW9jtvb96dzCMBwbQHcK
	 EQ8pcMPXm92B0izWdZcGH3IMaiZXFaL80Peq23P4H1NqSRPT6M2Sy4c0KlLtTrDz0vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160554;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OJHdZlygRN2jDx54/MBmSPXGD8ZnLG5eY4JP1FvaSw0=;
	b=pxM5l+XPuvS4+bhb72wcw30Stm5J8AWu7nuEWuv56XosRjyn+LWcKekK5zHMYmh1rPKw
	 EhzEdwysK+WEEKSA2v39V+IaMfA8Atg9fLMbl05MQ/XotUi7THKGA7Ixe6RfK0pWehz45
	 cGBr0wfqv9D26E7kkuyckmLNx/zHF20p3caC3P9v3swgQFtfY0Qzh8ys6ExdioU9fWtQh
	 PNIZTLd0N836vsjLmSLSNPVf+0jhU6T+Mx+3zGBQrUl8oFKCJXgr8PyxzNY3Far/mjDmS
	 4POThXNaiSJtrVZhf0n2K9boA2K29fpW2CmN+1El3okqRPse1iB3StDwowUBDzT1S4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MbwfR187;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bl91ntfK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34034606A32C
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 07:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34034606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MbwfR187;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bl91ntfK
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f4Q61112438
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 07:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OJHdZlygRN2jDx54/MBmSP
	XGD8ZnLG5eY4JP1FvaSw0=; b=MbwfR187Xs+UqJQh7lNr77GGIly3dgs9Inn6zI
	C/4ML5e7MFvx+dvrRc+n45AsZQppXi8aiF/2xmyJe/XQZyMDHGryi0cayyh23lZ7
	uXoJQ2uhiWLggNiBHn4FjgQaJIkVXMv8fE3mwghidtmQYmsuXvxcSmdyxm0X8H8d
	OQIH5d+pSmmBbfPua6GhKOAlJjuO/cTBmYHLbn7RD8UvtVfRpJiorDj7W8awDWDj
	tzG8C4HBSFRelV52G+i4J/hZoESPj6NkN/KTmzUsjqPTIjea/TRUVZEQLXRY/xmk
	SeVURYiAzYmz2jc4uPin+ZoTN6mzEu5inM9gyLhM2a/TP9EA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjtrn0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 07:42:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b40e7f4fa2so1279720a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 23:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795160552; x=1795765352; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OJHdZlygRN2jDx54/MBmSPXGD8ZnLG5eY4JP1FvaSw0=;
        b=bl91ntfKzNi7h/F1f/YBTWmiT38fkBb/EFhv3JjJWt6dnN/8FePdbCIfdVDhFc2Xwf
         IDFJJhVuehaWbrHP1ZaEQdLd31Ke4xE7FOWBXVNrKBn+u4zhICgNEN6Om1Y+sAg2WJ+i
         mrRjiSKVmQVT48eW4a7hvNe+8Pm/uyg9+ARLJHNFoXBiep8njJm3m5/IZfwpmWqsnH9K
         09iRrhZQdrFDLjQGlL43PPY8Vr5exLbKSGQPW5gXjbeucPq+gcqdSvWFEUrR6UmbnN2u
         KmxuPLXevxiMyUZHEfTKTfSgEu/1PDdeHIu8aAvH1jM60V16NTw/hWRa5f5mMbAolZ8R
         Xpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160552; x=1795765352;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OJHdZlygRN2jDx54/MBmSPXGD8ZnLG5eY4JP1FvaSw0=;
        b=Gd8n8fgU3hyAlSIzQVpX5DaEYqHIO/iFNunTsZUJPt9i9yf0OP34TNaJZWnrLnTFzR
         b39lmV9u0/8o9FDM7JRon01Nc0zb3urC/PusQfvLf2EcvOv9h/gpHtzNBOzQpymFjhBi
         MxREUkmHUPoWQuEwkHoBR7HtRQFdrAp5B2YbnOxyUTW01BSGSSbwbLO8by01sSB/WK29
         kxa1AM9R/Wk3n5hZHktcZjetVAVJFIftZhdlQuvI/7yBu0a3S1ZR9V/9NkByIrGpvlu/
         am0TLEsBhtesy/pkfyRk8kfcjOBaYCLJx82ZaurMDr2pi/kAOXyyx5rBZUKaMmJHmWe2
         g38w==
X-Forwarded-Encrypted: i=1; AL+hErFqeBXFvXuzZVx76DKBRdFEzh5Wriz46cyBz0104aV+MYetuP+ywNaN+X7hu1BzmH3fgpY9r6qpQTcl6mWU@vger.kernel.org
X-Gm-Message-State: APuU4Z+8w0zw299DLPPJVBzfIIHQ2hTumA6pp4Hrou8quMX2/+/SHtPD
	s8BDi03RNVVHaprvpliJU2+2abuCdKF+kBT+gq2h7pwKLHnm0tE82T3KN9hBmlg9hfCilTuOxR0
	Rcz271RIYTbPYGs+/m55+9iAcOiK9A6q2yay4y0Vqlfv1A260GcxRnWbumcHV5bgVT5B3
X-Gm-Gg: AZFdTZcOSPE/bIvAFfAApuhDSZ4FfSQkZyF0uvAaXIOCUc2mQGvmST+rltagAIzUSCf
	qcvXyUk9I0a87wUAU4AZ3yKPbAtJSj2mEiPFfpwHnQ38tM4Z1z2nsVBJM/kcViGslU0YzEjpESV
	Fw23RqOOvBVOj51mXJjHdPr1xXhPC2QqHTm3nsccyltTf6JbZzdfBnpvAPrnzvvZCJji3VPwx9D
	EcDXh9O5ax8hA5fXNqdOneCxvWRAw4bHm+dqIVNuc1CU0fMA3MWV0ph/SmAcHNpj9Vs5afYeTiG
	x9vD+IHQLABtI3g2bkmiTXtTV16v+s0VoQRfTDo7H513LZ0y9WpSvjxZKDhwxjy4C936wDs+ZcR
	vyCQBg1P07DMsM2UznTqiKLP+uuIc3uVAiySVkJNHKsbaRQbWXT7I57Dn5fKHfHrGWbtVmkpy5s
	lkTDP4+4U=
X-Received: by 2002:a17:90b:2fd0:b0:3ac:a521:95c with SMTP id 98e67ed59e1d1-3b41cb235aemr2152828a91.58.1795160551833;
        Thu, 19 Nov 2026 23:42:31 -0800 (PST)
X-Received: by 2002:a17:90b:2fd0:b0:3ac:a521:95c with SMTP id 98e67ed59e1d1-3b41cb235aemr2152802a91.58.1795160551239;
        Thu, 19 Nov 2026 23:42:31 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4323bda5esm119935a91.3.2026.11.19.23.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:42:30 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH v3 0/3] media: qcom: iris: Fix IRQ synchronization during
 power-off
Date: Fri, 20 Nov 2026 13:12:03 +0530
Message-Id: <20261120-fix-disable-irq-safely-v3-0-82f9561394cb@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAMv5/2oC/3WNyw6CMBBFf4V0bUlb3q78D+OihanU8JAOEAnh3
 20xxo3MYpKbuXPOShCsASTnYCUWZoOm71yITgEpa9ndgZrKZSKYSDljMdXmRSuDUjXuZAeKUkO
 zUJ4ooTMucsYUcc9PC665g6+3T8ZJPaAcPc03aoNjb5fdPHPf+0qyI8nMKaNxksWpLmQhKrj0i
 OEwyabs2zZ0i3jXLH40N4c04Wg58EineSlAF39o27a9AafnJREjAQAA
X-Change-ID: 20261004-fix-disable-irq-safely-15b2f712800b
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795160546; l=2288;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=FR20uXI73EXR2aj2lUtbieQR1WkGmhS+TQ8fKfJ+jvM=;
 b=dimX/6X39t1RoJs305qysFBRWDYMJTuJDt9vfj4mcymkOXlUgo7JIE8pyB94CHXt3SPskW0L0
 M5XmVOn19sMBOWlI2VUVgexF/AyqdpPNBDebeeae7+kN1+tIS232ej0
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: Bivp8mOyaI4ZGh-j8LtkFGMxC7uEZUnO
X-Proofpoint-GUID: Bivp8mOyaI4ZGh-j8LtkFGMxC7uEZUnO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzMCBTYWx0ZWRfX09qZFQZmMBZw
 BsbX2j4MjQHLtiZajNe1OhyMyc9gAv5tBzXnlbWKgAyv+a4fvjT+5r97eYkKTi3wSJxYJOFFzPY
 TrerGjGFn9mo6ErXgHiEThCXTcijAznCglVPSIXTlJUNMn40tt6btsjmgQPMXIijUvid9652nP8
 cZnvi2JmGP3IMUCZ2kyjM/tfcEZGgkh22+o7Ed+6RVB+T+/Dp5NL4vQP2A3zu5Wat8bQSkFx/JM
 KOdPW5yZRaf05BZHLK0MGdjV0WZLGWOK/d0ANKrdafd32ImPC+LFFCdGF4kG56Pd3+Tbi4yO5/5
 yorrrI0ZRo2XKL8FtlsLIFBp3XqppmXMUQYFcL65PKL6DBAbkAsCShS2iX5YjDQlh6q1GMzfJ5X
 90X37XfxbjcngGF7TWvNgIubJBoh9zsQF3OaIzyFYPdZyImGTiw6cTJw2dArZRuVdMrV/CVvwTs
 9pzoD561ZuzaxQOZbvw==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6afff9e8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=_RQlf2RcmuGO1PAenpAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzMCBTYWx0ZWRfXz9xc3+hMyPRU
 tqAhbhdu0xyAhWevbVtnXAVbPK/vt1R78sjwzMVRdmz4hfn+lo1ep3hc9mxlwCRLKrS5Z2Sg0rm
 vr4Ka/unhcYSpX3PLezBYqpJBKvCQyE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200030

Commit b9c2215bdedc9c ("media: qcom: iris: use disable_irq() during
power-off") changed the VPU power-off sequence to use disable_irq()
instead of disable_irq_nosync(). This was intended to stop a queued
threaded IRQ handler from accessing the hardware after power-off.

However, iris_vpu_power_off() is called with core->lock held, and the
threaded IRQ handler (iris_hfi_isr_handler()) takes this same lock. If
the handler is queued when power-off begins, disable_irq() blocks
waiting for the handler, while the handler blocks waiting for
core->lock. This results in a deadlock.

This series reverts the commit that introduced the deadlock and fixes
the IRQ handling around power-off. It keeps the IRQ disable depth
balanced across power-off and power-on, and makes sure a handler queued
around power-off does not access the registers of powered-off hardware.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v3:
- Used IRQF_ONESHOT and dropped the manual IRQ disable/enable (Bryan)
- Avoided the irq_disabling flag, waitqueue and unlock of core->lock during power-off
- Skipped the register access once the hardware is powered off
- Link to v2: https://patch.msgid.link/20261111-fix-disable-irq-safely-v2-0-8e13f68c2ef9@oss.qualcomm.com

Changes in v2:
- Added new patch to handle the irq depth
- Link to v1: https://patch.msgid.link/20261007-fix-disable-irq-safely-v1-0-45746f9a92de@oss.qualcomm.com

---
Vishnu Reddy (3):
      Revert "media: qcom: iris: use disable_irq() during power-off"
      media: qcom: iris: Fix IRQ disable depth imbalance on watchdog interrupt
      media: qcom: iris: Skip register access in IRQ handler after power-off

 drivers/media/platform/qcom/iris/iris_core.h       |  4 ++++
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 20 ++++++++++----------
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 -
 drivers/media/platform/qcom/iris/iris_probe.c      |  5 +++--
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  9 +++++++--
 5 files changed, 24 insertions(+), 15 deletions(-)
---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20261004-fix-disable-irq-safely-15b2f712800b

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

