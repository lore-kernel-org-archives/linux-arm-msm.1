Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173130;
	b=wHEq6ym6mXlb1suHq2fEQts/YyZ4pQFxAEQd8TH/ddkg5C+IseyeaCjW/vquFFRWubhI
	 S4hjKNr8ZXJiSECzLqbaSRCJ6JtTOWhacH+Lw9sY4IZToXMtqBXfJo8Gds1FHyCWJiWu2
	 RmZGEyEHQHZkKpVg0txTqt2Xed0bluI+KasH5D4ZEB/kchJcXRH6nCi4bI5SGytNpQ7AG
	 fNIgLyED501qazF1Lsmjdo1vM4gCEv1Ph7/99KLT9UpsIVyi5lpSFnum3Lk+VY4L3FSyn
	 cvbZGCbsC8xPdHtWMjaaKZOEyd1VP2kEfQ/5MBJhpYcr2GPsrxHeSQBxKuLeYiz4dSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173130;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oqZu+4x9fDqyQ44o+g2J2eUFTLu5V88xCtdE1M3ct5s=;
	b=MqZiG0/7pDQAnlPzKKEz9kvA+iUclkdUufO0HGaBpVbQlwHx8tXgCa3bengfZJ695vqJ
	 oDgwEJpZnRKluBjCSIFCLdtwSl7yW3V+PqqE5JBpmo7NnPM/QBopsOz+9TxcDV9VHSJNK
	 x+lv/4tnp3KTpMQEAeYpG0+09/H22t9S/Q+YgdY/OTShxZHFoCXq/Oo9g+xtmeod7dnQ5
	 zHe9R9R3f7H2aQnY4U/tkCTb2XomRxeis1YSMqTvtFGgX9Hdc/fOIVg2jloHodEpAgwNO
	 vx/OOpOtbmoJvPSpj8gl76Q8H2zdP3cR3nDtmFbjdgQerk+M6GKqM5XmkAug1CnkUfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KRiw0IbB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YRXwiN6A;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D372460A5BD5
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D372460A5BD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KRiw0IbB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YRXwiN6A
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjxON556462
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oqZu+4x9fDqyQ44o+g2J2eUFTLu5V88xCtdE1M3ct5s=; b=KRiw0IbBHmT6Y5Ns
	ROULM0D35x5Juz2YsgzcAileMNEC80p96/qGos4/1AfXhihuyWrRAUFgOUCFrghZ
	FDYe8R7UH6vTb3hax3+v2inL5jaFX5konNj+33d4VFDbslWosxoiGr5y+U7QWmnO
	dKgfWf8htN5OTF/4uuN+ngax3H3NxGrs1Itgfm11ktF9c4GZ5wADg3YqisgSd2Jw
	xlPJp1xfyHLHttZ66y3cDDoNN4u5np7yBCmWElR5RGs7gwCnrgcvS5J/CWt5+C14
	62PQ8v0lCmgQFVAJgeuNQKUw+5BXx+jK+X918rxWNDCA0YEjODX1MJwSL9fNY+D6
	A1zASA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbhep1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:12:09 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b238436265so507296c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173128; x=1795777928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oqZu+4x9fDqyQ44o+g2J2eUFTLu5V88xCtdE1M3ct5s=;
        b=YRXwiN6Ad+iPRCqjxFfkYyIjFiXR1z/XFOmE3X+xLsVyX/zdXcbrpeFvlo2vh6wfGv
         4ryM+zlueYPqh21DpbXxfzkqYP3tPBUw0AubRzkjmbvX4Z1VP+IH63JItRl99bIgWoGo
         f8XnQY/vvX1hk9rAlNZ5h4sZAMwuaGSMcxwQtMxR6jb2/hgNDwE2cqt1soOUgkcuLKW6
         5lmzCdRoa92qPfVaXGbrw6ckQxHx0aK2JBQRTrfypx0czCl33ANGEbMlPBfHtjYHTDe9
         9mDvpfvKDgEUe+QbQdbWRlNrzuH3mwAK2LMxlXL/8iprHQ4HsBRuB1yfLQJpJXhNWfMp
         exrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173128; x=1795777928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqZu+4x9fDqyQ44o+g2J2eUFTLu5V88xCtdE1M3ct5s=;
        b=B+I9U7Pt1RnodFj50nUPBhOIttoJxTZPPdhUar5YZLWSpCOMup3OMqmPgt1R6/Sa4J
         HcEQ/iw4xkO3KgupnEtqHu3XYXuxryp7xfZV7DkgKZ3Ms2jzBCO0wLcKC7kX1EvZu0lg
         rFqvUpQoKrZeXUaQ7sIN+OrLxUQEqAJHOcaS1Y2c/kdK0+31x1IOtjWuwc2e1wttquJr
         +qbx81stGRhoXu/Df6l/hLrehepZWlTb/khCcVZVRwaKRDIcqIUNkvbzNYrnf1B4CtAe
         clnW0hYImnka9KzasOheT5d/b4xQ3WNwTmFFgNkcHiCUt+O4hY4kqoGryvt/fhh0XHq8
         12SA==
X-Forwarded-Encrypted: i=1; AL+hErHkrTMakjIrov9lwDrYZo7l5ZrzG88OKvS9zQN105F1ve1nd6bvSks6Xz++cwxw8COYoAJ0b7PhF9t/iKRf@vger.kernel.org
X-Gm-Message-State: APuU4Z/L0tMAzV2w1NR/VUwlKutU1/RuKyKcm4jO5kyoaz0BhXxcDex+
	62twwxU4QmeFqDTkpcDa+qf77Z+YmTH6cBnPCoGhhjevK+CCWJZyeXcjpLXzfPcnpLnw16wlAv9
	p3H2lWdegmGNmU3+oWFvJ4cHb4kc9QLnYqPrak4QxuTa0tdfeTFfYvyv9yZsW42XEHLoT
X-Gm-Gg: AYBFou07bBBxw0ZvlpOdBwGfcrodD5jIQDKN2pHzfXIog6MtQi/ElIDPyC0cTsqjlXS
	LkXk4JJkb0t3Gx4Q1CxT4JufKfJJVCr+bBJMNkuKI978Eqlf+OeQkeo28BkoHBeVlnSZXM9PfpZ
	IcEvYIOObp336ogJmF1K/3tBfDVag3AMt1xSUE7I4r2i1Dm36MfkIxvz3p/Hct+yNIhe0FepN0e
	eM11HMLZF/IWgV43+FwtvjdvKtXMyZ0+GKz8MqJAwyqh8bMXtiriHP9zCF+tsJkJUq4vu3dm5Ux
	qxXesDuE532uXaIViIXLqwhWCYWTyDwJLei7Gja4Bq8gnYg9PaRQPJz3z2tdyRW5LV5wxgsnhp+
	JGOkJeGWoXBUN+sGrxHANFYpdeoYsIjFYym3z9xeQ0GBuwRVwnAGzKTFwqEB1l0GujGXMbdOK8h
	7DFjWZrfz/
X-Received: by 2002:a05:7022:7f01:b0:15e:9126:c60f with SMTP id a92af1059eb24-1b5568bb55cmr2509377c88.29.1795173128328;
        Fri, 20 Nov 2026 03:12:08 -0800 (PST)
X-Received: by 2002:a05:7022:7f01:b0:15e:9126:c60f with SMTP id a92af1059eb24-1b5568bb55cmr2509353c88.29.1795173127795;
        Fri, 20 Nov 2026 03:12:07 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:12:07 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:41:00 +0530
Subject: [PATCH v7 10/12] arm64: dts: qcom: monaco: Add Iris context bank
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
Message-Id: <20261120-vpu_iommu_iova_handling-v7-10-25a771235a7f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=3345;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=Squ3Ho/x38HQ+PfZC/ca25g9bdRa6cMHaBF7TD1Laj0=;
 b=UNXJXTR7SlrBfmvrYKPiC2eatMbpTEzjm36wV1DMG5gn/2evsMiYH/2ID9Rs2v1PE5eoAwkT1
 vtf9osnY5iXDrjjBBqQxWdoDXxeeR2WAPbvutj9EinTL4wAsFMByhG/
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX1g3Lyd8tIFxx
 jtk6moI7erJeGDfp3tWq803Vp8FO6PxYezCYYp+fgyp857jvIUC/LFdSlhtKgzjSVmE2Zg5q2Mn
 urhKR8lrO79+IX5xMA5WpbtE7x989iE0QX6Kw3fT6rTbL7cQyWGQ7VdynopiPTr4dbVPTckM0Ho
 UgiGsit3JWZLfTzQkTGchzmIGqTsXKC6UGoDzwTz5tVVAkhY9uHN3GOaKQk4dc7es7KCO9c8Ix+
 byLiNx2jiwckelrhz2zoU2RvDI0vGl/zmQ9Bmk0GW86nlPqzlmHCOTXI47QX+Ri99zkfxzNR0cI
 //IdUtdlQdd1VobzCyPrNMXVHoIRQ9XR0ldMzrXayKr1ET3TxgBHwhffeehBF2kOI518+yfWZrG
 x3xa52D7Uz8Tx0n4QfaoMaucSMWq4OF//qy85NyCzY4ly0D6+J3kOVLffZy3c4ajs/cQHNXhFAv
 5mbQgofZMdoalISRfow==
X-Proofpoint-GUID: KbDfYHp4s7d670qjj4Jy_KVxiAjGWRrB
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b002b09 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: KbDfYHp4s7d670qjj4Jy_KVxiAjGWRrB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX8/3eph6MWHTw
 1AcLIJClEZfnr+BVtnbVxBFFgQdgTXUt4rbUVxSaFd5b3qEqXoKCQWv/f1OEkB/HxKcxtEKgS8U
 PEKQwfyygs1GEiu9tx+dPdZQu7V9MeU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
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
 arch/arm64/boot/dts/qcom/monaco.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 3541313a79bf47fe27499f6dc370cb778d780a08..e4805479e82595f3e4583f051cf664ff97b43aaa 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5419,12 +5419,23 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x0880 0x0400>,
-				 <&apps_smmu 0x0887 0x0400>;
 			dma-coherent;
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			status = "disabled";
 
+			non-pixel {
+				iommus = <&apps_smmu 0x0880 0x0400>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x0887 0x0400>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

