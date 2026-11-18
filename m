Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794985424;
	b=oPLRI3EMpSw/SxAzNJZ9qmFDMpvvSzbJimOTxPJLmTwbuzA32Alnyquz84d8HbpyCW8D
	 c4eQPEsnx2twycHksyk0nZ1FDgNnPzisdV3bszRu8XH7LvYuGRktGLy9BAXaUIeZzu86k
	 ChG2TS7NnPreUxYofS/OySFFPIF2QZTf2WiwglRBm3HH8Rw3fA1ogzTuDR8iXF3vSr1pD
	 bzxcqVXj07eFKeC8b61j5YlVR7EAgYLJ8yT4/rpdo6lTQn2z3oRFxCcB1IoSowd59jTfK
	 ElcpDMN0k0bwDCNayFKK8EJ3cHdno+jfs91NzS1O3nNUcb5t+FpS2uiWHzNEcedFhtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794985424;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ItYAcLnrCi4Em8kMhYzCeJCN6tEEDgv3HS0HUOjhTUI=;
	b=geaDRCaRDMs4k/IXJAi+iEoJQDcO+4PLuQKC0uH56imFSb1uz4ryJUSYZ1etzH5OP2/O
	 1pa1oikWFNjCiymLoYkrJHgURymSh0yTZM7mYKSmfkFfhizOCZ0NUBiKvBIjof+/7xsNt
	 7PPZCAoOf8KZFYyytx4V+uXsEQUiAiw4xVx8j9WH83gqloPWkA/L+SFWt0SK0nihNijQb
	 oqbW+dWFmh8VXeNjWFwBp47pQZVdwQzsCi4nTAOYJ/KtyndsrNMpA5Iv127zFEQCZEmrr
	 ri+adFGmaIjvTEAA4bPEhiHOVSNrs4cHudDTppEGBc8Q//YqqZ/icgmmIPN5cOaNd+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GE2kV9sk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KXqTG4pg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F92606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4F92606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GE2kV9sk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KXqTG4pg
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V4Cu3121916
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ItYAcLnrCi4Em8kMhYzCeJCN6tEEDgv3HS0HUOjhTUI=; b=GE2kV9sktILgqV/u
	yKQQ6p07TUF4ZSRnWz6/0M5WpeH2ASyMi/GS8ztVerMhIKS5FVcDY3BAATPJB1rz
	U3gS7V7yKJluTeHefDg5WsgN9+0VgzyOPCyGtryg2czw1lOu88Bu4nMMhrnvqwma
	KzQPDHUGtIPfnQ9gp9HVAkOPJtTyDOmYe1dxN75ByVHO1AnKuNkJiKW0+7Rv8nAm
	u08vO5WsjcvcKgM9vPRc57CB0wAJ5/ddMcedmDjvE1rGyBV4K3T9B2ZyzrHFjCeC
	i33pTAZ5HkHNZNEqHqlI5tWc3mqULklrx6YwQVFkNqY0W5UyGIrGelhZHhVhPB/B
	n31Mog==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hpa8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:03:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e95f8543c9so10542545ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794985418; x=1795590218; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ItYAcLnrCi4Em8kMhYzCeJCN6tEEDgv3HS0HUOjhTUI=;
        b=KXqTG4pgx/PeLqrbgJb33UGbq3l+YYzE/CSaf9O+OO8erMyg2vbN9BeX8xWQb/1mb7
         AlG25MgoEoiNNPGQ0FptY/DhzgXNVf+takocjTQvY+lVoDbqpzmS4kDAMIaNFHmQJNtS
         YbDjC8VF6zDYV75/k0kTc4XPlaBtHXyhUknC9T3gQHKpKp3sQcSpgaxtfpMfLSYF0zIu
         PNLoBoUJG1eca6SsO5xihN6xXe+L7iSiE9uRheHOxGSdodknEqo3s4r5O4Dv29Q+Jxid
         Wf8o8ST1TeSW2a0nM2oBCY452HMvndZdGVV9GpPGN/RPXRm92qnHxSLBCEWWY9cARmGs
         K64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794985418; x=1795590218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ItYAcLnrCi4Em8kMhYzCeJCN6tEEDgv3HS0HUOjhTUI=;
        b=Z35Z9n5d7ntCVxhRmcPXBLLMd/tW3cIIUQTGA4ANcXzxZp6o/rSLVQp7CELyfTWfvK
         Pw32FfDjjT1h2SXDpgQJeLOjqXsiPFm/LUi5ea7u9cDwei79+rCDkxPunw2Z8EaP+IcF
         X2X/YGzUnOq0jvjRiqqooL4XGqZTeTVNwwXF+jgx7QLXuVfyYV6uaLh3tkw/SA9z4LW2
         EWBuyngtGnuBgSGww3PgYPjynj1eBupXUYtuwP0uKtwxBZ1XYtOCzVgT2ypGznETQhml
         TpqaUVfuG+b2Db2ou6Aw+xLHYMZugl7478dWz5SY8Acj9kxMVyRpKgCdXIUSpMKmRLp3
         sPTw==
X-Forwarded-Encrypted: i=1; AL+hErFFV69lAfBFMB5sNBjwr1HAgVr3zAaM9lbVDBKGV7V7RIdCCbgamYaYOhv6mek0wwM6kP9VmwohtB1LYbvz@vger.kernel.org
X-Gm-Message-State: APuU4Z///VUW1ZbWXbeoCwhOskeo4ILic9BP3eqZBORLOFmmDBk0HUbs
	pdIJsfPoHR6wkxCvs14dG9eNbZDyz7sVeFfDrSllZu8jO0ZdIV2nWIjtZHyiAki3GhesgCiarXI
	tZ8T9wLmzQ8hH5aWhyJ+3ujuFXfLHcSMnt4Z0cy0qcSdkKybYb9Jfz6h9pPaKg//XyQ9w
X-Gm-Gg: AZFdTZfES+O3shfH9H9oS9H3wlDO6/7NEjnyKa6/uN6RUkqHwyhRIoDri9OqWlRmA5/
	brTvLHuRviJ0oise8lLIbpwbxn2akCRChQEHiiq/C82OWUQdSsmghNUSfZoVwb9CWH+3j/cN9cc
	2129WdsACQT3CovB55ugWPUBpfbJ7pry7/O8Gtj3as/Oj3AX0HL7meuz3sJ72RVbCo9TB/fTTNn
	IjFylvjWQ21sQmYBOZwETjZplepLaqPO0lp6da58Skcygv7KhnvjbJmgP67Z/VjjXvJ/w5Cy5px
	HJN8JX7LdPn24BcGsxbYGQt3Kf/Q5oBVfkYOCxfGtvAmKe3e+INMed76vX/0c2TqQzHTlhntDPO
	jGfR0C3hpCNZ3qWw8FPUxuGqgz0ipq2VcAaBt5CgVjqAbhECpbcPN+KFZfVrkksUkJmbK08pLQG
	nIzyymoL8pPSGHVXX3uuo2UVb1NTVF1vjw+KBF
X-Received: by 2002:a17:903:1545:b0:2e9:6972:54d2 with SMTP id d9443c01a7336-2eff72ea39bmr15578565ad.12.1794985417617;
        Tue, 17 Nov 2026 23:03:37 -0800 (PST)
X-Received: by 2002:a17:903:1545:b0:2e9:6972:54d2 with SMTP id d9443c01a7336-2eff72ea39bmr15578155ad.12.1794985417086;
        Tue, 17 Nov 2026 23:03:37 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6181433sm8341825ad.29.2026.11.17.23.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:03:36 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:01:44 +0800
Subject: [PATCH 2/4] arm64: dts: qcom: kaanapali: add periphid for traceNoC
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-fix-tracenoc-probe-v1-2-0298dc5f05ac@oss.qualcomm.com>
References: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
In-Reply-To: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh@kernel.org>, Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794985401; l=1345;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=SPYJT+cxDONIBxHbI25D8ax8ngmkcDCnRoFIbVNvYOo=;
 b=7UpR6pOYX7zmF/tEi4RMp2q5H1zEA9ofVZJzGYf5rN0yw5YaBM3IRKiYBxTMzhhXCtGGvygg9
 wco6hsFf2C6DoYNkikTGU/AQbQB2zokEswMiMFRF4ORl3re8o0CeVuE
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: UgCSdczJ1D4xx5Lk9fiFO67ZXmqszTW_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX+aX9Uyx3k09Q
 8OMJKwmRA+BVByRrzxX4NG583n9Ac5IGfac7ii97kBgjp/h9RVCdbLZ/pXBDPykk3bJ1tcd9RE1
 mnsZTZGTcBTAsjCRXATdGa585+NGej8=
X-Proofpoint-ORIG-GUID: UgCSdczJ1D4xx5Lk9fiFO67ZXmqszTW_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX1qVy8OGMxyUP
 5HWLYjBLiNhqNzzYxdZmOMXaP3bCVgalZkS8z/K9qkr6vGR+grI4WzPWE+9Z4kO7wmzFrj+1V4f
 KWB1ceC31q6IRHoxnFCWKL1rEDHSZYl9Lkqg/ZNAsipUlOp5TArlfMz2tR+Bbq4Y4yLXA6BDvhu
 zygxEKD4KwCE/bWdCmhD+SBUL0s5oAKhNi24XgEVQccuxNGvFO/SvdqXENxqxEjDWBA6qUK1bfC
 V97wRQdu0VISQbWOpQ1n87z127zeSFct5eEP6sOJPkxP6zxiM9obh8Qv0CoUzU7fvY4qV1iqcf8
 XHzdGMplenQ0gbaskRXatpA4bs3L8d57mXKc8uokjDpOlJqxMcwKMDofaHvoiPuJR8QANC0+wsC
 OuUrtjnIAbuY7K40rfT2buCEwci13v3CxQCrJ1AmH/yVZPZTgc1LDZLtoLr6XMegWPM1fCUFmpe
 mac/MWceU/6dMFmxzbA==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afd4dce cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=iVAGZxyPhfMzDMBdamgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180027

The traceNoC node uses the "qcom,coresight-tnoc", "arm,primecell"
compatible, which places the device on the AMBA bus. To bind an AMBA
device, the bus reads the peripheral and component ID registers (PID/CID)
at the top of the device's register block and matches them against the
primecell ID. The Component ID returned by the hardware is 0x00000000
instead of a valid AMBA Component ID, so the AMBA probe fails and the
device is left stuck in deferred probe indefinitely.

Add the "arm,primecell-periphid" property so the AMBA bus uses the
specified peripheral ID instead of reading it from the device, which
allows the traceNoC to probe on this hardware.

Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 132577d540bf..8afa9fd253af 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5438,6 +5438,8 @@ tn@111b8000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
 
+			arm,primecell-periphid = <0x000f0c00>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1

