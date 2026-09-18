Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCCD435523
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 09:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725503; cv=none; b=d1et+d/XUz/MC4qysjDjKlYVmlG5Yuik06e/hk52UGkd2nufzp5Stu+GFt4S2N7BjLOv3E8rYE82pwFfJdFO8QOaf+l3VH/oVuQCp7zCtrKeMGVrXXsLqdVFLBm9ouN20+r94fr1IQTrfjxgW/Kl6rcMun+DvjYwvoUtMTE3DLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725503; c=relaxed/simple;
	bh=rjwjd8MC3j9tcGI+w66v3zYxE2b5YPlrubeSBvvd1Kk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F2d6KGHVXc73k9ZK1yILMrT62gjJVVAyLhg6Kq7Rleyfni2lI21YSrE4v9A4v6zRvAcvyB+8/8ZNxykndyijDzV4UeGYWfBh+P6YjXsYaZvUWqzTmre42QTafnA7U//ZhveWym9Pif0L+VR/YUPc7nIBV7IphDU0nF2zcRBirCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=In7Xj+qN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hCi88DH6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="In7Xj+qN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hCi88DH6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dV683916152
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 09:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KNdy2nZ6rVa
	R2TsEyZAuvpi0wx3EJ8LLx6lCNH9aRBU=; b=In7Xj+qNHrzEsoZaZOvInrypXti
	lKCWfszUvk+lSJ3M3YWd9RA7cHwmlZxuTsHKR0NuHxiDlteoVMsqfA9HHM2m8SFI
	2XlgZ1UOKzZ/z2ppTv5xbJ1A5t6/mEf2LHWAXVLYxlMHYOoyY+a96NiiC7LlFmKi
	LRUMGxFFaDNJa6H6fpujmktIdgG94zvRy1VDJKYceM9dl5b7irxqD1u7MLxlhVZ6
	g4mmExVnEJVUTCWgLYBekxvLLrPUE7ekVz80wGYG8yFeK2DaGw+/uFLXzjCsUuMy
	fsRA/CNbzhxgBQ9q5AfwOMor8DYW7ff1oIq6hVhME/ZX5I++r/sUCAtgbPw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrjdtjju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 09:58:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-399315379fcso151961a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 02:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789725500; x=1790330300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KNdy2nZ6rVaR2TsEyZAuvpi0wx3EJ8LLx6lCNH9aRBU=;
        b=hCi88DH6zAsfXQpVEt6lhqPwV6iu4DDjkKlqyz3uIdrI4hzCZ3mnl22SyFY68SYgN1
         QHwThM6qER65B/AbQecMNcsI8ahDawkDDSxAyhcq03j8hqZ6tmMwvjXrUfsZjPce7ki0
         QM6vXqpawMuf+RMvFjCTo4wZ1Dys/VNMP4xPa3yhzBy9gdfh6H7V3bXEYfUO8j06MpSz
         14zzmmO5MVMlBBNX2XlRvf6fPXcfIqKHotlgB8AtwdDgUeSdUes4892U0p2ZKRBMm57N
         BSoHWuS9cnSLYX3ANdK8ejKsD7Tc4IFIzG4fOZi2n6yUooKg1T+tuwp4WlDSP6vLiFM4
         rSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725500; x=1790330300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KNdy2nZ6rVaR2TsEyZAuvpi0wx3EJ8LLx6lCNH9aRBU=;
        b=UfgShXCXSeepMZBBp6rfKM6Id4n8r2Iz3WlcnXLkotCEOOgTv2ibNAnrJdRhOaf1mv
         tg/CBCzGhK/OdcqW0V1WDFnj03Sbw40MdPYOvAIIyN3SlCWNSyQpQzKvh3vbAEfefF/y
         5zeGw0vP6cJnFMwwMrn9c945EczRdsroMJCrEflT6zBp9bvVAFOgm6HdF+ISw6uLkalw
         ddysTSzrQEc7t9ftuYH1SlyiA3kIaM2ZCV+wwHdH+4bQveqbbXECiePtiQ+bQ8X0+pHk
         1FixzlGvIYZ5+70P7ZXHbrekUEmfV2+dcMuTOw9WPcpYWIdRoAnxK94Y7IK2o7GnX7gd
         fokA==
X-Gm-Message-State: AFuF++keJO+euqwmCuvAClNmMpiH0dE7XPH1j7iMWjHjdZr+kVgcYMgV
	0jaNy0ImDPIdVpSu+GAtF5UowSmqhFL/WjxhVZtvxGJwrY4nZEbEPws4KVFYM+IOrqNp2FCOdTA
	cFWRdzouebgCEIncWgmnFdJ5JvoxXny47ffWG6VVwBmDxbEyP7ahFLEl2n/w25x5irYpI
X-Gm-Gg: AYBFou1zyXN5TMiWaYDjpJ9fI12YC3UWhEsjimcP4qq6IvirDs7FQA8+o9RsnnKsYe7
	R1BftYbVOeepGOpTAERGKbqU9+PcIqV8fFW9xXfXFiFoJxRAn5IHV2Ou7U+fASRbVisRwtFDOqg
	Cw7vSpGA0xbb/TSqHdk96gEIBnUE6JeoVDMiShlnucngFE8gsLnUrqCcjyaMF4FHhKLclre837H
	RpE7ZBe0WL7/pLXcLTIVhKQ0SKS+EinzFo5UDBTBunccb4uqhzKAr6nDcTz6eBc9FQJRlj6KvyR
	2qAMs0pjT/vmMdCumJ1tc1NfwEinH8mSkOGKLa1zLqhs4vNi/gKPxFcy/LvYPFZu+xSg2WjtM/L
	eFu6w6FzZT00v44n2phY0HXa1rwdZ1+E=
X-Received: by 2002:a17:90b:17d1:b0:39e:4546:fb1e with SMTP id 98e67ed59e1d1-39e598d6381mr2701733a91.4.1789725500355;
        Fri, 18 Sep 2026 02:58:20 -0700 (PDT)
X-Received: by 2002:a17:90b:17d1:b0:39e:4546:fb1e with SMTP id 98e67ed59e1d1-39e598d6381mr2701687a91.4.1789725499857;
        Fri, 18 Sep 2026 02:58:19 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144ce02b063sm2892970c88.9.2026.09.18.02.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:58:19 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Tony Luck <tony.luck@intel.com>, Robin Murphy <robin.murphy@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        James Morse <james.morse@arm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        umang.chheda@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Subject: [PATCH v3 3/5] arm64: dts: qcom: monaco: add RAS error source nodes
Date: Fri, 18 Sep 2026 15:27:44 +0530
Message-Id: <20260918095746.3347893-4-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260918095746.3347893-1-umang.chheda@oss.qualcomm.com>
References: <20260918095746.3347893-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzNyBTYWx0ZWRfX1AP0VqGktBcO
 thP+BiMmz4BpE8j9wZly6cWTTTfMGv3WFOUObSOwnUujeUyfTxdaHXMfCDvPcFFubz+YIPmL1Zm
 eGKvwG4sNyjogycJyO63ReMV/YY9M3fWu12T0j/f/mUDup+uMuNp9KWY8jgWl89K88YW6Aq6MQ1
 zVWOSy42U3WBsde5hQRh+fIgpxwmsxIKPOY/9IE9hlVYjc/6/LujMvMTHrwKcPweFQozt1HF/GI
 XEy6nvkEoBNFp6UiJF0973mzO3azn1J6NkcMxelIHF78IS38noO2A/1cBBMLvYCzSUpUBOscWQM
 LPxrxl2uCDwqml03f0uPYzjTUj1R/RrLY5ZksQYIjxa6IMp0d2Umnd10V81DnqOK0gL9LjGGt/I
 +04QqZZ0N3VWoB/dvT0j2DdJb3gsRppEOnwKzEP3Tg1QY3t3gJBNIRvpvNloVgbmmibwZqjcuv2
 D3aM9yhZs0iv1iK5BFw==
X-Proofpoint-ORIG-GUID: zaUcywtxkedPgNwXXqFXHf88Fcw2dA17
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzNyBTYWx0ZWRfX2g4p1oQlL2VV
 04wKXI4K0hYqvg9JhRotfzkhEo2EClcaV2dFLkBMx1Xk6UDqgUqAMRA/KTiTxvG0wIPbWTf7nPo
 pKVgZbJacEh0Mo1dEuq7n2/+i/yMFKU=
X-Authority-Analysis: v=2.4 cv=J9Q/fwnS c=1 sm=1 tr=0 ts=6aad0b3d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=KdVUwichBgNWhWzcVTwA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: zaUcywtxkedPgNwXXqFXHf88Fcw2dA17
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180137

ARM Reliability, Availability and Serviceability (RAS) enables
processor components(for eg cache, tlb etc) to record and signal
hardware faults through architected error records and fault handling
interrupts. This allows software to detect, report and, where possible,
recover from hardware errors.

The Monaco CPU subsystem implements RAS error records for the L1/L2
cache hierarchy and the shared L3 caches. Describe these error sources
in Device Tree so that the ARM RAS framework can discover them and
handle cache-related error reports.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 395d32d36844..1728932e52b0 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -617,6 +617,36 @@ scm: scm {
 		};
 	};

+	l2-cache-error {
+		compatible = "arm,ras-processor";
+		arm,num-records = <1>;
+		arm,record-impl = /bits/ 64 <0x1>;
+		arm,status-reporting = /bits/ 64 <0x1>;
+		arm,cache-ref = <&l2_0>;
+		interrupts = <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "fhi";
+	};
+
+	l3-cluster0-error {
+		compatible = "arm,ras-processor";
+		arm,num-records = <2>;
+		arm,record-impl = /bits/ 64 <0x2>;
+		arm,status-reporting = /bits/ 64 <0x2>;
+		arm,cache-ref = <&l3_0>;
+		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "fhi";
+	};
+
+	l3-cluster1-error {
+		compatible = "arm,ras-processor";
+		arm,num-records = <2>;
+		arm,record-impl = /bits/ 64 <0x2>;
+		arm,status-reporting = /bits/ 64 <0x2>;
+		arm,cache-ref = <&l3_1>;
+		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "fhi";
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		/* We expect the bootloader to fill in the size */
--
2.34.1

