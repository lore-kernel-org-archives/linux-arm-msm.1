Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987938;
	b=kpJaaXkVHlVR5Uxk7pnyis8l/Gu5qtwIG+j+itmPHN/1Sv5jlR5q5jA0TfptrGr35pZg
	 6Z9t+iG0wWSa0T84jakLlH2u7uLjphqicB//vINSCRuDH0Hbbeyknw8vQzKFgNQpVhWV2
	 Uzdqd5VsZblvv0va4N6fjL7pnNB00LgLKu2G4IUyeDMIyKwJVihOBYL639BWza44Ap3q8
	 DfqRwmxp/zJqi1A7fsTpHE/QijM+4lCFDrt1B4XKgQhCrJpzo83Xggb/FkQjd351hi4mu
	 p/z/Mas+mTjt/VN39db1zVQL1dllGMY1tmBOjwYJ+Q1wtyWJJHoUTXIibdmTIgCyMQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987938;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EXJTyC9DJ41IUOx6k9+mNGczBOiPcutOoz7ayN1rX7g=;
	b=Ql/YoEOKlh+yPcUueGGWAqdG+V9Buj6VWMlHyZWR4xuX+LNnKh4WJsKNytzktQDzuGM8
	 P4Ki4zJIcBV7JE+YLikGzWcUH5xHUv47jeUC/pVkJcmbRAf0nOoyptypH6mgxjrOv47T0
	 PmMU+0nJIFW92Lz9/LpqEbR5OaGx0r9drq2Frttg/lXFBlfE1KgBDWrqIYtBGocLzvU5H
	 zcVB9b+DUVK1rtEzpWI6Etw21OZAUdwROL4EcBaJdSCs92FNgKSsZF5j8u/uOpB/Ybvip
	 7b0fnXBc6YajlkUDYovKzbthMZ+UZb2cH+C6N6JH9THkgQI77r+gIuxRpR9X9s+3/Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m7u9OEVa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cjXSGmql;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D956E606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D956E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m7u9OEVa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cjXSGmql
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uuvb472513
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:45:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EXJTyC9DJ41IUOx6k9+mNGczBOiPcutOoz7ayN1rX7g=; b=m7u9OEVaEHvpKVMI
	XPcEemS9a45Y1pYdG4OVtwfgYrCUQeZ3BRM4hSUwzvVHhqbQ8YP5WnWOmLa8U7AL
	nQ51C0CTkyNskPlQ4LZO6vSrAqYgFTPu/1RLfyDWjhqg2JIJVzr2ZxQMLS50RydQ
	K+Lnr50mTUCXWC92Y0yx2/sXvOWffNyGxfM59m29wLhpVV8aM1PM5oVkvIOJsO/R
	k3DsRFqttDUo5POxpIcszaKg8ld6jKr3blqSeKD+gW6X1Bf3rrZqEvKMRMW8pjO6
	98M7hvfGOalWf3cSZxlAuch4OB+n2L3GdMKPIuK24VzoJ2k29vyc5h99XfhuBgaz
	KG+1nw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv89u2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:45:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so158381985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794987936; x=1795592736; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EXJTyC9DJ41IUOx6k9+mNGczBOiPcutOoz7ayN1rX7g=;
        b=cjXSGmql/qcW79pYdyxrLTRkjhADG5D71DAJe8L3sob7epFxt2tzx+BaJKjb0tGBUK
         XKz0PnzbAH3hjP5+a1ceMela6PCh5vYXqa2QUzwse1bRUi13i9mK0UaO84FqiyRw3atU
         OONij1nr8YKfi47Lk+Kb83Uwzp9a7u8cwvu6WwC+6yAbo347YzydCdeY9g6lWr58nfx9
         dm8LW6JrnJxlNeYI1BUpJY3JOT5xX4BZS6FBY7NDZ+9YgNilH/KVvilgR/jZTwLddH5l
         BHNRDJclHjZJAIgSLKoAu/RTFHff7/RkM7a0S//HtmA1c0dQeZlPDXVESTPu3MNqmxeU
         BoMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987936; x=1795592736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EXJTyC9DJ41IUOx6k9+mNGczBOiPcutOoz7ayN1rX7g=;
        b=vlQaEmY8frEWvfJNtsm51/w0eFwDDbtablhSw2THLbOrPsGPs/RR7FyxgCPMZf2fCd
         Q/mbudaTcZ+bWtJgaNxGh46NLRu6GmkHitC3+6MMbz7ZbdiiHXOF/byORP3Eub7yIO14
         zHJZc5a/P8+xnYAMRtQq/Pr7sZ/EdbOvjFMpvEWFkVsIoMWmlyIRyNzD56ehOWIaM1p5
         ipSYw8oPLKhpHnpR/cQ15ObZ8AdFT2WqtjK+uefL1BJsj2zBa/PDpTL1kZO9iIKqgKDg
         667UuY593h0csfVcJ4Jqn/Pw0xbAwsNdkciq/WMf7b1IeLl4PIJ4XtLSv/4vKmwPIUaR
         k5EA==
X-Gm-Message-State: APuU4Z9vWCAIFrpWa0nrWncRns6N0UU9bT6qTv1OGfcNJ7/J0d+sSTs8
	neiwUdw2XRAsmLUtQ7SI4fGGurshMtEI0T4Rl6QBALpmvw5KrT2y+V1ffJ78YdQLk3in9V7/hon
	VMUgoiz5rawdH3kmoCZOiUfzWSSXdEfZKBeZ4VKhSUF81ER9Oxr04amwgUsI75gA74Ea5
X-Gm-Gg: AYBFou1ygRkaOyP5HfBG59dShOMq4TqK6WwI2hbuTJj2YCftEKlLubtuDLOQOdbmyx4
	vQoIJP64yk/oT9Nr6GPGLsSjN4iTY7WX0f4Est6ko88aEcEbjcpNaplWEXG7zSO6NqRQnAP9MNf
	3xHB4mqflVyexxHk+oWCwBx5ZMoLN+s3jHU2NgApAR6z/35W5JNVIuPQotD3aNpT2rR2fnW/Axq
	CgvqMF6/wgPoWb6QcO7Uyvj+ftGy7dnrUONiL3OIvnZqYmc/9Ene7QEqnYPu64fQ+/ddT2Ns+Pu
	1zARTKRJOMkG2gKQlUHq5L5Fvys0DBUCLioVOsDGMs5vmuJyTOblJ40lWMJu64BnugpaaSQ2Lm7
	/NlrNYaK6wW6ymZVUR/5nfHsAyh6Mw/JxRRs6mYClu1SOb6jXAxk/TomMG8av8MfLN8GvoM/QPT
	p5Tv2jRkc5G8vxzIsFs6wLZHimePb6v+yNLALfuujZ
X-Received: by 2002:a05:620a:6f0a:b0:949:52b7:468a with SMTP id af79cd13be357-949995d97e1mr344429885a.51.1794987935952;
        Tue, 17 Nov 2026 23:45:35 -0800 (PST)
X-Received: by 2002:a05:620a:6f0a:b0:949:52b7:468a with SMTP id af79cd13be357-949995d97e1mr344427085a.51.1794987935506;
        Tue, 17 Nov 2026 23:45:35 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b7b8444sm119359085a.31.2026.11.17.23.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:45:35 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:45:08 +0800
Subject: [PATCH 4/4] arm64: dts: qcom: eliza: Add interconnects to camcc
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
Message-Id: <20261118-camcc-fix-v1-4-279d269e343b@oss.qualcomm.com>
References: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
In-Reply-To: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794987910; l=930;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=hw0zxzf/1xzDeDl5Y3u8agRf1bz2PCqEVVqN89mjp8I=;
 b=Vq9K6QS+4F4RQocn46+6qHVdmQoeEuNmJZ1dCLRorBtYBo5+xHLGXySyGOHmZS37U4Po4gr3F
 uOqhtSC73piBQ+RpYFcPAinAWj49gyetLHHRk60l1nshhjGaUF2tgJ/
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: GcpJcAMNsXXiVcrtyiYcqk-6l8WI4bdg
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afd57a0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=uBU3Tko-eBge3TvO44AA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMCBTYWx0ZWRfX4TrbEbW4AtSP
 6xiotLSTwircCgqne4eK/Jwj9gCHJzWvuZGTqathfvllbmg71jPNFdZCZzBZDwZv/7MQxzKJ9I7
 TtM/03A3pydquj/IV4GUE+KisFt5VeZ4CoLF2ltggO1H70WCaCXVKNrXW4HEqSFdLLxdRpywpko
 WhNDY0hy9Vq3+XJqjIq4EFdYPpOfyEFF2WUuiapyBvnCKBdjf4rCJLuHv+s3kIN/HOZd5dgAN0w
 Es7+1irjQP+CaAzJs7HaWf/g7G4yUTqFCjwQbj0TI29HkwysOJB9z2Ox/ZWGqLRrbB2f1K+8owh
 fwb7ic8v4hgu05jw8jrQUxuNJeJu5fsiqUpNz38C+hqaqCwfdVjDNftiCYDp+4OX4PDwcP5OPk/
 S95kV5vIh+VrvcdpahgTRZQqhIpfdx53NSID8eZqq2oBgi0ZbQdm3c+oNP1lTbnqgMImQnbVPSo
 Pd86PwrlPyfKlhQxUEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMCBTYWx0ZWRfXxhsrtDlVPK6B
 ReTYW6M2Fv8YDvWou4cAH4j72F4j4Mum/Q2DSrBmMQ2VMTE6Gs/bZrYp5URW1Qzig/sYSdXn2d8
 6QEacj22G59LbdTLzEaY39HFio0Z7Zs=
X-Proofpoint-GUID: GcpJcAMNsXXiVcrtyiYcqk-6l8WI4bdg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180030

Add the interconnect path for the camera clock controller, which is
needed to keep MMNOC voted for while the TITAN_TOP GDSC is on.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a125ef386c025fe6ecdbf4d17a785d1532ba09e..9d0eacadee3fe72283219b630db751f27f61897c 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3456,6 +3456,9 @@ camcc: clock-controller@ade0000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_CAMERA_AHB_CLK>;
 
+			interconnects = <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ALWAYS>;
+
 			power-domains = <&rpmhpd RPMHPD_CX>,
 					<&rpmhpd RPMHPD_MX>;
 			required-opps = <&rpmhpd_opp_low_svs>,

-- 
2.34.1

