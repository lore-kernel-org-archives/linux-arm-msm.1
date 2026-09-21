Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF1C4C33E0
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 15:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005016; cv=none; b=ZQeD/zqhFnMNSG5Kj6xXgnMCywKEgzVmHRGHiw/9jCj29x8Mdc0BBgSbA2C7IUER8CdFvRHKitTDGiK6brLnViJERdk2BnmlqeZuGiHL40pluzRVP7aYfi2UEUTMVqkhzEHLZlqw2vCB8cGvNG+wqq+OaCL7Tr8ObJ4BcENU1K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005016; c=relaxed/simple;
	bh=HmeR1l9JD8JvYgGsyzO5QvZGodxO5bhsmjCW69cOhmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FaXSEIpHXIEgEovSQ9SYEtH0sdHy58z3Csuoxo+Po5FTBc7bh2GHkyWcvszHxWovOAuSAdCpHc2KUdk5VtVWTThih1jEuQbi9CcKf78mFRIFOSAxv2809tA5a/Nzup9jl0/jcgUCi/bGepX2/hVdat+x11ctoVEWV7O1JXh+H6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QdIWrzQF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jvv/gubB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QdIWrzQF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jvv/gubB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFAIxp1532526
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 15:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vjzv0biNUKG1BiKaowTeTkIFJcvCjq/9OvYidNdvtc8=; b=QdIWrzQFFkqU6Jb0
	0zzgPyVPcHrlw2A8D5GDZya/Zi8mBpvUaVu0xJyzcPDngkFcIWrCQbMYEMEAG4Ac
	0PU+1Ao/BjnmG3R1CrBLusYorCfG53VBRy0CJ827eJ2HKtW89dsX+kDL/FeS9kMr
	LSydfFjaODh1g5siKTpKYwc/15xBmwzm0NuhDKPjY+MRZY5UHXOQwTPofr4mJV81
	PRbi0FD53Yjg4lOp4HGyQHWaB1GrSuSTyAxfOyMeT/LMkb8b1oYPbueXJiO/5RZc
	f1rKKtjpD3cWIrdst1Ike4Tv0PV3WyWvGMPfnQLr92f9hhVfVjQBWYmJXab92Y2m
	4t+dJw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8bbe0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 15:36:52 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7989d8ef4a6so842097137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790005011; x=1790609811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjzv0biNUKG1BiKaowTeTkIFJcvCjq/9OvYidNdvtc8=;
        b=Jvv/gubBlmw8NtzBu95hPI/JxjY+5cS27WHZh4eHnxqo3k4oNZyw0cArhUl/b3UbX4
         cQ1te42r2B+fR/ZPZLD20G4AzsyUGgrJRJWl56gBz4tcSaez1ZioNxNfLHRkFQqJTjhG
         e12d7HhVeBtqaK9fQflNY+ayabII8mstfK2rdjhcNHak2PWZVG3Sms+UgquRArq2sLu4
         Fdd+ID0AoJ2wwXmddLo0n88rseiGr60qYwLE6J2vWuzpWmU5o2SyOnisyd4/on08rpqD
         ud7yvESFZjfi5sCXfVy4LxG784JwJ6ujtOT3ospCDfRwwn0LrJb36fJiQRGm5k8iH0XX
         QFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005011; x=1790609811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjzv0biNUKG1BiKaowTeTkIFJcvCjq/9OvYidNdvtc8=;
        b=sGUJHrbB4uo2dQmBPbJIkziJmrqdhADMk7kV0R58n5m/aRATmlSopaefX4RIRRXbtP
         l3exaJGAQog0cB+fawcZFJ4+MMeP3EMt0YVmn87qGCo8Wptb+6Lon9/R3FpASzxMirgv
         cCMr/+xRyeSZ21O4X2cdvAqkBYYYTef2aTGf/51WrEitgZJrL5y4LBNXke59k2gFKzTh
         SAnh7CgNLaKfjGBPMH9uHxTfMgfVYpPj3TZGSUgKX7QRa+simiU78hjxcu6kgwi0mckY
         Zs8DSqVIgF1hPUfP8gHizrR174qxGtzTAzuy5y54fFM+4+ejhkbNIGO0DH2rlrfXLgbM
         T8Jw==
X-Forwarded-Encrypted: i=1; AKwUvBwfiHNLE0lLTtXhvr1rXDSQS8CxxkHniFRm2rzEuOgdbXr7175izMD3IPOfem9vR8whx2UO3Irqo3WyscZw@vger.kernel.org
X-Gm-Message-State: AFuF++lppkNx9JBI5Eq0rQOLmvgiVagD6GFB8sQ/Q14gmjIH0oxyNsgn
	oDTyXEziq3XZUdnRS6BeuDI0C1wgAm3xrn2lFv5aIUl6Qas8XqoCRRqKECLYbKjBqSGMUkVhx+j
	8xflF7L/t2z/57W2yn+vIdockhTAihT1au8Jj1ub0Xg+NSlkaKEtzHLPE7t1xEC9PZrb2
X-Gm-Gg: AYBFou3buEPccJPhsTa1BRWFs/3M1JI4ZyDxv9556SLZJgFaR6nFGEu0lfIsK9vZXtY
	dVi4aNgs2+6x9DwjvLJgMyJPqkPYXVWmZD+khW9wYMxmeL1ZvbUScLBiN96iP7eeSmf2mxSMDou
	IUN++QhPhLybRJOmbrrYvvm8iLDkEjr9MJYIrSS7yJcgolfjAFZPG6SwbjiYme7gIQtydDD7HMx
	n8BQpwbkwoEzMy7qHFqZiW/OsL2qVY3tH3dfBAf1Z38G7oLbWsPX9GNchgInIcUeiybSn3NIJJO
	tUF2QaRIoqCVtkhxBPByurbZ8bqhbnxtHWXAF36h1lvGFd2kXxXnGK20nDJcojMaSTTujnpsFc1
	kc17Q3PXXpftYKQT0XU+MSsqpKxzpCwNBmIVBZMZrQZFRy1lMzUPBxOMOHwqE9vjDVelcK1smis
	rdW8G+gHlX9nfe8Fi0O2xBg/wSNnWibBn6dUF7hqWr5cBiZ04Rkds=
X-Received: by 2002:a05:6102:8007:b0:7a2:2632:ee08 with SMTP id ada2fe7eead31-7a55d28cb35mr5213182137.23.1790005011401;
        Mon, 21 Sep 2026 08:36:51 -0700 (PDT)
X-Received: by 2002:a05:6102:8007:b0:7a2:2632:ee08 with SMTP id ada2fe7eead31-7a55d28cb35mr5213126137.23.1790005010739;
        Mon, 21 Sep 2026 08:36:50 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d5b5:76d2:82e3:e5fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07bba7sm231054065e9.9.2026.09.21.08.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:36:50 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 17:36:27 +0200
Subject: [PATCH v8 7/9] arm64: dts: qcom: agatti: Add OPE node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-camss-isp-ope-v8-7-dd1c86a3c8a0@oss.qualcomm.com>
References: <20260921-camss-isp-ope-v8-0-dd1c86a3c8a0@oss.qualcomm.com>
In-Reply-To: <20260921-camss-isp-ope-v8-0-dd1c86a3c8a0@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIyNyBTYWx0ZWRfXy1t+huvaCTvA
 6gtMjbr40V/nFX7KQ/Kwwp5q6kIlkAg81j+3ccK0ixCE1EIxe3euI9kJRxnWaBH6B610V3AEC8g
 QIaIaYOpXLOYZMz/zf4e4Sw1KHuw0425s9kIK25TNjNufo/nsnJ6cpQuxCWGigai6H5Kb4XZUlL
 +5Th7/RyyxHGG3wRR8Gul8DrMDvI2aYemtPI2mYZvwc9CxqbsSptWCGI7pBpUpK7RMioHOm7550
 GA8uKucqf1FwGW9j6YIKUaEsQxMA0ilkNlhORjjn0mgXIcQc4bqEaIxQNaMmvjNucbVKFYNEFgZ
 1e3zFn4K/5mJy7kR7Rr6S5cZBGE8ZD3FUf9AOImEAw89q+ZlOkaJs2HfFDzF0/mayhSU1AtpBdD
 UrWUAotGA2IiewlOeW7FdYStuwgtjidq0W4OUPxf8BxVEmHGnvGPd6w3afT2WUwTBgYxUm0r1tj
 TNrVbV3VX0S/jEZemBA==
X-Proofpoint-GUID: hc5ylGEQOdMMYEFEvo7Ogah2vcvFtoNM
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab14f14 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: hc5ylGEQOdMMYEFEvo7Ogah2vcvFtoNM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIyNyBTYWx0ZWRfX8KPs0jKUsOWr
 JegU6noZflSiRYK4cWY/LpDpUSmV7up1uyzAFYpC6o9Bwj8JQpLlU1ahhgtpAOILmWNZDyGvMkB
 ZFqa7l359WeBR2I1esuL+/dj/FvDvLY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210227

Add the Offline Processing Engine (OPE) device tree node for the
Agatti platform (QCM2290). The node describes the six register
regions (cdm, top, qos, pipeline, bus_read, bus_write), clocks,
interrupt, interconnects, IOMMU mappings, and OPP table.

OPE is a memory-to-memory block with no board-level dependencies, so
the node is left enabled for all Agatti boards.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 77 ++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 397d61a8a27c2505833466bd349acc27ef4ffe0c..7746c58b5b1cb25206e72b888b7559cfe27553b9 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2020,6 +2020,83 @@ port@1 {
 			};
 		};
 
+		isp_ope: isp@5c42000 {
+			compatible = "qcom,qcm2290-camss-ope";
+
+			reg = <0x0 0x5c42000 0x0 0x400>,
+			      <0x0 0x5c42400 0x0 0x200>,
+			      <0x0 0x5c42600 0x0 0x200>,
+			      <0x0 0x5c42800 0x0 0x4400>,
+			      <0x0 0x5c46c00 0x0 0x190>,
+			      <0x0 0x5c46d90 0x0 0xa00>;
+			reg-names = "cdm",
+				    "top",
+				    "qos",
+				    "pipeline",
+				    "bus_read",
+				    "bus_write";
+
+			clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_OPE_CLK>,
+				 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+			clock-names = "axi",
+				      "core",
+				      "iface",
+				      "nrt",
+				      "top";
+
+			interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+			interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+			interconnect-names = "config",
+					     "data";
+
+			iommus = <&apps_smmu 0x800 0x0>,
+				 <&apps_smmu 0x820 0x0>,
+				 <&apps_smmu 0x840 0x0>;
+
+			operating-points-v2 = <&ope_opp_table>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
+			power-domain-names = "camss",
+					     "cx";
+
+			ope_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-19200000 {
+					opp-hz = /bits/ 64 <19200000>;
+					required-opps = <&rpmpd_opp_min_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-266600000 {
+					opp-hz = /bits/ 64 <266600000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-465000000 {
+					opp-hz = /bits/ 64 <465000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+
+				opp-580000000 {
+					opp-hz = /bits/ 64 <580000000>;
+					required-opps = <&rpmpd_opp_turbo>;
+					turbo-mode;
+				};
+			};
+		};
+
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,qcm2290-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;

-- 
2.34.1

