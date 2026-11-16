Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846151;
	b=o8uQqnpG6eqg4tGs/nmKcIfGaDdSZaB3ysfn1Dim5DgwMSNI0CHlbUVfTSPgpC1n9CAH
	 ps3EWzahZYczbAejkkrpo0mMn1waCydPji45T5bqrQJPBCl5tO745J2zggAWlz/Seug00
	 bRnren54pH+/rmQndv7UWZn5PDR7h/jyWBZfEYxSeq7aYk2pTFg/uYKa9N/HTP6PHbCyL
	 siXaI6lRF3Hj93v8UdHAyN0bZU+ZvV0h66z0sWsckXTVr6DL+rgxQ9rRY+Y8pxUct/LXW
	 nwFfumD+bX6p7bmiG3W9FnpPcRyA/x/edHVJSla5JeD0B167hy4bYgUOV/AavPJr9ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846151;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uySENDl4qHKLED5Y781UpPB/TLSVGsjWluRr5p+nyD0=;
	b=E01TjQ+nH31DWVxw2nsubx64llaDkw+8z99xCsK7BfVfmvBtRHWcCelSI6Fo0KOtWdan
	 v1M0ngJYrsfFADxYiyBhhgXUYKIjF4hT4FN831xm4qY1gzvzLbDuN8FRtGBqcB1eAxeXs
	 WF8ZEfsCpLACJCTh8BOIgHU4Hp/BwdsGMP9rvHzSRqRfG8UfGfw06PGEvdZfcB8qaB1Yl
	 UQ9dJyuTh6kv7VUW2o36hlQJhKICA9ggoRI4Iq/q2Dk7ilb4DnRxeHCGSKJoBO1cBUQAY
	 cSMbZyxYipBdeprVyDLM42F4uggkOuRei01nw6Blmhxq379TrobR4qJybaBiJHId7SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q1P5lJvN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jafvLMq7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5CF606A335
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 16:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B5CF606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q1P5lJvN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jafvLMq7
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGISQb2790077
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 16:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uySENDl4qHK
	LED5Y781UpPB/TLSVGsjWluRr5p+nyD0=; b=Q1P5lJvNIeKfL56TfRIjIR9jsbt
	77bTCWfZSMMnZXthPUTgZCdXpi4O2Zen0smhOrBw2karVbUu/j3OLL7aN8MglY0P
	bGJvdD4H3Xu0ByqdwaJVvWSdqOKH41uHf3VhbLRtzbMKAGEFaCkemwzQjUw8ao3l
	G/Sd6Iu4A7qRqNEwx/uhcR+aDj1Db70ZP1ARRIeLTctUDqzGwpb+fbl7kKjxxiFF
	NMBrW3TMolw/qsJAgwxAN2B3Z625QLgJCPte4FneviTa73W5lH1TVWNjC+j2wOKV
	cHQH4ip5qU2JKos01EIjcSpvU2+6j7Tre8SmYWS9yvw9okcMylQgj1en7gA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j00nfh7sq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 16:22:29 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1aa0fb7f157so4355471c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 08:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846148; x=1795450948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uySENDl4qHKLED5Y781UpPB/TLSVGsjWluRr5p+nyD0=;
        b=jafvLMq7Q1371vPU8Y+Nj1dUew8IfFHMI3NRcEdv44L9+UP8HAbRGOPJoOb1wTJxkF
         uV7pxJ5flHApRbNq7EHyY3RHd4aF/ff3hZ1rSvMDJvIQ0WqCbHaon6p9VcUlsPUWlafW
         aIZsqz0iW+58bAlqycfMxZDCSi+G2cqF04mjHSKI3VOs7GW/F8O1TgCGGHQQZB199NU1
         SbcuuxSB3pDaOWBH1/ZTj54wvpY5Idhl6PwNiUbTTlVt30E4kGnGCzA/FcJFRt8LBv+z
         eSz0TIs3fRtrWeKFddPGbSGXqCttiIaDosmlxEWrZNOaSkIYgJM9KDy2XZayCqYu/Aea
         akeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846148; x=1795450948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uySENDl4qHKLED5Y781UpPB/TLSVGsjWluRr5p+nyD0=;
        b=0C8DjxdSrSKYYATzC9WGTPngqwh4gmX500TCLBoeQdbHWPe7JQFS1cBQuvEGGHZgUE
         oIEdgD+n+TheIFv3lvd9qEoLgUDectPGvBQM/ZJJHvtJoKUhziHtyfyKFLUhfQ90SSOG
         d8WPx74FrijmrLlbyEx0HvLWP4nqG61IWSg3ZslTM3U32pfLpwoGPIaACwkTgz8aMZUU
         Uc7eUNmGWkXzWZ9TzKqBghE3QPkv/zh8ov3ju6q5KBRjyoDDIT3pZI9QQEoM2/65K954
         d1CyCTL0TV+ldaSzFV2uq4QKXSResELuEdL9v5BOQh6yPNse8kXUS1qtTG+K4Ph0atIm
         sqVQ==
X-Forwarded-Encrypted: i=1; AL+hErFZxpU+keV5q30ArDbeAa9B+1xZUR/nsQrI1+Tr+XyjbLGldIR4/QbjMaUosrCf3cceIsboN4RRDAN6zX/K@vger.kernel.org
X-Gm-Message-State: APuU4Z+za0sAjR2FeA4oov+oYEWgor6fPuyZkMNQbYnFNEXZAYObN4OX
	qrYzrAQEBeIj1bAw+bbZJgN+OvHLqRe+fmI3AZ+pR2Y7UIBmY6PsWL2oD33eM39f9LoihgVXNJ0
	yJitR9sdlBhTDIJkXqJGeBFCZQ2mHiLwDZXRDQpcEGXSr0cHdkbWIfpkMwcGCOx9SsHiZ
X-Gm-Gg: AYBFou3LFetDP4N7xJhXJPOoJRfnCcbsZmecQJUpYP7hG2S9IgSOrYKJIRr7C31QxK0
	agF5Og7wbM0xfED6KAfWMtu1Q4dhn4Hk8OWhfl4I9FQd0zGaaXHE7mSbwNqa4TNdRHRkk6kUsxx
	M8doitTkmgzvAGjTdINQFgPwYixOjUYCjaxVEkCU8/s0eQ8fALHaxbuk1Uoo+QkRVrQrIGfYxCu
	+s4S4LpPC+qycZAnaOqD6+A6JQtJatten8iujK2eY3+d+pAo+V6eAiP0HmVZu+0gf3KPgiwq5NX
	nHNrnUgDH6Y2VwFldI0NvoYBzTnPZC8oZ2iueRC7QpFQnI+aY+KHbjDVDAzlc5InSUDSF0z/r92
	RSev9w7Xzq4mE0phGu6pq5Hl/9RGGz6jGluk2ox+gTBQkBPmO8Ld4atucTsblcEKdQ4YvzFwvzu
	/D
X-Received: by 2002:a05:7022:7f1a:b0:1b5:23e7:3387 with SMTP id a92af1059eb24-1b523e75033mr5758430c88.19.1794846148155;
        Mon, 16 Nov 2026 08:22:28 -0800 (PST)
X-Received: by 2002:a05:7022:7f1a:b0:1b5:23e7:3387 with SMTP id a92af1059eb24-1b523e75033mr5758228c88.19.1794846142809;
        Mon, 16 Nov 2026 08:22:22 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:22:22 -0800 (PST)
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
Subject: [PATCH v3 2/9] remoteproc: qcom_wcnss: migrate to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:41 +0530
Message-ID: <20261116162148.2864501-3-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=BrEIUoX5 c=1 sm=1 tr=0 ts=6afb2dc5 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=BENypEIf3hN4rM3MEzYA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX2ZUGZHog0vrX
 JCH23bIUtY3paCsTwqtZcXP287VCl2ZDJ7lrUXx43qqhFZ5gCFTBDeBBqs3y+C9wnNbsYJ7Zula
 ozCeKoNv/Xq4LzRj0KuG519rzz/iY5c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfXxiyFKFKonLzN
 dNUJLSNj3H3ZZujBmRagkPEfKNloiShTiGKc9oh+LEazsdC6FKoCiEYdJBzLat4NEIbQSf2xcFr
 nGKsUyPPPE0jSAIVftzhggHTR1K0faPg4r8qvtBn2tOvrCD+4ZVctGMvUZzYAVtsrqtOABC1ROr
 HRhFQu2gqBOYrkzBuLtDfXsf6pTk++HRjBR96/BRcRH6ptMnf++IMn1JSjPx0UT1EB4OCN1r1A6
 DkkBPZz37Zvp1tiCVcgSgbgns7H3ZvCWsG1TCizl7zkwtQELBP8dPnlooO1oykfv4mXwzm6FhO3
 8uw2TxpTJEnTk37ybKEgmv79IwBpm0LGErEX7VHZfu7cSZyUC6fcxtwSR61y1HMX4tvhU9X3GTG
 8kILYtxJdk+8HapebxY3p+ycG/C1/d+s//RoxrcouCA0nPUstJCeRFt2f1EsVev55FvpTHEGCDf
 NkgxmN3KN6Uyc16e20Q==
X-Proofpoint-ORIG-GUID: mgVxvZYhktfAhrfqxuyAUfZQGMfLSXWN
X-Proofpoint-GUID: mgVxvZYhktfAhrfqxuyAUfZQGMfLSXWN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160064

wcnss_load() calls qcom_mdt_load(), which bundles metadata init,
memory setup, and segment loading into a single API that does not
expose a PAS context, and wcnss_start() calls
qcom_pas_auth_and_reset() for TrustZone authentication, which is
the intended behaviour. However, a new qcom_mdt_pas_load() has
recently been introduced that works with a PAS context and can
handle everything qcom_mdt_load() provides, along with additional
functionality such as shmbridge creation and retrieving memory
from the shmbridge buffer when the same remote processor needs to
run while Linux runs at EL2.

Allocate a qcom_pas_context in wcnss_probe() via
devm_qcom_pas_context_alloc() and store it in struct qcom_wcnss.
Replace qcom_mdt_load() with qcom_mdt_pas_load() in wcnss_load()
and replace qcom_pas_auth_and_reset() with
qcom_pas_prepare_and_auth_reset() in wcnss_start(). The existing
devm_ioremap_wc() mapping is retained for wcnss_da_to_va()
address translation.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_wcnss.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 02f38fe29f20..840fa67a6928 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -96,6 +96,7 @@ struct qcom_wcnss {
 	phys_addr_t mem_reloc;
 	void __iomem *mem_region;
 	size_t mem_size;
+	struct qcom_pas_context *pas_ctx;
 
 	struct qcom_rproc_subdev smd_subdev;
 	struct qcom_sysmon *sysmon;
@@ -157,9 +158,7 @@ static int wcnss_load(struct rproc *rproc, const struct firmware *fw)
 	struct qcom_wcnss *wcnss = rproc->priv;
 	int ret;
 
-	ret = qcom_mdt_load(wcnss->dev, fw, rproc->firmware, WCNSS_PAS_ID,
-			    (__force void *)wcnss->mem_region, wcnss->mem_phys,
-			    wcnss->mem_size, &wcnss->mem_reloc);
+	ret = qcom_mdt_pas_load(wcnss->pas_ctx, fw, rproc->firmware, &wcnss->mem_reloc);
 	if (ret)
 		return ret;
 
@@ -257,7 +256,7 @@ static int wcnss_start(struct rproc *rproc)
 	wcnss_indicate_nv_download(wcnss);
 	wcnss_configure_iris(wcnss);
 
-	ret = qcom_pas_auth_and_reset(WCNSS_PAS_ID);
+	ret = qcom_pas_prepare_and_auth_reset(wcnss->pas_ctx);
 	if (ret) {
 		dev_err(wcnss->dev,
 			"failed to authenticate image and release reset\n");
@@ -599,6 +598,11 @@ static int wcnss_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	wcnss->pas_ctx = devm_qcom_pas_context_alloc(wcnss->dev, WCNSS_PAS_ID,
+						     wcnss->mem_phys, wcnss->mem_size);
+	if (IS_ERR(wcnss->pas_ctx))
+		return PTR_ERR(wcnss->pas_ctx);
+
 	wcnss->pmu_cfg = mmio + data->pmu_offset;
 	wcnss->spare_out = mmio + data->spare_offset;
 
-- 
2.55.0

