Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5304B8274
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 10:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790676124; cv=none; b=kUw3DMEj0lhSjMGRFWX1AXDsjmyLV94/C0lD8hvZYy8rcB0nPtnT/+qbY786HFBVMyZiBc7tBF41GJ63PT7SOPOjFrsBRKgY/Qpb8r71R6RI1qtLVkGuAh656LWAoEMhlDf/4Sp269uK2UFyRR3vNc1ep+lKivxwLRD22n7DWjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790676124; c=relaxed/simple;
	bh=UbSjGL9e+/dLT7KN7lcxI4BnrAKdRxEjpy13ImBVeYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PKyeZf+WFiL6szROJdIL9PcqSrJUz5mNPHpB2m0PJQx4ROL1zdUKp/khFjJQNt/dnxDJf+jCVogN3SqDUNJ7N5PZRydPHcP02zvjQw10sCCK5FgdXUk1fzaqUPxE4gyRAFskeZXUqcfhGUJVphN0XXdZtngiLnxpKQ8ZQ3iAXbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oD0o86Ga; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d3Iaun/q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oD0o86Ga";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d3Iaun/q"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T9ljFq3437220
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 10:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rLJU5lUhIyReLzUTy9Pl+7
	nUZmp2oPn4L5lAZNonlcE=; b=oD0o86Ga5BZuS7ZS9ocHyDxhC5GEaOPJT+rRMD
	JOabk6UenhNMUT11SrVMn0kVqLyhgJvVbRLCyjCDLDUNXJajJ5Wq6OLdYliObv+n
	IGnQW3RuM/vzrqZlxWDZ4UHa6wIvyuWa0Tw8/askAXfhlJAndpzKmiZmq0CVc1l3
	ivcs8BhYn8Xdx+ZpRmiGlHmj4vCBGRho15LK9MWx39LvzAjwvJLf+UOEaugSY5xj
	y15ui6Xy0cmkIlkYPHlWRYqkiuReinwp382HLg+rvoatCTx7cyUK1f4aFlPEJc0s
	sQDzA1EtiHiXQAegV6LNE4woZr03dx+NhP8zumjrHxFSB4qA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0b0v81s4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 10:01:57 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86a880e91f0so5647238b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 03:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790676117; x=1791280917; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rLJU5lUhIyReLzUTy9Pl+7nUZmp2oPn4L5lAZNonlcE=;
        b=d3Iaun/q+LkQ7TFGi2TBqptE9rCd+AbpCTzpsb0R3FpBr/Guj+JH2dRFyYbXU7clgD
         WPqiVWp3303aRpNwmCkOt2aRFD+DuL9mVBIxT74meM8dDIJP+GWhIIQnesyvfQeWz2VJ
         LsZKAuSWhwBkEg57CgARHcwN9fy3KJ3/gb2NZ92/wog5ZvgnrlyKf2lzn5vXBYQBQXkD
         7nwd9E0skTMezbqInCQriIkf9Q7KbhI1GeQhxrUad2FQG2yoeLYEIgde85940WYAitnc
         IeqOIZIXnNYne2RCyFVkpd5wCkK3yXdBoOeDvlBw89aFHDnmqL1EKd9yeN5eYQnisRUP
         i/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790676117; x=1791280917;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rLJU5lUhIyReLzUTy9Pl+7nUZmp2oPn4L5lAZNonlcE=;
        b=Zz11qcgln8z6VjQtnxuc88hNGSVNekbvxvvz2QlfCRzVfSWxTFBkSNSNkl/VcDlAkw
         QvAPyx/C8H8HIfs+rHXnh2N+wZD1IKrVSipZ3NvODvUMl2OSgaBT4kr/Usr7GQwXOknr
         yAQhIRkBEM+mkiQDCb/nktWDUNLbj1zF+wdVAXiYYfI80urz+EjfMdvADwwXR68DkA9v
         54NyGiVA/RFpOkKX9DElYGlJ0z1Rm6iUOv28zgOmfhVgSVvZGgZqTBSpBzI8H2jIRM9V
         XqdVbgy0RbryJKDTW4OuY07SxRcggzu9HlARJyIXa6nFC9BlX3GhoJZ2Sa9Yd6R0F7Pp
         cShA==
X-Forwarded-Encrypted: i=1; AKwUvBx2OWPBdcgc9LhRRTD36zV5saXV+lq0JetQstOgFnfvR6432UrDJcH/yCn3uvFd4wmbW8uygpx2xjJ3LuT2@vger.kernel.org
X-Gm-Message-State: AFuF++n4iHeAgnncjZYb3e2pxzTjBxwpo3SRZrSHeqjQZaxPfcHj1pBV
	a4jYTPqA1vXgPzXyJtP2AhGdNj8SsfniPZc3VG612v8KVryrcthQYyb3PPL3rEbiQx+JP1jRTCu
	78RJ8hJ12EcLeNXR4fVTXBAVJLVnGtHEHOEfrBgn87ICJcSw3AFMstikbn/iwyiV2mKYS
X-Gm-Gg: AYBFou1nqqgYDHanYMs+3vGIF4wCfWrzseDld2oL1TwkIixmTsEojmFwjwToDGQq2aA
	XvXJPNFx+YWWHWJJAIPltosMUyUYCV6Oc/8j33npeWF/7JT6IpudtC07q4Xm4ao5fPWfF4vKW57
	iw6a/Gv4LsqIPeWftNbOw8au+nj/PS+aPI9i05+AxLrShJqw13kRx93zRPFP1XBdgL4OnlSpWq+
	cZCf73UHfwQDglBfSWAenq3jvkvwA0KjxN1NvTV9qqSfn5Wkk8oWvHtKrOhwN2D2GJe63m4riO5
	iXXre19mwtgpNCeIWPks7pA8sflmO6lDlNFARO5x4FLHJoTahjHO29aaiYw+jOXjtz7176IUqiI
	AsJIpmyy+ylh26BI+AgGwMnxdFvy7Iw==
X-Received: by 2002:a05:6a00:2290:b0:881:9cb2:b625 with SMTP id d2e1a72fcca58-8819cb2c382mr6437768b3a.9.1790676116628;
        Tue, 29 Sep 2026 03:01:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:2290:b0:881:9cb2:b625 with SMTP id d2e1a72fcca58-8819cb2c382mr6437685b3a.9.1790676115532;
        Tue, 29 Sep 2026 03:01:55 -0700 (PDT)
Received: from hu-ysiddu-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885defd736csm547963b3a.8.2026.09.29.03.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:01:55 -0700 (PDT)
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:31:29 +0530
Subject: [PATCH v2] arm64: dts: qcom: shikra: Add WCN clock to wcn3988-pmu
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-bt-wcn-clk-enable-v2-1-7a90902f3df5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHmMu2oC/32NwQ6CMBBEf4Xs2SWlIAFP/ofh0JZVqthqF1BD+
 HcL3r1M8pKZNzMwBUsMh2SGQJNl610EuUvAdMpdCG0bGaSQpajlHvWAL+PQ9Dckp3RPWLckyir
 PC6UyiLtHoLN9b85T82Me9ZXMsIrWRmd58OGznU7Z2vvnnzIUmAtNVFWmaKk4eub0Oare+Ps9j
 QHNsixfE8h6AMsAAAA=
X-Change-ID: 20260925-bt-wcn-clk-enable-9de068334aa1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        quic_mohamull@quicinc.com, quic_hbandi@quicinc.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790676110; l=2838;
 i=yepuri.siddu@oss.qualcomm.com; s=20260603; h=from:subject:message-id;
 bh=UbSjGL9e+/dLT7KN7lcxI4BnrAKdRxEjpy13ImBVeYY=;
 b=2UQuQk36XZoDlpg04qfIkoXXCOQIw8+4Lvr8Rl13mYnTNoriuPzrro5v6DFVKAINutfkNbe9g
 BfyTtE0GMrdA0SdMwpTIuYBf62YB92QhhVrmC8bl+6y4EtIIgGsQhuq
X-Developer-Key: i=yepuri.siddu@oss.qualcomm.com; a=ed25519;
 pk=ldEQwkUmctxwDtIVURg3xvXfzZavX8decqpk/pVLQZg=
X-Proofpoint-ORIG-GUID: kKgc5ICMwTdVdk8eZDG_gJv1PWBnmXkr
X-Proofpoint-GUID: kKgc5ICMwTdVdk8eZDG_gJv1PWBnmXkr
X-Authority-Analysis: v=2.4 cv=Z+55j3RA c=1 sm=1 tr=0 ts=6abb8c95 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=nywYmDCMRSA-jTRoS_oA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzOSBTYWx0ZWRfX2dxygjuMSrRm
 h9tL0IafdlJa24TxGIoRuv8cqAOXQsk4zXTROW/tHa+zQqBpTsio7WBqufnDKFTR45j6GqZfK9/
 d6PfCdbe7U4td4sWxKviLHsDB4ZOA46aMh5AQzBjxrVTYFhD0yt3SHyHkdU5fblIISwz29XQjam
 2C5mo4Q1PdaCs1lIYcfzq3ObRwcA27NVRYzDaD/5GofT2EB93LieocFesxKuuu0mQzvfHjlO8kA
 x0oWruUxAG7x8iI75p5hx3tZl5Rax69oEAv1KtH4VvZnQlHu9Me9rRbDqFCgN3vb+Ph8Iu6cgsR
 7aFHjP9wMStBtalfSNNAgGbQEO+TxgMLbxYykw44WTW4XJEEsCjywVxiTRzfA2wiMpIMW5880xL
 8B16ju9bg/NpiO0qoyZudrhHohIUKUUj2+uPdHGKaSpxVL094TicjrTcuAfUt/Lwilvm2Nn6zz8
 dv2TC1v5T+fRv/CF0oQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzOSBTYWx0ZWRfX+ekgTS4khSVQ
 GhyOJdXAsDIUmeUBslCYTFuJNvemhHOcRVaayOIWoXnuiXWHcglWYqq1t2/uCKcxP8f/wMerfXt
 1l+1ACWB1WqGwQfTu4zgxu5JcpL6odU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290039

With RPMCC proxy vote removal, the WCN clock must be explicitly declared
so the wcn3988-pmu driver can vote for it during WCN power on/off.

Place the clock in the wcn3988-pmu node since the PMU driver owns the
WCN power sequencing. CQM SOM uses RPM_SMD_RF_CLK2 while IQS SOM uses
RPM_SMD_RF_CLK1, reflecting the WCN clock assignments on each board
variant.

Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
---
clk_smd_rpm_handoff() votes both active and sleep RPM resource states for
every clock, keeping them non-zero until a consumer takes over. On Shikra,
the BT WCN clock was surviving on these proxy votes. With proxy vote
removal on QCM2290 [1], the sleep vote is no longer held, which means the
WCN clock must be explicitly declared in DTS so the wcn3988-pmu driver
can manage it during power sequencing.

The clock is added to the wcn3988-pmu node in Shikra DTS. CQM SOM uses
RPM_SMD_RF_CLK2 while IQS SOM uses RPM_SMD_RF_CLK1, reflecting the WCN
clock assignments on each board variant.

Validations:
- BT enable/disable verified on Shikra CQM, CQS and IQS EVK boards.
- Confirmed WCN clock voted on BT enable and released on BT disable.

[1] https://lore.kernel.org/all/20260910-clk-smd-rpm-skip-proxy-v1-1-1cb5694a99d9@oss.qualcomm.com/
---
Changes in v2:
- Move clock property to wcn3988-pmu node instead of bluetooth node.
- Drop hci_qca driver changes; clock is managed by the PMU driver.
- Link to v1: https://patch.msgid.link/20260925-bt-wcn-clk-enable-v1-0-30bee88c4de4@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 8ac42ff625a0..48af2bb87cf3 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -45,6 +45,8 @@ wcn3988-pmu {
 		vddrf-supply = <&pm4125_l10>;
 		vddch0-supply = <&pm4125_l22>;
 
+		clocks = <&rpmcc RPM_SMD_RF_CLK2>;
+
 		regulators {
 			vreg_pmu_io: ldo0 {
 				regulator-name = "vreg_pmu_io";
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index 4ff97945274d..90aceaa6e1e3 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -52,6 +52,8 @@ wcn3988-pmu {
 		vddrf-supply = <&pm8150_l8>;
 		vddch0-supply = <&vreg_wcn_3p3>;
 
+		clocks = <&rpmcc RPM_SMD_RF_CLK1>;
+
 		regulators {
 			vreg_pmu_io: ldo0 {
 				regulator-name = "vreg_pmu_io";

---
base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
change-id: 20260925-bt-wcn-clk-enable-9de068334aa1

Best regards,
--  
Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>

