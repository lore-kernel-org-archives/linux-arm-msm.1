Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8A9369D7C
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920684; cv=none; b=MugWQsEJ4VMLaz2AXRKoqz/k7yvjVEb6pg/lFn+0kVCCbh2pvZNts7FIEf0JmkqZrKGSScZNK482m7H4D9wOoU5JtkDWqw3X7HoiUuSPaxDg6lXKI+g6W4npOlDmfzdlYqFNZO4R3dw/uH5iopH9DvlnQu+MhEwYI/0uE+qhnEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920684; c=relaxed/simple;
	bh=k7NXXUi0rpXL5Z02GeSpR+IuI5phx2Hx5nLBYaWCYd4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kquBhDpjW+vCjlzdO++/DYVQW/EP9J/Ss1Nc2rPcp3ToJV/jx9e2GU4quWW9gXmaysowQV2a7u82lGvHzmPN18vH08h9M8cEa6nRQW20XpQizhwfjoMIi/fPpQv1usPaGMq3qRzCw3+je/F6SET5dkIuB43G0rmMsS6xKjh1iV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a2aIZgew; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EoKpNhD1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a2aIZgew";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EoKpNhD1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7H2r2167542
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rgkV4xL3/iQYCcwz8bH4iOk0fTyVyhjY8B0uxqSBNRY=; b=a2aIZgewjJIZPCyf
	4rnBcwWgWCbs8XWMw3PcxokmsMPTqVdzS5Vh7cbE8PpMxdFrcdrCsuEmgCfasri8
	lvYC9wuoHVah5IkhK4v0UKc6lmbxLeQHssiW0SuI/QbfTFfkXaEumAO8WcKIrP7A
	mURVkNWbOO8zwwrRnPSQzc360/acVlK1P3bb8FyITXmXy5QN8NXFXXjtwduR/RpT
	R6IwlYm+bzGcS0ENtMupZRGWo1vawl7umo3KZBRuJi8Lgh/CJzAzPT+OmdoYFOL1
	FcBH5KqjQKOcYPHTleVFK8pNNn12Q19DzD4KlHm9VAiXQarBz4mI28P7ypku3Mra
	ILBCdQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb6h0107f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:37:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d827597fbso11925161cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 05:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787920667; x=1788525467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rgkV4xL3/iQYCcwz8bH4iOk0fTyVyhjY8B0uxqSBNRY=;
        b=EoKpNhD1WXr1tJ0f4aWhcp6aHuhMqoyz1gm+fW2TZxZdmotyHve+jO+qFIcZbd7iYM
         IcPaI8Gl3m3oYtLAC347C8fmgzAwYe8/8gvvJqJ1nRQTGH8ylKBldtf5WQFdjbcmYqyE
         ODGdv3P5F8BKodcC3UPX+lF4bxIb2igTj9537+pXFvQLBIzcfhOsmmQwjaK0bCoqhquT
         d/Mn/QMSn9Ao7rXNQkpDtnxpPjjFaGQyr3CZOk1NKKtlt96eBfW2dbZ6yPun+rsUh4Af
         eiNf4xaQww4iG69wxEdOkX/VXvhehGzNDlkzWVD5xOeR1aTk6YCmxa5KGsyxFPNqPphr
         3Pig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787920667; x=1788525467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rgkV4xL3/iQYCcwz8bH4iOk0fTyVyhjY8B0uxqSBNRY=;
        b=GRVqP15JWMyU+ZnSzLVOh0ZXkX4Oz4kmNCbP4RE7UYGkAwwQm5SrK05WbHH+OUTikv
         vw9041NdP2DvemPP6zbTR0tn9skaHm1bP0Yn7efdH0VOH2xR7c8tQVTdMT+btUpPGUOy
         fw0PBZXijDuWscJswT3Ujrmw77AlqCxvXYNS3MU2Myt9hPMnEkOczEi43ln3/QlYVFdM
         bzdLC+Rk3gbvBOBM90Z1dDfmzBjhY0Kr0oMv//I7EA7bQ5Ag+KO513R3q8tZYVnHQw0F
         96dLS7/2e/2DMORSg5ZH+YzO353roc1Uani0tfqY9majQWTBpzWOe16DD9ECYjuFBs4G
         nL1g==
X-Forwarded-Encrypted: i=1; AHgh+Rp/CMiFXUG7sBGug9cOCdEVjy/niJuGNGpEJWNWos7jlNf7NhkUERdiAm2ZKjjzBXXOQ6XLGFJ48v2BIsrw@vger.kernel.org
X-Gm-Message-State: AFuF++nYFrbSGeRBYGGtX9Ty09r+6jCgMqShqagS3r+E3gQ1LJmNzmEH
	n0uBPjTUI6TqaGg+840icEKSa2nOj+EoqskkTZ2sm14Hi+QiYQQLUZWlb4DZwd+CtLHT77cCosb
	+vIh91goe1qHCzCsfCVxb7S74Q0PO4TDef+EFQ7AaacWxx3cIJP8JRUXj/cBM5sUb2oJl
X-Gm-Gg: AR+sD113C1lu+znZGVg3euPsDI3CkldZ7emDhYJg87eGiAMlLNsBeLA05/+yXT2cPT2
	eTp3WLp9ZkhyYW/ayERIy0mfxq9c7lE1tQt6+Rnz5xIMWzis2RfDuJIuzizvWB4fKsM+7DwXWE8
	LOIEJbbyua++Nvi2G0b5kTtOZaqrjI0O0I84Q44TvhS7rfv3roTpnvpz2za0xoJH7V242hUuhcK
	v9YWR1qr6qvdgOWHXStXiPD56QbRMWcRHHXQ2JAU7h7ZMFpeD/UNdCh4fvwIb0Z5IDrsfQAhPFD
	p/r/wISWxTcoWDnUoJNdKrgO7t8di+AEX7zpp4IadDSawJ0zRxts/EeYexjzrQjnx0PlrBaPceb
	z96SRdQ8=
X-Received: by 2002:a05:622a:608:b0:52f:b37f:35c7 with SMTP id d75a77b69052e-52fb963ff45mr71247071cf.23.1787920666980;
        Fri, 28 Aug 2026 05:37:46 -0700 (PDT)
X-Received: by 2002:a05:622a:608:b0:52f:b37f:35c7 with SMTP id d75a77b69052e-52fb963ff45mr71246291cf.23.1787920666299;
        Fri, 28 Aug 2026 05:37:46 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92671c0esm39338965e9.2.2026.08.28.05.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:37:44 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:37:20 +0300
Subject: [PATCH 01/11] arm64: dts: qcom: sm8550: Disable Inline Crypto
 Engine by default
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-b4-dts-qcom-disable-ice-by-default-v1-1-1d6e0c2f5a69@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3851;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=k7NXXUi0rpXL5Z02GeSpR+IuI5phx2Hx5nLBYaWCYd4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqkYEK3fT7277ogGYVlek38+n2Wk0f8qqjjnTKU
 I+G1J2TUT6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapGBCgAKCRAbX0TJAJUV
 VjnwEAC9xz4m/nQ3nUssVZ5X3AA0Q5F//uGIUnE4UkUNoyfRUSMHje+pHnIVj6IcFEtH1ijjccT
 dQ91XhM60V34lJJWufHvUGccfvUZKJtF5mMHPbJUuNyvzexONT0wKBEj0bmzt5rrlaDlVGeeSNq
 fG22zKuusAn5noYA1whBykbGYGxWg1ydzJQvdU/mSM4eO29hOTeKpB1jfrH3UopvCrSPXV+XTvN
 9Texhn9+cta+H6VTAmiDEfLj447x83OdLfTo4QJIupK60IUpKHYm7idln9QmpDVUDkgiCdVnsoZ
 adKpaYtmDp/qjtq4d0aTnstv+jKqkQGrj21EoDqShwGXV65Uvr/fGWxlqy9dOSjmJbT8JiHrnrN
 SYb89kY+a4gwBJ8Y8aGXDHHAO5WsOAc6iw8yRAuOzOWhhzkb6MIj6uM1Fyp6nnXauNJH4UF6me+
 JCPZ4Mj9WUjRgxPcEreg9ZdmpCvY0Oc2EZ8s14tybcD9lSYLIDMl0FAaH9MHZB/egAoK0KRJ+6i
 0yOyJlpfpSaVyYDfdLSuDDSuYUt5m8dlU0JQeufE0Vw79G1SZMdKtAs/rJFHNfzXOQTL8DoPI5R
 XTh4q8xxdfD8rZLDip0r1uyjJkh4ENxnim89FNLNb1oo1AOnuYJrVOklZKXNNku5AEQa3PJg3i/
 RvzAha71s2n3uxA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: ydXw5c3LC9mSnEVOWgVBoBL9rfd6po8a
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX+Pfq52ZXixaC
 IPgaIYO/a5v07MsCHF2M/ija0aG2voH3m8XzYolbreazpUwIOFQVUJNFJ13RAlxX9DPDx/0q3cd
 0yKkNzD0PlSW72/3Jh+96Nn83prsOIk=
X-Authority-Analysis: v=2.4 cv=KPpqylFo c=1 sm=1 tr=0 ts=6a91811c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=4GAT0stK_T4jbStqyDUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ydXw5c3LC9mSnEVOWgVBoBL9rfd6po8a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfXyHx2UNTuvLQX
 Mobdv/ySpzGZIduAAJPmY9+F1mpHc4Hw0GZTnnYISL3B/YoVhw4HjW6oN9yPCih20yRYFnSbUKA
 5GoVe5TrmLpvg0i7ILu/WS6TxZm86IlX8TJ90u2DSXjp+oT6IF0rlNYvqG4vbuesRji60ZarF4R
 6KjcVun9DUZVB+/mOG6cy8VDpU0FY/ch4ZqR2oCuEcnn/iVVXttrjJoXoQIOhb3Fx4p279LG4b0
 I240N5J8yMoTO94xNqmZNVk8zp23HWcVCUcspH2Qltlaoa2SgpYym4Op0vCzlzLxvQ/WlDWJQMo
 pa8E1gZbjzwjRfdcaidtuitIIoQC+sdkX8Sau4ckmEhjhGLI15zOc0KKbdTDwpema6ZDyUrgJuU
 nVowbQDK8Y4a5YkoBUlVPWxRKZre/PBePkjZO9NSUyVdWcLdjv2XmsyOKJsSvKc4XHJyKXDa6LA
 XBz//Y6RHzfv+Mpo4BA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280109

Since UFS_PHY_GDSC is attached to the Inline Crypto Engine and the driver
does not currently enable runtime PM, the GDSC remains enabled while the
device is idle, even on boards where there are no consumers.

So disable the Inline Crypto Engine by default in the SoC DTSI and enable
it only in board DTS files that use it.

Fixes: 52696dbbe7bb ("arm64: dts: qcom: sm8550: Add power-domain and iface clk for ice node")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi    | 4 ++++
 arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts    | 4 ++++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts         | 4 ++++
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts         | 4 ++++
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts         | 4 ++++
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts | 4 ++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi            | 2 ++
 7 files changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi b/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
index ae301d78e071..ddcbdb1b9fca 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
@@ -326,6 +326,10 @@ vreg_l3g_1p2: ldo3 {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &mdss_dsi0 {
 	vdda-supply = <&vreg_l3e_1p2>;
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts b/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
index 9df8dcd6c62b..da460474fac0 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
@@ -998,6 +998,10 @@ &i2c_master_hub_0 {
 	status = "okay";
 };
 
+&ice {
+	status = "okay";
+};
+
 &ipa {
 	firmware-name = "qcom/sm8550/ipa_fws.mbn";
 
diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index 82fb10ed6b6b..cf4821716f27 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -1024,6 +1024,10 @@ &i2c_master_hub_0 {
 	status = "okay";
 };
 
+&ice {
+	status = "okay";
+};
+
 &ipa {
 	firmware-name = "qcom/sm8550/ipa_fws.mbn";
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 7c634572c6b7..f54cef78292b 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -672,6 +672,10 @@ fsa4480_sbu_mux: endpoint {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &iris {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 473ec4e27daf..e26c37ee5bb7 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -903,6 +903,10 @@ fsa4480_sbu_mux: endpoint {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &ipa {
 	firmware-name = "qcom/sm8550/ipa_fws.mbn";
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
index 81c02ee27fe9..3956941b21bc 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
@@ -509,6 +509,10 @@ &i2c_master_hub_0 {
 	status = "okay";
 };
 
+&ice {
+	status = "okay";
+};
+
 &pcie0 {
 	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 0e701e709235..a2bfd857f3fc 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2840,6 +2840,8 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc UFS_PHY_GDSC>;
+
+			status = "disabled";
 		};
 
 		tcsr_mutex: hwlock@1f40000 {

-- 
2.54.0

