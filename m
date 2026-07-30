Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5AB44781C
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785434088; cv=none; b=MBxaNM4WHWExQFFVaVUzt18DN0N8IfJpXLfqwjRQq4zNB8yw+pLg5iitAsK2a/wj7E4AaUysYoicq42F7Ab/gVMIPH2YQaQVdmJjjv6g7OVOQeybfSxSR8cvgF/a94Cn2FMhtviAzv0DjykEt+qdLZNMo53LqRjWw6HqtJxMVDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785434088; c=relaxed/simple;
	bh=/QTaqqQP/iMHUTIsjATiz1okadrXGJ+qYuzqDe4y2uQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fTIIMc1H7lrYHFcKPHzIex3udJIwLnyJ5HtxNW02fQOl1e+mWfLL1xIO7WsRlbcSudxtEWwXiXBB9rnKKtO22bcns6X34qrBZjK42awhcsWJIDqK+z81CVoSsOHglEkmlVF3NKOOu/VQ/1Gl/XNz5zeUJvIwpP12pghvK2o2BHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L5RpLKhy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GOQGcbgn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L5RpLKhy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GOQGcbgn"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGWn1W1643373
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sOYSAr6uu/0ra4AmicnafZ
	NxmpLHsj2Ia5yTMbKfemI=; b=L5RpLKhyEoLXRemIGOOWUQghmr9O1XNGFF9GXQ
	WmsLN2x0f0DUfkKR4OrBYkiDCzOH1FXuPSv5tI+Mi7Do5uJLb83TL72nvVqe+eWE
	HUUXLVbfLktcELUgVjM3I8ArTCTDsPLpwHuurnIBOtjQ84GEEhYhKAkXNCZaosi2
	uO0DiLp3nq5qW0U96W4mIyLbdQSeM3nX1+C9NHYCBz3BgdaXPBnvQ2ec9XyI9w19
	B3mNEXnWX0nQmDLUFp/C48JCaZJi/LPbhcVHJPBUPQM/xuzgSI4g+t2muTimJm1R
	N8Nxi3tmI4u4NLodwLitoWJU2f0iocmZUicor7L2ghJdqxow==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8md10v2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:54:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfa4e4684bso1193095ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 10:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785434085; x=1786038885; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sOYSAr6uu/0ra4AmicnafZNxmpLHsj2Ia5yTMbKfemI=;
        b=GOQGcbgnnsc/WZHhGpOMWW3lvv8s8PU4ix2REwK7eA8rfPrG4fpTxJgiar7gwnMjfu
         upK8cqxnivNqaiPopOE8OkaVgrRCG0nTpXTL3mH06wpizu2MZ24Ost/QVTedflm6GQLT
         ki9Gq/gi8m7Fp5sw8nd3PdObsXfnJ5gfzOYh6sB0H5wpMjKDFDOZKpzNu2fCapN2yGGa
         8+9/s4Ecsp/ftk7V/99ITD3q3es1nY9aQ97elu0j+wHFw4egYBvg2TUaAlgK6wKVGb8T
         7XLr6etp9LboZCTiP/pNzPAjwyfKScbnvN/OEvWjMMhH30Ouj5tLlS9Pyw15zSMfUM5h
         6AMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785434085; x=1786038885;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sOYSAr6uu/0ra4AmicnafZNxmpLHsj2Ia5yTMbKfemI=;
        b=n9og7JMDL0v3b+cDGdU6SbTcBNm70wWHYvfag2bNbYrgh9MKhG/Bbrpu2qYWlBskiV
         3S7K+xLbIKYsMRC92ZvjGXhi+DESpyLu87y9c6OFU/8AbaGyMV0DXqDH+jrULH9T/9bV
         bCG/BHNLiRZgB9xBRSv11KOvlEUeJpoFbOGrUUThoVFpaiSNHtvRlO1DE+nHsADwZaWa
         BupKn6OeHjF8ZMsC8Qn0mhVZ1+T1QcQphMFKZMpLjVBTnQwB43OBnzCJ8A8lsn/5OqsL
         vIujad7aH4x34gSWOyMDDoN4x2Aa/EW8wv2imyP+dGgcI9yvO4PRL3VMBBHgGG68k6pm
         cebA==
X-Forwarded-Encrypted: i=1; AHgh+RrMlq0tKNDawP8zJsqPfFDJx5ZgQ0tL1Ci43NNCkCT1+rZupSHAITjfycfW6XiGwCl7NhRgrElcIEpytGyz@vger.kernel.org
X-Gm-Message-State: AOJu0YwNWHWqpUSBnZstLgCPnH2Z02JTqhaXiz4uqwhUTRupcxq+sbte
	pHu2q1+ml2JFwCDIG8t5NSNbZO6Yx//ng7+D0P7edcGAl6gW7NfdFTUFI/6G6sQXfKV1bU4pvwX
	k12g6uyptcPw9c1f5VcvD81HKiGP3QsJ+6DopHE1dAQpXiL0HfLn6vT1azcvIK1qMhXrLy1bXPA
	Sh
X-Gm-Gg: AR+sD11Z66WpjzHBghFNRK/0dwOIObeI0DOEZoE54Yc52yENWe7gskjnh1Kk/1dOLN/
	VGgJCuTNvAndIJ/vW4kmjs436+uHwOD6Imyl1qMTSJEaZgySeYl0ZooEz9Qni2Je5JWrdBmWLds
	ReXTeLMl8bdZYc9sgfKHcxdDJ/BbmZg1zbpkjbxSKXYpouSQ+jyc+1/4RBhPlFGpusecYWKfQ6T
	Ze89ni7IGgqG7xBe+e4/seEzC5/t/uBos1SUeFKCIb1Fp48hATQFBHfBi34f50cQv3MmNRQ1QUj
	8cSASRAGsYi1JtbcKFNi4fijlMWat0lyUZAOQLD3dUF0QWT4n05DBhvvYL7ij8E+nng5fdrZ2Qx
	qabRH9Ol0CITL3OXHbzBBhzuQ
X-Received: by 2002:a05:6a21:695:b0:3c3:8ead:6df0 with SMTP id adf61e73a8af0-3c900535ef9mr3433701637.28.1785434084621;
        Thu, 30 Jul 2026 10:54:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:695:b0:3c3:8ead:6df0 with SMTP id adf61e73a8af0-3c900535ef9mr3433683637.28.1785434084250;
        Thu, 30 Jul 2026 10:54:44 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm36444098c88.5.2026.07.30.10.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:54:43 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v4 0/5] clk: qcom: Introduce initial clock controllers for
 Maili SoC
Date: Thu, 30 Jul 2026 23:24:33 +0530
Message-Id: <20260730-maili_initial_clock-v4-0-ed52ade264f0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANmPa2oC/3XNTQ6CMBAF4KuYri3pLwVX3sMYQkuRiYUqRaIh3
 N1CYnSBm0ne5M03Ewq2BxvQYTeh3o4QwHcxiP0OmabsLhZDFTNihKUkpQq3JTgooIMBSlcY580
 VG2WZFpKTKiMoXt56W8NzVU/nmBsIg+9f65ORLtuPl216I8UEV6mtLOGSUcqPPoTk/iid8W2bx
 IEWdmRfSlG+TbFIqVyKrCZay6z+Q/EfioltikdKSC1VbFCT0w1qnuc3oPmcrlMBAAA=
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=UZphjqSN c=1 sm=1 tr=0 ts=6a6b8fe5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Kp3T8kGXBi3sce7iFlAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: VFk2kozIxGnx8T3BjXrHWwg1czbI0dim
X-Proofpoint-GUID: VFk2kozIxGnx8T3BjXrHWwg1czbI0dim
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEzMyBTYWx0ZWRfX0OND8B1xwNPA
 tLZLuHb/aR9LOcc+d5q9dlloDDV0zdG2vwk/PYgPuDiket0L0EzrUsFHLisbMNxfqtMDOH8/EGe
 i0mkVqkZkto/+otbnpzhjxlX49EhoJg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEzMyBTYWx0ZWRfX0HdUSa1kvM10
 KLi/bqCMAgnofv0XfQGwt6wF6ZdC/0+WBv2D+uzkWMpUn66F73LhTR/Ao8dru1xB8kZPMFUcPmL
 3Rzfl3/w7YzVqMgu/KigW4QdnUYwHJpS/K9I+5nfbH+wdn3dqlGDfWAFAuYchkhuuSf/BLfLpxa
 ehwRaj6dNWXPP0RYGMkPhtEiLtyhZpUvZSh4tPHf6h7YpI9i/ajnv1dT5QsEMOkwqv4dDQ5mOOh
 fKgCq/py5XqaXHb9WLsHzwTp+qxxcyJtP1aQrXmljCXTFn7FQGHMim6KpVjqRQ7juDd2uCgemme
 t8/6uR9DcXnnmiohfKqIZX5ThqFzeUQcRQMW6oGhU9b9bfIsyzgPD8W37IihWZ5PY3n/FTknoVp
 QqJ68XnHY5IadS0neTJqsuFYT0wRNT9Dty6jy1Vaoc55RY1zQFBpyT0z+Hiy5qFxbydSuwSEiax
 BdVbSO+XbJ9ZaaERO9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300133

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

Changes in v4:
  - Rebase the binding of tcsr to linux-next.
  - Add RB-by from Konrad Dybcio on the GCC driver patch.
  - Link to v3: https://lore.kernel.org/r/20260724-maili_initial_clock-v3-0-45b577241c91@oss.qualcomm.com

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
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  32 ++--
 .../bindings/mailbox/qcom,cpucp-mbox.yaml          |   1 +
 drivers/clk/qcom/gcc-hawi.c                        | 201 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,maili-gcc.h         |  21 +++
 6 files changed, 285 insertions(+), 46 deletions(-)
---
base-commit: 95d6a9ccef99117115e41e9adb271243bd5e985b
change-id: 20260617-maili_initial_clock-c7e2b4530d80

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

