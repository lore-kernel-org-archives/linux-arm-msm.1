Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596012;
	b=JO1rNctXP29nHsD4qIQMaOswm5CVLXKcVYhmqK1UvvM8OritR4Tqkib/bsry0vVFLQLg
	 QDrLTNQuNUsEDUNM39yUaACpOWZio1SRmDuwISgQaNEtVtOaQGQaBqRWKsaLHb3Nw4uuo
	 ma7LBt9Ao6Orq1FnDWrSqRCGsVmRo15tyVOB/U4k39GnLea9sAMUukfgt3nx0OaAS6KjX
	 8W8puHtkl2DlDNGZZjBpo1sEGWC5IoaZ7gItHvfycYOl2rbSsuEB1tpW9cpYcpLGyVXSA
	 BQ8SIU0GMBGGn6mbVuLCiF8JSDQctfoqgDlxlYD1+4RkCF0NDWCcoZuwsETkZlZNPXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596012;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BXGZv2S+cckoJfc7J6GbRVXNyPJ++e4ifm1HrPgIkWI=;
	b=BlVdfHHyfJ6Itsp3jpAMxQODqJLzvGdcbqjSDzSm7CTXSGZvDLvdzjlQF42or1Ou6/rl
	 erMEMyMo+n28SmaiIKwF23Fd78KhGIJR4PJeCpa6lj4Ya7B7vc8RH+dJIvDQwSoQ1YWv1
	 xyLbJ6dDJtIQv3rbfuJtkHb/t/8nKeFyZ51XAJRXkFC4O0Rx0DJBJj8V2LSXv2/38y19L
	 sFoRgfJskjtLUt5ocx3yxyOwVXF+eLPEM9yAOJhodAxfIfOFSNEJ1McZ8vMy+wpd3lEBQ
	 wDDOTn+ByAyUZvRnUGAFoRsjv0Hj7PMxvKZEKVSLmq0z32gUpxKpgSXywVXXr2ZLW0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bFgODGB3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WuSQW4hv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D88606A88C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92D88606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bFgODGB3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WuSQW4hv
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFQxi92022395
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:53:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BXGZv2S+cck
	oJfc7J6GbRVXNyPJ++e4ifm1HrPgIkWI=; b=bFgODGB3qZZaGg2fPtcRPUcqtQt
	+GEz8GgP7H0F1BFrwXRVppu7n/FTwcBZqwfYr6zB3uvrNxz884R0cVOp2J4piCAf
	2tyVO4tdyERuy1DeTxx9BptUJiXYUSDmTvTb5YS40gJJr4qVVWB2O3u67J5D1Mm1
	rNvKNnxq3d+IjL7iXxpC+VisJ/xUj51wJ5+VEgGMaR59bFnXjtm9/o2RtkN3hAtE
	9A+OJO9me4U7LzHkHYI49EetYOHZviEHhX3V5nfUhKHn/ZB3iqfK7X2IWWnMgSM2
	GgylAL4FWPY/GjFCuXV3E2d3CcnP6heEPiQNnzzEvAx1Mk5Xeo5AyrokvSA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx0g21vnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:53:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d1353fdcdso5682244eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 10:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596010; x=1795200810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BXGZv2S+cckoJfc7J6GbRVXNyPJ++e4ifm1HrPgIkWI=;
        b=WuSQW4hvFSSqrNQYxJlfO73s4f6NkxGAsQRz4lVibLt75+r13LA3gjhQ4n0XQPBB2E
         BzhypBMlG+TOtLeggRjbKg9D01sPxWI5NEoN3N0rd0+fCsP/rbrYXWq1/XhtVcr+xFhQ
         5GapbtH/cAw/K/vMES+YdjeEFzJQj0mKSPI/hn7F+CmtI9cmNcWE9CpkxJDYXDoLj+oI
         UbE4bjMBGO4WWJlq3Y0zCn++eB6hBbfeJNHXpCPgL41Eh7x7QIV15uPbgq8qCkvUz/gK
         5x1SAPJ6pBXtMRNUx402Lwto5W6PyIRO2WRqbFihHRQFX9cQ2wFmINuSHzuy2XxDHPbj
         +z0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596010; x=1795200810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BXGZv2S+cckoJfc7J6GbRVXNyPJ++e4ifm1HrPgIkWI=;
        b=tTXsTwAczUuaOimpowrjfJNP3Z48XWG5nAh3x33wJwgF9PDTm5G+Ow7Cdf14sEz5C9
         IEOcZftP2qHsc8oKDXG/CSXlXFk663EGGCe6LteU8mSSCm909E7dCqlrYQM8FI4TNN1B
         MQndIsCoZVUsIwCI3WgZBGgORta7aWABRWivxyDxBdXMal/qsARZgkZDhgn46lMhopXe
         DSwNLDodOeqqHz7mEiir5bZwUy+D6ADUFuutLPMOL5b3JUp2xTUUDALgnIujiBhkA3bz
         TzB2H8ElVwj9INL5vmLzKOxlyvL1xHfJW36pUzy5Uc07Ly+zu8+42KORRirDfRsJMQW5
         RIwg==
X-Forwarded-Encrypted: i=1; AL+hErE1q0+XPlRWQzymZlI5wbjyOXlNXHNUOxeFX9ejqP50qp1mK+eVBuJx+KYalo2ujhbag39sCfJzA4uM3Wms@vger.kernel.org
X-Gm-Message-State: APuU4Z9Cj2ge77W+fDmV3K9OJa4ie1aLLhdDcKAuLyKV4bsJnJ/OYtAi
	dh1Ys5mJ5mnhmK2ghOuIgmWLqdLTDPt/YUB2ACq9qvuwQskpbBw/OakmeJgwXrI5b0eUqWiIU1l
	E02qoJc4zsR9YlHPEC9kAOVKaR9cZaDQjRQpqm9eHik5dvFHKfSQaTED53rr5765PdxL4
X-Gm-Gg: AYBFou059H2BN26OjHR6/zwu2xLdDqjI9PkULwALAweYX4DUJI74J4LX7lIpG9rXJZB
	/T44xriCauECkS3vCDyFiKH6ATpCipn1pAhN8YBte3EQCJ48EcdUSKAwnWsiv5cXsN5X8F7aqNX
	6imjSKT5P+3cCpIGC6PasDJMMbFQw7HJI0nH0G46JrTR60MEXPZnecG2RBjtcmjUPciQ7P5GSV2
	lewNaRDOyAW9C7xkXKN0QPtDwHlSZjO2H531nx5b0S3D9iNpa8tuaraVmdPlobwuo7qM1vyEzNt
	oACErLXthCbhXjd6U4FgqyciANxwXJC/NiAR7Lj9mEzAhyo0zgeAFeuYJ+WmyheBZ2tmm/B7OAf
	yZOvEfYkw0zAqWvqv0f+fjOKljLryy4yx24OPVoKPCTQUmP1NC4Ubk+21e5mmweKS7GQ8wiVHgy
	U=
X-Received: by 2002:a05:7300:478d:b0:369:fc93:eda5 with SMTP id 5a478bee46e88-379681c6a08mr4176070eec.39.1794596009946;
        Fri, 13 Nov 2026 10:53:29 -0800 (PST)
X-Received: by 2002:a05:7300:478d:b0:369:fc93:eda5 with SMTP id 5a478bee46e88-379681c6a08mr4176014eec.39.1794596009138;
        Fri, 13 Nov 2026 10:53:29 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm15547667eec.21.2026.11.13.10.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:53:28 -0800 (PST)
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
Subject: [PATCH v2 2/9] remoteproc: qcom_wcnss: migrate to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Sat, 14 Nov 2026 00:20:02 +0530
Message-ID: <20261113185009.157893-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
References: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX8vaWDuL9fmRP
 se1B0M/J7/qeYQXjhHtA6hzm0WKM/J9cNFnUNsiGe0CwCL85NCVj9qYDQ9VaEH4kvcK3WZTFGN/
 PhfI4Ua8SO8TfZUdytM35Goa3mjn7nem86wJKwgWkaBufzu9+mOoS5O5JtCVhZGuXJavozl+1zc
 /wPnxiDQ6bAXSITBf7kUBRpy5SNeLG5JicynPaAtErazW4tfd8XCsYW5Rf+md2FearGRhiU1Ic0
 645WOvFgHtmCC/gO7ZkZ7AEyauW2WuaoIId76rpzRjik3r3apS8i1Na27JuZHOYkbq4GqDXwyJq
 5tx8xjX5qGFQLhunYlTDoytt0IndtZxyGI2PZYhPensjLQ9EEa5MhhtyYIF7fFH04PrNs/N0ddF
 fTORXp4lAZOTe+EDzxUhF3k8D+59cS4ovVCBEoTlp9DWX70XgheNJkMuu+ZQ81SLqgYCBoYovoC
 62vGKxTqcuj1IEOtYmQ==
X-Proofpoint-ORIG-GUID: xx_61SfZ1C0rJ8YDk9thjy1Uqn5erc6Y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX/PGIS6LcfZLU
 zBi86JhWhw0QaEWDD1hF18k6khspgSeAhd20+DExok9EB6MZRm94QIa3zTpunP7gETwpvH6y6sM
 /1F+Kb04jAzK6S5xD9Kw6L9i+cZnqIU=
X-Proofpoint-GUID: xx_61SfZ1C0rJ8YDk9thjy1Uqn5erc6Y
X-Authority-Analysis: v=2.4 cv=SpIFe/O0 c=1 sm=1 tr=0 ts=6af75caa cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=BENypEIf3hN4rM3MEzYA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130075

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
index 02f38fe29f20..f377ce6d324f 100644
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
+	ret = qcom_mdt_pas_load(wcnss->pas_ctx, fw, rproc->firmware, wcnss->mem_reloc);
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

