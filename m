Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53CA486B8A
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 16:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787846908; cv=none; b=Or8v5qm/NDcFX6fb0XARlrItJR7Y/YS/P7kQNswIDqRJxn62M0vks58SrKV4dAPBMfn4Vp+348uUx3JdTXOxeZhSXCp7QqWVzBo4M8hbFLnjPdW7iCn15PJoA+FDfw2Bj32m7f7C6WFdZh7FxcqXzDDMMle26e4MHdMg2oBDCrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787846908; c=relaxed/simple;
	bh=fVeZw9EDi7ERA4LNK8w26r8i8AIslzVnGqRWpyHht7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=anGOIZIGLLTgXAXWGBv72waUbMVTkitQR+usDQG2jKzM5/SeD7ZaVuZAm+KAnq4VACMXr1Uv0IMw78uzzJ9FmEsCbbzJ6NnbzmUUqKKB4n7vRGVuYtbI43iOld626uU+P2bd4+b4J2I6NAF1SwjFB0+L+yMmzwfIb/I2txaPoIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q2KWwxIF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cRMX8aKC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q2KWwxIF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cRMX8aKC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbfKQ3829411
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 16:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Tb6pSykcv9W
	jH2s5aqk5SoF1TrILL2gUQOLQeoLKEig=; b=Q2KWwxIFk2F/i0p4ivIdce28hi/
	Kfsvpi/llW7MriXLEr1R0lJqVOkL+SdAqphOorZ6C9TBaPJXTJklaz1exwKCHVRl
	3rDnkKEOvS71K/HuQMf5/kLeEzwBlzwqd4p4EuIdd7Y1USbAcCEW5LMRYI55Aao0
	TaObjUU00cbV4mCBt5ClP0WkQmXvuoobdPr8eJC20Rkgb8HBUSvDsJmj2tPHmMME
	6gmyuVtWum1Pg2myTCpiy/9Cv57OHsPznzLt5LUUE34y5tfhFlliVQpzSTEHmK2z
	dFxWYzr4y3HKTO4FolcMpJwWVp+aNccuH6ZpXECEuZ33SJuXeHadtWd5YUA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4game7s58m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 16:08:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so165205a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 09:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787846905; x=1788451705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tb6pSykcv9WjH2s5aqk5SoF1TrILL2gUQOLQeoLKEig=;
        b=cRMX8aKCgNWITZhHtY0NWPLa9B3iquogPqioO/SQwkI7dnK4nf7MeyJ5fx9gKQnubi
         rceMbJYDzDL1FJYJT3u5zX09BAdhfh6mL9ThFOtAT1kza35omE9a5YUPXDSrS5BzuN/K
         FYapalJEV4oumKpq9GgiFeo6nXwaQXU4P9uUOR9TENOJuttd3+Acuc8M9U2hPAXCUyvb
         sKW2mWXpsLeAXEaVI7p8aBUOPK6kpfcZqt1ppnSQ8Wgd9tzOgEUnDqoYguGT8u6KhMrb
         ZJFSzyeb3v5gG6QpoLqC73V8hBm6dYKpzXOQiuJpxtby3zmrxOU5MPdHbIdIf/1OuPae
         rKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787846905; x=1788451705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tb6pSykcv9WjH2s5aqk5SoF1TrILL2gUQOLQeoLKEig=;
        b=GjCxE3U37UXeHnWuVt4n/dmTXY2asyswNOjXKQenpFe9+KVSdpgCOdKvFvVMFpN3z1
         hRQX5s5+GM7lWhokP7uq0p0n1pZjoO3ZZd4ldYmIXOFdoWS9Fw3p8pWvegTgGdFuf9uK
         dcQk69LVbc2rq3F3SdVcOBXDkpNtRH0xk0oAr5lwp+g/iqXyI8p9l4dkYY1ISEMSowih
         W/v+X2KHrZvRbWV0DECzvRSNycW9vDT/VpdCX9ovDfxqNU0jWdoqOjcZfzyPqBN8VDh7
         RKtwEzKinmIBM3Pu7AxY6MCJ087aDu3HdlwUI3Cq9PJp8MFyAoDjp6SuIc8PbmYoyiSW
         xwag==
X-Forwarded-Encrypted: i=1; AHgh+Rrw6ejAV5wvzc5+9dtDUuBa+GIQ7yVPFTXHK5CSmbZLI3rZzd0Yqcr7hrIqu0nvVsXNkrjM0YIng2xcnGg7@vger.kernel.org
X-Gm-Message-State: AFuF++k4f1qwURco3ZBRvxifP4g6d5JDm+MxoYPSimwqbMQuRzzPgQSL
	BHTBKVoP4bPI0HoYYh6neFgG+0A59LtT8y/fUiBa17HICTFLQOwcPJ74sh87GQWeY5/u1hJSj77
	Q0A7RJx+N3v/O+aM+NfrSPj2Slt4L19wyb7tQj29SzPuTueW/IPwYOiJpxQtm8z2WP81/
X-Gm-Gg: AR+sD11u86XbjziQCStMiyYUboSfYXL2cDib00eu8/yvM82M+6Bbt1KaROKUx7uVQhm
	uPcgXVtCw71ZyXkjbPUt36wATVcDSkKTWiW6s09hnDzr543UQ+mVoBGY7VkLHs1LB27Z2DeQSbi
	VAHl+wiTbAI7ret83n75vvqS0XskTrHibVRnJuoL/VL6lf2PNWn6U+MaLzdygDMNlfxpbDsb9Mz
	LSKP/Wjhqtph0CBOAJYiBQHYFA7ckxX4bqgpyPVC4FMtM103TYACRkEuxDJF+f7SXrd/H+mlnr/
	8EzuzE1EQbjad2asGIx+65E33G/Wnh3x4xmtpWC5djZk3Bs486dw26NMrKqzEVcCEwFhnd9iKI1
	1GLtPSA5xm5nCyts/hUuaWF0uNsdhcAJB1/zVZvnlcOO1ytNFb7KDDThdL2o=
X-Received: by 2002:a17:90b:1d83:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-396d1023217mr343735a91.14.1787846905087;
        Thu, 27 Aug 2026 09:08:25 -0700 (PDT)
X-Received: by 2002:a17:90b:1d83:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-396d1023217mr343639a91.14.1787846904578;
        Thu, 27 Aug 2026 09:08:24 -0700 (PDT)
Received: from u24-san1p10108.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd9085sm3245892a91.12.2026.08.27.09.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:08:24 -0700 (PDT)
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: ebiggers@kernel.org, axboe@kernel.dk, mst@redhat.com, jasowangio@gmail.com,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-block@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-scsi@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: neeraj.soni@oss.qualcomm.com, gaurav.kashyap@oss.qualcomm.com,
        mani@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        bvanassche@acm.org, alim.akhtar@samsung.com, avri.altman@sandisk.com,
        stefanha@redhat.com, pbonzini@redhat.com, eperezma@redhat.com,
        xuanzhuo@linux.alibaba.com, linux-kernel@vger.kernel.org
Subject: [PATCH v1 02/11] soc: qcom: add crypto_virt backend for virtio-blk inline crypto
Date: Thu, 27 Aug 2026 09:07:11 -0700
Message-ID: <20260827160806.1295313-3-linlin.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
References: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDEzNiBTYWx0ZWRfX98JzltWhAtp9
 d/7QXtwZDk6fz4UNbR5CD2+CxPRm7Pps9JUpBHH/NXpf/tJfBq/agfliZr6t9qkCk/qWDE5PeID
 h6+9T+f+FitP/jrLSjfYNBhHazKs52H1YybTpwt79dm7AB8bSSsuqk6f61rcw6pyLOg/MJ3Iw7A
 BNRxd6gZz6Zex78olgVtfM0PFuvKbO2V+HYKukUqZn09px6NiBWdzCtwJIQfzZjhFt5QiTGvNPA
 rOXU5sDSV0zVJijHXc60JqL3DsZfZcNuldiG8H5TNPptm6SqtEocTpszrq9YB/Y1dEWX7tKVZSy
 qsUTLfpwdA5mM4aHgzypQLUAKEjTrLF5sd7SLHrxy/2oQU3ltG0KYqDALEN3EyS05auWSoacXJd
 HGeA58XuQsTxKRFZfjU/6knbk1+rEgqk8vuoIkCG2U0p31q8Cvm03rykPhuZWrTBZN7VxmHdJjy
 f1RZiBcxtxYMYOuhPJw==
X-Proofpoint-GUID: V3pFE-r1Z-pP8NRbMHiLn0ayaA1lyV9h
X-Authority-Analysis: v=2.4 cv=Yrc/gYYX c=1 sm=1 tr=0 ts=6a9060fa cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=EqLUM-vDyOCcG5bjvusA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: V3pFE-r1Z-pP8NRbMHiLn0ayaA1lyV9h
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDEzNiBTYWx0ZWRfXzQROh4t44B3r
 d9S6VQOjwKNPUI/Au7B1Kaj1lXg8l7wdQvXy7B5+HnxRxi50CbNnotMQGLERqeZOFX7e+YQHQLR
 McYUmYopzfnLtnKh9ckuWYXLwrqE7AA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270136

From: linlzhan <linlin.zhang@oss.qualcomm.com>

In a Qualcomm GVM environment the ICE hardware is controlled by the
host, GVM has no direct access to it. So, key operation in GVM is
done through SCM calls rather than direct register access. In this
way the access to ICE registers are offloaded to Trust Zone.

Add QCOM_CRYPTO_VIRT, which implements struct virtblk_crypto_variant_ops
for the virtio_blk_crypto_ext dispatch layer. It maps keyslot
program/evict to qcom_scm_ice_set_key() and
qcom_scm_ice_invalidate_key(), and software-secret derivation to
qcom_scm_derive_sw_secret().

Signed-off-by: linlzhan <linlin.zhang@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig       | 12 +++++
 drivers/soc/qcom/Makefile      |  1 +
 drivers/soc/qcom/crypto_virt.c | 89 ++++++++++++++++++++++++++++++++++
 3 files changed, 102 insertions(+)
 create mode 100644 drivers/soc/qcom/crypto_virt.c

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 2b524154d9fb..6c632d114d45 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -298,6 +298,18 @@ config QCOM_INLINE_CRYPTO_ENGINE
 	tristate
 	select QCOM_SCM
 
+config QCOM_CRYPTO_VIRT
+	tristate "Qualcomm Technologies, Inc. Crypto Virt driver"
+	depends on VIRTBLK_CRYPTO_VIRTUALIZATION
+	depends on QCOM_SCM
+	default VIRTBLK_CRYPTO_VIRTUALIZATION if ARCH_QCOM
+	help
+	  GVM-side hardware-wrapped-key SCM operations exposed to
+	  virtio_blk's inline crypto layer: per-slot key programming and
+	  eviction, and key derive/generate/prepare/import.
+	  Say Y here to compile the driver as a part of kernel or M to compile
+	  as a module.
+
 config QCOM_KRYO_L2_ACCESSORS
 	bool
 	depends on ARM64
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index 798643be3590..6d4b7546d1fb 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -39,5 +39,6 @@ obj-$(CONFIG_QCOM_KRYO_L2_ACCESSORS) +=	kryo-l2-accessors.o
 obj-$(CONFIG_QCOM_ICC_BWMON)	+= icc-bwmon.o
 qcom_ice-objs			+= ice.o
 obj-$(CONFIG_QCOM_INLINE_CRYPTO_ENGINE)	+= qcom_ice.o
+obj-$(CONFIG_QCOM_CRYPTO_VIRT)	+= crypto_virt.o
 obj-$(CONFIG_QCOM_PBS) +=	qcom-pbs.o
 obj-$(CONFIG_QCOM_UBWC_CONFIG) += ubwc_config.o
diff --git a/drivers/soc/qcom/crypto_virt.c b/drivers/soc/qcom/crypto_virt.c
new file mode 100644
index 000000000000..4ee2a36af6c1
--- /dev/null
+++ b/drivers/soc/qcom/crypto_virt.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/blk-crypto.h>
+#include <linux/virtio_blk_crypto_ext.h>
+#include <linux/firmware/qcom/qcom_scm.h>
+
+static int crypto_virt_program_key(const struct blk_crypto_key *key,
+				   unsigned int slot)
+{
+	u32 dus_512_units;
+	int ret;
+
+	if (!key || !key->size) {
+		pr_err("%s: invalid key\n", __func__);
+		return -EINVAL;
+	}
+
+	/* Only AES-256-XTS has been tested so far. */
+	if (key->crypto_cfg.crypto_mode !=
+	    BLK_ENCRYPTION_MODE_AES_256_XTS) {
+		pr_err_ratelimited("Unsupported crypto mode: %d\n",
+				    key->crypto_cfg.crypto_mode);
+		return -EINVAL;
+	}
+
+	/* qcom_scm_ice_set_key()'s data_unit_size is expressed in 512-byte units */
+	dus_512_units = key->crypto_cfg.data_unit_size / 512;
+
+	ret = qcom_scm_ice_set_key(slot, key->bytes, key->size,
+		QCOM_SCM_ICE_CIPHER_AES_256_XTS, dus_512_units);
+	if (ret)
+		pr_err("%s: slot=%u ret=%d\n", __func__, slot, ret);
+
+	return ret;
+}
+
+static int crypto_virt_invalidate_key(unsigned int slot)
+{
+	int ret;
+
+	ret = qcom_scm_ice_invalidate_key(slot);
+	if (ret)
+		pr_err("%s: slot=%u ret=%d\n", __func__, slot, ret);
+
+	return ret;
+}
+
+static int crypto_virt_derive_sw_secret_key(const u8 *eph_key, size_t eph_key_size,
+					    u8 sw_secret[BLK_CRYPTO_SW_SECRET_SIZE])
+{
+	int ret;
+
+	ret = qcom_scm_derive_sw_secret(eph_key, eph_key_size,
+					sw_secret, BLK_CRYPTO_SW_SECRET_SIZE);
+	if (ret == -EIO || ret == -EINVAL)
+		ret = -EBADMSG; /* probably invalid key */
+
+	if (ret)
+		pr_err("%s: ret=%d\n", __func__, ret);
+
+	return ret;
+}
+
+static struct virtblk_crypto_variant_ops virtblk_crypto_qcom_vops = {
+	.owner = THIS_MODULE,
+	.program_key = crypto_virt_program_key,
+	.evict_key = crypto_virt_invalidate_key,
+	.derive_sw_secret_key = crypto_virt_derive_sw_secret_key,
+};
+
+static int __init crypto_virt_init(void)
+{
+	virtblk_set_crypto_ops(&virtblk_crypto_qcom_vops);
+	return 0;
+}
+module_init(crypto_virt_init);
+
+#if IS_MODULE(CONFIG_QCOM_CRYPTO_VIRT)
+static void __exit crypto_virt_exit(void)
+{
+	virtblk_set_crypto_ops(NULL);
+}
+module_exit(crypto_virt_exit);
+#endif
+
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. Crypto Virt Driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

