Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516565;
	b=wxq0fEUMDrWMIj85W0bxt1zhAxexYV9phRm4kbgV9wO74oIu+LdX5Oa7wG1dup/NGF2K
	 zRwJJ55NRTEP3AWoDNExQqGjUqoiMujMPoluJbUruj/wu/8/mOgNHgXpIJCniavgQWrrB
	 ul5jjYvtKIXlmFeuYd7OLK0zLxZ7Lz5PNeIovcSzoe2kHXj6FcKeigxibY7ZEAFElx85E
	 MXb9xc9+HWOJt76XyzQ7l1f4b0c1wV8VLRFTEP5OYsuRnVbuKomW7WNV6OZXFrJdYps6q
	 p7SDJynSxQpLYG8Ekg54elwOwnPUlj+/JfwVNxFJI2kdxwnQnnEXiKNcqmSf365+oQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516565;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AX5ShC75QqMnAvHBouDQDna9aWsDB/3vfRudzH6Afdo=;
	b=oWkB/uGC9TgBKdlfGXIuxE29K2QD0OjBLGz3Y2jFcaEnOlbTWPnXxFPzwHTHdUJXcl07
	 DXuHe220GxkdtT6ts/7loJ4H8c+Eh9Jb3YP/pMXsF7f30NNbftJFeiIFhD7/0HVdIWHRj
	 RVMDe7P2t1ZYE0SVfpcLVvyJSnohWt777xkRazaRCxIXhqy24aFwCYs4c9hTWZ1RXudKo
	 CFC7DJxloIfZgWz811zficRTJNnELndnAGz/98Y519bN26FmfHrM+mgYwy6hDjDPd7wyq
	 HBLKyncU8VYaptxKBTI4zkqrfhXj2Uwc6McFLG41XFPiionIZYxY5rKxzmkdo8pcixw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TeQ7D86d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eAtPUDZv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C16606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:36:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04C16606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TeQ7D86d;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eAtPUDZv
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8Q1lS3701111
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AX5ShC75QqMnAvHBouDQDna9aWsDB/3vfRudzH6Afdo=; b=TeQ7D86dwsPo7Hvt
	sb7hh/Q75A+37LcIUnzs9PCmjYhvQNzgxlNBhAQD8662rdzuVsNEROI2IGXp/wkE
	FO4LfN9VDC8KMpIRg89Hfs6qJNjwSwxaxjs5bXhr6fCb09xmG6fuucCNuFaBzCUb
	WeyroypYU7nciA4fnQySHIoQCKVKpHQj/LqJ4T03FBK6YS3W8apkQcL0ZjhB7HLi
	wBmo3fQHQmkxv7DXn3DjsYNO42D2tIXU9/3Aig9kVliJPJ+gP/CQHShrChBId8Bz
	74ybMIqYSlD6KLzHsBeJsppn4LUtONfWMrL/RtbQJldPHDptGJqHB3pXA6y1KhlI
	l74SDA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky23mu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:36:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b4139b7abcso4157517a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795516562; x=1796121362; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AX5ShC75QqMnAvHBouDQDna9aWsDB/3vfRudzH6Afdo=;
        b=eAtPUDZvzFV0vef41tvqE9DseqSVJCiW1uTzXqHtW0XbT9ISA8KGLc2Mvq8CYgxMoI
         IzXJGnNE56uzIqP2iHWTHS/Vx/D5QWuSjgDeSIn/WXrXzTam6o8J+WfBTxjYbosh8AWk
         dznYV3GRMNv4BhIwfwBSqN/672HqoqC3aqxp+2NocHezPhcUi8sy8U+xxEhzektPcqlW
         2tTVag0Ykv2H+beFjnrIRT+gDSjfMjEftzmPcBieHvmAYY68cJBpJODeZIp14jSObF97
         GM0sRFtNtVSao1KQZqzIAmDWZDiSJYHNg395OYthmxSdG4IsYHuIjHESizvpk/FIL4RM
         heFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516562; x=1796121362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AX5ShC75QqMnAvHBouDQDna9aWsDB/3vfRudzH6Afdo=;
        b=u9xO1eQhAMe7e8DBRHvOfokZMFmK572sgZESvPRc7lGr1uDNEwnJeDdiRTxhBLSNXF
         HHwK/R1nLfglucnrDQPG6zXoitpdl0v5/03J4CQiUyUfSNh1f17JvzNKdSpKDab5BI6p
         bnGwiVS9phV631HdQsal63XEAObaqIM59WkOSPJ5Qm00l0uBAk+/bJbYM1o5xD1pJQlJ
         a40mPE4jgi+ybxY5sZfIgpjoKdSoIKK6zrPZeeVHRqNwcE3zo1TWkomyqH70yPKrnHNT
         2MMrAkzQHa/JqJ0JTCaviRY1/xeAJT5x4ycekL/iNsS54CCJiG+VWCVQ5A8L+ANVK7P2
         jFtA==
X-Forwarded-Encrypted: i=1; AL+hErE+EkYhwFN59xx9DPSJ9JBENnrcxphakNHzeYP9bkiu4PIZMDhk4LdC9jFdourEK8LvN5GDFGMQ+Sq2omn2@vger.kernel.org
X-Gm-Message-State: APuU4Z+AqdldMoF/VvHtl4/LRnjgMPq8crHdyYWSLOSboby1H02hyEH8
	sPPDJ7vaMTo7bF7SuDs5A/xtUw9FQvUFwlLNKYNkMI1d1KQ6TVyGzWXNd9675krC83JVsjvLggn
	8OarQd2vB0O8+i2oF6p5uh0txwlhiZIzJH+NeKE8eHZmBKNsfgP75irS0J7mA1R25eAHf
X-Gm-Gg: AZFdTZcJ7E+7ugbN+aAH9VYfdIVQHIu1bPk62B1xLEuCrnCO35DoNFIueH+G2/k1pdJ
	cLrOqHlRQMYCd3PVXgp91Mb4yNM1uhpIGH0Mxk4f2vcQYzN0rzcGHjw/k8euA0Ps0/Mmc+IlMM+
	E2LuAPNMS18eDW482eCzIKXw0D+F3exvIxaH6h72ra/a6whA+6atyLlExp8CMBiXEKJKwloI5zT
	A/PEZA0Tz4wamsqO6fhPZUA6EXsyFs8MbGMRFIps3QA+PASzWFc+CyC9hP8BHTv+H0W5I08b+L8
	C+lJjc3X0J/ezxZHa8XczcYjslgvIEhWbOrDr8YEaBlE4wDaPbYqt7XqzF9JlSrzG4soOZEeOiU
	DMouA1Te7ElQ90F7gtIdqX77WvMuUKE75ANFOLlOHUG+bYVFvjiQheQ9xbcEjGlyLH43UZROi/z
	BQIF4BlSymVzJt92ohGPqsaXXgN4dvR0+slQdA
X-Received: by 2002:a17:90b:3d92:b0:3b1:2237:3c93 with SMTP id 98e67ed59e1d1-3b41c8de8d7mr11035131a91.18.1795516561883;
        Tue, 24 Nov 2026 02:36:01 -0800 (PST)
X-Received: by 2002:a17:90b:3d92:b0:3b1:2237:3c93 with SMTP id 98e67ed59e1d1-3b41c8de8d7mr11035114a91.18.1795516561212;
        Tue, 24 Nov 2026 02:36:01 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b75f2a4sm9162295a91.2.2026.11.24.02.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:36:00 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 18:35:32 +0800
Subject: [PATCH v2 2/2] arm64: dts: qcom: eliza: Add CoreSight debug nodes
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
Message-Id: <20261124-add-coresight-nodes-for-eliza-v2-2-48926f5a97ed@oss.qualcomm.com>
References: <20261124-add-coresight-nodes-for-eliza-v2-0-48926f5a97ed@oss.qualcomm.com>
In-Reply-To: <20261124-add-coresight-nodes-for-eliza-v2-0-48926f5a97ed@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795516545; l=42302;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=ON8rHWy/0xGiAV4Io9mLv18UbZGWacolKPAQyq2AV2E=;
 b=aLHrg3wOCnZd6VkAkrLDbx2NP36rdw7F0XC7FzF1eIkvLe9JY+TuwgVoZpFM5blT51eCxZzTi
 jhtyPUecD4/A1DtDXCGX041Lw9w/4LOO9dA3EkM8aocfi/NBr3Rzady
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b056893 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VB87f_fc3BoEAbQ529IA:9 a=nRKGNUgEC7ZbErIA:21
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: sXpqlaAVzpJ4At3B2aNLxPY5q2qjIH7P
X-Proofpoint-ORIG-GUID: sXpqlaAVzpJ4At3B2aNLxPY5q2qjIH7P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MSBTYWx0ZWRfX7jU9T/+1Jam9
 seH2iBgkha9Yv4ood1inO9TbV5NfwZFvnpGxPNLQcvF4SQbP8bZCgpxui4JoquY+njBKjtDRQzf
 DgnPGBsNfAzj6zxdZO81UU0NfODLDb4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MSBTYWx0ZWRfX/BYCv4/oUW8A
 LSODhsoG7ENl8tsFZvnUjKehLBYiOPtEANLMTtWM67yrAkLYT2o21fMW+1EIXaKq7VyQbq6S8vZ
 iG1iDd38U9IQ8S8FPUZJf8xNOOoNxEfqkCvvmfZIw44u0u3yGmvEtsQNaYkx4HJ6+LaTZ244lwz
 4cQHTqqFvGT9BvK0WmomRUj6W14zG6OCP9BkVJ8VD5fBfY4D2Hj3PmpQ2jOuuq/p2zQe7VzmNwm
 WsFVlxA2Jh7G42czQK3iOt6T4uO3pKUwHAn8IBYo5etNvIxKy2/a5KGn0olMKLH7gBB9909k9i8
 I0X7xpyXuzyW/huhZDq3OCQQ2Q/9lkTXZ7rDtXKcHy9fpQgtrW6P1Pu5u21r3TbU9xKLV1Z0tek
 XuGR/OLME4ANQ0OmiPb/e72Aq58itqYBu9Kn6ErO9gRZa7KR5bnxtCwjpNGax5GoU5z0mLjrdzV
 pEcRKEXTP0B6U34gs/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240041

Add DT nodes for the CoreSight debug and trace subsystem on the
Qualcomm Eliza SoC.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 2137 +++++++++++++++++++++++++++++++++++
 1 file changed, 2137 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a125ef386c0..f8774d1e615d 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -33,6 +33,36 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	audio-etm0-0 {
+		compatible = "arm,coresight-dummy-source";
+		label = "audio_etm0_0";
+
+		arm,static-trace-id = <40>;
+
+		out-ports {
+			port {
+				audio_etm0_0_out: endpoint {
+					remote-endpoint = <&funnel_lpass_lpi_0_in0>;
+				};
+			};
+		};
+	};
+
+	audio-etm0-1 {
+		compatible = "arm,coresight-dummy-source";
+		label = "audio_etm0_1";
+
+		arm,static-trace-id = <41>;
+
+		out-ports {
+			port {
+				audio_etm0_1_out: endpoint {
+					remote-endpoint = <&funnel_lpass_lpi_0_in1>;
+				};
+			};
+		};
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -330,6 +360,123 @@ cluster_sleep_1: cluster-sleep-1 {
 		};
 	};
 
+	dummy-eud {
+		compatible = "arm,coresight-dummy-sink";
+		label = "eud";
+
+		in-ports {
+			port {
+				eud_in: endpoint {
+					remote-endpoint = <&replicator_swao_out1>;
+				};
+			};
+		};
+	};
+
+	ete-0 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu0>;
+
+		out-ports {
+			port {
+				ete0_out: endpoint {
+					remote-endpoint = <&funnel_ete_in0>;
+				};
+			};
+		};
+	};
+
+	ete-1 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu1>;
+
+		out-ports {
+			port {
+				ete1_out: endpoint {
+					remote-endpoint = <&funnel_ete_in1>;
+				};
+			};
+		};
+	};
+
+	ete-2 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu2>;
+
+		out-ports {
+			port {
+				ete2_out: endpoint {
+					remote-endpoint = <&funnel_ete_in2>;
+				};
+			};
+		};
+	};
+
+	ete-3 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu3>;
+
+		out-ports {
+			port {
+				ete3_out: endpoint {
+					remote-endpoint = <&funnel_ete_in3>;
+				};
+			};
+		};
+	};
+
+	ete-4 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu4>;
+
+		out-ports {
+			port {
+				ete4_out: endpoint {
+					remote-endpoint = <&funnel_ete_in4>;
+				};
+			};
+		};
+	};
+
+	ete-5 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu5>;
+
+		out-ports {
+			port {
+				ete5_out: endpoint {
+					remote-endpoint = <&funnel_ete_in5>;
+				};
+			};
+		};
+	};
+
+	ete-6 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu6>;
+
+		out-ports {
+			port {
+				ete6_out: endpoint {
+					remote-endpoint = <&funnel_ete_in6>;
+				};
+			};
+		};
+	};
+
+	ete-7 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu7>;
+
+		out-ports {
+			port {
+				ete7_out: endpoint {
+					remote-endpoint = <&funnel_ete_in7>;
+				};
+			};
+		};
+	};
+
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-eliza", "qcom,scm";
@@ -339,6 +486,169 @@ scm: scm {
 		};
 	};
 
+	funnel-ete {
+		compatible = "arm,coresight-static-funnel";
+
+		in-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				funnel_ete_in0: endpoint {
+					remote-endpoint = <&ete0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				funnel_ete_in1: endpoint {
+					remote-endpoint = <&ete1_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				funnel_ete_in2: endpoint {
+					remote-endpoint = <&ete2_out>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				funnel_ete_in3: endpoint {
+					remote-endpoint = <&ete3_out>;
+				};
+			};
+
+			port@4 {
+				reg = <4>;
+
+				funnel_ete_in4: endpoint {
+					remote-endpoint = <&ete4_out>;
+				};
+			};
+
+			port@5 {
+				reg = <5>;
+
+				funnel_ete_in5: endpoint {
+					remote-endpoint = <&ete5_out>;
+				};
+			};
+
+			port@6 {
+				reg = <6>;
+
+				funnel_ete_in6: endpoint {
+					remote-endpoint = <&ete6_out>;
+				};
+			};
+
+			port@7 {
+				reg = <7>;
+
+				funnel_ete_in7: endpoint {
+					remote-endpoint = <&ete7_out>;
+				};
+			};
+		};
+
+		out-ports {
+			port {
+				funnel_ete_out: endpoint {
+					remote-endpoint = <&funnel_apss_in0>;
+				};
+			};
+		};
+	};
+
+	funnel-lpass-lpi-0 {
+		compatible = "arm,coresight-static-funnel";
+
+		in-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				funnel_lpass_lpi_0_in0: endpoint {
+					remote-endpoint = <&audio_etm0_0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				funnel_lpass_lpi_0_in1: endpoint {
+					remote-endpoint = <&audio_etm0_1_out>;
+				};
+			};
+
+			port@7 {
+				reg = <7>;
+
+				funnel_lpass_lpi_0_in7: endpoint {
+					remote-endpoint = <&funnel_lpass_lpi_1_out>;
+				};
+			};
+		};
+
+		out-ports {
+			port {
+				funnel_lpass_lpi_0_out: endpoint {
+					remote-endpoint = <&funnel_aoss_in5>;
+				};
+			};
+		};
+	};
+
+	funnel-lpass-lpi-1 {
+		compatible = "arm,coresight-static-funnel";
+
+		in-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				funnel_lpass_lpi_1_in0: endpoint {
+					remote-endpoint = <&lpass_stm_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				funnel_lpass_lpi_1_in1: endpoint {
+					remote-endpoint = <&tpdm_lpass_lpi_out>;
+				};
+			};
+
+			port@4 {
+				reg = <4>;
+
+				funnel_lpass_lpi_1_in4: endpoint {
+					remote-endpoint = <&tpdm_lpass_rscc_out>;
+				};
+			};
+		};
+
+		out-ports {
+			port {
+				funnel_lpass_lpi_1_out: endpoint {
+					remote-endpoint = <&funnel_lpass_lpi_0_in7>;
+				};
+			};
+		};
+	};
+
 	clk_virt: interconnect-0 {
 		compatible = "qcom,eliza-clk-virt";
 		#interconnect-cells = <2>;
@@ -351,12 +661,57 @@ mc_virt: interconnect-1 {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	lpass-stm {
+		compatible = "arm,coresight-dummy-source";
+		label = "lpass_stm";
+
+		arm,static-trace-id = <25>;
+
+		out-ports {
+			port {
+				lpass_stm_out: endpoint {
+					remote-endpoint = <&funnel_lpass_lpi_1_in0>;
+				};
+			};
+		};
+	};
+
 	memory@a0000000 {
 		device_type = "memory";
 		/* We expect the bootloader to fill in the size */
 		reg = <0x0 0xa0000000 0x0 0x0>;
 	};
 
+	modem-diag {
+		compatible = "arm,coresight-dummy-source";
+		label = "modem_diag";
+
+		arm,static-trace-id = <50>;
+
+		out-ports {
+			port {
+				modem_diag_out: endpoint {
+					remote-endpoint = <&funnel_modem_q6_in1>;
+				};
+			};
+		};
+	};
+
+	modem2-etm0 {
+		compatible = "arm,coresight-dummy-source";
+		label = "modem2_etm0";
+
+		arm,static-trace-id = <39>;
+
+		out-ports {
+			port {
+				modem2_etm0_out: endpoint {
+					remote-endpoint = <&funnel_modem_dl_in1>;
+				};
+			};
+		};
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
@@ -4142,6 +4497,1684 @@ data-pins {
 			};
 		};
 
+		ctcu@10001000 {
+			compatible = "qcom,eliza-ctcu", "qcom,sa8775p-ctcu";
+			reg = <0x0 0x10001000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ctcu_in0: endpoint {
+						remote-endpoint = <&tmc_etr_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ctcu_in1: endpoint {
+						remote-endpoint = <&tmc_etr1_out>;
+					};
+				};
+			};
+		};
+
+		stm@10002000 {
+			compatible = "arm,coresight-stm", "arm,primecell";
+			reg = <0x0 0x10002000 0x0 0x1000>,
+			      <0x0 0x37280000 0x0 0x180000>;
+			reg-names = "stm-base",
+				    "stm-stimulus-base";
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					stm_out: endpoint {
+						remote-endpoint = <&funnel_in0_in7>;
+					};
+				};
+			};
+		};
+
+		tpda@10004000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x10004000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+
+					tpda_qdss_in1: endpoint {
+						remote-endpoint = <&tpdm_spdm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_qdss_out: endpoint {
+						remote-endpoint = <&funnel_in0_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@1000f000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1000f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_spdm";
+
+			qcom,cmb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_spdm_out: endpoint {
+						remote-endpoint = <&tpda_qdss_in1>;
+					};
+				};
+			};
+		};
+
+		funnel@10041000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10041000 0x0 0x1000>;
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
+					funnel_in0_in0: endpoint {
+						remote-endpoint = <&tn_ag_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					funnel_in0_in6: endpoint {
+						remote-endpoint = <&tpda_qdss_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+
+					funnel_in0_in7: endpoint {
+						remote-endpoint = <&stm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_in0_out: endpoint {
+						remote-endpoint = <&funnel_aoss_in7>;
+					};
+				};
+			};
+		};
+
+		replicator@10046000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x10046000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					replicator_qdss_in: endpoint {
+						remote-endpoint = <&replicator_swao_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					replicator_qdss_out: endpoint {
+						remote-endpoint = <&replicator_etr_in>;
+					};
+				};
+			};
+		};
+
+		tmc@10048000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x10048000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			iommus = <&apps_smmu 0x04e0 0x0>;
+
+			arm,scatter-gather;
+
+			in-ports {
+				port {
+					tmc_etr_in: endpoint {
+						remote-endpoint = <&replicator_etr_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tmc_etr_out: endpoint {
+						remote-endpoint = <&ctcu_in0>;
+					};
+				};
+			};
+		};
+
+		replicator@1004e000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1004e000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					replicator_etr_in: endpoint {
+						remote-endpoint = <&replicator_qdss_out>;
+					};
+				};
+			};
+
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					replicator_etr_out0: endpoint {
+						remote-endpoint = <&tmc_etr_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					replicator_etr_out1: endpoint {
+						remote-endpoint = <&tmc_etr1_in>;
+					};
+				};
+			};
+		};
+
+		tmc@1004f000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x1004f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			iommus = <&apps_smmu 0x0500 0x0>;
+
+			arm,scatter-gather;
+
+			in-ports {
+				port {
+					tmc_etr1_in: endpoint {
+						remote-endpoint = <&replicator_etr_out1>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tmc_etr1_out: endpoint {
+						remote-endpoint = <&ctcu_in1>;
+					};
+				};
+			};
+		};
+
+		tpdm@10800000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10800000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_modem_0";
+
+			qcom,dsb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_modem_0_out: endpoint {
+						remote-endpoint = <&tpda_modem_in0>;
+					};
+				};
+			};
+		};
+
+		tpda@10803000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x10803000 0x0 0x1000>;
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
+					tpda_modem_in0: endpoint {
+						remote-endpoint = <&tpdm_modem_0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					tpda_modem_in1: endpoint {
+						remote-endpoint = <&tpdm_modem_1_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_modem_out: endpoint {
+						remote-endpoint = <&funnel_modem_dl_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@10804000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10804000 0x0 0x1000>;
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
+					funnel_modem_dl_in0: endpoint {
+						remote-endpoint = <&tpda_modem_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					funnel_modem_dl_in1: endpoint {
+						remote-endpoint = <&modem2_etm0_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					funnel_modem_dl_in3: endpoint {
+						remote-endpoint = <&funnel_modem_q6_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_modem_dl_out: endpoint {
+						remote-endpoint = <&tn_ag_in13>;
+					};
+				};
+			};
+		};
+
+		cti@1080b000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x1080b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "cti_mss_qdsp6";
+		};
+
+		funnel@1080c000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x1080c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+
+					funnel_modem_q6_in1: endpoint {
+						remote-endpoint = <&modem_diag_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					funnel_modem_q6_in3: endpoint {
+						remote-endpoint = <&tpda_modem_crm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_modem_q6_out: endpoint {
+						remote-endpoint = <&funnel_modem_dl_in3>;
+					};
+				};
+			};
+		};
+
+		tpda@1080e000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x1080e000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					tpda_modem_crm_in0: endpoint {
+						remote-endpoint = <&tpdm_modem_rscc_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_modem_crm_out: endpoint {
+						remote-endpoint = <&funnel_modem_q6_in3>;
+					};
+				};
+			};
+		};
+
+		tpda@10823000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x10823000 0x0 0x1000>;
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
+					tpda_dlct_in0: endpoint {
+						remote-endpoint = <&funnel_video_out>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+
+					tpda_dlct_in5: endpoint {
+						remote-endpoint = <&rep_wpss_out0>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					tpda_dlct_in6: endpoint {
+						remote-endpoint = <&rep_wpss_out1>;
+					};
+				};
+
+				port@f {
+					reg = <0xf>;
+
+					tpda_dlct_in15: endpoint {
+						remote-endpoint = <&funnel_gfx_dl_out0>;
+					};
+				};
+
+				port@11 {
+					reg = <0x11>;
+
+					tpda_dlct_in17: endpoint {
+						remote-endpoint = <&funnel_cdsp_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_dlct_out: endpoint {
+						remote-endpoint = <&funnel_dlct_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@10824000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10824000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					funnel_dlct_in0: endpoint {
+						remote-endpoint = <&tpda_dlct_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_dlct_out0: endpoint {
+						remote-endpoint = <&tn_ag_in44>;
+					};
+				};
+			};
+		};
+
+		tpdm@1082c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1082c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_gcc";
+
+			qcom,dsb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_gcc_out: endpoint {
+						remote-endpoint = <&tn_ag_in17>;
+					};
+				};
+			};
+		};
+
+		tpdm@10830000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10830000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_video";
+
+			qcom,dsb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_video_out: endpoint {
+						remote-endpoint = <&funnel_video_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@10832000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10832000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					funnel_video_in0: endpoint {
+						remote-endpoint = <&tpdm_video_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_video_out: endpoint {
+						remote-endpoint = <&tpda_dlct_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@10841000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10841000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_prng";
+
+			out-ports {
+				port {
+					tpdm_prng_out: endpoint {
+						remote-endpoint = <&tn_ag_in18>;
+					};
+				};
+			};
+		};
+
+		tpdm_wpss_dsb: tpdm@10880000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10880000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_wpss_dsb";
+
+			qcom,dsb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_wpss_dsb_out: endpoint {
+						remote-endpoint = <&funnel_wpss_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm_wpss_cmb: tpdm@10881000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10881000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_wpss_cmb";
+
+			qcom,cmb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_wpss_cmb_out: endpoint {
+						remote-endpoint = <&funnel_wpss_in1>;
+					};
+				};
+			};
+		};
+
+		funnel@10883000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10883000 0x0 0x1000>;
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
+					funnel_wpss_in0: endpoint {
+						remote-endpoint = <&tpdm_wpss_dsb_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					funnel_wpss_in1: endpoint {
+						remote-endpoint = <&tpdm_wpss_cmb_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_wpss_out: endpoint {
+						remote-endpoint = <&rep_wpss_in>;
+					};
+				};
+			};
+		};
+
+		tpdm@10900000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10900000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_gfx";
+
+			qcom,dsb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_gfx_out: endpoint {
+						remote-endpoint = <&funnel_gfx_dl_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@10902000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10902000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					funnel_gfx_dl_in0: endpoint {
+						remote-endpoint = <&tpdm_gfx_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_gfx_dl_out0: endpoint {
+						remote-endpoint = <&tpda_dlct_in15>;
+					};
+				};
+			};
+		};
+
+		tpdm@10980000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10980000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_cdsp";
+
+			qcom,dsb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_cdsp_out: endpoint {
+						remote-endpoint = <&funnel_cdsp_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@10983000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10983000 0x0 0x1000>;
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
+					funnel_cdsp_in0: endpoint {
+						remote-endpoint = <&tpdm_cdsp_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_cdsp_out0: endpoint {
+						remote-endpoint = <&tpda_dlct_in17>;
+					};
+				};
+			};
+		};
+
+		cti@1098b000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x1098b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "cti_cdsp_qdsp";
+		};
+
+		tn@109a0000 {
+			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			reg = <0x0 0x109a0000 0x0 0x3080>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			arm,primecell-periphid = <0x000f0c00>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@c {
+					reg = <0xc>;
+
+					tn_ag_in12: endpoint {
+						remote-endpoint = <&funnel_tmess_out>;
+					};
+				};
+
+				port@d {
+					reg = <0xd>;
+
+					tn_ag_in13: endpoint {
+						remote-endpoint = <&funnel_modem_dl_out>;
+					};
+				};
+
+				port@11 {
+					reg = <0x11>;
+
+					tn_ag_in17: endpoint {
+						remote-endpoint = <&tpdm_gcc_out>;
+					};
+				};
+
+				port@12 {
+					reg = <0x12>;
+
+					tn_ag_in18: endpoint {
+						remote-endpoint = <&tpdm_prng_out>;
+					};
+				};
+
+				port@19 {
+					reg = <0x19>;
+
+					tn_ag_in25: endpoint {
+						remote-endpoint = <&tpdm_mm_dsb_out>;
+					};
+				};
+
+				port@1b {
+					reg = <0x1b>;
+
+					tn_ag_in27: endpoint {
+						remote-endpoint = <&tpdm_south_dsb_out>;
+					};
+				};
+
+				port@1c {
+					reg = <0x1c>;
+
+					tn_ag_in28: endpoint {
+						remote-endpoint = <&tpdm_ipcc_cmb_out>;
+					};
+				};
+
+				port@1d {
+					reg = <0x1d>;
+
+					tn_ag_in29: endpoint {
+						remote-endpoint = <&tpdm_center_dsb_out>;
+					};
+				};
+
+				port@21 {
+					reg = <0x21>;
+
+					tn_ag_in33: endpoint {
+						remote-endpoint = <&funnel_apss_out>;
+					};
+				};
+
+				port@22 {
+					reg = <0x22>;
+
+					tn_ag_in34: endpoint {
+						remote-endpoint = <&tpdm_center_cmb_out>;
+					};
+				};
+
+				port@25 {
+					reg = <0x25>;
+
+					tn_ag_in37: endpoint {
+						remote-endpoint = <&tpdm_south_cmb_out>;
+					};
+				};
+
+				port@2c {
+					reg = <0x2c>;
+
+					tn_ag_in44: endpoint {
+						remote-endpoint = <&funnel_dlct_out0>;
+					};
+				};
+
+				port@4a {
+					reg = <0x4a>;
+
+					tn_ag_in74: endpoint {
+						remote-endpoint = <&tn_ddr_out>;
+					};
+				};
+
+				port@61 {
+					reg = <0x61>;
+
+					tn_ag_in97: endpoint {
+						remote-endpoint = <&tn_soccp_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tn_ag_out: endpoint {
+						remote-endpoint = <&funnel_in0_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@109a4000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x109a4000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_mm_dsb";
+
+			out-ports {
+				port {
+					tpdm_mm_dsb_out: endpoint {
+						remote-endpoint = <&tn_ag_in25>;
+					};
+				};
+			};
+		};
+
+		tpdm@109a5000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x109a5000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_south_dsb";
+
+			out-ports {
+				port {
+					tpdm_south_dsb_out: endpoint {
+						remote-endpoint = <&tn_ag_in27>;
+					};
+				};
+			};
+		};
+
+		tpdm@109aa000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x109aa000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_center_dsb";
+
+			out-ports {
+				port {
+					tpdm_center_dsb_out: endpoint {
+						remote-endpoint = <&tn_ag_in29>;
+					};
+				};
+			};
+		};
+
+		tpdm@109ab000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x109ab000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ipcc_cmb";
+
+			out-ports {
+				port {
+					tpdm_ipcc_cmb_out: endpoint {
+						remote-endpoint = <&tn_ag_in28>;
+					};
+				};
+			};
+		};
+
+		tpdm@109ac000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x109ac000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_center_cmb";
+
+			out-ports {
+				port {
+					tpdm_center_cmb_out: endpoint {
+						remote-endpoint = <&tn_ag_in34>;
+					};
+				};
+			};
+		};
+
+		tpdm@109af000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x109af000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_south_cmb";
+
+			out-ports {
+				port {
+					tpdm_south_cmb_out: endpoint {
+						remote-endpoint = <&tn_ag_in37>;
+					};
+				};
+			};
+		};
+
+		funnel@10b04000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10b04000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@3 {
+					reg = <3>;
+
+					funnel_aoss_in3: endpoint {
+						remote-endpoint = <&tpdm_ddr_lpicc_out>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+
+					funnel_aoss_in5: endpoint {
+						remote-endpoint = <&funnel_lpass_lpi_0_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					funnel_aoss_in6: endpoint {
+						remote-endpoint = <&tpda_aoss_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+
+					funnel_aoss_in7: endpoint {
+						remote-endpoint = <&funnel_in0_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_aoss_out: endpoint {
+						remote-endpoint = <&tmc_etf_in>;
+					};
+				};
+			};
+		};
+
+		tmc@10b05000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x10b05000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					tmc_etf_in: endpoint {
+						remote-endpoint = <&funnel_aoss_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tmc_etf_out: endpoint {
+						remote-endpoint = <&replicator_swao_in>;
+					};
+				};
+			};
+		};
+
+		replicator@10b06000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x10b06000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,replicator-loses-context;
+
+			in-ports {
+				port {
+					replicator_swao_in: endpoint {
+						remote-endpoint = <&tmc_etf_out>;
+					};
+				};
+			};
+
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					replicator_swao_out0: endpoint {
+						remote-endpoint = <&replicator_qdss_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					replicator_swao_out1: endpoint {
+						remote-endpoint = <&eud_in>;
+					};
+				};
+			};
+		};
+
+		tpda@10b08000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x10b08000 0x0 0x1000>;
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
+					tpda_aoss_in0: endpoint {
+						remote-endpoint = <&tpdm_swao_prio0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					tpda_aoss_in1: endpoint {
+						remote-endpoint = <&tpdm_swao_prio1_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					tpda_aoss_in2: endpoint {
+						remote-endpoint = <&tpdm_swao_prio2_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					tpda_aoss_in3: endpoint {
+						remote-endpoint = <&tpdm_swao_prio3_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					tpda_aoss_in4: endpoint {
+						remote-endpoint = <&tpdm_swao_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_aoss_out: endpoint {
+						remote-endpoint = <&funnel_aoss_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@10b09000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10b09000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio0";
+
+			qcom,cmb-element-bits = <64>;
+
+			out-ports {
+				port {
+					tpdm_swao_prio0_out: endpoint {
+						remote-endpoint = <&tpda_aoss_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@10b0a000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10b0a000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio1";
+
+			qcom,cmb-element-bits = <64>;
+
+			out-ports {
+				port {
+					tpdm_swao_prio1_out: endpoint {
+						remote-endpoint = <&tpda_aoss_in1>;
+					};
+				};
+			};
+		};
+
+		tpdm@10b0b000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10b0b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio2";
+
+			qcom,cmb-element-bits = <64>;
+
+			out-ports {
+				port {
+					tpdm_swao_prio2_out: endpoint {
+						remote-endpoint = <&tpda_aoss_in2>;
+					};
+				};
+			};
+		};
+
+		tpdm@10b0c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10b0c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio3";
+
+			qcom,cmb-element-bits = <64>;
+
+			out-ports {
+				port {
+					tpdm_swao_prio3_out: endpoint {
+						remote-endpoint = <&tpda_aoss_in3>;
+					};
+				};
+			};
+		};
+
+		tpdm@10b0d000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10b0d000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_swao";
+
+			qcom,dsb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_swao_out: endpoint {
+						remote-endpoint = <&tpda_aoss_in4>;
+					};
+				};
+			};
+		};
+
+		itnoc@10ba0000 {
+			compatible = "qcom,coresight-itnoc";
+			reg = <0x0 0x10ba0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb";
+
+			in-ports {
+				port {
+					tn_soccp_in0: endpoint {
+						remote-endpoint = <&tpdm_soccp_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tn_soccp_out: endpoint {
+						remote-endpoint = <&tn_ag_in97>;
+					};
+				};
+			};
+		};
+
+		tpdm@10ba4000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10ba4000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_soccp";
+
+			out-ports {
+				port {
+					tpdm_soccp_out: endpoint {
+						remote-endpoint = <&tn_soccp_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@10cc1000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10cc1000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_tmess_1";
+
+			qcom,dsb-element-bits = <64>;
+			qcom,cmb-element-bits = <64>;
+
+			out-ports {
+				port {
+					tpdm_tmess_1_out: endpoint {
+						remote-endpoint = <&tpda_tmess_in2>;
+					};
+				};
+			};
+		};
+
+		tpda@10cc4000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x10cc4000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					reg = <2>;
+
+					tpda_tmess_in2: endpoint {
+						remote-endpoint = <&tpdm_tmess_1_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_tmess_out: endpoint {
+						remote-endpoint = <&funnel_tmess_in>;
+					};
+				};
+			};
+		};
+
+		funnel@10cc5000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10cc5000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					funnel_tmess_in: endpoint {
+						remote-endpoint = <&tpda_tmess_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_tmess_out: endpoint {
+						remote-endpoint = <&tn_ag_in12>;
+					};
+				};
+			};
+		};
+
+		itnoc@10d00000 {
+			compatible = "qcom,coresight-itnoc";
+			reg = <0x0 0x10d00000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@7 {
+					reg = <7>;
+
+					tn_ddr_in7: endpoint {
+						remote-endpoint = <&tpdm_ddr_llcc0_out>;
+					};
+				};
+
+				port@8 {
+					reg = <8>;
+
+					tn_ddr_in8: endpoint {
+						remote-endpoint = <&tpdm_ddr_llcc2_out>;
+					};
+				};
+
+				port@b {
+					reg = <0xb>;
+
+					tn_ddr_in11: endpoint {
+						remote-endpoint = <&tpdm_ddr_ch02_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tn_ddr_out: endpoint {
+						remote-endpoint = <&tn_ag_in74>;
+					};
+				};
+			};
+		};
+
+		tpdm@10d06000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10d06000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr_ch02";
+
+			out-ports {
+				port {
+					tpdm_ddr_ch02_out: endpoint {
+						remote-endpoint = <&tn_ddr_in11>;
+					};
+				};
+			};
+		};
+
+		tpdm@10f82000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10f82000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr_llcc0";
+
+			out-ports {
+				port {
+					tpdm_ddr_llcc0_out: endpoint {
+						remote-endpoint = <&tn_ddr_in7>;
+					};
+				};
+			};
+		};
+
+		tpdm@10f83000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10f83000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr_llcc2";
+
+			out-ports {
+				port {
+					tpdm_ddr_llcc2_out: endpoint {
+						remote-endpoint = <&tn_ddr_in8>;
+					};
+				};
+			};
+		};
+
+		funnel@13810000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x13810000 0x0 0x1000>;
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
+					funnel_apss_in0: endpoint {
+						remote-endpoint = <&funnel_ete_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					funnel_apss_in3: endpoint {
+						remote-endpoint = <&tpda_apss_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_apss_out: endpoint {
+						remote-endpoint = <&tn_ag_in33>;
+					};
+				};
+			};
+		};
+
+		tpdm@13860000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x13860000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_int_cmb0";
+
+			qcom,cmb-element-bits = <64>;
+
+			out-ports {
+				port {
+					tpdm_int_cmb0_out: endpoint {
+						remote-endpoint = <&tpda_apss_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@13862000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x13862000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_int_dsb";
+
+			qcom,dsb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_int_dsb_out: endpoint {
+						remote-endpoint = <&tpda_apss_in8>;
+					};
+				};
+			};
+		};
+
+		tpda@13864000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x13864000 0x0 0x1000>;
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
+					tpda_apss_in0: endpoint {
+						remote-endpoint = <&tpdm_llm_silver_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					tpda_apss_in1: endpoint {
+						remote-endpoint = <&tpdm_llm_gold_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					tpda_apss_in2: endpoint {
+						remote-endpoint = <&tpdm_llm_ext_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					tpda_apss_in6: endpoint {
+						remote-endpoint = <&tpdm_int_cmb0_out>;
+					};
+				};
+
+				port@8 {
+					reg = <8>;
+
+					tpda_apss_in8: endpoint {
+						remote-endpoint = <&tpdm_int_dsb_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_apss_out: endpoint {
+						remote-endpoint = <&funnel_apss_in3>;
+					};
+				};
+			};
+		};
+
+		tpdm@138a0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x138a0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_llm_silver";
+
+			qcom,cmb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_llm_silver_out: endpoint {
+						remote-endpoint = <&tpda_apss_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@138b0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x138b0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_llm_gold";
+
+			qcom,cmb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_llm_gold_out: endpoint {
+						remote-endpoint = <&tpda_apss_in1>;
+					};
+				};
+			};
+		};
+
+		tpdm@138c0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x138c0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_llm_ext";
+
+			qcom,dsb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_llm_ext_out: endpoint {
+						remote-endpoint = <&tpda_apss_in2>;
+					};
+				};
+			};
+		};
+
 		sram@14680000 {
 			compatible = "qcom,eliza-imem", "mmio-sram";
 			reg = <0x0 0x14680000 0x0 0x2c000>;
@@ -5430,4 +7463,108 @@ timer {
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	tpdm-ddr-lpicc {
+		compatible = "arm,coresight-dummy-source";
+		label = "tpdm_ddr_lpicc";
+
+		out-ports {
+			port {
+				tpdm_ddr_lpicc_out: endpoint {
+					remote-endpoint = <&funnel_aoss_in3>;
+				};
+			};
+		};
+	};
+
+	tpdm-lpass-lpi {
+		compatible = "arm,coresight-dummy-source";
+		label = "tpdm_lpass_lpi";
+
+		out-ports {
+			port {
+				tpdm_lpass_lpi_out: endpoint {
+					remote-endpoint = <&funnel_lpass_lpi_1_in1>;
+				};
+			};
+		};
+	};
+
+	tpdm-lpass-rscc {
+		compatible = "arm,coresight-dummy-source";
+		label = "tpdm_lpass_rscc";
+
+		out-ports {
+			port {
+				tpdm_lpass_rscc_out: endpoint {
+					remote-endpoint = <&funnel_lpass_lpi_1_in4>;
+				};
+			};
+		};
+	};
+
+	tpdm-modem-rscc {
+		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_modem_rscc";
+
+		qcom,cmb-element-bits = <32>;
+
+		out-ports {
+			port {
+				tpdm_modem_rscc_out: endpoint {
+					remote-endpoint = <&tpda_modem_crm_in0>;
+				};
+			};
+		};
+	};
+
+	tpdm-modem-1 {
+		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_modem_1";
+
+		qcom,cmb-element-bits = <32>;
+
+		out-ports {
+			port {
+				tpdm_modem_1_out: endpoint {
+					remote-endpoint = <&tpda_modem_in1>;
+				};
+			};
+		};
+	};
+
+	wpss-replicator {
+		compatible = "arm,coresight-static-replicator";
+
+		in-ports {
+			port {
+				rep_wpss_in: endpoint {
+					remote-endpoint = <&funnel_wpss_out>;
+				};
+			};
+		};
+
+		out-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				rep_wpss_out0: endpoint {
+					remote-endpoint = <&tpda_dlct_in5>;
+					filter-source = <&tpdm_wpss_dsb>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				rep_wpss_out1: endpoint {
+					remote-endpoint = <&tpda_dlct_in6>;
+					filter-source = <&tpdm_wpss_cmb>;
+				};
+			};
+		};
+	};
 };

-- 
2.34.1

