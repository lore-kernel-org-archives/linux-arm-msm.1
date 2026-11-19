Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795112042;
	b=olPXEtcMMt4c6ijA1WEMbBUw+4UxMGL7COt+xOQ14DGPhu7uFiSABiVNecKfpYwrptpX
	 fYAvSjxS7Q0LxMjYHGIKJnIrIF07yl4gvzuFYb+nH4iuElZXOo6tS7EDNPTSR6y5Z4SaH
	 5YvsNvcfLp9cU2zHyx8YrNYdgXTHy2t+iWjsvsAX1eLoSra4MneIMcsQKStIS9aQtVODy
	 loQASF3gMDCK3MNacAXKqDeY/JPsCCw7GgRenEeoK6j5u60GD1YcyPU3LJYsrw54Skjod
	 kMDH/TX3DQWLkVmcCOIUzhPsoAdLp8Sze4FSKDLjc6V4EwYtsO36V5bzB+4xioy8WXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795112042;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4Cq6/rxxWIeTxIeL3D5qEzDRvos9jyAxzRLBNNcGYX0=;
	b=ac3o8PO7LCZiuLG2NDRKvDgXHQlcLoEDigBeqZd3eqOfP2ZhMn9F21FzEy6P0LFrmzec
	 UcyV6e05wq0FxcIk574ORNyntzN9QNmxFZTVJUbMTsaCJuT2pv8TvlMjok63WTjSExRcv
	 97RjDiz1gStIjffR7srhzB0A9k+t6LiB0X/9zWDK504yF0nAS8h7uf8RYj3lHWD92O67u
	 cSwRWNoofZ+h/9U39IuD162sgx+Vugz+8iKvke8HKgPmC+rLH/XkOKzyPd27NmRWSlmAq
	 3HHmGl8LhhuFEK8iRj528fAGiE4os5qD6u6FXZnzK65l4rKGKXoN7gJVRO9/GpgdN0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZUSsRbe1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Slv8FHy3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFD760A2613
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 18:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBFD760A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZUSsRbe1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Slv8FHy3
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJHZcjH2999745
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 18:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4Cq6/rxxWIe
	TxIeL3D5qEzDRvos9jyAxzRLBNNcGYX0=; b=ZUSsRbe1xF8bJtFGnVOB8Is580v
	zFkk47ZK3FOJUgdI01m0GzIUWGEmh2Y4HlIFKGMC3hz5fxchwxqwqKdhYLOFHDzW
	431gxvob3QD+fpMe7hdYehjUc4pWqBXxjfJPS6eIm3+yAq6SZTQ/kUFTiGLIKfFg
	9hYd4NWriO3czTnRdyVHIH+yk0TTFrHUNxz9My24SNeTi14pOWZkVSEHZiavvkRC
	i0ESEQUx1xWG5O5DiPgtRvq/pQ2ZnKA3/LwWh3vMdNijqs5ceNSZCdEVx+EscBnc
	1PAEng8tUb13+smIcM93AQVsxTzFnEohPlrqJKWYk9S4BCz90K/OPd/Mg/w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1uuxb789-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 18:14:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so3766590eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 10:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795112040; x=1795716840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Cq6/rxxWIeTxIeL3D5qEzDRvos9jyAxzRLBNNcGYX0=;
        b=Slv8FHy304SVyrAODQrywx2kXtUQascMkkYBfb/cavSclUuX6wa8Jf3J12lkLssVFK
         XO96mKV1yPRIAf+rJt0IyShMEPg28ibBiIET16tbWpvibcyxDB6jzcKl3kyDsDvjDaF9
         +C9lxyskdEIReVLJw+/cWW7q3VQhdDuxZHUpop/EsxoHXYrv7XecyEDg1jcPGAGPLd7O
         hnNwiBxMoZ+oViEjVEJ06DUd80R3pnH2KPFwSaEZ4Z2EP1HXFynxca4r45EiwPrcfgZv
         BAUpwUYkh/F2s/MerdiV/nSbZoNc6XE1Cap1KRsl+9NR69WZ1mVCo6uK9lCGA+Gft0yd
         Jwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795112040; x=1795716840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Cq6/rxxWIeTxIeL3D5qEzDRvos9jyAxzRLBNNcGYX0=;
        b=fmRz3Z97zA0HHtfu1R7HX4nPqIEw1Rvjll6h0eF4JYlncynsv0sNy46bx04jFd98iV
         jDLAhtWQQnOnEjNewNQ07fVMHbTjB6JItul5JGRG+UIp8S/Ywgabubl8SJCA1tpC3+WD
         Go4xNFR5LrCRnFUZyB4ozq/dZAu5ru4ftfkxsPVstzjht0bxHiO0Q0tjymbFq7NdL1iX
         o0E0ECeSS2GeV/AHIl/Z2iteCQhu8pJyb7Y3Q+iCJUwujd/KW5JyZcP7gIfb+cYseiIP
         hfLsvoJzQEf61cYmtkrCMs3rW1FdP5f13YxL1FQ7UeiP70WpV5EjeHNrTDdFPuUcctw4
         VN2A==
X-Forwarded-Encrypted: i=1; AL+hErHE3ur/npE/w9vnMnCWMjwW04iNmtkiLX7WBmLF+LUeD3UApnC8W+FNVlVH21yxhqKL9VrfMD7dRFcz5iHn@vger.kernel.org
X-Gm-Message-State: APuU4Z+Hwv24k3UhweJlsd/oMOR9iporvbl8G1ybNcg2lrm73s8DOJAS
	YHJyig1LM6XHyz/wvQOolk97S23L4JrMHr8ucxo4k33+2K8MGK9Fc4+8y5s+h65B/ftIEja/J4R
	ZS3X0rXuKxl1DUcaE3dRpmOk+ig08W8X7CpFnbyvFOR75kLgF1JD49ns/IV7XGFokal+h
X-Gm-Gg: AYBFou0ig2eUBrUSC4UR5hGLh7jz7vvSBy5Lgf6Hze46N0ftAJCA1cgSRJ5FCHmnEtD
	+KuxQkoprS4rvOATGFMCBRzTZ5UrBptV8i/ppHyacRSPXX2HNsRJd6oYBkY9KGLUTWV4R69TnWV
	o3zv4mZhzxlQLECRMjIWxDYRrKyqs84qUnlER/1glsXtEmCqt4TqqdUf0dOI2uEmwnJ4Uv5y9NL
	6DTfGPRLE8XOaVEkq7O0ym0a17cecYBlZFLP9xLY2AKUaMV4HOsYNVyznzIFj6S7tbk3dx3Eod2
	HLzgiqdSmdGpHfusUL5jDvp34ASRUz8M/VjNucneHjudTcGaIUjoR3EklPn12czx9cfbuLv8KfM
	ci5MSWas+pK5Rq3pm1zpQNkINlZrrVQVE5YdsZvWBPI2VbX4UKSsaEVTRIKZO0xjNkd5xl8EbY7
	E8tA==
X-Received: by 2002:a05:7022:698b:b0:168:3243:c91a with SMTP id a92af1059eb24-1b556865248mr489800c88.13.1795112039516;
        Thu, 19 Nov 2026 10:13:59 -0800 (PST)
X-Received: by 2002:a05:7022:698b:b0:168:3243:c91a with SMTP id a92af1059eb24-1b556865248mr489785c88.13.1795112038983;
        Thu, 19 Nov 2026 10:13:58 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm793548c88.3.2026.11.19.10.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:13:58 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: lemans: Add graph port placeholders for USB Type-C muxing
Date: Thu, 19 Nov 2026 23:43:48 +0530
Message-ID: <20261119181349.2017404-2-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119181349.2017404-1-akash.kumar@oss.qualcomm.com>
References: <20261119181349.2017404-1-akash.kumar@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: QG5V1qERuVqDCgd9pYt2ZmJ3a7dBqaDo
X-Proofpoint-GUID: QG5V1qERuVqDCgd9pYt2ZmJ3a7dBqaDo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA3MiBTYWx0ZWRfX9fEYJyv3WYzs
 f6oWkWsJ6J4DSyjxh6w4qKTp9+1saMTD7sHTYBOV/SmU4//OCbBvsLN8eDJKRa8uz3mhPAGPHci
 x2TMDWVXquQeZEH4SvoYled5LIAihho=
X-Authority-Analysis: v=2.4 cv=Q89HcI2a c=1 sm=1 tr=0 ts=6aff3c68 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=TTb3R7EhsZKQJm7uMdcA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA3MiBTYWx0ZWRfX+3Wg+sGGl2Zs
 teqvWD9yqLfCVLlqdiafI4WAhwKax845k6xmS3LADJTu4lT8GF4Hv3EQlTehTN5xRuClLvyKzCn
 uLLNffn3pdbCeaPtkKWP6vSfr5BoscQWTzxGk5DW9O+BfUYgQtjyJUOmIArIvol+KN05qWO1ZtD
 HAGOsIUTdDYjGVT07NKcEtRfe3FE4Jhb57l5HzJeacZxUyH+IYu9iz+tzWex/D1sdEs+ZLMNz87
 0qiwQT8osrKX/7F0WnNbIHO8Ol8Wrbs9ssYYD7DJCTovaPR8lTpOYYvtP9OW72SNuywc5NFmvL2
 tSFbyXRuAsV0GBTPf2R00O+a63LPlIX0oBanA6vy/GDPHn8a6HXVl14saxF1GTuKInm0qcrEAyz
 62RS1zH4MZnD8i1bB6+i0Ex13ZyQMZnPyqDRDMSBAZIMOmSjrSWhQJi/T4wqlk0d8cmMLm7by3J
 lhhyZT/GCY8t92Dd9Gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190072

Add an OF graph "ports" node under usb_1 with HS and SS endpoint
placeholders, and enable usb-role-switch, so board files can hook up
a UCSI PD controller to drive Type-C role switching and SS/HS muxing.

Drop the fixed dr_mode = "host" override on usb_1 in the Draco SoM,
since the port's mode will now be determined by the role switch
instead of being pinned to host.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/lemans-draco-som.dtsi |  2 --
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 20 +++++++++++++++++++
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi b/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi
index 1001b6b81c31..6861cccabb2f 100644
--- a/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi
@@ -384,8 +384,6 @@ &usb_0_qmpphy {
 };
 
 &usb_1 {
-	dr_mode = "host";
-
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 20f329c0df75..0c24e5438935 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3024,9 +3024,29 @@ usb_1: usb@a800000 {
 			snps,dis-u1-entry-quirk;
 			snps,dis-u2-entry-quirk;
 
+			usb-role-switch;
 			dma-coherent;
 
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_dwc3_hs: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_1_dwc3_ss: endpoint {
+					};
+				};
+			};
 		};
 
 		usb_2: usb@a400000 {
-- 
2.43.0

