Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793196592;
	b=CCG0NGFoInY8PLn6/KXPAkIitfNv/4xQ6yiY5LOcp1LzNPEqLM+HTjPEIB4G/yh3I2v4
	 GdawtOmSsdSPG9alZ9pPVZUtDUVA3mhT6CLz8uExeuqPU9CyneeSVi5QWUzFpX9yajFGQ
	 kaQ6yPbxtjtTOohVi0H2FHk2aeqNwGFL++TxlxgLz9m4i5mGyDPTvHadf/OYAco8TLp97
	 a00DeJhg2k3tyL4tZql4t+uMyIIUxPhrwsrWhGhu4O/pgSn5adKuk5qWh8Nwn8rO7tnwi
	 1VHp3Baw7JASBUtw9yUSmYL6ofDpeET6INUxpn+OwgNKC6jVj4sDXl7g4xvlgsvXqQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793196592;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cxJH0qp0FiIlpZ0MfESATVurtQCCVtnz1lsq71RKj1Q=;
	b=JjhRyJPgTfXyFEbiwzMPcINxF24ihQwKzp1N4ZELGxytBXdlcUZ9jF29UkOpOw/7Vuuw
	 DytDboGw3K1X/U5VaCoVsuJVGSn+8QBbUwudLoWGIYIsnyoGkEARuJttIHD1nnl7ws/OU
	 brze+3W3SS17PW3MeUP47st7qVlFwHw/kws1JZk/D7w0g3vz3+Lb3FmOwFC4kfiLNdY4B
	 0KEO7pZc1YjkmMXmnaGYj5nPdWnW3Y+apOdMH+kJxUF9yt9lC8F2xayPQcht8CXDXcWEy
	 ES8yiQIMfAwAsmd2phD/Gd1f8CPQ4gapO/9CVuq4LbC617HdafXFTBf4NO0HZTj2eZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mp4KMjVY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CbVMu5ci;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8973D606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8973D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mp4KMjVY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CbVMu5ci
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe2Xm994545
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cxJH0qp0FiIlpZ0MfESATV
	urtQCCVtnz1lsq71RKj1Q=; b=mp4KMjVYVmH3JyoOr9N0gjhCaISy4zYtKVjRKs
	+zW3BT8jIoOlkdGps3zxS34wmoMez3QAu2wxVMj+Sy9Uhx7hwd2GjhTjUofJeOQu
	QWE2JNRNC4ufofI8TdJbcsTV1UHXOWiVA643Wykruk0rIfgR/I+Nd4KBjcKDjqqr
	VfUlQe0BoUptbbhI6maM8grjvKAvwa24JihCWQNibNcvH9ZDkmfOI0gkcjth9mcz
	PJx4IxtWs5En00Sh/QtE/5QiGIwCAvBnL/D5jUAsmrbyGTVPxbHMeiGs1z3+JOpM
	TF0s8zrcf9CPzfQR4ICpLiNBtg+C4MPTi1FwcAgg7laetYnQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82ttdyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:09:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb93c874bso399602485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 07:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793196590; x=1793801390; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cxJH0qp0FiIlpZ0MfESATVurtQCCVtnz1lsq71RKj1Q=;
        b=CbVMu5ciZN7QPxoDrtCCXTgu1ZMnpEoney8ZfyUuKbqvWM/3QuXEuVSBKaEarUhzvr
         N6N7MaIoh1D5S+awqPcu+1j+93dU4wc2jTEw+iT1AvM3Znyk3ltysPgc8y2eKPVoRhvO
         XSgQ7Z3qmEZWzFRHuC0m/lvZjwLt4v1tNonQ2Bbtue3qD4A5nsf3Q5hXTQZ+RjL079nr
         8YB47i+ykeZa5JrL3mAEvG13iZWdu9sfLa4UijK5VDk/d2valNn/9uszvUzICbxO/xQO
         OCo4mwhKGQmjqllufZ6zO+rjH++zvfiWxPXhz7c0tNxD0h6DSxdrx2GRouxfPLeHq9b+
         QTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793196590; x=1793801390;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cxJH0qp0FiIlpZ0MfESATVurtQCCVtnz1lsq71RKj1Q=;
        b=kyDV1QCI2MTLCMGE5Yl2sFBhWhyfKmkUzI0uOvBgvJ8uvoALt4q5d91wBZQ2k7w8zJ
         k1vcR+izf5WLv/ng4oZzAOcCgzmwcK6q5Bv+4Vdb6fngeRMLNo/s3xpV2lFG5IsAGCY9
         GqRbtWnGyxjLrXFtlG4jKUK0MVDOznZJHopRgSJQVheyZsrAVE97GRO/Has/PlahvMi7
         Qe/W3nBCFiySWd1IjiXljMfnGDyAHQvQNeUSHva7Ou2JnVYZyKCr99TKWBB40NUL6oBa
         JLB7GR7PNx3LvAQfO0eIEuKVApGClc83ZpLl9DzmzuvILfU5L+un1jFPrgEM8ldD8VtV
         1S/g==
X-Gm-Message-State: AFq9FYLH/TJash8GxiQ5Acx/aPqdpMTdeqmwxByR8j5UI+kCFWHhPCJW
	07mSplYh2FN1q9ZCSKiVr+R5gnXTZ5muMXo3fPF2+P4Ve0iqXYO/CyEEIBajDM6A53eHNd+8lHq
	y0qmukmA4SHwtqiYV0jO+lmZOamxqPGQZchyDMqEsY/Ndqcj/k2qO9HgroD2peJLjXxD8C+jCgg
	HM
X-Gm-Gg: AYBFou1aGpZgqfeKHQpY2PmZRBn+T/jdUfXATwXGmDQCHzrXd8Wt2BS9jLdYJoAlT5J
	SP19rYMwdHYgUL8wNRLeTULJt5FduoC/u3q4cnTndRmKvdiup7sh7cmpop6RcDad4KgVj4D5zmw
	Zn8lmK7pnLr09LM6L6kyO1qN/7mo749N19DTanZ638Lze+PhDfWM6OL5wwWSGH+ippvXaRBnin5
	DKnF0/MpZjFfI0hEf1TFg2ylFULHAQhsAefPDNJh6MqXL3+4lNsw68gP3XfXTyW6gebnEkNEVK+
	2ReemUjz6pPrOjxjRzb90zcb1JW1hekDPS4bjE3i6RUFbqHS21Knn/vvxrknzLw1YMHdQSlU8i8
	96qz10Q0L7Abw//wpaMchnCvdDnbuv4VW53Nct89pZ4rx9aYZIYg0OuM+ZHQwbZ1a5P/LVY64rw
	nqXIrsrlammJWUwvdCyXZaYIbHgZevUXU/eWTWBTiuwgvL6lPmcmlQboyP4WzEtNH3Y/FVje9xA
	jWJvrANdsjfsKpJcVmZ/Hd/E9mE
X-Received: by 2002:a05:620a:846:b0:944:4e6:85d8 with SMTP id af79cd13be357-94404e6b700mr356956785a.5.1793196589576;
        Wed, 28 Oct 2026 07:09:49 -0700 (PDT)
X-Received: by 2002:a05:620a:846:b0:944:4e6:85d8 with SMTP id af79cd13be357-94404e6b700mr356951985a.5.1793196588953;
        Wed, 28 Oct 2026 07:09:48 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:9d77:8e43:b62f:d85d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8ddasm31369197f8f.48.2026.10.28.07.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:09:48 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:09:47 +0100
Subject: [PATCH] iio: adc: qcom-spmi-adc5-gen3: Reuse IIO device ID for
 ADC_TM auxiliary device
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-fix-adc5-tm-v1-1-0018aabc06c5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACoC4moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyML3bTMCt3ElGRT3ZJc3WRLsyRD40STNBMTIyWgjoKiVKA02LTo2Np
 aAJXQkuRdAAAA
X-Change-ID: 20261028-fix-adc5-tm-c96b13a4f442
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: VEMpgAg9TXnQtUBMhsEZltSyj6EY_W-0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NiBTYWx0ZWRfX8SvcK0C6yYP5
 1hEXAy6pKrefYMT5WDezxpIz3rc/0Lkv8QW3qNXB4jxBGzFkdJFBta+J7iAqWALmnxwQfINvpqk
 jKN2MUbEr7kaOOA39a7/s2n92m3Oqsk=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae2022e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=6zM0cWFruIK7PyS1tvwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: VEMpgAg9TXnQtUBMhsEZltSyj6EY_W-0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NiBTYWx0ZWRfX3ahJu4AcyXXQ
 cdgG20clgvHWL/dn4vHxAivt/cg6V9x1ijXtZpjUyFzq2UDtzyWWd1IeP253XyFm8U4JqeECpBH
 DAktGH/KOHdlcSU8a/rDdfDQjBweJ38Co5PCkQBDApzMhZoz552zfLJOi3ct8ZnhBrYb3qx7WG8
 kShXEAj3r9gvXw8UIX1/KwpzVJduAn94XpZ5sZj3Yq1kKRJBjQjcRIltTCtiuk12SmWM2Ff2qWC
 iVPgGXCPdiiUzTreVfzVidIx4tGitxETbyzP2vvCP+3R6PG1ZDKQy8alHbATR9vzQyygpCdt9NS
 o9bxnPoEV0u1faGjyex/WoSkOMphY5NL6/1RJDdO+mhboho0qogOW1GSMCjyfFplOmh2WHCOAp/
 VOjHgvXjNOXq6ntuOBAq+bjnyv0f3cy4e5BQaIL4gcI4yP7V+Qnn/KLFMYvOEDhMGrmNP0l6kbD
 79uFRP046vTA62A9NwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280056

A recent fix in ADC5 Gen3 driver allocates a dedicated auxiliary-device
ID through an IDA to ensure that ADC_TM auxiliary devices receive unique
names on the auxiliary bus.

However, each ADC instance is already assigned a unique IIO device ID.
Reuse that existing identifier when registering the ADC_TM auxiliary
device instead of maintaining a separate IDA solely for auxiliary device
naming.

This removes the custom ID allocation and release handling while
preserving unique auxiliary device names across multiple ADC instances.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/iio/adc/qcom-spmi-adc5-gen3.c | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
index f0b2544c16322374644ac3a2eda63322f318e25f..a23eb5c9096d765af7d76ad66b50ed895782b256 100644
--- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
+++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
@@ -15,7 +15,6 @@
 #include <linux/dev_printk.h>
 #include <linux/err.h>
 #include <linux/export.h>
-#include <linux/idr.h>
 #include <linux/iio/adc/qcom-adc5-gen3-common.h>
 #include <linux/iio/iio.h>
 #include <linux/interrupt.h>
@@ -609,16 +608,9 @@ static void adc5_gen3_delete_aux(void *data)
 	auxiliary_device_delete(data);
 }
 
-static DEFINE_IDA(adc5_gen3_aux_ida);
+static void adc5_gen3_aux_device_release(struct device *dev) {}
 
-static void adc5_gen3_aux_device_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	ida_free(&adc5_gen3_aux_ida, adev->id);
-}
-
-static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc)
+static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc, int id)
 {
 	struct tm5_aux_dev_wrapper *aux_device;
 	int i, ret, i_tm = 0;
@@ -628,6 +620,7 @@ static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc)
 		return -ENOMEM;
 
 	aux_device->aux_dev.name = "adc5_tm_gen3";
+	aux_device->aux_dev.id = id;
 	aux_device->aux_dev.dev.parent = adc->dev;
 	aux_device->aux_dev.dev.release = adc5_gen3_aux_device_release;
 
@@ -650,16 +643,9 @@ static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc)
 
 	aux_device->n_tm_channels = adc->n_tm_channels;
 
-	ret = ida_alloc(&adc5_gen3_aux_ida, GFP_KERNEL);
-	if (ret < 0)
-		return ret;
-	aux_device->aux_dev.id = ret;
-
 	ret = auxiliary_device_init(&aux_device->aux_dev);
-	if (ret) {
-		ida_free(&adc5_gen3_aux_ida, aux_device->aux_dev.id);
+	if (ret)
 		return ret;
-	}
 
 	ret = devm_add_action_or_reset(adc->dev, adc5_gen3_uninit_aux,
 				       &aux_device->aux_dev);
@@ -814,7 +800,7 @@ static int adc5_gen3_probe(struct platform_device *pdev)
 		return ret;
 
 	if (adc->n_tm_channels > 0) {
-		ret = adc5_gen3_add_aux_tm_device(adc);
+		ret = adc5_gen3_add_aux_tm_device(adc, iio_device_id(indio_dev));
 		if (ret)
 			dev_err_probe(dev, ret,
 				      "Failed to add auxiliary TM device\n");

---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20261028-fix-adc5-tm-c96b13a4f442

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

