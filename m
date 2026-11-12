Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523192;
	b=VZIa+zjSy5gYnJxIPMGEIaUwZrdHdtmpsxW/ZA6kRKITk3E5ALVUwDkM4E6XOrnYnush
	 yZtUMhfDRYw7bT2gBICAR2BhO64k28R217fB1iNyGVrue7JnFPXqB0fjETbWXrlGY6P9W
	 9bR1OfQv5QOBAPRDnsg/cT//oP6x/OBFlfvIvsToKaB6dTZzbKG5C6gzN7/xywF/mVRKk
	 Q714DsMVN8os2/be3wcQsdGMP0OFn0FNT/mfTT5m+JYHFbqTY6W2dA4lFOiKBxUyBwZ+s
	 eIkwIOstfjbqL+w2S2mIh5A/P9cQ9VdD/R9DYHELvMJWq4zX/5jZE6fuvan3ughLiHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523192;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=d0jw8JKgv0n0ezdqZ8dsYLNGQSrLdfYWJ7gZlA49lV0=;
	b=c+oXq+qtgds4PNl3UcrdoZDFtMqPZG2MSTMcCMygs9l9nceOtvbzu68MqO37B0xK/o8G
	 85bgnL1xtLgsvMeT98TT0ZkX3BTC3VIOA7xuJCoDErbvdPfB5w8bgpCoEIswtn/0lpzO1
	 n2sKfcP0ZxoKg4gEDQaw5E3LCFIgGyll9dBeJdsRN5WV2JdsRWyId+kXyWobpNqKZi/ya
	 2ro7O8sgjAyKduHNmH7272pjmCqTRVVX9otbBSB0NXej9Ej+JTMvlD2ay3EpengygtfkZ
	 J3k7rbf0slO9LYleS/FplPI7fNzJ3Uwyw2OWJJg97y+YKk7wWWzcuRUMSfeFxPsS34A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V63K56ZY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fj+43oaQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBC7606A8AA
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 22:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BBC7606A8AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V63K56ZY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fj+43oaQ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACJZiO3537242
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 22:39:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0jw8JKgv0n0ezdqZ8dsYLNGQSrLdfYWJ7gZlA49lV0=; b=V63K56ZYhmMmzVzi
	Abvhos0ZhgGq878N66gbiQpvGPsraM5OnL7XP2Qof7LnhO78uTu1exsRapupGRDp
	hMh+Pm/TmhoVmH75rLbqRM+1QJ7PgEs4TWHDY8YslJUW27q4NZNPfes2ZyMQFcWm
	eQdIHslArBMU08yLQUmBmodWUZ30+ah4iOYQp2F90dSK1e/zPAbgX5p8DNBcT1mW
	daqj9GY2wl4o7r0LxHzvNXHNFdHahSPt+wtmp9o3gve3KFMi/gZzLJ+k2lKU7mzv
	lRN+J79LnAsL7YpkNnGDuSps4S6VeNBZ+jV1OgzDabUoqPteaYQBT3zqnFMHS8Rm
	Zzpzgw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1b9gyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 22:39:51 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a3451ea93so349509eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 14:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794523191; x=1795127991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0jw8JKgv0n0ezdqZ8dsYLNGQSrLdfYWJ7gZlA49lV0=;
        b=fj+43oaQb7W17VghbCtiaJXL6dS3HCupr2yoW0NgM4Vyos/XAZ8QLRD0+BQzivJC1Q
         MT+M1Pk40l1v29lvp6bEoPQc+NLmjchyODP/g75H90zAw+1/IoEht1eveBWhcuXJiNXx
         NixaxkG5edH5wjNmFEsyPp3T9AzbvU5HnLkYlpEaFFfHjwxQWPqzr/5mCvMPrudGNzwT
         Rdwr3QFhXz0uei539IIpqGybtzXauQLIyLuGEEadZRrbtl4gcWBV0TY7U8COKWjC05kl
         PLMxEo0V1n1abVUmLyr4dPqIgsXmwe2ya1wG9pgeMifPxfgZgzO3LpRRWL2fPJYL84uY
         RZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794523191; x=1795127991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0jw8JKgv0n0ezdqZ8dsYLNGQSrLdfYWJ7gZlA49lV0=;
        b=CsZx+ptCdSFOctVh/w5C36fB/axRaJs3v9cTE9lI+2tLqyu6yM+7deGcf9uH8nuZLb
         lyRRF/5mXbsoOaEj/7yPHmzXS1Md0zU1FXLSMxw51V+fVVi2S5D6CrTem39R4kUMcHIf
         wdn8jjheL1qJO8Ak9D+gaqkskpWFkEifwZVc3io97QJXHKiFnAJI/Or6fmKMrLSXJ42C
         dTlOPAT8oLBMq9fqxuAmzWa3SF1eOQhsQCK1yALhVbJVj4SRJbqEj3+/5l+t1ewBIV3T
         RNurg1Yb7RECVVeUSlNaLOL0Ze6cEOaSyFkZls9EkUtImUGk9MU/zgdJQaHBl1EuUmxU
         mMeA==
X-Gm-Message-State: APuU4Z/Q1PdQbTLvsUT7tJK2l7nE0Pu/FEuvgKkXp3Y67oNAUD2AVfph
	6JM25ZKOSPsHYvBVwAGqB2VS8jgkn8K5qXyYYDNjNvNa1KDhVfSFNp09lqbAB2TeTZAG+NgdZU9
	e3nIatc1kyDqgWG99VR1k2l3HwqGozHhO0SxjvPxVLeaz2p02duxLIy19F2pKaD2MmoEK
X-Gm-Gg: AYBFou1VV4ZAvL6fkukRq/o1EAApR+zr3hhY2OmYPuu2Xv/wg5QZb+hEekGpw/TQo7r
	i3HYvBxuR3yGSZuy3a6V5CEeqJACPgjG2x9jYFGvL37ALFOI8YJUyzmX+RTaiDVA4tY6oxWGo1E
	oHIvS+aUdOTWhCicLDLf8XpBEUBWNomVTydz28f1eIM98IZYtgRBXIIMrqoU4FBI4DCd59znjMJ
	6qfSqe0q0XzXB5lFztrle4RHh8V9R8589ZaMHg4lZ2h11D+5aRkNAqB5kmNi8UbTg72IQeGWfBM
	In6nx47bKYND9pI3OR34UG2lO7E5bzs2EST7Db2MD8HvX4Ol0iR5dhYHShw1/wAQOAZ4rY78axF
	XZ4eRNQNN10FJwIYj1XrZul6bh4HcaDpmqkMqM7YsggLi7h2fmxwNAUBIZ6GTl/MoQ46YCth3VW
	gpcQN+aFy6ew==
X-Received: by 2002:a05:701b:2050:10b0:18d:5ef2:1644 with SMTP id a92af1059eb24-1b5031247b2mr877022c88.30.1794523191089;
        Thu, 12 Nov 2026 14:39:51 -0800 (PST)
X-Received: by 2002:a05:701b:2050:10b0:18d:5ef2:1644 with SMTP id a92af1059eb24-1b5031247b2mr876999c88.30.1794523190428;
        Thu, 12 Nov 2026 14:39:50 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm2333496c88.5.2026.11.12.14.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:39:50 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 04:08:32 +0530
Subject: [PATCH v13 6/6] arm64: dts: qcom: lemans: Add OPP-table for ICE
 UFS device node
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
Message-Id: <20261113-enable-ice-clock-scaling-v13-6-258dc817bd63@oss.qualcomm.com>
References: <20261113-enable-ice-clock-scaling-v13-0-258dc817bd63@oss.qualcomm.com>
In-Reply-To: <20261113-enable-ice-clock-scaling-v13-0-258dc817bd63@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af64037 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ASeq7m8wwX9lxpDCPrQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: JChGMjSX9cv0OgdtdmPPzV5-Nj13AEVG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA5MCBTYWx0ZWRfXwZV9cCBbeGiW
 SMW+h5EK5YbVDfJDiUOwYuwTu0Z+bwXO6/BeBXjesl/vOATHYOrjDvBV35XP0FxdJZ7l6p2VQmr
 6Mc6Th0M85/Wp033gzkIgY9EKwYrXSgsm+nBys0Gvjv4H6RJDic9vSh63qcGrI6eZJwqPXsF+ZU
 /PCh+pAN4PWKlgnxpAyDYLWJWF83l752ohX0pzqEIiy/4Do6qlzUvVXLcKr7rB43X98EvcJ0Fiz
 9VS4Toxv/7fujzOlty+uvmrgoMGoPALKXFN6zWFeMWT34+ztHw6oOdEzkHtsX8H14ve5XvaNFCj
 MIfsIy8eQApWGpR2Ppb1wE3d95bCvTUKwH8KjT1FXJX6UrlZY/jsWPz7V45gey+T88BGn/L+eVV
 ySiJQtnlRhG5pRoc7pPPypqrEriU2an7HMJp7HeV+JwDcw7lHFOQETE3x9AD+lWaETQ8EJq3uAU
 2f9OrMFjLLiRhatJ7FQ==
X-Proofpoint-ORIG-GUID: JChGMjSX9cv0OgdtdmPPzV5-Nj13AEVG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA5MCBTYWx0ZWRfX94PaEbx/n10Y
 ncRvvWR1BPeTkNuqC67zgZGzFujNGWpCOx2u/aI61cm5VuxruunN/woiuv1KaIpJfTMWnprZo9J
 SI22A5VMr9LE5HE+Pc8Id0k7ztnXLb8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120090

Qualcomm Inline Crypto Engine (ICE) platform driver now supports
an optional OPP-table.

Add OPP-table for ICE UFS device nodes for LeMans platform.

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
index 0be39bb9de1e1cdbb7d67a992172861a5a10a05a..a80fd8f96427488c20205c5ad798413aeb53964b 100644
--- a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
@@ -1840,6 +1840,32 @@ ice: crypto@1d88000 {
 		clock-names = "core",
 			      "iface";
 		power-domains = <&gcc UFS_PHY_GDSC>;
+
+		operating-points-v2 = <&ice_opp_table>;
+
+		ice_opp_table: opp-table {
+			compatible = "operating-points-v2";
+
+			opp-75000000 {
+				opp-hz = /bits/ 64 <75000000>;
+				required-opps = <&rpmhpd_opp_svs_l1>;
+			};
+
+			opp-150000000 {
+				opp-hz = /bits/ 64 <150000000>;
+				required-opps = <&rpmhpd_opp_svs_l1>;
+			};
+
+			opp-300000000 {
+				opp-hz = /bits/ 64 <300000000>;
+				required-opps = <&rpmhpd_opp_nom>;
+			};
+
+			opp-600000000 {
+				opp-hz = /bits/ 64 <600000000>;
+				required-opps = <&rpmhpd_opp_nom>;
+			};
+		};
 	};
 
 	lpass_ag_noc: interconnect@3c40000 {

-- 
2.34.1

