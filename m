Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFF5364933
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 06:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789368260; cv=none; b=laXTRANdCs+EYnj+MEaRy608F7SJErMsMjDu+LG3dF8AwaP5cLcYYgGo7D0EzV1wOL/A6QAS2JZWSKhIsmN4e+/6v45Ry9p64LTjcOmZcnjQiEk9V8NMF7jvizSYsa7WaimUSP4FO6PySxehpWsBzPIe6Z8EbTNMsHZLjrKyJHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789368260; c=relaxed/simple;
	bh=ljTerAYY+aVCk3KCGV9fckYvKupvzyRx5lbCBFMOytI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ug5D08yBWsudplg3EgwGMWQrgiAE2Et8c+c0JVZ3fhSc0LSjggBMoRxc1dpl7pIeQ0Y0AagiGAGb8qy6ypgs6qIniKuPP3/XXBDpoYBD1urqSGa3RdGMX2lXj+QmtOfKD0NvOZfn53XshXW70L0XtmTwumVlFzuboB3AFuaW2cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RTlbJAtm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HY9qN0HQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RTlbJAtm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HY9qN0HQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jAWd543533
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 06:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WitaMeezpBH1+dWiRPc0ZrIoLT1qoUbaF0kcA/pSPBY=; b=RTlbJAtmeuWa0XdV
	d084RSUjFGBMQSZg1aD01jCWQ4u8eHSG8W3D5/Mgoul6OR6qF0OSj4cFyFodhhDO
	/APeMBIwaEU5HY9/f1cwKFNOGR5zeB8ILAZFdRny1YwgC5W6LUn4CeE41W0JbeHk
	ooBoI5zkKglhrhGw7FiZpHg7kYEtxqHpwn1UvPD34nDm/nlR/xXsysz4CHhMTNVX
	7I4wt1EayYD0elOkYmRrRw8JLEnmcrJ54nmDtFxa6cBtXzcaEkyRQUYe1Acui+R2
	XY03OIW91nvLILfPTSi2pj6BBWgdUKjrulcQ6kZaoDPjgVkzGlTUkXjWWa+sVVuT
	fWZjAQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k0970b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 06:44:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93903622880so803801685a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 23:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789368257; x=1789973057; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WitaMeezpBH1+dWiRPc0ZrIoLT1qoUbaF0kcA/pSPBY=;
        b=HY9qN0HQmi8ErSGSMk8fCLTTcZLkClIPLj1ORAIWpH281Z8p4FdX6I7miWoTEVi2mm
         XaKf8UY8+Y1Oe/OL4262cnhwBp8qfom+Tzpz1rqlywpMQ1C5gbTRnHvflXrel+iPtNen
         EKmVVOGrych7PjbiujRxn6l4xzByDoFLKc5WCaLon8uug35hZRY0GJ448qGYgBJCLPBv
         6AqH5MJyIGxTHS7vg8GBSiqzqr0iybTPn7PYapy97Qruu0EEe5RHBy6KiMrEwVpB/dKn
         Ii/fsUVKZAQfqSNscqQnUdK/ViExWPwKoHxXseYF4zql9uF33hN6YBWD3g0xRsS0grD2
         5c5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789368257; x=1789973057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WitaMeezpBH1+dWiRPc0ZrIoLT1qoUbaF0kcA/pSPBY=;
        b=fEvu79AGopG1XHpSkIjSdj8SaZ2I/+0Edmz89W2mzYiGkOAjJykihGecEfn/HJ9KDn
         lXK//xex/meVSiSD3fsI+2EPFi5p8gIkCzIjBhBiEPSTBc+JNkFXnf+JeEx6s7C373T9
         rM6EAX4L9NQXsa430DQAt7af1M31fBxvbNubRfMDNpPJY+wDUMk+WMxFnljlmWFCqGfS
         ZT5jwrcxC6ih8ibo4iPxl9M12ET5VKrDchrM+GcIsIbv+8dkQ81oc9it/xDsfvdxrRPy
         UizsyTUBvfT6+YNrXoxWnoxIkd/yr2TeLU+Rd3seiNJ6MwscCKX1zptkoj39Tu0DUpZ8
         WL7w==
X-Gm-Message-State: AFuF++ncuSUSdZe5VCH8GkXe6QuVJkJnhKnSvUEN88db+dHBE5/rApQx
	0aD+dE09DPRQ0rW8HMc0hfNGXbZrUjjjPxztzeWdJxH92q7PhztuAWe1UMcsjnqvRwM4+AZC7bL
	zk0gREDT1CcpsB0JM85VAnw0yF9qRkjiIwrvC3885nbVKmXLPnBB3OK2pSrgwgqo1ZUQk
X-Gm-Gg: AYBFou0jyOCRBIoju6I7DtXNBnOX/NbACFHrJlWGQ03JNkUg8HXBbRApbsnlukLOhMu
	C0bVhNAUSiKk87jkzt2ao6oQRARpOANFF7oeA9a1NaKGbpKCnwmePNc7mOFnjTwddEktZZVpY80
	+XDMJ2dwdUokaQa2ClrmKPjHy4q/dmkiAztVMp+QZQcGQzUIlEb3QvE6owWKOt8mN38bSdIBtq2
	d6Lt4F8eY6FiYCasUPRerjWMeVjAZEfnxWuvTAerVRc73uelvEJr7RUMiQHWLw1Ue7IwM2j3H3Y
	CgkaHNoCWtMVfoaUF+IRjo4yQAYAFe8CaLLtqCTkimpMARhmBTqwuP//vpQxQDa7Ek5r/AlO4lw
	ohW4HeHBbYv3Xid3yiSUz7kw=
X-Received: by 2002:a05:620a:4492:b0:939:72cb:bae5 with SMTP id af79cd13be357-93a1870d2f8mr497125185a.28.1789368256741;
        Sun, 13 Sep 2026 23:44:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4492:b0:939:72cb:bae5 with SMTP id af79cd13be357-93a1870d2f8mr497123985a.28.1789368256212;
        Sun, 13 Sep 2026 23:44:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35f3d9sm23736954f8f.35.2026.09.13.23.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 23:44:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 08:44:04 +0200
Subject: [PATCH v4 1/2] interconnect: qcom: Make important drivers default
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-interconnect-qcom-clean-arm64-v4-1-5b2c0e6a929a@oss.qualcomm.com>
References: <20260914-interconnect-qcom-clean-arm64-v4-0-5b2c0e6a929a@oss.qualcomm.com>
In-Reply-To: <20260914-interconnect-qcom-clean-arm64-v4-0-5b2c0e6a929a@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=14008;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ljTerAYY+aVCk3KCGV9fckYvKupvzyRx5lbCBFMOytI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqp5e7k/j3nw397nSk996rnyp72nFn1AZocJqwE
 UbxaKHazoGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqeXuwAKCRDBN2bmhouD
 15RpD/41g8/8E6cdfGexJFjbiUXLpSrIw8q6lKBHrG89q7JKVk8kJ4cIVy1/due6ifScSYeY1wl
 0iqbqRfQ1Lsukl+ZSx19gVZ2ss3GVrcZnLk8sdzTtnKE0vzDa+sx6wwnPkOuetYx3Fmt+c5gEbi
 /ir7RCL75lDR80Gflcv8EvpScCUOHuVWCIXYRKC5JYaSazVSJAaayQfIWzjQ6UALxrtdcR6+3/F
 9NmQ/Mm1uaVy2cHyyOZSiGOP9F4Ie54L4uJFCVtn/vGNCPx/I8IO9JC9bo7wWtJuzCz7Dj8F3N4
 n+Ui11hCBCwOo3sCqegqNylM2L9loebmWGwqrKfagd+q8OLZHUWU+71GOKsFgBTZKw9hqCiOxIB
 zQNuYbXykJ0VcV2+1yNrZSTpgFWH8eLSAz5nU6jEpz1evKBwVDfmhaHg0yC0q1CxFp1aI2RgaBI
 W2PoGEvWxwAgk3/IKTHXICaLY4KRUtWJ2Z9xAFMJ/7w9CRbDbNLh04GoUo50W+4OT5WjH1MedT0
 rD8PgWR9uSq0iAqPOZPqdJpHaNHUo1YhV0OjONI1rCa4rI+nRShNvHKYD8SZIFxZUsT2GvPfHaG
 E3QfW3Vc5Xe23rcz9ndehJrhnN+y9TDi0eGJvNe7URPR7faU4mPByhWgblbWCtW/8LDHu5lTf1e
 DhzznLYc+Uovw/w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5NCBTYWx0ZWRfX7Xa9qcscr13d
 BSoAkseatTh9RpG3XkaQNR0+FChnVksv1ZXAkzzb+m5kqguFeNU8ItUWagaZm102jBmg4yRmXJT
 /kEWfoPmLl2kWCbrspoSsgpikxFXBg8=
X-Proofpoint-GUID: 05-JtnXEi1JUFLEg93bLsJCCRfR8fJhu
X-Proofpoint-ORIG-GUID: 05-JtnXEi1JUFLEg93bLsJCCRfR8fJhu
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa797c1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=SgRPkAPvXIXIjLLMwDcA:9 a=taea6FrRQeRdjhdT:21
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5NCBTYWx0ZWRfX6tAMoxM47wX0
 t2XlZbi8rNDmvvia7GAT22dahXoW2Tl8SO16Jq5X7dflOdTrjsK7QrWgrKv1DioJAmNQSnIl3IS
 dy8+/UdEDwdG7Bd7sNFOA3u2jc5qHhz+qrwXua6Iy8SR8lpdvu4m97bWJtsjrhis6YaooRTVn5T
 yrG98qqYNXBI6gCii7pPCJeVrFZWQrYHhuBKhJYTDw1s0bH8wfl4+qElalB1RwHB4BztwK7oyor
 gRTGKBsb0ffLRlS9woMUVdKl+ny5VsuFBmunB8X+85KBRQZkbOAOoFhMubjFDLCs6svNrVeqQ+s
 lAc35RzFZVVHrZxv1gpseJJ/k8R7nk4h5E3/bDrFd4cIJlSTmZM9NgHbtOSFp1Az8EPlEoMBzQD
 FaAYA5c7h4g2SjAeQ6CnarFxICvYywlVnPS2SAEiQQDTSakUYZi9sT+bj25KzNlv2GigwKmIuSR
 UMnsrlh2WLkiA6okReQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140094

The interconnect drivers for Qualcomm SoC Network-on-Chip are covering a
basic or fundamental SoC feature: bandwidth management between internal
SoC blocks.  SoC can boot without these, but power management or
performance will be affected.  These drivers do not represent any sort
of buses visible to the board designers/configurators, thus they should
be always enabled, regardless how SoC is used in the final board.

Kernel configuration should not ask users choice of drivers when that
choice is obvious and known to the developers that answer should be
'yes' or 'module'.

Switch all almost Qualcomm interconnect drivers to a default 'yes' for
ARCH_QCOM.  This has impact:

1. arm64 defconfig:
   a. Enable as built-in INTERCONNECT_QCOM_HAWI, INTERCONNECT_QCOM_NORD,
      INTERCONNECT_QCOM_SHIKRA, INTERCONNECT_QCOM_SDM660,
      INTERCONNECT_QCOM_SDM670, INTERCONNECT_QCOM_SM7150 and
      INTERCONNECT_QCOM_SAR2130P, which were not selected before but
      should be, because these platforms need them anyway for proper
      functioning.

   b. Switch to built-in from a module INTERCONNECT_QCOM_QCS404 and
      INTERCONNECT_QCOM_MSM8916, which as modules would not make the
      platform bootable in most cases, and INTERCONNECT_QCOM_OSM_L3,
      which when module might slow down boot considerably by having
      caches running at slow speed.

2. arm qcom_defconfig: Switch to built-in from a module
   INTERCONNECT_QCOM_RPMH, INTERCONNECT_QCOM_SMD_RPM,
   INTERCONNECT_QCOM_BCM_VOTER, INTERCONNECT_QCOM_MSM8974,
   INTERCONNECT_QCOM_SDX55, which as modules would not make the
   platform bootable in most cases.

3. arm multi_v7 defconfig: Enable drivers necessary to boot
   ARM 32-bit platforms, which are already enabled on qcom_defconfig:

   a. Enable as built-in INTERCONNECT_QCOM_MSM8974.
   b. Enable as modules (other dependencies prevent from built-in)
      INTERCONNECT_QCOM_RPMH, INTERCONNECT_QCOM_BCM_VOTER and
      INTERCONNECT_QCOM_SDX55.

4. COMPILE_TEST builds: Enable by default all drivers for arm or arm64
   builds, whenever ARCH_QCOM is selected.  This has impact on build
   time and feels logical, because if one selects ARCH_QCOM then
   probably by default wants to build test it entirely.  Kernels with
   COMPILE_TEST are not supposed to be used for booting.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/interconnect/qcom/Kconfig | 40 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
index b3187acf90b8..d6c37704be03 100644
--- a/drivers/interconnect/qcom/Kconfig
+++ b/drivers/interconnect/qcom/Kconfig
@@ -2,6 +2,7 @@
 config INTERCONNECT_QCOM
 	tristate "Qualcomm Network-on-Chip interconnect drivers"
 	depends on ARCH_QCOM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for Qualcomm's Network-on-Chip interconnect hardware.
 
@@ -14,6 +15,7 @@ config INTERCONNECT_QCOM_ELIZA
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on Eliza-based
 	  platforms.
@@ -24,6 +26,7 @@ config INTERCONNECT_QCOM_GLYMUR
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on glymur-based
 	  platforms.
@@ -33,6 +36,7 @@ config INTERCONNECT_QCOM_HAWI
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on hawi-based
 	  platforms.
@@ -43,6 +47,7 @@ config INTERCONNECT_QCOM_KAANAPALI
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on kaanapali-based
 	  platforms.
@@ -72,6 +77,7 @@ config INTERCONNECT_QCOM_MSM8916
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM if ARM64
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on msm8916-based
 	  platforms.
@@ -100,6 +106,7 @@ config INTERCONNECT_QCOM_MSM8953
 	depends on QCOM_SMD_RPM
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on msm8953-based
 	  platforms.
@@ -110,6 +117,7 @@ config INTERCONNECT_QCOM_MSM8974
 	depends on QCOM_SMD_RPM
 	depends on ARM || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	 This is a driver for the Qualcomm Network-on-Chip on msm8974-based
 	 platforms.
@@ -130,6 +138,7 @@ config INTERCONNECT_QCOM_MSM8996
 	depends on QCOM_SMD_RPM
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on msm8996-based
 	  platforms.
@@ -139,6 +148,7 @@ config INTERCONNECT_QCOM_NORD
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on Nord-based
 	  platforms. The topology consists of several NoCs controlled by
@@ -149,6 +159,7 @@ config INTERCONNECT_QCOM_OSM_L3
 	tristate "Qualcomm OSM L3 interconnect driver"
 	depends on INTERCONNECT_QCOM || COMPILE_TEST
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Say y here to support the Operating State Manager (OSM) interconnect
 	  driver which controls the scaling of L3 caches on Qualcomm SoCs.
@@ -159,6 +170,7 @@ config INTERCONNECT_QCOM_QCM2290
 	depends on QCOM_SMD_RPM
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on qcm2290-based
 	  platforms.
@@ -169,6 +181,7 @@ config INTERCONNECT_QCOM_QCS404
 	depends on QCOM_SMD_RPM
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on qcs404-based
 	  platforms.
@@ -179,6 +192,7 @@ config INTERCONNECT_QCOM_QCS615
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on qcs615-based
 	  platforms.
@@ -189,6 +203,7 @@ config INTERCONNECT_QCOM_QCS8300
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Technologies, Inc. Network-on-Chip
 	  on QCS8300-based platforms. The interconnect provider collects and
@@ -201,6 +216,7 @@ config INTERCONNECT_QCOM_QDU1000
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on QDU1000-based
 	  and QRU1000-based platforms.
@@ -225,6 +241,7 @@ config INTERCONNECT_QCOM_SA8775P
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sa8775p-based
 	  platforms.
@@ -235,6 +252,7 @@ config INTERCONNECT_QCOM_SAR2130P
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SAR2130P-based
 	  platforms.
@@ -245,6 +263,7 @@ config INTERCONNECT_QCOM_SC7180
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sc7180-based
 	  platforms.
@@ -255,6 +274,7 @@ config INTERCONNECT_QCOM_SC7280
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sc7280-based
 	  platforms.
@@ -265,6 +285,7 @@ config INTERCONNECT_QCOM_SC8180X
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sc8180x-based
 	  platforms.
@@ -275,6 +296,7 @@ config INTERCONNECT_QCOM_SC8280XP
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SC8280XP-based
 	  platforms.
@@ -285,6 +307,7 @@ config INTERCONNECT_QCOM_SDM660
 	depends on ARM64 || COMPILE_TEST
 	depends on QCOM_SMD_RPM
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sdm660-based
 	  platforms.
@@ -295,6 +318,7 @@ config INTERCONNECT_QCOM_SDM670
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sdm670-based
 	  platforms.
@@ -305,6 +329,7 @@ config INTERCONNECT_QCOM_SDM845
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sdm845-based
 	  platforms.
@@ -315,6 +340,7 @@ config INTERCONNECT_QCOM_SDX55
 	depends on ARM || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sdx55-based
 	  platforms.
@@ -335,6 +361,7 @@ config INTERCONNECT_QCOM_SDX75
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sdx75-based
 	  platforms.
@@ -344,6 +371,7 @@ config INTERCONNECT_QCOM_SHIKRA
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on shikra-based
 	  platforms.
@@ -354,6 +382,7 @@ config INTERCONNECT_QCOM_SM6115
 	depends on QCOM_SMD_RPM
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sm6115-based
 	  platforms.
@@ -364,6 +393,7 @@ config INTERCONNECT_QCOM_SM6350
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sm6350-based
 	  platforms.
@@ -374,6 +404,7 @@ config INTERCONNECT_QCOM_SM7150
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sm7150-based
 	  platforms.
@@ -384,6 +415,7 @@ config INTERCONNECT_QCOM_MILOS
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on Milos-based
 	  platforms.
@@ -394,6 +426,7 @@ config INTERCONNECT_QCOM_SM8150
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sm8150-based
 	  platforms.
@@ -404,6 +437,7 @@ config INTERCONNECT_QCOM_SM8250
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sm8250-based
 	  platforms.
@@ -414,6 +448,7 @@ config INTERCONNECT_QCOM_SM8350
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SM8350-based
 	  platforms.
@@ -424,6 +459,7 @@ config INTERCONNECT_QCOM_SM8450
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SM8450-based
 	  platforms.
@@ -434,6 +470,7 @@ config INTERCONNECT_QCOM_SM8550
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SM8550-based
 	  platforms.
@@ -444,6 +481,7 @@ config INTERCONNECT_QCOM_SM8650
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SM8650-based
 	  platforms.
@@ -454,6 +492,7 @@ config INTERCONNECT_QCOM_SM8750
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SM8750-based
 	  platforms.
@@ -464,6 +503,7 @@ config INTERCONNECT_QCOM_X1E80100
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on X1E80100-based
 	  platforms.

-- 
2.53.0

