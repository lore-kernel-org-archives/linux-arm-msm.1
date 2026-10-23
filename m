Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768191;
	b=waX2rotGWGxcydMPm6UzWJ7Up7po+zdVSZI12yu6uuaQlIm18ty9LyQIFo9QGHR0z077
	 2UHid8T72BU4iLwWcdgcXKaS+wzy44qOq8cK79jaW/k8ztKluMvO4R29SivIjAA9GgiRD
	 qkZF4HiIMbzgERdNI3lsQ069udPEdWnFulmPOLolp6O7S1JGProyOrj+Y6Uk1aHBhciUH
	 LbUL6y5+A/Ng9iSNDiox0Aq6S62KcE7kSkLdH/ZuFF0UY2uE5nYxJBRmkCLhFIkOogkaT
	 wrr5K3393lzNSqKjDX/kjECGE5kC3Jd0CA7d2dSCUr3vSUNj9Ok5Mhs2y365lbqIFUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768191;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=posbByi2C22vAqDX2ezu/Vx97adQ0JmvEhOqcNgZPY0=;
	b=lz5lECk6AaFjSDDPvSRmi6rQI4deQNxwP6VbKi6Rzia0cXTEMafjLNFbeJs+oo5MUMaS
	 OIXyOsYUK75k9utUy+aNue7sFgcCjHMH/dtm+vI/6RRPYVgkBUe8s5ByrGepLlEML4iqe
	 CE5xoanuzfQJkCzW7lgSmrXChs0d+ZteYQNy6H9JT4IvnhsYX0Uz/3a+ZeJD7i1i/feUR
	 N5oOkKI5mKXDeXCs7SKKIf0BOlSiD6FDwR0BNinMxK6/ohrmQ7cruiNtXXCdrBILUKsNa
	 nSIIh3SoxOjOrJOSxuMtMUT+oWHaBqHn0K8OdPaTY/To49SjpqjWXf96Wnl1nOMzhng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="k1gQCA/N";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A1d8bkNn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC4A60A5BE9
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCC4A60A5BE9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k1gQCA/N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A1d8bkNn
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5s5C4072768
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	posbByi2C22vAqDX2ezu/Vx97adQ0JmvEhOqcNgZPY0=; b=k1gQCA/NeRRM0N6X
	bs7GqQN4v3pJZ2NXvC3FNKBxnn7bSUXLLsq84ULAf8uR6U4QfiyHOtUrDI84YLVc
	2Qh1YUmERppSR0THsNUXXzC5IVcWU7l7cFD+Lfs8NV+OTYWHz646ITwqGtk5llVS
	cVjGihIH5zb4edMp2mBbKaMRzljxozQiT+nIzpGyvp+GnlA8ci8E8z3NIpCE2yWn
	71pUOGy1zOLTx0Sb+YH2fhgrgkm0l/LgszOfzOtGhZ4dNnjf2Cx1IlICDYjkLoPe
	uyx3zadceXQyBayASCbhEy5JbIdCPdEkoxgRfV+UJyRu3+xsVLR9dS6jE2bvYL/H
	LX7baA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw0nj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:09:50 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf71bbf197so857479137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792768189; x=1793372989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=posbByi2C22vAqDX2ezu/Vx97adQ0JmvEhOqcNgZPY0=;
        b=A1d8bkNn4ZRwqMGIGJx5IXqEut6BUQhxl43tFro+K37vTm7HBY9NoVndns/Nw1l53w
         4OztkQAfJeM1zDl9pGlgiMuJjVJ9fP/JlYKNF+SG9/4b9DdcZHsm//JLnKo1bZfFfhZU
         cKLHfAc8v2ppLynI4sXBiaBO/EsGXstW5gu0XUay4bFSLhlTMPsXrTGF8LxX6m1arhZt
         zPa2mAvadxwbr+WADRWGR1RquaDYTV8xwdOvli8xnERl3VqVRXEMtbkiNF0dnRgl5Pkr
         Jm8vSkfAl7B/n2tVMspAU6ie8Is+UL67YykxUovYpI6pEMQtjPps+6nMVHyX+Y/aOheb
         NjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768189; x=1793372989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=posbByi2C22vAqDX2ezu/Vx97adQ0JmvEhOqcNgZPY0=;
        b=1ioNyz1H/1wUSeL7mQit1VSb6F6GFR5QqHc06dG0BByx/WaV2gqD83naEuC0u8gRF+
         sUW0Nbw5As1rYVadKxHA1g51G+NEzYEPEkAw8NTRZsrq2TQDLFOsQGojtsaGxJlaGxZK
         Q6Q8ioQQZFbKKeLpWxePMzB/CN+uK5wnTVezDDdK6v7nZO8zCMgrkbSZFhBPltWYcmRt
         DZ+DBmsFPYmeT7nvYsHHGmVBmJ8v4QUZWAjbRzJXlHW46GDf1b3yQrakk8KGvT1rfn/c
         o/QqQPX0bs/CmRcX22XjTzg9sXTBx/TBdKMTzavoU6If6kfIxZcVUSkJ0nmd4sDQEUeO
         pzbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPC75tTOv87u6eJTK5UTthTCOJN6l3En85Ook7wMXWIUzqcs4SMlIXN+HgeZdDY5531UfKXYkmjNV0gNeu@vger.kernel.org
X-Gm-Message-State: AFq9FYIaw4z3O5xmkGC1GTqHvqDeBKPHZIiXWIes7hMsiySAb72k74ji
	zymZS/YSiAgPw3T9eUKOeVNIrSnU8HbW68p4uztVGEebBQB4ec74vPKLI04Gvl18CuyH9XsEQjy
	QXcBlOSExShtesy5kbUZ9rSjPlK2dpuqNui4ItnIYh7y5RVGnkMeeTu9bho7wnOkpnLjD
X-Gm-Gg: AYBFou1JVpJaFd8O2gnjSECT4wl0H44xE3LTkQMuF81rWPpH12/DiKJbYxg2fwhFnEv
	lnGVviivLBkVl1QCog8+5jY4KkBh7FNbhG+OA5bb/4qAiP9Mx+TwiPGlfm2IVjc2STCeLnRxUks
	Sg9WjQcXsS9Wbs9sqkYq42QFfjFtsXYeBKoO3EEA9lnt/4HdGJvkKeion7FzMm4U7HBg1TR9pG9
	jJfqBdQddnMdRqe4WzevDozJ/YO3WZHNgdHirp9qsah2ck9XoLRrEMXXJjxykyVcLOWtkfg20FJ
	tltcnhNsoU6+gb+x3R7SMKYON8wIb5R9o/0S3V0FF1uZPCxCXHxWPNrCxeqbK8s4rXd2oifZUkv
	XzK3BqW7j9l5u1Mno0wRvMffdbC2cRqbIS3rI96NGBR7Z1koRf+dBkOqwlB6kaGwQmKU7n6dQ1P
	J3w0OmgMKx7xD3bq5PVHwTTqcy/BfdwYYXfLE9Ya0TylW/MACA6oc=
X-Received: by 2002:a05:6102:5706:b0:7cb:fd69:4155 with SMTP id ada2fe7eead31-7ccc2ffad08mr1256675137.5.1792768189223;
        Fri, 23 Oct 2026 08:09:49 -0700 (PDT)
X-Received: by 2002:a05:6102:5706:b0:7cb:fd69:4155 with SMTP id ada2fe7eead31-7ccc2ffad08mr1256668137.5.1792768188810;
        Fri, 23 Oct 2026 08:09:48 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d0fb:daf1:3106:3697])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4040d3sm323962f8f.27.2026.10.23.08.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:09:48 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:09:19 +0200
Subject: [PATCH v11 8/9] arm64: dts: qcom: shikra: Add OPE node
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
Message-Id: <20261023-camss-isp-ope-v11-8-0c2937195298@oss.qualcomm.com>
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
In-Reply-To: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
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
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: VKeFQ8saVl2q72wZ2YK2i1P4kvFFAFWx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX4tsLuGrv93kb
 dS8ZUL0m0kKcgkHvsitSwDPw+zLFkTIZZKefmuqw+KTWEsn1T9LwIfoZGeYvO1I191I4MDWi8q4
 EurzisvYG30EvNyNoqqpmTDqPRqxvGE=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adb78be cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=EzCDy3pf2FPqfMyO2-oA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: VKeFQ8saVl2q72wZ2YK2i1P4kvFFAFWx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfXzcW/Xl4pINHo
 qj6BhJQBYDwWfRrHa2ppKeKi5EVi4fDFPrAyDSSWCY5VQhoL1XNpXJIICdK/YG0hz9gWMYk5FDd
 5LFkRIJfvh/MN/efawsBe31AniVwYi9nJbVzkRQkkRhzqwm02Qco8y86sS53RPtd9nwWOdMRiiC
 aJPv/gwaTvBldPdvtdEE/wsdon3jX+8AM94AwDuEbQYNsMezd5FbJgXBvVqlkR3vpuNXr2Pad0p
 wAA3dRccHqh/Pz7L0fA9uQC3mW/4D70t9pBwkuPcpa0mzR7HOe0alz631NpVZ9mb60N/z0rnrGa
 00JROpEUelC5q35ubDT1KUm+0kERfal+CWPvlfeJB6RcK+OioDCMJAshFB1j0UP1qN3Io0djJBW
 lZXjCT8ZAlTs4wVfvEbXmKaqZ5/kcrXPDxtn+NCIYXr6ck3nS/RwENns2Jp+ciRyZSIEchoVa66
 8K4a+9FDEndYzxJrrgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230059

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add the Offline Processing Engine (OPE) device tree node for Shikra.
The node describes the six register regions (cdm, top, qos, pipeline,
bus_read, bus_write), clocks, interrupt, interconnects, IOMMU mappings,
and OPP table.

OPE is a memory-to-memory block with no board-level dependencies, so
the node is left enabled for all Shikra boards.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 77 ++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 92d22e3b6931cf49f213d1807f78fc1a261f290d..5adc28e9aa64508366e6c7fdad191a152b8cb6dc 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1828,6 +1828,83 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		isp_ope: isp@5c42000 {
+			compatible = "qcom,shikra-camss-ope", "qcom,qcm2290-camss-ope";
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
+			interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING 0>;
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "config",
+					     "data";
+
+			iommus = <&apps_smmu 0x600 0x0>,
+				 <&apps_smmu 0x620 0x0>,
+				 <&apps_smmu 0x640 0x0>;
+
+			operating-points-v2 = <&ope_opp_table>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+					<&rpmpd RPMPD_VDDCX>;
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
 		remoteproc_mpss: remoteproc@6080000 {
 			compatible = "qcom,shikra-mpss-pas";
 			reg = <0x0 0x06080000 0x0 0x100>;

-- 
2.34.1

