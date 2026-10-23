Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746157;
	b=VbXcNo9vmBAFC6AdaH51pnvd7n9TOvifYl+KhkaHJrOOEwysfS/QzjgpkdTpo2g3tY/A
	 E3d+K81NnuY7vEpbRXbaeCtc6VqQxEKe1QXS+7BJSOpg6ZukrSBvWUdDHlumLkIMFvg/O
	 y5Z97n1CqjL5F64FDOOtHpllxreZZwVpmRIFmIXLueIR+OJMLlpRt3CRouBXd81IaKx6J
	 hr5SV9gWV3P3dCR5PnbDlNBCzLefWgXXh/aAyp2BvSAsqDkZ5mAlL92j+x22w0qJLIJaK
	 oYFQ54Pnzrc0uZ4EC0gHY1QWhZd63egBhFYTKgVSDITcuWLr9SJorsQfCdA5nK9lzkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746157;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dhJsyioNXqoe/67sGFvekH2yPgEUsEgy1mmIhMnO1L0=;
	b=rcxzwzkcq68CUTftN8wQ+Bg8YuF928fXdWsVSIzLNXS0moI4K7jNr16ii5XkCS098NH1
	 oW5CmewomvRRzQ+fW19rG/lM7BcXyCXwL2gI2WLAASAiooM0ue1MxWyWy0MLQMZWpuuF+
	 sIpXS0qlhCWf7LLGNcqMgFF33P6SF9lf1djRY+r6nLsYjnY0A0mlVHZ7Df25G0DoT6G4s
	 bd3TS89fiWOshA6twqNKa64w6dfCrgtyZUnY95Pw8qinKRjYCWaWEgiqVZaJOwEOnRtIN
	 7Zuemu9mV6Vzjx7mWWiTV8wGa5gVZaJSzLYqy7hFtw515eyT8KHVfeIRoEx5W/cUX9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lXxyoDxD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SWe0kPAW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691C9606A334
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 691C9606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lXxyoDxD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SWe0kPAW
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FUqB588011
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:02:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dhJsyioNXqoe/67sGFvekH2yPgEUsEgy1mmIhMnO1L0=; b=lXxyoDxDUmbcHWnU
	TjRNRkvElUEMP1zVwDpiQijjXn2RYNXJEgasCCHqmUmQOHE+gtso11hj+1/PKofF
	C96sCe5BWD4i8wcOFg9nZ1zAHipMheh8QHeTH4bURTvMnDB5r+ojYogKQ74RThbT
	1sa2y+x4zp3ULIFtKYJS5NiT/MCoaIb6se2Ri4jw/HwDANuiVNNlHeEs2Z0U2oSg
	WHn74nd9vccdRRICyrRvoXmBH9yCKNZ926VIPGL82+rpVZWIvKE694URVLSJ1iQy
	KmpYajY4nlC1TeWhh/7eGNYb401NaefqjTCNR6zUFLT/3sOQ5fzKb00QGhy4ROJl
	W8wT6g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmatb45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:02:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5364605e74bso18029241cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 02:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792746156; x=1793350956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dhJsyioNXqoe/67sGFvekH2yPgEUsEgy1mmIhMnO1L0=;
        b=SWe0kPAWMyDYbafQCXeZUJxeSlKlVKzWDVruIDMnZ3hCwNj4+I7ISdOv0NcfGTuwbC
         oLG1DFNksTA1Om+sTwWq0As7gt1+6vNToz/UY9Io0nXmEfdYwtg7tX4ZEOf3kax1gVwM
         uvDymHLvzeO2q3AduB9ovLRhQZ0n7laITnBR2yCafw3rvrL+TBvslvPLgxFCd+1YfQzU
         hZYQ6/suWNwrt1Q3W5wNCE3zVR2/O0+FrYZikeVXkmKXfxOYRm+nkBiF7GCEUMshDteG
         IFSCv8Z1NtXEEHxIZ3a0HluovRNiC2eFLkAHJxDbxF4C0U67dP2NtxX3R0J65PHW9hOF
         NZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746156; x=1793350956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dhJsyioNXqoe/67sGFvekH2yPgEUsEgy1mmIhMnO1L0=;
        b=N4WqNy6sqxizB7MtulnoV3FmDw+7zxOBaXVg/pRwPuoLs9v5bWYfPx+uobhfBxrICP
         qE9hyUyzsjvQd9EZ0py/etbYbPftjxJ6tsZu9gHYssj++VfId9p52LZL+JxMuGHxn/Rg
         vcb71QwZM6tZk4E0R+F220ZhAgG3IACezOJAlrmC0ew3vk0D1gVCJ96+L1nKkiElr8oU
         q2uO29PgPutGz7rIIlt2DmSL058yVBnAnCs8Q5W+fNuhrHDHg7hzGSiqzLxpY59CYuk2
         ocS/GlWrCYtnAlc63wP6Tp7sjH5Yt/RyEaZYd5XvNStHWXBnBCBSBsV6bGU9io+ZMYR5
         AqOA==
X-Gm-Message-State: AFq9FYLC16sznJiTR+Aq/LYdjeD3ZEd6KbCCMbIUYq1T85hOJVCHDZNy
	GeiNfGoOM818+EFdCvqRepGDO0vVAZRJPuI5YHUzj9gphiQn6yUkMjS/+KoT30o78Mg0DG1Irl8
	Hw5tvqxC9onvIJH/sYJxRPFEtrlI8oxEeDjrI3zEDzPh0v9TXmwio4vSzIcoXW4VCwwM1
X-Gm-Gg: AYBFou05ZdPzKbAJp4hU3/0v3/tiICV9g8u69JZUJfflIUsIscpDlRH7h8PKX38qFZ9
	OMVSCTt2mcDkYpplAPvEjyVUuS2ZSZs1lA1J/5WvGJj182PKRE5iOaZZk9KGqrPbYFUo1q3LQhL
	6y5i2+G85OpuyKh0XLS9iAhGBh7fV+PfMvVmltL9XQgpDKhCYkHeep3+hXMdu7ttjCyo5TzPdHQ
	p9sqFhsA0JG/NQcyopXaEUVRijt1sXosD7liiy5NFyPW9SKWOmjs1ZXINILyt1iAE45Pk06cX/V
	nFoRsWlqlhIHYP5eAKhU+uWfp21mQrYyBX/LdPf9ltWig/n+cm3Ec6FWcVQsvBBG6dB20H1mc4t
	ZCBMbpJ8WGGHporkFHBCWeeQDcSZE
X-Received: by 2002:a05:620a:2b83:b0:93e:53fd:413b with SMTP id af79cd13be357-93f6f842247mr289315485a.59.1792746155733;
        Fri, 23 Oct 2026 02:02:35 -0700 (PDT)
X-Received: by 2002:a05:620a:2b83:b0:93e:53fd:413b with SMTP id af79cd13be357-93f6f842247mr289304485a.59.1792746154390;
        Fri, 23 Oct 2026 02:02:34 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a215437d4asm23076245e9.3.2026.10.23.02.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:02:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 11:02:22 +0200
Subject: [PATCH 1/3] arm64: dts: qcom: lemans: fix iommus SID mask for
 ethernet nodes
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
Message-Id: <20261023-sa8255p-emac-dts-v1-1-a34d778ce9ac@oss.qualcomm.com>
References: <20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com>
In-Reply-To: <20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1377;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=23zIhhjG8pQRTvWHr3LJ96wEHqil9xLHbjMCYkHD1FE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2yKmO6d4+s9JqHLmKoIpODEaDepUxCKmf8PJL
 1w5h6UACPmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatsipgAKCRAFnS7L/zaE
 w54ZEACEpGL3pZO5XBAbCX9VJxyYpEPSPtxS5TGEz1AbtEDT7hmcPpXMu3Kp8igAKvd9n8CFkEA
 iJZeIrqdLuGnhN22hkew/SvCvXuRDasTxBMGDNPJoZqD/oqKj7iS/A3tBFbwBaUNoNxwbRNedJt
 d+wR3XUbIRkwH9L1aMcTNLRy4oHpKkt93+RMhmF4zF+S46F3qMdwMWgnczM8ZADVcyhhBvY1vsT
 KlLGO36NpIUBigutL8M282Ybm0NhPqs8as5hRhl2BnkmFWnvqmqs2QrT5k/+jxl4viizSQ6ANfr
 t3mkxr69pp51GpFIBXuDTHMw74dZq/bEW+EWneUJFlogC5fe6N/xN2GlDs5cdh5vBFRjsNdRGxf
 OAIqC/qUbd/dMtpYiYMlrszeTGYaICOuQXFAoChCxizQ/taE/tP/aVBa317EXwOwAtT+IS8Ne2w
 T8d2zDOd2c3/1Na4KQNPx9m4czPBIRh6/zwQrmcqf6ABFBFi+5+YT1moPaG+hI3KBb+Fm6SVLlv
 fKu8synfqG8KQof38DWGx8zLSHDA6wjOLdrcydm+FYvrWRygUb9qyuHNtUtwwthZ9cFhg/cnZww
 r/ELRwB79Ej9GTMydc1Ro75zuFCD34PcgLIjCyhfxjKMorSwDdCbA9v+uSnr2zWqvGitherxrNi
 ATPklPe84iD9fgw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb22ac cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=jHMX-OgH2kBFWhD5V08A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfXyFkGqWCoctZx
 j6NQJE6FTV+DsIb/fdJQvd9gDiyEVP8GMEyDQXetZJ9ygtspemuHx2ykTDanfjr6VFy2ngXGw/2
 ivOPtu3M7uDGPKcF2+KTbNPPsQaQ2Zo=
X-Proofpoint-GUID: UT6roUloLg6_Wug9QVulMQUMCRBYBwRZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfX4SyJU2x5Onsk
 Imic5bdtB6BYyzM0NldrmbPGyhhHr4aImLwhjUGZhoNKfsFChuTTPTSRvymYHwzVNjrrgZCDPFT
 hvjxyQLjekWVlLpv0fPCPvSJatHmlh9oJTSBBoMJZ3SLTqwH9/S2ABeS2sJ0LMESF/rEmS3ANP5
 VlOMB6o35SWhe3ZkjEmNdc1NJ3TPCQpPD3kfdMs1xFORylRjZBxlJAtiDh2uXl6awIyW7TBgVAY
 K0Je49giEdapxRj0N8va1jxBI3lN/jIhitia5SOVZgoyZKILCaPTpkXgjKp7cI3XBCGgbtNSKhw
 UWK6u5ljL9hQoL/gVFwplQKsw0OufenXu/+/AXaAfdg9tM1Hdt85YuTGMue39o8jlAAdnSd5o/b
 ExRJofcOoRgi+Ok+2kS99OzPIscZo6cMnGHPt5h7iv8D9GrDMSc0Il1FN4ODu4HuxgJQKwG1AJP
 Tjl1vKDZR36lfJsCbiA==
X-Proofpoint-ORIG-GUID: UT6roUloLg6_Wug9QVulMQUMCRBYBwRZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230035

The iommus mask for ethernet nodes is wrong, it makes the SMMU mask 16
stream IDs per MAC. We should actually only use 8 SIDs. This has
triggered a crash on sa8255p after a boot firmware update. Use the
correct value of 0x7.

Fixes: e952348a7cc7 ("arm64: dts: qcom: sa8775p: add a node for EMAC1")
Fixes: ff499a0fbb23 ("arm64: dts: qcom: sa8775p: add the first 1Gb ethernet interface")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index c71b1a48c3832bb40abbfb7d771634f4d197b0e8..da740a0876d4adcff0bb9458564c868a6f406b0d 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4395,7 +4395,7 @@ ethernet1: ethernet@23000000 {
 				     <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "sfty";
 
-			iommus = <&apps_smmu 0x140 0xf>;
+			iommus = <&apps_smmu 0x140 0x7>;
 			dma-coherent;
 
 			snps,tso;
@@ -4416,7 +4416,7 @@ ethernet0: ethernet@23040000 {
 				     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "sfty";
 
-			iommus = <&apps_smmu 0x120 0xf>;
+			iommus = <&apps_smmu 0x120 0x7>;
 			dma-coherent;
 
 			snps,tso;

-- 
2.47.3

