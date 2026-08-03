Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBC742BC5E
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 18:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780038; cv=none; b=Q3FsTVnBdehzAFMyfLk9VNQDr3HfxINar/GT3qXBGqssM1dCsorqZ0jZVnrbZ1djyr4vK+UhfqHrvK4uRTBQ3s0UZgAKf/p/aZ+/Dh+Xl66fgaG7TVfI8GNl8adG8d0JVjOFNQJ5rHJb/sruY4S3V+Q1Nw6Ipc64J6ow/zzi0G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780038; c=relaxed/simple;
	bh=DxSW/8GnFm4yrosXHGRVaMQHICkgBFn3VW4smphVQ6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iDuYgfrvI+8c9qs2ft8XQ/foPwerTzB3aq+3YPQzgMC6j+OLFnhgRYFajJrCDOD7ixw+MJ8zJrZnNkJVMH9t1rKp8p2vDI+mMO9WHUOOGM/gXdVYklVfgkHCkVwz+65Yx/ZIR9iwfuLf0oujYLd79q+DJX2sLZB7a3OKxtSZieE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SzMntt3N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CeFzrF2+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SzMntt3N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CeFzrF2+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673HB7PE1237758
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 18:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PHR2Da+AcfS
	4OCF2UBK87l5KcCcCg3n5x+MrrM+4nPw=; b=SzMntt3NljmyFHiL1Ww76Bn+Rwc
	4Akcl2/pJuUGI4pkHTHeq5XdYJHTbGakX5gi1SrDARpuGaI6AeOSp/+BuvoY65wU
	ex1FI2ACtecyoZZ5/GMHJm/8qXW1NIdtidHLqTDDeMOmRv4oUTukWpYjgy71v117
	t3lSZRM0bsXtjcXqV3e04QwjSXsvOLLT5e6EnV17IpBRGuGIutenGdqbghiC9Hy+
	VGob9nhzZuURrXZYZT/Q0Ve4onUYVxP2IeSHjSrPDgHRc9jrUot13IIxKtSE340Y
	7X2v9tlNUMGExyFf1EHtNQ6Y3JLq8m5Rxi3fo4fhQGnjz26rjURJzyW6f2w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty5s86v0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 18:00:35 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85798977dcso6230146a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 11:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785780034; x=1786384834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PHR2Da+AcfS4OCF2UBK87l5KcCcCg3n5x+MrrM+4nPw=;
        b=CeFzrF2+Z26gbd+FGIVCDT6iMpEQu84kQ1P/tRRM1JmFjrmaKCI6PNUzr1hEQOulhU
         ywJixNZlVIfCB7uB8erTTIRwftLnqAGsJf1CN2nr/UkQPBnm955AK2nMNTt9+1xWi8wV
         hH6b2jHwLb86B/7cE8b8iSKwl96mBQXLnzs4g7+XA/RrNV00ORAqYkIec5exfGdKYVgT
         iGwpttiIYnUs9WD8IiXXVfPj48lGwisRR9y/EQIFKIGvvdZTN6FN4YcWw48HGBXJye4g
         ENADoR6NBzMYLvTHNeYfUFgp1VdAi70vd8bAus35sZz7N858HRLYgU8a7DUVFK2PEf7X
         6lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785780034; x=1786384834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PHR2Da+AcfS4OCF2UBK87l5KcCcCg3n5x+MrrM+4nPw=;
        b=ZD7M1Ob39tarFnn1bxNq5fl366BTqu+3OL0HB5e9AToAluHyXdbeZAAa/1ldp/imUI
         MIN8L9Zsn48InvaKrbjBd/a0Azf8tIT+pemLP+q/k4tp3lRkfb4zbVU6rYcuQawx0qWO
         Rc7w7D9wtA6OFUYbL1WY9xz7A9HYgKOpx/Joj9By+HR1W+JbFvI3r9m4IQvSk19Ber3B
         PqdlsBmEIEEXGrnvKCnjYk4YXlK+XnGUrbsJhDvm6mFxkrnQ3pdSLNo+Xm6RNQ+ynpr+
         0Mgr7cf6p4QZGEmSBzbSIfkSBSrDrEUev66YU3FYDjCkdoQqtrq/u0ijOmzXS/bqZxnK
         GJLw==
X-Gm-Message-State: AOJu0Yx031/ZDhr0+m7loa8xQOOeDhDQO+8X7nbVqiYuxMa7vwqBvCAj
	o5vlTDn1mpfCZKb0ke8vAZ7Y+ciXLuGb0nV9GP6YF1AiW+h0JqROdTqfv3gFffIOtzwkOyK0lnV
	qdal33XBAvUr+mClJwLQeTMQpp7smy93H9CMIrMHcF/EaQi5wSpEgAb2dEA8JAVXTmDUz
X-Gm-Gg: AR+sD133DbDCvv86nED7y84Iiw3+XKi8p5I1Rk+KjA1aaPLGNjfaw3qxK+xTJe1SGwv
	+Yfp0ZRKoa/y8y0B2vKGjwamrLOyz/2Uaf+xYBrXvKe+srXn8nBOjmOUuURbaUCg35NcHUH517Q
	+1LRqPvLx/vkBgzFsbzDax7fe+XId7u2JVGXYm/IakBAFvdUR607K/2OBHCwOACtZpCdHryen7+
	1v9Rps4F/oIRb88rfMsTqPbPQYIQXyAiwt90LCrW1v6YccTeRXgLlKe1aHPvlQE6RCPYZraFi1q
	DYwwBGexaOkN1jgG5tJpqvByZnVqd/3sj059Q2YnCUxX0VbiyDRh15AOR2ipr3XFO9uyvRUGDYo
	tBQKt2/UQgfoQ5vN9neaXa9p6+g8=
X-Received: by 2002:a05:6a20:160e:b0:3c3:e411:418a with SMTP id adf61e73a8af0-3c92a9098a2mr11382246637.70.1785780034483;
        Mon, 03 Aug 2026 11:00:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:160e:b0:3c3:e411:418a with SMTP id adf61e73a8af0-3c92a9098a2mr11382192637.70.1785780033937;
        Mon, 03 Aug 2026 11:00:33 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe39ebb9bbsm3920533a12.32.2026.08.03.11.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:00:33 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: qcom: sdx75: Use SM8650 MPSS as fallback compatible
Date: Mon,  3 Aug 2026 23:30:21 +0530
Message-ID: <20260803180021.20368-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260803180021.20368-1-mukesh.ojha@oss.qualcomm.com>
References: <20260803180021.20368-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SPJykuvH c=1 sm=1 tr=0 ts=6a70d743 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=8cKaNl-6jJHcjB3htl4A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: fGECD5LE0l-fiydMBiYBJB7wbYERIUYt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE2MCBTYWx0ZWRfX/Pk5wTDRDkkZ
 TlJzwEUU/6w0J70hgepQHCZ7JZg7I9lN8evXXZ4nceX1io9KD002LO7DeK3bsH5h3S0Pw/E3d0p
 CDyrTZVelV5QQmO8VQM98HjhUmk1SpuVbj0QE1FIl+8eg/MCarrxm3XYHGprHiYb0hdnTkQINd0
 aTd3izQY3UDeHUyzAf1cyxetE5aZWxs94wzLdFhAfvrbJcUU3rg8oJqP6AbLoaPy1W0LcUXxNdS
 xglEuNvhXJ/zBy91sNIJmOl4mg+6QdEKwNgOyiZrrjkjrbvYaA1bVDU1jgYSknRit/KVtxOvc3u
 gcaUtYZlyPxtfqrwcd1RvjvsJJ+/CnobwCHKcLBVlcSgFYDU6+V/JCkC7+piC32kGkDytb6aj4g
 ySvIdjHBGp16AZYHbZ3b8W3bDadGD5NDxEEWfYQMg2o3McgqInNSzVhdTtx8B0F68g8+W/RrZWC
 LCNfuutDRfL2AvgmixQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE2MCBTYWx0ZWRfX4gktG6xxWykc
 TEBvpZzgG/s/5hKvvoIOz7rGq9kj2crHyunreHJlzDVORRAAY4PXURdo+2SPMnHj0OvoQfVsXNZ
 RfypXBX6D5BZriPE75SYi27RL6Do6ig=
X-Proofpoint-GUID: fGECD5LE0l-fiydMBiYBJB7wbYERIUYt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030160

Following the dt-bindings change that expresses the SDX75 MPSS PAS as
a SM8650 MPSS fallback, list the SM8650 compatible alongside the
SDX75 one so the node validates against the updated schema.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 85cc9c6e6f83..dc9c4ed00d4b 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -925,7 +925,8 @@ tcsr: syscon@1fc0000 {
 		};
 
 		remoteproc_mpss: remoteproc@4080000 {
-			compatible = "qcom,sdx75-mpss-pas";
+			compatible = "qcom,sdx75-mpss-pas",
+				     "qcom,sm8650-mpss-pas";
 			reg = <0 0x04080000 0 0x10000>;
 
 			interrupts-extended = <&intc GIC_SPI 250 IRQ_TYPE_EDGE_RISING>,
-- 
2.53.0

