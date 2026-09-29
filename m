Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FDE4BFE94
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 03:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651875; cv=none; b=Wx9m4thgDLjVb7Yt/yw/a55S4Bqv3fRoTLMWxuPQd2lpc9IqKlEGN1ezeYYyaI2q7JEjUu7W+97pH7tcQHG+z19SJ468ZylIP0oFDeueeiGN8+PY8luzwa7GUoexngxuCfbl5mr/m8NcuHXtkQhWM4vB6g77bwtpjwHQ3oTH4Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651875; c=relaxed/simple;
	bh=N/GoXXPvoD19zUb9BSvoUOZ49eNN/9Uv+mNF62wn3GA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hx4F2fR0EMldXulAVZb5HldKLyJ+/j25RRp5UYMWFxXu40qCnfgzTzlmby4ECMDKYdPZvWBnFGco8SX+vVbKoYRoH9AuhBMOZWmjnTxwS43BAm9bCiB3AOkEO9B3ELli5MJbVM4wF0obFbEVvV0+xVo17pml6yaxxQq+2s3YjL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J2zUHReD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BPRUcTKA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J2zUHReD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BPRUcTKA"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T0j1Ch4180592
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 03:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4WXFbSFSr1/RQ2vXdoBOENE9gIt1QGKOfRFfzDrKe+A=; b=J2zUHReDk5sg9gVd
	f7LIXb2G3xqE04HSQG6WjzxYb+O2OcWDxp+WbdXxvS4Y5/oxO7EVvtEJzK/ami+D
	fzk/xdp1+OjmzDAB2AOx3/c0lgDlcBs70OoyhJjwVeAW6QC7vEqg/x5IZvmz+o13
	P8EmMlPFJ5P7ay2PlpVxBlSNACF54mJNQ+ggV0G8YRjvCaRUascCDkPwXJ7xjnQc
	LqW2irlPPa1gfHmlJDYR6AePsQxjusmFHjCi3v08w6ntFgpIiWx0Uv8/cAQTqGpR
	TONhdK/TMB6WpyxZX2LJ9+0byySACPoasc5tZ8u4fmMBAEn5P82aBBXp7zok0iFs
	vYGA5A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyxmu9c4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 03:17:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34afa104860so585103eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 20:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790651868; x=1791256668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4WXFbSFSr1/RQ2vXdoBOENE9gIt1QGKOfRFfzDrKe+A=;
        b=BPRUcTKAPmLA14FyrD40k4O/o7NyMW+TbeUOiteAzPtUFPhodQgjN4dhEY6zyfIKJu
         S81GvcZFBZDx/GHls+vno+UU4Qe7DkMB7QCkWyHQx9aNHzcYVXiAuPyYluMi35JDupb0
         dMn/fhx/nW4FnIZfxPBfN5FcXkyRAattSvV6ST+K54bsQDx4L/VpqJEl7szoiGuRtJFz
         4zVsYb+VnuDFgqlvRNcSmsZ92FJYU6GZZjgS8n0/6nthTirbQ8mqIwnQZD1ZyqpKOlS2
         UT49uof7fK/BIVVPOMDG383eIoON937YlE8K3yXYodwSYsMZNfzJevPODsqBWt2bCjD1
         ueHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651868; x=1791256668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4WXFbSFSr1/RQ2vXdoBOENE9gIt1QGKOfRFfzDrKe+A=;
        b=UP4ec79S1GGFm7csMdeNo0sCAdLZgKugUYMEaU8VZ9KkO90kLAc/jcuj0wTdiU5LyJ
         SOoxuzvpy8Lj1qaDkbRcFAG9uKAJ74weiToh+hQAOUzRGin8dWJZ58CJwhAMVYwW9RQf
         J2gYjf/ctpd0s+ZKXEQqHtLJVhQ9vUEBn9BzDy9OxqPLvwunpaZJa6UxakI9s+zcnTJd
         TrrOEtJxUNDOKDWIpKlPi5zLv8hzsbFsdoLtDju5Yv1FZSysRPDEv/e1ptAj9GmZiXPD
         ELWmJrpIU2xtohs36MLWDjYAMRz/GTaExIAUfm5nAl5Dv73FeSK7b+jibH8rXwwqRfGT
         G1cg==
X-Gm-Message-State: AFuF++lqyI61R2cgzsJpFpgj/LO3yVJv9npzqwk09MnWyBKuliczscy0
	Ersu+PK+Ow+2XgbicKzwLDYkOOoqoY5hdMXNxAt1Lj1WbW3u/jwvL+kJJ2h//c8V6s0e1Go1w2z
	HBbfxT/Mnhpze0Ns+kabXUeZGqEX5fVS0fZvWp0EszB+WGVyyuZ4b8H2h917WzDglxxg=
X-Gm-Gg: AYBFou3uaKGrzOTg6LuACPBFKslr5j25JqSApx9DfJaIrpCppnAeVLng/s4Ah5X1CNh
	wSYU8QTDqHMtVuAFg6hf4el5n697ReSd8A8kqYeDZ9kz46Y6DS3A9SM4HC+7kgCDdSRC9CVGeRp
	RsSX4BPwrnJysD8ZS3YAVRoZpMH84/k80DtitoBAwJwiBc9SdCsCqG7gNmrxhT44Ys8pBtFesSb
	K7M+kF3W5gRMoL4IU7SWQe1FU8x5Mz8xkmf+cpCwkawPgG/TL0pgOgU4OaKt7jnJZwJXVprg5W3
	MZNa1PWmlnKZwKv/Ix5nMLN0bpmd5QWtunn/c7uG0icokIFtUBf0+QUPEcWn7IG2xfPJW/08YcN
	iEV6/X0w0iIHwdx4+b2vJ70vIsQC2SvmRQm+m/teQNR7ig3hR9ZFHzgIiBjo=
X-Received: by 2002:a05:701b:42ce:10b0:143:5c63:23bb with SMTP id a92af1059eb24-146ce4958fbmr12821652c88.11.1790651867422;
        Mon, 28 Sep 2026 20:17:47 -0700 (PDT)
X-Received: by 2002:a05:701b:42ce:10b0:143:5c63:23bb with SMTP id a92af1059eb24-146ce4958fbmr12821622c88.11.1790651866843;
        Mon, 28 Sep 2026 20:17:46 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad4028a9sm24789368c88.11.2026.09.28.20.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:17:46 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 20:16:53 -0700
Subject: [PATCH RFC 02/10] mailbox: mpxy: add direct synchronous send
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-riscv-rpmi-tee-abi-v1-2-04908b81d885@oss.qualcomm.com>
References: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
In-Reply-To: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfX2brFVjzass/l
 t7eyuuFQHno2b4QKK4vnAFKppOsuxiQ2HoU7Zyh46k3aPTESzwpM60n9sNPdB6EIh/Caajxcj4F
 0llFTyYrBUfkiuq3NGIYUYaxSuQ57gocKXqAHP0+9ZAhZbWFsVk+hBPS2NvYcW3N7oFrfCNU6tI
 W9Q2vlMXDIk+7e4RGCAkoRSYggpyZGbYUKLRii2K1jczTd9aYw+jRvsQvFaqX7zlK82O/0I8ekQ
 yQ33+BFsP0whiq7IiNpqBUjd3nZwuCHyqdQ8oNrn9uldmNTYiifd6xk3CQ0s3tbdjt0Q1vwSq1p
 SsJkqgCWMJWXtuZrW6iykhAGZ6ZTH8foPwff4vGF/Lx3gGzy1ajy10dLizLd5bN58OwyxcVagYj
 TkQz2bsODKk0XSNPNf4dZjn2KFf4nKVd0hz+HALLKTammgrG0A2DZ40oTEmPrTKxRf2vBXgLu99
 3d4x6tAJ1zg/+q7d+yQ==
X-Proofpoint-GUID: KEcFqfMeTA7AQ0LbYDZfZr-D1Qi68be5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfXy8P4cKHwqJQY
 zWkUYx0KyKbyRGXPluGOBL6H+Sl9CWCBBviHV6qyRX9hAHPAf9KwrNbH3euBUnhbWmxs0I9pKVG
 p11tV4lVtVTkZ+gVX0iG3vo6kC4OCnw=
X-Proofpoint-ORIG-GUID: KEcFqfMeTA7AQ0LbYDZfZr-D1Qi68be5
X-Authority-Analysis: v=2.4 cv=c70+0h9l c=1 sm=1 tr=0 ts=6abb2ddc cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Tu2Rjsi-ZZ_FYV3k_IYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290012

Implement send_data_sync() for RPMI MPXY channels, reusing the
existing RPMI message dispatch and returning its status directly
instead of going through mbox_chan_txdone().

Factor per-hart shared-memory acquisition into mpxy_shmem_get()/
mpxy_shmem_put() so both the queued and the new synchronous path pin
the CPU around the same per-hart buffer, keeping a request and its
response on one hart. Calls on separate harts remain independent,
subject to firmware support.

Add rpmi_mbox_send_message_sync() as the RPMI counterpart to
rpmi_mbox_send_message(), for use by the upcoming TEE transport.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/mailbox/riscv-sbi-mpxy-mbox.c      | 196 ++++++++++++++++++-----------
 include/linux/mailbox/riscv-rpmi-message.h |  13 ++
 2 files changed, 139 insertions(+), 70 deletions(-)

diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
index ea69c6b6b4f9..5ca1b6d87f5c 100644
--- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
+++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
@@ -125,54 +125,83 @@ static DEFINE_PER_CPU(struct mpxy_local, mpxy_local);
 static unsigned long mpxy_shmem_size;
 static bool mpxy_shmem_init_done;
 
+static int mpxy_shmem_get(struct mpxy_local **out)
+{
+	struct mpxy_local *mpxy;
+
+	get_cpu();
+	mpxy = this_cpu_ptr(&mpxy_local);
+	if (!mpxy->shmem_active) {
+		put_cpu();
+		return -ENODEV;
+	}
+
+	*out = mpxy;
+	return 0;
+}
+
+static void mpxy_shmem_put(void)
+{
+	put_cpu();
+}
+
 static int mpxy_get_channel_count(u32 *channel_count)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
-	struct sbi_mpxy_channel_ids_data *sdata = mpxy->shmem;
+	struct mpxy_local *mpxy;
+	struct sbi_mpxy_channel_ids_data *sdata;
 	u32 remaining, returned;
 	struct sbiret sret;
+	int rc;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!channel_count)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_shmem_get(&mpxy);
+	if (rc)
+		return rc;
+	sdata = mpxy->shmem;
 
 	/* Get the remaining and returned fields to calculate total */
 	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_CHANNEL_IDS,
 			 0, 0, 0, 0, 0, 0);
-	if (sret.error)
-		goto err_put_cpu;
+	if (sret.error) {
+		rc = sbi_err_map_linux_errno(sret.error);
+		goto out;
+	}
 
 	remaining = le32_to_cpu(sdata->remaining);
 	returned = le32_to_cpu(sdata->returned);
 	*channel_count = remaining + returned;
+	rc = 0;
 
-err_put_cpu:
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+out:
+	mpxy_shmem_put();
+	return rc;
 }
 
 static int mpxy_get_channel_ids(u32 channel_count, u32 *channel_ids)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
-	struct sbi_mpxy_channel_ids_data *sdata = mpxy->shmem;
+	struct mpxy_local *mpxy;
+	struct sbi_mpxy_channel_ids_data *sdata;
 	u32 remaining, returned, count, start_index = 0;
 	struct sbiret sret;
+	int rc;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!channel_count || !channel_ids)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_shmem_get(&mpxy);
+	if (rc)
+		return rc;
+	sdata = mpxy->shmem;
 
 	do {
 		sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_CHANNEL_IDS,
 				 start_index, 0, 0, 0, 0, 0);
-		if (sret.error)
-			goto err_put_cpu;
+		if (sret.error) {
+			rc = sbi_err_map_linux_errno(sret.error);
+			goto out;
+		}
 
 		remaining = le32_to_cpu(sdata->remaining);
 		returned = le32_to_cpu(sdata->returned);
@@ -182,55 +211,61 @@ static int mpxy_get_channel_ids(u32 channel_count, u32 *channel_ids)
 		memcpy_from_le32(&channel_ids[start_index], sdata->channel_array, count);
 		start_index += count;
 	} while (remaining && start_index < channel_count);
+	rc = 0;
 
-err_put_cpu:
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+out:
+	mpxy_shmem_put();
+	return rc;
 }
 
 static int mpxy_read_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
 			   u32 *attrs_buf)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct mpxy_local *mpxy;
 	struct sbiret sret;
+	int rc;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!attr_count || !attrs_buf)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_shmem_get(&mpxy);
+	if (rc)
+		return rc;
 
 	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_READ_ATTRS,
 			 channel_id, base_attrid, attr_count, 0, 0, 0);
-	if (sret.error)
-		goto err_put_cpu;
+	if (sret.error) {
+		rc = sbi_err_map_linux_errno(sret.error);
+		goto out;
+	}
 
 	memcpy_from_le32(attrs_buf, (__le32 *)mpxy->shmem, attr_count);
+	rc = 0;
 
-err_put_cpu:
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+out:
+	mpxy_shmem_put();
+	return rc;
 }
 
 static int mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
 			    u32 *attrs_buf)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct mpxy_local *mpxy;
 	struct sbiret sret;
+	int rc;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!attr_count || !attrs_buf)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_shmem_get(&mpxy);
+	if (rc)
+		return rc;
 
 	memcpy_to_le32((__le32 *)mpxy->shmem, attrs_buf, attr_count);
 	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_WRITE_ATTRS,
 			 channel_id, base_attrid, attr_count, 0, 0, 0);
 
-	put_cpu();
+	mpxy_shmem_put();
 	return sbi_err_map_linux_errno(sret.error);
 }
 
@@ -239,16 +274,17 @@ static int mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
 				       void *rx, unsigned long max_rx_len,
 				       unsigned long *rx_len)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct mpxy_local *mpxy;
 	unsigned long rx_bytes;
 	struct sbiret sret;
+	int rc;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!tx && tx_len)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_shmem_get(&mpxy);
+	if (rc)
+		return rc;
 
 	/* Message protocols allowed to have no data in messages */
 	if (tx_len)
@@ -259,8 +295,8 @@ static int mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
 	if (rx && !sret.error) {
 		rx_bytes = sret.value;
 		if (rx_bytes > max_rx_len) {
-			put_cpu();
-			return -ENOSPC;
+			rc = -ENOSPC;
+			goto out;
 		}
 
 		memcpy(rx, mpxy->shmem, rx_bytes);
@@ -268,22 +304,25 @@ static int mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
 			*rx_len = rx_bytes;
 	}
 
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+	rc = sbi_err_map_linux_errno(sret.error);
+out:
+	mpxy_shmem_put();
+	return rc;
 }
 
 static int mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
 					  void *tx, unsigned long tx_len)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct mpxy_local *mpxy;
 	struct sbiret sret;
+	int rc;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!tx && tx_len)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_shmem_get(&mpxy);
+	if (rc)
+		return rc;
 
 	/* Message protocols allowed to have no data in messages */
 	if (tx_len)
@@ -292,40 +331,45 @@ static int mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
 	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_SEND_MSG_WITHOUT_RESP,
 			 channel_id, msg_id, tx_len, 0, 0, 0);
 
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+	rc = sbi_err_map_linux_errno(sret.error);
+	mpxy_shmem_put();
+	return rc;
 }
 
 static int mpxy_get_notifications(u32 channel_id,
 				  struct sbi_mpxy_notification_data *notif_data,
 				  unsigned long *events_data_len)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct mpxy_local *mpxy;
 	struct sbiret sret;
+	int rc;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!notif_data || !events_data_len)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_shmem_get(&mpxy);
+	if (rc)
+		return rc;
 
 	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_NOTIFICATION_EVENTS,
 			 channel_id, 0, 0, 0, 0, 0);
-	if (sret.error)
-		goto err_put_cpu;
+	if (sret.error) {
+		rc = sbi_err_map_linux_errno(sret.error);
+		goto out;
+	}
 	if (sret.value < 0 || mpxy_shmem_size < sizeof(*notif_data) ||
 	    sret.value > mpxy_shmem_size - sizeof(*notif_data)) {
-		put_cpu();
-		return -EOVERFLOW;
+		rc = -EOVERFLOW;
+		goto out;
 	}
 
 	memcpy(notif_data, mpxy->shmem, sret.value + sizeof(*notif_data));
 	*events_data_len = sret.value;
 
-err_put_cpu:
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+	rc = sbi_err_map_linux_errno(sret.error);
+out:
+	mpxy_shmem_put();
+	return rc;
 }
 
 static int mpxy_get_shmem_size(unsigned long *shmem_size)
@@ -402,8 +446,8 @@ struct mpxy_mbox {
 
 /* ====== MPXY RPMI processing ====== */
 
-static void mpxy_mbox_send_rpmi_data(struct mpxy_mbox_channel *mchan,
-				     struct rpmi_mbox_message *msg)
+static int mpxy_mbox_send_rpmi_data(struct mpxy_mbox_channel *mchan,
+				    struct rpmi_mbox_message *msg)
 {
 	msg->error = 0;
 	switch (msg->type) {
@@ -474,6 +518,8 @@ static void mpxy_mbox_send_rpmi_data(struct mpxy_mbox_channel *mchan,
 		msg->error = -EOPNOTSUPP;
 		break;
 	}
+
+	return msg->error;
 }
 
 static void mpxy_mbox_peek_rpmi_data(struct mbox_chan *chan,
@@ -516,12 +562,21 @@ static int mpxy_mbox_send_data(struct mbox_chan *chan, void *data)
 {
 	struct mpxy_mbox_channel *mchan = chan->con_priv;
 
-	if (mchan->attrs.msg_proto_id == SBI_MPXY_MSGPROTO_RPMI_ID) {
-		mpxy_mbox_send_rpmi_data(mchan, data);
-		return 0;
-	}
+	if (mchan->attrs.msg_proto_id != SBI_MPXY_MSGPROTO_RPMI_ID)
+		return -EOPNOTSUPP;
+
+	mpxy_mbox_send_rpmi_data(mchan, data);
+	return 0;
+}
+
+static int mpxy_mbox_send_data_sync(struct mbox_chan *chan, void *data)
+{
+	struct mpxy_mbox_channel *mchan = chan->con_priv;
+
+	if (mchan->attrs.msg_proto_id != SBI_MPXY_MSGPROTO_RPMI_ID)
+		return -EOPNOTSUPP;
 
-	return -EOPNOTSUPP;
+	return mpxy_mbox_send_rpmi_data(mchan, data);
 }
 
 static bool mpxy_mbox_peek_data(struct mbox_chan *chan)
@@ -713,10 +768,11 @@ static void mpxy_mbox_shutdown(struct mbox_chan *chan)
 }
 
 static const struct mbox_chan_ops mpxy_mbox_ops = {
-	.send_data = mpxy_mbox_send_data,
-	.peek_data = mpxy_mbox_peek_data,
-	.startup = mpxy_mbox_startup,
-	.shutdown = mpxy_mbox_shutdown,
+	.send_data	= mpxy_mbox_send_data,
+	.send_data_sync	= mpxy_mbox_send_data_sync,
+	.peek_data	= mpxy_mbox_peek_data,
+	.startup	= mpxy_mbox_startup,
+	.shutdown	= mpxy_mbox_shutdown,
 };
 
 /* ====== MPXY platform driver ===== */
diff --git a/include/linux/mailbox/riscv-rpmi-message.h b/include/linux/mailbox/riscv-rpmi-message.h
index d5362b5821f9..16fa85f65d80 100644
--- a/include/linux/mailbox/riscv-rpmi-message.h
+++ b/include/linux/mailbox/riscv-rpmi-message.h
@@ -251,4 +251,17 @@ static inline int rpmi_mbox_send_message(struct mbox_chan *chan,
 	return ret;
 }
 
+static inline int rpmi_mbox_send_message_sync(struct mbox_chan *chan,
+					      struct rpmi_mbox_message *msg)
+{
+	int ret;
+
+	/* Send message for the underlying mailbox channel synchronously */
+	ret = mbox_send_message_sync(chan, msg);
+	if (ret)
+		return ret;
+
+	return msg->error;
+}
+
 #endif /* _LINUX_RISCV_RPMI_MESSAGE_H_ */

-- 
2.34.1

