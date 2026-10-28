Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190341;
	b=PhBAxEFNe2MvSZ5OqWIMKkB0tAEr+9CfIVAEFY8xkl3kO2dnDeKf0YjtmGzh/8q58awD
	 msum//yCgOeeB4oTSry7tqLoTe2DW9eWJzWNJ1V7dt0yWJRgoILdJqHezGTqtWmn5SKk9
	 8KkPriY6PaBLVAjqeAdSVjMLUfykzuqp9fiO6jUnLvQrMdTZu0iOdpUP2wLxKiSHNzvaz
	 jzkPvuZVyQlJYFPuXaStg/HGKeH/JUqGp9IfpPWGzgYT5SPZLBXHwnp9UnyJOuqhhltmm
	 VeIgZ81TpL+rbbyk1bUq/NfHrG65KQChJmQJAGJQfHlF5um+hfVngcxnbOBfijxkUGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190341;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IE7TTEPp+mYjYOJnw2S5JdN9e/VGEB2SwjVCAm8BKAQ=;
	b=QGbCERSnKU9AVQnjP6VB7GptW332/IXEiWT5fV4ftg/sHYMsQJTDE38miqHUu3OALVaF
	 ElNyl9mtSZQsW7N1ARiEGqIDX7VYv91Cxfp1i1r3bRYrCrUg/9JONIPDySmn5CMS7szXb
	 w2BwsJnh9khSyRCba2rSsvrBvo+TOEqYzg6mnE/Zr3ILh6DBDfcvJLWxb1nVkL5l+vy0H
	 L9B+1n4buLtwpJ9DeAhN86DKsptuWDk+ZFXRelW0afXdPH/8xUzXK7iLnM7hfEdSAObGM
	 pcW9BODPAXCQujvyByamdo/XnXYTi9t6DoAYE2QV4ddxJ56oUq3q7cmMIo/TFM9lz6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iz2BlZf8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Nf/hSzlt";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7D2606A323
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B7D2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iz2BlZf8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nf/hSzlt
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe5xg1539006
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IE7TTEPp+mYjYOJnw2S5JdN9e/VGEB2SwjVCAm8BKAQ=; b=iz2BlZf8W0+7zF8k
	YVFXLVXVXs+KbPcx0z96X3Maa38IR0tPPEcphuCMRQrxA10L5Bk34Qh93o+5c4jl
	mr23IQ64YsoKgth3gFJx+bSx8yinUqjz8luZA6HdsyUf0w8F9ZHeX7CSsOHCiFio
	M22diJ5ZGF7LY/bFN6Q0LI7CFFGKBKZEwGWUhf8AvAWiXgvlbmaFhsszv3CYY4Gc
	ThsqEllfEy4/sahrUG4DW2LqLyntN9F1c0xXf1pJuznNqpajbbhmVRnD2kgQdi3G
	Fwz2bCRFTQ/4dyqs61p4GZzzIFVdukKdCiAHfD5hLvu+o7JjsH0XSAfHRJ5qFI2c
	18ZUXw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7rux2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:25:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae59682799so628804a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 05:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793190339; x=1793795139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IE7TTEPp+mYjYOJnw2S5JdN9e/VGEB2SwjVCAm8BKAQ=;
        b=Nf/hSzltr/D096JckAgK9AnQWNJlMZlit8CT1R00sXsqWBUBpPgMXNda011xN1vgxH
         Az1jxPafMtlJyIupEpGK3EqPXmyWk/kQD9gcVwW7XYGDp1NUmJfpWdTXevdpb23P9svY
         iMXVdVv9/ws0PGv3gm8Hqwv3R3Iiu5SmsP8mLlJc82mcFDIYEonHfnKmPent3rdIapb4
         VQ+8g4qHxZv77jNygy3AW8B4kX1J8Qk3F6nL7n9/YG+rCa0HABhveG8TLIq43eF9O2wF
         iDJLfEuKwrnyhtfoqGl/TrhTjmMt7Rq9NBBj2q8zKZoBpXIhKwOmlvuhTr/2oSF2PlMz
         DnUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190339; x=1793795139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IE7TTEPp+mYjYOJnw2S5JdN9e/VGEB2SwjVCAm8BKAQ=;
        b=NA5esEmJ98icqv3FkL8+ZE7YDI+6FmJDP+sV3Tkuy/uZlmxPv9SgTltZgvt8FnI037
         SCE4XT5xoBdPM0p8VhW6HAhvas02ZZryy5p8mg2osu+0UQQbIm1apdm60Rzcan96wUbt
         RTtJW8OlfKe31JTNf+8TSdoowGdd+Whqm40wgflVCU21TOxH0k/yj94MV5HeGzmfaRfF
         wScUmrnCSaf8p+akBEx4b9IRtDAL9aXtyJCm4iMFcByq0oxq2XdI9GYrGUSyo8/QSYS3
         zqX/BhC1W3hGv/FWLo5IXvuuNLCNgrONFM7hsahQuQHGn1/k9VtI+iKVYnTCKTbvAkQ8
         bG8w==
X-Gm-Message-State: AFq9FYL+WzO4MLLdOfw4HR3flVgXFF1+LQHpKXdWMbTmtiFojitur2XZ
	I4I6f2Q4umer9Z++EDDnjhep8PohEgo+OocUeAxJ5QApQMvYP8f7HtAGqOehwIpTdjZxXtxXL9r
	6bqZtRfUoYEhG0Uz70xLx//s3bSoTc5ZvS0sGkFRyl46fJ95Brs2lcd/xilwZEEmmrMV7
X-Gm-Gg: AYBFou3/XYF9JhSPxNVauj5bk0dwhrB4dbtnwxCybOCkfg44WT0oPWC3cqMBVocwbv6
	iVjvKRosohPqv8goSS19csz684aNIbaF1Rr383G4ViK8TblW2HoE8ODDGLMOzVZOvtz0+4QVGeH
	nP42jdDcgixyVs7FxItUvRNCcKnK3hra+ZQr+HMrjK33OTQSvqoDhQhqW3cEOvfXuQ4rjRvvMuU
	YfaME/1RdOvT3p/rGGcep68b+pJFGeyI6R29tKiWigfUggr1mfCAj2FSUYLCZ9f4/RPMEps0ziI
	u2L2L04F3Exhhl+PqrkIOckDSC+ivZS9y9U/h+OoGB11sFiOMGIoolGpHIGXPwNGKYqFVfoPyDK
	apbBr1chQP8Aii9qEruirxtz6mcdO08G9xwcVFQOTyQrrYjNQTUyJXA4gFj/itL4nU4y0SUL3Uv
	g=
X-Received: by 2002:a17:90b:1f8b:b0:3ac:80dc:f40c with SMTP id 98e67ed59e1d1-3ae57f9afe3mr1579966a91.14.1793190338366;
        Wed, 28 Oct 2026 05:25:38 -0700 (PDT)
X-Received: by 2002:a17:90b:1f8b:b0:3ac:80dc:f40c with SMTP id 98e67ed59e1d1-3ae57f9afe3mr1579906a91.14.1793190336827;
        Wed, 28 Oct 2026 05:25:36 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9f287fsm2995819a91.16.2026.10.28.05.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:25:35 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 17:54:47 +0530
Subject: [PATCH v5 2/3] arm64: dts: qcom: glymur-qcb: Enable UFS
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
Message-Id: <20261028-glymur_ufs_qcb_enablement-v5-2-09cda5e3bab3@oss.qualcomm.com>
References: <20261028-glymur_ufs_qcb_enablement-v5-0-09cda5e3bab3@oss.qualcomm.com>
In-Reply-To: <20261028-glymur_ufs_qcb_enablement-v5-0-09cda5e3bab3@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793190309; l=1034;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=qZOq97SsVPti3oQZnFWkZh3c728gDdolT+V4/jasJQk=;
 b=32awDFy7e9HmWnP/20AX4LOq2FVNW52SoyFahYvtOVEkfvhPnZE7dbpNNlkhNLILqGfEZDoro
 gALGuqVM6y/C6OqU8Q6Ccqgwz3pNh/45gLJSlrhnP7l7B6Tg8Jb/iPS
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae1e9c3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=cMKPt8sKVRzp0kMMbBYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 96DyNyuCitDPytBtrM25YMyFtwrFk1TW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0OSBTYWx0ZWRfX7tJnyQI87u9z
 JwArRSnF5zTjhauzZYUR+vGbnj0P3nrlrfHJFquNj24OL0wkOFlvUtjTS6WJtBXCGHljCK5NYhV
 VNhhlUZ1XU2oyNxVWggMhEG5V2MtUUQ=
X-Proofpoint-ORIG-GUID: 96DyNyuCitDPytBtrM25YMyFtwrFk1TW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0OSBTYWx0ZWRfX0GaA8n47kCMs
 I0FYuCL1Too2xNF9ppjj20nNgLPFH6m2OxrRbLoLdlrbC/X0rAQyw52djTBpvVcxxjiQVzshCqi
 4SLEhQuWCCxhKnsjhF9VrR7MOKeAm/I9aCWYrsQVvn0NfkFvqbw/rwOjLBngrqu/US1b7ExH95r
 lRk2gmJy2jirAuYOb91SCIFnaBd/ZqTFh2aYFOiyuMCZnElJWwfoXr7U+KRl7IEtE0pps4G1a8h
 Ir8MHaDAvJRUczAqx0rxplDfSZRlwT7K0rjLCHSCuTLbsGHzvJixDuJf8w2c10klTby1pzVJo1/
 xOGdsIuO2s7YDHNEjHwUnsQQzaNv4bic1KekadL6LyqBhrVe1Js532EnPURXkv1c4eqLX02CKGt
 sUmgX1PR7pDwg2cUf5gYwSrOuWplQbyjsOTXUx/Zqlx0ZVd0A1cgp4b02h8gl2lkDAAJY41q+fV
 TrOs3N6ZM/Z4c+DFGeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280049

Enable UFS for glymur-qcb board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-qcb.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dts b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
index 17d8ff3aed23..f17181bfeadb 100644
--- a/arch/arm64/boot/dts/qcom/glymur-qcb.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
@@ -697,3 +697,21 @@ bluetooth {
 		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
 	};
 };
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 250 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_e0_2p4>;
+	vcc-max-microamp = <1200000>;
+	vccq-supply = <&vreg_l12b_e0_1p14>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
+	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};

-- 
2.34.1

