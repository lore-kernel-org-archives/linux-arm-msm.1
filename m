Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968409;
	b=NQKJ4NQfIgxSIF3OI9Yd/3GHPDeloTzlD5bCzy1RPuK/9n7T4FuMSy75xUON9zW32Bec
	 i4zSoC3x0qvne6a1V8JMfZAxpSO3HyaHReBruNkmq5u/Y32f/E3bGuwqYH9Xz7c199Zx9
	 +ZaeDgw8HPJJ6H6yVmIWKcbKG9yFsOS6WDQ+jBtVSiY8ZndZ+ATZx5NhYWZolmtVhFdJY
	 WO3qfv4rMEYtacEGsiAayHkY5C8UYeBf+1PDWBwGshiX9uGYqR50SaftTsig7dbvFNlbW
	 8Tj3W6fPrkeoIK/Mx3olfudbnoCJ4jqrAhZShxhICLr2i3uNQeFVqMx+AbIwz3hlUmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968409;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=edn025/LYw3ytj6a1I7v8ax20+2ljCy/+E2aTr8xOMc=;
	b=GdPzxBI2W2YWVp2DGmnuXkgFcrhdYStQLfD937jqaYcn4LXpWPBpmco/olQDuGVCJLLD
	 Vw+xMCYm3oGR9/PPbB4I/d5zIhhdBVyZNebN5bYf4a5c7Rz/0ubSH7wGrdCUyCQZqVUpH
	 XyA9wh/yzgsE7LPw2vsVN3TjJL8H++uIGxjHaAZDhFoPQAWPViKHHhh52nV4qhAz9aRMe
	 G7WRnU9boqd/JB1cryebu8kjJNc4u+Is9z8ejsJIrxgtu3bulWQe10OjE1y2+WG3RMt2A
	 aqvEOJUea4Q6xvSQMwDba1ywozLjfGDdQVkbCgXd4tHsrAjO5F6JMUN2U6ecNGumcCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CbIAElqn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="WRNiTy/1";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1CB606A32F
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 12:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F1CB606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CbIAElqn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WRNiTy/1
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APToT3646691
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 12:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=edn025/LYw3ytj6a1I7v8a
	x20+2ljCy/+E2aTr8xOMc=; b=CbIAElqncyqFs3WS7NRUBHOIJwj8BqpMRDqrJs
	T2OLqd8z46F7cBdU8lHeGB4BlVG9J2almTrvDFiJ5I6bx8glChaERyyU1DxQqivk
	2r/RbmgnU7dyi40zKzuety7jLffyyHoeKQ+nPMBz+6KHXHnsPSaEe90cCam814Y/
	HdRFNcZ2G6Qn01NhWdw82bSkQEpRNpiKWGiXdLwbFgnUEYhRmq5VwIP4iLl6DDR3
	EYLlzvXo7JKBqvMpCR8LAoZYr2DVei9ZrrHHhbTekIClJ1ix0UZGzi9G2alCSIdv
	VkTdZsB7mLcHlCoa7yRq3sRk/baoaj5lzq6Qs8bKgmJ7LEqg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa2r65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 12:33:27 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1186437eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 04:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793968407; x=1794573207; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=edn025/LYw3ytj6a1I7v8ax20+2ljCy/+E2aTr8xOMc=;
        b=WRNiTy/1nJr4pbbyUJk/P6kZ9Yam8op3DROoEtvKUxtRPw2ilLG0oj0kj9j7gM3OY7
         mXoVv437EUets+NzWNt6JJ3am+7hQFQddNKnFCVmfvbfmMo7f2RVykRghFRiyMXj27zn
         LGZc7Rm1cSXCr1tu332Dsmuhyz7U5kvhIdT5JI6afDxWIIClgSw8lsPg6Sr7pOlVsClQ
         gxJMWoURZXbjBlyMBKxAwxZsWQVWDMk1BjUWajYicqXLTPDUiZJ909tZ+7dLpqAYLxDi
         DOKR8SI8W3iuE17bLhai1a3EIzORQvuO6S1KVWo1b/HjJ06n2oCJo3TI2Xg7EnqkGGAU
         /ogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968407; x=1794573207;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=edn025/LYw3ytj6a1I7v8ax20+2ljCy/+E2aTr8xOMc=;
        b=e0PH7D+8VrNvTdSLHpuWBJD5MT6+8zh3OQPPH+sHNrIIylN8qNT4e7BQUPug+Juv0S
         hiDv5jymbkuGXihgvwXWpRgBH2n8oLDxP4EE6T3ByY1CPCb4vR8aViSpDSwqXcKfwEY9
         9AgL+d/dG6Tb5oB9sDckLK1BdhdlXuOdpAIy9A6aew87rmAy4+NpoVLly60cUcm+ym6C
         ay8d/cCPN2rwrh6Htkt0Ffr10x/GTofDeBuoB7UWeLFSvqxiWhZtscWBIIcsgLk7Xg6C
         rMy56eP/rcDXjZ88YxJZFjKVgSp6x+UwIZSJgKmxt0ua4tWHf+wudwF6JclPP3lAcmsx
         Z1MQ==
X-Forwarded-Encrypted: i=1; AL+hErHbtZ2KxMD1vVFzcxvn8sMMzbHM1k12PMis9XHT3I/tKOqJpa0O14HA8u5YZvkYCf+C7VytrkcrkenFPjfO@vger.kernel.org
X-Gm-Message-State: APuU4Z9Iv9onbCaRDlAlu6j4MWdl5JGWwybPa+hhWk7iT7jna7ZfRw4m
	C96dahgPy8RAyeDYgXorykEV01pL2FnCj1O0pYY50vOM0jvDMTt0eqpD47kc/H2Qg+d/ryf0v8p
	gCW2M64oVFfd1URjFOmjg9Rarq0xMoU/9mdk0tM6NRefZ765wRfs3Ex8UBoTek+RVmf+N
X-Gm-Gg: AYBFou0AXyMMJuRyKTLbgvVW6YTo9O0XOY2dfK/VbD2+GCl5gVUQQANZVYWTUkAcO/B
	VSCTBMcBMC2oBSsjreT5M3DKS0xV9yoqhb2xJ6OXvwt0vwNGVTOjX8AefefXMAK9Ufp4Mgc6X5p
	oDT9vB94Vx7PQ3rt4rRL+VAGLOKOMfUiuj3ZUYapbCQObWduXU5n2jvYsxP7fiJhhvSkTcstBdz
	7Ln9197qCkXImUG5O2GSVi1+ZE3+E02ALXeg7A2lhSjTuMLBi+lr92+fwBB9+prlWKkE9RRhftc
	gcyrH6Yz2+rLyI3lhRT+3sr2vf0uBPitDB7SR4sAeqyXQAcYBUNyk1042r+/rLEMcPU3vpUTcav
	JFD2uh4wC9RDJwYFKhPA/BXYO9SSUL5fxeiKFrOwrH3g2a41Cc5uCXpxWkoO3H4WuRFtnxr27OW
	sMXeHdzFif
X-Received: by 2002:a05:7301:182b:b0:36a:5126:a8aa with SMTP id 5a478bee46e88-36f7641e9aemr3044092eec.27.1793968401769;
        Fri, 06 Nov 2026 04:33:21 -0800 (PST)
X-Received: by 2002:a05:7301:182b:b0:36a:5126:a8aa with SMTP id 5a478bee46e88-36f7641e9aemr3044051eec.27.1793968401066;
        Fri, 06 Nov 2026 04:33:21 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm6514804eec.23.2026.11.06.04.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:33:20 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v6 0/9] ASoC: qcom: Add shikra and Hawi LPASS macro support
Date: Fri, 06 Nov 2026 18:02:59 +0530
Message-Id: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAPvI7WoC/22NwQ6CMBBEf4Xs2ZIWag2e/A9DSKGtVIViFxoN4
 d8t9Woy2WQ2M/NWQO2tRjhnK3gdLFo3RiMOGXS9HG+aWBU9FLQQjFFBpFIN9vbhZYPLNDk/E8V
 bKcvKcM4LiMXJa2PfafQKQUD9++HS3nU372t7qrc4O/9J5MBSNkEo438gTTiSKEpMWxkqxEkLV
 l4cYv5a5LNzw5DHA/W2bV9ub2uI1AAAAA==
X-Change-ID: 20261106-add_shikra_support-d4baa39f4442
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793968394; l=6697;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=q0m6LhhAS8YVHU1g2EoCoxmxufiKL9BK2EWh1X8mns0=;
 b=6a6GFvDGOPT6r6VrgJt+8gVunH9bTjdJtq37rXohyNgxTY5CITFaXPk9Ixb9UhsvefdY30500
 txfrSTSAW0iCF3e4z8oai8RA1FqVq+8F3fLPcCKR7rSR4L/K3bWiKNu
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aedc917 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8
 a=iox4zFpeAAAA:8 a=sKXgnk-ZSZCjcCUwTa4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=FO4_E8m0qiDe52t0p3_H:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX991Wu+glk+Ht
 WyU6FB/PsGDtx2cABfiuzrP2EJpLFOx5HjQpT7qSSKmL3sf28YAAjn70TJl05Ah5o/3m1pHgmA7
 tMB8KbjoHsxE+65eofE6lzVKkRtkOsA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX9tiPWDrw0DoU
 NmAKKyYvPSyCgqI1l9Fci6autMWYTU7njcYf3VD5wBTtUz2WrSX+TZ6tlnYQIWpJje+7X7wgkAT
 tK+HHOI9T1enksuL2GlPzYfkQECaZ1ZwMoKdjYTRBHLpaWHK7gQs1iPPBonnCtqykPHCDccyyp2
 eELeP4z7Cu0OgW8TPl4JMK3Mh53hOChduqn3mvITgQhkxoXMuQEM0uDHkStj1Zr9s+mjy6QG0b8
 mMStRfOecPC/8vfBttiTA1kn9DwXI+oCMRk//ysWOh1AP6NPz65bVfoFbsGaEx/y8m/7gQOjrVK
 PRohVHz9QpGRD1mvUqNGbuQvcfRGuYbQaOk8KJ6PaF6ocZNN+FPDbR9MV2AwQkqdiDsq+T50jna
 V+pK6GwxSPqT+/Y+LP3jjmHEwOBmQwnyzA3/ubyIEwXYNhsPA73eqR8tGUUTwwMTmkXcG5OKbx4
 Y7Sl60Fh8rYAGAhHpiw==
X-Proofpoint-GUID: GuTEE8d0cuOLBj4xaZuZx0me3eF6MXr-
X-Proofpoint-ORIG-GUID: GuTEE8d0cuOLBj4xaZuZx0me3eF6MXr-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060049

This series adds audio support for two Qualcomm SoC platforms — Shikra
and Hawi — by extending the LPASS codec macro drivers for version 4.1
and 4.0 respectively, and by adding SoundWire microphone capture support
to the VA macro.

Shikra (LPASS codec v4.1)
--------------------------
The first part of the series targets the Shikra platform, which
integrates LPASS codec version 4.1. This is not backwards-compatible
with previously described compatibles, so new DT bindings and
standalone compatibles are introduced for the RX and VA macros.

Driver changes include version detection enhancements (including a fix
for the missing v2.9 version string in the common helper), FS counter
bypass programming required before the codec is enabled, and a v4.1
specific regmap configuration covering the additional adaptive filter
(ADPT) blocks at 0x0800..0x09a4.

SoundWire microphone support (VA macro)
----------------------------------------
The VA decimators previously only supported DMIC inputs. A new patch
extends them to accept SoundWire microphone (SMIC) sources as well,
updating the ADC_DMIC_SEL mux programming to be resolved at decimator
enable time rather than at mixer write time, ensuring correct operation
regardless of the order in which userspace restores controls. DMIC-
specific HPF programming is skipped when an SMIC source is active.

Hawi (LPASS codec v4.0)
------------------------
The final three patches, add support for the Hawi (and Maili) platform
which integrates LPASS codec v4.0.

While v4.0 shares the same RX and VA macro register layout as the
existing v2.5+ path and reuses those helpers, the TX macro is based on
Bolero v4.0 — an extension of the v9.x TX macro that adds a port-select
stage in the SWR microphone input path and an adaptive filter (ADPT)
block. The ADPT block must be disabled before a decimator is enabled;
this is gated on a new has_adpt flag in match data since the register
does not exist on earlier versions.

New DT bindings document the RX, TX and VA macro compatibles for Hawi,
noting the clock differences: the RX macro uses the 'lpr' clock rather
than 'macro', and the VA macro takes an additional 'heartbeatpulse'
clock sourced from the LPASS VA CSR rate generator.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
Changes in v6:
- Clarify the LPR vote naming and document why Hawi uses a standalone
  compatible instead of the SM8550 fallback.
- Reorder the Maili/Hawi fallback before the SM8550 fallback.
- Link to v5: https://lore.kernel.org/all/20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com/

Changes in v5:
- dt-bindings: rx-macro: drop the redundant clocks "minItems" from the
  shikra conditional, it is already set at the top level suggested by
  Krzysztof.
- va-macro: shikra: do not hardcode the codec version in match data, read it
  back from the hardware and cross check it against the registerlayout
  selected by the compatible, reported by Ajay, Sashiko.
- va-macro: SoundWire mic: do not let a write to the DMIC/SMIC mux that is not
  part of the active path reprogram the shared ADC_DMIC_SEL bit of a running
  capture, reported by Sashiko.
- va-macro: SoundWire mic: clarify that only the HPF zero gate assertion is
  specific to the DMIC path, in both the commit message and the code as
  suggested by Ajay.
- Add device tree bindings for Maili.
- Prevent duplicate registration of TX DECn MUX controls as suggested by
  Mark.
- Add v4.0-specific regmap_config and default register table.
- Link to v4: https://lore.kernel.org/all/20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com/ 

Changes in v4:
- Added three new patches for Hawi / LPASS codec v4.0 support (DT bindings,
  TX macro Bolero v4.0, RX/VA macro v4.0)
- Fixed all issues reported by Sashiko in v3.
- Link to v3: https://lore.kernel.org/all/20260917-add_shikra_support-v3-0-fc0e79c341aa@oss.qualcomm.com/

Changes in v3:
- Added Shikra-specific clock constraints for RX and VA Macro DT bindings.
- Restricted clock and clock-names properties to align with Shikra hardware requirements.
- Removed dead code from patch 3 of v2, as suggested by Krzysztof.
- Replaced open-coded checks with a flag-based conditional for LPASS
  codec v4.1 specific configurations.
- Reused existing SoundWire microphone widgets, as suggested by Srinivas.
- Switched the regmap cache type to REGCACHE_MAPLE.
- Link to v2: https://patch.msgid.link/20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com

Changes in v2:
- Updated FS CONTROL and ADPT only for version 4.1, as suggested by Krzysztof.
- Addressed Konrad's review comments from v1 by replacing magic numbers and
  lower hex reg values where appropriate.
- Link to v1: https://patch.msgid.link/20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com

To: Srinivas Kandagatla <srini@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Mohammad Rafi Shaik (5):
      ASoC: dt-bindings: qcom: Add Shikra RX and VA macro codecs
      ASoC: qcom: lpass-macro-common: Add missing v2.9 version string
      ASoC: qcom: lpass-rx-macro: Add shikra compatible
      ASoC: qcom: lpass-va-macro: Add shikra compatible
      ASoC: qcom: lpass-va-macro: Add SoundWire microphone support

Prasad Kumpatla (4):
      ASoC: dt-bindings: qcom: Add Hawi LPASS macro codecs
      ASoC: dt-bindings: qcom: Add Maili LPASS macro codecs
      ASoC: qcom: lpass-tx-macro: Add support for Bolero v4.0
      ASoC: qcom: lpass: Add support for LPASS codec v4.0

 .../bindings/sound/qcom,lpass-rx-macro.yaml        |  39 ++
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |  23 +
 .../bindings/sound/qcom,lpass-va-macro.yaml        |  40 ++
 sound/soc/codecs/lpass-macro-common.h              |   9 +
 sound/soc/codecs/lpass-rx-macro.c                  |  19 +
 sound/soc/codecs/lpass-tx-macro.c                  | 576 ++++++++++++++++++++-
 sound/soc/codecs/lpass-va-macro.c                  | 434 +++++++++++++++-
 7 files changed, 1114 insertions(+), 26 deletions(-)
---
base-commit: b53be9121a651e0b0c524a24b7238f56f0f6f28d
change-id: 20261106-add_shikra_support-d4baa39f4442

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

