Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50C73FC5BD
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167257; cv=none; b=ku/DQNpglNLesZvocSPF4FxW9BzUpTc6ZjVm+yzXcVBevTAgi0h0SuvE6Y0GlBj9Rhfn3C0WMCi4jPmFQdzoKknezaAi8amj7ez+sJNmVaymnqTGkMqishi9tEX96z+RksM78mUf4PUWdT7rvvw6x+rwHU/bQ7y+o8d/VkRqXS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167257; c=relaxed/simple;
	bh=yMqnOQaDEEyw4WufS9r/vXZ36AgWvKFPth4a+uQU8BM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HaRtMcC21c7zafBl3dsbrnHhd2ZvhFaLy654S8Mvzy6J3KLhYGgRe2WjRrwDUxucjEDa0j2E07N2TCL663b/FI6xmjPfOz6FfAOt2acPEFX/DxIch9XXGonEUYH0Ze1tTlGjo8ULdOuWp1SeHrCDWUYPeNZfnrHXac3WnfosCFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J9ryUIsz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e8cYvecc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J9ryUIsz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e8cYvecc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDm9O23823628
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DJP0NMWNGjYscw1h5aBWGeorJPmZjcfRElvC614KmrI=; b=J9ryUIsz+9lBziPT
	gMQxIPU0LWpFNuKmdmY48fh6G7nkavc4cPDli1knc7SAqnDFSX3DirXNlI9SF6os
	avDLUrSgInuHSCuwxDGf9InPVHygDtLlic4T9oBm8Gf6PPGtMz98hqq8DMAN3Vrj
	vlLrXs41Twmr3K+7OUgT6dsEz45zrpzb0yOFk4jwZSCnCAJ0QyKLIZ9ggbCeKJyD
	+W+QWaL95MMjPvzbmhwWW8UnMf+xDr5jITGSoyUfLrJgJU+DHK/8E5vr5WBTm2Xl
	QDeql2pxNcjGueyhlQzwb9kTnsYJ4A6fagqHMbTDnP++fHfBP/kIHWNzGh1Te17A
	JTjQUg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4nbsk8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:47:35 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81aea53d559so49599887b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 08:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785167254; x=1785772054; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DJP0NMWNGjYscw1h5aBWGeorJPmZjcfRElvC614KmrI=;
        b=e8cYveccByvfV2aDWv92DJIbmuIBlujAEvam3dhZ/+kovDHTP7EPO7dicIipqrn3Jh
         QaKsVfY2B4wOmUiG/r4bNkc/MV83DpvlZARARvttgq9o14x2sXqOjJtxIfVUDQLdhSqG
         5NxJjkMpw/8kUVaT2dXDZ+AeLXmmSZC2xjQtU0eU3c07NA9r9+Cx1RxsYSA5inpzFQ1s
         ppfBvtN4gwG2AW3ydzUlxkakcFYAu20XT6//r4vI/+Z7rH+iC9WN6YlRB2O5b2bMUnoe
         qdSFfD2fAzRBh3ORw5+HumDVZ2cbOwoEiTCoIh0XBjWcxroEOQSXh3wPvD5FWsuVx/EL
         yBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785167254; x=1785772054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DJP0NMWNGjYscw1h5aBWGeorJPmZjcfRElvC614KmrI=;
        b=AmMj2F3sXj0+xpzPChotDQNjTjVZg/jWY+gOKADBiJib419jcyvllhhebITfjXqApF
         aA2/y26I7gqeLtPeVWDfvJUdBUpYXMdxYwlbaY0vJfFkrMKopH/I75NtB8w8IsTa4zqs
         9Oc+lwOe36FvSReEnig4Q/FjwnGL5l094sdoTsZPnlgyMg5BuLwbp6bKw3FpkNzsbsoC
         4Q6CRcNzee4UjjKYa/guZdwimX0V2spbw071V9B97QXxzG90mGxF++T50+VLhwpYXMHp
         NC8Meb5P47vaUSehGSeTp+RYnhwa1If9IT4GPiy+0VX3u+qRGL33tbqK2JNr/irvq+hc
         Vkfg==
X-Forwarded-Encrypted: i=1; AHgh+RrbI2JJrkxu3G46Gewj1C++07ICMrJqJZFhriKtSYHQLlpM4Jtmgf4i4qZSCGAwoskU1ZRKZWqxRbIdF6md@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp+o7yJtsdlRPJ0GPXRovqLCF7BudLKwxP3rk3/cX6/4FvpMNu
	W6Dn7vXXQpBGbe4bi6jPEp64Mu6BQQKTSaaPA6v5ekgt6D2h5DegvPCumSolMTGA5v4+T/7tQcM
	TKio0fMfoIbgFWgbFyd2UXa8wclngvZLXyXMq727/5cXUndXpPTpEt+TVoxG0T2hBzFtj
X-Gm-Gg: AR+sD13MkAGCuNXosziP+zMau6GfY9H3Rd1TJ3Ly+VSvj3Bi1fpnCVgGt/rlZyams5X
	l9f3T58gyL8ZTb2JjvL5g0Md098Bdp98HoKOTB/3Ap9x4hDBuUP+clTf+sEB3ejReqkMUrrTljY
	0+oNc8al51S6YT6tDCD5Qg+3TWO2YQix1Zcer3t+81+g/CWelzWPLTr7XJTe2yTtXrxfUu7/ssD
	YCvk7DrDMtpVnpK5KTEA1jBg8FwZku99+nlyDn2Vsjmr/0kRIAn+zyhXM3JEnZ9ckCSgh8/p521
	WGSev5uWYsr/iOa/T14jWRMoqqP9Ymnwf02Ugx1miRYvXyT6mMQWz+fRKpL0dzJdgOHiQtTN333
	dWXpOAIXF7CHdeR2kS4xBwZidy5FqDQ==
X-Received: by 2002:a05:690c:b9c:b0:81e:cc9f:3dfe with SMTP id 00721157ae682-81f93935c11mr489927b3.1.1785167254274;
        Mon, 27 Jul 2026 08:47:34 -0700 (PDT)
X-Received: by 2002:a05:690c:b9c:b0:81e:cc9f:3dfe with SMTP id 00721157ae682-81f93935c11mr489677b3.1.1785167253763;
        Mon, 27 Jul 2026 08:47:33 -0700 (PDT)
Received: from hu-samana-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f657c727asm33307617b3.19.2026.07.27.08.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:47:33 -0700 (PDT)
From: Rahul Samana <rahul.samana@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 21:15:04 +0530
Subject: [PATCH v2 4/6] arm64: dts: qcom: qcs6490-rb3gen2: label BT PMU and
 M.2 PCI node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-rb3-industrial-bt-uart-v2-4-2d100f30e202@oss.qualcomm.com>
References: <20260727-rb3-industrial-bt-uart-v2-0-2d100f30e202@oss.qualcomm.com>
In-Reply-To: <20260727-rb3-industrial-bt-uart-v2-0-2d100f30e202@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rahul Samana <rahul.samana@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, quic_anubhavg@quicinc.com
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: 0pfJwbvXnY5b6mfr-yVsvgsL3WO2_dj4
X-Authority-Analysis: v=2.4 cv=cJjQdFeN c=1 sm=1 tr=0 ts=6a677d97 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=5vclj9FtNX7zLWCMXg0A:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0OCBTYWx0ZWRfXy1OjTDWHiu21
 8Gwykhn/DG1VSCGHfU/mEI8wmDOAIF5BXztNddIoKlZl6SWpG6Yw9yis7fnc02Ze6wTPxv/5qhe
 KAlauJK8OQiCgF1tdX29ApWcZvMYAK4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0OCBTYWx0ZWRfXwO8V367DPXRN
 YBA9C6NhQxjgXw1KD8DEirUyspu9QfT20kANMk02qljncK1XsDcM076aLn+P/4uNdgjFC/sggTI
 rXP/7LYPBfOrPzt+TiIt34vz236AnW8HwN+5W43VWgifUr+QOzxcWWj4odajmGvjSJdFVdI4YvX
 q0tursNjVCOf7eF1HHqIY0/10sUcCl8aBKQEQa4PqxE9xfdN47wjx+VhC/A17qg469trWY6fQfH
 7ABrQjzTXQN3gBwXXkdDHgL2yQ+iLMu71typVqxXrD4js8Z31TWgvb0kz9pEiutj8idV2EVjfJ1
 izxDuIXE034Rx8z/NJ8SKLa7Fp4GduokL9MbFbG/zxEiIcnBG7oEF0/9BXV5KsAs9jQ64dtJKAi
 bM5ImY9oHvpQeo23ZGaO1I1NTJz9RI4MCDgpDsVbO6zydB4RDAbOA+AgOqFy6xlkQwgNZR52Qnv
 sNb4trBMqLfktG71YMQ==
X-Proofpoint-GUID: 0pfJwbvXnY5b6mfr-yVsvgsL3WO2_dj4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270148

The reworked RB3 Gen 2 Industrial BT UART overlay needs to disable the
on-board WCN6750 PMU and add a graph endpoint to the M.2 PCI node.

Label the exact WCN6750 PMU node and PCI child node connected to the M.2
E-key slot so the overlay can patch them directly instead of using a full
path or reconstructing the nested PCI hierarchy.

Signed-off-by: Rahul Samana <rahul.samana@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 37a3b51323ce..b2b6fd29880f 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -325,7 +325,7 @@ vdd_ntn_1p8: regulator-vdd-ntn-1p8 {
 		regulator-enable-ramp-delay = <10000>;
 	};
 
-	wcn6750-pmu {
+	wcn6750_pmu: wcn6750-pmu {
 		compatible = "qcom,wcn6750-pmu";
 		pinctrl-0 = <&bt_en>;
 		pinctrl-names = "default";
@@ -901,7 +901,7 @@ pcie1_switch0_dsp1: pcie@1,0 {
 			bus-range = <0x3 0xff>;
 		};
 
-		pcie@2,0 {
+		pcie0_m2_e: pcie@2,0 {
 			reg = <0x21000 0x0 0x0 0x0 0x0>;
 			#address-cells = <3>;
 			#size-cells = <2>;

-- 
2.34.1

