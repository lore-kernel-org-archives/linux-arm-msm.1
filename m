Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993023;
	b=Mu/FP0Q7jvwNtyH4S6Uv6UYSMG73CIxS4kCnfYsbrg25l7R73y8YQzVuArpgQRl/+8XO
	 gWX1HKAM6kWb79OX46uTfx4ogOT9ued8kxbIy+EGLoeHVhSPW6H1e+cRIdL/l94ghGWej
	 3FYgGnZKoM7pl4XjaTbdFHVgEQ7veL1Q/j/nxwzz//g9F2MW3gwakSTuM5Z81sh6kOxrV
	 JTWvjXkUJv7k8mKEJSxwQZGVKT1yukh0jrRKWLDm2DX9WjB6VMdqxUSmgWXqLZuOBCmRk
	 Q7i4t19cB4Q7FK6WCep0M4NzAk5iw+FN12/z1znh4tvsZvfkk2U231eM9KRqTXXcLQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993023;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hqJRXOoxftCGEgfPf5VGXFGD5TQ3O48MegfhSwXB6ss=;
	b=lm8SCWzMaMJ4KhPFZ6I3gKf5XC9y14c0fEBd9qWW+4SZNtt3wGYSoExKe5a4p7cwfRle
	 CIGXOOzUtgp9Ns9kmBMtnlT1U+AsgirZgnIjxKmoWxDsapeLI2+A+WxY62IHv7mTDVNC6
	 uQlYMpC6dXgkNnJO6YOjwQLxJqFGfySgb9EzM6haZ4rp8M5yOXOis4Ir9hseN8pIimeWt
	 bAN3Y1eRKtLSfs37KhtjlBe1qTEWEpmTBkjvmo4VcdOEpsK5Hnq//8unSmW9XJXB99SJ2
	 LnT7auAo1pPls4Rca52llY94+c7H44KgzkVItXlvD0HnvuZPls24BepO5Jj59XsGhKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RTmHxQi8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UZmeOI66;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48349606A331
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 09:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48349606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RTmHxQi8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UZmeOI66
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8U6L62106361
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 09:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hqJRXOoxftCGEgfPf5VGXF
	GD5TQ3O48MegfhSwXB6ss=; b=RTmHxQi8Kza8pVe54yjmXH9nA6j8MoyI4Udi+5
	LMzXCxnVA+HcCS75/MImmEYnsEm5Bw53srLNPSiBr9nNSuuqqs2/WSFfbBz7LQdH
	vzCpBwtv6e5jyyfNWbtUPyK0SyfL1XkPQFgOC91TV+suDhM8BhJtLVv9Gd/1hdFi
	MkWJ02XpDHd4L81NUOCCN6vRBtN3cIEEYwyifxL5jXxlTPjfGmBtDZ+Ch28AzIzs
	Xz1MxwxiqykzzYhpmRkXTztTjhoay2gjp3KBgaods1/xh2mwHk6oREvwoJ040kGW
	MO+Fq6orkqemA3d6pStiIoY2Thie2umh11OdcNXXdGjVjSMQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8t69e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 09:10:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e94f72fb9fso7236905ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 01:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794993021; x=1795597821; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hqJRXOoxftCGEgfPf5VGXFGD5TQ3O48MegfhSwXB6ss=;
        b=UZmeOI66gXreArr7IYk4xOUk0TO879DmhjrhC8luGtj1wOtwFPj7ECfPhXsYuAaqsS
         rxD5HVCUNYY0Cr4BpHnPhM+xEGtOOrjYNLGW3NjOzp5qx08bbrBa1C9sX6MVPq4G5jA7
         iHpk0mQhgeHGdH2nv76Ps3ZQE6SaCFK8T/pZ5WHdYoi7v/4osyVOUeHdL70+8uuTUC8H
         08AfzIE69qoEDPfh7kpZHU7K55kVgrvtlhUfYOuLIN4p4rdNlX2B22kILtqdY9vAxocG
         4CUTvm1M6cAc/eQf47JM/OsrdUzBUHPzmFNOMTb+vIS8qW+oiWq1SI9hk3VUGYwvfM20
         B9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794993021; x=1795597821;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hqJRXOoxftCGEgfPf5VGXFGD5TQ3O48MegfhSwXB6ss=;
        b=b1yENLp1flAiA6RyiIV2f4HjFbV+HCxsT8PakTjStBdr9gFW7GtkBNWPWu21DkEgXz
         75Xo+WtgBXjkUDaXj5SLZOkUarJEj49tqoAqf3F2bFw6HdmrV0ktMyea4HYmi2G70vE9
         2cZkIRqk1OBc7eqhRZ+04LS9TUgPJoIVX8h/WhApe6/pUpMqjbkwzdpNcdqb8m5i5S75
         x5z4M/9I3hTCJJsL/dtB1oAlgAjFyKCGVG8DMZ4DWqceof7JKfT9dmG4Jx71VHBVRnFq
         nl3kuTp/jqkR87Bdg+AMlz0BtTGTY+WlTUE5nhi06gDLofkSwY2L+ptycj5x85qix795
         MVkw==
X-Gm-Message-State: APuU4Z9nNbtGVbehD+ZtoiD8pcJz+0jg+9DyUiYs9Yg5JKJqOtk7oUWL
	Ij96PzCC4Dz0ytrgOspD4As1v907jfRhdUZloYlCh0WfpuAPtv4xX+p6pJKgTm371N1A3S2ZPm2
	NlrU369JfLc/kYWsr1aA1lWOVbG/9/7/SBJCkezAAuQN1WgTbOWgDFK8kuBIdg6Wg6aF8pV7xVO
	Syvmc=
X-Gm-Gg: AZFdTZdrsOf3udW+pOFk/uqseQFN+iQXhmBAXLIE+Eesm9Q6kkLIX4KpXqFJNpwZN9Y
	f8c+LuYXWCVuvJ1VYpeLINnPgAWEtTcUW7D0G0aIrkIq22PXZ0jXlHdpj9cYKZYCZSKy26QGquo
	JYEmlSme07hl0EvghOFqugSJ3dnks8jw25YimtHbURESq9JadFkROijj/CukK4vrOWxw7Qa01ut
	fpDpKsUXyjtn07wUDdzeyJj1lIsWQUJpFuYSNw2bhypxkX9WsodNwHiMiI+eCo8rj9cXOXFGNe/
	6UZHvw0rC4Nz5UCIlhYcnTkoJW79XvVjjf8buf6R+bLU8MrFq5LrdOlxKf7xwBoOzeDxQWf9Op9
	mAbAaB8fgcgF/AoOSFiD4MllAJwthaUN7kQRAoxs2cY6mNDiRrlrxx4vG/Std5PdknxDPvIMHYK
	kuabekZyi3ISSpoGqIRwT6BhQIk5DSxJrQMJXNI0a6j7SKtg==
X-Received: by 2002:a17:902:f687:b0:2ed:29a5:7828 with SMTP id d9443c01a7336-2eff72f1016mr20317135ad.11.1794993020903;
        Wed, 18 Nov 2026 01:10:20 -0800 (PST)
X-Received: by 2002:a17:902:f687:b0:2ed:29a5:7828 with SMTP id d9443c01a7336-2eff72f1016mr20316835ad.11.1794993020437;
        Wed, 18 Nov 2026 01:10:20 -0800 (PST)
Received: from cse-cd04-lnx.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e1295sm10147735ad.71.2026.11.18.01.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:10:19 -0800 (PST)
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Enable ICE for UFS on Qualcomm Glymur
Date: Wed, 18 Nov 2026 17:08:52 +0800
Message-Id: <20261118-glymur_ufs_ice-v2-0-7ef4556eea15@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIACRr/WoC/12OQQrCMBBFryJZG2mSOm1deQ8pJZnO2IBtNbFFk
 d7dKIrgZuAN/Md7iEjBUxS71UMEmn3045BAr1cCOzscSfo2sdCZBqVUIY+nez+FZuLYeCTJOVT
 cMrIpUaTRORD721t4qBM7G0m6YAfsXpoC2XFRIQCCoTIryOZbbR1n2xwIGFoojbHwUQW6TCnp+
 vN1Pl7HcH/3zur1/aaV/2mzkpnUzJQ7VxllYT/GuLlM9oRj32/SEfWyLE+wNEALAwEAAA==
X-Change-ID: 20261117-glymur_ufs_ice-f469fdfcf38c
To: Abel Vesa <abelvesa@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794993016; l=1435;
 i=wenjia.zhang@oss.qualcomm.com; s=20250717; h=from:subject:message-id;
 bh=HD5BWujXmzSaC5arEux6XMyih3/IQEomEjheza/5lOI=;
 b=Bybijm/RVYoSy41N9ZP1x8T9/D/ZxiZ44CI5ahXO3ZFbgDELjR5XpIZxoAgPCicSTpe7XnE5F
 Whzg90+soPnCP6TQCIcrswbHD30Q/AcqO5dFG2EVAZPI8ASAIDb3vrM
X-Developer-Key: i=wenjia.zhang@oss.qualcomm.com; a=ed25519;
 pk=Of53/+6KgVgPh1R/xUMTbXVCnBiHTmHby8ySh2ShLtw=
X-Proofpoint-ORIG-GUID: ixksuLkaMFlZZqHs6DXvng0aQ-UOpACX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzNiBTYWx0ZWRfX7yS+wMflzb1k
 J20+/Ej26CzxbWH1Bb38R60kraFT0V8LB7iu4QK3ng5m/IiJjpyoUe1rw5ncbXXCd72TNyB8v/+
 1WLNiSoA89dcHr1sqB9ja4mPHZ6g9+A=
X-Proofpoint-GUID: ixksuLkaMFlZZqHs6DXvng0aQ-UOpACX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzNiBTYWx0ZWRfXwNe0U05JdThw
 d6/Zjmr47UG7IEVfms9UKafce0ksbD0+f5yxSi1fZNEIPpbNCxjVuiz4rLX7vhyJyEILrJdrIrq
 ijwBrFfDwg80yrq8xOea5iAEJAF+NHK0ymbKtU6jImOOYaIAJb3S9+Jb17eNXZoITD7k1OkCW3f
 Xi1n2oZeu/m0WHUVbsy2DPh/iNlG8s99rlpVSvVEBcp2jxluQSKQVIf+VH2bktJ2yFamCG+0UeP
 u0O7crbgVfl4d4Hwvptzmc5pyCZ4OsUvCmkKGzueQaDrJwTf1bVBUr7KhngHlDDqc2ygfa7s7KE
 hKjPm87YNQ00LwtRHed/fRVWZNaNueh9hAKj3G0AYH9AmwGzWcrxE2cv4nglt57amLAquLRmBGB
 ieIEA7gdKJQ+iGuWC61Nso1mNx9uuq3KQ29wKjAJB+mVoxxw6TbVVblBMDOcL8Tbx2Pxb/WEHy4
 jPVNp7igr92fieJg5oA==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd6b7e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=r359bwwMCglhQnJRRFIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180036

This series enables the Inline Crypto Engine (ICE) for UFS storage
on the Qualcomm Glymur platform, including the Glymur QCB board.

The hardware reports ICE v4.0.3 with Hardware Key Manager (HWKM) v2.

Patch 1 documents the Glymur ICE compatible string.
Patch 2 adds the ICE node with its registers, clocks and power domain,
and connects the UFS host controller to ICE through the qcom,ice phandle.

Validation:
- Observed ICE v4.0.3 and HWKM v2 during probe.
- Standard-key and wrapped-key tests passed
- checkpatch --strict --no-signoff: no errors, warnings or checks.
- Targeted ICE DT binding validation passed.
- Glymur QCB DTB compilation passed.

---
Changes in v2:
- Rebased on next-20261117 (7cfbf79c66c6).
- Removed the prerequisite metadata and dependency sections.
- Link to v1: https://lore.kernel.org/r/20261118-glymur_ufs_ice-v1-0-2ffe4bb931a6@oss.qualcomm.com

---
Wenjia Zhang (2):
      dt-bindings: crypto: qcom,inline-crypto-engine: Add Glymur support
      arm64: dts: qcom: glymur: Add ICE node for UFS inline encryption

 .../bindings/crypto/qcom,inline-crypto-engine.yaml          |  1 +
 arch/arm64/boot/dts/qcom/glymur.dtsi                        | 13 +++++++++++++
 2 files changed, 14 insertions(+)
---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261117-glymur_ufs_ice-f469fdfcf38c

Best regards,
-- 
Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>

