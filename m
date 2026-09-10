Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACB2493D49
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047046; cv=none; b=LtbpeUWwbtyWFFeRzVMDAVxMpySb0L/LwJWuHhikpGXp89zcq9RS/ORK4Q4RKi5tIXnAZZ4pKUqjNErBUhFBacwfpcFMK8EcOJvkgjfATQeXmK21bqOcutWjpBZHBiDlahGFuxLHCScfmbeKSapQF3oCYfDDNv6Ch8GiMIu5tpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047046; c=relaxed/simple;
	bh=/8eJm0qGdQ+Q8dyV037eiRiOgir2MYpk/8LFMZZq97k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iC76+/Dxp7ocHFsk8+QKolXIBHFN9xbEcWXy99/MwDlCCVyh52HCU3eenbpwq5QFyFriuhTVHd7VoPS4FQ+03aIGH+xsxoKeZlysxs8ZxVSwguuVYnQ5wAJlbmDpSzPciQz5l7dyr2q3UHaakgzfOYVb5xqLtS3hS3WOHaLM5/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eVrrix2C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CfLPb5jy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eVrrix2C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CfLPb5jy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7lhL244968
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5SDQYaMGQoEaZ0ZMAisgThP+PU5YxjNodvpxddtjGJY=; b=eVrrix2CuT/uBvld
	k7jsWV9nuGVcxcYZP+fx82A8YfIsch13RK9TiHmHNcm+kz2+bkjD+DDk/GcYV1xk
	WON3LJI1NFPLTdipPzsg2ovotzRxsNFTECHGv+w5Tp7qUn1bPky/ji7eqlC0n2zI
	HOUF0kYwJpZ9ZzJpHZVwiftfpmrPxVUzEg5/tH1wpJOzpC7YRiIA1Du4YPnbma8s
	bAPE8348zreITlDmpZdTWDVU4axnpKL9TkKKaUAJbuNsaCagGSWUE+TKRG+ZsKCx
	9Fm0Q+OLHB/BP8/LiPnYkSXhS1EoBehMEPff0Wd6HBMkG9cVWeEa5P5RtesZ4oz4
	f/ZsBQ==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfm3pu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:30:43 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1afdfb685so4375513eaf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047043; x=1789651843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5SDQYaMGQoEaZ0ZMAisgThP+PU5YxjNodvpxddtjGJY=;
        b=CfLPb5jyQvhiq6zofdqrjOwgKH+9vEYzFykkl2nZSrQcms4GmlXaD2gp/T1jub19pQ
         Vh8TTHe+HELKfMDIPMD9d4Rmp045tuA8zX/WYWK/sP7gBXXiA/U9Dz+gZZBr9plPNOsw
         ky5ukqHWDbEc6QYWCXsdx51ifQRvcBv8qEFo1AqULMt9izEdE8DF0QxNRc+6k4iHrrmU
         p12pRUAJ777jl3uHzDuJC+uqtebKm6DaHd0KXi8VLUWq95uRjHyxLq+Dkw342OSl1fHG
         2M7fbKtzgAGwz28f+/EToEaH03oJWY+Jt5zWWk9/05mqK13ql+ZZpF1P07YtYXlBlbIW
         TGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047043; x=1789651843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5SDQYaMGQoEaZ0ZMAisgThP+PU5YxjNodvpxddtjGJY=;
        b=HeRpVH+n4poXcy4SncDTB6PpYSm+bwdYpDNbhNyvDBX9Ay52YVyj38vAeC/ibk3v+6
         ZwfApMXJ2KIhW4TYvwSdJaAe8F2uOo6DfAddUitgPh4KzvGa6hrEkjViGP9XGtP5MoCW
         oiURBsjO7eV1WViyqmXRxLoHHnza5mNYhweHoqZlEeQX8O4oSYNekqQmFy/CDFMdzM6R
         oiw+zTX8bnObPj/dpB6T37d/yzqAK+K0gcHoxe//gtPTG8ixot8TVi3VdTxiu6phsKPs
         wmUAUgt6ujctt+HFQl1iM7iqmguINe9YnDJXyd5f1Fu+4NNASVjcSq4RNcObVIuMw+8S
         s7OA==
X-Forwarded-Encrypted: i=1; AKwUvBweVYYyh1cKPqLgNmkakd412x04GgNBI70csE4okbHl0GEbSLLrVhTMuZDJDF5c6RPoZIjFEzlmmewq6Hsx@vger.kernel.org
X-Gm-Message-State: AFuF++kmTPD2oGPevqoWGMAyjSLdhjGfKlnezfDPaHawmuAT/7lXZr2V
	quc6F9+/C4EdO73DFD5d1+AxwHXWKWT6EPvXspklRIy0xlFrGIiup+bQaxT2kZd51T/lZheJroK
	YsUsI/OC0s8edOCmdnl3nu9TgSQMGBQwoEJsjqG/r7tawlmXJo4zEuu2nD/Zvn3yCv5fX
X-Gm-Gg: AYBFou3lu6c4BT3vTsTQLUh9HCrfUlO6KOmm8fr7WUvplyoccYbJ/zmiEAMGIQR0HS4
	ZdwU4BMP8dCIYtdfnAwhMvV17yLh+u8eW/f7iOWlWSa4telKRsTM76aS830XjqOyLhqCMGNKpqD
	C+x+2DJnQGj6wOYqrRXBs6WEg2zuJSVsfRNaAyQUS9pvNS8W9GcSgL8YczryG4JKJLwZEA5gnCw
	LDbfD2iS4X0niKjPFxJ7wtRhqXxypp5eTfbPcX09b6FFU9Q0CYl8RT3YUCkAAPacGU8R68LwDV1
	Nz8rDnnrqnkgzPkTePb5dD5t0mDKOWRmET+zlGUDlpA/l4a+W6WB5VivQpeagpsJQbBGgQjQlRH
	bOQqFDGOUVro4LfIMTzOQ4AnZsCVqTuuUbVM=
X-Received: by 2002:a05:6820:f003:b0:6b7:46e9:9706 with SMTP id 006d021491bc7-6b746e9a26dmr22863408eaf.54.1789047042798;
        Thu, 10 Sep 2026 06:30:42 -0700 (PDT)
X-Received: by 2002:a05:6820:f003:b0:6b7:46e9:9706 with SMTP id 006d021491bc7-6b746e9a26dmr22863376eaf.54.1789047042365;
        Thu, 10 Sep 2026 06:30:42 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:30:42 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:11 +0530
Subject: [PATCH 22/34] arm64: dts: qcom: qcs404: Move PCIe phy and GPIOs to
 root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-22-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=1862;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=/8eJm0qGdQ+Q8dyV037eiRiOgir2MYpk/8LFMZZq97k=;
 b=WzpAJzgTA+S4fZ1Gamvsz14oDZk+GnYUkFczWzVEu2c/DB69gVojEcMWWhPvrsWv3cTXHGcmk
 DthKNX9ABdqAir+10CiddAwnfj7tfn455w9z8Qs+nyToGhVDBqLlbUv
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfXxHAhma4bfi4r
 BoHgB7oe2itLXfD9xfrYqqF8+FIAiVUg1dfeyWLzrMIy3EFE2Cbr2MaMXqbArRA6CmAo/eNPC7Z
 7umNzP1zX6nhwNNChSbyR58RQYjytw0=
X-Proofpoint-ORIG-GUID: 2Y3Cyj2N-HZap0LEEHSLk2JPZfiR6RfD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX2W0OoAGztINn
 fljRSyiAvQOFRP52GaOBQWlmVgDnMu3GVZvn2gy1G0oDnx0gp0iNA2QC0r9j5u0SZyP1x1/wQO+
 AR5SFvM1bzTYkvXevKhIav+ccqAkN11WSpFS7ni/SCC5SCVhaivPNrgKoTqCQyiMmbW9fKgH5MB
 0yWB0Ed1WoFYmZOnOBMguSB2dzOsjF8tZPB8R9KqlWvN/B1aWRhjGefTjTOBpXTzU3TMQ9MDGBR
 fIMeDm5p9PMGlZz6RMwV+6pnSAEs392lKS9qbi10m0su8W6KYJkSuOggGvCZdwI4BRODMMGV7ZD
 wyZeZvxG/JqWixzYOxUazWne3JftKg5V7L2qxaM+/8LgFry+AQkSM/+P5Y8P5FsQlJaLYuWHL7B
 8AqcigeXigygs7gZwgBWEoREz2aoLwVY0ucI1x1OAltEem8tNkw7BCHvInKqayb1S15RTt2QNbv
 ty4945q9LshRKKaXJ8w==
X-Authority-Analysis: v=2.4 cv=H5pOUOYi c=1 sm=1 tr=0 ts=6aa2b103 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-GUID: 2Y3Cyj2N-HZap0LEEHSLk2JPZfiR6RfD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe phy reference and the perst GPIO property are per root port
and belong in the root port node (pcie@0), not in the RC controller
node. Move phys and phy-names from the controller to pcie0_port0,
adding a label to this node to allow board-level overrides. Move
perst-gpios from the &pcie controller override to &pcie0_port0 in
the board file, renaming perst-gpios to reset-gpios to match the
binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 6 ++++--
 arch/arm64/boot/dts/qcom/qcs404.dtsi     | 7 +++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index a22b4501ce1e..a035546a1b97 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -101,12 +101,14 @@ pms405_s3: s3 {
 &pcie {
 	status = "okay";
 
-	perst-gpios = <&tlmm 43 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&perst_state>;
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 43 GPIO_ACTIVE_LOW>;
+};
+
 &pcie_phy {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 736accfc34f9..b661505b409d 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -1517,16 +1517,15 @@ pcie: pcie@10000000 {
 				      "pwr",
 				      "ahb";
 
-			phys = <&pcie_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

