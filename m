Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7872E4CB8A8
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885516; cv=none; b=RvJbB6dLoRDnE7A1SlcAGx3N94ybj79IhLURSi+o/8nLQxpTzA73Q2exHGviOspINXTX6gbyAoYywsHFO300xdDH1c6IgMiiavpUgly21uUmQKPC8KMaTDtRyPi3FA/wqS9IoxUHxHzcbpo1Q9iYCDsuAwxWDTb0riSUnaAJJTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885516; c=relaxed/simple;
	bh=u/6qVzma3542MmAylBgsBrnJNBm4ZVIQqalwqVJoX9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s3sRJQ6tycI1TmwMr1AnfUvPphdFJSgkdkjgIrOa7F4r6zsoPYla1wSyI5Dc5l50eocebln0UyD0MHplA7kEyvoBGATHRGgXktKM0gIlNly65sK6TTxfFjpI7R/PBHQa2nL9jCq4MKybYUE8Kx+48BoHDQhlwi81q719mJQhRtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N/SWbK7P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ai5Iubl/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N/SWbK7P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ai5Iubl/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7OWXV015185
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iwSMrrL4OXFj24KL4V2M3hmYZhI5aqpLyEXTi1o2zKM=; b=N/SWbK7PwejsAiSO
	z4SDKpaY0fpQfFBPsD/4s1bsTKa6qlLD0LP6orEEZObVzxdvA+NhtZNvirDx0CKu
	pAHkuNgttOg3n2+cXg3NJ/BVgVeFgQd2hY49Hb9EcedYL8UNgxv/8Sr3e9sxkaqB
	fM0kfB+hFmMcmLzJbupwLMOf1yjtfzfEJeBuVAejNZftXaHaVDAYe8Vnl2qJgIQl
	+Sqh3aP2PA1QKEGt7A7/84XJs0TxxsReTt8DnWcn/oA3No2ZX6WU3xLM3uD9tBQ5
	ncX/n3GOPqZkjTaSBiLInyHcW3u8W2pGP/PbAd0svsc46M/5vnRfAVrHge1GDLnt
	wPgC5Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7ugmnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:58:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc40759b2so622953785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 02:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885513; x=1792490313; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iwSMrrL4OXFj24KL4V2M3hmYZhI5aqpLyEXTi1o2zKM=;
        b=ai5Iubl/d/znMKdGXBH+OwEK6N58/OBYScpo4LkPVTfhto5sUb0+r6TFItQ0rotPon
         dyPouU6moTo5zL+fKuW+ZN/O/0h8ImgdlogcfQgg5MKiTODGij4RIfrGmLVCWvm/Bx3P
         VXCMJLy4IXQWJP1LrsJ4CR2mXNMg30gGg8GB/ZH4/NMHI9h8mfRH+Ohs3U+13Jd9cjVM
         Vtp5AipTCf95gqLcf6EntxCBhhGjBYMHKa3Uu/IPGDlfhxN5ItcSTUfxYWpY/FgfwC8K
         AnOpaSr3ILvOi7YaXERy8RmiZ5hLGLyYox1wEKRfPWTHJDbczntwAmJkXzW6hshL+g+1
         nCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885513; x=1792490313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iwSMrrL4OXFj24KL4V2M3hmYZhI5aqpLyEXTi1o2zKM=;
        b=VHlca4zq+GIfBmgoBqRTsby354P/wj7Ah0ibIZoX+mUPmF/wMQBIfggYw37n077SCh
         yZg5NtAQ+xkVfaP/m5GIynKf3yd45sbGzRWT3PBFbBX8Fsuaf+UnF9F/hHrWUsCwcYf0
         6jVYuzOveP4zQFHxonKmW96fzOS+PKV+DhvTEbOo4q8ksnOP8Djhws+eR+3GFiVV13QN
         XkqOwMcXFFv1UbxMZWsRc4g5wKLOU2RTL4N7+KaehP3WJGU8EZdf39CVIdw5mSzice6v
         iDOI/c3hie7GJyNM2u7bgbGy9i2BCzCFuW8qtP7hhuVGtNeTjlOzorKzlRKUbJlqBgPE
         HD8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxOHC/dszPor0zP1/3LdaiXT3LBOI/1eNT7YNPRoaSr07ZtA/EI9lo4/VOV6vd2ge3TVUOff1Ge6jbeOvPn@vger.kernel.org
X-Gm-Message-State: AFq9FYKOSDN7OJryPBKoZP1DiQWBlOcQAXByVPIsBFpkI+qj6hIBF0rI
	XmQKvsztBSjNXTgUL2B+v/ILARsoesGCIct/Rxi2h74cyvXVyrMVRZnsQiaO8I6AHRjS2B+1ogu
	hbYJwOd7SSJmYWL5pkcdfsx2Ujvl6E2BoR0hWeA2T33Rqzy+88kX6oFhDCWZj0Mw3BsuH
X-Gm-Gg: AYBFou3hPy2ptvP3s74XYrtUxr2IcPPRehAeUIEea54JTEQ3d7M2IwXMRZOL5vwiy3b
	zfe/FAmr5L+Wf4zUAoP2p5rOHNGBaM+FF+qU37roFRg3ZlQoo0Vnaz88GY3cQSKK/nOkFxbYjsG
	/TXxJKPGBcsFLwKBmSnoJhkVHYOtnQkOkccnTZNd5mOnvmchqNWBkj6fKhhMBDfujEYpVpzW/ou
	Je5lq2VcVvY2iu+r9S1T2jmOw+OkYcD+ZejCLwbkNIh2rOpIu16DMssWwejdjeN0PRp6HRbHbA3
	09LN1sKxoWg4P0lVNA09UGyzGalS/UvIc0EU3NRjpIkCqCr84ZmZhHI8FDGBaZB7wbCSZLZOkdS
	BBOnt7CzNDQn+GD8rD1eQ0R09UzMG
X-Received: by 2002:a05:620a:28c9:b0:93c:c538:2b23 with SMTP id af79cd13be357-93ebd0bfbc0mr2002600985a.1.1791885512365;
        Tue, 13 Oct 2026 02:58:32 -0700 (PDT)
X-Received: by 2002:a05:620a:28c9:b0:93c:c538:2b23 with SMTP id af79cd13be357-93ebd0bfbc0mr2002596285a.1.1791885511560;
        Tue, 13 Oct 2026 02:58:31 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm209412025e9.0.2026.10.13.02.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:58:30 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:57:41 +0200
Subject: [PATCH v10 12/14] soc: qcom: add core driver for the Qualcomm
 Crypto Engine
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-qce-fix-self-tests-v10-12-57162a38a554@oss.qualcomm.com>
References: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
In-Reply-To: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4942;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=u/6qVzma3542MmAylBgsBrnJNBm4ZVIQqalwqVJoX9I=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzgCluaqEywAPgjW+OQ+Y3/bqOHswEmJ68SEYy
 LuOaVcvHR+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4ApQAKCRAFnS7L/zaE
 w57iD/0Vtb/CdSjxgnBASt2hRynxsTWgHr6mz00NMxB9oDLNDNLdcCTC2GmIeXUadW0wfD2A0j0
 qTNoi6K/jX6caqtvjxYCgFVGKOWx3HUjcrVIpsUNq8075sZKrkmgsBaxcwMVHmWf8p1/wf9zHpG
 VNEo3hfGxoIdVK/Vq2S9pUcX9d0V/2Zy9W/NUT8WXviE/IWEbB65DRpQOQ1SMRCwK+7W3dhnsZv
 /zF7mdoRRTmkpb5mf90H2SDlc3kK3R6pHceWBncsrRhrkQuF1/bQVLSiQl/m79bgWifVu85IOwI
 AF0Aau2i5XysVZrg65Ju9BBiH4xEd8WmprGS0G4cUtNfoDCS36XOiwsphKD7Vn2wQ7a9YerESlV
 WgyCqGGKU0CUl5KoDd5oSMHwGBY+PPwnKvoRluuMAwaz13rsIfPoRyFHZNOJ82ApNuzhu/r00yd
 VeQhH1iHBLPGk8hX3M/b/si7sawtbNmS6DM7+SM44w48GR+4WGBCpnQPG9litxxLYPivJFAeXXT
 XdR6MRIqxKTpgbUYxVmy/71Cp5cs8r1s8O0WEqp0Aj3dCZ53PDBAQ1Q8M73CpaDfD1/0MlSbfKw
 odwD3LR0MzzNUGtYpk16R97jbaZUbLQgymk8f4Urvkib8nHhmWIEq1bTGZyzd3duH/kf2ge7rZQ
 sBthAhzB+wRp80A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfXw8vx9Rev9PMd
 Bhei+YUcWET9l8aCtuA6eyHgRWralJASGOdcv3iL9fLw2BmvfwSNOAF4Qb15a3H7GkljjFiZOhY
 7X/feyizcrVRCJmn/O8iYvXey1X+OzsCy8IuAlDQL4uhrgeBy417avytpjGV7u0Qnh7X7+jVtjU
 pNe2g0B7fEEiNk2uil6hNOn3+0lWxJPeCgdRfsIKVBXFxaZTMupmpVzJLmlUIhbgQFT82JGemUD
 iqc3WRHcOixBcVbhzzpV1LwCyHXQ8c/qEeWivwZabmlzBn2r7dmpyDGdsLcyP96sX//ddjReXsW
 dv/ltUMRkx+nKC2XwE7SV3fk0MK35pLPrs8WTv5MH1++JdVtE/GE4FXWWFLP9zCHIeHNb8q5yx0
 GyWxfRpxU7YL1sZo32vMtaFt+LWnQ9GxQB97TmLvoWyNN6/rCeO41JDvrAQx3RL3uC89xRiY5fG
 KsDvv+Ox24uMjtEHPMw==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6ace00c9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=MCZKxbAby-unP1KIBZoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: LqreOAGoe60Mya7qX8DfvgZw0m9muf4l
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX+dNkFQiIkOB6
 VCUkBocfG4e+szLLpvX1MGu/SeqXrPFOeKwJsHAmCnpseoejHVsfxdJBH8dutWSnhih4uLBi2JI
 uhfx1j//E936A+v9ssEsKoayfQA2NTM=
X-Proofpoint-GUID: LqreOAGoe60Mya7qX8DfvgZw0m9muf4l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130039

Add the core driver for the Qualcomm crypto engine. Its task is to bind
to the qce DT node, set up runtime PM for interconnect down-scaling and
register the auxiliary device using the crypto offloader driver.

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig    | 11 ++++++
 drivers/soc/qcom/Makefile   |  1 +
 drivers/soc/qcom/qce-core.c | 92 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 104 insertions(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 2b524154d9fb331199fb162e43b0acfc03eced6b..859835a3dd1d98d1e4099f708d75f36ca89d3f3e 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -122,6 +122,17 @@ config QCOM_PMIC_GLINK
 	  Say yes here to support USB-C and battery status on modern Qualcomm
 	  platforms.
 
+config QCOM_CRYPTO_CORE
+	tristate "Qualcomm Crypto Engine core driver"
+	depends on PM
+	select AUXILIARY_BUS
+	help
+	  Core driver for the Qualcomm Crypto Engine. Say yes here to enable
+	  the top-level driver that binds to the devicetree node representing
+	  the QCE, registers the sub-devices implementing actual QCE
+	  functionalities and sets up runtime PM allowing the interconnects to
+	  scale down.
+
 config QCOM_RAMP_CTRL
 	tristate "Qualcomm Ramp Controller driver"
 	help
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index 798643be3590cc8303854658fd483b7807d2230f..33dfef07e7db2c0488b14c78f098afebf689d013 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink.o
 obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink_altmode.o
 obj-$(CONFIG_QCOM_PMIC_PDCHARGER_ULOG)	+= pmic_pdcharger_ulog.o
 CFLAGS_pmic_pdcharger_ulog.o	:=  -I$(src)
+obj-$(CONFIG_QCOM_CRYPTO_CORE)	+= qce-core.o
 obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
 qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
 obj-$(CONFIG_QCOM_RAMP_CTRL)	+= ramp_controller.o
diff --git a/drivers/soc/qcom/qce-core.c b/drivers/soc/qcom/qce-core.c
new file mode 100644
index 0000000000000000000000000000000000000000..d51a791bb1a3682b7593928cd9857a1c00e60bbe
--- /dev/null
+++ b/drivers/soc/qcom/qce-core.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/device-id/of.h>
+#include <linux/err.h>
+#include <linux/interconnect.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#define QCE_DEFAULT_MEM_BANDWIDTH 393600
+
+static const char *const qce_core_aux_devs[] = { "crypto", NULL };
+
+static int qce_core_probe(struct platform_device *pdev)
+{
+	struct auxiliary_device *auxdev;
+	struct device *dev = &pdev->dev;
+	struct icc_path *mem_path;
+	const char *const *subdev;
+	int ret;
+
+	mem_path = devm_of_icc_get(&pdev->dev, "memory");
+	if (IS_ERR(mem_path))
+		return PTR_ERR(mem_path);
+
+	dev_set_drvdata(dev, mem_path);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	PM_RUNTIME_ACQUIRE(dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	for (subdev = qce_core_aux_devs; *subdev; subdev++) {
+		auxdev = __devm_auxiliary_device_create(dev, "qce", *subdev, NULL, 0);
+		if (IS_ERR(auxdev))
+			return PTR_ERR(auxdev);
+	}
+
+	return 0;
+}
+
+static int qce_core_runtime_suspend(struct device *dev)
+{
+	struct icc_path *mem_path = dev_get_drvdata(dev);
+
+	return icc_set_bw(mem_path, 0, 0);
+}
+
+static int qce_core_runtime_resume(struct device *dev)
+{
+	struct icc_path *mem_path = dev_get_drvdata(dev);
+
+	return icc_set_bw(mem_path, QCE_DEFAULT_MEM_BANDWIDTH,
+			  QCE_DEFAULT_MEM_BANDWIDTH);
+}
+
+static const struct dev_pm_ops qce_core_pm_ops = {
+	RUNTIME_PM_OPS(qce_core_runtime_suspend, qce_core_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+};
+
+static const struct of_device_id qce_core_of_match[] = {
+	{ .compatible = "qcom,crypto-v5.1" },
+	{ .compatible = "qcom,crypto-v5.4" },
+	{ .compatible = "qcom,qce" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qce_core_of_match);
+
+static struct platform_driver qce_core_driver = {
+	.probe = qce_core_probe,
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = qce_core_of_match,
+		.pm = pm_ptr(&qce_core_pm_ops),
+	},
+};
+module_platform_driver(qce_core_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Qualcomm crypto engine core driver");
+MODULE_ALIAS("platform:" KBUILD_MODNAME);
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>");

-- 
2.47.3

