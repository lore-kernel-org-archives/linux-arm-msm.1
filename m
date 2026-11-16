Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846176;
	b=YYvRr3r2i39N0B2rfoV4+SFQ1uWKrrJzKCI2+ZeYuBbzOu2W+NsGGMrY7Xq+nVIBjDrg
	 EBVEDDvT5GBWjVVkIh8Zzmy8vBe+XtYS5m5rrPOcg23wOiYQ1qgr2XiAYU2NF4/ZS7dCt
	 Zn3H2abSbkekmHtrJMpOr/616n2W+2TjvhrxVsY/qlCSPd/gHydynZg3TEdBAAGM+IKPR
	 2HuzMrg2e0tzfH/2HDo4DOcsqVaaOT5k1n/TL394YM5MlnMCz5ZkYmOAWWih5n3X15o2D
	 4SnWf5uuc65GCa0IozzjzSD0rRNejwH0p5gY6zug3lp+ieuExMmHB7hso6pRvdkWYkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846176;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VVUhyr3d7Sso/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=;
	b=Fk9MUy/whfEJ42lWGd7r6FPXLCI5AwcMKQzZESmENxW1qDyBjxlwu+FgKAVp1qIIkgzC
	 EneaO/Wkz50y9IXd41okOxTu4N4rw7/dznT+rW/gz8EVAzNjGNW0LUnh+Q/cGDTeOYWy9
	 ju3kQq6LrBi2n3J3mKxJnpLWri9E0XUbdz6pa1ecWNjWM11JtHMQPs/t4b2B2z1dhr9aT
	 QRT2Sf8mgSw09xOa5rGmo9ewNaHQa1lZHXdaaDnlYkC4+XbJihd/OCsCLt8D45CYlTYf/
	 3le6KUgtXomS2S/yJoPNPpQkU4A8ZB7tTjMtD3j91KQQK8cY01kWPos4A3p6mw10m9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JJXXqVQt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d9sgcvnr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF9B606A32A
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 16:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DF9B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JJXXqVQt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d9sgcvnr
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIQh12789909
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 16:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VVUhyr3d7Ss
	o/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=; b=JJXXqVQtYeE7I2LIEKqks+Aj4Og
	6mnE8TIi1ILCOq3qM3zVIKPZcwh5rA41aKqTA6PTkfDdudLi89hQdm0W9KNvl/Se
	V7ZsXAWS9TIyjztwC3XSBW02c2hQsa04UDoTLnpOwWu3P8l3aDQGk3y/heMjTuRT
	nNm5k5Zz+jk+oQGwu5nk/eX64P7cDzS9BS1E6TA2RfiRwgwpbu07xlAIgaXOdyxk
	X76qpzY8fUBZL81X9hbki8jvo2HfuhfgWqE/h0hlG+5IywHykWIzfTG5M6T/EOBv
	s8Vl8bPkaZGplcg+mhacoh3bDccKZF7hLzLP6YotlMs9sona+8iakVmMXyg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j00nfh7vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 16:22:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5266121eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 08:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846174; x=1795450974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVUhyr3d7Sso/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=;
        b=d9sgcvnriVBI0vbCeHhHUbG9IeWuVL+9OJyu51Fdi5gcoe8z603BJyj9wfFvqukxRy
         4GjsBduEkjKRGesd8Cc1O+90jMA7iezGrl7LSY9fVVoTrwUnsl2aQtzHohhDirixDrHM
         lHjv5A6FjURb9pgiWdZSaeyatRB52I5AiTybeNxtdsXMBel3Cm72HaBRtmeYCKT4T1bM
         3xVAaT1lPv2+gjri5iHUg9I8j3rCkaXnjhvVZRRnImzhxJ4a/h4Wr1N/kYx38lR1jJYi
         YhQs5+7R9Y7BcPoa3cn6zT1sH7SP+4CeSn6ooqA6VB9tYo+E5fkmbxQ5GGzHDIUxJz+Q
         21kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846174; x=1795450974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VVUhyr3d7Sso/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=;
        b=Hl23y6TXS2RsHzX9WqPK9nPH3lwG+V/MWsCn+f/o+UZa2zHkNez9EiUJm2A3KXat+b
         nl25EPSTI3GmGiL0Up+iCpNryfmqAn5iw7Y3x+SHCUvpUQVTKOb05ZX7Kr6bP4RE2E+c
         0Qp38x6xwRo3egViJ8SPiYBV9VkYvR/WgqE5GgpSHjf0b1whJxQREuk0eT23aGxLTb1w
         d7f8MyS5wTBX3PTOZAzel1ZbKMduymDZY7Xpt09VvIZJ1oFksgCU/xEQe3PA9O4VpNpf
         1nD7HQ9DySrKmdJb7eqlnSpEIJEoRTY3XzNWDF1L/gSdKO44Ts+SSDjkatqVhzNdvh9e
         MArw==
X-Forwarded-Encrypted: i=1; AL+hErHBT6ZettAni934o7crAVTZxNc85ZfzNI86jv2jDY8y5mNjvAe5uFd8NiBGkywl2wdE5IG0Ub8GiWmfgHe1@vger.kernel.org
X-Gm-Message-State: APuU4Z8NpjDCVWTJS5K5kEOXrRW5lhjYOsUogJYYAEj/+Csy0OTInCaw
	KegyiU0SjTt9iZbpODp5wTsROzAGwfgsGOSEIS81mkSe7S0HUSSxCrS//TpQSPDKibY4EhozgGo
	h4Gko2vtydUuCFUWpiIiC3b3yBRwpcXnSsP32xnnWEo5Sww7RT2nOTyo3y3remkohVrNc
X-Gm-Gg: AYBFou1qxP/IEhuqbbJ9gj34AZFOCMqWKc5/9+llwCqWbIZFSxlqB30RQuvK6V3ALgC
	GevSJpJ4dDtiQCb3HhKiee1Ip7DPow4vT6NXco7UYtfJoU5iMCoC+2Eh4Be1pROkrbrogseNdJ9
	5Z5zYWnWSEB/szNz9571Lyek0tmOZXUPiZfn+GQuD4MsGjyjpK7IRItkH8nMnU3lJEc4iRr8m+L
	EYayLOV8Nsbw7OM46kbuwNhfwHjWdx2Wf7cA4Il9WBOzvtGdqhW3Q8tLzCX8I9OAI0qG1DSzXST
	bUaQW95JaVnsMJirdrsClParCsDbcy//9RMpKy/Uf4VqwALez8PI2ycNytI/XBX2a4ZKm9LNyjB
	Ou8arECemqHgfJ0WckxYROrM9KIiVMD1zA51IHAHlpGcPWoSzUvNiP9Iayg/NVVvkIHN1+6Y0wo
	cL
X-Received: by 2002:a05:7022:3a85:b0:185:fd0c:4585 with SMTP id a92af1059eb24-1b50312b3b0mr11214629c88.33.1794846173980;
        Mon, 16 Nov 2026 08:22:53 -0800 (PST)
X-Received: by 2002:a05:7022:3a85:b0:185:fd0c:4585 with SMTP id a92af1059eb24-1b50312b3b0mr11214575c88.33.1794846173198;
        Mon, 16 Nov 2026 08:22:53 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:22:52 -0800 (PST)
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
Subject: [PATCH v3 5/9] media: venus: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:44 +0530
Message-ID: <20261116162148.2864501-6-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=BrEIUoX5 c=1 sm=1 tr=0 ts=6afb2ddf cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VuDNxQijsV4jnZh2Ru4A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfXzxyVcBxdEwhd
 z5/TvW76xpLT3FZfo9ggGgcVeDXInxJoBKVGkck9BEbN2fwVf7paIupaQs6j64JTSGlgMAEOo2E
 8AeLvHUFVAstSYt8TjxAFgmdYxPqCjc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX5x7IFBu/t85m
 kN0QhYSUXkd2JlKO9VepYlPLAqCoTd48ObHRHyaXOWQRlrkOB32/MKlVdVXr0SFkgZP+8y+pHh/
 h1rYEE3mFBToKyyNUFZIbPH9rPivDrfajMo/F7LCSSeVxG3CRCSWQxpiMYAVyGN+SysEC1FCqsG
 aiDmzZWnSZ8ybx4vbeRwLTK7cnKx1PhtuBMJXAO1yMSOh+mvrFUEpBEeymIBnwTud+vrxXVtdH5
 lfktALajyEEytUgW1lD/bjArfSt9oTLDulpY7Zif1PpAe8CE70O50bQPx2IqeAUuOCUEaIdLeNw
 Z1LSKlQ+illhjH4hvnrahW73nr2pN7IjJntByxZpgqAqe9xfGQ8tok94O+z1GbLJfegRCtDvuBB
 IPdEDx/J5p+ZZ4qC6iUlzsL2DOIr2G6CEnvuUg1TXfgySrEPt/FITPtzRBGL7z3KQP9kKs58ryl
 F3RPDTA6WOcGEO7N/+g==
X-Proofpoint-ORIG-GUID: HTZItWGHP2KnFSBocbvrY8ZJ2FMmehyj
X-Proofpoint-GUID: HTZItWGHP2KnFSBocbvrY8ZJ2FMmehyj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160064

venus_load_fw() calls qcom_mdt_load(), which bundles metadata
initialization, memory setup, and segment loading into a single API that
does not expose a PAS context. venus_boot() calls qcom_pas_auth_and_reset()
for TrustZone authentication, which is the intended behaviour. However, a
new qcom_mdt_pas_load() has recently been introduced that works with a PAS
context and can handle everything qcom_mdt_load() provides, along with
additional functionality such as shmbridge creation and retrieving memory
from the shmbridge buffer when the same remote processor needs to run while
Linux runs at EL2.

Embed a struct qcom_pas_context in struct video_firmware and initialize
it with qcom_pas_context_init() inside venus_load_fw() on each call.
Replace qcom_mdt_load() with qcom_mdt_pas_load() for the TZ path and
replace qcom_pas_auth_and_reset() with qcom_pas_prepare_and_auth_reset().
The non-TZ path retains its memremap()/qcom_mdt_load_no_init()/memunmap()
sequence since qcom_mdt_load_no_init() requires a caller-supplied mapping.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.h     |  2 ++
 drivers/media/platform/qcom/venus/firmware.c | 29 ++++++++++----------
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 93fa77f05834..84a0d4a8426c 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -10,6 +10,7 @@
 #include <linux/bitops.h>
 #include <linux/dma-mapping.h>
 #include <linux/list.h>
+#include <linux/firmware/qcom/qcom_pas.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -228,6 +229,7 @@ struct venus_core {
 		size_t mapped_mem_size;
 		phys_addr_t mem_phys;
 		size_t mem_size;
+		struct qcom_pas_context pas_ctx;
 	} fw;
 	struct mutex lock;
 	struct list_head instances;
diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 3a38ff985822..704343e241dc 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -117,21 +117,22 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
 		goto err_release_fw;
 	}
 
-	mem_va = memremap(*mem_phys, *mem_size, MEMREMAP_WC);
-	if (!mem_va) {
-		dev_err(dev, "unable to map memory region %pa size %#zx\n", mem_phys, *mem_size);
-		ret = -ENOMEM;
-		goto err_release_fw;
-	}
-
-	if (core->use_tz)
-		ret = qcom_mdt_load(dev, mdt, fwname, VENUS_PAS_ID,
-				    mem_va, *mem_phys, *mem_size, NULL);
-	else
+	if (core->use_tz) {
+		qcom_pas_context_init(&core->fw.pas_ctx, dev, VENUS_PAS_ID,
+				      *mem_phys, *mem_size);
+		ret = qcom_mdt_pas_load(&core->fw.pas_ctx, mdt, fwname, NULL);
+	} else {
+		mem_va = memremap(*mem_phys, *mem_size, MEMREMAP_WC);
+		if (!mem_va) {
+			dev_err(dev, "unable to map memory region %pa size %#zx\n",
+				mem_phys, *mem_size);
+			ret = -ENOMEM;
+			goto err_release_fw;
+		}
 		ret = qcom_mdt_load_no_init(dev, mdt, fwname, mem_va,
 					    *mem_phys, *mem_size, NULL);
-
-	memunmap(mem_va);
+		memunmap(mem_va);
+	}
 err_release_fw:
 	release_firmware(mdt);
 	return ret;
@@ -237,7 +238,7 @@ int venus_boot(struct venus_core *core)
 	core->fw.mem_phys = mem_phys;
 
 	if (core->use_tz)
-		ret = qcom_pas_auth_and_reset(VENUS_PAS_ID);
+		ret = qcom_pas_prepare_and_auth_reset(&core->fw.pas_ctx);
 	else
 		ret = venus_boot_no_tz(core, mem_phys, mem_size);
 
-- 
2.55.0

