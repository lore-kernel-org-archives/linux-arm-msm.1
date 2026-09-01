Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5A747206F
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 08:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250080; cv=none; b=FRdsmyKfvI1aSoZphUbgG15woiTMIQftXZEW22JFRk1IvqUz1IzeB0/GMnSb4lLZxHB4375+EWsrdg2Rl7KWIcnUOURSn5/jkou0FAlmpkf3qhppJOQLxNsUmHzU3ibKrqwarUPjEOQB8fV0ONjok8qiV/sYOU3yT+Rt27Mp2Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250080; c=relaxed/simple;
	bh=PQHcchhUb1ldTvPKloGhpIJimpZzqJaGrAccKXsi1Kc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uEwoddmofM8UKx5qqjdBNXW1W/ZGfZymcsc9o1McAKYciNwRRbkeHH4tqTHrwn8hdM6zR24DVhbyY1I1oLhkAvCsd68xU2xNlAkVhy71Ioe5I4Mz1Y9a62YwvQcdgLFpjhNcydTAnMtiAUrELxFMSStdUP9ffdNV0P01B8Ym7vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YIEYTXSH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DCIrM9Uf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YIEYTXSH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DCIrM9Uf"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179Lt51709594
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 08:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i0vCVVh0pgD0zKwh+WjAcVD448XvInWLL9VF8KqRdEw=; b=YIEYTXSHZVyv3x1b
	61toKp2XGDyDAEhsYlER0T/jJ66NvmVQLGuTAMK7PLU6dt3h/TdqxYt0EHSjc3zk
	IGW6gDxjqWHrRVVn2X9B6wog47zg+qQUBUHRZnjW5QqBSxY2/qqMKQnvJIr7O+AV
	Z6lISmTA+Q0xDK24z2oe564wzfzZjXC3tDkY/5YoJb0nXKuvpBSyAJROiH0/aLuF
	pUZ5kqSxwgRm841Bfc0urk6dYYXLJMWln+NUYiJap1/WBWoPZzGdl4b6J4vtTBdS
	CeBIkvZdDw6aSgKlEcT2kxTtjTjCbJquCulEp1DBpMDcEucJZLcts90u2dHMdXCF
	6bUemw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8fs5jg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 08:07:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e62e3459fso608785685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 01:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250076; x=1788854876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i0vCVVh0pgD0zKwh+WjAcVD448XvInWLL9VF8KqRdEw=;
        b=DCIrM9Ufzoaxm59CZOBRQbuWMaQfIjr9d6ZpAIKLf1CeF5uQcNdcYGEWvqEWLJhzwz
         VOH+Gi5BMo1Lykyi79P7+fl24HtSso5iBhFrbCPfGkcvm7JSM5qdOQiuUk30xsRxqw2c
         WIKMg3puf0z8ji2ACiDrn+Ecf0Cgm3F9YrMp9Q+LVpfuNHE9el+lpkBIvRGqPgfnS9tW
         SIKZYhMSXwjjnr2QAOAPkLKePYTququkyCFIUWACVakxIb/Ba7LtkRselv8XznRrLxSW
         vp4XadrJXrTYC7bfZdeL8OCIKAi5SkABJYqVWz1W5KGiGLUcbJ1WZq2EXScdX16pFHnP
         vvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250076; x=1788854876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i0vCVVh0pgD0zKwh+WjAcVD448XvInWLL9VF8KqRdEw=;
        b=BxyuFe+xcqnj4eK1SLbKr5uTw/ZeHao6LprUIqr9a3mNGI5CUYvduwx9abgBz1/is9
         NC2otaNyVMr5I1KvFfg0oV+yzPdPXaJ+7jH4L++GtVN08TXR879lVVPZR56sQdGK9ZVI
         UyspHPR2zmwbsRRmnw5FQQZId6EFWGjj6C+dPomK0QXUPMToad6e/hY8ITxej+kvyTHV
         KSqbv+KhVJJwy1hDxdhzjkWfLkF4FFFO9V+vwFz8+bRgONClhakq3i8ZSiKTC7fkdNSa
         i/KvaH/TAyK2FMzmIpCyWR5bo+TmdUZddrU37pXieUYkV2Wt4G/aauKaV6ihgPtlMuiG
         vznw==
X-Gm-Message-State: AFuF++kuDGPceeY1HqAXOYEUpFLdzDD7zzfaLnBSYwCek2pPL4fNAW8j
	hmJv6WgCET41UdKSMDkYpKmliN9ar3w322hQgmcd61kwIEThge9wXqhxlechsynl7y/tlo/rUgG
	hOmxuGh+vB7YNw/oQXwBvFzKyUp4LA1FYF3X92IE7RpLufR7yIR5vVAQlLF89c9wUV532
X-Gm-Gg: AR+sD11ki6T6k0RyUqyZ9WGO2EQDoSgvi+LZWi6uqwng+8a04VsUzC/i5WpdtsoLvg4
	zH1eMEriWhHCjsjd4Keh6Ev0ijABZegauegTTg8oEzSw2A9ZInmrPynd0idWF2xdiSDoxExMAk4
	/5xZKfnqL3551aePcuYQCSJfNUXzR/BA7U6CoS4SX7rdqb6ZE+AONxkqrr7jXusxHudXYzq9PDA
	EWKgVMA8Jwu0CBmCMuLmYJITBEq84RGT9DJqDrpQZogf0LBFXrAXfn0JO+HO725eXTTVdWyzZxE
	zI6wdK7KwRP0eEYqkvtP6rq1oMnbrEw+yCxwJTXQXRMADRpIgFp6ctS8LF0PorAOp1/yaB9rOLK
	Coe4S/yQc
X-Received: by 2002:a05:620a:f04:b0:92e:6a33:7118 with SMTP id af79cd13be357-939138df202mr3444136085a.30.1788250075737;
        Tue, 01 Sep 2026 01:07:55 -0700 (PDT)
X-Received: by 2002:a05:620a:f04:b0:92e:6a33:7118 with SMTP id af79cd13be357-939138df202mr3444131785a.30.1788250075199;
        Tue, 01 Sep 2026 01:07:55 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:07:54 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:07:07 +0300
Subject: [PATCH v2 10/16] arm64: dts: qcom: x1-asus-vivobook-s15: Mark the
 EC reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-10-f4ab7e4bb75d@oss.qualcomm.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=PQHcchhUb1ldTvPKloGhpIJimpZzqJaGrAccKXsi1Kc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloe0xRIqhBHyVjaXzJp3MTGGS7RTLRSfvd7ZC
 /7t1YyJEfmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHtAAKCRAbX0TJAJUV
 Vt2AD/9sdJNRVtpkv6R7kBp00y3wfcbe10Ty+y8kE5LMGAKF41u8/u5qxEC32wdsY2eFwobhPJB
 Ab8wuW8DUeSqvUyQok4n01cxejT429xtyJk9EQos8hq0RFhFmsY7vyL5Z2v2cj4tSzeFquwVON7
 doXVfRjDtdU5K221zofQr+idigIlaRwboEK6eo5s1HvCN+aVj4bh9i0eI32CBuHkIQ2v4BQe1eL
 3ZWLU37VWcwxSliScYKyAf02yZChrO5okK3lnNorh3GU45CMP6NebLbg7hvLji7iHFlxEwiT/k/
 npRUPTfu24+kSJpTBYV5zqX0Wajl1pU+14bu1XFBay7zN43ym2h04/czEtXSWbRUIo7I3ZQOZBs
 WLiH6PlvxRKiKclhKXaicq8z85VOi5V++hUN7oMFKti6n7eh4K77u7/07i4wd6WAUPV1AIOwq/2
 gcnp04ezlNkZv5BORRk0RDixA+SVD9z1LOIrFwypY5kFOHl48RhokjpwOJECwEyzcQOno+eOBsM
 02BTGF3pQK6ZLllLq9ilzkPHUASbXmmISCKpmpFWVvsDOfl4bX5qOfKq99NQYCi5QkKimd3aWcJ
 +A80IcWk3wtbnytezaH0vjIa4Fqm/16Z9a5HpSRjcz7LQJSweq3iwrC+l3MFfOwtP1MMzjbF1h+
 QeCaUYbpzpbQE6g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: 5c3X2kwl9C-nUDlSJoqRm0-VUXiv81AF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfXywzBSN6CeLHE
 6zmNbX10wZTXTmz9F/bVdjUa5z964ZeNWn4lUA0lwhH04mXrlrtAjqf6PjThUuaQsVKVMF2RNBq
 P0FnIiowYN4u09a6uZOtJj6DRXgbkkM=
X-Proofpoint-ORIG-GUID: 5c3X2kwl9C-nUDlSJoqRm0-VUXiv81AF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfXwHxxtfBVPnh6
 OvAxGrLwEQtS6GQKpt8LzDk4wHkU/2zMLAZlnjMr1P6H5pmQ080Q3gt+D3uoLfC8PBTV1fdhtL9
 YMUQmiOT+PlmfGEnLjxCuVS75LOX/xoPXS0LXV7IYzwpQe05LD0ydy7DFRRtAbb8VT31MRFBfq3
 5lycI4iz2Su9OMmdUcWwjNQ/0Hit7VC7mja6QoKOmG7bU4Hf4+KM6zXMnqVfH0hLS8w/rXtdEsI
 wOIxZG3mnPPKvfP4Azebd5o9DaBb+saPvsHMmztyGGI994MIS0WvAm0u+GNbpeQ1O2F3zkYfINZ
 8wHnwVeeq7r/jKR7TlgjTmvUxZVuMDK60FvYGqqYfcaGld7bBeuxNMjfHrySwXcgD57oehcNd2W
 aybqC5oSipHLlZsin/yH9m+Ars9nmViI9dfFGX9ZxmoriLkhOqrs1A94LXOItXrdJ3GlpTXItMW
 fBQlRSY8td3DdCeRCMA==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a9687dc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010071

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: d0e2f8f62dff ("arm64: dts: qcom: Add device tree for ASUS Vivobook S 15")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
index 0dc7c1b5a14a..27fab4db24d5 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
@@ -1039,6 +1039,7 @@ &smb2360_1_eusb2_repeater {
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	edp_reg_en: edp-reg-en-state {

-- 
2.54.0

