Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DA6437453
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800594; cv=none; b=cmZ/QuoAJz4BEMVVNqb2GUhfD+9PA//qfPhwAKMa3uVCkctycQEHFBjn2kTRkBCz5u29uylzsu/yP+yj+GaFv3mL14Rd37gEFAnJJAWsDN1LUSFoLnqzuCI/IPfyBMfcnR4BBilOuagtTOnI84FjSRl+OVqp3vstttB8q28SVOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800594; c=relaxed/simple;
	bh=Z1YzPRkvSQgRUC5fEUq0+vq/ZZQtekWi6cALc5Fjcg0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NDK2Mm83uYqNYJZ0JorjCLfmiVuYEJ2bIqItspg6b1LqLd1s9lqAcvgOdRXcKDrrgWLlIynqEWZXJxqfeXyT8Db0mtmU+xaXplExgQquioH8g6sMi4HUCsaWojrotXxSmoQL+c4aezFJhxXoIPs3C+oREtRXirvhtk895sKbS/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jyG5giyq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HyOg5LR+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jyG5giyq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HyOg5LR+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qh6s3387924
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4WCdFFh1fv8TYtu8+Es8SvOK/GtY9pgiFRGkpwNGHL0=; b=jyG5giyqS0Iqhy1K
	K4evGV/rhv1MPJBfUN2r6cL42nIrpq5YZy3TzFfnrmIkrP+/aZVC1bICNbLqaSmS
	nokPeMrfhfDNzNbuPHE0FWuQAITtu1IIE4Sujk/Zx83G05r11axBe+QLvDoYrDdU
	54LXQwk1zyhlsUiQH4YAmmyAelBZotKO+a4hAtcfzZTvcte3AzdqTpdCu8j8mCdO
	fu2iTdXdl64TMETIM2dsKCKqpA+iDfX9zPuVPkNBHusca+oQUc3lO65g0p9o/Mqj
	DW4tohWqRHMJEfzXLXY5Oj/YSyQb3GEXHcx1hAmcTwtlPaLJ4ikvhrnGpfKZH0gq
	zL8hVg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk275kggy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:56:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce756aa72eso3445495ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784800591; x=1785405391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4WCdFFh1fv8TYtu8+Es8SvOK/GtY9pgiFRGkpwNGHL0=;
        b=HyOg5LR+tsmAqY9Q3HxVWIUbNgUrhGWKopjmlBEFKUJk6oVih6duErJdzw56KA000g
         yigUslLUSKp6oBX+Nj1uWnLMev4Usv8EGXXeXAmimnDQemuQNDbJelXT2Iyzylq8BBbf
         j4uAXK1zaaOxGyTVpLRWkpiWtHQh5NFCUWmVmoGsHCZdALLIxkvnooMD5ip0MMgNO0vf
         JcF+/4CvLs9RY1iI0E7z7Oaz3NUb6TER/ph9qfo4VoCV+c5coWZO3sZJRmZmO9vSyZLW
         ngDixzGnD/Mv2V9jAwR+krHzGJZ1W8henxxzR0jPEb+iTEmLyVLel6dmVgmq9zlQVBxk
         A0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784800591; x=1785405391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4WCdFFh1fv8TYtu8+Es8SvOK/GtY9pgiFRGkpwNGHL0=;
        b=WAnjCUqfHRN78+P8eX0egzTobkoI7Cb3dLd7QlZ5u7+a2HiIpf04BWdcXXerp4Zxs9
         6qjSQgWfTgwGf+jblrRSptfUEIhDIQQnRmtWekq+3j7voAeGRjj76yv+/tqjUPDppAUq
         AU0EgWx8wlKhcYpTNaatXLjzRPTcgBI+6MO5eup/vwB/o6uPJiMcPV5UmvzK4YAHphhs
         UtHYQ7gXZzSaPwjHJRueago88QWFt/+JcsGYowRsYCFOyp/cpmk2GB6m6UzDiUwPjurz
         MVgotN3jnR7a4Lne1suO9itpB9lRBNYYhN/x3lDQyhFesHBfa9DasEPz3DvKFhUf1L8W
         ywSw==
X-Gm-Message-State: AOJu0Yxv6THMS/GEA2DNJEdI3XdR3xx2XCvL/zWUMaQl7IfEtJyX4sHK
	Lf1BLuclHn//b4rIm6/rYS+oQOkV+1mBQlCVxGfPl21hrqxqmeRlDWYuEMw0FCj5yycuh2/nHis
	K5T0AyD8dfijapebFpJowsanr4J5pEWZLTHhF90DIW/xWELlZ79jpbkULWQGhm3GwU6ZA
X-Gm-Gg: AR+sD10EU5+b5YCZ1gXbFlEup1+iY2dYEYpp24ceBjM+Xyy+Q5Xcvl/oOB1yxaHXJjb
	Z5XDlxDr5iu+wD90iWtULonoEgUPP1msPaCRWk3tbJPxy531zLml2x70b3lLcY5kGxIQPcUaz//
	KoLp6YwtJoNubsNbRB7otS+qG/6Wx07RMl3kZcekX0q0Ac1f/DHPOtgLuN5TDTdIupgM5HdUtZe
	9pFcGQGrqIbbk7Ol5MwL/1nMu/zDpYyc2MRh1UNPRum6DgNL9JM8kioXD01M3UQatdM/v+ARhT5
	cz/+ERAYrxs1FQkndkhaPxLYHKz/nzpv/yQ8fQATwW8kRkOVK0EQiXemfuJ3AqAUqPEp63KzYMY
	D+ZRVbbZFHCPWPZ6EikRAq9ntLz/ahWs2VwDB9Z0VMiR8xG90nZw=
X-Received: by 2002:a17:903:3508:b0:2cc:df15:91e2 with SMTP id d9443c01a7336-2cfa70b551emr21886045ad.7.1784800591076;
        Thu, 23 Jul 2026 02:56:31 -0700 (PDT)
X-Received: by 2002:a17:903:3508:b0:2cc:df15:91e2 with SMTP id d9443c01a7336-2cfa70b551emr21885795ad.7.1784800590594;
        Thu, 23 Jul 2026 02:56:30 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efa2cd0sm30392755ad.4.2026.07.23.02.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:56:30 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:26:19 +0530
Subject: [PATCH v2 1/3] arm64: dts: qcom: hamoa: Number usb_2 HS port as
 port@0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-hamoa-m2-dts-v2-v2-1-82254ac101fb@oss.qualcomm.com>
References: <20260723-hamoa-m2-dts-v2-v2-0-82254ac101fb@oss.qualcomm.com>
In-Reply-To: <20260723-hamoa-m2-dts-v2-v2-0-82254ac101fb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Q53iJY2a c=1 sm=1 tr=0 ts=6a61e54f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=mnwuuUzsHNIKvK2uPlgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5NyBTYWx0ZWRfX3F7b9c3L7eKt
 55g5UPSNgK1Q/UF9xZe9ax6a5ZisSsNHE9AaEJ8cFWUMvePwQE2rXLMjHx1tEyROihMKH+qZaGx
 93fFiW1kTyLU0JTK6ICHXs7e0GGftKs=
X-Proofpoint-GUID: VSe74-LARLFwvnuu3RkldInbqXnnLwyK
X-Proofpoint-ORIG-GUID: VSe74-LARLFwvnuu3RkldInbqXnnLwyK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5NyBTYWx0ZWRfX5giqo4o5m3SN
 AuXXVbT7uebBZh5q8EZ027yBX61sVpyX7iqy/hnWDoVVI3518xVwpQDVGP/fdiNLxxwd6z3FYhM
 3WSaHkE1rQvWfpC7ZOkpi08/21ppIk9BZN5HEtHpfgNzUWFC/iDVr2uvAe89GnhOt09MX1bZ/F4
 69p5H9FCGAV+fHbqkbQ/B+5c1lo/LM1qrWVl2CvUyYXFjDPDqGXG7NwtSbj6DBJUHp0dOqIVtbz
 QMAnBoT/MhymlERzacsNnk7rEH5znyBDYArOdq2eLl7dFwnNo/rYwIHUAwEBA+LITrhKNhAYzJg
 rna4iBkeFWdv4UMoTuXgeNOo1Hv5g/uKyFCdGyI/33J8d7fIL1ZxPoKSpfCUYpzbB9CGHd8A7Cm
 whKadKi4ORbBvhJgmiXgKCNXAr+0xJb+fhZeeek0CKFucSyuV5Kt//eYlaT3lL1gnxnJ38zzP2C
 hEY9a4nka6OnU4p9MSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230097

Assign a port number (reg = <0>) to the existing HS data bus port in
the usb_2 DWC3 controller, renaming it from the unnumbered 'port' to
'port@0'. This is consistent with the snps,dwc3 binding convention
where port@0 denotes the High-Speed data bus.

Adding a port number also reserves port@1 for USB root hub physical
port connections (e.g. an M.2 Key E USB BT slot) that can be described
in board device tree files.

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 09527dcf9576..833810470c85 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5134,8 +5134,16 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			status = "disabled";
 
-			port {
-				usb_2_dwc3_hs: endpoint {
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				/* High-speed USB 2.0 data bus */
+				port@0 {
+					reg = <0>;
+
+					usb_2_dwc3_hs: endpoint {
+					};
 				};
 			};
 		};

-- 
2.34.1

