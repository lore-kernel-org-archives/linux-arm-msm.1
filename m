Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB4A3F4118
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 06:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791354604; cv=none; b=MacRYkeOAXH34bhst21/zYfNVuOA5J3OY5oNUmMlFXlXcmh3MYRRpfcGFgwiFgxrKA2Yexo6UCP9fUuZjGQij8dgIqCh6vkhRG8QlhXLtt3vF0MetRGa0QUd5fjxhbN+jmtyGcOcJMf6scz2a56mN1ZoEIcs/+VE31YkQaAIEdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791354604; c=relaxed/simple;
	bh=UbxlUsVad51XjlMr7BHaxV3dWnxuikGfc2t4VeSwSBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FLddK27KZAizXys/G415gDSn9ZMuxe9UjPceZcQOGKnydrRHPkPHt5WALenjUU+X5bBAOK0ofyiUiOdfTvRthLrO+4RQDQA8WTA6Ov/wkvcJaMHEz7/k+IlgrnB/yq9NrcqNUUs9+LCdGIrf5h3rc+OamWctkb2H2UPw8ri5SVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fDa+s77j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UCZ2kF1X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDa+s77j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UCZ2kF1X"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6975Ntlq1566965
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 06:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X5RO6KrOqtQUt/yGDo9w7+j/X7O1yX9dfy86UnAtqqo=; b=fDa+s77j/RNxG1Vk
	7FNsYIu5E2xSFIS5YPGLdH218qQfnbCU1VeB6H1rUyYJWp2kpkuSV5xV5lOFV8In
	9WPjCfgo+uvdCu18NRNpJwFE9+lpaPz1NlG3v+MctOPuVjQ2IOfDRoOGazRKJQUU
	9edZplpEErATK3Q8YY0CZOjLPHlyj14uATqUWkhfLtZpI/sBv0PN4YZJUn2E/Al8
	WUEp4j50XBGMpE9CLw5+rXvu2AGdSAxH6d2SHE0nDt4rjouPUF8nTSEN/ckE9nsh
	DBZR1hcmzHmiUwAfrk5Ypk27dix4SDMl/Uozb+DGlopuI76ISGPJjhftH5WO7Rls
	cXpQqA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fw8r68x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 06:30:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a6d30f66c9so2104529a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 23:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791354602; x=1791959402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X5RO6KrOqtQUt/yGDo9w7+j/X7O1yX9dfy86UnAtqqo=;
        b=UCZ2kF1XcsmWtaUn4gLL1FuYfaNJePTHn1D3W+GHK0ivvb8/VMuIBP7fGRJbGtjBlb
         oEFm5lO8auYOC1AoTqH/g6q3k5ss61Xmu90Loi4A37idzRFt3/6DcjHI43IHy6tjdTr9
         KfxcX3yDiVlGGc8q3JT6OA26dmI7iFVoj358oJdpZiqJq4ZnlwAXvqe7Wy3DHdFpowx4
         BI47mn4XcV+kD6jMmoM/3y4/k78/On5Xevw97YOnrqwh9zyynkfEaBvPffBd4HB4pU0Z
         QEhdAM8rMIllfqeILFk96M6uuk/IhgazLBn6am45R12KMYodOeUwx2nNvzImydzGC0pm
         EMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791354602; x=1791959402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X5RO6KrOqtQUt/yGDo9w7+j/X7O1yX9dfy86UnAtqqo=;
        b=ZvVjVHXLXdQbRJfKop4LKQzaqdN78rohzEPElxuXWk6f+hj+IPJJIZPED+v8c7CVtU
         nz9EUzF/R74q0kiLtVMwZ+k3Oo/MGkZ+rx9L4NxJMGQifeBulOlncft3N94aUgylTx5+
         Ku2zc+zJuMs39Vk1byElwbd1r9F5LgXXyQBUTbeqFTegVIqokqYyV3AEop82FRp9TQ1z
         5ZccVUpGOygCqtaqJZsYlp+qEiWwfZvEkkFrxwQAX9XdsX3IYB68+t4fgAferHDpzBU7
         8zR5O7PJH+TqSptoA+LYk3AbGSNjbiWX7kcYtAFNGltvkLfAxNBLXpXl/DUjBnCP/Xwo
         q+Cg==
X-Gm-Message-State: AFq9FYIj2xhWti1nz403QMbMD2lAkWnJFJFmfTkiXbCyXftTMXpi+Yz6
	PwWpexrXQ5XobnRHENS2p8JgM1s0ypdq5pBbsOA1ekN1N4W4+DqzMAfIqpUtqCf8lqFb70aN6q6
	g0QDE37bTFt+Hcwmk2BhXCj5jJomp4H2ix466idMDq5ezaU+yNQGt0/Ga6UJUXlbOMDvy
X-Gm-Gg: AYBFou06PDYs1C2ldxenwTD4nXA1Dj9cAFrkBKQJlT1TQ0td6xUkc7Qcw1t6RcMsoSw
	WCbVTmeIjKSX14ldu0ixMeraJeJS1dACIZIYZo071YTMDhHp7Xfuy6Rqs53iOnUdp2meCc7Vl9q
	/omwdUW8MChqwSITrwJPnkWYXDAnNzvoauQx+elbdKM7cQtLJTp1hCb4D/eWFtKbvn2aRu0cWBx
	MIj5pAQNQZhkey7Ih9xO4iOn2pjmFiauxrvWWl4gKHqUhMtX/7LL2IGbU4Lh+CN50ajRCNMY34Q
	lPQWfTaj2AcswJ6rd33Mnpf64JmjqWIGqmVV7CJtRC6aMQL9VoIu4oqiVUnoMp0pYnltnFLf4mN
	lhFlnWTKCSw1lRegf0u9fkL+hOQ==
X-Received: by 2002:a17:90b:2245:b0:3a8:21eb:2e1a with SMTP id 98e67ed59e1d1-3a8a12be15dmr869395a91.30.1791354602425;
        Tue, 06 Oct 2026 23:30:02 -0700 (PDT)
X-Received: by 2002:a17:90b:2245:b0:3a8:21eb:2e1a with SMTP id 98e67ed59e1d1-3a8a12be15dmr869369a91.30.1791354601923;
        Tue, 06 Oct 2026 23:30:01 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89ab81bb0sm2972690a91.5.2026.10.06.23.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 23:30:01 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 11:59:34 +0530
Subject: [PATCH v3 1/5] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy:
 Document Glymur QMP UFS PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-glymur_ufs_qcb_enablement-v3-1-84cf4f861415@oss.qualcomm.com>
References: <20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com>
In-Reply-To: <20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791354585; l=1186;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=UbxlUsVad51XjlMr7BHaxV3dWnxuikGfc2t4VeSwSBE=;
 b=VDlPhQHPY80/A3c4TZb87pFj8z1u1YbRnTRRqhQ3i/QTowrosI0/f+9EodGI9A2Cs8stxim/f
 vQ8IPcNv3FtCt3aaBqHedQutRr6XTMxxNDTzejfWNzNxjSVheDLW8H/
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyNSBTYWx0ZWRfX8N+fO2MlBUKk
 I4sLkrhQivD+EyXyrBOwAPvU1gxzdYhdlWQbJrl9QMiAHQ/HTy2ilpEoTVPoJR89IGBb3f1QKFD
 COk3qOiP0OTqec0GsqZAzNpD99+OUaw=
X-Proofpoint-ORIG-GUID: 6qksFnR9wMRs_0SfY_QaXeVqhcIpFt3t
X-Proofpoint-GUID: 6qksFnR9wMRs_0SfY_QaXeVqhcIpFt3t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyNSBTYWx0ZWRfX3kwhb1aZwZOa
 RywufMBLUunbgfOBZVCQL5PoxLFcI8RFLXW+yoy24SQupU+NHX6yIzINJcRkDizj8hagzprTIpI
 rhioPR6CfiUp56slbfoatI74osam0srLVkmw/dWVf1/ceWrCLgVploF+VlVEjDHKtRtf5lkpxxt
 15C5XBUwzReSqZ2hDADFk02yzfQKWH9HOqpSFz3FhqmiqTsoGGgEgah+WM19Dz0wAMeFTvuzxrV
 G8IQwt50qN6sCPcULKMXBN8ySBIudwCyMgD06aE9iRuOGzLQJHEGOyb6xqqVde1656OBEUpT9cs
 jk2C3nxdjB2RJbkAU30xDqZ3xZkRBEDJSUaGEYVOZ4/CKbZcVpZS2Ggb8Y78j8XrdPP3FhnUDrc
 5UUK0JtLLsVwoVlaEomYeXgUohLB0FLHENq8Gk+U97vNDDAmMcLMn0/vHW25Nr1Fiyd6J6PxKPk
 zzu3VkDwTCcQCOhp6EQ==
X-Authority-Analysis: v=2.4 cv=Af0kjHXG c=1 sm=1 tr=0 ts=6ac5e6eb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BahsdhlD1VgbZ89a8f0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070025

Document the QMP UFS PHY on Glymur SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index eb289c09906a..fb631f906513 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -42,6 +42,7 @@ properties:
               - qcom,kaanapali-qmp-ufs-phy
           - const: qcom,sm8750-qmp-ufs-phy
       - enum:
+          - qcom,glymur-qmp-ufs-phy
           - qcom,hawi-qmp-ufs-phy
           - qcom,milos-qmp-ufs-phy
           - qcom,msm8996-qmp-ufs-phy
@@ -113,6 +114,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-qmp-ufs-phy
               - qcom,hawi-qmp-ufs-phy
               - qcom,milos-qmp-ufs-phy
               - qcom,msm8998-qmp-ufs-phy

-- 
2.34.1

