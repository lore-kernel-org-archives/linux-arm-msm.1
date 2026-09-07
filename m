Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247A4431A50
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 08:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768838; cv=none; b=qh2Af8BUVk4NrGtR5MLrSQJf+fEfaLnxYtVDNvJZw8t0cMkFo9O62Q18GjGd008uy1tlK81XS6XIRy/s1JiWDz/veQTlQykzmQvkneoidUSOHcrKicPc/sQElehphz4o9Zb9sIxUQGMC6y0F1UiEtRHq810+b+TsLhzhGdkW2P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768838; c=relaxed/simple;
	bh=2PkCrrkmsu4vMoHSdZZ8ByoR89oUBJOzMlHa3i0gMqs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rlCu+cvxJKgjocqk4b1FexMPMkIvpbsY4p8Gv5MAHoB4+hjvf4hBsXX7Q9zC05Wn5Cgy5pKnav/ufrHbLuLQnkfoQofZ5fu0YIgz2qqz3a19DdZfsqVVtbyTnTCbVXTC3ngLVVGko7d9DuDBwZyTfh7MdxG/Li0wFyaPqRNH2gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kio9fiZP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VMSJ0OCO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kio9fiZP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VMSJ0OCO"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777dPl3903330
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 08:13:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iKZhBtC4xoReMl+ODu3+f4
	AYAN3pz02drrC1yYmG534=; b=kio9fiZPu65AWftNbSVpceSef6yf29QCmGAPGX
	wufKP6iDNfcecZe5LeRBsgRVNtC46T7qsb2cyfmc2PRJrFYL6S1Fo9kbeOG0MHU+
	VzfmNRiqW0ybbcPjVrPN0N4F/LpLhvXa92d//6NrAElUrmjo79vLn+nPsecIzrj3
	MaNzJDfy4buguaMJlGyfKd1Zg9U/C0agwJewIW0HtBX74IUVKc2v/XxlRGkSC4fK
	+o2VX1qGk3KMalDOmjPJsmKI5trgJkuvhHeKNSNhEIUFfe20RPQKBg7R4cv8cvdP
	X3DkyEHRs9CdL58rEYFwiDk969uRonT6NeYetNq56MRdRZFg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggany5u8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 08:13:55 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e9e0e71e05so5804736a34.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 01:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788768835; x=1789373635; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iKZhBtC4xoReMl+ODu3+f4AYAN3pz02drrC1yYmG534=;
        b=VMSJ0OCOd3ytWlYltAEQIlVyNF74Lb7LQwKmpSlgDAeG4J6fRKibzuAgINradZxdJ+
         NhR90HMj0xI4gqk4PqNrJmDMnSKeYVxlX77NoL4uVbP+4Bi9x9zmS/e8m4CUiTHhxAG/
         3PvQVPwn12deB1c0XBYz9TneKo5+9kXRk8NM9LZB9EE6cyc4Qy5hVW1qJ2bFqGW9t7ih
         EGFJSvLSDxVpqkOKPfBvSzuQLdfNIg3JKXvUXuFBNS4ieBmeJ0Ap19JGgnT+0s6xH4nG
         J9EQsrjR2BOL5Gimq0X7aLCQV++YRncBtyRGrdEFWH/RRzT/AFjKozCt1ir+t6FbRRuw
         2P6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788768835; x=1789373635;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iKZhBtC4xoReMl+ODu3+f4AYAN3pz02drrC1yYmG534=;
        b=mV+o4JUBTbEw5EeEcfHzBww7srTRZxEqzLKUssUfCQBKhZCd5+tFusJOpkcFfWtscF
         zKVJ/sc04/J8n2QhnzOjyKFtZRwUE13fgahJDHrWjbce6kjvDeDr41tA2hrTLeAopsEw
         21/x2KrgIErj9rhqTMM9wFlm48oKoZTUjcHydRMZzcJya4sAdPPDPzmpSIl9OH0vIss4
         lDsTHlLH8fz/l6KMfRYBB8txt76fvGqkD6L5+ZrxZI5nPrV43IrWMC6HmhLh6qLq1HEe
         eiQFzF/MQDnebBy2NOkO/dmAJqyzWrTOD1w+mTtTyJfXhHOzCZp0X7smQP0hd8TJR7KY
         K7Qw==
X-Gm-Message-State: AFuF++lFxteBVPtbXAdoFM2Ryir6X7BWBEn6X3HVcJce5eE1QXCxzzUc
	DbmOcJE4Ah16rnzBzDU2je8+3oDGJUVOPRlzgrTjxOUhZv0RhoKAeIwBmEbPcOJzWi5BxNJTwIP
	+ga2SMz/joBBHWd+xMLSGIIb7ZLXlV66gEmWyve6eBy+maN1wd0CeLr2VYcB41eCY6M+2
X-Gm-Gg: AYBFou2o9pcabhmHQS8yJkSf/2fJuf9P5YSewReYtutAoyozrjhj2XhQHhWjNiPYv/X
	aPTtHl5+2kpa1LM7x1KIWZ9tTotfJVK49VaW+oR60GusW2NoSsMlGRF+nAcOMnnc1V3qTeaEvWd
	+3hW8a0jYBpH6WeseY4hIKHdB2BZnTH+IfQ2juYCrOYv3ehNc+3pR8HvfSNJY4j9DJXsmgb9Fal
	rrXegGb/zlqBh61ix9hDdZQnYLDy8CzbFYKbwLIVaKsPydlkIJFBM6st/N6Hy0G5uM+48nzBBXs
	JZRwVjm2zvAfmmido9CLz6oA104gh1Xft2AcrUyHNlmdPGGFrrcvOJwrJoK7JAVs2WW4eXia5U0
	90LfGyvvs/pdjGkiV9HekDm6kIoZLnp4=
X-Received: by 2002:a4a:ec49:0:b0:6b8:d957:2803 with SMTP id 006d021491bc7-6b8d9572e0bmr6704671eaf.20.1788768835150;
        Mon, 07 Sep 2026 01:13:55 -0700 (PDT)
X-Received: by 2002:a4a:ec49:0:b0:6b8:d957:2803 with SMTP id 006d021491bc7-6b8d9572e0bmr6704610eaf.20.1788768834288;
        Mon, 07 Sep 2026 01:13:54 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm21724220c88.6.2026.09.07.01.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:13:53 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v2 0/6] Add CAMSS support for Qualcomm Glymur
Date: Mon, 07 Sep 2026 13:43:36 +0530
Message-Id: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADBynmoC/22P3YqDMBBGX0VyvZEkajRSlr7HUpb8jDagpk1UK
 sV33xivFnoz8A18Z868UQBvIaA2eyMPqw3WTTGwrwzpu5x6wNbEjBhhnFRM4H7YxsX/ajmGgFk
 tu5oqagpToFh5eOjsK+F+bmf28FwidT6XSMkAWLtxtHObCVlqo0XVGFOLTnNdKEZURSUlBhTEh
 SSiA32gRwhBJp02uyQbQQr8opEWLMOP+4ZXWmOCGeeEd1JIUojrYCfpXe58/40OobsNs/Nbend
 lySixGsL/f7ayiIqnGWjQJXB6dSHkz0UOh3wexyF1dtmnbtlo1XBaNsJ86N72ff8De8lzDnwBA
 AA=
X-Change-ID: 20260529-glymur_camss-27af71b1d3d3
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788768826; l=3428;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=2PkCrrkmsu4vMoHSdZZ8ByoR89oUBJOzMlHa3i0gMqs=;
 b=9rJF2OhCoF4yzMGqRFpBhRxrc+m1Cgcpt1ZSFaxPjzplyHFawOMqlIngtIB3UeUTJ+XPQqVai
 BBLhERQOSfiCXHWG4EgyyEzTUQSfdQP6zW6VYNIIFDE0QeoM7B1Uxlr
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=X45i7mTe c=1 sm=1 tr=0 ts=6a9e7243 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=0ARVRLQPdUDne_cnrioA:9
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 8U4swSi7eTDwiK_WpEp3kvTGq0AXgXaj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX6/pG4SKoo1sS
 +YDDqyJP96lwyASXeBRmTYhi9G/Cc+DMeAp+I4LAcUJb0lQ/3HrUQ9PfGE2FGuaYmpMc5O+L7ey
 KyTZ99vP4JQ/DdDxIDKWxL/i1pdAls00XFkT/jqqovp1t2D6oV2SlscnvzScBXFS5u9h5nGCF98
 NUzasxLX4PHoHKX45isAKqjvzGiw9qQKbh9+7QSD+7vW3joef9xSUOLHXhIt3Al3vcvgQPq76Sn
 1GLkcXx/4t2qQxQhbWGGD5HRzZMbhZkcZBCyFjd87RhzdI38vJuRaSuU6YN07mJ5t6ZAsblmJQg
 5Y0SlNmH77Uh/ODO2c13uyaqivZTm8NFK5IIECyysVFYjXj/rTCIApeu49N6yJnlMoK0uNp/Y0h
 w5QMVTwUWwvYxPIxf/ST+Hn0y3ttbg0iDQAHlRUTvVUhUN8En/CUnGGSoRPuHRL78sQhKWyS32/
 cKwskniOnya8pRP3qIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX+Q1sz6lbSAOp
 Xm8KhIDcEIm/2o3Nwg0t8NdJbBaG34cLka0KvN762N4rGuvkMlzqPTkZlo5SZMP8cmTRX9pBLVO
 sU58kQHEZIw4e0nJFh5ZeCjwjl7knYA=
X-Proofpoint-GUID: 8U4swSi7eTDwiK_WpEp3kvTGq0AXgXaj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070088

This series adds Camera Subsystem (CAMSS) support for the Qualcomm
Glymur SoC.

Glymur's camera hardware topology:
- 3x CSIPHY (CSI Physical Layer)
- 3x CSID + 2x CSID Lite (CSI Decoder)
- 3x TPG (Test Pattern Generator)
- 2x VFE + 2x VFE Lite (Video Front End)

The CSIPHY block is the same hardware version as x1e80100 (3ph-1-0),
differing only in instance count (3 vs 4). TPG, CSID, VFE, CSID wrapper,
and ICC resources are fully shared with x1e80100.

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,glymur-camss.yaml dt_binding_check W=1

Patch 1 depends on the following dt-bindings series:
[1] https://lore.kernel.org/all/20260903-x1e-csi2-phy-v17-0-26606fa9a039@linaro.org

Functional dependency:
[2] https://lore.kernel.org/all/20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org

Changes in v2:
- Glymur is now defined exclusively with the new PHY API architecture.
  CSIPHYs are standalone qcom,glymur-csi2-phy nodes falling back to
  qcom,x1e80100-csi2-phy. The CSIPHY supplies and register regions are
  removed from the CAMSS binding; they live in the PHY nodes.
- CAMSS_GLYMUR enum is dropped. Glymur wires directly to
  x1e80100_resources in the OF match table. The CSIPHY instance
  difference (3 vs 4) is expressed entirely in DT - Bryan
- The incomplete compatible + resource enumeration from v1 are collapsed
  into a single self-contained patch. The pointless VFE enum patch is
  dropped - Krzysztof, Bryan
- Add dt-bindings, MFD and regulator support for PM8010 I2C PMIC with
  qcom,pm8010-i2c compatible; qcom,pm8008 is not equivalent - Konrad
- Drop dt-bindings: i2c: qcom-cci: Document Glymur compatible; already picked
  by Andi Shyti into her i2c tree (now in linux-next as 7c9474bd4a8d)
- Link to v1: https://lore.kernel.org/all/20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com/

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Dhruvin Rajpura (1):
      dt-bindings: mfd: pm8008: Add PM8010 I2C support

Jishnu Prakash (2):
      mfd: qcom-pm8008: Add support for PM8010 PMIC
      regulator: qcom-pm8008-regulator: Add support for PM8010 PMIC

Nihal Kumar Gupta (3):
      dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Glymur compatible
      dt-bindings: media: qcom,glymur-camss: Add Glymur CAMSS
      media: qcom: camss: Add Glymur compatible

 .../bindings/media/qcom,glymur-camss.yaml          | 300 +++++++++++++++++++++
 .../devicetree/bindings/mfd/qcom,pm8008.yaml       |  14 +-
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       |   6 +-
 drivers/media/platform/qcom/camss/camss.c          |   1 +
 drivers/mfd/qcom-pm8008.c                          | 140 ++++++++--
 drivers/regulator/qcom-pm8008-regulator.c          | 184 +++++++++++--
 6 files changed, 583 insertions(+), 62 deletions(-)
---
base-commit: 9a4cdc958dd79fc6c3b20b51a10debec6ca09fec
change-id: 20260529-glymur_camss-27af71b1d3d3
prerequisite-message-id: <20260903-x1e-csi2-phy-v17-0-26606fa9a039@linaro.org>
prerequisite-patch-id: 4a27a90c3a55c1f9ef46e9b941576309242f75f8
prerequisite-patch-id: ec5e059c23defd7db6c47bb17d70d01c9c6cc31b

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

