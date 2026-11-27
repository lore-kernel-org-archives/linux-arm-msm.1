Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795754306;
	b=rNkgOnu86iuc9wiGWKiCHA3q31LE5I0CuGwXL5OaRRDPe3Pv8LBypSc4T1Hp/uHIGGAy
	 KuCzWeu82RxYcQmBj7SnFMAj7CYfIAXi88r9XcoWJNbNhaYRqJMmWhu58FiMwZgiJa5ka
	 K2I32xjnucxX9UF+FDX42+abwnvmWWuhO89r9TGcMZLZWwKpzxv2+TrfOL7eDYyPTqjel
	 zEvK+ITSXMTaBYEM4Zpz3AMpfOFscaecSiDg4/0Ocjmkiu7gc5/uvKtTtn18tndRzr80W
	 W0vZGuACrNm1A6Zpwsh8r27vP4YbE6z+vjWKK6HlU7kGRU1bocqGyFKZDm95W3S6k+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795754306;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZQyzN7pTN5+1O3YedoCjEDAHpu6EOQv/+RtUHNWfFEg=;
	b=y++umaCAIFJbAe98724GgkyqIDJzlvhvDroBgsscw041gTTx8UYk4rwtTm9rax7C+VpM
	 PDUaFn+bTHXfhUsCcpq+aU9k/g2cqOiJECWaLTu0bWFnKEiixLQUJResPL9keErWCPmjC
	 z8LqyVOyRtnXZwzOEzvCqxP+JD3p0HaCelli6zt9JlZTW7OYQbmPxY4dr5UmsaLVodwZa
	 iHPPy4+LaP7UDfA2LUAbw2X6tEQpEbFuTA1bFxdJsjXYZYe5OgEGJXCDYGeDX5k53Qo+/
	 K+gt0/2F1HRhy/9l3s42FzWUuAK8FdO2vN4NXp8ZRDDhEJ23HlDUsLULEtZW11PMgEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XCysWC9D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YkP1294f;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B435A606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 04:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B435A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XCysWC9D;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YkP1294f
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJw70L2354090
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 04:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZQyzN7pTN5+1O3YedoCjEDAHpu6EOQv/+RtUHNWfFEg=; b=XCysWC9DQaFginXW
	M3EW5HJivHisqrOtazrKTcE16yqYtoaJW4o1OZU9xLzhcJnXembuizj0YKiEUASh
	/kaL1BNXmTf4xc5Vo2a2JEGVn0MFUq1hnqmYK/CnCWL5dN3I9WwwqAXGABTAtNy9
	e5ZF3W5SUFnSW5B+tIgtUv0ZfZNrXbRQ7IaNpJbAFP697yiymKwZ0lHHLJZS32EW
	uZyniB6Y5lBcA78WkKFmVZIvIMck9Lm892O5Hbeoawe297gjIwlqetIIqbcNEZK9
	xGt8V0Dl095KSEDBAt4Jx+tNc2RJ8aDY3PVzPjx/TEt7HxY0pYDLPHG8xYJMBT/9
	AVNuNA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7usme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 04:38:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b5361fb600so236171a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 20:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795754303; x=1796359103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZQyzN7pTN5+1O3YedoCjEDAHpu6EOQv/+RtUHNWfFEg=;
        b=YkP1294f86PRCyYjUgbSHOHwS13dfGXtW9fIsmavyCMri/fLEDj3yFr8kmRKXzhEGJ
         MUIurqWzPKVVx2Njwb1ZDE1p93Dzz0IzVGsN8HfrDTCgaurj6dJG9rYWEOMi2Afhpgyv
         H5DAkxbr1U1YEOd8Hdlyn09mXB6k/VTzLDoLm+fcLTxEQD+mEMG4/1sVnI3+4K+xDtt8
         R+Hri0FDXY8b/INnYu7vmcRakJ2VI64+Tt1qI1DyWGlm2PTi7z4eK1KZXjt6aWK/nWqq
         dCxpKIXFe0bhkaIR0Gi+v89y7nzTAQfuOmidita96SvdA67i6/cr1WoyCfuqelORCTPZ
         +DWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795754303; x=1796359103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZQyzN7pTN5+1O3YedoCjEDAHpu6EOQv/+RtUHNWfFEg=;
        b=yUQDGtynnsw6QmN9tDJf9P8wqUK3ug8LZDMQNiPg04OamlHCf+mg0R8KNSy0DEoERL
         jM82Dj5/r650wBuQnGf6q6l6oNUqM39Kn4QhKWaRDUDBQD1aw4ze1G2QTsLZtzzxro7K
         YdJ1nXK7kLusBZi5AHHeo/eBuyOEcrmSJUpFeGHbMd5WasTCkRITxPLhdxZbVKy77Zve
         JcrEHS9jsnEOgr1WvGahSb7MiLx6vmCJ5FIrEx3PTHekiIY6snulj/Uw9zh1V/7UIpC/
         0Ke8oRpJnwBCmyYbpn73zSqzTC0WndUPyYpF6GovJ7tqIC0er+WV/o1m2+bz+WUrbK9D
         S5xw==
X-Gm-Message-State: APuU4Z8l+B7G8Dz44sxxwIX9vUVdZTiOlZtl3hPLwqiVZRh9jn35bXSu
	etGdFLvcLVGm43t/WyvAoIe6scaC3dCA1WwCT+2kpd/68yVknwu5Fe13CUTwhyPlCtrtaKr68s/
	MDiIlWv76VvETHPTtzLgnLkRZIftRSmyOACsOh/6rOX8aqq1ltiBfTNN3Mwx+JMJmKubB
X-Gm-Gg: AZFdTZdPYE28WpiornwdhmA1pXCnKaXyrh6OYUQleY3nqibtdmbR+3a7i8AxPenFt3O
	sTxGOYFLBU4B1MitzSC4GO2qVXSvkvSopn9uCZ22LsLKOscY3iJsWUDNWjraho0JL9WkdUYnV8l
	BQ/mR4rx6Q2LNURm4A3pdWduXRSfRkNlCOuaUV6voyPpVNSJdueqS/7vOIcSRSJDdDfvfdEKgyg
	Ro75IPKujk61a862rQ5hEHet5zzwiRLmw87eXT1Et9xOgaLM671oRO554USqMzjKGagdFSyVS/A
	JR79aV6r/01bdu5JgBYBmqdYEJlF7J9T7GVaOFvSIStMf4nWLl+Vrrf9PIDqxmuz298TPPh6rLL
	t9ZXs/ZT3nioKIECGJR1X8x6luI1SkiKvcYWCNSlWlVjjcykXYFL/HkdR/1yNCmYwZmtWVTTqCf
	0uxWLuRy5UvqXzWLRhqyRTb/L1AVcQAbMjveI=
X-Received: by 2002:a17:90a:d2cf:b0:3ac:9772:8da3 with SMTP id 98e67ed59e1d1-3b41c8fed4bmr20193974a91.31.1795754303345;
        Thu, 26 Nov 2026 20:38:23 -0800 (PST)
X-Received: by 2002:a17:90a:d2cf:b0:3ac:9772:8da3 with SMTP id 98e67ed59e1d1-3b41c8fed4bmr20193952a91.31.1795754302784;
        Thu, 26 Nov 2026 20:38:22 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm38823918a91.5.2026.11.26.20.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:38:22 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:37:35 +0800
Subject: [PATCH v3 2/4] arm64: dts: qcom: sm8750: Add CoreSight nodes for
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
Message-Id: <20261127-add-etm-devices-for-multiple-qcom-platforms-v3-2-0037736dfbc1@qti.qualcomm.com>
References: <20261127-add-etm-devices-for-multiple-qcom-platforms-v3-0-0037736dfbc1@qti.qualcomm.com>
In-Reply-To: <20261127-add-etm-devices-for-multiple-qcom-platforms-v3-0-0037736dfbc1@qti.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795754291; l=13075;
 i=jiegan@qti.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=ThG3RVFUivNbnmhH5oDo/6L6HD4azRsioolXvpbcaYk=;
 b=YxEQOGQAdBnL8MD9NNVzhQaEXiPzcFqPwcM3cTGsD0rzUpE8hcXB5oqWZXNsSPA0Bor3MI+BO
 0Hl209nLuc9C5hnQ+hHKMUgEAUeX+cy6SH6RId6+IoGaFedAsYFUAo4
X-Developer-Key: i=jiegan@qti.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAxOCBTYWx0ZWRfX2ENezx+e8U15
 KEqjiSX7yfGgjDgwES8MFuF2jSArJokxmPHL5DRyOVRRMRN51JDOfSuRd0NJV4n5WHMCYU+E13J
 BbpO3kIRzzQ6YfDdRlsfJF0b975QBMk=
X-Proofpoint-GUID: EgNDVPBLrQcdynJQv1tdpsnYAAmfZ5rx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAxOCBTYWx0ZWRfX6YB3oJcxsRoz
 wVI5lMgm3BKULn5xcYUikCp4XHYN3nRZ14HRIpSN7etqAwzSWCXfXiMZjeGZYbS4Zmb6ruQDDeh
 69+qyaflG7SuDYqCeHI5j5yMdwrluAQu0fQK2SQVf4KS2TP4dSaXotr+wX6HSwK3WiIlRTfNbCo
 4FX7lvn4XjOMNKXfLA0Z1HyCUAchB85Kx2a6olATOO5T7jQwXD1WxVZQY1pmXJzO+v3HRnZ0IPY
 rDQ4LiVZTaI/vQLqIbTCJF8gjwS4Dj1RSWRJDQg2iIevFF10L9KLB/j+io/WU0GA+nZ6RoMwv9S
 AwKhYPuLGeWR/Q4GXAeWnnTd/rUYt/MiXtpGu1c6V5RPOXuMc/L62a1QPKXce0ZvXkRpSWaGZyO
 7EjQGNj7tJC2YnsWw/w6yWJwrbcIR5JgGTLsjJRwb7GjPd4Bt8QSXRO9e2cm+mXiSkEg18FkfrB
 drZ5X4gBhNOF9+LA7/Q==
X-Proofpoint-ORIG-GUID: EgNDVPBLrQcdynJQv1tdpsnYAAmfZ5rx
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b090940 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1maxGOkvq1oy3pDCtGYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270018

The APSS debug block is built with CoreSight devices like ETM,
replicator, funnel and TMC ETF. Add dt nodes for these devices to enable
ETM trace.

The replicator, funnel and TMC ETF nodes in this block are physically
powered by the CPU cluster power rail rather than by a dedicated always-on
rail. Add a power-domains property referencing the corresponding
cluster0_pd/cluster1_pd domain to each of these nodes, so their power
state is tied to the CPU cluster domain and the runtime PM core can
power the domain on before the devices are accessed and let it be
powered off otherwise.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 599 +++++++++++++++++++++++++++++++++++
 1 file changed, 599 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index d8a853c31eeb..3411dd80b670 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -216,6 +216,142 @@ domain_ss3: domain-sleep-0 {
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
+					remote-endpoint = <&ncc0_4_rep_in>;
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
+					remote-endpoint = <&ncc0_5_rep_in>;
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
+					remote-endpoint = <&ncc1_0_rep_in>;
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
+					remote-endpoint = <&ncc1_1_rep_in>;
+				};
+			};
+		};
+	};
+
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-sm8750", "qcom,scm";
@@ -5294,6 +5430,14 @@ tn_ag_in32: endpoint {
 						remote-endpoint = <&tpdm_rdpm_cmb2_out>;
 					};
 				};
+
+				port@21 {
+					reg = <0x21>;
+
+					tn_ag_in33: endpoint {
+						remote-endpoint = <&apss_funnel_out>;
+					};
+				};
 			};
 
 			out-ports {
@@ -5571,6 +5715,461 @@ tpdm_swao_out: endpoint {
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
+			};
+
+			out-ports {
+				port {
+					apss_funnel_out: endpoint {
+						remote-endpoint = <&tn_ag_in33>;
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
+			power-domains = <&cluster0_pd>;
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
+			power-domains = <&cluster0_pd>;
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
+		funnel@13481000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x13481000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
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
+
+				port@4 {
+					reg = <4>;
+
+					ncc0_1_funnel_in4: endpoint {
+						remote-endpoint = <&ncc0_4_rep_out>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+
+					ncc0_1_funnel_in5: endpoint {
+						remote-endpoint = <&ncc0_5_rep_out>;
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
+		replicator@13490000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x13490000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
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
+			power-domains = <&cluster0_pd>;
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
+			power-domains = <&cluster0_pd>;
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
+			power-domains = <&cluster0_pd>;
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
+		replicator@134d0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x134d0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
+
+			in-ports {
+				port {
+					ncc0_4_rep_in: endpoint {
+						remote-endpoint = <&etm4_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_4_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in4>;
+					};
+				};
+			};
+		};
+
+		replicator@134e0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x134e0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
+
+			in-ports {
+				port {
+					ncc0_5_rep_in: endpoint {
+						remote-endpoint = <&etm5_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_5_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in5>;
+					};
+				};
+			};
+		};
+
+		funnel@13d01000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x13d01000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster1_pd>;
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
+		tmc@13d09000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x13d09000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster1_pd>;
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
+		funnel@13d81000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x13d81000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster1_pd>;
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
+		replicator@13d90000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x13d90000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster1_pd>;
+
+			in-ports {
+				port {
+					ncc1_0_rep_in: endpoint {
+						remote-endpoint = <&etm6_out>;
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
+		replicator@13da0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x13da0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster1_pd>;
+
+			in-ports {
+				port {
+					ncc1_1_rep_in: endpoint {
+						remote-endpoint = <&etm7_out>;
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
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sm8750-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0x0 0x15000000 0x0 0x100000>;

-- 
2.34.1

