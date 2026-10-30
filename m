Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793340127;
	b=VWUYw4V4AuU+4QbBIFGuWKacgfI2tlGI2DdcHgbF/KUmO1O9mp9BOV1yRpdtWPbxrQJE
	 DOAzwCtU+FD5cpeCgRGM2DRxSXHydDc1h5tM/1krzFx2IQh2KFj7QLUrYOCNfSbRNO+o7
	 ogzAlPBLuL0jvxdmsfbNcMvmudwxOz2qhJ8ClYU4u7PDcztZmzHVIw2fWyiZZ7YcNMNqn
	 GJlb8jG69a6839WUkvCwRzrJJVUlIDPH0YISojWukGsQbxSv9cDe9Yn0I637y6U/2J7J3
	 lrWR4jZi+D4k4mn5sEVe+/QNnZHhALPRKukakEAQStGxkHmorSNV0+O/t2vFKS77GbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793340127;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
	b=BbzjVs7EAbRpHf94NTHokxxN41jJp3qJ0Gd07R4fG4guJiaKzpfkquOX83bJ4G7cRVmM
	 12SOAVQOtZZtnPBxW25LRzTGZFbad3MCouFPecme5TTG0dVfAaGJdl6skCwBGmeO5B2F1
	 DM8ehQh29iMM06ktMfovzWEdAumG6NvIBdcgF7q2S66rSltMgX80fILolgogvhSRSaY8X
	 8AgI1b4mA43gHkyuMGQCO28zBSW4Yi5PptetGR9f6es0x73gPGUU6JYvGpPKzNu1tw1i3
	 gk9vDWQZ26W3bQExhLzvBTJMU4W4agLTnFtBrMCOkvcygTXgwSBULmRSbIv3F0Rz8IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D4oO5zfB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bcJ24Dpu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F27606A324
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1F27606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D4oO5zfB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bcJ24Dpu
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5Ew4t1367078
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=; b=D4oO5zfB0ukpVjYw
	cTk8tCKl+AE3jcORtYJHG7tWO9ZGjdcduXPIbCVfA+fK4HR4hE0pqpFfVfAdKfGd
	NkI0N1tiqC8IapTi5YOGJcd9F8OJYLMWSdpg2uNY5fX52Jv4Tl7LRYV1jXJJP/a9
	OchfynMmeE3qJmKvCDiCHKxi4iQQY6iq5r4NQet6TJvaGm317DgJVUvOzdSo77J8
	JhKs7vP70ldaeOC5d370wQH7GdyJJAony4kk04FIW1oyHjsrgIeDGTKgOz3WZQiK
	W1VWuCIxKTkMTpaqyV0p+CAE1XmCMOeNJpnoW5/NRoHzdh1CgJwrpx3RdOftMIBx
	VwV4rA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p9e8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:02:05 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdaf3f2a58aso956301a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 23:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793340125; x=1793944925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=bcJ24Dpu3VB3UBuyZC2Ff2rkcbhr+Uf1bAZtfXiHaEN+R4947K/4GZUNNzjRVlR0bF
         k5S7KaO0O7qQ5XuapExgzzlrCW5Rk5qvfsh64c1qGRvyolRs34bnlDq41mE5i9qVQZla
         fy3gCQestuJeTexIeXNErii47PxFx0wWLrTWvNgRBT3M/8r1H35gzZ3Xwljg1SIcq+Xk
         6O7jUvJ7FXbhSmmNnDmL5o3GMQQQWK+PDS10f8YqFYsT+IMzomfLJ7DmjJzUgulxqyl+
         t6G3km+fKL1T9pFnyf2m7LNtch3cU/HJVEmm03TNnfH3OrdnM79w1MVE+QMK5C6m3lgz
         olXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793340125; x=1793944925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=ijfTsgvGK2y9lScPlx2LG7O/ht1Faf8wjr6jpWJhrZa9FVTMly4XeM7Mf5GhXIvJqn
         Icy61dvK50TiBcskkSAKx3et8fPRgwT8anbg/sJHkkFSgHrH7+SaoXWTVEEt2BoB1xkn
         uWBVc2W3lhJvX2AwTqNUJEvv7fAsJMg6URaIRjoYJtifQ5MWcOn/sOdkSSmLQTtHGXoy
         b3CYgfg6Ww/e6P1f3fG2BsgaCGhUpZpOBFsT02/3RZK/fF0fk7Umz8VtEF6X8R/J8D4z
         rNlRFKOpI7ceAzTFLW7a4AqqQSL4S1B0FY0Go1XdTE2BV9In+FvgUhk55SpLIWXr+yrE
         /GKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBmTRf0zzFCXiJkSWwUWWd4GgL0kUVwCC6igTzbndKMjdh9By+Kskh/YS+HJzrgQtwG8aqBE+63g+7+ckz@vger.kernel.org
X-Gm-Message-State: AFq9FYKZ7dN9uAS+AmRNr0/k8IjyoXdF+Ai6dZh3r9i9LnOVaZT0Q6ve
	lZMQO5wXqQlH02tDiwvbPTSX9vi+QvhsMo27n4EQJWIIPJ0ctpcJf/mEL7JPaslBp6d9JiXY3N6
	J1vEaUx5Kq+1sWGLMUPxiWWzEuI1zo81dNXSnWixziUxmK4r7vy7MC5dIwgsFgMhBjs5B
X-Gm-Gg: AYBFou2sF4EDABKfmqsQT3BxBoYuFk8FjP0zcTWJWOgcol9me+y53cwhM+MygdlXkmz
	nGOoq0nJUZjLoeHNaws89hE+G45EEslfZfGgy3EA9EtU+Pb06gzuadXXhNbdiKTx0on7CW7wP7H
	qQZ1XVPtFsC+tVbqQOvSpNyjfYojuPOYYX/LnpOUO1hmSB7q6G/Fvsd5DHYLjaT4LiGTVXpcOQ9
	Mh8ZmpYYz5ijagygXgscwVCV+FH96PQN51MFTWBm/j0DeKhwN95Be+Qz2s2jtfX6BW/Wa7AZXtQ
	VmC8bS06p0r5kWjIfYAW23WlQjbAP58sGg4SgM5mlSDfwQDwFthkYUDLIiom1DybmB2gFElZPHU
	+CScU3QtoXNHY9mGb6xte1NwhWiLCTq/LGXwKaNUGzThnOtMcKUEoDDEPQQDc3U205F+kAR6FUw
	ORjQXgBytAOd9LL/PcPGtuwmXNIbyRGPbm6efL
X-Received: by 2002:a05:6a20:7d86:b0:3e2:78bf:63d6 with SMTP id adf61e73a8af0-3e913d6c56dmr3755863637.46.1793340125018;
        Thu, 29 Oct 2026 23:02:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:7d86:b0:3e2:78bf:63d6 with SMTP id adf61e73a8af0-3e913d6c56dmr3755846637.46.1793340124566;
        Thu, 29 Oct 2026 23:02:04 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09706f01sm252292a12.20.2026.10.29.23.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:02:03 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:00:31 +0800
Subject: [PATCH v20 7/7] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
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
Message-Id: <20261030-enable-byte-cntr-for-ctcu-v20-7-bd5c3ac9f916@oss.qualcomm.com>
References: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
In-Reply-To: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793340078; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=5Dgum6JnAYvNy94FsJPuCnHsZTgptoysTqIYu+BN7gI=;
 b=JfkIeEFLPGzKUpG0HRMgkqeOptx9ErA+QuK8jh3YSakUhmfAPmYeCF6CMtBo/QwluH/Eyd0+O
 jXmEfKT2S3qBgkxPuXok1OqX4eD8wBAkcfh1cGtpxBMvv3/454koBsT
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfXy36cGdXOndyH
 r6trDsb1UKuzFYQ/AxZT+dWlbN0UfsaKN7dYUBS8kEiwSkcoKHrS6jiYFFcxytVrC0KmDtebe2K
 8MVvGkfjbspy6g70vu2Aw2hr6GRYaF6VJIOu9BSjlc3ct8vky6b60qtQ0hbbnWpnOHP4Ki9LYJr
 zvOSjs649OuyqiYfZQyOFWULfDfZQhBovLLqEMDPvS+zFdwIixJIzcp0mU3ssuaPgTZjN4Baa/S
 6Gk5G+uA579Wy8WZAt4czgGrM45HmisdP6SQsS6OT+FkEMso7HRjOQtYSahT9+2gFbiC6OWAgXW
 GOusTp/l49uNs9QbNjELVgNdDY7BCNtcT/5JYigPcr2VqzjBSb0NeimwxM6q9qsJboIfgPosZNF
 TL2TwnRgDei8qBZElkoFPnLIqCjAqDD/hUAl8JyP41F8nhfJx61Zf39ph3Ysj6EGy+/R77j7dMh
 xVl/7bDNNDUeUtlwFzg==
X-Proofpoint-GUID: f1ciQhU-SemJuVv-QjpkLNAMDV3z2DbD
X-Authority-Analysis: v=2.4 cv=Lp4HWXdc c=1 sm=1 tr=0 ts=6ae432dd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: f1ciQhU-SemJuVv-QjpkLNAMDV3z2DbD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfXxm0TGcsspG6Z
 9EHAX5MdamvgbdTPdZY5e6z/LgGDp+0Y/SC2D2i7GxiISd6BGhP6aN7+gLxkWO1nIUHNMxhQXPh
 xZmm5cGKOOWGLOY6mSAh7GY0fFPb46s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300023

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..852a1142100f 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3132,6 +3132,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1

