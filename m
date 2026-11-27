Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749033;
	b=AspAr032v5jR1DHBUnpJMxKAwaLUI+lRoWYLABbZb3jreM+9ETSZ0XpECPCQ0qKiVrZ2
	 kKJMzrpZi4I5XH41InfzKPENdEJW60Iu2Odu/L7xp9wpH7IJB8v1mxO+1fN6Pv1Om5qqK
	 jfeK6FVlMByBuaN2aPOJ0kH+i2CFaLlC+Aj+Na6MpcXWFALgLZzC/V4YVuTrZOLmnfSvI
	 4UmsnNBjfiLHHqIYDlzIa5JHb3AdF8IbjJfie/4yMbWLsWsYGbZg24ckWjkeTitTgDzbI
	 J0eoilisOKDZlEMJm8diZMtoxgtpkVmgalmzOFcWroHg8/7SVuGLaFsAPH5bW9ZdP3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749033;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gW6RiFa7wD8wSJ7uf6A31scjePj+O1vbxaUoxkyfn+U=;
	b=Df4RfIdzVbvg+rWUCWNGTKOisGT71GX3X3eQ/vOX1bHFnPYoOHWxJmaq5F096/Npr0B4
	 45NiVt5a8Yg0XK4Iqz/QyrGhhnOj3Icwclz9Med6TWCim8SXDxfB3RaFqFMhXzt/0zOCU
	 FAeLtuvwsHVEWpqbYFptFryPKMbrRgvkPSSZONFa3NEN0YT0CSaq8MF6qn+b/bQ3fAq6L
	 q46n8Cl9wVRZQq1Vx4xOnPIZwt35JUiXC/HV7X9FAxrTVmC//NRt34kgkyEYDqs+k7S3F
	 37jnQdpZ5SosXJL3mN1QJVpGq3laO0bNlMT9TYUJO7r0S93qjLz/0bTK5R4L3//A3XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="lj79IP/M";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZA67ViaH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5411606A329
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 03:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5411606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lj79IP/M;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZA67ViaH
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJw8Pb2573800
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 03:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gW6RiFa7wD8wSJ7uf6A31scjePj+O1vbxaUoxkyfn+U=; b=lj79IP/MTn4Zgxm1
	g01SHjpG2rruMfVdYV430vy2Y+yqdtJyh/FFfnTkRm6jZEmOGiFQFZ17rKy9/Gkk
	j2t5E3blU5c9jHJ8vIPRhAc2c7MjiN5ptze+VhMFrSFXBWdXkQwIfaEHfh0Doauj
	n7xAQT14bS/hSxZXpAVsyXqC2dPZ7GEBIl+lAZkBqWbUn4JY+UjyMjOp0S5wSgiY
	VRSnUAsYnJy0nqZWR+/xTCLl1zzVKq+Y1nf+gD/elWRV+D9meyagUg6RrejL+WFA
	iAa6jrqhv6BvJzpsiLY38fPN36uhGc8zc2YLTX1zPge/JQT44+JuvKRShWS/ak06
	DIPmWQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u498yrv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 03:10:30 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a06750c74fso5433997b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795749030; x=1796353830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gW6RiFa7wD8wSJ7uf6A31scjePj+O1vbxaUoxkyfn+U=;
        b=ZA67ViaHlP0fbvZsx6I9VqPL90J5ZFUNyn3xDz9hKE6FlFyNr75ff6jAXPoYiGNWb0
         j6fqLLrWlkRk6P1Z+SPk1ut8SX3wUuNetAMFGa6y2oAX50uUYnRPJoqmLKe3CgDuCaeF
         /zqivD7NTCROEtf1bCg72DQjNWVbPrB0TRd3syk8TFM7sE2UatOPWZD16aD3CBscR25L
         3YNd+rpWNlSHpPODR/9DHwlXcAAfEETvWN14McZQVlc4pGl7N3oaRCoUNZ0eRubtpOt+
         jdoPDpK4xNVqC4aBlvKqPffbvdgbzVLBRUVWA6li77arig8ApPlAhbHfHv4lCyZDgsGY
         w6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795749030; x=1796353830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gW6RiFa7wD8wSJ7uf6A31scjePj+O1vbxaUoxkyfn+U=;
        b=H3hPxTal6xJqm7AC0TifncNk8pKnpAU64rZ2rX5zHr6xCsefNQbu25mJaAYfkvYdyx
         HfxbR5PypmR9GRv74Ifwl6/Dq42UBlChVGjZ1BAtfQMne7JJJQEasmh0OLJneErY0O9b
         +QIcLk+3Fgq31NaMZWo3m8G/jhBuLQWqssaaz0CzbIjwHj+xOmjv31m5WjP2sdsCe4+6
         7wbA9qfgEHpOBLJZDjL7G0PDVMSlYfvoTGXIQXrmdrliphKQHweaHAXqcP+k4x9QvYtB
         Ig9IK/kCazEm+lySDi3vlrZSYMxoyCv6vkTvVE9zCFq1bwfpRJNZ2p2C0YjMLgdeanwv
         rqzQ==
X-Gm-Message-State: APuU4Z93ywtMwUW1OFiWJLAKQt0CupMSv8aJMmhYssWIdmr3oTUOvrxM
	WJXwM21tjxquQbaq+YKvkFIUHXSCMUQktF4PrHVALMmzHV/H1/5xFpgqBsZuIIAE/arbU9Xkb1W
	VJ5kjXLDeSVmZi8PHHtqb25FQtGcJXDpM0pOAIiKHvHX1u5zcfg8my26S5ovDgN++HQGV
X-Gm-Gg: AZFdTZd/uE0rmUyVSt14LbEfqhnHtfvacKAGijgFV+Pg+8uSApHGkEFzT0ET9ScQo5p
	h+pQ3pv1P2sJOOmdJW8v4X0/3br4sSszn4gb3+P66/SzUTv2uOWVsv00jXkItkdDedP+1O323Ze
	XFYYAas1Nm0JB2jx5OER2HEUqHaaf7GoXj9yrSRPlSz7sbsS6tyFT5MjPSlZODNpgSSZFy9FYDD
	dpUuygm1Okx9dftSSnTCDAGp6/4FvgoaKviy9jY2Ga415VkmLxMBZ74HG5kKIVYVsgkKVPWUF/c
	6eQb9nWwYeFsfTN/SzPVaRibbjOOCljZhilVTHH1f0ZR/koXmnQ2vyWI+Ldm9AVYfLsIZ6aIfpV
	vK7DqNlwngbb4JAgcfh9HGqSYy8Fr1vEL8N3vlQ73TZD7Ze58k5gn5sjaj9w26b8cyqGisf7DA6
	XekEUT8xYwIkLhtm4lZtvf1BISA21r9O2xLz0=
X-Received: by 2002:a05:6a00:409b:b0:89e:7bfa:f86e with SMTP id d2e1a72fcca58-8c87bac50cfmr20034193b3a.13.1795749030122;
        Thu, 26 Nov 2026 19:10:30 -0800 (PST)
X-Received: by 2002:a05:6a00:409b:b0:89e:7bfa:f86e with SMTP id d2e1a72fcca58-8c87bac50cfmr20034164b3a.13.1795749029575;
        Thu, 26 Nov 2026 19:10:29 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f726sm12157354b3a.36.2026.11.26.19.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:10:28 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 11:10:08 +0800
Subject: [PATCH v2 1/4] arm64: dts: qcom: hamoa: Add CoreSight nodes for
 APSS debug block
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
Message-Id: <20261127-add-etm-devices-for-multiple-qcom-platforms-v2-1-42d47474a67a@qti.qualcomm.com>
References: <20261127-add-etm-devices-for-multiple-qcom-platforms-v2-0-42d47474a67a@qti.qualcomm.com>
In-Reply-To: <20261127-add-etm-devices-for-multiple-qcom-platforms-v2-0-42d47474a67a@qti.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795749021; l=19729;
 i=jiegan@qti.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=nQkmuMsEUh2Nr6JHEYwHFxnsyUeaYVCf0RBrf8kDreM=;
 b=YRl53Qyqes+TBje+r6vrTpsa03ZF3RslwmbwJ2iP2gQeVROfZLIfDuVFuIhTiyodR1zEpQc70
 Xt93yU9pxPzCGSy3eQubNYwxbGg4j3HyVq/u2oYSCBWRu4BxPptNM4e
X-Developer-Key: i=jiegan@qti.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: lCi9z9ZK9r1dkl_mSbSjuYrJG9iMSfF1
X-Proofpoint-ORIG-GUID: lCi9z9ZK9r1dkl_mSbSjuYrJG9iMSfF1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAxMiBTYWx0ZWRfXxpAOtXUUpGxi
 xfcdrtTTsoXH5gI2uIn8Six7hbmJ2f0pz9Kq3bH36ybOZNWAVYp68WrQ4BWqAAqapLSCNFcEVLO
 hj/NdXAaJ6/0/vFGvnZiqNeFEWQCtRQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAxMiBTYWx0ZWRfX3RtoqL0cGWyC
 /Pvk071OyfH6DH+2OCfjJWkKc7CywH5s4Q9PAubhX4veiHO+9aSiiowzQu+iBBQUU34voyfE1r2
 3+jWxwB+yaVqpubb/f6N2G8wkyOh2QasZJ1yvn0qSGPQ9caEt8arHpE6Jddi9ECDaOH5rmQyhvX
 41eAnPSE+5HKlwanhwhop2UpPftGxh7xpYH04lSJs67gz35AOTpPa9pGj8hu8hshi+3GX+cgUN/
 BIm/xuIx4cYQJdEwme08slmCIsX5cXmfc/jCAlASuxVV/rkeAeuxgklQeCDq2ELGyHluU3IRz/t
 EjlvIXbwlqq/jhkeuI2zKgG1FXGL12ndMADEvLofXgdhggu8gox9nTwrs9Bp2uO4/b2MKcYcNDc
 oOrDj3cE6V5/0ih5i85yNZiCD+t7E9RtqofSXMtmpwX5c51ZrqC8d84ZmQqf51zK8HC+0PzpNIS
 1h/EfC036nhyuB+38Qg==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b08f4a6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=RxcEU4ttGZRFM8buTTcA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270012

The APSS debug block is built with CoreSight devices like ETM,
replicator, funnel and TMC ETF. Add dt nodes for these devices to enable
ETM trace.

The replicator, funnel and TMC ETF nodes in this block are physically
powered by the CPU cluster power rail rather than by a dedicated always-on
rail. Add a power-domains property referencing the corresponding
cluster_pdN domain to each of these nodes, so their power state is
tied to the CPU cluster domain and the runtime PM core can power the
domain on before the devices are accessed and let it be powered off
otherwise.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 884 ++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa.dtsi |  12 +
 2 files changed, 896 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 443c1a5c212d..be8c8c8b0145 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -327,6 +327,210 @@ eud_in: endpoint {
 		};
 	};
 
+	etm-0 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu0>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm0_out: endpoint {
+					remote-endpoint = <&ncc0_0_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm-1 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu1>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm1_out: endpoint {
+					remote-endpoint = <&ncc0_1_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm-2 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu2>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm2_out: endpoint {
+					remote-endpoint = <&ncc0_2_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm-3 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu3>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm3_out: endpoint {
+					remote-endpoint = <&ncc0_3_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm-4 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu4>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm4_out: endpoint {
+					remote-endpoint = <&ncc1_0_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm-5 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu5>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm5_out: endpoint {
+					remote-endpoint = <&ncc1_1_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm-6 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu6>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm6_out: endpoint {
+					remote-endpoint = <&ncc1_2_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm-7 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu7>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm7_out: endpoint {
+					remote-endpoint = <&ncc1_3_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm8: etm-8 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu8>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm8_out: endpoint {
+					remote-endpoint = <&ncc2_0_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm9: etm-9 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu9>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm9_out: endpoint {
+					remote-endpoint = <&ncc2_1_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm10: etm-10 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu10>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm10_out: endpoint {
+					remote-endpoint = <&ncc2_2_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm11: etm-11 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu11>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm11_out: endpoint {
+					remote-endpoint = <&ncc2_3_rep_in>;
+				};
+			};
+		};
+	};
+
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-x1e80100", "qcom,scm";
@@ -7000,6 +7204,14 @@ funnel1_in2: endpoint {
 					};
 				};
 
+				port@4 {
+					reg = <4>;
+
+					funnel1_in4: endpoint {
+						remote-endpoint = <&apss_funnel_out>;
+					};
+				};
+
 				port@5 {
 					reg = <5>;
 
@@ -8447,6 +8659,678 @@ ddr_funnel1_out: endpoint {
 			};
 		};
 
+		funnel@12080000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x12080000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					apss_funnel_in0: endpoint {
+						remote-endpoint = <&ncc0_etf_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					apss_funnel_in1: endpoint {
+						remote-endpoint = <&ncc1_etf_out>;
+					};
+				};
+
+				apss_funnel_port2: port@2 {
+					reg = <2>;
+
+					apss_funnel_in2: endpoint {
+						remote-endpoint = <&ncc2_etf_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					apss_funnel_out: endpoint {
+						remote-endpoint = <&funnel1_in4>;
+					};
+				};
+			};
+		};
+
+		funnel@13401000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x13401000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd0>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					reg = <2>;
+
+					ncc0_2_funnel_in2: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_2_funnel_out: endpoint {
+						remote-endpoint = <&ncc0_etf_in>;
+					};
+				};
+			};
+		};
+
+		tmc@13409000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x13409000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd0>;
+
+			in-ports {
+				port {
+					ncc0_etf_in: endpoint {
+						remote-endpoint = <&ncc0_2_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_etf_out: endpoint {
+						remote-endpoint = <&apss_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		replicator@13490000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x13490000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd0>;
+
+			in-ports {
+				port {
+					ncc0_0_rep_in: endpoint {
+						remote-endpoint = <&etm0_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_0_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		replicator@134a0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x134a0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd0>;
+
+			in-ports {
+				port {
+					ncc0_1_rep_in: endpoint {
+						remote-endpoint = <&etm1_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_1_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in1>;
+					};
+				};
+			};
+		};
+
+		replicator@134b0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x134b0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd0>;
+
+			in-ports {
+				port {
+					ncc0_2_rep_in: endpoint {
+						remote-endpoint = <&etm2_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_2_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		replicator@134c0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x134c0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd0>;
+
+			in-ports {
+				port {
+					ncc0_3_rep_in: endpoint {
+						remote-endpoint = <&etm3_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_3_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in3>;
+					};
+				};
+			};
+		};
+
+		funnel@134d0000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x134d0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd0>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ncc0_1_funnel_in0: endpoint {
+						remote-endpoint = <&ncc0_0_rep_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ncc0_1_funnel_in1: endpoint {
+						remote-endpoint = <&ncc0_1_rep_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					ncc0_1_funnel_in2: endpoint {
+						remote-endpoint = <&ncc0_2_rep_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					ncc0_1_funnel_in3: endpoint {
+						remote-endpoint = <&ncc0_3_rep_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_1_funnel_out: endpoint {
+						remote-endpoint = <&ncc0_2_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		funnel@13901000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x13901000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd1>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					reg = <2>;
+
+					ncc1_2_funnel_in2: endpoint {
+						remote-endpoint = <&ncc1_1_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_2_funnel_out: endpoint {
+						remote-endpoint = <&ncc1_etf_in>;
+					};
+				};
+			};
+		};
+
+		tmc@13909000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x13909000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd1>;
+
+			in-ports {
+				port {
+					ncc1_etf_in: endpoint {
+						remote-endpoint = <&ncc1_2_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_etf_out: endpoint {
+						remote-endpoint = <&apss_funnel_in1>;
+					};
+				};
+			};
+		};
+
+		replicator@13990000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x13990000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd1>;
+
+			in-ports {
+				port {
+					ncc1_0_rep_in: endpoint {
+						remote-endpoint = <&etm4_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_0_rep_out: endpoint {
+						remote-endpoint = <&ncc1_1_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		replicator@139a0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x139a0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd1>;
+
+			in-ports {
+				port {
+					ncc1_1_rep_in: endpoint {
+						remote-endpoint = <&etm5_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_1_rep_out: endpoint {
+						remote-endpoint = <&ncc1_1_funnel_in1>;
+					};
+				};
+			};
+		};
+
+		replicator@139b0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x139b0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd1>;
+
+			in-ports {
+				port {
+					ncc1_2_rep_in: endpoint {
+						remote-endpoint = <&etm6_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_2_rep_out: endpoint {
+						remote-endpoint = <&ncc1_1_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		replicator@139c0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x139c0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd1>;
+
+			in-ports {
+				port {
+					ncc1_3_rep_in: endpoint {
+						remote-endpoint = <&etm7_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_3_rep_out: endpoint {
+						remote-endpoint = <&ncc1_1_funnel_in3>;
+					};
+				};
+			};
+		};
+
+		funnel@139d0000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x139d0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd1>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ncc1_1_funnel_in0: endpoint {
+						remote-endpoint = <&ncc1_0_rep_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ncc1_1_funnel_in1: endpoint {
+						remote-endpoint = <&ncc1_1_rep_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					ncc1_1_funnel_in2: endpoint {
+						remote-endpoint = <&ncc1_2_rep_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					ncc1_1_funnel_in3: endpoint {
+						remote-endpoint = <&ncc1_3_rep_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_1_funnel_out: endpoint {
+						remote-endpoint = <&ncc1_2_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		cluster2_funnel_l2: funnel@13e01000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x13e01000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd2>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					reg = <2>;
+
+					ncc2_2_funnel_in2: endpoint {
+						remote-endpoint = <&ncc2_1_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc2_2_funnel_out: endpoint {
+						remote-endpoint = <&ncc2_etf_in>;
+					};
+				};
+			};
+		};
+
+		cluster2_etf: tmc@13e09000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x13e09000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd2>;
+
+			in-ports {
+				port {
+					ncc2_etf_in: endpoint {
+						remote-endpoint = <&ncc2_2_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc2_etf_out: endpoint {
+						remote-endpoint = <&apss_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		cluster2_rep_2_0: replicator@13e90000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x13e90000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd2>;
+
+			in-ports {
+				port {
+					ncc2_0_rep_in: endpoint {
+						remote-endpoint = <&etm8_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc2_0_rep_out: endpoint {
+						remote-endpoint = <&ncc2_1_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		cluster2_rep_2_1: replicator@13ea0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x13ea0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd2>;
+
+			in-ports {
+				port {
+					ncc2_1_rep_in: endpoint {
+						remote-endpoint = <&etm9_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc2_1_rep_out: endpoint {
+						remote-endpoint = <&ncc2_1_funnel_in1>;
+					};
+				};
+			};
+		};
+
+		cluster2_rep_2_2: replicator@13eb0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x13eb0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd2>;
+
+			in-ports {
+				port {
+					ncc2_2_rep_in: endpoint {
+						remote-endpoint = <&etm10_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc2_2_rep_out: endpoint {
+						remote-endpoint = <&ncc2_1_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		cluster2_rep_2_3: replicator@13ec0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x13ec0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd2>;
+
+			in-ports {
+				port {
+					ncc2_3_rep_in: endpoint {
+						remote-endpoint = <&etm11_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc2_3_rep_out: endpoint {
+						remote-endpoint = <&ncc2_1_funnel_in3>;
+					};
+				};
+			};
+		};
+
+		cluster2_funnel_l1: funnel@13ed0000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x13ed0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd2>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ncc2_1_funnel_in0: endpoint {
+						remote-endpoint = <&ncc2_0_rep_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ncc2_1_funnel_in1: endpoint {
+						remote-endpoint = <&ncc2_1_rep_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					ncc2_1_funnel_in2: endpoint {
+						remote-endpoint = <&ncc2_2_rep_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					ncc2_1_funnel_in3: endpoint {
+						remote-endpoint = <&ncc2_3_rep_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc2_1_funnel_out: endpoint {
+						remote-endpoint = <&ncc2_2_funnel_in2>;
+					};
+				};
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,x1e80100-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x100000>;
diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index 4348dd3d1dc5..96799b381f63 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -8,7 +8,15 @@
 
 #include <dt-bindings/clock/qcom,x1p42100-videocc.h>
 
+/delete-node/ &apss_funnel_port2;
 /delete-node/ &bwmon_cluster0;
+/delete-node/ &cluster2_etf;
+/delete-node/ &cluster2_funnel_l1;
+/delete-node/ &cluster2_funnel_l2;
+/delete-node/ &cluster2_rep_2_0;
+/delete-node/ &cluster2_rep_2_1;
+/delete-node/ &cluster2_rep_2_2;
+/delete-node/ &cluster2_rep_2_3;
 /delete-node/ &cluster_pd2;
 /delete-node/ &cpu_map_cluster2;
 /delete-node/ &cpu8;
@@ -19,6 +27,10 @@
 /delete-node/ &cpu_pd9;
 /delete-node/ &cpu_pd10;
 /delete-node/ &cpu_pd11;
+/delete-node/ &etm8;
+/delete-node/ &etm9;
+/delete-node/ &etm10;
+/delete-node/ &etm11;
 /delete-node/ &gpu_opp_table;
 /delete-node/ &gpu_speed_bin;
 /delete-node/ &iris_opp_table;

-- 
2.34.1

