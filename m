Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF0228F5
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 03:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788061661; cv=none; b=aQ3ZoZSl7aPM3ba9Fh2vniI/d9W3eRiiyvZu41wAc/qAITGitTqCKAgkRQPGW+vNQwZGns26IRhhwa+my1Hlm55Zv/o//ABSK57zEoloLI4P5rKGXDaDvmFrL/IUjqlqdAS+GRqk6D6lD7U/TXv0+u5eoqEqSoxR8v3ymN2T+5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788061661; c=relaxed/simple;
	bh=RZhefy0Bru+3z6+0XZb/9fKH1WWUBSNbqtpfus9KhRI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e8amRZPVqUCy48jd2R6P909ctiP8LquFctH8x3R3rCABfGblYpOQABoxqJcPh6/Uka6eLahHkrS7kaTLJs2W0grsF7XrzbvnjMwdfwEh6I88kUMcxX/KGCZ4tbdPupFvQmH41EbTWsF7szzy14Kb0aAiXBl0dg++XAdP986dR3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hn3cyGjF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LPNRviSq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hn3cyGjF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LPNRviSq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U2SCDN3566597
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 03:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jHJJEw2EtiBlaQK9tLUvewM+mPfWsn35SgN
	iG8dIxo8=; b=hn3cyGjFJLwi24X75Y3rmwKbbhGtpQwbGcWaS4tSrnYlFpjD7wS
	Ihgr2fcD0aeH73tfDatMHwenzo8OCNeSv/AL3Rod2v122Sq8IjrVeMdBa5w6pSA0
	HSIBIvkL43F3z3tAMXhJQsNZRTVSplXTmr5IJfPdXgRUNGa6izFftL1+0DqLJX6X
	fImMKbPlkrp+Bbs/iowW8E/0XRhR7Ki/5zK9LmHkO+9bnalwZgUMJ8GMTAFmIa4C
	ukvXFkMzuoILgGaQGJTnFkLcG3FM5A6847ywkK2j+WWSycZvgQV0q8Rj0jvzqfK6
	TQge4biOHz/9DWAyGPAEK/YMWBDV1yHJwqA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqn2j913-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 03:47:39 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb835525b10so3161359a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Aug 2026 20:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788061659; x=1788666459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jHJJEw2EtiBlaQK9tLUvewM+mPfWsn35SgNiG8dIxo8=;
        b=LPNRviSqwYdZHmb7A1kPkgCYHC3s3l+/XUKZeeF3Rf+B+baldZ4KyoSo++SZEDl/AX
         I0+sHSL5MDeqgQf07NElZnni03ae8YYGzzXQ1+NcuwIe0UcqhNx0tNBZkL74EKP5C3gH
         6BchpisaWU6jWviVKainTyKykWGY4IkbiIjWCCI4w8PfFSbyczG/Uy8foUYIawQf0uTs
         VN5LP3qVU1wUt4NxNGeIic4FRFY2Td+AmY6BzvIhA2x0iv7S/kXP0xggMjl0FHSOanVk
         ApeZdTzxpHmxkzcLO4VoHxHRiFwneaHgRZSQUbttRbYrE7Ev4apBU+TBMvj/0iDs7aIb
         pTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788061659; x=1788666459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jHJJEw2EtiBlaQK9tLUvewM+mPfWsn35SgNiG8dIxo8=;
        b=nZ4Oxr2B1zsCkKebTUYAnRnvtWQ8QzytfbbJHsVujF3Vo+ii1iF8TsokdujoLw0QOH
         TZzA95/TY7O/y9rgz6sTPJjN5lhRcfR1cHocrrS8g9Fa+k4EWQpWYlpO4VbM8XLp6wgq
         DdV41B5oa5a6ejNY96J1E4d3dTFdPV6PJmudEFWLuxYdti1yXU45v0kDN9HVpcA/yfwh
         xcHlIbS74NPgqvGFBj4BeoocmPTurqtVFjwUT6hFc6BXb/UWDeHPmhNsnZYXcnkiWiZv
         37TeyWAnL0FQr0PnlkVJMKJ5uFJpk9GHJ8szT6y7YcHTqvu372/4q7qknq1lPRPMmFO7
         Hmng==
X-Forwarded-Encrypted: i=1; AHgh+RpdLa1eIi/2T6CVUAmVayi8JeQskrXGWx2JzHuKlm2p226oCUiop7dymb2IrIuFizNq98NwWPHfDTwyhH3h@vger.kernel.org
X-Gm-Message-State: AFuF++nwfsqTyDGqOnWgpu4N7GqkZxpWlNlpR7HysGYBdaP3O94hTYsg
	QUyrPe+d1HPLLzFFcPnhv7s+9nSqTEmlqtKBs96IfjV2X1xv9RAtuhYHnNhpG4xoE7hjTsUDWlj
	OnKqVcwxrmopZgf2I61m7w1JVafi1qbwPt6yrE1qDvz7SOE/NKZzSREzcAit9+FWXJAXN
X-Gm-Gg: AR+sD11VVxPwbZjtUWUYxVUnXtQs1szhDEaq9TdgyNG24crx8FyFvRZUa0nWNNj2x4N
	yz2YLwVC+lk1OZ6UiWzQhEYXlg9cXfbk5CeyfRSzI67IyKKnrbMGoyVUe+00Lkst16DuJsdsF1s
	qHXKmIAxeSiR6j+bfC/C+DctqqhL634L8GdmUs50CLD0ES7oEOxtsDncGce/BZNHGjFPMQxMzGN
	rcDn2RQ1BPqEzAF3WK6KF7LhXSshyhoiFR5gitk5LviT9MnvftoOz1Chv/NJWXpMcxSZAiTkCtr
	vWcCmeTSFGPmwj0L7hRxX5XP+f+ZuO63VmERonTKsC85rHBzZlN2xDui7auIp8reCZ3C8Kwytio
	i4p6cYfRThoyA/m0uwNFkGz99cDUK/gCfk1QYt8RbZQI8Dubkucqn58p1hRRt
X-Received: by 2002:a05:6a21:6b17:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3d26657278fmr32456201637.6.1788061658708;
        Sat, 29 Aug 2026 20:47:38 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b17:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3d26657278fmr32456170637.6.1788061658310;
        Sat, 29 Aug 2026 20:47:38 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f8094dasm20956768eec.13.2026.08.29.20.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 20:47:38 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        mfd@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: mfd: qcom,spmi-pmic: Document PMAU0102
Date: Sun, 30 Aug 2026 11:47:19 +0800
Message-ID: <20260830034719.140213-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rC-ejRsi8N4VjrQMaWIHL8IAz2yJMuzq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDAyOSBTYWx0ZWRfX687y+yZpGD4G
 Gwq7jX7mH2zDOH31+YvpJ12yMvktoE2nP+x0zkg9iaajr5sPpRWLbVix+F+wqMMOT08ZIw+M9ff
 PbkJAdNuG5IVebF2eBS9KXoxANt5yvwT+X+1aDx0gUtxFhzkNx4tbScBdKiW2PXtj0X4ppDk3iI
 LrKr/1ZG0a8YMYN+6Qdr7KlrFfXnHVxn6dzZjzlJGCTssLb2vKwtFFNr8qD1A+roFWE0JyjMdJv
 S/2lpRwvHbz43WC37h5/mDA+NfcWM61+eC+A/7b4qlanSMDROa76x9PQvNRoF/L76Q4p+l5rdk7
 Ecw/RiSUZKrkoK7fy0DNdUpHaqSaKqV0Rlqj/T3+JeoSvpAVnn2Ch66Ns4Aw/qxyWLXGBKw53lr
 LtabR97x+c5xOn5KpTJH1qPqGoEsFMY9V9MdmmLbE9RUM3DSNOxIt8BdqOSyXYpJDQQP4P7dPQM
 JCcmIKjIAzgs++7Ho2w==
X-Proofpoint-GUID: rC-ejRsi8N4VjrQMaWIHL8IAz2yJMuzq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDAyOSBTYWx0ZWRfX2xg7JTxc4Gwa
 UgeKGx2GcF3CIPP8x4bi5ghop5MNctsTpF2gL4BLujvmR858nNovzYSN4K1V3EAHXglwpylFYM1
 B157TXnWpCK1GbiYpj3km0jEQP2t+8E=
X-Authority-Analysis: v=2.4 cv=a5kAM0SF c=1 sm=1 tr=0 ts=6a93a7db cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=GXJ8kvFa_VRzmclzPfYA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300029

From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

Add compatible for Qualcomm PMAU0102 PMIC that is used on Nord platform.

Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 5e0ed30a9a46..f6534e9e9912 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -74,6 +74,7 @@ properties:
           - qcom,pm8994
           - qcom,pm8998
           - qcom,pma8084
+          - qcom,pmau0102
           - qcom,pmc8180
           - qcom,pmc8180c
           - qcom,pmc8380
-- 
2.43.0

