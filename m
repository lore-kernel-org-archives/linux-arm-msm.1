Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DC954145D
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 12:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081906; cv=none; b=PJujgmlHu6CX7XYcdGAaAwCFJktFyvuyvBfpF9audfyqxOObF6p9V+R09zeBikl2dznm39YrCCy3kQOkQuKVgFGZKXYA2oF62N3ztngWorNIfSlErOKvaGojZdgL84IYX/KIsNxtWSzBYeize7spa46gdXKR2ts3X8R6vos3vXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081906; c=relaxed/simple;
	bh=ji7o4kGz34cmVqJOSJOjQ8rHVe1A4JqseoZChXshzjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ncxniQ4R6X2RY4fw0FWhU19dQhert1ZTY8cLJGmZV1xXzewS3KfCU9ISYZ9ZEIlzZWIrJSRfIHpwutTONIuogfDMwhtKL8zS7/+KD2RO6CgoVW6icz4RfgPxgl/PG9m0XlaDa2nXwM+sVl+wLk9vZMCTzUz601BlDsOCazo7abc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TYFN3Rj9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Viuqi7Yc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TYFN3Rj9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Viuqi7Yc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBP2fB1146337
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 12:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gdQOWdli3leTGKHPsnF/A7t0W6rlUUzFDLfpE5R26M4=; b=TYFN3Rj9nbYmcuo+
	CQZO2Gc0LDvB97lIWN2+3qtDKRNGrtPfoDup28dl+2vwoWhijk99Ou+GPl1OZbfF
	ZrYUHeUFuaKIMPbCPDKbSxy7V7pdM7dywlnvftb7mcF5RnJz70QSkURyVdNSGrrK
	4GTCT6psWzp2cQOa3dybij6E5NqQ0gHUarikEwfE01gV3L632efFU/BLG6/dodYE
	xIX1G7Brd83b959qzHs/hWo66EoFIc4rypgorleR8QjqO3DOIph2nHwmPzyewO6Y
	GUfAJj0d3W/B75woNe8MOG82i8PV4TuZRrRqQ+LDpR+UVHtoGwXLiIuKkCHLC1Bv
	bKA4qw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqycrjsk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 12:58:23 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-980882ce555so534114241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 05:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081901; x=1790686701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gdQOWdli3leTGKHPsnF/A7t0W6rlUUzFDLfpE5R26M4=;
        b=Viuqi7YcEKkLLqwJKhs/FXGc9Xl96cjx2e2wT05U7L3/VYvU9tXLgRW0nRejAMlN25
         fzJGQhHsSMCvB2LuIJqgX7u4ygQlLdOfuiME9O3WZ+rhmYzOE/4cqYLqm4QYEgqITsQw
         qIjvTj8TjzdUT/qgRKJdbvrDEg+bNcFWt3KD6ZUkvATFQoXTLdpj16rGvYprZ7m2BF79
         EadYeuOQcTlp084vSbMJTZl0vZhmNo1911bD1m+atSirue1DAic73z//k9V0XUAC3055
         Gz+jYxYopjQunRCZ0gQXFUxojLkxo8BUQKfoBlc1N5UpQFeyQddJYA42Sb5obyItBv1w
         +k+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081901; x=1790686701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gdQOWdli3leTGKHPsnF/A7t0W6rlUUzFDLfpE5R26M4=;
        b=wm7V4hyRmL9CeuYunBHNjA/ml4VAa3v40VJ15AUg7v6IVKEDD360HV7UqNhK7/DvZF
         Y+IDgWFSK1yw3Z3QWStsRR8+qt0j4pk1+sPaqWeu53gxARhm6jRrw7fzu2te9g0GIoUR
         Ao/KK7C53h2p9avoBx83U6RzNfnDEEvChW7IyY+kdvoUvXNTEU+mxIPbSDHkhJ+1c5M7
         pGwX/zJuLrrxau9ss493T/khBof06E5n6WVq0jtX5F67OuXilMt8RSKg51ZesqS5fw3E
         yOyPR3YXAPX6dIypuCpJUrPeRB49BwDnAztb5c6AIb+qCuDzZ0ezyR2noK/0zCChpZtH
         mGUA==
X-Forwarded-Encrypted: i=1; AKwUvBzI+n3x/AZdJXBe9Flbh0femOkKj3hjNs1z59EwOaWEU8v0JA5B+SNiorgk/jpr4bPoeq7CtZkQ2iN2OBbl@vger.kernel.org
X-Gm-Message-State: AFuF++nqxBkCb57geOjU2HmK+7cYc1FwM4HqubcgM8LhSWY/yCji26Wn
	npAVXrE6KNG7Ssc57snwlFnjFOLvC7bugcW46IoD/zqM+GLjCBMz6AW+IsAKnlnASzAfMDVIU3T
	7buSLATTW1sMZ+0pbR9ksqHyM8hdurpOMSzihpdb0vZ7+aijmY2iGOUnop5WC+K/P5QjD
X-Gm-Gg: AYBFou3x5pljCPlEVMoSPrXI/5WzLkJpxxSRhPMRPsAlQoX6imk3RGaJ3Hv8WmjiQZy
	XpuQ/9cYjJsXNo38ykk056m3myi5lJ08iZ4BbyABat4hdM/J+2oEDxVomq8J2InwGhlSrMsNA5p
	LBLiNioehSwQbai0ZsSGDFptULYB3VNkwpjJDqWpuTvTQnx6w6HXuErAKXPken/FKA/lhGdW9a7
	MJrFtPR2qdUfWszsV2nz9xOT3nrBmCrNi9uyhu76FbL1PsgrovtTATebrl897uhrgccXMaCc/f/
	YCA0gdL81JiYkNeq0AlL+nFgPgiSGO4pf8wDT+EASUtJ+s6ZrKhfqtLF3kYEsjDXJjV6rKNP7UE
	rXD8BwTSWdm9XprBUtqCznJ6RWo4=
X-Received: by 2002:a05:6122:30e7:b0:5c5:731b:11d2 with SMTP id 71dfb90a1353d-5c9b5941ac6mr8272803e0c.8.1790081901456;
        Tue, 22 Sep 2026 05:58:21 -0700 (PDT)
X-Received: by 2002:a05:6122:30e7:b0:5c5:731b:11d2 with SMTP id 71dfb90a1353d-5c9b5941ac6mr8272781e0c.8.1790081901093;
        Tue, 22 Sep 2026 05:58:21 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa4537b5dsm1097669a12.30.2026.09.22.05.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:58:18 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:57:28 +0200
Subject: [PATCH v9 13/14] arm64: defconfig: enable the Qualcomm Crypto
 Engine core driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-qce-fix-self-tests-v9-13-b1aa742e79af@oss.qualcomm.com>
References: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
In-Reply-To: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ji7o4kGz34cmVqJOSJOjQ8rHVe1A4JqseoZChXshzjA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsntBZe+g9nIUmEpjkGFYbi2XVnb0JwBoWcN0y
 jLA7FsjUqOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarJ7QQAKCRAFnS7L/zaE
 w1FGD/9zS9mD6MAL7sm4C/rsUcW5SvYKlJbCC0/J2T1qsC0SdU/4+x/En2iirGXcg8nK8eLFDR0
 URYFkpKH7sNHFAaAb/X6Fpnblmsd+qSLlN6UOaARP9SjW5QeVYQgACox15hWvRd1usp9uOXtUUP
 LLvI5fHP62PPWN7YwnYn5QRLhTEMzQeMO/eOeSrdYY1JteT/Jen6O4BY6J0/xvcPfYkbxv7RY+O
 npRSFYCxCk2/Rup6FEqjVN9jOukFkbopqOeU6b/iU62Icv/YJnia8FXsBBXWzUQj0swG8NBBZ1V
 PzaYFhv+0WVM/ASVixkxKCylm53ucCmu1iFcPjaN+36oocp9w1W9svt3d4prcqqnAr/RhcSvKSU
 UEsCMPY1++j0bv6DMfXRhv87czKaIDBr6qhPWMvd40FtxIihkWNwgcS/53gz3oZKKO+M/i3yeR4
 r/obEbKcDaSoWA8olvOProisSg1GaLf7AD7FochOcHD0EPAOk4p4sWhyXns5wic1C7P4EMgkAnZ
 A2Z8hkwBkUxtHvMoX/XLC9VlofEIlFN4Scbn45YB9q4w/pNDRmSO2fTy8/d8MwYtc16pw+4CNQR
 0YhTd73JZ0rCc1c63rNuEquGcfUK9sBMoqYhkVXYr2rgDsLMu6B0YF+vFBm98F/LwCYZFUUduO2
 3HAb86ZY2+UUhlw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: pvW6TGpatF2rpBsdtpS1HnmHVfnRa8tK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX0heLpig1SFAh
 F7XcjOX9CHo/6stBhCiYUq+wqXm7xvTHTATmh0v+41KS8HLxJ824270onskSjFPqxYYG5+ofPQO
 wARqYpRSWEMZ6IfPvyOvBvTczC4gy2d3ITu9JEO+sjyqdTa3ZIcw2O1gYqlZh2+uuDgIGUqYj0V
 nCE6yqeOxymJQvZ8cTfStxEZ/ICIlzTcUpsByTus95VF+zoY8pBUF9FrrmjhkMY9qkjhhOBA1Vm
 H/5ZOnVB6HZKG6NFzSuZj9r+JL2czLhInMz4N0KWlecXksfRZf0e+veDxI7sPOYsTdSZJUagmhm
 ZfQJ6DDzMr9Zh0acMZHNw9EbBJl1Jv6CrmV7KmpN5VHYo0A7iQg0vT8lap7e1DRwWKAas7N6pEB
 GNJ8VGk/TBsBcTbpY0TxZpY76MQ4Mect4VSOoH6aFGEO70Kq0v2iGFSTevKtdnW9egZm6G6lOYn
 ao/qSY3C9clcu0v2Taw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX4x4fRg/esKg2
 +EbiiA8ib7pPR1lqw81r8CHbitp26iYxyVUUiENtd6pDstkG695gSKvjlqhYNN4LT+jqPctT7C1
 CrAWawmWNQ33JPsAdPYInlayz8nvqbI=
X-Authority-Analysis: v=2.4 cv=c8I+0h9l c=1 sm=1 tr=0 ts=6ab27b6f cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=QftN5WpXeUmWSfsFEiEA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: pvW6TGpatF2rpBsdtpS1HnmHVfnRa8tK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220187

The QCE core driver should be enabled by default as it binds to the qce
device node and scales down the interconnects if no child auxiliary
driver is using the IP. Add it to the arm64 defconfig. Disable the
crypto part of the driver by default.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e80927f87ff26fe3f51db6409f509fb99ad614a0..760f9e9fb2ae13392563ade5de871a5e882d195d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1663,6 +1663,7 @@ CONFIG_QCOM_SMD_RPM=y
 CONFIG_QCOM_SMP2P=y
 CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_SOCINFO=m
+CONFIG_QCOM_CRYPTO_CORE=m
 CONFIG_QCOM_SPM=m
 CONFIG_QCOM_STATS=m
 CONFIG_QCOM_WCNSS_CTRL=m
@@ -1949,7 +1950,6 @@ CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=m
-CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_TEGRA=m
 CONFIG_CRYPTO_DEV_ZYNQMP_AES=m
 CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=m

-- 
2.47.3

