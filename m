Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328768;
	b=xm6BcQhmHPvkfYp7ziuk3s/7K/ENGmPFtI6ABUuAh/L/f4M64XrnBFc7muvxdCyCsOtS
	 JU/xUAaksJ24sUgslwTQP7XgYlfBNYdSrwcjrao+l36yo1foXnKH87Lvh6v9O0cNPg3+V
	 hfgm1HMULNw2rAiahCoyP6DqVxHVIShFMp2wQh+SSmjsjr0nPiod1m65yyHlI7SciQN7u
	 nWLxgGPBeLLXoCB6d6Cv+XGe370R/G8JqDI2QigJiP1aSoUH0vJdphHpI1TA7ngSwUUP2
	 /+V9RzNYj8zFY2cia+llTkArIaC7EkDB4QHV5h0ZpRDp2pCyNTp7vjS97aU+M/bfy7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328768;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IK4ypl3sK+dcDjebsl+QYQOGbd37vVTs0ONXYO+4p2U=;
	b=sKxfgxTIXZiXnZ3PGw9Vgp+xhM9b/34T3O4FbVtbqAAULVvKa27sJnAbhsezGAW21ggr
	 Z23KqPyjVKUnu74YT9A5GIZ6Z2Ha4rt46+CQ77uEAyvVozdo2h9XUFxJTcbmsSiHvVtT5
	 lBJFnkGh4GGINAqtIPtbxZuSE28ISlVRzEOBrbEb9SmaKNe21RRrQdn014mWH3cxYO5E2
	 wdqpMsQbJ7wSwRjUSqSz7RYZcMDwmBc2DZ55cOH8RQQkAeRXFfGCx4LvvfkNx/1SnQiJS
	 6OqJfOxrqqan5e1PDumxoZw6pg/fUSn2oFJHiWYgZIn3rnf9yrdAX08/vZgb94NyI/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nIt4vP0Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="R/6/vY0y";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB460606E809
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 16:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB460606E809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nIt4vP0Y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R/6/vY0y
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF0Cve151490
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 16:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IK4ypl3sK+d
	cDjebsl+QYQOGbd37vVTs0ONXYO+4p2U=; b=nIt4vP0YqljacaMICeODODdk6UP
	peemM+FXOoDVWJbFORb2bK5O/ALOWl1hlk4IFSdBDDvz15nGWTV5132hySqCeSJL
	QUvRBsC9B1owfFVzqvz1YzVbnDeTbg1vtVcxptY8OcmmssE77N7G1HZu86aAG7dY
	dmGiUQXyyg27JrStCMZ3Rf+TJydE2yF7Q1uEPf6lPBLQq2Kcmg1Cx1a6RIBWzy/2
	vM/dpJkIQEG5cw9V3jqbiUK9n/ddbRutTTm/+Rq6+kOlKgMIf2ZNjj0b5QfDZXGR
	m0DbgtRpdDB4h1EUpykM9dFO7rIttOHJufP4+4Krb8opYxoxlRNgiOF+CGw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pv8nrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 16:39:25 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-990aa76e3daso423833241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 08:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794328765; x=1794933565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IK4ypl3sK+dcDjebsl+QYQOGbd37vVTs0ONXYO+4p2U=;
        b=R/6/vY0ywwhlG2NwJWLQEhvRwkFjBDUdtHKflCVqcEvPpo2L/nP5apGCZEIfW3zSfe
         TqwPKbg5l5LSET3EIS1o4mfBpMHmqOAYiFDANXCqMq/u1rXsWHxwk2xNcIynzBbTSKQX
         COgtd4t9cr70E6HDb/vZ8GDenTdPjkXbsIeVTADuTnKSsRWXT1k3cbf8gX6K5wx59KHQ
         V5HG34UTZTz5mwsJc3cnbahgpz56A4Y+RY78pKPrKzRiCBH5UxjZAY7X6pBReZwuZWTb
         osJJ4ecb96IBNiltbWQ/ubIZjvyS3hGG1ZseSDoLx1t2e7J+qD6keII1Hw5f5MT3cKsS
         B4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328765; x=1794933565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IK4ypl3sK+dcDjebsl+QYQOGbd37vVTs0ONXYO+4p2U=;
        b=ARcSuzNzmWblLl08qZN3FU51VxioB4v0/G2pfU2qRO3yOwz1pigmS8Tr+9b+RV+4Kv
         0NnweUdjCB9kJDfujw7Q3TAn4OFOMpQg4XR8SUICoSs+RfnrQ1RVpfPBySJXmLG9AAcM
         EXiwJYFRbQlQGisKAyN00WDzX6OAzN88EYJXlaHjdJzh7Kjw3krcLbmopzazxxgdpe0R
         Cyc8B2d2jU0iYqqBOAHUwplNhI25/RQRXQHIF/nhaSddmdu60J07dakrAXgFzOIScfu/
         lV7TYZ3u+zqGT1DK3dRdpRtyFCaGHwqSkATx4xgoDDjqXs5F+Er484lL3+7ygR7SdF+o
         /zBA==
X-Forwarded-Encrypted: i=1; AL+hErGVXmJnAalN26EKf8bD4FeflsLLZilSQpYoYX5lDCyG1L7j88DQT4mft03Lpar+lo9wkbwy7qjbeUshDIfA@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ni2vPF0lb82JKJwd0uO3pD+7WHoLC7PcBMe9TmXkBNn3PamuH
	ZaQWLdpodBU3YPJu/YeRotsRcnh29PyB78g4IyAJQ719V8C02QvLUJZN50YCGm+AJxz8trKqeeK
	+vOMqUAxgfqqkeNsRpoUm0mbEAP5hpDBZMXliG8FwEEhenis6tuS0oGymvqBKTJcXe7hIOJNEQn
	EpesM=
X-Gm-Gg: AYBFou0IBuzTRWWVu5oYWM20tl27W5EBm5/SOprmLOviKN2LHeMwx6bbT6MuPBPrCTr
	LY675eUL5pJNL2p2M07qlSoejqWwRccjc2NK+ttDybdZOGOrx7Je/4Wczq3xtvR28Pd1F+rKSle
	0cbnOvKf6D0zBGEGesFmHnOJumpt/vovzhKEce/Zuj5zMSW0lbPvESDTspL59zpOVAyMmOnk83/
	jaodE77heuWVYDXy/NTqipPDqawIP19EcDKN2JDpj3SB6iHJtUVrtl6vaM6pfjereLyc+7+npRc
	X5KdQdxhM+UAxnTDeod2aJwoK5k9M0SDcQMxroZQgAelpGg5+/pEwLHEzgFGpiC0uuRksr2jzTL
	uv3naxwK8Ts5E0xukyuDg1dh3Vb6zaW7uEF1iFplUiBozfScEGVohKRtk0rqORJcKOn4mE5mjfg
	==
X-Received: by 2002:a05:6102:6d0:b0:7cc:25bc:3b20 with SMTP id ada2fe7eead31-7d301b84a8fmr1006559137.7.1794328764608;
        Tue, 10 Nov 2026 08:39:24 -0800 (PST)
X-Received: by 2002:a05:6102:6d0:b0:7cc:25bc:3b20 with SMTP id ada2fe7eead31-7d301b84a8fmr1006534137.7.1794328763889;
        Tue, 10 Nov 2026 08:39:23 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm85130395e9.15.2026.11.10.08.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:39:23 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v8 5/8] arm64: dts: qcom: sm8250: Add JPEG encoder node
Date: Tue, 10 Nov 2026 18:39:06 +0200
Message-Id: <20261110163909.78085-6-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af348bd cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=DnMRqvjp_ngGNQOL0aAA:9 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: yvxIWxOQxzuQLfnELtTE0jTb2lePE3gr
X-Proofpoint-GUID: yvxIWxOQxzuQLfnELtTE0jTb2lePE3gr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX/Vs5tj1SNCzq
 3bH2+GcyzNINIfPdRtyxjze1TSXM0oom8R6hp3VrBIKRNeQ0F28iibqA4E5waTNaJndOAqw1YIB
 as0WxE2Oz0ibMwiHtCikX5OGjfWjqhk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX1A/WH0QFjlbF
 Z8YH7SOyoENzmRzwqJP0ZM34SvyR6dppqx0AGb92bIDugKscNptvuCg+EZTrP/fmROmJeEZoFsR
 BhA5r3HVkeZNxA15vfENHCa0l0vCKLGeiRrEZi7eks0OJEQVyxCmQZz5IsXnQjGs8v+qW4kaVfY
 7LgWkLd+uiJk8d3myREeEbCpFC/gzXS6TAI46DkbBNFrIa9xMoet5e1VF0m6N2FaeSyiHgO/2G1
 cMwwTX8hY5LKErH3hWg1OUxCNCn8MjfN4BAUMe3ZV+yBLtb0Vhh1L4jh7RWHduirkbfTPn1WN0O
 ix0VuOfKO92uWi/dzpnL9fjH4CVJuysbruZy6u3hHdyUznLEtKPngzPU2Xgjy4zPMv8Oa1rf80I
 vFMhp9vdKHbtBjiSRaLIBde1qexDXe0cZqE/3HYone3iOs9+ja4sJENYVqcQ//xyaPi0Ovy36XL
 na4I8ci4mWifCu7KZKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100066

Add the JPEG encoder hardware node to the SM8250 device tree so the
qcom-jpeg V4L2 encoder driver can bind and operate on this platform.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 72 ++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index f975c2183269a..7e8447df40188 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4480,6 +4480,78 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		jpeg_enc: jpeg-encoder@ac53000 {
+			compatible = "qcom,sm8250-jpeg-enc";
+			status = "disabled";
+
+			reg = <0x0 0x0ac53000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "titan_top", "mx", "mmcx";
+
+			clocks = <&camcc CAM_CC_JPEG_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>;
+
+			clock-names = "core",
+				      "bus",
+				      "config",
+				      "cpas",
+				      "camnoc_axi";
+
+			interconnects = <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>;
+			interconnect-names = "camnoc";
+
+			iommus = <&apps_smmu 0x2040 0x400>;
+
+			operating-points-v2 = <&jpeg_opp_table>;
+
+			jpeg_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					opp-peak-kBps = <262560>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					opp-peak-kBps = <524760>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-400000000 {
+					opp-hz = /bits/ 64 <400000000>;
+					opp-peak-kBps = <978600>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-480000000 {
+					opp-hz = /bits/ 64 <480000000>;
+					opp-peak-kBps = <1095600>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-600000000 {
+					opp-hz = /bits/ 64 <600000000>;
+					opp-peak-kBps = <1095600>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo>;
+				};
+			};
+		};
+
 		camss: camss@ac6a000 {
 			compatible = "qcom,sm8250-camss";
 			status = "disabled";
-- 
2.34.1

