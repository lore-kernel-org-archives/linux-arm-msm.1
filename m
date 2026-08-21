Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40234B0493
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 14:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321080; cv=none; b=GP+0NLMoooGpJW4W3/gjE2EK/EBsUgs76e8aljhscUnVM4T9GRtbLIK+KTJS3YacvW7sZ54iUoq0heX/ylhrQRMvCK2A5vutWKJuIvbU7F1OLxa2MTgu2Wq8ZWCjsseT0E4VLFXPL/ARk88RbWCN2sVZR8wFHV9cD4Q7MY9h7zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321080; c=relaxed/simple;
	bh=6GLFG1xTRIWRPACFXwQMMhT6WrpmU9NK5zNbhPiyMi0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=urb4/k9/8eo+xBYZF3G6d1hXt9LJ7gkdSGOIp1GZs3j1EfhDny8hWwjuSDjuboP0QHgZfoa86tYX8ax+M3jKD1r0+CbioltsXbXKcsMPkGYu09XKM8BEuPue9+q32Fkiu4c5pK3Uyak6Quae0/imqLSzsRMJFAUCoHoI22doYZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EwFUvOE3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cUkIS1A6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EwFUvOE3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cUkIS1A6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LCoefS2444311
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 14:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1Tar/Lunzf9G40x6czFLcw
	9Y9DM0E2NsiMtk9ESF9/A=; b=EwFUvOE3833BMwBcbmFb5AYJtnnpMXUl9LFLhd
	dwpySnAoESyJf/6F+OCtWeHsq+lfGyVBOK2DSCnHbYatguTiavQXhpYVmXyDBu1i
	B2aKE4oSErTVEWKN/kwOZxxA4ohg80JXSNPSyrj5mCyG9POqe6hGm97H3EfgQnUe
	iYGb/ltwXWKdnKCtQjT9zLgcqs/qCJjPUPJz7MESBa7ES7P9Qh64cEEJtFRYhwCT
	lI+PuSyURR8u5akBN1ggs4di47jAeCZP+Z6alWtIOYsqA9kpUseAWAdUTeP8eo2S
	etzarvghKxaLsywgEO4/FRzMh6XuqMjUBOtLB6W8WaVfqmGg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6cdsjp9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 14:04:37 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbee8d434b8so886649a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 07:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787321077; x=1787925877; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1Tar/Lunzf9G40x6czFLcw9Y9DM0E2NsiMtk9ESF9/A=;
        b=cUkIS1A62eml090JruDjDMql4m3+8VT9xHRjYf/wRN7W8SmpM/iv6Z09epTIJj7cGO
         Mhg8Cnty/5cDjRcx+KcKTGQ644OqulDVpLdYGTWSIvMP6LFK2AoyLdrn0PgJHLeaHyM4
         FIPnKWeshK3m19R21Cl6jL7WWz7bdgYOxtzISYweCO28ObEU3aaa5SPLEov9SsyDBEHA
         IsQRFxCwec/RJRVmxhfzXcIiv/piNeUz4DGaq4Qbk2BEFGA6CQkHnycBQO6VLpFsJ35m
         G/soIwBZSOCzvS9oJyQilnxAhfl8dY+hfGk0KCwoSv8ID4YgGVAHM2hPkMPzP+ABeHRm
         TK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787321077; x=1787925877;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1Tar/Lunzf9G40x6czFLcw9Y9DM0E2NsiMtk9ESF9/A=;
        b=NcUCz/Ddu0DfGgWBeTURcUyneuskb8s0SC+ChOL6Jbg9l7qfLVprBRd4QJQqddV1Bc
         1sWR9h5P1RsVagYpEjnRL9Xu+o4743TmsQDeDRB3+plh/nORko7ZgmQ/I4pLG4gDOb9f
         8qq+NZZD7+p+7J65sFOcymmDsFr77iX6m3h6UrL2NhfH5iHDUuppURhmz1HdzlZYBsUT
         R7ALpnlT+mVkfkyjH2rgod5YN44+99J5i02Si9iOR7lWlb7ApURB/oQtcs0U5fnfOuc4
         QcVdkPpseE0CBu7Bino6tjUTBevhN68V9Gy8dUCWPtW+wRDt4ZPC8f3UDOC3dswhNJ9X
         TUag==
X-Forwarded-Encrypted: i=1; AHgh+Rr6OkEXrnh+UdDTe9ShJwh1jZYVWJL1qYEWBkrK2fKOBuH5Ubzo7R4WNh7IJogahufnABhMdGAYqKU1ZIa+@vger.kernel.org
X-Gm-Message-State: AFuF++l5zVMi1Kyo0Y28LEdVJYtGxNTG7TmhCgQT3yTUVh3/qwxxF18T
	E1ZjFu3mNNIuGDW5HO5GUQ0GEsCePrevYgCfqy6haItFNerCKqumGCkKBFcweVp+oW/EuKKvW25
	F4bzFW5qZi3I/GGrHGbYpA5sFsLUQ8X2JXd2OmjKNXS3/KVjhLJPvAFf4WpJivy4Usi0Y
X-Gm-Gg: AR+sD10DOw717aJhirywams6g5zAyQrdIuyFkupKlvBHT7Dyy7i9XD6aRqsEpsahqbZ
	UIHnPm6GxSDy2j6/1mdw3KWvUaPNRYVqprRLKtMIVWMjrSEtFpmH6CT6lVHuPHpN9PqYhI4OhNE
	dgcQcYE2X8McOSIUFm3t2CSz3k4VNuFcdBNSXDbx7OIyLSk6RhvSPmdazqm7qFQW5TJiZ0uNUhV
	npYyc25C3lSOnXlCWLhiweP2pX8myl/4RMrRN7QisdqESVp6A+dQrrMrEw8Ag2AWSUUonRzhkRL
	qW2ZWiTQAXtF0FTIhOg3S+H/85a0/Kr8RZMGGxKQNBHo3KlkyvOS/ISICqRe6gPPPbBidQ6Dmfe
	YtMk2hdVt0uz+y5Omi+GLYIpLadfz
X-Received: by 2002:a17:90b:1dd2:b0:385:3ab:fecb with SMTP id 98e67ed59e1d1-395c4c98f17mr6367507a91.4.1787321077169;
        Fri, 21 Aug 2026 07:04:37 -0700 (PDT)
X-Received: by 2002:a17:90b:1dd2:b0:385:3ab:fecb with SMTP id 98e67ed59e1d1-395c4c98f17mr6367427a91.4.1787321076644;
        Fri, 21 Aug 2026 07:04:36 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c45530absm3331680a91.4.2026.08.21.07.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:04:36 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: shikra: Add CYPD6129/CYPD6229
 Type-C controller support
Date: Fri, 21 Aug 2026 19:34:30 +0530
Message-Id: <20260821-shikra-usb-dt-v7-apply-v2-0-628885fc1d0e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO5aiGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDCyND3eKMzOyiRN3S4iTdlBLdMnPdxIKCnEpdU0Oj1OTkJANDi0RDJaD
 mgqLUtMwKsMHRsbW1AAMf0NhoAAAA
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Akash Kumar <akash.kumar@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: VRlCtjSC0TkyNLAE-gUkwCWzJQ9gEzZw
X-Proofpoint-GUID: VRlCtjSC0TkyNLAE-gUkwCWzJQ9gEzZw
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEwOCBTYWx0ZWRfXw8MbXEXu2BJO
 czqxXT5BkbbjmP10n+yJrh4WyzhLS4El6cNtbecPNIWmAQLW8iIN4BCgYTxno/owQCnfaOvZGa8
 aAbRhCMbxR1LhYb3fy0ubKQRxDJH18Y=
X-Authority-Analysis: v=2.4 cv=RN2D2Yi+ c=1 sm=1 tr=0 ts=6a885af5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=M24hfkB29sIHyjEHp18A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEwOCBTYWx0ZWRfX8VAygAeNd6TX
 8qi6wKxzFOIMbwOxLkSjaAMuFe9gpOtLNVgHxsPvJH/RgnJ760aQPxS2lnWdcd97irJQdr28Lkm
 OFgJQx4utaJrZxQA7EpEa8Sw2lCW/C5NI+K8zGINg7e5aXgtK/yPRZtGQSms6BC3Kpb7PbIWF14
 dn+JwLdSKWMsJHnGWFJ24JysoeC4kTj3lgY7kRiTLLtimagN0h2l9RXh9FLybZEmFk5un7Dn6tx
 RdrdwwGaooauS3MmY0TV0QZCYI/gH0YPLVGSpxcp93PCXzEN1SaMRn3KqP/RnbFrF67KoGdWABa
 TkSAqNvmQ1iWTVjNctmoRCuL7IXp7Ic/aDZFr0GtNyitm4WjlbG+BsW2fLGW9HbRmqAr+xdLBws
 /+KwXDhSixpRgbnwMETiHjELXTXUn1HBbQJCjbNGIpVGJL09si0GzN+LeTVp9d6iLgCd2c/4GPI
 VCrAlFtdNTw394EHSSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_04,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210108

This series adds support for the Cypress cypd6129/cypd6229 dual
Type-C PD controllers used on the Shikra CQM/CQS/IQS platforms to
handle usb-role-switch, and wires up the corresponding DT nodes.

Changes in v2:
- dt-bindings: add a top-level "wakeup-source" property on the
  controller node (matching richtek,rt1719.yaml/ti,tps6598x.yaml) and
  move "wakeup-source;" in the example out of "connector@0" onto the
  parent node, since usb-connector.yaml ends in
  "unevaluatedProperties: false" and does not itself declare
  "wakeup-source" -- placing it inside the connector node fails
  dtbs_check. Also fixed related whitespace nitpicks in the example.
- dts: apply the same wakeup-source relocation to all three affected
  boards (shikra-cqm-evk, shikra-cqs-evk, shikra-iqs-evk).
- dts: fix shikra-iqs-evk's cypd6229 node to use the
  "cypress,cypd6229", "cypress,cypd6129" fallback compatible string
  pair required by the binding, instead of "cypress,cypd6229" alone.
- dts: fix shikra-cqm-evk/shikra-cqs-evk wiring so CYPD6129 connects
  to usb_2_dwc3_hs (secondary port) and PM4125's built-in typec
  connects to usb_1_dwc3_hs/pm4125_hs_in (primary port), and add the
  missing reverse remote-endpoint links on pm4125_hs_in/pm4125_ss_in.
- No changes to patch 2/3 (driver match table).

Link to v1: https://lore.kernel.org/all/20260820145036.2035641-1-akash.kumar@oss.qualcomm.com/

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
Akash Kumar (3):
      dt-bindings: usb: Add Cypress cypd6129/cypd6229 Type-C controller
      usb: typec: ucsi: ccg: Add support for cypd6129/cypd6229
      arm64: dts: qcom: shikra: Wire up usb-role-switch for USB Type-C ports

 .../devicetree/bindings/usb/cypress,cypd6129.yaml  | 107 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |  84 +++++++++++++++-
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi       |  45 +++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |  84 +++++++++++++++-
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        | 107 ++++++++++++++++++++-
 drivers/usb/typec/ucsi/ucsi_ccg.c                  |   2 +
 6 files changed, 418 insertions(+), 11 deletions(-)
---
base-commit: da0b33862d815a7c88f2a809e40b098a15a2faad
change-id: 20260821-shikra-usb-dt-v7-apply-512eccb018a1

Best regards,
-- 
Akash Kumar <akash.kumar@oss.qualcomm.com>

