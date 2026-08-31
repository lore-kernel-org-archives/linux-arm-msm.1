Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930614078DF
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 10:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170727; cv=none; b=WOET3ECQ/F8Kd2a/UNAANUOJjEs9JKHOuzL9x0hWZ7309ippqQfAK8f0I89Lk2fxQLEj7jE+CTUv4/evKzkIbDJWSkPXErbWk4hjaFsZoNgGnMVpd0imH9l4r/8vlTUV+NT1gnrUThaeVasCdEsOkBc2D07YT3257/lNDaQo8HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170727; c=relaxed/simple;
	bh=YTcs5e5Zy3w41A4rx3PBiGkd58XaezQSKzUP8kIM+70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FIRC+eBpxtRG8L0XnLiZi9x3Dq3aty15QTkokSV1tLkJGAgMazL/7uWrTGzvOguDMITZW2SvsEZVliSKgtpAco5NtBYgTxyrllIE+RrPGZtWVPPSnEVu54zRJLoQAh2SCHrgPr2XaeOX06PpwRVYnEue0naU1cyliOZUinEQsh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DZKy4xrH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WTTDtsQz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DZKy4xrH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WTTDtsQz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V8vmYP3302881
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 10:05:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F2M/VwU7Ye/1qRT0lofLbBRhIQLseKS0kV9PH/Gq/+g=; b=DZKy4xrHv/IFOwOj
	zMQdYdzaxV9KYF/tNy2UD7KKV7EQqDYmTI6bvo+bFzgF4PECKf6pc7k45VDI9Owt
	Il76OynsgE3Aam1GZ4jxHHsco6BfiIFRWMdUdMFxN6voI2AVItKUUoTpokEsNhQ/
	AUTm/NSV4Gxrx3JNSblSLBZXVlGHRvo8iI8B1TduwkE3o34h/ytB83lQWP5y/YgM
	tDTDCU+b7Z6CPr01NenovhLOpLfRfqNHgJr9hGFw2w5uvENI2DEMLuumJTqb8tnv
	johKoLubBGiIknTPfudflktwsmbSRenAy8jw24n1RxXiktyDYFt1hfSIuWgQizB+
	50dQQw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6jgg9a7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 10:05:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9390ca1a9abso474694685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 03:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788170725; x=1788775525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F2M/VwU7Ye/1qRT0lofLbBRhIQLseKS0kV9PH/Gq/+g=;
        b=WTTDtsQzqtD4nUQ5cCiginfYxSCU20NnYqPNQIVdNlU/im5UrZHUjXyfiKo0p5yyYI
         imkkgbleAbnGtz9RTpLQbWU/hIwgrHt/tww3paQQuz13i6SC5c1K+43e+fFQchclpTHz
         05y7RNTEh5NovE8OpPHM+5Y2JIRJh8CQc88kDOxbEGZNMPY/nxv5jK8UzFhCz3yAT0X5
         Rdp8wu/iAqbbA0+TG7TMJXrhLyr7AoM3NbJzCJ0QrOF/PCwZoGKiXZyOJ+1POvuk2rNB
         5oeS+pDgNfu2390ubpoOgWylZKaKIshpJ13OkHIG/ju12/RIz5FqWCZX2WCieolol83w
         komQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170725; x=1788775525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F2M/VwU7Ye/1qRT0lofLbBRhIQLseKS0kV9PH/Gq/+g=;
        b=buiA0paiLCtfqMN+v8HRAerrRbRSowMpCD6ak208fmRX4/kmHGJ6GPnz3soCtamjxU
         yeQxkQ7112S7Xzi3QfkPd35ifcM7l6O3MvUJ/Ld0wl/cp/75UhIBjl1rlhgdb8a2/EeA
         PwJW1S5U6GiYP53UHJhrnFaSGo/wfs8Xj7e1SbqUJgSPbuTxWXmuEnJDdxuaI9ZkaLrc
         WI9qFXtQZ7rw9yeT/w6664y7Q+bTI9vSbl48lRt1LyA0AojTaxpQD2fNr6VII5zpK7HH
         leg52X+CB1MTXxkIf+gMZ6oOMfaZRkEOZmV7PbNpPQTYUEkZ8cGPiTvyyYdfw/PeL+86
         fMAQ==
X-Gm-Message-State: AFuF++n0YaHqSSKBgwGqmMAG56jtsKu8JcvEOLsmvNlYCY6jLwuJft2i
	U8d2NVonK9WdqfHEKwTm4SRbCIq1RnqWaIC//hnwfed/N4jJBeqrj8H8WgBWh03HMSQYfQU88RE
	NejH9HoA8lLlMqnsQm1tI/rYxQMvJK5e4+c6n2HJmEjzICUCsmLcHplQ2yksPG05K3Rac
X-Gm-Gg: AR+sD13jcaE5RtzxDUgCK6BUMXfk60bLtFjsi0NWdekeNqUJOBjetwg2p6mwQNWrYfM
	53WGJTqa4nHzhayJD7TCzYrLqFG/7U/a3wmgmUOnUFcpU1jQ1ksZ+WHUTCcuo8vhmQPk5s1JKVu
	376ZrS4CDgzHWXW4b1e5s3f3dJsBgnxModibuPpRMFcTDo+mNR6o7bQqezwMCRwhX9gh2nqr/A/
	w2OXXxxJBc/7o1ajDglG21Gdg56C2bGitgGjOcnOI9s+abJ6FFDaJZ0ugQYTDnfw2kpjR087SdM
	v9JwhDogy7dcfWJrtfwQusAEAlBH7E1NfTNygFk3N7N2D6Df1Wy57myw+EMoGbKwV7oJrqrptjG
	27rAOYw==
X-Received: by 2002:a05:620a:27c3:b0:939:e62:bf0c with SMTP id af79cd13be357-939137af559mr3023487185a.4.1788170724878;
        Mon, 31 Aug 2026 03:05:24 -0700 (PDT)
X-Received: by 2002:a05:620a:27c3:b0:939:e62:bf0c with SMTP id af79cd13be357-939137af559mr3023478285a.4.1788170724296;
        Mon, 31 Aug 2026 03:05:24 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9281772bsm131001555e9.1.2026.08.31.03.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:05:22 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:54:49 +0300
Subject: [PATCH 9/9] arm64: dts: qcom: x1e80100-qcp: Mark the EC reset gpio
 as reserved
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-9-5b202de8c74f@oss.qualcomm.com>
References: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
In-Reply-To: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=867;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=YTcs5e5Zy3w41A4rx3PBiGkd58XaezQSKzUP8kIM+70=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqlVAISgDiH3x8MEulRY9+8GgclTGkW0xCdDMkV
 nqHjJDF6yaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapVQCAAKCRAbX0TJAJUV
 VtfPD/44MbUz0emop9b+87e6aHFBrPa4YTqR16jKN8qPhea2r699X7v8GWMpigjcSxekxYkoFlZ
 +MOc62yzM6epoA+Rl8p8vMOtlI5WRxpMvEg6CWAhLxODksZN3n4zxQ/ieWMbkxKo8U6N4Gya038
 8UMFfWK96SOGqLIg3Fhxr2GLamdUHDCjo/QYAKVJYrimwEj7Ow4GXzkDlS5BE2XXdtXkYsje7n4
 NCC3XgwBk/vjMZPRWtLwm+cXqb1mRvtBkiCk6rIM01zppxse6tc7BphpulapfgzUU02nsITcw8/
 lg2gPTaYYWH6pFuGGxN53stjPXhMdOKNvSxGdT91j8ig0zdvMiqs0KYqt0zfMAWdLSYX5busMsQ
 0+SpDUNYxDfCaA4AqH7gNirTF22qf8vAR1wW8sMfXNGCPcLGUuGd13UDKF0q0S/r9Kv6z1PBjzW
 tixClVyNqPb023/H6/96cxvymlPtWTQC/++HScdPOsR9Tu+omAlG0TfELIFZlw/MIaR1TIFq9f6
 mZ84hh2yDSUooeODlbxAqs/Bx9QMnVuwPZ8KA2ccQSPv9NbILlukXTkygk1BHlafDR/GGr3UuRr
 zxM+60R2qeFYBhvxq+3V40lPISPm1aWDKjx8ES2ONoXi/Po7jGwmHm3R6QtAp19k3pVwtGbYom7
 kiJcWyRAfDxC/8w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: WlyGrAGRmNxIbwMT2enTC5wrLPUNfLjY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfX/VL8eB7wtnwc
 mjfJp2MuKO5vGqz3JVxH6qz0RfEYLPoOyqnkobYQS2TfdBBkTjjP8zGT94FyVdEBGSDYKHVCHL4
 hLIXvBDnzM9DTzS6ytal/Djl3ic9FLU=
X-Proofpoint-ORIG-GUID: WlyGrAGRmNxIbwMT2enTC5wrLPUNfLjY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfX7GM3nWoBTn5z
 phGEL5AlvPdApDf+1vvXnJYuXQK/QXpbgAAEjwAo2efUaMyOOQurwphHsMqx3XXEDnJ3uiOm8I2
 pUvgPvhMtxdABZmsVMQBTa1mNC2VN4CzLWH7co+gmT4sQ0VMI8zJyKGDn7Pv1rspGOWGjanbiSr
 ZGIHVyjh3yPTy3b1Pc8R1aV1UMi9AMMk68iANW4S0oJz/95dEOWwUFZu2S3p4E/OKrVFIZi3KDH
 zwX+fCR55oTIYYDa+axorKBKhf5qfcevrykXYQgX1jnvqJUeACG/QWqDMobmqY8GHazU/Vanver
 17SD1t5+lJA5/QqZUCoprfgjzSqUb9SBq2MU+H2ZIkGerhBMqRrhdo66tPJs6qHwKaSff3iSxcO
 JkSHU/3a4AmQqIAr96wEpFw1PKDaffvq/gmBO+Z4a1J1vpI92CiLiTIZkUOSFi8zNTogzWK4P4J
 1EkhigWhmtIHSDAI8Tw==
X-Authority-Analysis: v=2.4 cv=YsY/gYYX c=1 sm=1 tr=0 ts=6a9551e5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=V7ZQ0Mhs6n4Z7cZ43PMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310086

GPIO 65 from TLMM is used by the embedded controller as its reset line.
Reserve it to prevent Linux from requesting or reconfiguring it.

Fixes: af16b00578a7 ("arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 78380fec8839..19ea1add016c 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -1180,6 +1180,7 @@ wcd_tx: codec@0,3 {
 &tlmm {
 	gpio-reserved-ranges = <33 3>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	edp_reg_en: edp-reg-en-state {

-- 
2.54.0

