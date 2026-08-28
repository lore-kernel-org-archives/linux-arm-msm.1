Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B9044AB9B
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920711; cv=none; b=eDJmNBOoaLJQ1QkTpA2fRuK9p8TGwSYSgGoKLvWCNOGXgW6wY/VgezvOdPZwhUWCmof2Q7JYp7O+l52mJBJfqZR83/XROrNucc3gP6FCW3wIYQ+2PkOG+0xHXWE42zGz4OE/p/zdIIMGqJ/pa3Kqg+w/N02jTgtinHoXKKJG4hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920711; c=relaxed/simple;
	bh=s/F6weqE5TDS0bCI66u8Ra/UckyVI8mTvNgVjljS0rE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mdyQcpsyMsvFZXfVN3vvdWL+rRTvvIWvAB026/F/reU8XA/tgHmeIYIjyMTjiAEo+p1RBw5cog4azaMfZ/qJfUfLqgwp+ZgshsIA/tOn1utzsudYjTDrnbVMfANC5TB88deyILL7UbR3m3Sq1kBnUA680Z52MpEIoRGHdNOEgmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BDD803SQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AE1zDXsm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BDD803SQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AE1zDXsm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA8WQF2492211
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	19v6l48ZL8hoRfSTOCR/57gqkPFSq2/0Kf5+vZTktIQ=; b=BDD803SQU0o2Nxdi
	KsrE64ye1qonDNQP2B2S3KNVWBfdKG4eTLdzRsis8aM1WlGGIwFQ2ZOUpJAHAPFA
	yA7PZR6u2pYeqA6iXLOuomIihtsR1PpQaa2vcFY+dAcqChzw3mLadDM13WYFBegF
	rpQWph4SGCmINn+vqdRZfunb5ZoxDEH7ZjfCyZ8b8ypsEdxh7O2HEUv87zuhEhPq
	PSyN99WgGolQxbGxgd7rvnvr744YBb2QWrj7tsvkVdp8jncTwIplTPnfBuD8ac2x
	aSNQtRPgzU58dXCN+La5hVQJUVutoPIrELqWl3HnScN/5uSDu7C5RkZYZbPowVeZ
	Zfnb4A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3hs1tvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:38:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52f64c48bf2so20151801cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 05:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787920687; x=1788525487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=19v6l48ZL8hoRfSTOCR/57gqkPFSq2/0Kf5+vZTktIQ=;
        b=AE1zDXsmBpz60d7dz463so9i99v6dGAaBWYQgqvrwFZo/M0LcQFBMnmZfha75128fh
         rqtO8aFzzKNm+FWroYoDr+5ie70uiutKUYx81zcRc4eBIHyICHvaF+VAzUTxgap31bfx
         U2koq0aVky55jsBIiVBWAghT7WC6vP4Kln1d/YUWZiJvQt5RNdxxg/UnW9BYj+9Q06/j
         ZYhKc/LuKpVbyHDvudyTN4IR9otz4yWKZvaePr6z2NWAWlUxcE7guMOH5RTCw58piDHu
         9Q11zq76VsKkjRH+AQN5filS8QCRJk4NvEn/0ayj5TjrRevV9/VdMK5iMjRbGZJp6KYR
         Ixnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787920687; x=1788525487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=19v6l48ZL8hoRfSTOCR/57gqkPFSq2/0Kf5+vZTktIQ=;
        b=dUz32694RdrToOdg9VzdOyvOSmnbw7n7UWDmEOyOnZiz62mKL8QLtzJOFXQL2QwdTA
         kNrA12ZGMwd6O4RSbnXSFyzeNrUD4Mbp70B+vcFwcsG/oOeiVvo0kd+0+B+IOYFyu82H
         dEAD5jgcidJPGJr6OSTX4dTZXb2HV2mVPINdpQ1wpDtoWCCSILkL2STfQMLBxJZGQmlE
         pxT2fjA9RevdLC460Ru3Sul/EmPw8mqAhTazkLzsOAf3eZ5Q8SGXV552iovoG7NISquM
         7p4yL0pymNoFn/FKulEWX4hRWDR0KuhAXXXA2lHoeziMT9I8KqlyQV1A3teP+3D3RzoY
         MxHA==
X-Forwarded-Encrypted: i=1; AHgh+RrmoSNi5SL+VXrrwxswJVbm5JufbMjJhgvZ5OnWdgMzz5SIu4lMUGOigVvNZzm7Si3z9E3EWxNqndl+9gdb@vger.kernel.org
X-Gm-Message-State: AFuF++n+2SiERJLULp0azxBM/BcLxeJa0jUNy7EMTtdVzxT2Wm2pTH+x
	ZzArI/WNe2oSbIr6cY1L+Nu3UV3dB+XxHZ/1Fx9Ku8v1w8mJYFuu3dnUotsMpt0iED/HVN2H9wl
	YgH7GgcRIMRNvKQ/U8u52K3cR9X06w/Y8j8w1Q9o28WIHsuSmryNfjDpkEiQEUeYU5Y5e
X-Gm-Gg: AR+sD10Ft0eQY81eLGCUu/scdO7QsQS988bkJR9c6oWAck83/xwl9znCcYsbeoaIx3n
	KjL98mziWZmnJHFsW9nY9eavZzB7J+TPNitrmITKnCZuJDd4NB5Nh/7Wn8l8lhdnngZ9zhkLJOO
	cbYsKyS+PNSGyBLggAtyGfgNuCUYbbfTFmeMF/gMS3hbSlRmARPPnRi7CR0pl87bQVM6OiMt9Vw
	FQmp0pvql27HjnlTCPyVIAAUDO2pre4mwTkCY+gur4Jb9fYCJA6C6wWFHtZv98RgUk/1imOyhLm
	RLMWqvZDruZeC/j07w9RKKmOqFHj5k1gGmwMoLftXnrFtasv5QhXtlQ118y1oQhl/rhs8Cphk6A
	12tCIODg=
X-Received: by 2002:ac8:7f15:0:b0:52d:92c1:b7b2 with SMTP id d75a77b69052e-52fb9373f7amr75322571cf.2.1787920687269;
        Fri, 28 Aug 2026 05:38:07 -0700 (PDT)
X-Received: by 2002:ac8:7f15:0:b0:52d:92c1:b7b2 with SMTP id d75a77b69052e-52fb9373f7amr75321791cf.2.1787920686699;
        Fri, 28 Aug 2026 05:38:06 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92671c0esm39338965e9.2.2026.08.28.05.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:38:05 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:37:28 +0300
Subject: [PATCH 09/11] arm64: dts: qcom: kodiak: Disable Inline Crypto
 Engine by default
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-b4-dts-qcom-disable-ice-by-default-v1-9-1d6e0c2f5a69@oss.qualcomm.com>
References: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
In-Reply-To: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=7241;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=s/F6weqE5TDS0bCI66u8Ra/UckyVI8mTvNgVjljS0rE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqkYESXJPdBMr1Reg5wXdethgNiLz2o9GJfRxXO
 hn/scZRgUOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapGBEgAKCRAbX0TJAJUV
 VgDbD/0Q/PtoBCqYvL24q2JIG3LyyPgGerMt/F6rfzPrywL1vxj647AQVbbXsiFvKkDDY1o2Wjl
 fiOeHMiLs/9jHZxgmwsoNF9n7W/Nxf6CqtuNKG7JnKLX/cvVUfoOpyJX8LbGtsgtZQzfAA7R1JQ
 d8WBAWO+yA34+2J95u+pLbSQRwZdY8XVDYuGHGROcdJRZCuzZefo1oRjb/gf0851Nl8XDfc0j0d
 AdBvLUNSt7a/xfvnJvkt9HAXHkPzHiGroTwMa3tU4Z3O2nrnP09fRtP3l3/sQvXbpdkTpbpnywg
 xUTFrqwKlwWFucO46oAx1p13muJw3ps0VSV6MRKNo+Ja18bcumWVf7LPJzBaNm1IoV8VCqfaPMQ
 aCxr1yHDo7PzxFX6lCdAz+QojTZVPrnr7EVi2PZcijgt4JT1Sie8lQitAJGUB88O0RTloWXTB9h
 NqRFzfpq18MX549qpuY5rnunee+PGbu9J6ICe+GQkZ9gXXGgahqKwSTUNLSQ3Xluj+NLyIneL36
 PchOz9oHHSwXwcRbeg6j2T8T3obq4vkCr/Gm/LGrd/rrGcu0SP/A4PY53WTaqq29OuWvtnQfxs1
 xGNDcgvcTaExnQ3Jgba3lxr2bx5uMVKDKhxIroiVP01CPhh1jrBYW/M68kff3ubK0A6YR2bEsyN
 WFW4u0D1hQSv4Dg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=XKYAjwhE c=1 sm=1 tr=0 ts=6a918130 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=-hKjo_9CLEb_madm_L8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX3xdngAI/ABTp
 blaOZeJuZdo3BYE488dpYLsy1qahoSnYzKtTv+m7JLFYFhvLDRSDWfO4NMwenLcRUmlL/+c5eoj
 qjCIvKO0xoN6KUWI3QjQltCR/N7i6oAfoHUgyTtFry6xDF/Gw2I+2oax+Rg4gFJ8CUQpO8JOB3a
 Mri7gV01ebid5ali32nY386n8BNRa972Dm0xXVng0G+MuJBjg9GRntekkhP1zcZ5STE5D1jeCB4
 bpsDIB0pyVwMlYauiUnD0gARYLYzg24bGA40KZDYjciXZeleJBmwbLk9fdlYXAGwlQ9rf398rIF
 QKSwrJGi1O0ndF9J6zYGJoq7QHPNhVulR4xS6qXPj/PkRr4suW9NhaM3af0f/Or3LY/1Xc6iw4h
 8Gu4RbQpj8pWolPogd1ZTi43AI376PgzPBmhPaP3TbzNlTd21/tJ/gVyJXOr3wyKcDnDKUqRxsl
 anVrzyo1isdEUvw2sNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX9URMil6fZueN
 noIXas0SybQWuhEcjTAL2klqJmQxT8sJPq+BdJTkIOLcq/Ub0Ee7oVHCJFVa/UxpoWq9zB1+D5A
 oszTEl71cuJpJ+J3ts0cmyUSzm7du3s=
X-Proofpoint-GUID: RNgzGGCSakvY-leFVxEtxeOOYCMmCZtK
X-Proofpoint-ORIG-GUID: RNgzGGCSakvY-leFVxEtxeOOYCMmCZtK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280109

Since UFS_PHY_GDSC is attached to the Inline Crypto Engine and the driver
does not currently enable runtime PM, the GDSC remains enabled while the
device is idle, even on boards where there are no consumers.

So disable the Inline Crypto Engine by default in the SoC DTSI and enable
it only in board DTS files that use it.

Fixes: cca53c338ad8 ("arm64: dts: qcom: kodiak: Add power-domain and iface clk for ice node")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi                          | 2 ++
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts            | 4 ++++
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts                      | 4 ++++
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts         | 4 ++++
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts              | 4 ++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts                  | 4 ++++
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts | 4 ++++
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     | 4 ++++
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi                      | 4 ++++
 arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi    | 4 ++++
 arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts            | 4 ++++
 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts          | 4 ++++
 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts             | 4 ++++
 13 files changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index f2da3706d5c8..ffbf037b3838 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -2586,6 +2586,8 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+
+			status = "disabled";
 		};
 
 		cryptobam: dma-controller@1dc4000 {
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index f41ad446a39e..b2e0cb0b3f71 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -937,6 +937,10 @@ &i2c9 {
 	/* VL53L3 ToF @ 29 */
 };
 
+&ice {
+	status = "okay";
+};
+
 &ipa {
 	firmware-name = "qcom/qcm6490/fairphone5/ipa_fws.mbn";
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 58cce89a0c1c..079254928e57 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -619,6 +619,10 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcm6490/a660_zap.mbn";
 };
 
+&ice {
+	status = "okay";
+};
+
 &lpass_rx_macro {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
index 5bb33a8a9830..f3f0ef54eeb8 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
@@ -499,6 +499,10 @@ &i2c1 {
 	status = "okay";
 };
 
+&ice {
+	status = "okay";
+};
+
 &ipa {
 	firmware-name = "qcom/qcm6490/particle/tachyon/ipa_fws.mbn";
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index cf74b3664cf5..e97e94572beb 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -552,6 +552,10 @@ &i2c13 {
 	/* focaltech FT3658U @ 38 */
 };
 
+&ice {
+	status = "okay";
+};
+
 &ipa {
 	firmware-name = "qcom/qcm6490/SHIFT/otter/ipa_fws.mbn";
 
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index a13315bf0fb0..dd83c424273e 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -789,6 +789,10 @@ redriver_usb_con_sbu: endpoint {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &lpass_va_macro {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index 31bafa2cf51d..394d1aff854a 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -653,6 +653,10 @@ redriver_usb_con_sbu: endpoint {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &ipa {
 	/delete-property/ memory-region;
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index 13e8e62f6205..7a1c8d868ddb 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -774,6 +774,10 @@ lt9611_out: endpoint {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &ipa {
 	/delete-property/ memory-region;
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index 96a7327f00a8..1bf3de6a4228 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -373,6 +373,10 @@ &gpi_dma1 {
 	status = "okay";
 };
 
+&ice {
+	status = "okay";
+};
+
 &lpass_cpu {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
index 3860ab8508a0..bc183bd94da0 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
@@ -723,6 +723,10 @@ fsa4480_sbu_mux: endpoint {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &ipa {
 	firmware-name = "qcom/sm7325/motorola/dubai/yupik_ipa_fws.mbn";
 	memory-region = <&ipa_fw_mem>;
diff --git a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
index d94571c05a59..51ec276d252e 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
@@ -725,6 +725,10 @@ fsa4480_sbu_mux: endpoint {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &ipa {
 	firmware-name = "qcom/sm7325/motorola/dubai/yupik_ipa_fws.mbn";
 
diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
index 7db9ae1c3cef..f96e8d7241ec 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
@@ -970,6 +970,10 @@ nfc@28 {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &ipa {
 	firmware-name = "qcom/sm7325/nothing/spacewar/ipa_fws.mbn";
 
diff --git a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
index 87f267aaeec0..19940fa627f1 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
@@ -638,6 +638,10 @@ fsa4480_sbu_mux: endpoint {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &ipa {
 	firmware-name = "qcom/sm7325/xiaomi/taoyao/ipa_fws.mbn";
 

-- 
2.54.0

