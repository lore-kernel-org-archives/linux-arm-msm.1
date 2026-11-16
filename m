Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846165;
	b=HHi9m7BUIx/Vcnz3bYCAGzKKp4TgS0phN8w6FX9UXFEphqwNDJFltXeOdLLExUonjd/w
	 H+1RMboC8IWjumox0J23RaFyPXE5ccWOwap3GdeKAPEdvR6hEFueBi+qW7gO5wkKtPmH9
	 +0sWMHmu14fNDOTYbEvSLfqonYTAgVFMNnmOuPpOD3nannwivResHOEAB9fhPPJ3SM6AT
	 4oS47Yx5ks2CGmDw0DDxowg1gOYzWSpAyli6fCpo02I+5dzkWorvU5UfkzWDCgDJTwzuj
	 pyp52dMNdWK2S63Oju5Cpjep/ej53nNAOY09UBuyImbd7eK8txQb/VeBRuXlQ8xhamA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846165;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7/5IBT6uyH8wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=;
	b=aRof1aMxYid2tJCg0Gs+B3pFy78N1mKRl6VaogjwSvcQKv9M2tauwr++aGMjT65+KyR/
	 pk4mHLCwG//EOSsoxtcoyc4UQN8KW9L/SUi3ykKTh/eGJzffvLEAxvZQ4yPs/WrSqYNXk
	 qzCvnMgVGyPNNxCKbUTZslbz2czgoQRxPHtTIIcXrd+LN7eG/V1fGys52oYOND79wYQao
	 UzojPgBMOWkiR7iiMorj9J9D1Lx+7no70dQ3pdZ2lCI36w+ZqbC1I0ZUmGuCFY5Sgrv2e
	 BnSbKEk7sKRVq0YnF9Fktev/oNJqKlvey1VGHolwMtq+tYgSEYre7zBiQGGcR6rfDjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ImKUP3Xz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GXIiAeH4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CD6606A330
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 16:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56CD6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ImKUP3Xz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GXIiAeH4
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIion2056413
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 16:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7/5IBT6uyH8
	wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=; b=ImKUP3XzzkcWGQBIHDld29kSpW1
	3G0uJ7xw4IKj6KnrhZDSfB9JFndd77V8uovcWSGwnRjYp6meXxZoJBI50ayEkCIh
	I330kLlI+/Ar3WA9eAymEYIX5A/kqaKYXMhTce83OnuGUbV62i7e5GZ7CKjqm7aK
	QF8Pn+N1ZojmqzzYyrfv/WTtBipZJUibUu/LVq72U5a0PnScjI1uzPbuh7NmL4o9
	B8ItKnCP9ocyMAghENDK6IwB1R6i4ADTkilLUnXEeH+jN+LYIeIb2Lc6KproX9NV
	2VR/aeYO4AzSy0m95rDre8ROZELsYzIzCRFwC+uWejLqZtliMUhFFFdJEew==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyrqhdef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 16:22:44 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a2af4c8cbaso1204097c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 08:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846164; x=1795450964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/5IBT6uyH8wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=;
        b=GXIiAeH4pT5S8uS7+eaez0TFEDJmyrXdkKnYDdfFce8rjC1+aWr02YDpgHHI4iQYQN
         xlcArqaDQl3xI1BfYtu8EOy49MM3N4wfjxOWgsu1mE1ToXpSf9VYUNtKQZMIXWeT1TMM
         O+F86OvmE/1KarMTyYqQq86NgmA7cCBBcBGcQRNBm/ccjt5RTbc7cdmuXwCWiGiaCxep
         3pSkB6oY9IONKhGXnt/y+qPMnU3u9kS2tdIlF0Tz1JqhUvejNYmxsHRCyNAsGozq0SsH
         4JHOmI4WVXBi9U/bRWTg25YU2JpEBr4Z4168khymP2uJMaXy+t7h4BCNPPQyu/jswjvr
         UNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846164; x=1795450964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7/5IBT6uyH8wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=;
        b=cAPYNKPi6jNVwgHIeW1JWZSxM1WAusM6xw0Sb6WkxKugXy/7oreAXLdBQ1hU9hiTLb
         PL0IlPT/qKAdVFyhB7izZLl/VAcL8GCUeDSp3WJDDpGmiPu6CUmQrQQAbVAHxFjbS0Lc
         xNXRG/Cggt6LHrsbT1cb6nMh76sLrgnDxVbjP+mpqjhkBV++JXVQOEy1NZS0Fjl1I0Sl
         TTevpI9p6Dsj86z0um109Ytt7Jjf4RoUbA6xKJqYbX7tcr1jtnrIxf/hcF8j/9t6Zg46
         ZvV5yqazD+fKpSnuiDCQ8U9Eo97LZ5ORb8uD7O6uJoBVRmMlS74NAlBjNUweUzwT5kC9
         0NZg==
X-Forwarded-Encrypted: i=1; AL+hErFfkkWm8/6Wmlh1VUQDjIp7Pwwkxzqy2TgbWJ2JfAbm04IJ5Ci2qRM4TWGbQgaRZXurL/TU5IKnk75aeq3o@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZiNN4/Z9fqeC1nVxfOXA6qftL+z+eExTmCnVYVAXZEdZz8M+j
	+wgs9Cg0KBgjx2jp+jatcg/UHj7IePmhA5FX/Hi+5CTALynCdRUBONh6RBa3Fg5qxrKgkUmnuEK
	rr26wDt6EJNQ9BKzZQU5pXK7iH0sMa8QUMIkjfeqxBVkS20BcHiiaQ/Agi7VP6EbBaJBC
X-Gm-Gg: AYBFou3XwImYLHhhjhVNJZJxQdUWclA5PLxDcqoLVLEqGOB7SEaUP2xF2M8r5g776yM
	SxOpAnoOF2AuXaIuGdRTbzHM8cfdIDgO31vDvrGnPkHQLGUuCdTD7GmDP7L2Wjym7yCqxxaASsw
	M/cLMNy6otiRT5WIpwBvreWnF50tDLHcrDBvxjYVeT/PUYat5gflhYZGLI6UVhqpoIYg+zK7KHO
	+oCf+9aG7GkHYV3pyWZmA1/rFyHoJUpjg6ojuf4CTN3iZkxZwekFF9OO6XoIDgBf4K/XBzip4Lx
	KkXFsCzBRg5MDeFukBjnm1bp/lbi9FFVVHFkD/Y0S6SHPWm6CRWXeosO66PD+tXMX23nLaQW5br
	AiFecxwudnBUsOhKOcgYCBCAvq8tbqx2x/XofbF5s7KTxbC6Bk36KtSPB+SVQmnW2Scgh8WRws+
	yY
X-Received: by 2002:a05:7022:2594:b0:1b4:caae:3324 with SMTP id a92af1059eb24-1b5030ad1d8mr12473127c88.21.1794846163604;
        Mon, 16 Nov 2026 08:22:43 -0800 (PST)
X-Received: by 2002:a05:7022:2594:b0:1b4:caae:3324 with SMTP id a92af1059eb24-1b5030ad1d8mr12473081c88.21.1794846163018;
        Mon, 16 Nov 2026 08:22:43 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:22:42 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 4/9] media: iris: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:43 +0530
Message-ID: <20261116162148.2864501-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VcJir1p9 c=1 sm=1 tr=0 ts=6afb2dd4 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=0taKFLn-hLWpjNWZEgwA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: NymT5TF73n3VlXnhcVUyavW0pwQ_Izk1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX6Co6bAP4KlNy
 QF/6oekKNfCsNYtLTDXhiZ2uPBDBnoGKVHmU69g9jx7bXQZrJDnM6EqbDbh4lNwqXAnxzuZl8da
 nPVBMKqEgjuiqd8t76NY0Fz4jpObBQXzPluQ68S4LXUv31i63eOPv2cafBUCLF/v1OxT8PpGV4Q
 NejQSiMM+HMYQxX//A5fzBGHa+p497sQ2qgKrmL7/Fb5B1pFG0NN1sj+Tn1ne7alBGExLW2jTap
 gJMBYEQw2338/iHGNholQKYAyYSNnm0sk/T/0Yp5LIp0NEMF3LX7vxVCf1u6MuetvoN8Z9f1tvx
 pJFkJllwrAZMr7DWX3ABdRWJ8cQsbAXnwSvBqR2fqGLVN5vcAF5gaOyvgYdLWW932HsdX9W+koI
 byxZR/BEEOEl1809z5x5kC0ZXZiD8QJxUyu9IxJBtQK9iJ45b51HUplKHvcEQjvOKO+R5aG7LWI
 fW79xMl6dZ0uPGwl2vw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX/sjbrp0/FrwV
 hmOIT7QXW1ZRMyp2L38O4x4zOSZA2fbfn41FhySeJ46AaFSPmEM1RCQY2ZvTjKqMb4yIvlzn/pW
 HI7bgfnP2OSMCrzNXIEVqdLw+X7OGA8=
X-Proofpoint-GUID: NymT5TF73n3VlXnhcVUyavW0pwQ_Izk1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160064

iris_load_fw_to_memory() calls qcom_mdt_load(), which bundles
metadata initialization, memory setup, and segment loading into a
single API that does not expose a PAS context.  iris_fw_load()
calls qcom_pas_auth_and_reset() for TrustZone authentication,
which is the intended behaviour. However, a new
qcom_mdt_pas_load() has recently been introduced that works with
a PAS context and can handle everything qcom_mdt_load() provides,
along with additional functionality such as shmbridge creation
and retrieving memory from the shmbridge buffer when the same
remote processor needs to run while Linux runs at EL2.

Embed a struct qcom_pas_context directly in struct iris_core and
initialize it with qcom_pas_context_init() inside
iris_load_fw_to_memory() on each call.  Replace qcom_mdt_load()
with qcom_mdt_pas_load() and replace qcom_pas_auth_and_reset()
with qcom_pas_prepare_and_auth_reset().  The
iris_detect_firmware() scan retains a separate memremap window
after qcom_mdt_pas_load() completes, since it needs to read back
the loaded image data.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h  |  2 ++
 .../media/platform/qcom/iris/iris_firmware.c  | 27 +++++++++----------
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 3e4cf652bf39..ac73bda072f8 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 #include <linux/dma-mapping.h>
 #include <linux/pm_domain.h>
+#include <linux/firmware/qcom/qcom_pas.h>
 #include <media/v4l2-device.h>
 
 #include "iris_hfi_common.h"
@@ -129,6 +130,7 @@ struct iris_core {
 	struct platform_inst_fw_cap		inst_fw_caps_dec[INST_FW_CAP_MAX];
 	struct platform_inst_fw_cap		inst_fw_caps_enc[INST_FW_CAP_MAX];
 	struct dma_iova_state			*iova_state;
+	struct qcom_pas_context			pas_ctx;
 };
 
 int iris_core_init(struct iris_core *core);
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 21f57d37da18..b701a7f43514 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -201,21 +201,20 @@ static int iris_load_fw_to_memory(struct iris_core *core)
 		goto err_release_fw;
 	}
 
-	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
-	if (!mem_virt) {
-		ret = -ENOMEM;
-		goto err_release_fw;
-	}
-
-	memset(mem_virt, 0, res_size);
-
-	ret = qcom_mdt_load(dev, firmware, fw_name,
-			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
+	qcom_pas_context_init(&core->pas_ctx, dev, IRIS_PAS_ID, mem_phys,
+			      res_size);
+
+	ret = qcom_mdt_pas_load(&core->pas_ctx, firmware, fw_name, NULL);
+	if (!ret) {
+		mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
+		if (!mem_virt) {
+			ret = -ENOMEM;
+			goto err_release_fw;
+		}
 
-	if (!ret)
 		iris_detect_firmware(core, fw_name, mem_virt, res_size, desc);
-
-	memunmap(mem_virt);
+		memunmap(mem_virt);
+	}
 err_release_fw:
 	release_firmware(firmware);
 
@@ -233,7 +232,7 @@ int iris_fw_load(struct iris_core *core)
 		return ret;
 	}
 
-	ret = qcom_pas_auth_and_reset(IRIS_PAS_ID);
+	ret = qcom_pas_prepare_and_auth_reset(&core->pas_ctx);
 	if (ret)  {
 		dev_err(core->dev, "auth and reset failed: %d\n", ret);
 		return ret;
-- 
2.55.0

