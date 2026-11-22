Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372913;
	b=k8lkzX86jMhJ5QiTqN5ppfyPzZBynB05vKKL5HG8F3J+cfhCG3DFJlsihgq29I71GNAD
	 q/P6G3SMKtgzfKKm3FYvIyPLIhnYoDzr4PklKv31m9LX+cAtTJ/x2yx/8nw2ZsuiZj1RI
	 nPJTZvWtUSKkaa5SN+GwRlA00/jUkhpt8nxOABh7Go45qw2bCwo+zuQQnJ/Epfi8bm+oj
	 mpjV8nqeRb53SIopNQXFBpDApPy4+tJ2CR1Nz7dDSsxB9N6zEetojECo942dnhBqJneiA
	 ZfEhz1dZShSeOWLzsc/vAqM1sVEe/ZHIvJRNmTIxn+L+95NgkJxdZFW+0HjrgIlQXig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372913;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=T9X43wogcCZrborCLOdxz5+TSbJPkp8kWMBPO+V+DSA=;
	b=216Pd/JWIbvqMsZebAAYwy3cgYtLa7DroYELW8cUST1xVTiJ5lFVVxUVeBPW+IKK+qsl
	 5TlJvWnnT1/vve/I7V+FoB+07eEah3oymfSE23/sL/GwfV2M5+Y2fXJC/HCU1C0NdzPce
	 yNKjFAAn8Ni7EzibuIeEWpkwI+H8CJuY1wkbNO1j3Dc0LPiPVbyVanouAM7xcGYHxiK/g
	 gqGVFOlYM/kvNKZJk1AZkexqncYJa4ImMRKlgO3ILESeMBdVaZAoZ401G7CBnRGdoMklA
	 ANWioRcIAJgw85vfRWtRtaj9EB4Ml9C43z/wqnZTBSNOlx2RV/MwGbQ+QnPtw7tj5Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l+R7qxBK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZykL6xZT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85413606A330
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 18:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85413606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l+R7qxBK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZykL6xZT
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGUlTT4154283
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 18:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=T9X43wogcCZrborCLOdxz5
	+TSbJPkp8kWMBPO+V+DSA=; b=l+R7qxBKxp+s9Mm2vOvtypmP69oqt/ZRqlxDHX
	zQiv785wbkEpNE96pZwcPNuZPpESk+Y+GhfNCNG7z/XltLEPPUthZ1EuWQ1qBBoL
	SqVeU8quPZ1gFDb9f6USww8g8znyBpJ9nEOOlTS1xLF8I9lMpuxi8eC/3HfaNzk0
	mUBIYNHIE97cePcGc2mp+fP5XxpTudyXyD6HCMzDgjCT68POEI2B5koVHuvwgLBm
	6tHK/fHJENXR2rTdo2ludCXqx5XkSmMDRLlWn6WJzcZYu97goycgEyo/PDZYW4j3
	3YngBPmA7NVaYnIskuK0WakGDjG4ON9DDeM2mEzdoRUsmZEw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j328rv6nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 18:41:51 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-384c78aa0dbso3772692eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 10:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795372911; x=1795977711; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T9X43wogcCZrborCLOdxz5+TSbJPkp8kWMBPO+V+DSA=;
        b=ZykL6xZTnhYQKYqCuQgxXwIdtroA69AYp36q1ap3XzTcg5MEndSYwfSjsToLBiyovf
         civnmjacLA8/rPct0DhFxYJHMu7UVhRx9t6yNbKUEjWlXEMV9YtFV78ChfTHVnFYdYWq
         ca4OHJHB2T3kBgoZJXYXodmEiOOgufW6hQ9hg/2BVfJkMg+uegE9UPlMCtd9gKnh274s
         UWUF+MXHy8osVDjRXv1tUO3Jev0OvhmRtDppl1h03TyEj940AijIOHfrK+sJH5fhuVlc
         2gi5e/zB3YTTrdQmM0QZ62UOrLS95Lv9PAy39r2vcfzYHjPijmHX54ZGmEYktMRKU7GI
         u7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795372911; x=1795977711;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T9X43wogcCZrborCLOdxz5+TSbJPkp8kWMBPO+V+DSA=;
        b=pr6CuIydwcvjdRgbo2AmJSCKVs0suR74+zN8UsgfS46VQ+S4Nwk3Tgs0BWyNbym7Gn
         FPMefdJL6n9SR6YHzg7E5XqnyldDshayMFx54fAQ0myQumCGSPB6VBAlogG1oWirlJDD
         RTdDVb1IgYPn0YSdrSf7UYJRhYI6wkhZzCzpLLl13Gp6ltnKcPKtROTFojKfKcBe1Qsd
         9sGfJMLcct7a3Z7aFKZJl39wm1SP6dHczgdpb4RAFn9lZV+q+2Kz1sKAoIfVKfq7I0RK
         lqQJ/fx0W/sA6geqB/lLqlVPaAmQ7xz8p+2+WfQVq081RHATLKDi8XgVoDTXvx6+u5Mw
         M6iQ==
X-Forwarded-Encrypted: i=1; AL+hErEuLx+bmpWdzNpf6purtpTCS6BUhobmD7ijkxx+qX9fHKbyHhOmRVRWtc4FxbyIrB0AzYlFYj4jjkdF5Kd4@vger.kernel.org
X-Gm-Message-State: APuU4Z9BVE0AYqjXn9Y3cH9r9d0uzQQI0w+geDpJW/7UWIu4UHgIGVLC
	+8mWnzGj1ZAJwm/newft17RPVdCmbERCBa+OWCuIhhIVgKtxoGyXFw/qujDg8wj38y6WRf/8L4/
	oN1tKzO6VDGCEYWU6SM7h2vq1XGxPTQVTO4WjVla/GzG77PZ5BMWEP48oKFMCge3BC87X
X-Gm-Gg: AZFdTZc8xaKyXU8IFtPrtESA8YFgG8J8y3f/QVCIi7ucBbkvkhYk0LObX46PFQees+9
	DaLGpZcXx1wW64uqUdiQHv1O3m/epFuUEXap2LhFQyABorHJqXsOoP4LKRyoU+EisexAqjkAI9m
	06UvTND2k0pkHCVuD7tUV2gQlifwjRU+dHx4P93sh32Ss8kq4m4aoPy4SHfND537mjv4L64sGy5
	RVgSoZpmfCX/nVA5hEQkrIUGm9fBmt4u8wEQp44axVrwzx6frD00Iwt7OM+bNXd1b1VfLAF9FIe
	aOX/jd+JXIAngCiR01iq3XwcApvfIr61u0YbRq3EANTeMF9x7TGKrYifc6smsa7o8wtZJLzypJB
	RoreeWnm3qJqm7Sgp5QclVgKB60vGWJXu6BtxqUO3JBsl/wHyIiLHzKeXYbOSP/pKwqJo5fmYnJ
	TMoq9e86mkkA==
X-Received: by 2002:a05:693c:860a:20b0:384:fe97:8cd9 with SMTP id 5a478bee46e88-3857102771amr11390353eec.34.1795372910585;
        Sun, 22 Nov 2026 10:41:50 -0800 (PST)
X-Received: by 2002:a05:693c:860a:20b0:384:fe97:8cd9 with SMTP id 5a478bee46e88-3857102771amr11390335eec.34.1795372909988;
        Sun, 22 Nov 2026 10:41:49 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm48497465eec.3.2026.11.22.10.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:41:49 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v7 0/9] ASoC: qcom: Add shikra and Hawi LPASS macro support
Date: Mon, 23 Nov 2026 00:11:30 +0530
Message-Id: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAFo3A2sC/62OQQ6CMBBFr0K6tqQttQRX3sMYUtoiVaHYgUZDu
 LsFFm50ZzKZ5Cd/3psJgfHWADokE/ImWLCuiyHfJUg1srsYbHXMiBEmKCUCS61LaOzNyxLGvnd
 +wJpXUmZFzTlnKB723tT2uUJP5y3DWF2NGhbS0mgsDM6/VmugS28TEMq/CMqwx3EIrquiJkLkR
 tDs6ADSxyjvyrVtGhdaVEF8YD++DSKSmNIyI4xluVI/SPlfSPM8vwHDtPDDZAEAAA==
X-Change-ID: 20261106-add_shikra_support-d4baa39f4442
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795372903; l=7177;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=QI57tLKn7EFzkzl+SiGOVy8q6mgkV5HvJqezoU8D5T8=;
 b=WcRLw2lgJPE+ZVUistBWCnJuqO7rCTh69mF8IrO7GNGBCEx7/ZoGgnq1NIyuMYkbB8CBk7ZhO
 G4yi1cy/NClD/qn0JhvgmQeA43R5O2gvOZJYs3/C+UQ5geNySq8IrOP
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfX0mLS/htU5TVh
 gdJVfGIAqfW+eCmZidWDHIkbCEl29qeaZYkdsFJTUnFM+Tn/QBNV9pIAM/PvYtXZHLJM7PH0ZrL
 E+GyzajNbrlZmo6EEW3lWVZ3VUQ7dnk=
X-Proofpoint-GUID: 0IcKxMaKXjUUBwMDQiZ2n_I1aZD5a7Ov
X-Proofpoint-ORIG-GUID: 0IcKxMaKXjUUBwMDQiZ2n_I1aZD5a7Ov
X-Authority-Analysis: v=2.4 cv=c9w+0h9l c=1 sm=1 tr=0 ts=6b03376f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=iox4zFpeAAAA:8 a=vVXzO8Y9Qna1OQ1r6xcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=FO4_E8m0qiDe52t0p3_H:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfX/jwbMhe9g4Vb
 sh9goKsQzD4UBh2OChzqTPCyWr459qtJ5SXvxz/l9ocIluqGHfSbxbU0Z4DyLCDjSYwH9Gh15NO
 +XSO2DhIzfXK9pOuoV/f9A7u3Rnk6TKU2psS0NF/hFqBdd9Gv8co6F0weI9AwHpjAjYV7/P5iuw
 puaxG0X6qKQxODHB65NrGgYUkXOVm1DmpH3F1ovXSMiy9pFHku53gFnlIrjVrFpcVQb4YWYHeev
 G4Nj9b27jhtdmoFeOIGrgZHhyW9KirAcJx6XOKKmBhsXPqdj+WS4aum38/lXLE7vbvODTxD36s9
 wrjx/HT/U+bWiAqMumLyv05hijmtpUbUz+Mw4Mjdue2jx/JdGrlyXdl/n3Pr7nF8C56xjWseEaY
 YnGW7WJimvbXZ8IkUdEPcj8/BK54ExtMnuVOfjEhvplqfnsi6r2T3HtbZlZmFr/7ZdNcddKsfRg
 BJfg/CCfS5LopXcrZwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220074

This series adds audio support for two Qualcomm SoC platforms — Shikra
and Hawi — by extending the LPASS codec macro drivers for version 4.0,
and by adding SoundWire microphone capture support to the VA macro.

Shikra (LPASS codec v4.0)
--------------------------
The first part of the series targets the Shikra platform, which
integrates LPASS codec version 4.0. This is not backwards-compatible
with previously described compatibles, so new DT bindings and
standalone compatibles are introduced for the RX and VA macros.

Driver changes include version detection enhancements (including a fix
for the missing v2.9 version string in the common helper), FS counter
bypass programming required before the codec is enabled, and a v4.0
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
which is based on the Bolero LPASS codec v4.0.

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
Changes in v7:
- Fixed the register mask to use the correct value, as reported by Mark.
- Dropped v4.1, as Hawi and Shikra both use v4.0 with the required
  board-specific configurations.
- Handle FS control and ADPT control through board-specific data while
  sharing the same v4.0 version.
- Link to v6: https://patch.msgid.link/20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com

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
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-sound@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

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
      ASoC: qcom: lpass-tx-macro: Add support for Hawi
      ASoC: qcom: lpass: Add support for Hawi

 .../bindings/sound/qcom,lpass-rx-macro.yaml        |  39 ++
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |  23 +
 .../bindings/sound/qcom,lpass-va-macro.yaml        |  40 ++
 sound/soc/codecs/lpass-macro-common.h              |   8 +
 sound/soc/codecs/lpass-rx-macro.c                  |  17 +
 sound/soc/codecs/lpass-tx-macro.c                  | 576 ++++++++++++++++++++-
 sound/soc/codecs/lpass-va-macro.c                  | 431 ++++++++++++++-
 7 files changed, 1109 insertions(+), 25 deletions(-)
---
base-commit: 7884221ca9857a317bf4bd81ac3bf5528f266feb
change-id: 20261106-add_shikra_support-d4baa39f4442

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

