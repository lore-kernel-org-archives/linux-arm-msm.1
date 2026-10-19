Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6201E418A58
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792393380; cv=none; b=DRq0QrA7wYpxSZ8B8IdJmwsNzePdKXvYoYl1zHfPhEL7CpfEnv0svfSXGTY5SJW7R6OHihbR5IdcUIHoeDlaXeoO2WFOhrUn4Z7v42eA9MfvsgOQdEC9pC/mATFoDNQBDQ2CLXGjVjfpzSn9F4/ylRCJn6mtJPHJjINfKL8CvQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792393380; c=relaxed/simple;
	bh=qslubZxap2r5UmNKQQJ203JBKOTySnI5k3hp7eb7gM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YXWZyHWBY0rTRbs0ayV1GxZyJ0UGaWpafvr9NqrhhNvAUzwjH10FI5lhJMgDs/ZnarUGm5W4lXW/mRa3dWWGkcQdE7qVE9P1eAEaCGchOqoA9OJ6d9WoavScCCVVDDScyh4NdZ/JM2DFDp9eg9IVGJ/HmapYIX9+4JuBV+QSwWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NqmZjdcQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QXdw3saE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NqmZjdcQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QXdw3saE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4jDqe2267336
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2lqgHK1HHpbuHLS+1fJ6Fv
	6nS/oflbvo0nKVIWjUje0=; b=NqmZjdcQkXjMHFo+EQZ9KScjw8GNTqLs9n3oTW
	T7ph/hykaQg7sC3/cm/H7GACX+uUi2NH9DniaT6SS4pgooWh677wfVwo0gdW4Gv3
	yMRqujHHyBy74eQfqBW6b+N0oBdIfGCX1G80tpy62w6XrkAB6kE69w0Wz8lsTFRf
	Pp4hQGHp35KmuOFLwdiz8T+tckne+ZP5od0Jqgmnj9Zz8q9kYGcwv4OML2Y/VtTW
	Q7pWNWeoraxuGziKGpNNiHAzP05VRLww8JyDrHqz7l0NbIx4hcaXgrTOVvY+rcNN
	ALwt3sVtiMLe6W4qypTo5nfGpITLhhfn0UEWSI/CMIDABhiw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0kxneew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:02:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cec4226c70so16630245ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 00:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792393375; x=1792998175; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2lqgHK1HHpbuHLS+1fJ6Fv6nS/oflbvo0nKVIWjUje0=;
        b=QXdw3saEV62LGsGhQ8B8yNXuAMLYdbAwNXWTxTX0Mz2ZRQSJufAbTOxVMlYLwIJwKg
         1MnRbxuG+G7s4SNQKICh0a95ZGlbk1bklL88PQSu6qWSrroVt/9+XiVT0KH6x/joQJDb
         Bf0bW5FjfjcJEBfMJpqciknzHlMxt1bbsnClgLsED6jk9cpb9KmEZ3IlJgQ6VlSZel0t
         I1VHbct2guX4jrz3U16bhtOTqoN7olv/orlJ4cM9As+HENhqN8HY4AS1f0/pZBQLCRm/
         tQxhjyUFqqwgtfgL/jsmJIJ7BbZ/zuV7CWwE8mJq3RP/7FO76rG3muLCixqF46WMtGD3
         LcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792393375; x=1792998175;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2lqgHK1HHpbuHLS+1fJ6Fv6nS/oflbvo0nKVIWjUje0=;
        b=BEi9gA9BwKnVWlej01qmurMqHxWCUOyLGAjP0ukAaGfVpa+RB409ALf0sdtY6qiIwA
         XxN/iJam4C3gjXLFb5MxyPCo4McVG0D54LxEYiqJBoidD3+QgokGBbOU1xQFb/gd5d8I
         m5YQcYO6sChd/+werJSlqU3+hIcUgQKoIDfkZf5ZWFbTHP1EvI2GIoOIN0+JoMERxkov
         7sDn9dSJVtlIRx9IZ4jRpECvhir1ryEV7Zc8Cf02CvI3VAECcRv1UPmZCce744GQUWTP
         bpeHHVY46RZy4MpNYWhloR50GqFS8L0+G6UyXuLQ2Ns3b8xqz0ufEHfevW7RfqaxH76d
         P+Pg==
X-Forwarded-Encrypted: i=1; AKwUvBzHhGdZS3jaBmH25X1msXazF6+hQN2j75DensI3ftiz4Js+6+fDogWmblZnNyzCEtaJ/BJnGxTbQexwcKRE@vger.kernel.org
X-Gm-Message-State: AFq9FYI69Ifj6nPmXw1BR6RpNZauH/m1oPRUskU4JsnURvRsE8qNtaZa
	9UoKXG/9gJ7+UVf85BXBVktCx2QCegDmeF4YeIVdzVOw1+G+NgkSIzKM60YuikP3X0BOq2NH+mB
	vop7XLgGD1H0eUrzGyLDeUHgb6B5Yx32ET8dSCp/Ybi25a4aBj52fvj0fpo9bf8ODhjSy
X-Gm-Gg: AYBFou2xHhffmWpkLcnBAJwXo7dTM+7sTcrLL6LAgCdW9MfySWj8ZYhVy3mYOho7e60
	JojWS4F6Gw96crFVaoG6pwCbFcLqaGcEiH4A5LAbsiNuvG0sh334s3mrr/j39z9LpmOQRyQEQNf
	fHTfwDvRnL1aE0Pdb6oOA29z19tHo/C7zz26NnPnxZ7anyjRqUE9055NoYrpLJK8Gz5HCNxXg10
	kxCYaHbgj2HDlD/eOjnqwfCAdktFYlkF3B598NJ8InP3ACdskz4MJbg03Yb12kyu3h4Jdl2YBaj
	R8BMBIaVgBIaIa/6yzu0A8hYRq53EjDoEOPAAru8K5NYsV4E7bQbqtOWsAmXKp/kh4gat9RXYw2
	bzuK9PvBPuw8usW3J6cIi7ZbcKNchsqSXkQwH0kNedLZn6JumPSTLPe4k3pLMnA==
X-Received: by 2002:a17:903:244b:b0:2e9:6be2:1296 with SMTP id d9443c01a7336-2e9a6c14af2mr45690715ad.56.1792393375097;
        Mon, 19 Oct 2026 00:02:55 -0700 (PDT)
X-Received: by 2002:a17:903:244b:b0:2e9:6be2:1296 with SMTP id d9443c01a7336-2e9a6c14af2mr45690485ad.56.1792393374446;
        Mon, 19 Oct 2026 00:02:54 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8353b1sm35310935ad.39.2026.10.19.00.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:02:53 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:58:34 +0800
Subject: [PATCH v2] arm64: dts: qcom: shikra: Switch CPU ETMs to MMIO-based
 probing
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-fix-etm-probe-issue-on-shikra-v2-1-b2eaed0fffaf@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJq/1WoC/42NQQ6CMBBFr0K6dgitFsSV9zAsCgwyUVrsANEQ7
 u7ICdxM8v7Pf7MqxkjI6pKsKuJCTMELmEOimt75OwK1wspkJs9KY6CjN+A0wBhDLSXzjBA8cE+
 P6MC63Jw6ez6WhVXiGCPKYPffKuGeeArxs79b9C/917xo0GDz1lgs6xp1cQ3M6Wt2zyYMQypHV
 du2fQFDxRjp0QAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792393370; l=5221;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=qslubZxap2r5UmNKQQJ203JBKOTySnI5k3hp7eb7gM8=;
 b=EzTwBYMKBFVlQf0nz4yDDaerd43tbpqKqy0qIv3g8I9GW49Y6mmhToCuWBGK2uu6+yeO3bhIS
 FXYANxY6bK6AeLBleYV5wunIW7f1KZIQopKJcBS1kKxARTtmSLlp0Yr
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAyNyBTYWx0ZWRfX6HbRn9B1E1Gu
 /x68hvcWtOtl05w00h/d8HNHwYOQoZLmiPhwDhQgVhVgrfqX8UAH/6oCFh6N8IMggf2EaCpPPHc
 c6h0iVeKplKdywSAsN8G66HO0P1aaIU=
X-Authority-Analysis: v=2.4 cv=JpZkP84C c=1 sm=1 tr=0 ts=6ad5c0a0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ucFWaANPfWH9jnj5dtQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAyNyBTYWx0ZWRfXypCgcHYGdJC7
 PzDl3ic0DQyYJMamkGLuUR6qvQfbim//bcW2I68hpkHrsc/PS3Yl+Zy2B1BdtakPFtHxXR4TY5i
 MLCjtYotwu8MQSYiYJsVoC/wmkLmBjBBonLo65MXLKoc7To0AIWyzkuLAbVmN/3YCb8meDU7xuH
 uQOQHiJcPW5Glg87SHa1s+lpfS26SHIr3ompg3WvI0AdNlNWkxM2yaApmj81kg6ZtZim3HvoXuV
 bI2MFZMSyIxwEbmeNAuzvGAPKKVBzPwPsYGJ+ozyviIViw7UUnxNNwxY2DTL9Tnv4lCqte7svfK
 vTOsKe+n34kaQYVZH9lDmxjLVOPKfzs/EvnC6iJOeiuwZvmTqldHRGBwV5B36GYW8GQvVFb6pL8
 UW3vGaELONzdkmMx8FAcVFDkSS3icCOf31FIV9OpRkQdJmScdP1BsWGCU1ThmII6iOHiT3qhE9V
 8GE7XuQPau/69tO+pwQ==
X-Proofpoint-ORIG-GUID: vc9pZyeWI9RcfTAmFVjVwicpnqT7i9VT
X-Proofpoint-GUID: vc9pZyeWI9RcfTAmFVjVwicpnqT7i9VT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190027

The etm0-etm3 nodes are declared with "arm,coresight-etm4x-sysreg"
but do not implement self-hosted system-register trace access on
this SoC: ID_AA64DFR0_EL1.TraceVer reads as 0 on the affected CPUs,
so etm4_init_sysreg_access() correctly reports the access mechanism
as unavailable and the ETMv4 driver fails to probe with -EINVAL.

The CPU ETMs have a memory-mapped aperture, so switch each node to
the standard "arm,coresight-etm4x", "arm,primecell" compatible with
its MMIO reg range.

Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v2:
- add arm,coresight-loses-context-with-cpu property for ETM nodes.
- Link to v1: https://lore.kernel.org/r/20260922-fix-etm-probe-issue-on-shikra-v1-1-56d25e9bbe17@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 144 ++++++++++++++++++-----------------
 1 file changed, 76 insertions(+), 68 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2623e139196f..2ddbd61567d8 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -166,74 +166,6 @@ eud_in: endpoint {
 		};
 	};
 
-	etm0 {
-		compatible = "arm,coresight-etm4x-sysreg";
-
-		clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
-		clock-names = "apb_pclk";
-		cpu = <&cpu0>;
-		qcom,skip-power-up;
-
-		out-ports {
-			port {
-				etm0_out: endpoint {
-					remote-endpoint = <&funnel_cpuss0_in0>;
-				};
-			};
-		};
-	};
-
-	etm1 {
-		compatible = "arm,coresight-etm4x-sysreg";
-
-		clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
-		clock-names = "apb_pclk";
-		cpu = <&cpu1>;
-		qcom,skip-power-up;
-
-		out-ports {
-			port {
-				etm1_out: endpoint {
-					remote-endpoint = <&funnel_cpuss0_in1>;
-				};
-			};
-		};
-	};
-
-	etm2 {
-		compatible = "arm,coresight-etm4x-sysreg";
-
-		clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
-		clock-names = "apb_pclk";
-		cpu = <&cpu2>;
-		qcom,skip-power-up;
-
-		out-ports {
-			port {
-				etm2_out: endpoint {
-					remote-endpoint = <&funnel_cpuss0_in2>;
-				};
-			};
-		};
-	};
-
-	etm3 {
-		compatible = "arm,coresight-etm4x-sysreg";
-
-		clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
-		clock-names = "apb_pclk";
-		cpu = <&cpu3>;
-		qcom,skip-power-up;
-
-		out-ports {
-			port {
-				etm3_out: endpoint {
-					remote-endpoint = <&funnel_cpuss0_in3>;
-				};
-			};
-		};
-	};
-
 	firmware {
 		scm {
 			compatible = "qcom,scm-shikra", "qcom,scm";
@@ -3740,6 +3672,25 @@ cti@9020000 {
 			label = "cti_apss_pe0";
 		};
 
+		etm@9040000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0x0 0x09040000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu0>;
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm0_out: endpoint {
+						remote-endpoint = <&funnel_cpuss0_in0>;
+					};
+				};
+			};
+		};
+
 		cti@90e0000 {
 			compatible = "arm,coresight-cti", "arm,primecell";
 			reg = <0x0 0x090e0000 0x0 0x1000>;
@@ -3758,6 +3709,25 @@ cti@9120000 {
 			label = "cti_apss_pe1";
 		};
 
+		etm@9140000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0x0 0x09140000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu1>;
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm1_out: endpoint {
+						remote-endpoint = <&funnel_cpuss0_in1>;
+					};
+				};
+			};
+		};
+
 		cti@9220000 {
 			compatible = "arm,coresight-cti", "arm,primecell";
 			reg = <0x0 0x09220000 0x0 0x1000>;
@@ -3767,6 +3737,25 @@ cti@9220000 {
 			label = "cti_apss_pe2";
 		};
 
+		etm@9240000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0x0 0x09240000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu2>;
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm2_out: endpoint {
+						remote-endpoint = <&funnel_cpuss0_in2>;
+					};
+				};
+			};
+		};
+
 		cti@9320000 {
 			compatible = "arm,coresight-cti", "arm,primecell";
 			reg = <0x0 0x09320000 0x0 0x1000>;
@@ -3776,6 +3765,25 @@ cti@9320000 {
 			label = "cti_apss_pe3";
 		};
 
+		etm@9340000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0x0 0x09340000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu3>;
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm3_out: endpoint {
+						remote-endpoint = <&funnel_cpuss0_in3>;
+					};
+				};
+			};
+		};
+
 		funnel@9800000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0x0 0x09800000 0x0 0x1000>;

---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20260922-fix-etm-probe-issue-on-shikra-5a624f583975

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

