Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4514DE713
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646093; cv=none; b=P7Bu4+Uq/VcIHdp7c4lSj7yYS5BAeWNTdcEhU3WTZNeRsYLgmrooBp/h/cZK5rOBeCxOI5wvCmS7b6xpQItp0rGBkl6/nFsNG9vKB/PF4Lm7vEX6f31p3+5Nv7FlknYkVpu4IBq8lc0bS6zPDygLC/dIs29W8/SJq6+0tMn1m0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646093; c=relaxed/simple;
	bh=o5+5tvpe0ZPElsvDSlWdf0J/aKPzIjOAQ/3OGEfPAgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aiH7du5keU6/VTz/TcAh67x1iDmsr5DxahYnSRVLwSJZgMhJ7AzE9qbIdxqn4GnQAwVc9MFn5sJ/tLyYe2h2VAAzCdE75nHJTFInUrpea1q1MVV1UyeTpW8OpiGHWDjdWYPVk6cc/eSmqhOhmoFrqyJOBCUs8jtLNr0Ez+4vHls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fa9XRUS3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=an1IJ64s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fa9XRUS3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="an1IJ64s"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zc7j2410467
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZC54jYxJJtuuW78KoOpMV5NKoYluv61XVYUBsfKb3t8=; b=fa9XRUS33Z8gxgy3
	UfjfnRrJ+nlof8ovW8+nKgZGbWWhJiS1niw3rJ0aUhxf5hFfW4mJUoJRBf+eOuin
	ElmEIpkC+0wrVY4QkjMkXPmJtiXO5QRv6vbUFoVIT5IK4MqxkzlixFm2DGm06tWf
	osWeSRMjFej7jn2E0zw7po6ogOxnM0zsTJ5vEGpTVEmIELuU9lU/Blg6wCANTxkE
	byckj9CW60z4MnlAoPG9jAkKL4PkY895X53Sy9WAeKxNAZDLSLTb0qq6YIwbAHee
	7HAbO0dzvxSGKvbPXqq+VLssqMgr83jfMoPK+shCBFTpNO7cz8W6TUQycY9riG/5
	h+ny4w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdd6gmcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:54:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc435388657so1130858a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 04:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646081; x=1790250881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZC54jYxJJtuuW78KoOpMV5NKoYluv61XVYUBsfKb3t8=;
        b=an1IJ64sTZlH7ORh5g9y/QPR7d09lxTfm/dgUYrAebGp4viLkZVdOP+BVLJcZVPJbs
         qgd9ANSaMq+L18baz/TQJ3XF2ds4AKOnT63nr60uySRIVCvguClVdoKeMoB6XzHEDNYB
         B3AUhv2z/FO+Z7oxnZ1/oyFyPTYTjlcpkh5HkXkYoBkOfmuJcFmHqjOjv7GsgQE8TINq
         idAF2TQRg/5iLLY561BQb28CgDsfqAOx2KRUXazB/EWGJ5xBFpvbIISwSQo9XbVM5bES
         XypqwSbbDwfcAq36G+FHY18o4CttPImZJmAEByD/JWjOc4JoyRmc+Xyka7HH0pp88TIy
         L22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646081; x=1790250881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZC54jYxJJtuuW78KoOpMV5NKoYluv61XVYUBsfKb3t8=;
        b=SgW9t60SYbZb1r8UielbQUehjHnuUBJscTWL8E2WH+qJbj8v27y9V4o8h558aCKrXb
         zvNvPbRASrdNwxfJ0aPnHqt0XBYjNogX7kTaZG8l1eqlqNLD9vJxp6UqfB/447a5BbP4
         f7YsnZIbjE4YWLXLRXun5Cwv1hoXnsExz5XyyO/B1KOMU6zQNzXt4bJqRYR3tewusWfw
         2NZREcz612iNpapHUrWXYZUZc2R/A8QnR2fjsBVcmXqLHAfJoVHx++W8vX5eeGggHxz7
         qBFCrqVTAIi9VrKQf4LCTwqUPqaOyOCj8ejNUeKseAvgKq3TSpAzsxCMn2AVDVlD7JE2
         KFIQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6KxnffQM0ilIOWazEsi8ZYqOq9Uuqt42IejgqOmpOXDEGDWq6UvtIpR9rFWUq1ReHTmb0tG/xj1yQ3dCh@vger.kernel.org
X-Gm-Message-State: AFuF++kbAS9iE53h16dKGVqwRxrT12o7LLVrtXovU+qGQ/6VCclK/JrO
	BjFiSD7arg8zRe6S12NxIl4DnnkBTYg/nAzsv0iGeC+1yFINh/4DjiOTar6VSJyhgWRX6uGof+j
	aViGfifrm3d1YEdAwKWXYzzdFBdam2w5ZVlX4QjWEvG1e+ltPx1QgulENJmCrwbnIWq/y
X-Gm-Gg: AYBFou38pmXGWq43/W1uhUzv485s8r04bsqO6TvPMcbNjBF4SJYK7FUXg06wtpAg6RN
	kuCnOoyk9hggI+0p+jqqFQy/7EOqbRvz8OGLbKfvTIAr5d8PcHNXTKKOJwjjsHSEIO8lknroPWX
	kMw0TbhIflSFzL6w4CK71Y+CEoDL6Eh5b1ACHYcyKSbHJhdEyBbM79yudnRB6mtiEzSfvkO+faj
	0wai7ZBThPUwoF5g8YMhofVmwl7gqW2oisYgIM/16s0Iuxvus94dpbxeczdYA0LIO/uDI/Ae8be
	qd5MHaF2VS299r7uxHYNCKfa3x0xJNTFMBn8Ha/9AfE4hGJCUNsWI3DlhmGK7ut4O9dkX8RNVQc
	Di6KHR1hwG6wk/CCw2BPKBSkf3nUwoMGiEA==
X-Received: by 2002:a05:6a21:517:b0:3d3:ae0f:5269 with SMTP id adf61e73a8af0-3dd5f72b339mr16718029637.21.1789646080734;
        Thu, 17 Sep 2026 04:54:40 -0700 (PDT)
X-Received: by 2002:a05:6a21:517:b0:3d3:ae0f:5269 with SMTP id adf61e73a8af0-3dd5f72b339mr16717976637.21.1789646080323;
        Thu, 17 Sep 2026 04:54:40 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:54:40 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:09 +0530
Subject: [PATCH v2 01/18] ARM: dts: qcom: sdx55: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-1-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=966;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=o5+5tvpe0ZPElsvDSlWdf0J/aKPzIjOAQ/3OGEfPAgc=;
 b=Wzddv6EHdKemMLY4IIEjkKoiDG55j631UOXiqRlnlH4xAnxhjM8RLy3EEtX0Gb8sBQ93X6hNK
 mwCiT8gmLGJBgp8xO/YmYRqH7FilkLrZH1NQdvd4O7JhOhyG8XbRqxO
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 88AkiirKR5BsrG085fdZK7ue-PAr5xP5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX+iN09vypc3Hj
 OksBdZOpE+TK1boPSHmHSIg9mYYofObwSW5+4OG/gHf/lMUIwncVEMQbCIzGNZ8yzehsgw1ZRgy
 0DIv05bBj0K4OxObEKcsG4XJ5BSHm1rKUTZGvAvfzcfQYqF5iX5N1E2jKK1F1jJEzsi+8T9VXe0
 VsZD10y/WvpzOGVmYSPsIRoLgj6z8Y8T7LvhHeRFLk1LEqCgx4agPn1CM4cK/euVpFialLsbF7A
 vTdMYNJ763DYeuTvSVEiASoWv1mu0ccRqUAK30sraNnKaJPvKAcdnKBnG0Rehf09bsTO8QxXQ4A
 kt5BXiaDXspRRnA75C/E1Tv4z52Gr4ACV+tuUHgQ1gg6AZpH5y8mVubCCvv5Q9sKVTxahAj6iFq
 E9YhimD76C0tGHwCeoVgSBukWyxNJqzihMa3+uaTq+WlRDSyVr1FP+z+UJT1n64KFuL2s6cW8ks
 IusKSFySb1EgOsu6AgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX/14yUgJp8OaZ
 soRsGPKXNx6OAITkwK3AsxwX7PagK1skumTNMKGGur3K6vMKqEDUtVxDI8oz7h9i1Tdh+X3g3VG
 OH0zkwbIsHbOrAdmYnTEExeeWX6/+kY=
X-Authority-Analysis: v=2.4 cv=GeOCDgXL c=1 sm=1 tr=0 ts=6aabd501 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bRpLjHfgeuKP4GRv53IA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 88AkiirKR5BsrG085fdZK7ue-PAr5xP5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts b/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
index d23b8ec08af4..0443a86899a9 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
+++ b/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
@@ -249,7 +249,7 @@ &pcie_phy {
 
 &pcie_rc {
 	perst-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 53 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie_default>;
 	pinctrl-names = "default";

-- 
2.34.1

