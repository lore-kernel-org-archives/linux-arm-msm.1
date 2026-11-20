Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173136;
	b=zgIZQRpkdbfA58vwEwSPfS+0lOwVtBRmBuYfmtaBmYvY2Yeev/xY3w+kIGlVU0+rI3mL
	 3JbrdeMZfMJBrj47+rJhUXIdyiwuIc8qfF9n+zk02gY//5s03nrY13N0jt8Wai7XAcCiR
	 zaw6ovV8Q9FDQE1UC05/jOEFA43zwSgjzzyeUqdg6JCIlDNmzFd5rnBrz9CSif8BEkStF
	 B3NqsvlVVbGvO23zmmeReAdbkoAKBFSenRTl4g7Wsui1Rr35qVxZ8BYNx3ZhR95Kl79yG
	 GrV3mfvU9jUHWj7jJFWxPtQkpH3Z+jT3pmF9yNyr/KfV8JC98LJNiTmXdKyCG5zzNNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173136;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ztkFIPaIXJGHL1mP2JskZ4SRuaMUJ+mxptqDiviV1do=;
	b=XhSMw7zRbJkFY/jlBrEaczMViuGhtpUyHCsCtrHFRUhq+I3EOdL9fQLH2eQ3ujd1N+iV
	 1VgvhuIcooOJw/EutDQoumxWEsMVePNQnLHVnAxK5tPysqsKMGgM6NBnnV0RmYxRl/0/n
	 LHtis9KXwfdIO1AAsp4v+zfJ08Cob+crCzUPI9fZBSh0BZ70Dl96aTEv2l7sOcEcyMRHQ
	 jZNTWlOu8jlBKatAmWKnmo5k7dLq3DmWi9AkcrNW7sy80ZZwN3fj2FQtvpOiEusoTUeYF
	 ClURo0hkyfobUSXiqIbImc5UOMdVN50t/cJh2maP1mRpZA/7tSUdUklk/n+n6prmqzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yyql6JnG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ROV291V7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06EA60A261F
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D06EA60A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yyql6JnG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ROV291V7
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk6Ox3987225
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ztkFIPaIXJGHL1mP2JskZ4SRuaMUJ+mxptqDiviV1do=; b=Yyql6JnGQHI6xssC
	DQLHvNyMp+GG0Oh9uCAvImC0qdy90u8OMXsuPSnyuIHMZlxzZKAQSyYcZH/yRbXi
	9ycxC2tXBWwK1Y2jc7elF978CJ/4hkbGnbbeuyFFoedggkEgb4NZlcLgGspnzawo
	dHT60EoDjYugKXOxypk55UqVZjiad7JaW253kF/AAvAT+KvmGBL3VxCT82uc+uhf
	fuEw4DS9XD8QE0Y/eZiwNz8JGlFBdL5twza3wR0koH1DkSHr0aIyn4FAvDaeLW8Y
	C0UlkKG2UnFtCw0YiOAHNwORG2gZBu4fJhy8dYHJcT3vkRTQDsqk2SF53114k9Cd
	JEjb0Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu814nw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:12:15 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a5005fd0f8so1527247c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173135; x=1795777935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ztkFIPaIXJGHL1mP2JskZ4SRuaMUJ+mxptqDiviV1do=;
        b=ROV291V7ecwKaPetyCULndyNowP1fLuNOEunxd50Gh+FyBPRrcZiOvbUu4K4cSaaL0
         wwAqbKRiaNO9y9CPCwtISghPZk+m9lUPfuBl85GOsB6BPrPZamzTvZWR3+BF0fgi9ry2
         EK+1IAfDvphhYCY/VDjjyNlXWAo6S2WApNVWXyJl82vpz14mdkoJDDEHhKiqocljvMsi
         CciVu/WGojhiWApDNaBMXEUHE9OZVW3CwVeVPCLvqe4/EneGzyvfwuzToC37XidbWvCM
         nCwyUvDpEdl5fIovjxu1vAVJthaTjNcf8b3Q8RUEASHY3Nb3lvs9xVqGtHWKgux//kz/
         BoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173135; x=1795777935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ztkFIPaIXJGHL1mP2JskZ4SRuaMUJ+mxptqDiviV1do=;
        b=n/Efxr6dLTILsgn98fCratDGHBZrXmRBCyDoz7akrPxOlrrRBBWeLK7nqYiHHR9idK
         wB5HcjN9uzfKIXsuUqTY3V3TknGlS65RqzcwYXmS1kJ87NV0JgQHSh7/UHrKe88Ishwk
         sQ82XnTaDXa35qVpG0dwPo/up5X1NJzmDpkx8+ybzYiUp6lLtGaiiuhwY2yN6ch+RUqc
         sQyTHNjWWjT9Z7+xtt8dDZ0TveN0OnihapRDkiBhIO/GYCLG38pflWxuRF3krp7xhBxl
         mGqeTsXUNIC4YtG8r0D24zNHziF+qa6qt6u6RAlM42LbBUw3Baar+33YCQvyz1Z53eo9
         fwHg==
X-Forwarded-Encrypted: i=1; AL+hErHOEc4x4x+EjBynxNEZNvU7B4o0O/2I4G/+QBlxpS8nxEOgSxBfjIMM+XHtq0jUy8s06E5Tg7Zb1CBSOm7j@vger.kernel.org
X-Gm-Message-State: APuU4Z/NEMReXWF6FOUTJ04Bmtkj0ymEp2CyCOxV6D7tyZZvWYMXLURZ
	cH/yhtPK+klhnDLCGh9p6ue2hoCuBQy4uQmerF9ttud434H9+9H+pfgQDgx6K/vQtIdw+ZMhDMF
	3oPDix7V1RxlLodguZmcjemUIwS2jvOMTqeCEYB/pt7D07bVZuQeoJcjo6CBh7agudnmd
X-Gm-Gg: AYBFou1VwvazoBo0YYowY32ev4f8egCm38aTz7BzzJU6cPyWVkyRO/0oX0UFXi8AvUo
	Y1i1APYcWBP/Ot0EnZ+kv2MTrL3lStvMmuFBX7BX7xDKZOH4F02FLAKO8iwHuRUEUbZgZbCU+g0
	dKFNfMX98ZWN52afP3wWh2L6voKgBij6+NyIJtEfk+tPGJyUrsYIWF2e4UculsogYIMwI0xhUYx
	/2LluJc4qF+XSk2F1aEjKQ50bn1zBpOwxMESWlCUwCy1KDxrT+xnRU4ayiG48SzOxio7koZi6Y+
	RgIqJNlP02gHVpu+5Te+MpmQCU4gFbfofKOnPRa5S0kO/1YATy69DFYPQ4xjmVUsMOXgWois58x
	U3+vb7aBSuDBxg61zFfCj9b39xVrK9JomCcf+ASEdUZpDzdR1M/ixP4SB+Jannm3iBRUo59B7zn
	CzGTxHu3EP
X-Received: by 2002:a05:7022:e80e:b0:1ab:de8b:5f0f with SMTP id a92af1059eb24-1b556924b07mr2781710c88.40.1795173134485;
        Fri, 20 Nov 2026 03:12:14 -0800 (PST)
X-Received: by 2002:a05:7022:e80e:b0:1ab:de8b:5f0f with SMTP id a92af1059eb24-1b556924b07mr2781681c88.40.1795173134004;
        Fri, 20 Nov 2026 03:12:14 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:12:13 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:41:01 +0530
Subject: [PATCH v7 11/12] arm64: dts: qcom: sm8650: Add Iris context bank
 subnodes
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
Message-Id: <20261120-vpu_iommu_iova_handling-v7-11-25a771235a7f@oss.qualcomm.com>
References: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
In-Reply-To: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=3502;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=W4XxK+uUtwa6RFdkeL/rZGVqVGU3B0sS4/gBlQHEJ5U=;
 b=1IS2OiI2FOtb91uQ+P4MxcszNruZNbEsaRR0QoCPwgjV4gyrVV2HChI/RK7aUl93QvtO3A0Si
 f4Wwp6drd5NDjOC3dQg0CTgjmSp1x4eU1waA4Q1fTKaQRwx3OMh7sfH
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXyuJDEY8iap/A
 UdN1iW2hA9+DtJlqgihnZzyFA5o3TBcaFhgiw1yiqi1uA53uJ/0RW5F0ZfWHZUGHH2NRFIs8Ofi
 kEtG95PaCD2zvBoFpXsRm2n1iC5DxJY094QCAsjR+BTd5y5nyFT0xeayYFC9z1FFS2mhahpOAqO
 fnn4Xa7st+UzK7ecjy9gd/znSwdrIApAiSfmgzN9OnG9Fh6HpCVeE7IYf1e+ni1e39jY+ovNLJs
 qIfHAY4dPxy9pmW8z8E7xmbWHJwEmOMZtHlbKJUoRiF9XH7gzDWmVHK2hvb3ayNQRk6tg0xwFA0
 uaUPjiO7KuYtJ37HbiSqKclPyeH21c34RLmCyxhemhla5stZ31bj9R3BzK/C6kQmFEY8jw6UG3S
 bXedX0cMF5ZZgOtFxS8mdNMogYIL24LFbZrF2FBqFCDrtViHN5Z7T5LasRx3Rzo8s/RM/vrS1Ul
 zWV1AOjRi7Wk6WadkWQ==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b002b0f cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: pFY4SZn2JyuAKyRCinFLCa6V3mcFlZAO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX0t8x0o4wIYb+
 duYaptR5+CmWoUjzgijbbLWwmzi/Yt9xlUnk/n4Kzg6MeFgqws7voLJJWxHfqGFRNSJXn/wQcfr
 L+s56XYKVnocorvp8f/eG/34VRCOHi4=
X-Proofpoint-GUID: pFY4SZn2JyuAKyRCinFLCa6V3mcFlZAO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing restricts a
non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Given that the address range restriction is for specific VPU stream, it
should be ideally be moved to that stream. To achieve the same, a subset
of streams is now represented as subnodes, so that each can be
associated with its respective addressable range. The design was discussed
and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach
was later concluded to be a hack to avoid having subnodes, and was NAKed
by the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

The video-codec node includes address-cells, size-cells and dma-ranges
to declare 1:1 mapping for DMA translation to the parent.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 5a030f9646c878675f82138ba99ab5889eeb0854..b68859c6a893aa452af2d7d273c7f3d97811a737 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5275,11 +5275,12 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 				      "xo",
 				      "core";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
-
 			dma-coherent;
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			/*
 			 * IRIS firmware is signed by vendors, only
 			 * enable on boards where the proper signed firmware
@@ -5287,6 +5288,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			 */
 			status = "disabled";
 
+			non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1947 0x0>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

