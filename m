Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011A435E1A2
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717094; cv=none; b=Vyf6p+17psZb82MPq8fHIFNpplnuy1tNI1vZEYPYnGs1WZuSw3I9mmxNyzGO3HH4MHdV3ROU8bxKD5dVj76ERkadC2oNP2sb939vShpVhXYfJQD7MbeIiq8Dvu2pqga7cTAmiWRCTeI6kreEsuGcdlucuurKjDjptJtdlm3p0c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717094; c=relaxed/simple;
	bh=/hhzK5a/lIOKTiOtAp1IjbgyGrXH+zft7tpO5DhdPZo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rvbS+vAKPn2hGo0ngmHy873gkZI72z83+ieA8y0qBpxxRTiBCW4kMtnNmgk2SCfOmUdjNDaXLb0o4EgVK0TLYsAPOLdegYEd/35EFQIobc+gp7GMjqFZcz4pG5ONNybK4wXVPMBJxI8PkFQL61HJEU3XolNl6daPjkE3Ajf3J8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JvO+2d+2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cNAzsbDv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JvO+2d+2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cNAzsbDv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8x0ed523766
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TziaN4U3nrUm+NPafU8G8C
	93XGXYt0jtmEq2paxzJuk=; b=JvO+2d+26nKPRuzfFOIPM8lZELhNwYm4AYrExF
	Tc0HQuMEVfCLe7A13vYk9VciariP2hRr10e0ZP70EFY1iArRf7DA5GDjZHy1LWj/
	f4/a+qsTF5COq4cPsVh3dsv8NjNOlsPyhqyA2sxIRRVQdxt0ThV+xbUzLe/RVbTv
	i6k4RY+zUQy1V69h99EMKt4zk0YRIJFjOP6+Ndkn9OSqXSl5IJPzCCBlNFdYqCfr
	kJHFG6mPDYixZgT+qOoZw5paxlUdTqXk1Uj79zfUrfZpG1Sny4YrTL6ckAekJu1T
	aT+SNKNpGBgQhBrleRqmPdv3bFnlCi+Ko09Ct65jEIvKBEvw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjrtt104v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:44:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccd1958e8fso126226385ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 03:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717091; x=1785321891; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TziaN4U3nrUm+NPafU8G8C93XGXYt0jtmEq2paxzJuk=;
        b=cNAzsbDvKodjB7B/iSD83DDFn14kiEMghL+cSXNFRKnUGFoUpAGFTRjFDTdrNakoGL
         pH9fv/Tmyr46Ztq3j6/7T4VhcZRsr2dBMkqpGD3IkrHFX2X68SHKNaoFf57PVLO1mXCF
         AS8rWbMxTrIE6JWvZ9Hbi6dW85vuLuAFcWPGmzaweYGLs58PD4bQDaz0jZs2DpW2jrZr
         Kv3HPuWzY2fKD5OyRLug7v0kJpH2Rs9cONSTOquGv0JjPjWeVmaxYUAo+8/MhIDfvWof
         QG23SdTAsvK01UPKRIQ5ULbe/iDnoEiPhBkkJzh5Kf3Ph57rtE7Rp72APGuyPqULO83Y
         MlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717091; x=1785321891;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TziaN4U3nrUm+NPafU8G8C93XGXYt0jtmEq2paxzJuk=;
        b=TOxPkRVxuR+nB5qt0Z2B73DkvjA5aQ5GZsYAuw6BsYwtqjCz5H9hrdgAQ4sfvsFuru
         PU6pI3/CmIbNxKP4QKgS+4yZ7kXR3PF5iO/PYnClR+nHaoLq3zLICGHQB5b0UTKQcWYM
         LSz2A5qD6lkIxhIv0HOmfgkbg9fSwh4/Idkdwx91Hs5ZjAe/mOIwR/rad6SdLWO5V82t
         olKnOsEw50JMlknlvk69TcyOie/ihLkutPwLfshe7bTL0joDt9I/gJgiAGLT3lXT3zyu
         x4thD19s0ZIrXKoXdcjY+TISMDwkeqDJC0H2sVuBPgIJepP6ljao2WhRucXZGrEUxAC6
         Pa8Q==
X-Forwarded-Encrypted: i=1; AHgh+RpW5mPQoHN3rz4wb0NNDraFNJBBHsGlNv6CU82yl83EB5RILqcTbYKAFgakZT8ZpWhBEGn+0Qmak7ndFP5R@vger.kernel.org
X-Gm-Message-State: AOJu0YyqtR2geW8PzPosRd/P6ayOqeiDfGE3NLR6rcWb9g1jD+BZ6jAS
	GaknbIJIggbpwqqsRk0RfZK81jdE7rqqy175IkwD0BUZ5YX1kfgGE6xH62jtiB0FUqeyCtcZQWl
	b5Qe/7fuTcVO7qXR2evsliqfNjt/qKzqIpiNs6UT6PxlPl+5Z3zFDpNUMh1jXuau/DVn3
X-Gm-Gg: AR+sD11GuMSs4GfDXYehY/gCzcE/QjlTKxauPJPk6EmWbC6MrD/ti5uExwCezEWUzZj
	W5Yl8/XVgAzPGcT5zaz4UlKs/eKAJUJjipcsJvNgtvSij7oMapyGKiwtm35mVkvC7p1pwTz/ghy
	OPoEpDH4Iyy7XenR9JqWLB3PydgWAg+/a8FcR2HW4ee+OJqnhXu05ayngQb2kQutRMm/lslmnMc
	1oUhssKtoVYQ6LU2rr246UefqvpqtKO6qkucJwoqAnkAc1ge1f9GwLZxuScXl+Xnn1fUdT+Q+rl
	IzX3yjZaOErrIx/2zuWfPmF7OMR7Fgh4fqFbZS/sQ5g23tzTb9j1RaBGtXLfGt13eT+dWUjpihP
	W+Dc84ojJaat7DsfvzVUDMpgQA+W++qQw
X-Received: by 2002:a17:903:234d:b0:2cc:f4d4:29a7 with SMTP id d9443c01a7336-2cf3499781cmr240606965ad.24.1784717091462;
        Wed, 22 Jul 2026 03:44:51 -0700 (PDT)
X-Received: by 2002:a17:903:234d:b0:2cc:f4d4:29a7 with SMTP id d9443c01a7336-2cf3499781cmr240606795ad.24.1784717091000;
        Wed, 22 Jul 2026 03:44:51 -0700 (PDT)
Received: from hu-sachgupt-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e797asm12382455ad.39.2026.07.22.03.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:44:50 -0700 (PDT)
From: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
Subject: [PATCH v3 0/2] thermal: qcom: Add Qualcomm SPMI MBG thermal
 monitor support
Date: Wed, 22 Jul 2026 16:14:40 +0530
Message-Id: <20260722-spmi-mbg-driver-v3-0-ef73064f2789@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABifYGoC/3XNQQ7CIBQE0Ks0rKUBKhRdeQ/jAlpoMVIqtETT9
 O5CXbhQNz+ZZP6bBQTljQrgWCzAq2iCcUMK1a4ATS+GTkHTpgwIIgwxhGEYrYFWdrD1JioPKSd
 CSCoEEwykr9ErbR6beL68c5jlVTVTZnKjN2Fy/rlNRpx7//WIIYJyzw9EUipwrU8uhPI+i1vjr
 C3TAXkkkg9TI/bNkMRoziutcctrfPjBrOv6Ak0BfxAOAQAA
X-Change-ID: 20260601-spmi-mbg-driver-582aab5aa6a6
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Sachin Gupta <sachin.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: oprbp_FnmWX_9TBZblSPxImGYhFfsgLa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwMyBTYWx0ZWRfX+D/bnBkJ0DRK
 cyh9fwCgJaysGu06zufJZMxiniZe/IcgJ/SOtf9gsVWnd8NIU7YDw5zOOO7GUMfy7w3SfZOwty6
 rJCssGZJKGsVa2cF4JwZRl6DX8N7DUgalAIdY8uHF9VbyJo7ymveyBSBFYFb7G/U76B8d5FIM55
 d1XmFpHO85vFqR/3fkw5UhjKSjnP+jNqD3p6ATx4oGWqf08oFHJea4jXLkEpkU5A0l2bQmJmX+H
 Gi89E852BEPI97ZAV99Dmf7VX3wsWdV0w+wEEfflpRq71nYip4hqRbHPOvUQVoRMyIbxoqPyb5d
 bNmS6L6s9haPB0cUv2p+njsz2kW2sx/bFl/GUuCgXkDRv8IxOCNQFCEHRUDPAfuEDT0VZ+hAI02
 KLw0PsniCUx8N5R0X9qyrtJzNdtuk2qx7cp7Mh23iG8shMK3ELgrpVrq5TURy7KR/4plkWOQWyA
 cAq7q8TMWgTB0RWYlEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwMyBTYWx0ZWRfX2I7IMc1Y55eG
 Js4L1asLavCVxYctct/cEkDG4n+1Jj1baFRskBZoRDHMm/9UCDWCGxo9oqMJQeMWRt8aZA7V1A3
 RJc9hUB+hgEHaHjFAoyV8uzn/2ndkGw=
X-Proofpoint-GUID: oprbp_FnmWX_9TBZblSPxImGYhFfsgLa
X-Authority-Analysis: v=2.4 cv=V8lNF+ni c=1 sm=1 tr=0 ts=6a609f24 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=iUTBZumk_BVKSr9I0GoA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220103

This series adds support for Qualcomm MBG thermal monitoring.

Adding support for:
- DT bindings for the MBG thermal monitor peripheral on PM8775
- A new Qualcomm SPMI MBG thermal monitor driver under `drivers/thermal/qcom/`
 
The driver monitors die temperature alarms, handles the MBG interrupt on
upper-threshold violation, reads the fault status, and reports events to the
thermal framework.
 
RFC patch:
https://lore.kernel.org/all/qq3cggafexwpdrv46eqijxfmrdbqusl2vpbuswqmcvshqueaiw@r4mrmap4nwkt/

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
---
Changes in v3:
- Fix Kconfig description and update commit message. [Daniel] 
- Link to v2: https://patch.msgid.link/20260706-spmi-mbg-driver-v2-0-f883ff1d8719@oss.qualcomm.com

Changes in v2:
- Fix locking, -ERANGE, enum check, and flag race. [Sashiko AI]
- Rewrap commit text, rename binding file to match compatible. [Krzysztof] 
- Drop redundant comment, return -ERANGE, fix ISR locking. [Konrad]
- Link to v1: https://patch.msgid.link/20260601-spmi-mbg-driver-v1-0-b4892b55a17f@oss.qualcomm.com

---
Satya Priya Kakitapalli (2):
      dt-bindings: thermal: Add Qualcomm MBG thermal monitor support
      thermal: qcom: Add support for Qualcomm MBG thermal monitoring

 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |   4 +
 .../bindings/thermal/qcom,pm8775-mbg-tm.yaml       |  72 ++++++
 drivers/thermal/qcom/Kconfig                       |  14 ++
 drivers/thermal/qcom/Makefile                      |   1 +
 drivers/thermal/qcom/qcom-spmi-mbg-tm.c            | 256 +++++++++++++++++++++
 5 files changed, 347 insertions(+)
---
base-commit: 3fe08b9796f36ef437ab9328e7dd1e5ff2d66603
change-id: 20260601-spmi-mbg-driver-582aab5aa6a6

Best regards,
--  
Sachin Gupta <sachin.gupta@oss.qualcomm.com>

