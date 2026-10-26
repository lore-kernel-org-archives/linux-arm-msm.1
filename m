Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014265;
	b=ow5Hrm+LcfLnxUl6D4C2XhT6d05f8Y8o9/YvKg+zxDXLCgmYqsiVYwQ6XLvl5J9NWtbf
	 Qe0bXwbgJELf5Lg4An6pZOSzD8nUCw9/5qCj+0xR0VtovoEWA7BSY905PF6itcJ8vqj6O
	 0/LxWZgVmnXoU2vYEZZ5MokdBGzSG6VXej64mHoyDMgMNdd9d/rjQ96q8dQmJiiuU5TCz
	 Ey52czyh8jE1hMRMjRr9wMVFNArP8mvPPM6KFW/V6Qt54PlsEysF/HMSpeflkmDRrxs3I
	 paD5Jah8/jnLbAbRtfV0mwhMRgjg/Ydus2nxuQe36ajL3b6sBqy9wINJncoFFkl5C0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014265;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1u7BOZ4HXoiDpqQfE+eys0BaXB4J5QVKelBVG2AU3rk=;
	b=yDJAMu3lE9TWcRIJgvly7njAOjAFnbUvMt7IRzyjX7SkRVOsIBuelR2GViN7Ll/i2ncS
	 VQV6MyuiQGGT9jNbgAqDUgIzvSp0bpXHmhFkpCkFIjb+ydC/AzIg9HY5ft40eE7TmhA1X
	 R1q+NoR6SUB60kVeXd76kxrrI0nwap1sE76WKcTRFJFo5HTnY1bMDwYr8vJ9knIn7lVcW
	 SYt5BQNBm59yoyPP90emRtMrNPjzUMeSjUAuLMWdy7oPKh8d6Aw1nJQDHZ4RpAlYQMyU6
	 xv7ZHZaolD/mg/Sa/NPhp7ZQOXdwFV1Gitzq1fbejeoz0k53CDt1C3c+6gQzGCsUEiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HtLNkUTM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e2o3+m+K;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C784B606A327
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C784B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HtLNkUTM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e2o3+m+K
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtIju3085581
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1u7BOZ4HXoiDpqQfE+eys0BaXB4J5QVKelBVG2AU3rk=; b=HtLNkUTMolx1qtB1
	TW5/7L69PCVG1AC8+nEv8EkukyHyRQJNQb40yUZKsJ5EDYqw72mO+fOSfRLbv0Ac
	zntv23IX5ptpf/UNZH1u9Nv1zjveEE6vBRXzEYa3J8aGU16C12cN9HH7k0ouPM21
	9NrCuCcws56R8cAXOFnt4c0xEw0nflWVMIRPGcWFcplZQZR/k+uRt1S2wbtNLs+a
	zH4FARObvu24avwUyZePi9mVCBUszUwSl9CXTDH/ctx0VbZ05WQesT4mBkMeDa46
	LZF66kpm7M3t2hxvp7tZyMJ0jMihkIyxTitXK/g7z0Vcd4BtWdbr6YP2ZIi773M4
	Cfi8hg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3p4ku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:31:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so766551a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 04:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014263; x=1793619063; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1u7BOZ4HXoiDpqQfE+eys0BaXB4J5QVKelBVG2AU3rk=;
        b=e2o3+m+KipyRkTqtdXlramFCzv8r8fxjwX+pyT5R06B4lEgJkSYV6/S+tmIwm3h8Vl
         swjzELFX2X+eFS2irzOdIrNiMfSbB5zT4D006UULbfbkDpUPf0AQ03MLe5IVrByBtRd+
         WctOZaq2xilOuegxSsMPZtuwo7s+QiulxYY1WbCsCaFuFG98RK+3YhMKldBF8ZMTmPMI
         Cn3Y4dwZlFvWb4uQTyw6yxTiAFoS1EyYTpUpKLiJDf/xpjY2yHvJNr9wpVWF8YwayQGD
         q3y95QRGb8DUvhOnM1DfONg0g4iGhHnTKLErYCzqnxLuZF1WapZe6qT7BqEPtZuh0pBR
         v2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014263; x=1793619063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1u7BOZ4HXoiDpqQfE+eys0BaXB4J5QVKelBVG2AU3rk=;
        b=u6Ns5aRUK0c74c9w9bjFsEEmvVgpe8/vRqoEaYFLVLbXNgxKsPLy7eEIAK92tPWIY5
         6CASdfsNJV4GzOW7+trzNEqWcprQI6NSVgYtxUid94oFmLusg8v5rIk0kSVjUhrO+0N6
         PY3Pn+N6Vnnn8e2XZV4+EkD8oNr2UpT9s4yqDOvcscp+/ykpZhW3TJAjV2s3I889/Vgc
         tXxaSI+mLqfT2IsF5esgAo1necUlO511Z+boKFxnh5shEW7b+QcLzgDw88Ms8lYcTERs
         tdGxU3goGaFRUcL7b0pUfYojTwSWRwVbn+88xcyEjnNgRNoy3hnWJTdscqlIlqkAzjZz
         eKBw==
X-Forwarded-Encrypted: i=1; AKwUvBzfXKWJ7kjvlZo19RPeQfyPJbQM4TiDHnNlatCQRzR2z+PM/bJFZcrvri7H9+Ydud2I3BpKSpsugg6SVFG4@vger.kernel.org
X-Gm-Message-State: AFq9FYI0wroaTf76g+NND3zK7f5TmptG4rgiyfr1KtTEUhD6nzTngf8Z
	kZp2l4fdQXzzmtfQNv3UeSLyoGZi5QQRMRMW85h5vM/bYj8nBZOEpWFWOcBfW1C1HqINmXqGgK/
	FV/t0WV7566zNlgSgKiuND/nq8lk6m0sYPY8rKlaa4XasQCAOsYWShi4qVBONInmaQEAL
X-Gm-Gg: AYBFou2S70HuNxKJ2wV54TJmeP73yZnKzAllEEHwQnpDxg8Tjmk6YCAWBZS1Yxu6iZ5
	sngJdwqJiMdBCNUSUBjYbGflCpN6auISVAYkiSFRzP1mSEQWz7yzyFaUAnlp2ULvMNHvATmw2li
	rDDRHLnJVQyfpStbadkk7YObTGRR0xBs7xh02doB1+86CRmDDzTxCngie1hs60+sWLOqYHH49NA
	sRGXPaE4fISNtbtgrCWfbSFoNaP6GR6GR4zI/5WtStum0n8KxxAajNmSV5VCPk88ALxUAVMRTlI
	NzVrGJ3TAD5S48+4uLjxCOHowSRoLg5VocH5gv4xSBkNzDb56OD0PuOkTfeksDgXdsqRZtru+pq
	dCL7XcEX0byKVsZmAaSDySKg=
X-Received: by 2002:a17:90b:4a49:b0:3ac:9d83:8861 with SMTP id 98e67ed59e1d1-3adeb0f8d94mr5582117a91.67.1793014263391;
        Mon, 26 Oct 2026 04:31:03 -0700 (PDT)
X-Received: by 2002:a17:90b:4a49:b0:3ac:9d83:8861 with SMTP id 98e67ed59e1d1-3adeb0f8d94mr5582076a91.67.1793014262860;
        Mon, 26 Oct 2026 04:31:02 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:31:01 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:36 +0530
Subject: [PATCH v2 10/12] arm64: dts: qcom: sa8775p: Add GP M/N clock
 controller
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-10-ff8e4bc8d567@oss.qualcomm.com>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: 8290gAnEG18UadAn-fNvjonEuUtQfGNv
X-Proofpoint-ORIG-GUID: 8290gAnEG18UadAn-fNvjonEuUtQfGNv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX4BCPiSjw8VZj
 577CTvkypcVWDeVdHv/ik0nd8URsZPGnF66v6z42FIxqPLAFSqCa5raDzfmebsKORx0sdDLdgbZ
 lL7yMAJekSIK8w4DHLJtLcshLmeLgfk=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adf39f8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=RQSmaMWm8AJIs-iJKlYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfXynoD5xAy1Ydq
 D1Ek9yRinoxuzYi/oDU1IMsM9wkEdWNkUsj4g0J3yckWkV8afTpNv6EUZXMOC0wlfiMxWJD3suH
 pajlLuBBICBneEEJF0UBBc1w58+Voc3meR/KjzJIpjbZCVDLXz7XQg1sErOww4eYxXaL/aPQ/l8
 6m3VcLpdPlOdXVDldSNuYNosCJWqYr8FEDobIUuP7S3yOEfeCirN+crnFDlmrQksHJ9MIjQoD6C
 9V77dDeklB5ErLQy4BFMzwndjUB5zD68jPeNYUUF1LupkYrIDsQGw16CsWFfaKHfiU/5JhdPTMj
 O7GpJvmXCvSdtNvVIZlGwVh+k5RRpJPVByIjBXLax+tu94KTe+r81nzIPcRJ5FQNh9c1373actu
 DLhMr34bYg9X1L+BcypsIO2v3KLWJIwh6OiZ3V+SWJTuj/kxqIC+0AuenUCMtUPAUlhBMIAFdsf
 /KQJnc1EeThvKSYGl4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045

Add the GP M/N clock controller and its pin configuration for SA8775P.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio35.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518446ba2ea582e8362e86bba75c379..4132d288e3a16ab0a6d8b6d0816e85671bd25c73 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4348,6 +4348,20 @@ opp-384000000 {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,sa8775p-gp-mnd", "qcom,sc7280-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0x1000>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm_clk", "ahb_clk";
+			#clock-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&gp_mn_active>;
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <4800000>;
+			status = "disabled";
+		};
+
 		usb_0_hsphy: phy@88e4000 {
 			compatible = "qcom,sa8775p-usb-hs-phy",
 				     "qcom,usb-snps-hs-5nm-phy";
@@ -6017,6 +6031,13 @@ dp1_hot_plug_det: dp1-hot-plug-det-state {
 				bias-disable;
 			};
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio35";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			hs0_mi2s_active: hs0-mi2s-active-state {
 				pins = "gpio114", "gpio115", "gpio116", "gpio117";
 				function = "hs0_mi2s";

-- 
2.34.1

