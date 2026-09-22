Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB59B3F23DB
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 09:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069705; cv=none; b=i+++9q/c1ntnT3wHe997pQw5SI+tcNY3iHZcExXONUklEyzN48lQr2IKgJkq6f+KithByXvkmhX2V2/IbNj/yWdz1dwbky6bRU2T95RQvkpiLHAtk3VJCJM2E0eDGurTr1Qmtlxo9Bkfn7Z8FRTJcUwTtxv9kzR+5oZ5cnBPnQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069705; c=relaxed/simple;
	bh=4yHRISADwcXmXHkEvPtX4i1nkkFdIl/OqWOHML1YXn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HdDkl4p/UQ8MaSQjUlgGy5ojD55GB6eRvuKUzj4RTFWfw+sZwpdvy4zjd64iY1iI1DvvvhlIiBFBd2mOFZAvesQe0Jk+HE/AQrvu37gzovBEy95JGV9AUFfJBnSRAXiqEIBqhZejvK6rs2fUtWhUDKxN1uDeHxTchszWOM1ZHY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CcKEBkxh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IFnkjoDo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CcKEBkxh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IFnkjoDo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M7027s1978678
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 09:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4OspiU7ZLQWHMjkyQ58rangZNdkNtmqW5EQ
	juhQ6mdg=; b=CcKEBkxhJOgjamGcyu8+HIhRHbxYAg/QqzTMhjC0dPB0lF+REUD
	vMJ5UPDZxC4uTfICuohSClyuvvYw/GOninrocbF3WNbX/hy5kVPocA1xEWPOcHhm
	12pnenHxfU6lcq15lpFKRWu1nkb8fECYBpNw9TZSG4NIH/Xy4eRZw5f4Spy8N3Zm
	40ePL9mEmU6EbbDEy2gOrn67792kC4TLscFaCDtphH50BW8gjEKm7EHQVpdPhbpN
	mM27JfGR3bz5Lvf4gbmYcjIQDgwn+bWFheyakkoYWdLxZqQ1gfRzZy2h9P59DdQT
	jxESTzyxc9qTUQkPS6dVAnACjTwqNPeOSXQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gudw0j5f5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 09:35:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso751463a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 02:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790069700; x=1790674500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4OspiU7ZLQWHMjkyQ58rangZNdkNtmqW5EQjuhQ6mdg=;
        b=IFnkjoDoTax8mwIGGZJBEGSYUfoUuQLiWmsbyH/6JNvDe4pXtJ0xDB3k9/lSk1TdxC
         btX6h8f/btqRpQLaiVa58CCCPT1pmEDVpRwCpxXEF3qU4kgRvGIy+ktGsTGH1vl8XFyJ
         9aMwdafi9QX7Za+8UIkZZVcI6Oqw/FhspyBXN3ua+jL99tD6H+J0FPfx9H2W9MCYJ8B7
         HmuskaVQhpwtmKn0rCllpoaSN8McWyxztY8MVdAXUkQGgkI9A1rT/wJ7fyrC2BmLy7sW
         gUL8a3+nRt7o0uto6PaFjztkDmieE5svmkZr0qH/LTPrPSfrp5QCr2htfA3RrQrBXfh9
         T+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790069700; x=1790674500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4OspiU7ZLQWHMjkyQ58rangZNdkNtmqW5EQjuhQ6mdg=;
        b=fx9mmeJKvYGZc7eQTDl3AnrGzBUHKX17xmRJRv2yYCfH2n1uxATUPpL6Lc1fDubk55
         FEXX8EOtZrj4dgV2DuB+JlaftYF5069A9kd+P1B4sjoUtL635Pcqbp3hYjpYsIaQevFp
         KfFyFWhEIfhdetQc5Jjsq/tCn5kqbo8yfvqzjtH+FlEXjT+E9o8zJBVRXtJzBodQXMOJ
         f2/10FfFJecoG508SOQN26o1/1uhPEpiSU/nNBIpheK3j7m97ZEAGdBKR9xGWEJc0Mnv
         SVuR34wIIsS5+d+A6mH407GrA9r2rASRykGOCSoV8VbPm1Ymyf5gGZDpcpWKhrb+5aeT
         SpZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsPxUaRkDu4NryToqPAFt1pGURpFSoj+ehij0Syuv8qKOYggV7BJeZgliz/k48ePb05z74+aesQxjIKek3@vger.kernel.org
X-Gm-Message-State: AFuF++nizOI9RPobrVHMdUE01WV3ZlxW3fk0zLhu3m7wta70+4J+V86T
	whMh1JNlJ/D+0lwQmR0FVw6eF6c0CKP9tFGfo3yC8a4DVXpHoyw+slvjS73ef/3HtOSrbKiZD0I
	MoQvCNGC4J0Y+DY6hQxYhN37KNsqF6KapHArFsMVqez/OTFRuNjOVQvpP0FnjrCDg0qmBtK5pdG
	fix18=
X-Gm-Gg: AYBFou0rw4vMe++2XuRtA5loQrsxIZIowAum/3uaDJD4agQVuOTs6uuX9dXXXXFpn1B
	PDu85XgT32AM6jF8WXbY1HfmxPwqrjszasT65Q6HVQpYjedynZAJt8d4KfV7kR3FU8fYXV15sqt
	XTawPWVpgNAgHtyhy60R5dzcLCIA2pMb3Z2IcKQf04oKyXRMWEYihLD+ClrmsitUjKAn+DMjQhJ
	5KX1t8dOP9rvianN1q89pPh+43dywhnjcf2JxLP9xYdPpPz6dXtvkDsVqesOOHvWakUiNFau5uB
	8vzvEpjmkB5C2uip65pdVza66fBBKBg8+mbWQIfcBgkTNxE5SAkyYa+q4oS81FPxB0L9e6x0oc2
	i+V6rfoAxznGanCJOFSq2RyjsT4QK6kjp78eD72KpORKTQKJtz/EbrlUrCX2d
X-Received: by 2002:a17:90b:528b:b0:3a0:42ca:ea4a with SMTP id 98e67ed59e1d1-3a0730cbec8mr554388a91.12.1790069700231;
        Tue, 22 Sep 2026 02:35:00 -0700 (PDT)
X-Received: by 2002:a17:90b:528b:b0:3a0:42ca:ea4a with SMTP id 98e67ed59e1d1-3a0730cbec8mr554362a91.12.1790069699792;
        Tue, 22 Sep 2026 02:34:59 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e626de382sm4074060eec.0.2026.09.22.02.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:34:59 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: nord: Add PMU node
Date: Tue, 22 Sep 2026 17:34:46 +0800
Message-ID: <20260922093446.493606-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vx4I5Y0toBSCa2MwWk6UtxiN3MSHzZaW
X-Proofpoint-GUID: vx4I5Y0toBSCa2MwWk6UtxiN3MSHzZaW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEzNiBTYWx0ZWRfX1QyXKkLo07tz
 XU44+RXnkYDNkIjvs7F8iVXOpYJC+nR1zS/z3vCo97oU2tw0ccNyGflhVqA4wGkNO3DcXTqKul/
 NAAzwNryqlV6Xuju2gHDITzfa9hMlxe+SQBzCCo/fzcIOC2ImcyMHui1YPJI46J8z3W0q+k7ORc
 veqg2iE6Mrflb3UJbh4G+FSUZznVz0cKKSU5JnvVkd0tD27p86TSAPLzL8+BuKQ3xBx00HHH3s7
 I3mUCCLN+s1/W0+HTcQ4lsiapq04079YNbJu6EIpixLEV76lfCLOQh+zirhcdkNoj9O5TldhAcw
 RchxHAwcjjLv2l3e342pziRlnRvV3jcJGp9rLSwgJzfm98iyp56FiTDzkAF6WtkthDfcEvBxo/M
 SfW/xLOFu27YlGz+OR7GjJV28Z8gpkqXnMb+1puxxjSrJEbkqhZ89sTB+0HcgwRzDnKjU+heX3B
 7qKCFVNIwJoMnDtapQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEzNiBTYWx0ZWRfX+9nZSCQIR3wV
 W9b/3M/K3eA935e2wrUOcQ9orJ4CFjBoCpwhapTvmLzZNMcqyDJG3EQuyU2V3K1e32Vl/EJHhNX
 ch6cruUSmIddVPKM7SpfSqsg81bTFHo=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ab24bc4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ohnXxE1zjlip3Ny1XgEA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220136

From: Anurag Pateriya <apateriy@qti.qualcomm.com>

Add the top-level pmu node so perf events can be collected on Nord.

Signed-off-by: Anurag Pateriya <apateriy@qti.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index e0496fd40c30..c720b85c2199 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -375,6 +375,11 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x0>;
 	};
 
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
-- 
2.43.0

