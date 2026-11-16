Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846162;
	b=SqG3fPBRsHnQIsYHbZPkgfe9qZTuHO2IYxV/wtCMcUc13F6+96wDB0idPPR0objh0UqH
	 f9UopgFCWdGnO4BZXAh4XfQpK9fO2QPRZRpvzBo0h4dEaBlms3mpdOHcppgdaN70rhEE0
	 5OczxyZFJj3P2kGBl3dcTJaJH4yGP+mrinLn+6El/c7nuYZB+GDnPGf61sG90AFpIO5Y+
	 MbWfprmrmeCVMbvL2J20hdJIZKRlAL7b4te4yMy+QpVYbx/Z7yDw10SLSYJVt+xpG6254
	 +eNIQsh/8a172682EaER7CPdmdCQ95f9SRxFJaKXgtk4DwGZ2zqJxZQvzRPWipK1fOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846162;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZiJ2cGdx8A1D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=;
	b=V6iWKu4Io+y0eQwfU8YVSbqJopPYn7uUnanHKFygjuVvT/N0S5VJKxfrYrZ2Gn9dcWgo
	 v9qAaJGXYFsLTR+hvRwB8PQebM/U1uMVWdCiVsQItLGG8t3WL7qD9XlWieRksR6VyjjrA
	 mrCCHCPZC+k4f8N0nT3Ze0rmrdmDZTLG5E1XvGBheiQ+uqvPV7VrnS9L+UOFi/DRERwT5
	 l+ltmJCpMH55T3JD1sXlnJodLMJtQ+91qo+lZsK3SSQbDE1vbGzcV5hB0H95UvphpOopt
	 rXcQY3vJ7glBzBLU1k7zgMAQzXnUyfWh5iAgdtHq1gjVO+tteRt7d12lPd1nXnDSI8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="KKVB/IqJ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dzYAbnJu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2F4606A33B
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 16:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE2F4606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KKVB/IqJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dzYAbnJu
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIHQL2126342
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 16:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZiJ2cGdx8A1
	D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=; b=KKVB/IqJmIHW43Y5iX/SbkcNv6M
	4wqpIJ0CiEte9tqfaDQrZ9zzJqnYBCXMghfBaExOruMjXJ8ySaPDeUAOikyeXHjA
	IDIh23CX+6N9Hv+dhZ9XUPvO9G+2D63QvC76GObIDhBkOXCjyJ7NW1Il6rL0i1gK
	et8Hi2v5ywKSBGtMzY/ChlxUx3+cmrJHZlDrf1LZubrqw1mnJ7X31N5/Lrr7zIUE
	YSTuEFj5Zes9LFQH/0eCVzIvvr+A/Lqhx4SlG8pg2z3t4ZKjG68W26dfQfbW8Eit
	IHcgJZ0bUc2vLc731T4bAv1gXUjt3SzEzSYm/1aVm+lW9kc+w4K+Nh4UR5w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyxx2hnrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 16:22:39 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375f0fd31f4so2108298eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 08:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846159; x=1795450959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZiJ2cGdx8A1D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=;
        b=dzYAbnJuj+RZEcRl8kqYR3GDL/zXSuL3ZteBQdf4M2xaBBWQTBqMbtftRAkgp1Tsky
         oP+NJJ+at6TJvBdRkhVanT3oOUr4KpJ7BLK+1w/qoimRkqOVLyNKOE6VOLg5OK30NtEt
         5Rhz5rtomZKaVlehllCMjNSfBOp/XWCPsMV2LkNymZm1KC/MDDWxtYIwRXGPiro7kWms
         zWQa8vdHnB8j9oALRSEH/ecy0Xn+gw09iFGLL1lmND5em2SFjqkqGbH3a4/1NUoU5r4c
         6htDChaB0yqjPZHdCv5zX9/PxgsKSpAjiXYArq3R9sj6DYa17YIQL87DrqBOHtbE4DGU
         OBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846159; x=1795450959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZiJ2cGdx8A1D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=;
        b=Arp57sgB5AObxR/DpKV4wcSvsU3NZ25LRHL9/sxDTgnlVuKciwd0hVhEGfKCp1GMXY
         Cm5WSg9TL7fVx8vUhrcmzqI9uw8HgjcYSNvy80aINzKtUxegblrZvqGX6Wjl0VIWKcrk
         b47+JEBePixly7K54xGJ5lXen/gfNixWqZqJjfwUbZnoGiN7dDIoa5zJBY28GR9X4zB1
         P4vu/Z3fbL9CWV+iFy13O+Fi09bw/rwkqfkPXKhmhWdR/W3FCnYhtneh7w1efa3e4k+v
         +zrum4C/1z4odFQTrVag9zFdjRwdRURVmZ9++oDF7BcWS7t3W7AwCesxfhk4eB/FvVPB
         D+iQ==
X-Forwarded-Encrypted: i=1; AL+hErEBi4YgdciaY9XwWO1byayv+uURe4aLZUiO20HdTzq6JOS19jtwPzxJT3Lr9/mfoaOabSJR1lVDNJjEomOQ@vger.kernel.org
X-Gm-Message-State: APuU4Z8ufiaK0gmcC6KSYsKAgOeSOcsWjn5maSRw/2vqOnR+7eQcv5Xs
	bIMjJ/rfHNTgZYKV6t0zY/aAAVFT9y0+91KWs/+IvJQY1pU2ztJ8it1Z3Q9kYk4XlDUT0//PFlm
	JNNcGeTA+uJzSDJyZsE5pPVWbZTg0/TK8lVD4LdOvI4T8EZxGzQvrprdA39u/T7VlcOGk
X-Gm-Gg: AYBFou1t8E/B0BApbZkrintBz9v9OLaw0RAHwbs0v6J8D1Nv0OF78lkL+jTVUUOAyGq
	+kvzKRVlFJ67jlTscSa0jDfZc3C5llnn+MjEwzNzJ1Yx7WI5him1Yy944Jy6lTSIUHKftnZhYbt
	QX/YSrsQHDV0n1nuQtHGW4iTmpYpcXA16YJ4mctRFJD8lpQu4oBaefstZmqnUW6r/heYMiMPSzC
	F8q2CpElnviS6+IieLueVTONCd4PoM9v5uAPicfxy0+H+sepqbKPvjCfcAsoh7dvnMjqPZ1m/zZ
	gU+6fwea3S94XoNA7ihkd3K9jAwY9z1WmaDesHB0Q1BnxtIOSg4FqZcjpr5ct1BP6SDAvxFQbgU
	qrsk/Sk7GJBT0k8LijguBKTc6K2EOfo8zo2syroTY20XTUjP0zErTLWuXGkrmikwuuKzk+M1x4g
	Hn
X-Received: by 2002:a05:701b:450d:20b0:149:49c:233 with SMTP id a92af1059eb24-1b5030bb598mr10533740c88.27.1794846153743;
        Mon, 16 Nov 2026 08:22:33 -0800 (PST)
X-Received: by 2002:a05:701b:450d:20b0:149:49c:233 with SMTP id a92af1059eb24-1b5030bb598mr10533694c88.27.1794846153043;
        Mon, 16 Nov 2026 08:22:33 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:22:32 -0800 (PST)
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
Subject: [PATCH v3 3/9] drm/msm/adreno: migrate zap shader loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:42 +0530
Message-ID: <20261116162148.2864501-4-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=R7WWitRX c=1 sm=1 tr=0 ts=6afb2dcf cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=zg618T-2U28-L6wfSYIA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX7bi1cVIb21gw
 lwEgZ0l743vUIZ/OAJq3uPOnxa//1xsSethpEfRl3MMYobBjYbJrsbUvyuI40DdJaVVQAR/nWwL
 5E8Z0t/i66viEjrf1ROIGXFSf7CfZeY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX7OPaSkFM9j1b
 TPAA1Nyi7ubouVcND0aZA/FpiVDTrGAfkDiV/BJgoJAeANzfkDNLoQh/quCgjodOgJXRd2O/GU9
 JevAU1wsZSv4ZZfcsngRctyceBUtruqi6Byu/y6AUokBIM4AdTz0leJ+5I1+6mGdLVBbc7nlMcL
 OSMp/IZHxqEFfNXGlaZ9hATWwkNJ/lQDJ0TS5GdZfIa5ZlCXDdanSpGjvIBVsHSHkUozbtUYIcn
 dA3uihfpi2QTJLa306TPhXDDbVFFv46qAhv9tqcI6QyMR3Ped5EO4xZdJ8FNEF+zAYTixwoFMR/
 EmanIYysym0LBwrv8kVxBui/IgTBWI5sfMrcVa43lNKmPjRNfUuyuSXgQ6hFn88VcPEzMUwbn2S
 ppEQEbX27+LwA3f0NWdu1TxuT86mZlykDEU+19vJvUfJ+Gf14pXAnAUOdXq48TVjWxrhwcp/XrJ
 LZ4vrIN2biBofWdNYXQ==
X-Proofpoint-GUID: -clrGTk79WfgzheWKCZyxPPwuGN4Z0yc
X-Proofpoint-ORIG-GUID: -clrGTk79WfgzheWKCZyxPPwuGN4Z0yc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160064

zap_shader_load_mdt() calls qcom_mdt_load(), which bundles metadata
initialization, memory setup, and segment loading into a single API that
does not expose a PAS context.  zap_shader_load_mdt() also calls
qcom_pas_auth_and_reset() for TrustZone authentication, which is the
intended behaviour.  However, a new qcom_mdt_pas_load() has recently been
introduced that works with a PAS context and can handle everything
qcom_mdt_load() provides, along with additional functionality such as
shmbridge creation and retrieving memory from the shmbridge buffer when the
same remote processor needs to run while Linux runs at EL2.

Replace both with qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
using a stack-allocated struct qcom_pas_context initialized by
qcom_pas_context_init().  zap_shader_load_mdt() is guarded by a
'static bool loaded' flag so it only runs once; the stack allocation is
sufficient and avoids any heap overhead.  The manual memremap/memunmap
pair is removed because qcom_mdt_pas_load() handles memory mapping
internally.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 54f337475231..8e4aa8e22108 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -34,11 +34,11 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 	struct device *dev = &gpu->pdev->dev;
 	const struct firmware *fw;
 	const char *signed_fwname = NULL;
+	struct qcom_pas_context ctx;
 	struct device_node *np;
 	struct resource r;
 	phys_addr_t mem_phys;
 	ssize_t mem_size;
-	void *mem_region = NULL;
 	int ret;
 
 	if (!IS_ENABLED(CONFIG_ARCH_QCOM)) {
@@ -121,39 +121,32 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 		goto out;
 	}
 
-	/* Allocate memory for the firmware image */
-	mem_region = memremap(mem_phys, mem_size,  MEMREMAP_WC);
-	if (!mem_region) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	qcom_pas_context_init(&ctx, dev, pasid, mem_phys, mem_size);
 
 	/*
 	 * Load the rest of the MDT
 	 *
 	 * Note that we could be dealing with two different paths, since
 	 * with upstream linux-firmware it would be in a qcom/ subdir..
-	 * adreno_request_fw() handles this, but qcom_mdt_load() does
+	 * adreno_request_fw() handles this, but qcom_mdt_pas_load() does
 	 * not.  But since we've already gotten through adreno_request_fw()
 	 * we know which of the two cases it is:
 	 */
 	if (signed_fwname || (to_adreno_gpu(gpu)->fwloc == FW_LOCATION_LEGACY)) {
-		ret = qcom_mdt_load(dev, fw, fwname, pasid,
-				mem_region, mem_phys, mem_size, NULL);
+		ret = qcom_mdt_pas_load(&ctx, fw, fwname, NULL);
 	} else {
 		char *newname;
 
 		newname = kasprintf(GFP_KERNEL, "qcom/%s", fwname);
 
-		ret = qcom_mdt_load(dev, fw, newname, pasid,
-				mem_region, mem_phys, mem_size, NULL);
+		ret = qcom_mdt_pas_load(&ctx, fw, newname, NULL);
 		kfree(newname);
 	}
 	if (ret)
 		goto out;
 
 	/* Send the image to the secure world */
-	ret = qcom_pas_auth_and_reset(pasid);
+	ret = qcom_pas_prepare_and_auth_reset(&ctx);
 
 	/*
 	 * If the pas call returns -EOPNOTSUPP we assume that this target
@@ -165,9 +158,6 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 		DRM_DEV_ERROR(dev, "Unable to authorize the image\n");
 
 out:
-	if (mem_region)
-		memunmap(mem_region);
-
 	release_firmware(fw);
 
 	return ret;
-- 
2.55.0

