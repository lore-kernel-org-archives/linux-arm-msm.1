Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B9B44AB62
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645276; cv=none; b=ByQT6h9fPskk+PGp5OMq0rMAaFOgCNlTB+c2L2jL3ydCyEelAQYHId3ud5Pb2RhdN5ClGWwGm8ptbBk4bcOEH1EyIXuwm+vpdlb+I6bJxzSmrQifv6jCoY6xVbp19IhS3yGkntg4qDOW1FEJSDH82ukFbf2Xv6Nm+3nrl5w425w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645276; c=relaxed/simple;
	bh=X94IXHplgaWDpwnKRfo/yBezpYjKyFyoBsVavimemek=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LHKmL1iK6qYca96GbWsKmIxahWEVVldDglNY491SLMZANAm7DrgJ/CPPmpPEL2+g+qJQZwECbNySeuD0084xzGs9Rm3la+C2K/FDREEPvjMp3FGVy8l9qQJ6eDah8ANdLHVwxkh4NI3hMk7wV71Ikqk0QC0XGyQ1LlRGfT0zd30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LZaQrk0R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=is7LIZ3T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LZaQrk0R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="is7LIZ3T"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zc5j2410467
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lK4Nws3QJXDFQ9Jm1Y7KZq
	vQh+UgSSV/pCMJhv6VQvs=; b=LZaQrk0RLUZUN+k9BG18VH0XduHq/+1dibaHD/
	/d5tJ6Rla8MLIbfOblzcZ4Nt7E0ETCdX5/m1hzyZns9vIwgWp2PoeXeIPcnUPk1X
	FVNSqzuxI00BhQEAQTC0/kx934KUgxB8cjyUlR3mWwODSfq4zg8y7fC9CkeEBgD/
	WiY/WsyiTkHWHLCaadc3D3krVhUMMYyKhcVt0RI6rWIaGeIAENtoCfbCMVnSIkW8
	JnIx314I5TwILQ2QQwWyDNUbvB9VkTvbKi9SxSMFgJGWZGPQkXUXXdbvIqKm/Iv/
	io2fKZBi2m6iDTbLwNMhXnwT6Ric8aoXyI3Lt3qXXIRaLDuQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdd6gjw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:41:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc2229450b4so687101a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 04:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789645272; x=1790250072; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lK4Nws3QJXDFQ9Jm1Y7KZqvQh+UgSSV/pCMJhv6VQvs=;
        b=is7LIZ3TUMFc8Qwh+fRuvYrTCoDIqgYUoBm5ZdN/DbUEb+9vxOu4M4z49/QQH/HLOb
         6y8IDnhX6L1gC4RoZ3I29Iuc8i3r1IDxMh8nFhT2kOK2Dds3bZ3Pw/aIl1qCJhs46yyH
         kBKi2mH+ZMQwSGsYuN3/QAHeYje5gS7OJyuVAM9aGITff329YpcNjReXQcCCghynMrpA
         eYYzzSbNGbups6KH3S0AJiYtRl9q952KWkpG4y5/r6436sAtJ8r2payECvYxJHPcntLN
         A0axqz/dPUgof/Hav11ZhNFYsGoGYgtiEU3pUZeonel48b4l3ZCYBTffIQLk4h2p+IJl
         C9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645272; x=1790250072;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lK4Nws3QJXDFQ9Jm1Y7KZqvQh+UgSSV/pCMJhv6VQvs=;
        b=VrdmyTcyvs/Ks0/TQGET2eg+HWv9MS8wTKKAJgaC3RdUFhOLadRIYd18fTcNoYoWul
         iMmkahRka/ec7GBxzgy/wIh/oeXCVt5p2vXU5IsKwqF3zBTgxdVrcLqYO0hHLQr2c8pb
         5tSbwuTh4rpnStAyxGhpHdNlW6Z31drCczD+kJHRM9IzjlyiAqdAhyng8tgVxhHhgljo
         b2DVJTZELbGEmfR/3ttplPpTkNYjWu/KvUa0XOpTGB3bf2IEnyISJydo+76Pbd2uf8rE
         X0ttxhaL4tyWNT6WC82tF+6p7CnPEEHOmrC3eVbPRmuL7d3bfCQkXo6cdvcIzvfnd1iu
         yI3w==
X-Gm-Message-State: AFuF++nmwVvowZEr53JmvTBacBiOPS/joNR9naShZturPd/yPyz1PWg4
	W8MLWeQa/fOQiqMSNvYd0lHyCO3bwFwNAKpZaZHmV61hnZ/W8oQoBeqRfKL34XbjJMMD3nKVfrc
	v5umNWimcouHiPS1ja2Mmd81OZt7NHFZHZONuH1QO7RwReADKT6LCWZwI0UDmem0zGMMZ
X-Gm-Gg: AYBFou2H6CoUsWLHRiF0YgpiURawpSh1/QSaR1QW+2bypKUoWXw+3m83ft2sxoZrLu9
	eHslXdK29JfRGr3GyDZjWh2NCbMtRziVxG/rPShhBJK4vcATuJah8CrDdr2ZqoyNXX1HuOIcE8L
	KwcVj/gr31Ae7jhp2FYgUNPdRGfqNNcRaKSX7j7u/YQwCof8P0pMmgH9obD1RnJdsktR+zBkMjU
	ZD+WutDcVA3H/BSiOkMqt1AIIKLNFjU2E3mGtlNFZ2VFAA9TWchXBHIh9E4R6qsMtOesgzj8TvE
	e2lKT+4kQu/lOJB1JG6jhSY3My1vcOpUv4Paztzj5renvda6+isJsefwn+T6SqOnVKNdxUCAgJm
	9slBa/+a3lt769eWhPoc9pAactBNqIA==
X-Received: by 2002:a05:6a21:6b10:b0:3da:3bdb:b22a with SMTP id adf61e73a8af0-3dd5f71a912mr16946181637.20.1789645271815;
        Thu, 17 Sep 2026 04:41:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b10:b0:3da:3bdb:b22a with SMTP id adf61e73a8af0-3dd5f71a912mr16946121637.20.1789645271310;
        Thu, 17 Sep 2026 04:41:11 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50acc1178sm3066557a12.30.2026.09.17.04.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:41:10 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v8 0/5] Add CAMSS and IMX577 sensor support for Shikra EVK
Date: Thu, 17 Sep 2026 17:10:59 +0530
Message-Id: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMvRq2oC/43STW7DIBAF4KtErOuIvxlwVrlH1QUM0KA2cWMct
 1WUuxcnlZKFXXWD9JDm40nMmZXY51jYZnVmfRxzyd2hBvu0YrRzh9fY5FAzk1wiB4lN2eW33jX
 k9qU000T8bChhQnQEiJ7VyY8+pvx1VZ9fbrmPx1PFh9sl867Ehrr9Pg+blTBcpOBkAhuVBuLAk
 1a8bY3wgbihgEKjd2yydrkMXf99LTyKK/Znt1E0vEENQZIlA85sj0NeH0/ufXp+XY8rO8o7hdz
 OU7JS5ESr0CchRbvtSpmh1AMlYJ5SlbLCKm1F0jbwBUr/g9KV8uRBcCuMAr9AwZ0yQs1TUKngQ
 fkoIJBOCxQ+UHKBwkoZ0pha770OM62efrfKclgmnA2eEBMP1iy0Mfc2li8sgZl+zijkKaADRzP
 U5XL5AQ1HJuMOAwAA
X-Change-ID: 20260526-shikra-camss-review-cf6f66ac566b
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789645263; l=5479;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=X94IXHplgaWDpwnKRfo/yBezpYjKyFyoBsVavimemek=;
 b=gETS5vn21OyH33oMEWqrEpoWxl2v1dGy47y4OeYMvQJDW2MQeD6KrgtcQc57XZZBa7gZAi4ML
 rWlUGdDgB5HCC6QwRJWlgTVwNvCOHyrtbzWM986vARfD2RrJOagYeMJ
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: CD4eNEqvKk7R9Zr7BAI9xxi6iX-YSCE1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfXxXUaNp+oPst6
 YSlZhKe1hnqzFLW4Uh/LXREYAuCKxi14M4wwF1u5Q0iErF9jcSLzPsDHkPJcfPQlrN27+a31v/X
 wcxCQXea+bosbvJRvZ6qfYIVxLmymh7UEmnsaFgulJ2gjgmceVcafiQoOE0tzoZ4oMg8jSqjWNV
 VU0exUgkYbxZj8Ui+u/PgzLPvTN6xjzbxnsvfoVowWtuCUYsIH1ahdMJ1dJFFoxAdoxAcTtgICR
 +12SfG44MuTTPIPssvw9N+3p3BAuY+pooDjQKj0g3u9m0roZnLmYCW02fo3yNM2LALQ7voA89OF
 mdi2/tCuCRxKbv2TR/YVAfbuYhwxyKFTQ2Uh7NwiwO71g9YNq273DUDYyCJ5UGSDIDxmnbHWNVk
 5WOnS7ryIAWY7BBb6l3JMbHkNFs/K1vjaBJM3e84bBCm5T6+e6hIYMhc9nq7l1KV5F3gCOsSpJx
 3ChQ8CjA8MEjGAOhkig==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfX5AQgQ/2NubnF
 FijVtMBLuwp+NFF5DXkqX+qyaHBIlACmOT7gjFHVaHuCO0+3kbaHXd+obIQcwVWxhcbMJ1NxI6a
 XTL/Fu/+7f8Nd3UcbYJkuL5Y/m4UGk4=
X-Authority-Analysis: v=2.4 cv=GeOCDgXL c=1 sm=1 tr=0 ts=6aabd1d8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=E40xv7DK0V-5u9Ck0vwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: CD4eNEqvKk7R9Zr7BAI9xxi6iX-YSCE1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170162

Shikra EVK is based on the Qualcomm Shikra SoC.
It lacks a camera sensor in its default configuration.
This series adds CAMSS driver support, CCI definitions and enables
the 22-pin IMX577 sensor via CSIPHY1 through device tree overlays.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl --reset
- media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,qcm2290-camss.yaml dt_binding_check W=1
- make CHECK_DTBS=y W=1 qcom/qrb2210-rb1-vision-mezzanine.dtb
- make CHECK_DTBS=1 W=1 qcom/shikra-cqm-cqs-evk-imx577-camera.dtb
- make CHECK_DTBS=1 W=1 qcom/shikra-iqs-evk-imx577-camera.dtb
- make CHECK_DTBS=y W=1 dtbs

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Changes in v8:
- No code changes; Updated patch subjects to end with "for Shikra" (Bjorn)
- Rebase on top of linux-next (20260916)
- Link to v7: https://lore.kernel.org/r/20260806-shikra-camss-review-v7-0-c7360fd6a5ac@oss.qualcomm.com

Changes in v7:
- No changes in patches
- Rebase on top of linux-next (20260805), fixing the conflicts.
- Link to v6: https://lore.kernel.org/r/20260805-shikra-camss-review-v6-0-a8dbc66f0d87@oss.qualcomm.com

Changes since last v6 RESEND:
- No changes in patches
- Drop dt-bindings: media: qcom: Add Shikra CAMSS compatible; already
  picked by Bryan into media tree (now in linux-next as 32179a552b8e)
- Rebase on top of linux-next (20260804)
- Link to v6: https://lore.kernel.org/r/20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com

Changes in v6:
- Rebase on top of linux-next (20260721)
- Sort CAMSS by unit-address numerically - sashiko
- Collected Reviewed-by tag (Loic)
- Link to v5: https://lore.kernel.org/r/20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com

Changes in v5:
- Rebase on top of linux-next (20260710)
- Drop dependency on shikra-dt series; now in linux-next
- Drop dependency on shikra-gcc-rpmcc-clks series; now in linux-next
- TLMM pin entries roughly sorted by the pin index (Konrad)
- Link to v4: https://lore.kernel.org/r/20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com

Changes in v4:
- Fix data-lanes numbering to start from 1 in all endpoints (Vladimir)
  Missed in last rev.
- Link to v3: https://lore.kernel.org/r/20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com

Changes in v3:
- Drop dt-bindings: i2c: qcom-cci: Document Shikra compatible; already
  picked by Andi Shyti into her i2c tree (now in linux-next as e3a8f8329397)
- Preserve blank line after compatible const in qcom,qcm2290-camss.yaml (Krzysztof)
- Add blank line between iommus and power-domains in CAMSS node (Vladimir)
- Move cam1_reset_default pinctrl state from board .dts files into the
  mezzanine .dtso overlay files (Vladimir)
- Collect Reviewed-by tags
- Link to v2: https://lore.kernel.org/r/20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com

Changes in v2:
- Drop qcm2390_resources struct and CAMSS_2390 enum; use qcom,qcm2290-camss
  as fallback compatible string since Shikra CAMSS is register-compatible
  with QCM2290 (Loic, Bryan)
- Use oneOf in iommus to describe all valid SID combinations: VFE-only
  (Shikra) and VFE+CDM+OPE read+OPE write (QCM2290/Agatti); add
  per-entry descriptions naming each SID (Krzysztof, Bryan)
- Rename shikra-cqm-evk-imx577-camera overlay to
  shikra-cqm-cqs-evk-imx577-camera, shared by both CQM and CQS EVK
  boards which use the same PM4125 PMIC and camera supply rails (Bryan)
- Add reset-gpios pinctrl state for IMX577 sensor (gpio33, cam1-reset-default-state)
- Add comment in overlay DTS explaining absent regulators are powered
  by the daughter board (Bryan)
- Collect Reviewed-by tags
- Add reset-gpios pinctrl state for IMX577 sensor.
- Link to v1: https://lore.kernel.org/r/20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com

---
Nihal Kumar Gupta (5):
      arm64: dts: qcom: shikra: Add CAMSS node for Shikra
      arm64: dts: qcom: shikra: Add CCI definitions for Shikra
      arm64: dts: qcom: shikra: Add mclks pin configuration for Shikra
      arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera: Add DT overlay for Shikra
      arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add DT overlay for Shikra

 arch/arm64/boot/dts/qcom/Makefile                  |   8 +
 .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso |  79 +++++++++
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     |  79 +++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 197 +++++++++++++++++++++
 4 files changed, 363 insertions(+)
---
base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
change-id: 20260526-shikra-camss-review-cf6f66ac566b

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

