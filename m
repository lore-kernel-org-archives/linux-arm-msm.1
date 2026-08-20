Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39B0408624
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220525; cv=none; b=tGLQpj4En1/dsEC08K2k0DV5kKiAUxh3nEl+FXlZAaW1EqLVwO5YRlt5EId3lljtmQvq4vVCZ5SQGGKV1x3UU6qhAOgcF9BmvNr2tx3XHlF//MnDG1+GS21Pwh7m3WskHcSudB5RHbrJGUzTC27zmj4Q8yAfACk/Btq1+DW7Jtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220525; c=relaxed/simple;
	bh=0fSvlelieL/vtBn6wF8EgGHoY5BotCQcHZRmlRwnou0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l313w8+/43B+6OK3EObM/jbNRewicZyHGW7UkKlpLBSlTiswhrtRgrQL5OGZkR5UMa5Qtmxxdqa2WJGc3QsWwS3myGljKO2SpCtYtbM/ThMU5OEqHHFOSnsf8BUrdM+bn9iopTz5k4rKOe5M5SPX+QqhMw+4NkI3MEzTicPL9TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BA1HL3Q0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SqqKuZMS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BA1HL3Q0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SqqKuZMS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6eXmw2161066
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=so8DlCxqoHgIW1C2kcpvry
	7YB7EgO2W5bBV44wBQjFc=; b=BA1HL3Q0s4Y0j/HxXvNqj2puh4TkpxhzG84pE4
	fr6c+UcMnob94YbXI+YwHoQWtRoCTwYWY9hj6hkqM73Od8vJcZ5SdbsJyV6dB3I5
	0m91LTicFlqUdeBudDQidzWF349zUWCsXSyJhBFKa6ecRk2gP1vl4csxplxPCY0q
	GDizA1YeqvEwPBzVSkZs2ZdIexnwq2mECg8g/GkvaZ9cwmJfjcMlZGDN24cdV9O7
	rkIaYWPJIc8fbhKkIvTNLJHQjzsrDanZzfsy0L5cAArapxNrs7m3g4WvJ8vNjquz
	mDRUJWkSRcph+tck4n1iyXk2caxfnNpNrIcoJDIo4P95dtLg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vh7rrtx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:08:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so421666085a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 03:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220516; x=1787825316; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=so8DlCxqoHgIW1C2kcpvry7YB7EgO2W5bBV44wBQjFc=;
        b=SqqKuZMSFZKjIMwGxWaGAA/lHQZORqxExRXHuAeJd7tcK2aiytOroNiQEP5bfUrAJ+
         NLIfM2PeGHbjY9vxeB3eZs92gCbNBPo8cKp9fX47J8JiaMKLcjTbIepNMm94SWctBKaH
         fi25GpH2ZDkHQOvDPQR/kJ7JyOsMlcrRu1nfhkLy0w5nRRH3e7jCm+5eMauJQ6TXooB2
         AmfI6Ulq3lbYFZNfjMGGdzibyJPnzg8AcGE41DzPzr5WRIBS9dnbjJ9H/MQ+Gf52TEev
         tgl8RNLCUm3CLj8/XNrrU44uNCheWDBIVR9/ZEWoeBLmUHn2BDXx6u4rog1IvxTIe5Xy
         FCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220516; x=1787825316;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=so8DlCxqoHgIW1C2kcpvry7YB7EgO2W5bBV44wBQjFc=;
        b=DCREPnW53CCLZMZ6D6EnzzGCU5B4o5Q30yn+d7HLHaIIxYlIIaf3lrWtkNLJKLkrBe
         R7UqqqL1xdW6ouTRWxYx0YmXux8iJ9fzXvVkMiWMC5hCHDyim7PbcE5sW3yJk9Fxq8nZ
         XN8uezjitObZUJFmUomyj8lRSpxIHDz6TGwriVm9fmpGiXzHHvm5sGDD9hiCqBXK71c9
         Z5KpBtk79mzigXY4vqO2XRyrV13V1uz/hv+0q/oFCsDoRQwA3VLPYPqATJD2V2fWTZik
         KxsG+Vx9XckQ1HznhSoOi6fubSjs+Trk/ipuoIHVfKsbPhNJ4MPaPkZTgsjRBhiH13B8
         Aa7Q==
X-Gm-Message-State: AOJu0Yz9KM93DnlzHOXGGPaJSeX0q3ixWmdstKVO4NrcW0DfK8SDFG8B
	ouPERYcyJ0WeEOCK4JEaYXMx/Vm0XAz2k9GyaWyMmuWvPSQC4vL5Hmq83DHa5yNqWCikNo1jHNJ
	XulXVCoMdpWYq28SWcVokxYdXHdtTCQg5G64x5HT+/Xg3lkLyLontJmb8PbcMr5/xN9yV
X-Gm-Gg: AR+sD13eQ/bajsFvNl+mO5iKg3WW/ygLnPBRJM73VywMzAWWvcP7TIdHuJFyv67+vCl
	xgaoCpXY+xDkMCpB/c8mN9gZp/pi/iYoDeOBVGyn5APuk/07d4U0+6lhOKRrOsvGPldAXGe+rJ7
	RliMeE7+u3XcxyuWS6vEdSZvv/n63bjwVpCj5zqvRwaPXsNArqEfb7IiV16h19YdR3F4ELS4qfD
	WiQMPBuZ5u7XyFLuzOt3gfVpHPX1J7Ily4RpOWTwBWv1Y6QfNJJ9LAoTZmIIJzFPSDp4M6vLU2G
	EHDHPRZ6bCx0s2FKwy/Mj4lXBbOTy1QqKVrn/Zg17c0vYBmHkfLOjRuzwIostUirRPuQP9ctHZT
	OXXvO+MjP
X-Received: by 2002:a05:620a:2b85:b0:92b:8a7c:f71e with SMTP id af79cd13be357-9371e219cedmr1207240785a.15.1787220515741;
        Thu, 20 Aug 2026 03:08:35 -0700 (PDT)
X-Received: by 2002:a05:620a:2b85:b0:92b:8a7c:f71e with SMTP id af79cd13be357-9371e219cedmr1207234285a.15.1787220515139;
        Thu, 20 Aug 2026 03:08:35 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:08:34 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 00/16] clk: qcom: Tie CX power domains to GCCs
Date: Thu, 20 Aug 2026 13:07:03 +0300
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMfRhmoC/32Nyw6CMBREf4V07SV9YAFX/odhAfUK1wiVthAM4
 d8tuHczyUnOzKzMoyP07JKszOFMnuwQQZ4SZrp6aBHoHplJLjUvRAmjsT0EQjALBAutMaBz1Lr
 MtSqbM4vFt8MHLcforfqxn5onmrAv7UZHPlj3OV5nsXt/D2YBHIqMc5UJmWGurtb7dJzqV3T7N
 Aartm37AvYo4PHNAAAA
X-Change-ID: 20260819-qcom-tie-cx-to-gcc-67e6697639b5
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2749;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=0fSvlelieL/vtBn6wF8EgGHoY5BotCQcHZRmlRwnou0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhtHQJQwcbsenv/CvX+V2MX5bkqU2fgLhWGeik
 EXrvWTrEYGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobR0AAKCRAbX0TJAJUV
 Vj9MEACe1nDjAYgJv+paJ9SrzeVFADMRMF+qYprfM7Py73y82/VX/3WPOd9m9bZl94vHSHSW7Iv
 189+u4wQ0sJW3PoL6AAbsLfmOeWdoWXKVBKtSvakqAN80NBDnlmcI+92tKInZQ/akNsuARZU7Gj
 he/t2zptjTD46nS3sabwVj4Z1gxftmuvYCbucMpbjNMMzKPlqzT95JJuJRxbocpKLOn2t+6XykB
 NOvLDe8oKFNOaEdkGZDi19Qmb5fF4fxkJF1yg6PUCCfmyGhlF8atrrexwUKbIlJHQHP8xCwARjz
 jSVIJNnDogyU7/TvDVPtSQOJHuhxEVdsDzayJUDz2yCu59hWmV1Upy38rtA3CmYk5pSSQ+M8mHs
 b/wQLcgpzdDsW0+ElTsR9pBskaHD3fgWScuxNAH5Mk5nXUZyshbO/NQvouZ9F0evOibjfp2i/0o
 xqCq3D+2mQTbVOjz8p6tuoDbrWhNEOlMrCgJvcm48jXpAAvXTe1Rwz4kr/vNWnIGhgGVAYCg2YJ
 9gkK0AmKui/WEh6jV4dOh/1ocMM2Z4/XCPDPFEAEYq2uv69UieSAr8/EMkP8SraGvyWu5qlTyYR
 f0N6jzSJxcRwFAF13fFZ9FsFxCXnhadLY7kYBiV/GsYoq+rjIF2VX7FaIt3G936PgxWmFpp1fgz
 65qOldD3/oeP6vw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX83UV059F9G3B
 qn97x5scpdVULFs5kQaFvTeSao/9cVkfO/BqI0RpNKmuvChUAcD1EE3L6PUBIzNs9+9O0RwIQLw
 Y4QM+eIcdZ+zwFHsh+ZSRCWKpP4Pfi7ChnLlZKShS20POPUa6k8Z85cjPEbZP9aU3QbBr6dDETR
 XtcPzNgnprKS0AHm4XmD6wUrmWq+9ne2SNzAFCTEti+aPnUph8zzinZxOmP9ro7ZYkpUYEvoE+x
 bg3k4bPacH/3LHhkOFglyiIiMWMUlaS2GZ0npRxS4P4vjfkXqMhlfLA0zg5Tlyi38IWl60Ow77Y
 jQfaYs4/ttXT81diDXGUKLvUKQxuDOiXvLGUGYv4hsxZiqvCACQG4pIzhuGyVkoLuUnsvq642r9
 DgMxhrhK+Y9qG3ahsklUouK1G0L9e55w3yN/2ofTlYM3KrzYKl5QisaiNYtL9ZV56R9ijjQMdw4
 rOoKRMhxXZkBHFhLbVg==
X-Proofpoint-ORIG-GUID: ghrzxI-u09Nqejstuf82gZuWYjs7WNo1
X-Authority-Analysis: v=2.4 cv=Y7fIdBeN c=1 sm=1 tr=0 ts=6a86d225 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=iXTosI6WrnVeENpZgjcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfXykMQvfOQ7PLU
 /QMg1ju7rPrR/xipjGJu+fLTGIdTyfNo905DhrMyw1cJJ9NnruxEgMcRmNWhHefx0e1wW1gLwir
 CDlFuv1a01xM9sNkpOzF7esxrt8xOZY=
X-Proofpoint-GUID: ghrzxI-u09Nqejstuf82gZuWYjs7WNo1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200074

Tie the CX power domain to GCC clock controller for SM8250, SM8350,
SM8450, SM8550, SM8650, SM8750, Kaanapali, and QCS615.

Also enable the runtime PM in each of the GCC provider drivers.

The existing common GCC schema accepts the standard power-domains property,
so the bindings require no update.

Only Kaanapali requires a Fixes tag, as runtime PM support was not
available when the other platforms were upstreamed.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Clarify the runtime PM rationale in the GCC driver commit messages.
- Picked up Konrad's R-b tag for the dts patches.
- Link to v1: https://patch.msgid.link/20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com

---
Abel Vesa (16):
      clk: qcom: gcc-sm8250: Tie the CX power domain to controller
      clk: qcom: gcc-sm8350: Tie the CX power domain to controller
      clk: qcom: gcc-sm8450: Tie the CX power domain to controller
      clk: qcom: gcc-sm8550: Tie the CX power domain to controller
      clk: qcom: gcc-sm8650: Tie the CX power domain to controller
      clk: qcom: gcc-sm8750: Tie the CX power domain to controller
      clk: qcom: gcc-kaanapali: Tie the CX power domain to controller
      clk: qcom: gcc-qcs615: Tie the CX power domain to controller
      arm64: dts: qcom: sm8250: Add GCC CX power domain
      arm64: dts: qcom: sm8350: Add GCC CX power domain
      arm64: dts: qcom: sm8450: Add GCC CX power domain
      arm64: dts: qcom: sm8550: Add GCC CX power domain
      arm64: dts: qcom: sm8650: Add GCC CX power domain
      arm64: dts: qcom: sm8750: Add GCC CX power domain
      arm64: dts: qcom: kaanapali: Add GCC CX power domain
      arm64: dts: qcom: talos: Add GCC CX power domain

 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/sm8250.dtsi    | 1 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi    | 1 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 1 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 2 ++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 2 ++
 arch/arm64/boot/dts/qcom/talos.dtsi     | 2 ++
 drivers/clk/qcom/gcc-kaanapali.c        | 1 +
 drivers/clk/qcom/gcc-qcs615.c           | 1 +
 drivers/clk/qcom/gcc-sm8250.c           | 1 +
 drivers/clk/qcom/gcc-sm8350.c           | 1 +
 drivers/clk/qcom/gcc-sm8450.c           | 1 +
 drivers/clk/qcom/gcc-sm8550.c           | 1 +
 drivers/clk/qcom/gcc-sm8650.c           | 1 +
 drivers/clk/qcom/gcc-sm8750.c           | 1 +
 16 files changed, 20 insertions(+)
---
base-commit: 5453bc3279e9f8578ac3e534d476240e40c879e1
change-id: 20260819-qcom-tie-cx-to-gcc-67e6697639b5

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

