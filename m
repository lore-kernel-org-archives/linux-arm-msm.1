Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5F539E6CD
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887821; cv=none; b=o6FAd2hHig/A4PBk4gD+COWxYT+GDkE0EliEmBIjip0f6VbitMcSN3aomDyELltm2zjPQkhqivXUrIAMIgRBtDxCPARTVlaBgd5nwL4RgB5GmYmOUc+zFGz+t2o1lurEfnHdHIxBc7VCiZkNuASZGMG/zbicoj24LvtEN6FpFqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887821; c=relaxed/simple;
	bh=wQKFnGdnJdY1FkH6do1pLGWIp/WKD3yuDJ3W4BrPTI8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G/83yMcxdDC0pGhBeMao+fOvymFJs8zKVmYzjTsJqAXXelfGarkLH+WlhSleYWbwHQSEwlOdIx9nbUCB746J7pjjX9PLEBBWgp5g2qMz/cd5f1PWwrlajFfh1XkFePO/mgcLVNx+4yPfJpeBXAsmvnEs4mo6+jkrVQzvCMC7z6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G5GWcjdD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AFrvC5Sw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G5GWcjdD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AFrvC5Sw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lSEV2162981
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zostCU3MBRzye5WvRvd11t
	iaWCiDuX0d5YcjnjqN0eo=; b=G5GWcjdDEiD7lbKqvLETbD4MgnG8uPvkBLBvz6
	U26safmFSxhvQHEqDNnVPF7n2iH2U24RVWgctoNNgmdNOREfViFkiJtVPZ9RYxjV
	BnDiYyFcHLr2Mwlv23NwadhtHem8222eCIudkNQKpba8pgghSn+YcHKmtt3+vSQZ
	Uqa2U87kJhbyusoW4wKV/Yrvtce90CLzj0u7xP70Kya6p9w0+1xTXGSjt8a0IIAd
	g/dpjEYRDx01zTAQw5brz+jU9H+A8fvU7/N6p92Al+NGAug0YDv9hOXcNH5T+hPG
	py2Ih8gfe/My/ZS8wu0ILsb6EQ3ny3H+hhmBSC8dMc+i0s7A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vknpp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:10:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cca3673560so5648005ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 03:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784887818; x=1785492618; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zostCU3MBRzye5WvRvd11tiaWCiDuX0d5YcjnjqN0eo=;
        b=AFrvC5Sw/2BaSzw72s6aYDPYUPnGAhtAetkWGfaCLoZcavXtkT4xcnCdda8rv/snTF
         LU7EcpskIHbpRGRCwQjL9RMQVdoP/NxJvQ2uCRV6E4ctFb3YMjHl66nbzGuZN5DzJYwh
         Qw74WQRZsAoQYeKKto8q8VtBkjlh4vnOzhNQLjvW5fi8WmwXljO06tGhtwXnJz01Vi7c
         AByOR6z246ifrNrOrKNgm3T+lcLUIYYZrtC0KZ3AT5cWJpU6PS75DOUcG8vfrgPuF67M
         BnQAIzGWmdP/OJssNU/H9WpX+eZGL9SvSv3rleArFdhV9FfyoMitmhETWfM83ppeHrVx
         1aGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784887818; x=1785492618;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zostCU3MBRzye5WvRvd11tiaWCiDuX0d5YcjnjqN0eo=;
        b=PxQVUBI0rjkFSMI4Roun/8XpYzUekTYN+UdSQdCOLjmfGLb1/ngOQjNLj/Hc3WxRUQ
         sk/MJeLT/rsFoXvkjjXPr0C6NZJ8oFp36FWC4cqGPzLrWeR0roljlRxnasySxmyhaxU0
         L3eR/+tE7R+Qgz8vINhJlcUReOJwohzhqllzQ8rLjJXLx4r9Yj5w36+/7hDw6doiUdwA
         5EK5huc1hUIRijr2ssI733I2nrD/+OQyNQCBj7jtLlRg8QR9q6VQUYvafo46XG25ngxv
         lYvt67/JPPVtSfAxii7qKOs1eeAe5r9aWzOeCXgiEocMt07KTHGPZYO7Y17bTuD4l4XC
         mfEw==
X-Forwarded-Encrypted: i=1; AHgh+Rpmusa1Teb0g1LtIN4Wtnj40AR3LZZ1FDZB+rZex8fnXOMKs32DjCI4C25EAvBvaSAwX2f3ZBkHaiUDbXTN@vger.kernel.org
X-Gm-Message-State: AOJu0YzlaWCm2qdDMVpYDbo6kiwVv8iFL8kpH/bn+dkmcWdoB9jqgylh
	SmyK9ok90UdM4iMWclaVMZQC2l7qXDpGMgrfuzrQfY3fVaJvzLNqYqZhaYMcyujBa2jGhYrnbGL
	ngGMH4JAIdHakjvFClHzHRB2F84j0LLKGjKlB9JgCeXxklxpg7su15aoKL9r6rnP6EW3r
X-Gm-Gg: AR+sD1144d97UOplUjJW+Z1Aci1SVNrC4yufiiGSBuAZnPnPVwow4gj33F5gOLQP1Uh
	nsvHaPZQHQrM/HDcf6y6yBBeoemSMIlpiRFtlvu2luABRFuKJaSI1AvBegI64domyfKut4CcNSm
	Di2JC02W8fdKI/CPH0nrmQGCCjay23PdRXSKTdlgLM/1efJQW1T0tD1+jtnh4tj0R5lnAaxkfW+
	8r3bXTK/XegNk0bn5kT0v0ThodMMqvQywgvHbsee9Uv4Iq2qUWKR9++F/tUhrcE0slNKUHQNIRw
	7jjcgrip2pI13XyUZ/RtDG7xFOV2+JboWMPt9SBhxI2EV28lE6GG6Nl5dtfFmrlogXVh11g+P49
	gyVOaIi8LNQz5JgLXoVpxFQCD
X-Received: by 2002:a17:902:e945:b0:2cb:3f5b:6663 with SMTP id d9443c01a7336-2cfa6bbfb61mr75407955ad.11.1784887817840;
        Fri, 24 Jul 2026 03:10:17 -0700 (PDT)
X-Received: by 2002:a17:902:e945:b0:2cb:3f5b:6663 with SMTP id d9443c01a7336-2cfa6bbfb61mr75407675ad.11.1784887817417;
        Fri, 24 Jul 2026 03:10:17 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f390dd2sm47863705ad.79.2026.07.24.03.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:10:17 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v3 0/5] clk: qcom: Introduce initial clock controllers for
 Maili SoC
Date: Fri, 24 Jul 2026 15:40:08 +0530
Message-Id: <20260724-maili_initial_clock-v3-0-45b577241c91@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAA6Y2oC/23N3QqCMBTA8VeRXTfZh3Orq94jQuY289B05UwK8
 d2bQnTjzYH/gfM7M4puABfRKZvR4CaIEPoU/JAh0+r+5jDY1IgRVpKSStxp8FBBDyNoXxkfzB0
 b6VhdCE6sIihdPgbXwHtTL9fULcQxDJ/tyUTX7c9Tu95EMcG2dNYRLhil/BxizJ8v7U3oujwNt
 LIT+1OS8n2KJUoeRaEaUtdCNTvUsixf/GEVKQgBAAA=
X-Change-ID: 20260617-maili_initial_clock-c7e2b4530d80
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfX4NduN7I3BpeU
 OrhPP7pkVLuQuWeNc7Rsvm9ODClXCYo47jFhPoulPmEOPhsBCn2oQsXG/Oks8cz1KpFJd1n2bah
 TENxHzOnQ0IjxMGNrVoGDRH8a6vvwzA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfX4fwZUEKwLAE9
 EErEmXCkyhbDkErivPTTVHp19R8yz+I8rn5x6VCugRrEojeTRopgD5g03PSbU/9wdq/wn5oZrTZ
 zyOxFaYDOn7AQdkgmI/cMtLYG+udjnyrxWyE/UttW+/ejPOHifjnk6li59RBqhuZK+P1z4frj+t
 Qjec3UMYKRbdamDO7zUTf9aQHA5+verECoIm54Mu/Jnf2mbJIjmI/CgHE4M1WRpLkXHGApt+sNw
 v9eH+xGcOkqr8xEskk7UlfKrY0gBAxoqO+Z5nUfg5JLKbzaK8uueymwgfR2DNa9Gurid7EeMpnb
 goQHVJNFRZp2Bkg5hE5+E39CCtGZ3NOl/QScYsBykgmhYqBxh+4xIuaKdQQApGdwBm8FB0Zv8LR
 lU21Ezz4Ix7U5MwmasqRXFfL7CrXMPwjCEVxinA3VKixRB86lTT+pnnGpw6HIo/1XZfemDcsxY/
 Gx+FHWyTnC5rEFL/nKA==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a633a0a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Kp3T8kGXBi3sce7iFlAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: nLltw5I30XMG9livksD7aSxPEUB-5NKw
X-Proofpoint-ORIG-GUID: nLltw5I30XMG9livksD7aSxPEUB-5NKw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240092

Introduce the initial set of clock controller bindings and driver
support for the upcoming Qualcomm Maili SoC.

Maili is a new mobile SoC from Qualcomm. It is a derivative of the
Hawi SoC and shares most of its clock topology. Where the hardware is
identical, Maili reuses the existing Hawi drivers via fallback
compatible strings. Where Maili diverges — specifically in the Global
Clock Controller (GCC), which carries an additional QUPv3 wrapper
(WRAP5) — the Hawi GCC driver is extended to handle both SoCs.

The series covers the following clock controllers:

  - RPMH clock controller: identical to Hawi; uses qcom,hawi-rpmh-clk
    as fallback.
  - TCSR clock controller: identical to Hawi; uses qcom,hawi-tcsrcc
    as fallback.
  - Global Clock Controller (GCC): extends the Hawi GCC driver with
    eight additional QUPV3 WRAP5 clocks present only on Maili.
  - CPUCP mailbox controller: software-compatible with X1E80100; uses
    qcom,x1e80100-cpucp-mbox as fallback.

The devicetree for Maili will be upstreamed later.

Changes in v3:
  - Update the comment for extending the array appropriately size.
  - Add RB-by [Krzysztof] from v2
  - Link to v2: https://lore.kernel.org/r/20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com

 Changes in v2:
  - Split the new Maili-only QUPv3 WRAP5 clock IDs out of
    qcom,hawi-gcc.h into a new qcom,maili-gcc.h header (which includes
    qcom,hawi-gcc.h), instead of adding them directly to the Hawi
    header. [Krzysztof]
  - Update the GCC driver to include the maili-gcc header.
  - Link to v1: https://lore.kernel.org/r/20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com

---
Taniya Das (5):
      dt-bindings: clock: qcom-rpmhcc: Add RPMH clock controller for Maili
      dt-bindings: clock: qcom: Add Maili TCSR clock controller
      dt-bindings: clock: qcom: Add Maili global clock controller
      clk: qcom: gcc-hawi: Add support for global clock controller on Maili
      dt-bindings: mailbox: qcom: Document Maili CPUCP mailbox controller

 .../devicetree/bindings/clock/qcom,hawi-gcc.yaml   |  11 +-
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |  65 ++++---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  34 ++--
 .../bindings/mailbox/qcom,cpucp-mbox.yaml          |   1 +
 drivers/clk/qcom/gcc-hawi.c                        | 201 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,maili-gcc.h         |  21 +++
 6 files changed, 286 insertions(+), 47 deletions(-)
---
base-commit: 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
change-id: 20260617-maili_initial_clock-c7e2b4530d80

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

