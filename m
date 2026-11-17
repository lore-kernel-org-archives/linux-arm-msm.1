Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794897297;
	b=hOcGzrpIkJBZJLS0192PiLb9tlbP+ugT+WpCrxNC7eeaKaGe0+ECBDdx5ZHheebIq0o0
	 OmGjD8d5P+87P0Mn1MELyqgqzyy9fQLPhLAEWMwvRF52f6omR5kNtFqYCA32Hd2YCb3Hv
	 dKnEypW4MFxFh1Tu56EbJ0UVZHamKnq61hxk99kfnPAM3buLyWQo0gM3UrgOzvvN1nrih
	 pX1r0HDZLIj9DFUnim7r25IslM54G8D4OGdxDw8zrzB+cNNTx+YOxE28Qq7sW5PMrKSXH
	 ME2MKUuWBIQ1tFW0LpEaGK11J2jBAzklYPEhYanbFAWjL8uk6XKJwVJ6+1BFfze3Now==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897297;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XwndoQmiyBI9zRxb06u69wZxnWfWyjVaQ9ot0JdUD9Y=;
	b=RSxRd2gSsneNfGCfW2ygEd070o3QcGLN7BGHAmHMzcjz7ow47jyvXa1wNpcwiEQOvLzU
	 WEEXzcS/scrFuwY3l1+rC6K/mhbVyLmkcVbv2ZVu1BvEKHWc4jaPFjqpH8yF9mtgE9++s
	 UWcs+41kyG+AKSPRj7ywDNnj4O+vWvdXspE3iyt93Z+AK6EY3yyrXi6K24HXtRu+dnm4I
	 jzacBcwyRsRL1KZRDvpKWlRnyc2mWQadUUl+I6Nd5AJjzrfZfsnQ5Xcf41xxQULpiz/8n
	 bqHCY3LsQMSPWP4SzPXZN/9JMZf5bUzkCugxAog4zfkGu9jhYaK0fJSBfoPApqNNJ8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LOMHBk7e;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="TwMRxwB/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37945606A329
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 06:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37945606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LOMHBk7e;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TwMRxwB/
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aMEA1801060
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 06:34:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XwndoQmiyBI9zRxb06u69wZxnWfWyjVaQ9ot0JdUD9Y=; b=LOMHBk7e7rwy1KAF
	n8bJKQDMb4OMECWuPzohIRS5TOcHbRk1079hmzVdRAK7aJFy8W7OddmXRqSfb8nK
	hTP2/+b1BMoDbcvoEM2xg5aHSthF5DrwEPJPQ3hnHK1d9UeGz+2Vr3oUF+J4z7hj
	aojLdGpWbxMVxaX2NFsFm61HQhkrBa6tB92gRsnoZQH8WgzX1+RfrJYcLl0R5lAe
	b20nv8X0e3iikIdVVdeZNE9fuAsF790thZtz4xgNUaRRqBbFhgCMq1qJ48TLSsT0
	lIDlP1zMyoBOm4wCCyD1yTgKWoYeCYoNypmHYYFyGfbVC6LDVA+Ti26hM/iRav7E
	/pQrtQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j034y3eyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 06:34:56 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cde00369ef5so1021607a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 22:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794897296; x=1795502096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XwndoQmiyBI9zRxb06u69wZxnWfWyjVaQ9ot0JdUD9Y=;
        b=TwMRxwB/3M+Ov94hHkrIEKO45J9jG26IN+HPHv2XK3YYaTuOuq7b43mv0nHVL6qQEC
         dFPR4HJeVPzqGAJqiOqwyqSbt0ZlmtuCZx6QsoI0Y4XmbQ+qGYYgWhXBU1tqxWlRRed1
         dEWklNRV1HQkqToXpFZy+PI21PGOotnOHTcdgqAUVhw0+V78hByfc6X6suJN28yoh4+p
         MYm5H+KLAkjC/drYE4Gs6vfJdHDzq/A9zDTTCbFB1WShavLrAKSx651TG7XjrBLKq0EQ
         xd2KqCOyAoWnpkgTvH+Lb3QwrmAO3JOARMFjLAvjABdrUqPAIh5ae1gjZnQFQap73dCf
         /VLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897296; x=1795502096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XwndoQmiyBI9zRxb06u69wZxnWfWyjVaQ9ot0JdUD9Y=;
        b=HEXhk+7y07MFc4h+VRUas57nPviAtDNLDOZnq6GjFO2xbeIV1/1n7x/aS8DA2Rtioy
         qV5vA+1kreNPcVsSvAz+5dmfvl4w/iIk2vHMbLk/EbqYA2UjUdqIbDLMuPbpcqrPWs5e
         g+C8p2PLCejc+GtxJvMIBVPyjRLsEGZYXpDooJ1BbWtniQj78ya7sSmdYL708DcExfLt
         PGX8YjukQwBZUNqMfDsx30iiDgk13/N5WbW/UQaf8IaTVRfJy9PH2gWZcH0W7FrzL2xq
         uAm3MLyHo9gmBvlbemLm/JZ0tM83hfMNU3R80Xy4s+auanuHsZcs4pLS5Hyxq26T6SZq
         gARg==
X-Gm-Message-State: APuU4Z/4BfZLlUmohNxxVpP5zhE6s0ZBVOELJ0BHpq46QsTzZgu5TuDq
	ke4a7iLSV8uhl+nuYyE5NpeJpK2oLzUpoKqGpM7bMPktltH88Sk3kC0x+6xR385WzQZuU5UVxke
	qbdNTKz6HLpT2kDh6e9fSIIjOzehEttLRQXoWGE71qp3DRdHb+VEtmVZ+I8DWc/NKXPpA
X-Gm-Gg: AYBFou3IvmyKn44to38+15f+GeY8/XvUliFVGkw+9iI4EqH/v+bEk4SFD9etnrV6lRy
	JDGneThDJYeaFT+wal4T7+Za0sDHcYOvAmjf6BlYESCScE8/HBKqj8nbWEn8/8v1Yy6rUOEHWn7
	PQguzdqtsiL4AUfn4Ell9VfxpgdzKZu+Uhd/E3XA09PSHtS761Kg90cSvTj5ltyBqaRfNZaPFTr
	oImqx0OzFenF5SIFZkDhUqn7LETmErh6EzqHJLOfhAN0f4QN+VCebhJub+3nEeQoVx/tOFF5vTJ
	LwbwbJFAqtEJPk3tbphWwDw/3AyZkIAOxEKlveTYQHu4eCYkT9SMGdZv0ZzPEJmUtNzndWJXYLP
	HgDB105xsRxoMe6erY+5vxirnVpJk+ODO1LLZnsjCEZlkcoqHi80vGm+f/4+2LLXSKgGIO2hYm3
	YO6L39yLFRxBNqqW79BG6DQQ4OudWL+yGf/bFp1XP9Ve4BhBxb
X-Received: by 2002:a05:6a21:890e:b0:3e2:9b5:b16e with SMTP id adf61e73a8af0-3f7a4dbfbd5mr10059123637.7.1794897295553;
        Mon, 16 Nov 2026 22:34:55 -0800 (PST)
X-Received: by 2002:a05:6a21:890e:b0:3e2:9b5:b16e with SMTP id adf61e73a8af0-3f7a4dbfbd5mr10059094637.7.1794897295084;
        Mon, 16 Nov 2026 22:34:55 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18b4e68sm5202219a12.25.2026.11.16.22.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:34:54 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:34:32 +0800
Subject: [PATCH v3 3/5] arm64: dts: qcom: eliza: Add iris video codec node
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
Message-Id: <20261117-add_iris_for_eliza-v3-3-02a55a9272ef@oss.qualcomm.com>
References: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
In-Reply-To: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794897274; l=3615;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=H2WyrQUjBIxQE9PFzbM0iJiYdP9I4yz6a6tR6KJWNlw=;
 b=WEsL9cfN3XVN32V9jITGuv7FUn60HptwEolsSw61oAxsmqbs0wyx7rIEhrwpBC4p4S/h+KPwQ
 Opjps6kBc67DK9l3qQMa6mGg/ow5WOmVVEKjk5PdV+IDJmzE9mofPlt
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: 4SgHtiEIyN3JYSBIe5peXunQE5-bjeZC
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6afbf590 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=lXaTmLNGT-RzeeOE_7oA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 4SgHtiEIyN3JYSBIe5peXunQE5-bjeZC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX36O8DT5rjz8D
 fwHuQM/2mCNb6K3rzOExn35aL8EgVNGa5Llj3M6dVeeBZfxyiyE1Q+1MLhbLA+yLoliTcd2mAUu
 z+LIdZkMhqlMBKkrbqhn10x/LGndT5c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfXzMtCfKTH3oRd
 O0q2ud0uVbwWOBlFvBgjxRcS7+VUzDdmcKLs+4tEPK4taGFqKJv1WSNC8K+3TJobOEuXvGDJBep
 +BqoTJ7TPBtAoXz4UYfeMI1VnDykbdz6UP1vZw/2XQrq2+3UpTJzk1bDBOUHeW0o7zVIXJGo/Zs
 2XC59LxHpbr14JsIpWjF3ZCr+wXs68hlsqHfq+1WvfeeYE/Z6TDOcsI/RFeTwWVzUYoDMI9CqIi
 6BWG/HrML2NnRS1obxYVZfOSdvRMHwozlfNPtL3hFvFVOEo3DgBH+Fxe8Irge4BvrzKWlubIgPB
 lLrFgwbNEmt/3ykO/1oaHlrwl5RvNM5n7LeyuBXxnpD9Cq1TJoTjnMeu8Hc2nsPmvEN83dcrl35
 W+rDLV1D7tkR80MZIEAQR8y+IQ+NPfh2xJfgz3WnJ8FDtlCcQx4y87Jl/E6gI4AgCwJLFf4/Og6
 ulYERXGeiXeGLIXad+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170025

Describe the Iris video codec hardware found in the Eliza SoC. The iris
node is placed at 0xaa00000 with VPU3.3 hardware capabilities. It uses
GCC_VIDEO_AXI0 for bus interface, and VIDEO_CC_MVS0C/MVS0 for core and
codec clocks respectively, along with SM8650-like AXI bus/XO/core reset
support.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 98 +++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a125ef386c025fe6ecdbf4d17a785d1532ba09e..0c13d3f9b6c178687911947c890d4c4d5318e2ad 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3429,6 +3429,104 @@ gpucc: clock-controller@3d90000 {
 			#power-domain-cells = <1>;
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,eliza-iris";
+			reg = <0 0xaa00000 0 0xf0000>;
+
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_CX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx";
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			memory-region = <&video_mem>;
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_XO_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
+			reset-names = "bus",
+				      "xo",
+				      "core";
+
+			dma-coherent;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
+			status = "disabled";
+
+			non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1947 0x0>;
+			};
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-192000000 {
+					opp-hz = /bits/ 64 <192000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d1>,
+							<&rpmhpd_opp_low_svs_d1>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-533333333 {
+					opp-hz = /bits/ 64 <533333333>;
+					required-opps = <&rpmhpd_opp_turbo>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+			};
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,eliza-videocc";
 			reg = <0x0 0xaaf0000 0x0 0x10000>;

-- 
2.43.0

