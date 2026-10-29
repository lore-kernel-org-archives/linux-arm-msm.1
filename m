Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793246047;
	b=HSxRjFDzA1Inortz5DA2+x/IDW1xf1tCZ3cKY04lnNlkEXCpBtdZQMVCxEIZDnIUo02O
	 NaT3zaAZaEXdHOnvsbBcezMocJHpXfx2mZVx1QcCKzFkZ7jpHamOKiDvmWczsdZ3kkGhz
	 uCxNUzTUnMaFuwO4wV7JfKF6FxQL9PDLMwqGs7c7H7CyJpTN1Nnj80UrYYIb87eDmUddE
	 QtmVSpqUq7pkUAt2ad2n3zTwr6CguWNDMcffjHnFBo81DyhUJTj2Q5JQv4sNB1MWKSNp7
	 9I2VO73XQU5jeyN8oBiMWKZY+FJIdTYs4qaoUA5YXDFhCLrd+hUPSwP7stmn3rcyX7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793246047;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oV+YYQgmYqH5rHweZ98iHnQy4E8Zo46BbQyX59hM0ac=;
	b=4oJhW8E5SA2dC9IkVV1CLYD7Fmlngexd22eVt6OjVz78F6ObOe+x/ylJVcTBaBKe4a4J
	 WUYYFc/JV98tOs4ssPwAzIO6g5GbehEknLR0tuWhvxMTiOQ9xA8liPCd7sJV6g+nFiXvW
	 C3jJZnyCiom7GghfRZMPoStpcQER1TCINwGb+DsB7ZcI7O6tGWJsnPvKwJGzbE81/sMKR
	 gMkH7/xd2s4q5BcZRangyZSMHXcnIwdlv+ryXZ/FfMmSZkbHl7pLQuKXHqbcMFIq4nSQJ
	 NGQHt6tTGyBTiiedGRPWeWM1nj91+Y4gNlpE8yUWLbecYC6chkBccC2ipH1i4nRaH1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aaSnLk+9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fQYc2OeC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E7160A2611
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 03:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9E7160A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aaSnLk+9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fQYc2OeC
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jZk23376873
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 03:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oV+YYQgmYqH
	5rHweZ98iHnQy4E8Zo46BbQyX59hM0ac=; b=aaSnLk+9O3ug1uq5y+ZtHUCq7o+
	zLBPTTuMBFyswCLw2Nxk9IeEGuvoCo91SdmvXKUaJ3B6p9xiXQd7icQFcpT6P/vw
	rT/PIuea7/7jsPuGXD3OMqDPU7R8BJm3nFECOgyKv/O0nS7pkEfbG/kR+2JNG7oF
	O6dVPDsNVl4Vu2vvrGgXtySOkvWJ9GFbLhMTmf5pB1Y3dHmAn9gkG1DE7LKC6DVW
	wTzhi2RPmJCO9uy345FC+Cf8CBFKNriFoes9KHBsGH9i/Y4Iz23PUpOXagfWkq1/
	0xcVJI42tWwhjQe0imCU/6Jymm9jK/Uq34hgTKzg5sqUlPLhrp2psXmhfWA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hktmp8sa8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 03:53:54 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6dfe0f03baeso2105533eaf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 20:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793246034; x=1793850834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oV+YYQgmYqH5rHweZ98iHnQy4E8Zo46BbQyX59hM0ac=;
        b=fQYc2OeCE+uWA2DaLn+3mIM13U9eT3V0r8pSljo/6Qr9u4mRLLiAHiv18gbcX99OrU
         4c3/U7QdEGS9pFFSdEoIYLE18/6H8JSkCNssMmD39Z8OCRK4LBLI/AMM8lWf6LTUsYUy
         oWMvvKxx00pUDhpEYGaZ6bITd08KhEZEdIetqwDbePdH1Zxna4CIofIUB3fY47K3RDyb
         eqFtKOL38Wa29SxSNUbqKQdy5WKp31SkvzkVfpdJ8u7+byeqrbA2gbY4lCw/5MKWlPcN
         Hd1ePCe/TEbmbm35T+RNlbBc/TpMpPdWGgSLTUdWgEbFjl6ippcTrUEWAEsYC1ANTlsY
         XsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793246034; x=1793850834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oV+YYQgmYqH5rHweZ98iHnQy4E8Zo46BbQyX59hM0ac=;
        b=z2uerSRNRWXoIYN+kkY1cf1FTr4IqiGmZVSy7Kr3LbPVRBl2tgn7H8NOxbqodTunPR
         YJ+wOGPqjluhlwbkjTeUtndR4pwKEGxxY9EaFaJlLqH8jZFZPyF7EG36DP3CUeOyNqF8
         1nOzyG8gPC40GpWAToFYX/raCyKhzkXiXiifEoBb9ts9UoUYag1OHIki5trcWrfWfWV7
         XhylJPzRelNJGlxZ5FqDfGgB7FCdOqBQBse9iGqYBy8aNK1OqaUlk3ca8t+Sj9vFII8r
         4C+eyx9z5dxszRd7ePmOdOUBd8i9ez5dohmGwHL75oWdscTSAU7IwomdjzPlhJDhtzTX
         riUQ==
X-Forwarded-Encrypted: i=1; AKwUvByW+8TDZcXrAbXnBvtE+13PYAHzGHopMF1aPzw9n44Sfqv8DNkOoUyiiJbJwJPWNCGNiv0LNOOMpgS3OR2V@vger.kernel.org
X-Gm-Message-State: AFq9FYIpuV2tgWr9GazIOIHJM4VyJut5HcwdhectO222CBP9/ocCSQX0
	V/9yp1LzoN4kEmkxbg33VqbDCq36Zwjrq0nD9Gn3ZaACFcY3JjA4dzItycHSO/he+3KiOjDqrUX
	YLgTIiPkAw9fWR6Kic1ulm78mFaaapNaPAWYXjsb+fJrS1SDu7uIPLhci0cwau+fOSCg5m+zQ1f
	hV4bQ=
X-Gm-Gg: AYBFou0H9rKQvsvSJE2vE++mHB7rWHa5l99vm16Bq1HckZHivB4qphAbxqDsn91REMm
	RkccRQbGjGc1PUyQgmgpW+SkNDqLsz2Q74PkZdR5h6i+YkbFWolnBSGRPVyy2usS7r5OWE8BMfw
	S2spnC+5O7dtTX5E4DxZqfpNqeNzXq9BJco5fRN8Q5ZCWKDmFRL3xxTloz6RsQGJqjtC5ibxcyM
	T7UWJfrJLubPCj5Zm2SK5Ul7EfBnCc1SS54SoF1eP8eseXJX7+YssF5m82Op1FTHG9MX85DA8DN
	ulh635ju9E3g/D0IYsXqX3+I7BUJfQvpPfbyLTbB6DkPOmKh6cxAb1NNO7dEewHk5Tej0iH7+6g
	bVC1Uu7SiEVBhUi0uGZZ/yfHnU3NMMg1HX8oxWA2LWkxrId2I+MgbXdbGelhUe5ZkrQQzWoHmzu
	PzHur6NQoDKTNDIKhMhy01ziLcwJVtT2JC
X-Received: by 2002:a05:6820:55d7:20b0:6e0:e81:e5e8 with SMTP id 006d021491bc7-713edca6cffmr1899610eaf.34.1793246033734;
        Wed, 28 Oct 2026 20:53:53 -0700 (PDT)
X-Received: by 2002:a05:7301:fc01:b0:369:fa8b:d725 with SMTP id 5a478bee46e88-36a204a51c8mr5854369eec.35.1793245676251;
        Wed, 28 Oct 2026 20:47:56 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2393cc86sm11064286eec.19.2026.10.28.20.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:47:55 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v3 3/3] arm64: dts: qcom: nord-rrd: Enable eDP0/1 display output
Date: Thu, 29 Oct 2026 11:47:28 +0800
Message-ID: <20261029034728.633495-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029034728.633495-1-shengchao.guo@oss.qualcomm.com>
References: <20261029034728.633495-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxNCBTYWx0ZWRfXwOk4WRdz71dY
 xU6Amj79Vp/BDV2eCvPy2SE6V0aTgAYcBL9n3bc+AjEjuQDl1pmlOLJxyhMZFmNnhf4d0QdN98R
 RMOB8NqrfOleT0JRFeVFHyKpjGQ5YQM8Q4fHZvcVJUngsOI65caAXeQepGfUno0tznYnc+Fs67A
 A8wWlOZYFWshrIr3miXUC9EnyOUQS2iYQuR7MXB0UYCw+8gGtaKKfDiZkKbNST7mtSA685h1Ujo
 7sVdHlcVnCraBmXSb+VS8rYOedZ/TNBdAF/PYP/KwFFEksuNsxi160JN7WYfZNT1nw461HbcVL8
 b6GfQdPQhmeF46a3Sa5TLAo5JDFTpLtLsVYAb+lhc/tBlQZv4m6xxHPVFK22wLaE+V3x8jtf640
 CSeBKCssdwh5sRxbWJlf/QENXFQATDtyu0Kf0kHVqvdieZucSnNe+dRzW0HV0f0vs1Fz7S9STYP
 1Zp8LGRSyn9SkKAkFtg==
X-Authority-Analysis: v=2.4 cv=crYOAF4i c=1 sm=1 tr=0 ts=6ae2c352 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=wlBrTx1nK-2z6_sN8T0A:9 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxNCBTYWx0ZWRfX7yUxpJJZMuny
 cWSJlEJ2cKOqDKzj4+NPKD3wjTU/m3+P42FIMLfZ+Sn79XnEZVO9yBE5l/m6rAqbJP7nQVwD8UX
 1KsOuUoixGiUE/YjCjAAMVxUh5xIAn8=
X-Proofpoint-GUID: U9zVlrvNqlJpqpNyKuxvSJsHY3I2NQGL
X-Proofpoint-ORIG-GUID: U9zVlrvNqlJpqpNyKuxvSJsHY3I2NQGL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290014

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Enable the MDSS, DP0/1 controllers and eDP0/1 PHYs on the Nord RRD
board and describe the eDP0/1 connector, its 4 data lanes and supported
link frequencies.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 62 +++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..9e3a74f8deaa 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -53,6 +53,30 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	dp0_connector: connector-dp0 {
+		compatible = "dp-connector";
+		label = "eDP0";
+		type = "full-size";
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&mdss0_dp0_out>;
+			};
+		};
+	};
+
+	dp1_connector: connector-dp1 {
+		compatible = "dp-connector";
+		label = "eDP1";
+		type = "full-size";
+
+		port {
+			dp1_connector_in: endpoint {
+				remote-endpoint = <&mdss0_dp1_out>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -377,6 +401,44 @@ rtc@32 {
 	};
 };
 
+&mdss0 {
+	status = "okay";
+};
+
+&mdss0_dp0 {
+	status = "okay";
+};
+
+&mdss0_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp0_connector_in>;
+};
+
+&mdss0_dp0_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
+&mdss0_dp1 {
+	status = "okay";
+};
+
+&mdss0_dp1_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp1_connector_in>;
+};
+
+&mdss0_dp1_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

