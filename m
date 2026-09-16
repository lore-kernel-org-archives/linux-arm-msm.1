Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A0E4A2A46
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549905; cv=none; b=SVCbGoDwjj3KVGRTlGneXyqzScjzVyHC6uf+ws/8sh4G72hHf5S50L6lenL2c6OX/OOURh2UdRR3PnB8iwGNQW21TmoVOsoLpHvBQtrgtqSr6M6FUCeUS7N4pvabZNpCEeEdBXsSaiotcL+j7BKt9OlE7Rx4qx6FZmy624MPvYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549905; c=relaxed/simple;
	bh=bxU9A36GV6X5cD4U4Hs76RR/9c8QzDFoAdoCC9AYlts=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=suP04qfBOVBrei6eII46XkFwF6Aba390MRjsgzTLzsgoqZSotUBAKRkDfoOplpJTM4ziBxHlJ1SlPjaOvP6o/a5I5iMbEzK9zoYrV9ii433scYWFbK6X01afYUZV0yNqTVS47ItbHBCBQblRedp2RjRDdz92qDlGkdDaA3l2NkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZsO++zK0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SApkLNDQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZsO++zK0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SApkLNDQ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92pe63377321
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=o7/UDFZNMGC0sVUehP8pc1
	zfZcfAnhJSSnFpwW3L5/w=; b=ZsO++zK09NANDTYaIxT/CILSyyLMs4Y+tTl7P+
	ZYEFRVWw9kON22zwZHpnsJ+XeWX+5wMW6fif7IY8guP5lIQawEbIBSHa66DuEjP2
	OpjxjNGwWdTlQS4nrzpMl6n22VUPehhVztXE8DNdzxW1e6ebnwvEZz22fshIojHL
	KCGVG6slwDVEjki7+51cjp1Y0j1BEcYzRbi3qeDK2uUFeTsdfb6IxDQxax7kNc3o
	0xS8+AGAMLO96GfU6++RP2iS+GZMJl71HyHYwPAX2FmtaUioyKYAprA2o+ChBvFe
	judHTLkYKNTWaPRruZ3Wm0SgSbvP2N/SbnWLzjU4gKhk6ndA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqefpaax6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:11:26 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so8047275a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 02:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789549886; x=1790154686; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o7/UDFZNMGC0sVUehP8pc1zfZcfAnhJSSnFpwW3L5/w=;
        b=SApkLNDQ4GOm2pRyDuZcT5dpoYLZk73xRjhZoXqtaK2bPqufHHHCK0coveHDAmTUxb
         8NTmqmwpFiQ10gX9OL/6Yyzo70DPsfuGIs244yD8a0HDHFGREqPpLpNTZLanX21qHjFG
         zYpgQnaCMKmIyk19B4R0aBwG5UuKnKzgLRBOKvcl8SVAginNUT/LbfGQhaahJ1V5Rhm+
         cHlkzd1WVtEDz5AwX0B8inBtDVya8rw4SrrKab2QcYG8985uaoNFnWuw/Uh10ogWLzar
         1RwQPT4wxNTNYC+HR3ti2lO8lNqS2I9/yR2SJT3JrBIW+GH+Tr1yVoUcXuEFiLMupgxw
         xH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549886; x=1790154686;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o7/UDFZNMGC0sVUehP8pc1zfZcfAnhJSSnFpwW3L5/w=;
        b=EpWAGxLjy1Inz+dDjMKaF70rAho3kj8/rYaPZg5nf1ThsX3S13ve1NsOIOr4ldyD7f
         a8Mrl47m+GGNnsLJd7vPNe/MjhhCMTPH6fvY5M/RomISVaZGA9hTQOqzKrFVnyoQlUhd
         H3n30nfBjFznCEFPavGPIq9VuDHFVfEqJ09rMv3eoMPq2h8o/oCjXgyo6WxBIZGpoWSO
         FiQkW1QBQV17Jtcw4YHJrJIfcJEOkxT5WaO/ps7BoYke5IKNEdT8nrr8JoPr0AUIeoGO
         6VINxi2RyBsIwN/s0yq4aUKPl5E5651jO/ycQf6dF7Mlaa83CWpsFwBWaBb9mmzcGLeH
         FH3A==
X-Forwarded-Encrypted: i=1; AKwUvBxVH/kZeFDQDWNuumiY3YbHoC9uTIc1MSJBYeG3Rj9s1xicgldFhwD1EL+REuCeHJ1qIGcu4GJZiZWDpmI2@vger.kernel.org
X-Gm-Message-State: AFuF++m0Ommx0WFBomOz82D+zD+RtkdUXc4n54fGCmDrYTfPvmi6AXG0
	ydQgbI0rqxLI3TT9mG/Va+GJAXSYHn7bY/zQfgndCtaEATqucm2f72wvawFOjXbQRPcdZhihaIJ
	AYRH445b/btfN0k0baZyJVEuFpML6GOCuMZsXyYDCAWk3mY+fZbBkbQKO2Q4YSLSHfhFh
X-Gm-Gg: AYBFou3acshKJo2tDTNqG1f4lCucWf4gvOIkTCk6izlvkAzVD1+66xg3xY+4GDkFKJc
	aconS+QQ1Q77axBnaRbqWjWggqZ9NgDOJ7f/ejlYRr90gG1E7QKiUvkxZHZFWnZs9B5VUMfmsRl
	qssUVNNe/gL+1txyKDswROtPmZD+zLhQTEZ1yeCxWXWD1FngDPwW1x/sZTS4TWAL3tFI0YRFMqh
	YGHzyUJM3ZTvOgYDytU+BK9nsYtCSA91M5vmhGmijxZpW/0BkFV1i0GAepDmb9ZhGmv1J6c46zO
	dgeGnmVyfsLZKSZSYIYGgI7vCGgS1LLn8XzbrYPQrwp0Hz6eQ/iFBWY4P9RUJ3mstxi4Q2YFa7g
	+8fI9w37yeGR/vH+jfd3U/gfOC/s=
X-Received: by 2002:a05:6a20:9c8c:b0:3d3:adad:f176 with SMTP id adf61e73a8af0-3dd5f787fcfmr5489178637.24.1789549886162;
        Wed, 16 Sep 2026 02:11:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:9c8c:b0:3d3:adad:f176 with SMTP id adf61e73a8af0-3dd5f787fcfmr5489116637.24.1789549885723;
        Wed, 16 Sep 2026 02:11:25 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d3a31asm4779492c88.9.2026.09.16.02.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:11:25 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH v4 0/4] arm64: qcom: dts: Add display support for Qualcomm
 Shikra
Date: Wed, 16 Sep 2026 14:41:17 +0530
Message-Id: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADZdqmoC/22Oyw6CMBBFf4V0bUlb+xBX/odxUWiRqlDtQKMh/
 LsFYtywmeRmzpw7IwIbnAV0zEYUbHTgfJcC32WoanR3tdiZlBEjTBLJJIbG3YPGpsfrHvDBUKZ
 KWwhqBEp3z2Br916c58uaYShvtupn0Uw0DnofPktppDP386sNf6SYYM4LzROj9oacPED+GvSj8
 m2bp4Hmmsj+IkW2Ho0siYSsK0OlKKzmG6Jpmr64zK0+FAEAAA==
X-Change-ID: 20260626-shikra-dt-changes-8d127be951d5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789549881; l=3056;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=bxU9A36GV6X5cD4U4Hs76RR/9c8QzDFoAdoCC9AYlts=;
 b=+uWbf+ewUsRh7+LDuZv8ff1XxdChw6ggcu3l3EcnnBd0g1Pu/Qr/+a8BuypJ8vgeUqiSs8X7K
 3/Hf9ru/hYtBNIcBHee4EtoDm0ue39ZXa33B/izzcJiv3ytVDtN/Zow
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfX3jLJDKwfQs5b
 pbxpBJQ+YcHL2QN3CVNYETRZ9ABtevju/jWISyc8hDF4l9LQV/lofENM62+f68e/wpz8caf5okZ
 Vg+cSwdQk6PuOdgXBreo9cEQVvbJ1J4=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6aaa5d3e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=EzW1FMLw5TrtRJQtR8UA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: pK2gHY97mY1USCyVnthki_Ld_3uVbu14
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfXxvGdK3/JKhoT
 Ta/FE9k2gRo+TzBbyoEnnEo4QnrImrAjDA/0pGIETnalnqOnVkfqdVNXRbvuEbHlD4sdRmVwOMM
 AA0HwiHlymNXKOcvLfWbThLL5V27sRmI2Wvzsr/CaALGwQGj2h0QB+Keah3M4hqq9CgYRUD3VJc
 VeDgSWYC40VWQbesFzKSgjIl++3RxkrX3e1YOoIwivaIwWt7sPdGscGpzS2HNeBAA4qdWDYhTmO
 ze/cxr7IJypVqn+TyhGoMgBFfVIWNzxFWT1b9EFkCf1Gm2ofu4V5e+Hkic/A7KA7EHOvfFdOWyA
 6OxlBIVXBih21RbHlALJytim2BDD0qTORno5Rd88moERogme55xc9THuLWElgMUkQwJ4/U5hUft
 V/J30UJw6lXEvxvFe7Kzwo26NAkHP11+eqXTRQpS1Bivlsi9hWGSDdACB8KGT15zMAjgoClkDbc
 Yqgsg+kxp1eEjHC5W2Q==
X-Proofpoint-GUID: pK2gHY97mY1USCyVnthki_Ld_3uVbu14
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160118

This series adds display support for the Qualcomm Shikra platform.

It introduces the Qualcomm Shikra MDSS display subsystem support
at the SoC level, and enables display on the Qualcomm Shikra CQS
EVK and CQM EVK boards with the required DSI panel nodes.

---
Changes in v4:
- Rebased on top of next-20260915 tag.
- Dropped all prerequisite-message-id references since the dependent
  patches have been merged.
- Link to v3:
  https://lore.kernel.org/all/20260713-shikra-dt-changes-v3-0-15102fca9570@oss.qualcomm.com/

Changes in v3:
- Drop redundant vph_pwr fixed-regulator node (Krzysztof Kozlowski)
- Remove vin-supply = <&vph_pwr> from lcd_bias node (Krzysztof
  Kozlowski).
- Add the new line between the last property and the following
  subnodes in mdss block(Konrad).
- Link to v2: https://patch.msgid.link/20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com

Changes in v2:
- Replace QCM2290-specific RPM power domain identifiers with generic
  RPMPD_VDDCX/VDDMX macros in Shikra display and DSI nodes.
- Add missing blank line before status = "okay" in &mdss_dsi0 node(Dmitry).
- Split avdd-supply and avee-supply into separate regulators vreg_disp_p
  and vreg_disp_n instead of sharing the same lcd_bias regulator(Dmitry).
- Sort tlmm pin state entries by pin number: gpio3, gpio86, gpio91,
  gpio151 (Dmitry).
- Add vph_pwr as an always-on fixed regulator representing the main
  board power supply, used as vin-supply for lcd_bias.
- Droped the 5th patch "Shikra LT9611UXD support". NAK by Dmitry. Once
  the hdmi-dsi driver is fixed then we will post DT changes.
- Link to v1: https://patch.msgid.link/20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: arpit.saini@oss.qualcomm.com

---
Arpit Saini (3):
      arm64: dts: qcom: shikra-cqs-evk: Enable display and add ili7807s panel
      arm64: dts: qcom: shikra-cqm-evk: Enable display and add ili7807s panel
      arm64: defconfig: Enable ILI7807S DSI panel driver

Nabige Aala (1):
      arm64: dts: qcom: shikra: Add MDSS display subsystem

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 118 ++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 118 ++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 206 +++++++++++++++++++++++++++-
 arch/arm64/configs/defconfig                |   1 +
 4 files changed, 441 insertions(+), 2 deletions(-)
---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260626-shikra-dt-changes-8d127be951d5

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>

