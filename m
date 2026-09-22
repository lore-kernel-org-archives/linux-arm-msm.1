Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5646D52FE4F
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071764; cv=none; b=MItuoOdnI2LEzoRjY8fsrtBP0ELmXqVU4LdLcfW0ZPfGIp9iqloKb6Sm8sPMkJpmdvdY7Xn257FL4KinXMdsCl+Qu+3LRPYhPaPDsX79OQpP2FscjwU0SVFd/0NkJaxdUdZfb0rkr1AiRozrR+teFqoHPyypUnB8eC9pOyqv8So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071764; c=relaxed/simple;
	bh=bin85GVzIG8p1h9hsVqmNzGpM9b9n77cuUtgsjyHMyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E5yGLFSIhcZeoJ17I7PDFLEplcdWyiDkBQZG6yoL1tB9wGQAdK6ZakEI0cwIkJbjeFGeJGKuqA4FMoEfalN2Zav+ltBHy0cqO56thAEchRHsdUjPjrERS506pmYCsln688dslsTWJ4zGZfRUe3i4kRWWwH64yzTcXPztkHRg0Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TeQawrQv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e77rx6nT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TeQawrQv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e77rx6nT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M9RgU81842268
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QE3vBUfsueLp6+xzBST6KK6eXznno2sjsZ8
	Ql02EPbc=; b=TeQawrQvefgyEDKnAyvfU++Vx9PppAdi44quiyFeEe9PqYRzGad
	jonh7kD+Um8itaSJslHLJAUyfsQ77td6nyap2JXSALcPp+k6WAwc97+GXmunnZd8
	duIa59EMuw8/3rtQJ9a+XpPHhC6UcPsFfGlu7x/x/ariyEGkXsJD54K/cw2l1CGO
	OSw9iDh4CV0PQZNod4u8yFBwcaSd/WeDSFNx9WovTKEmvOcKNnPUlz4Vu/3W85cs
	SRAqg71ySceC0k4742xfzK+LHJ46oRcg9mxDKb1FkhmwpQ1HC5tu0GJQ0viGZUMC
	yZ5X8ZDIZpVwSUodI02OwsGW6c9OoNvnEQg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj111d8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:09:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dd8920c132so92975365ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 03:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790071751; x=1790676551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QE3vBUfsueLp6+xzBST6KK6eXznno2sjsZ8Ql02EPbc=;
        b=e77rx6nTGADEMkkMJDVv9UQcnc0HJXcFbVGR2Gr3bMZvjDWH+KtVfaGX9jdtRZZzP3
         GNyszuUBIntC29gXd8wF8E21UTNEJO4NDApdkZmjaC6e7JFaaJmPBfWuoyNF8ATX5cVO
         fDqnXR4b8Jw0y9R6br90vGze2Q+GgPuC2UNXlEJhPe6VHAjY88BbgM0ZnoJSU24mEFIL
         X6sK5JM8MdMrn+g8RIYRzKS0rmN+xeXwz+Ym4fechYiQAWCt+EwDtrXFlBKKcF3ZQNrt
         y+s+MHp3EJLvcSUcf0ppCtrSn5DsfTEI4AVZPLaTvbMGJqnBZrPLS64ObnrR/32Nh116
         jLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071751; x=1790676551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QE3vBUfsueLp6+xzBST6KK6eXznno2sjsZ8Ql02EPbc=;
        b=sHJMM+UkuGMypJyOjPlbzdlSd+XUYNPPTbeGGaVWaUatipcpCIkh1qcnAev9GCHx2o
         GSsl0NNZ0uFFZoJ1qqI3RZ5LrjJTo6Q4jYR8fvn1/mPEDy34PIYeOU7odqKH7Z+DXw/k
         VSpvAVH9BLCvBkGfoWK8e3YNRuQj8OEkksJ3jivkA1INeW01JIC59ULA9kVN2QNOMKfT
         dtaY9i4qKo82PgiHwZqQSsCubuQwVNlsALpFjje0MjkZt2IUqEoYMCz3pXmQbex+AFGe
         rxnWjovAQGL7D10izfmi9RQdfVGYmSzFJEShdXVlCZuJm51EYtU4ccZclRRzGhe4n7TH
         XE+g==
X-Forwarded-Encrypted: i=1; AKwUvBwT7RaPS6OhCg0MO2Y4BrEl5cLWJwBLd6ylSpZaQD/NrhdH/D5DLQLrp4CYfeqDv8ByO/dlmUF5yF6YZktn@vger.kernel.org
X-Gm-Message-State: AFuF++n9X2BHKLA9WrtwWdq97EpSfbWpLhxwYUbAUsOqgKd4PX4Eb38o
	hcan/IdijDZBCJZvoqlqCVqh22ve5NPkG+9mUKfPkA4vIsYzcTzZjepCfhMXLwRFVc6F3nhI4wv
	mZRd1hfJAp2R7E8csVllR3GAWwZOrhdiDD1rPspfcziq8c+HVLeZr59q6Z8lEhs7yovGm
X-Gm-Gg: AYBFou2oFqHcxTVXcI4b+Kp/eYOmwt66gh0dWGJgD5OagsyPq0TMWcPOsWkqJRGfbHb
	a3LF9d/1PBEP3M0sk2BlbVyCm+/4f6V9RARl6hc+hcPCda9jjIpFmzLA1u7Gk6zNxjaS9hzlSFj
	ka+8UpDbdlfFJcSGB3aW+YxdywOY2T4NhTs19jqS4/3Yf0PTJXGbYSWaIyLf5wnRnUxhOjxHmpw
	XDUiuiXsw04+XRx/xvjNwT5O7lcFzolo6VhNSPXrFJ8nnbHTMVNK83daCmivIIRWuK7JXGqBmVd
	2DTUNC5Mbi6QxdwCohke8A/gXmatNbQuJ9gsXIvheixSSiAhZVJlFgGsHMs/BhF5PJ14r7Lg9Bn
	mreQUuSaT1bHBoZd2ONw/oTpXtQfJVblnW0l6V1cY0btj/USOkTdbDCH00EA=
X-Received: by 2002:a17:902:e88d:b0:2dd:c100:3140 with SMTP id d9443c01a7336-2df60b975b5mr6992445ad.60.1790071750520;
        Tue, 22 Sep 2026 03:09:10 -0700 (PDT)
X-Received: by 2002:a17:902:e88d:b0:2dd:c100:3140 with SMTP id d9443c01a7336-2df60b975b5mr6992315ad.60.1790071750092;
        Tue, 22 Sep 2026 03:09:10 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e612c9ca7sm5121502eec.17.2026.09.22.03.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:09:09 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: nord: add CoreSight debug nodes
Date: Tue, 22 Sep 2026 18:08:48 +0800
Message-ID: <20260922100850.527109-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: swwsvoBAaGAICLdwubC8A3l_LZunV9EQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE0NiBTYWx0ZWRfX1N8Gk9ffXIft
 BzlHzqb+6k3FPgKDtGwHESD7bzPWrMbz46L0eBOmbb/xCP1G0c5QYuRfSOP6hrLmoAtIeHkJttO
 l+SFneY4sN5vK57chlF9+ub9f/FeKvA=
X-Proofpoint-ORIG-GUID: swwsvoBAaGAICLdwubC8A3l_LZunV9EQ
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab253c9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=R3va9QD4umMSEl8p30sA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE0NiBTYWx0ZWRfX/s5yhFB8QXVR
 5ubbozJTQiCEXwmQ4goaUPVIxLoHLS3oWolQao+GzuKS5aGsI4jjlXxYaqgl8wFMeP+rskwZthi
 +EPhVDHpCQwX40clhd+w6d8UaH/rVgG5ZZAw3IhZ29qyg111UmUtkaUChfm0jB2+wG5Da04yUtG
 RTEbC761mA4tDko+bEfv1lLYRPVnYZR4KAvlzgaRVQ10QVatMPs8ptr2PrxVXXxZZlnIPDaPatV
 THe2IwPc8DqU4DUbLQjn4pA3XfZ6qtso3tD0KsalAWaVh+Fyreu2m2o42USbzW1NJxzFVjbztB5
 E/X30iICMc7MBtsKnWhtDedpQfyYyo42DiTpt2OyWobu0jRbgp6IEEa/rWMlyxwo03d0ndW7Do1
 7MH2kisQQ4I0JCyIBekN2//omHQSY1jwcxyRn7aOI0yf2RXwQttm9FIBBdASTDUv49TI38KEKtJ
 lkLwifqWbm6i2QMLZgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220146

This series adds the CoreSight trace topology for the Qualcomm Nord SoC.

Dependencies:
- traceNoC probe fix: https://lore.kernel.org/all/20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com/
- Prerequisite DTS: https://lore.kernel.org/all/20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com/

Jie Gan (2):
  dt-bindings: arm: qcom,coresight-ctcu: add Nord
  arm64: dts: qcom: nord: add CoreSight debug nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml     |    1 +
 arch/arm64/boot/dts/qcom/nord.dtsi            | 3540 +++++++++++++++--
 2 files changed, 3315 insertions(+), 226 deletions(-)

-- 
2.43.0

