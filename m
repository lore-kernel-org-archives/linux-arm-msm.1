Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF578360EF7
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 07:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791185105; cv=none; b=mDZGPUFIH9VVo6QzxL7yVv95wDz5RcqIJJzW3t/yF6XBRlYNKk8KHv8PSclqBNn6mGgdKvPMCQu1YXPLTaNMea1thgazqrNjxuhQReYNwRuG7Am2f3bB+lxJun1G5yJLLjp1GO3t/VhUEZEVOCIV1FdMDddhUF/GZkH6Nemhgus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791185105; c=relaxed/simple;
	bh=pp707mFFIsFOhojrFXFJDmxlQS8mlwPfd2cpcTElHgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hSpvOvF+3MhesKpyK1UApN/V4I+M4sHNo4uGoMb95CifMjzQuTX8I49b6lun8XiBT0qxRZsGaVtE94r7rbCfB28Ek+ebOQW40X/uv3IagIaOl/bXZ1YrGrLNfVIFOflEW7ElpHzdf3SsKTWhBB6/CCFSyowW2Ewv1fS346QMklU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lycGStG6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sm8ULdtb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lycGStG6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sm8ULdtb"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695105UB470884
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 07:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OLb5pDtUQOaPF9wZBJMGDGKqDnkf5ns6MI9EMrBQMvY=; b=lycGStG6yYfswiNT
	C3IgCb8flMbfV+2MsAkgnBKw8P35UTlOZlYaljHDObokQHkovcoVx2oQdrY8U4pe
	tq7OOzWLaAzgkYv2/7CZG8Wx9907N7KVMRG9FJFckrD4e9gLIYYKMupQdg216An8
	giHKj2xRXkwvF4bbKSjOuMf860mJRilyE/dLtC8qJ484My3e1DxuHPex/iW+Xs+w
	hryHHRZtVhLeTibR513+IoKxYqXngTtFeOr5K1hxzSMAPOIgnl2YTDuX6uOs8tbM
	zaekAcExuZWOKaeAaA+LD+nzge742hQww4CYt5HZs0bHN61uBOdCpCfCySD1p/JU
	kNCFPw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssucw4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 07:25:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a4e36d5a77so1521944a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 00:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791185101; x=1791789901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLb5pDtUQOaPF9wZBJMGDGKqDnkf5ns6MI9EMrBQMvY=;
        b=Sm8ULdtbU+FeWNDGMOBHKlSpVEd+aLedYIbkeLQXdVnK6DAVDA2vbWzY5FimgCPEAj
         0Q5x6/3H0QQrQI25Yu0PJ++top/D0arU5HTwvXmnX4H6brBL4XZAhDdWbM+9A3b2+ZvN
         AnQa2FAU9dHSgoOJRzOvQc0g0jzRGYpxI7kode2q3EuJSC4Cs5GsZNAOcoXmr+6HpJy7
         foLz0t0ajO/1TxADBLg8NKYjfhxNONVkdAP66IPIGlenHlJJssn83xsOxjAuUEDs9tHB
         LdgKuRGkjsIWATPSMhKOfArJNhDgUkMAZHHCBhqoFMlXF9izD7fud+Dmy7QlnaEejZd0
         lUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791185101; x=1791789901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OLb5pDtUQOaPF9wZBJMGDGKqDnkf5ns6MI9EMrBQMvY=;
        b=qmfewN2GCHHZURdye98RKJIrObwzr7yeHiOJ1se/EEELzzBZ3302WKO0chYits8YmW
         VFRkNU6scdArnQ7ycRJQlNLsC6fwkWvNkiOL6ZZ+m9rZCphJgcMU1ugQiq6dEWN7M9/h
         aNTfvjapodPfivHSY5BoqB7rgU3wpWUkUF9Ydzb3VJSaEqov9g3bgsS9C80pLnD0a1T6
         tB5qQrfXTVrWvVMqqyikQCuZelac9Gsu/v+ZzYOudC5GTdp42PE7YIQJXgy322Hp9UAM
         clt1pMX9hIhr5Ij7o0//EjSrI8l1Oovq8ymsATxXUnLWBedeoHqMwV3mwjGtRR7wbPlk
         7dzg==
X-Gm-Message-State: AFq9FYJGpgphmcQtF7EJS+TQxALdDWZepUAw+Nq65esCe5Dy4e+dCpvd
	LIBxrQQ6MGtBSQ2YNPQJalAz9Hqys4W4bqhXzULoukxPWx/NOVi1dn6JobHLe61+IKSSGv8pI7l
	u1wKxRJg1CWkqD3WViy3sAWuTMo3DTtl7cMpgFjwN1bs/HDI8X73pNMAFs3BUYs8xLX2m
X-Gm-Gg: AYBFou2l4JW8rdX7xdTLmgJs6NM7HgUd4nsgNh/HDKZ/Qr1oS8wU/Zey1/rBf+q+jEJ
	LRlxhwNVZne+6gyjti8dKrfTQwoohx8TBKFkWLrzijvAJ2PFHg7ZwkgKL21u+vw/NCTUUrLUunK
	gH7aw61ZaAUdQKTtAFBmM0YWeZAMhtgtOO40XlvYall3yWuRxdKvWKBPpf43UfXYncFZyApZnsd
	xgjrWlxiTqMYqzswXuqxeNpbqZoMlfNylClOOu1c/wrR2uV8SV9aUZquIY5ZLWHWIhrFBVEqFan
	fZyrYNUMToi+s/qzdKVri2d0QK/hqyc5fMNGJ1VSvH/CeL0lXDPQy+YrACnkci170g0hyP3IIjT
	2DNA9gbVNc41cjXwfeAefDi04VmxuM4sIW7k=
X-Received: by 2002:a17:90b:3c07:b0:3a7:9fdf:f60 with SMTP id 98e67ed59e1d1-3a79fdf17e1mr3283239a91.11.1791185101438;
        Mon, 05 Oct 2026 00:25:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3c07:b0:3a7:9fdf:f60 with SMTP id 98e67ed59e1d1-3a79fdf17e1mr3283220a91.11.1791185100963;
        Mon, 05 Oct 2026 00:25:00 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4f3911sm9901421a91.15.2026.10.05.00.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:25:00 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 12:54:28 +0530
Subject: [PATCH 3/5] arm64: dts: qcom: kaanapali: Add DisplayPort
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-kaanapali_dp-v1-3-6faeac3a6d59@oss.qualcomm.com>
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
In-Reply-To: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791185070; l=3560;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=pp707mFFIsFOhojrFXFJDmxlQS8mlwPfd2cpcTElHgg=;
 b=z2L87++pOyLxWbsPAX3pnL+nVhC97yCtc2jN6m0+st48uoNgWCwVgLBSSfdz3diouBTpIEHZa
 93Ug54zFV1UDBkOAyGQTgWeNP3uLcUdVXHF57JoklKDvuDYFmK6k2m/
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX77wxNCKgg5aS
 o2kNKka/akmmRLKtOE4afqBwKwjQ7UsqQjmzpGYisQhqibcJIM7IukcHo4QnkYHUQeSCCGytXz9
 vEXpWFaRnTOCs1rzDUC2XxVonrYzJO4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfXz8mjVGe/61PC
 CJ8lx8DlXUqt7Yxxox/imZbKwu0oPRZcmIRK7LKSCGsgH0bm8RnKNrQszUin0eUItZ2kiahTmw+
 GKpy1iNERXkjr7sery/MysT4J8tisQsOnlMkgLVijHLNqrpD4MwaTMCMx9JJZ/Mc6p6AQFGffVB
 OzXVg6/b9JARRJKQ/9WNoPaW/Hxlu+AjMYKaO6Tm9QfjBJh2vy1qxR/NP+BIzJQ1TfxH6B2eC2y
 Mz8vZCLwLkCZ07IuP568Li8IeuK+NuGV6fK40kka2f8EQHYxVY1ZA/2t9ScFUHxydkQNthyJvYo
 W37cFPGVpqYSSQxYUVOlVMeLDaiOO7jue3unOUoKfmMga6p+x4VTDILUkQmrNmxbZvsW9nZHdhn
 ZPRANF1+1EYM8QNsa/YbcS9bgcwKuDFDkgskMb8Z8rghvvwWBP6PYEr7IzlbhVsA7luIaxCIq/O
 yGBnViPtcI1Ikt1KzOg==
X-Proofpoint-GUID: FE4CsSaXUXGbFUWOMffqf6Z6pmTmLh-p
X-Proofpoint-ORIG-GUID: FE4CsSaXUXGbFUWOMffqf6Z6pmTmLh-p
X-Authority-Analysis: v=2.4 cv=FryQbGrq c=1 sm=1 tr=0 ts=6ac350ce cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=InTVoh-5CTnzAY78DgIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050028

Add device node for the DisplayPort controller, its OPP table, clocks
and power domain, and connect it to the DPU and USB/DP QMP PHY.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 87 ++++++++++++++++++++++++++++++++-
 1 file changed, 85 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..155c590c8eb6 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3565,6 +3565,7 @@ usb_dp_qmpphy: phy@88e8000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
+			mode-switch;
 			orientation-switch;
 
 			status = "disabled";
@@ -3592,6 +3593,7 @@ port@2 {
 					reg = <2>;
 
 					usb_dp_qmpphy_dp_in: endpoint {
+						remote-endpoint = <&mdss_dp0_out>;
 					};
 				};
 			};
@@ -3699,6 +3701,7 @@ port@2 {
 						reg = <2>;
 
 						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss_dp0_in>;
 						};
 					};
 				};
@@ -3851,6 +3854,86 @@ mdss_dsi0_phy: phy@9ac1000 {
 
 				status = "disabled";
 			};
+
+			mdss_dp0: displayport-controller@9ad2000 {
+				compatible = "qcom,kaanapali-dp";
+				reg = <0x0 0x09ad2000 0x0 0x10c>,
+				      <0x0 0x09ad2200 0x0 0xc8>,
+				      <0x0 0x09ad3000 0x0 0x78>,
+				      <0x0 0x09ad4000 0x0 0xa0>;
+
+				interrupts-extended = <&mdss 12>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
+				assigned-clock-parents =
+					<&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+					<&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+				operating-points-v2 = <&dp_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MX>;
+
+				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				dp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-540000000 {
+						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dp0_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp0_out: endpoint {
+							data-lanes = <0 1 2 3>;
+							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
+						};
+					};
+				};
+			};
 		};
 
 		dispcc: clock-controller@9ba2000 {
@@ -3860,8 +3943,8 @@ dispcc: clock-controller@9ba2000 {
 				 <&bi_tcxo_ao_div2>,
 				 <&gcc GCC_DISP_AHB_CLK>,
 				 <&sleep_clk>,
-				 <0>,
-				 <0>,
+				 <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+				 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 				 <0>,
 				 <0>,
 				 <0>,

-- 
2.34.1

