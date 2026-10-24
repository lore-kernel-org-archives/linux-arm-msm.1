Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792834849;
	b=KkkWPHW5yah4PJzmC7LVIWuJ+CuEWQj2VrjVVB3k6Ybuh18IrIqj3WhVZ3sa3eWyOCFW
	 NECCDiBNwBVHiedOY601DTt+1oElBtMlbNz1KVtFmrxzrQlb5rdNXQunDws/+B18zCrJc
	 uxv6g5KZeYeOnrI8x7vOrWiI9k3hXX2H8e3nvwaZMSpnMZtzvZ4u1oScRg7aPd1s4JtqJ
	 UTX4/WaKNg1jLY+tmYfaWWdnCZ9Qp6A2KkZg8w3y5EoZZC1YhbFD95tlCaCWV+erY7ntx
	 GxJao+h4Ky3MBnHTD8mKD7bu+KKx7jUvb5nmRYuo/6LxuEYVQ1tzigknKZngvKIwkwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792834849;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WOeuRV4RScc5ABNqVY8qjK8GsqZiDkrs4gWDT36nb/c=;
	b=OTic3C2n+tv2j7eSbagzNiKQZVUbuqMzoFAMQ76Ba8kINwUl/JUdeEbdAlfZcdrfy4QA
	 qN4HBscTsPeJ6n4pXdcRvMC0ZpdH8Ak+h8+NPHNm7rDZjLhM9nBznntoz4rxBxfnZERd8
	 2vruRpojD33WL3LfYxa1BRy5cCbsh5X4f0nlafAPUsKn3tlY7U1CzpCvF7mfrW1WK53im
	 22GxfEKCDfgRsEcZ8iCI/w5SBYErWiNyBqvBbD21NlXycHULXokI4JAC95oZvwNIkFWJ4
	 TmkgVY+JocGLNpUx1oZ8hhhJGKIo1EN47RL5FZoZLSlHgLQGDcTtxaci9MftSl04mCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e43vQRB8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JItfumj0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F3360A2602
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 09:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54F3360A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e43vQRB8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JItfumj0
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8oAFI819622
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 09:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WOeuRV4RScc
	5ABNqVY8qjK8GsqZiDkrs4gWDT36nb/c=; b=e43vQRB8n6lWJj1uYTdmQnjCIPl
	bg/N7MRwkelLXDSYd0V0gXlZ24QfUwqi08HOShKSjExxia6IE7GpxMXWqgAwhXO9
	ZIiVuUK9qBc7dtHHLRJmyeGaWrrxj2UkhfIMRHQcSjMWaHV+PAj32dUrhVFcpkYv
	e4NCXRWFsXGYWrXdk5WsnRy7VdE9Rd0NHd41cMx9LZ327Ds5fpawylLlbWQuj+7j
	w3daylLxidb/v7ZVEK1iYNwAjedPWS7ocbxu3vgxhirTJLlJGKkO4iCN9HfE4dDA
	UCrHjgPlKBcxH9LtzRUQV7wSMA92y31aGlXlBeTDcVVqgZTZAp84fJ7UjHw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm0ggrj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 09:40:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844e383so294781985a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 02:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792834843; x=1793439643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WOeuRV4RScc5ABNqVY8qjK8GsqZiDkrs4gWDT36nb/c=;
        b=JItfumj0/kvOAbRy+M7bWb7xT/zZJ9BKO4IVwIbokrSB9zd5x2L3KVWok/5E7T9rAz
         gRMHQMPKegyLovdSO2/LV9nApQ/XxesOh+VECtBWy7iV2eAWfD1Waq9yqKUrV7ZzUEnk
         LFGFdvohvZMrMoyNgXM8PDX47T9LJf5cLd+j3hC5w8U+cCY6uSKpj8xPmKBCBOVxay+i
         P2Qq6Xfm+hBtlqL853cL2wunXtb2M2At3qlTrP78d3YODLyNTtCPAGfat0QbAlwGVgyx
         DtYNGgtE2W3biySwmeHXteEIbV6KevHX7v/3HN7S3ASXJwc6er1F/jmpJXqWDgtol9El
         m3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792834843; x=1793439643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WOeuRV4RScc5ABNqVY8qjK8GsqZiDkrs4gWDT36nb/c=;
        b=LvDU+ZIGcNm2JUNzPrpI9fHdXrY5DNj47XXSscUW7GdlnN2dKmt6W3Yy+dHV7kZWUP
         NOyhMiD2/CIyzJAfE20P525pDCbZF/QZedv7N07sIDlYIq4c6EMyXxIhcHapRTdbAXZi
         sKdoYn5jaVi5pcC7W4JLRHTqPJ6om3+D5Y0JOFF536D8xDDK34BGVaIDQfu1lCTdGPBB
         0/fG5b1BEEItvKD8OVNxK3fL2ZVYcjxbCwOxatqkbB+lzPhFh0fon6A6tUXQBRU9AvWR
         aE1e1O5hCt6S+EFbjkC83z5gULYq+iSbzBqB1mVfHocXWytqOnySVXPO1JcA+VJhzQbq
         pHNw==
X-Forwarded-Encrypted: i=1; AKwUvBwVRYt1m8BVRk1IXLjn1f75BlIJGSCw9oYBen/uGcDvu8G66eG9TxAsy6D/vxOt5ktYLmCwg8RBkDOnQMGC@vger.kernel.org
X-Gm-Message-State: AFq9FYJQSJ5F3a3lkTjyi6W1+2o6R2ECLRh0FCkTTfCguPF0F3ap14Ph
	AciC/uFa8uCnZHawJlnsbwsf5qoTajBnpkOlgCeMJkPkrAAZ0q7FQ4bpfyyHI+joIZbsV+fbJfi
	QPhrqMzTn5Op/E8UHULqSNWA4XWOlpWk/a9/nV0PpLjoyILl/jAdQAfTSwq5XsKuRlhqm
X-Gm-Gg: AYBFou394uyxkgBrO/gsUa7I8TMF18XZSjoxd8GAeAdVYjORATSZax4fJJOe54P69uW
	p7XOGXysPwu59L6X2aJROvTFQPL/mlag+1ya+l3IhRLZe3NJljpnYN9l2znKtvOEIDWbwcGTO5K
	+xnxhH7uVJMW5aicAsOB1qsq+0yj5DZ1LlSMGPGk9FmZ1wa6rTQjdFnvklP0susq4XoUWV4Z6VP
	CwMyoArhowTS5zd08ydt29xZF2eQ8khkRBUFJssx3T6rJA1VrBqzPSO72d1sALvMt5mWUkpRIVB
	8gRtPCq3c07fbueJ7bJaNByIVTPVVHpv/hOTX5dmYQjh3Jxpy/LiJ2Qvz+egT3s9hS65UcOe2J6
	Q2vPbfRjghqDq2VOo1A8wIdBl
X-Received: by 2002:a05:620a:649b:b0:93e:c12c:9dd0 with SMTP id af79cd13be357-940ef9e41cbmr195729085a.80.1792834842602;
        Sat, 24 Oct 2026 02:40:42 -0700 (PDT)
X-Received: by 2002:a05:620a:649b:b0:93e:c12c:9dd0 with SMTP id af79cd13be357-940ef9e41cbmr195726685a.80.1792834842045;
        Sat, 24 Oct 2026 02:40:42 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3bcdsm2857166f8f.13.2026.10.24.02.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:40:40 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] media: qcom: camss: share VFE clock sources by the highest rate
Date: Sat, 24 Oct 2026 12:40:25 +0300
Message-Id: <20261024094027.3095475-5-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com>
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: ESk9e7ffwntzeVcxt43mhFTaOP1DN6Bf
X-Authority-Analysis: v=2.4 cv=UfTE26SN c=1 sm=1 tr=0 ts=6adc7d1b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=zGHy8pfHd3-oy4E8GSsA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ESk9e7ffwntzeVcxt43mhFTaOP1DN6Bf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAzOCBTYWx0ZWRfX+Jg6ME+F2VSQ
 QHM1cz4SZKKldHVYDpznNW702UGlQUz1jKZYVj2OlQCT2kDFmLreZet1WMJnbPD2GnRwsNSD+z/
 W8dICWT/C/OzfH27CUOYQJPViYVCmYy+lrgHIHbvHyqTMt2D+mdtKr/M8T4vSUUHNiuyVDk/q3h
 v2So5s/rldfldT6OGG8hDZyP3xXKkRVskNNLmhMPsHBvlr7XAq3bdwPpJ7jMuwggKm0fvlLv93/
 7a8w/rRJB2ULOLoJ+ncEmXkDCDQHK1DnFjAaPvH06CW8tN6YlbniR+7mctk7yepSMaW9H4NpVeS
 W5jU6IqRkzbtCeWmKbaQH2OI9vYCirnQlkhqApWHTGf0Fi5E9EJGEnI/f3TKLUN5K35CqjdTKDM
 F7CrfcYpaWLsv0D7cpLdVznvxWUtRD4OK0ag6kiTEmH+xuzbEzaaHIaeifsmy0RnBwtxIOej7bx
 bfxBMSiu69dFaojJFtA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAzOCBTYWx0ZWRfX3RCCWFLhcyg1
 1P5BsQi7+MAmKNfr+6H1LMvBSpeGG+QAJVndF/mRcueAbmGnbRxwZ2aFCyvjI+SpLesZorvpFZ8
 rLxEzRGKzJKvfCiu8Snz/zbTAUZLMwk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240038

Clocks of different VFEs can be fed by one clock source, and each VFE
sets such a source to the rate it needs. A VFE started later at a lower
rate then lowers the source under a VFE that is still running.

For example, on SM8250 the two VFE Lite share one core clock source,
which the VFE sets to 400 or 480 MHz from the pixel rate. With VFE Lite
0 streaming the CSID test pattern at 480 MHz, starting an imx577 stream
on VFE Lite 1 sets the shared source to 400 MHz under the running VFE
Lite 0.

Group the VFE clocks with rate tables by their clock source at probe
time. A source shared by several VFEs follows the highest rate requested
by its running VFEs and drops to the highest remaining one when a VFE is
powered off; with no VFE left it keeps its rate, as it may feed
consumers outside CAMSS. A source used by a single VFE is dropped to its
lowest rate on power off. Clocks whose rate the VFE does not set are
left untouched.

In the example above the shared source stays at 480 MHz until VFE Lite
0 stops, and then drops to the 400 MHz still requested by VFE Lite 1.

Grouping is enabled through the vfe_clock_domains resource flag, so far
only on SM8250. The current parent of an RCG depends on its last rate,
so other SoCs keep setting their VFE clocks directly.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c |  11 +-
 drivers/media/platform/qcom/camss/camss.c     | 175 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h     |  13 ++
 3 files changed, 195 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 359b5942df89..614497235eb4 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1016,7 +1016,7 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
 				return -EINVAL;
 			}
 
-			ret = clk_set_rate(clock->clk, rate);
+			ret = camss_set_clock_rate(vfe->camss, clock, rate);
 			if (ret < 0) {
 				dev_err(dev, "clk set rate failed: %d\n", ret);
 				return ret;
@@ -1083,12 +1083,12 @@ int vfe_get(struct vfe_device *vfe)
 
 		ret = vfe_set_clock_rates(vfe);
 		if (ret < 0)
-			goto error_pm_runtime_get;
+			goto error_release_rates;
 
 		ret = camss_enable_clocks(vfe->nclocks, vfe->clock,
 					  vfe->camss->dev);
 		if (ret < 0)
-			goto error_pm_runtime_get;
+			goto error_release_rates;
 
 		ret = vfe_reset(vfe);
 		if (ret < 0)
@@ -1113,7 +1113,9 @@ int vfe_get(struct vfe_device *vfe)
 error_reset:
 	camss_disable_clocks(vfe->nclocks, vfe->clock);
 
-error_pm_runtime_get:
+error_release_rates:
+	camss_release_clock_rates(vfe->camss, vfe->nclocks, vfe->clock);
+
 	pm_runtime_put_sync(vfe->camss->dev);
 error_domain_off:
 	vfe->res->hw_ops->pm_domain_off(vfe);
@@ -1141,6 +1143,7 @@ void vfe_put(struct vfe_device *vfe)
 			vfe->res->hw_ops->vfe_halt(vfe);
 		}
 		camss_disable_clocks(vfe->nclocks, vfe->clock);
+		camss_release_clock_rates(vfe->camss, vfe->nclocks, vfe->clock);
 		pm_runtime_put_sync(vfe->camss->dev);
 		vfe->res->hw_ops->pm_domain_off(vfe);
 	}
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 7fe12049b78a..68b43a720869 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4509,6 +4509,171 @@ void camss_disable_clocks(int nclocks, struct camss_clock *clock)
 		clk_disable_unprepare(clock[i].clk);
 }
 
+/*
+ * A clock domain is a clock source shared by clocks of different VFEs. Each
+ * VFE votes for the rate it needs, and the source runs at the highest vote,
+ * so that a VFE started at a lower rate never lowers the rate under a VFE
+ * that is still running.
+ */
+struct camss_clock_domain {
+	struct list_head node;
+	struct clk *parent;
+	struct list_head votes;
+	unsigned int nvotes;
+};
+
+/*
+ * A clock vote is the rate requested by one VFE clock fed by a clock domain.
+ * A rate of 0 means that the VFE is powered off and does not vote.
+ */
+struct camss_clock_vote {
+	struct list_head node;
+	struct camss_clock_domain *domain;
+	struct camss_clock *clock;
+	unsigned long rate;
+};
+
+static int camss_add_clock_vote(struct camss *camss, struct camss_clock *clock)
+{
+	struct camss_clock_domain *domain;
+	struct camss_clock_vote *vote;
+	struct clk *parent;
+
+	if (!clock->nfreqs)
+		return 0;
+
+	parent = clk_get_parent(clock->clk);
+	if (!parent)
+		return 0;
+
+	list_for_each_entry(domain, &camss->clock_domains, node)
+		if (clk_is_match(domain->parent, parent))
+			goto add_vote;
+
+	domain = devm_kzalloc(camss->dev, sizeof(*domain), GFP_KERNEL);
+	if (!domain)
+		return -ENOMEM;
+
+	domain->parent = parent;
+	INIT_LIST_HEAD(&domain->votes);
+	list_add_tail(&domain->node, &camss->clock_domains);
+
+add_vote:
+	vote = devm_kzalloc(camss->dev, sizeof(*vote), GFP_KERNEL);
+	if (!vote)
+		return -ENOMEM;
+
+	vote->domain = domain;
+	vote->clock = clock;
+	list_add_tail(&vote->node, &domain->votes);
+	domain->nvotes++;
+	clock->vote = vote;
+
+	return 0;
+}
+
+/*
+ * camss_init_clock_domains - Group the VFE clocks by clock source
+ * @camss: CAMSS device
+ *
+ * A clock whose source feeds no other VFE clock forms a dedicated domain
+ * with a single vote. Only SoCs whose VFE sets the rates of clocks with a
+ * fixed source group their clocks; the VFE clocks of other SoCs are set
+ * directly.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int camss_init_clock_domains(struct camss *camss)
+{
+	int ret, i, j;
+
+	if (!camss->res->vfe_clock_domains)
+		return 0;
+
+	for (i = 0; i < camss->res->vfe_num; i++)
+		for (j = 0; j < camss->vfe[i].nclocks; j++) {
+			ret = camss_add_clock_vote(camss, &camss->vfe[i].clock[j]);
+			if (ret)
+				return ret;
+		}
+
+	return 0;
+}
+
+static int camss_apply_clock_domain(struct camss_clock_domain *domain)
+{
+	struct camss_clock_vote *vote, *top = NULL;
+
+	list_for_each_entry(vote, &domain->votes, node)
+		if (vote->rate && (!top || vote->rate > top->rate))
+			top = vote;
+
+	if (!top)
+		return 0;
+
+	return clk_set_rate(top->clock->clk, top->rate);
+}
+
+/*
+ * camss_set_clock_rate - Set the rate of a clock
+ * @camss: CAMSS device
+ * @clock: Clock
+ * @rate: Requested rate
+ *
+ * A shared clock is set to the highest rate voted by the running VFEs
+ * of its source.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+int camss_set_clock_rate(struct camss *camss, struct camss_clock *clock,
+			 unsigned long rate)
+{
+	int ret;
+
+	if (!clock->vote)
+		return clk_set_rate(clock->clk, rate);
+
+	mutex_lock(&camss->clock_lock);
+	clock->vote->rate = rate;
+	ret = camss_apply_clock_domain(clock->vote->domain);
+	mutex_unlock(&camss->clock_lock);
+
+	return ret;
+}
+
+/*
+ * camss_release_clock_rates - Release the rates requested by an engine
+ * @camss: CAMSS device
+ * @nclocks: Number of clocks of the engine
+ * @clock: Clocks of the engine
+ *
+ * A dedicated clock drops to its lowest rate. A shared clock drops to the
+ * highest rate of the VFEs still running, and keeps its rate when none is
+ * left, as its source may feed consumers outside CAMSS.
+ */
+void camss_release_clock_rates(struct camss *camss, int nclocks,
+			       struct camss_clock *clock)
+{
+	int i;
+
+	mutex_lock(&camss->clock_lock);
+
+	for (i = 0; i < nclocks; i++) {
+		struct camss_clock_vote *vote = clock[i].vote;
+
+		if (!vote || !vote->rate)
+			continue;
+
+		vote->rate = 0;
+		if (vote->domain->nvotes == 1)
+			clk_set_rate(vote->clock->clk, 0);
+		else
+			camss_apply_clock_domain(vote->domain);
+	}
+
+	mutex_unlock(&camss->clock_lock);
+}
+
 /*
  * camss_find_sensor_pad - Find the media pad via which the sensor is linked
  * @entity: Media entity to start searching from
@@ -5427,6 +5592,11 @@ static int camss_probe(struct platform_device *pdev)
 
 	atomic_set(&camss->ref_count, 0);
 	camss->dev = dev;
+	INIT_LIST_HEAD(&camss->clock_domains);
+
+	ret = devm_mutex_init(dev, &camss->clock_lock);
+	if (ret)
+		return ret;
 	platform_set_drvdata(pdev, camss);
 
 	camss->csiphy = devm_kcalloc(dev, camss->res->csiphy_num,
@@ -5474,6 +5644,10 @@ static int camss_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_genpd_cleanup;
 
+	ret = camss_init_clock_domains(camss);
+	if (ret < 0)
+		goto err_genpd_cleanup;
+
 	ret = dma_set_mask_and_coherent(dev, 0xffffffff);
 	if (ret)
 		goto err_genpd_cleanup;
@@ -5736,6 +5910,7 @@ static const struct camss_resources sm8250_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8250),
 	.csid_num = ARRAY_SIZE(csid_res_8250),
 	.vfe_num = ARRAY_SIZE(vfe_res_8250),
+	.vfe_clock_domains = true,
 };
 
 static const struct camss_resources sc8280xp_resources = {
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7dc2fd9f03e0..03d415a5b9db 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -11,6 +11,8 @@
 #define QC_MSM_CAMSS_H
 
 #include <linux/device.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
 #include <linux/types.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-device.h>
@@ -120,6 +122,7 @@ struct camss_resources {
 	const unsigned int tpg_num;
 	const unsigned int csid_num;
 	const unsigned int vfe_num;
+	const bool vfe_clock_domains;
 };
 
 struct camss {
@@ -141,6 +144,9 @@ struct camss {
 	struct icc_path *icc_path[ICC_SM8250_COUNT];
 	const struct camss_resources *res;
 	bool legacy_phy;
+	/* Protects clock_domains and the rates voted by the VFEs */
+	struct mutex clock_lock;
+	struct list_head clock_domains;
 };
 
 struct camss_camera_interface {
@@ -153,11 +159,14 @@ struct camss_async_subdev {
 	struct camss_camera_interface interface;
 };
 
+struct camss_clock_vote;
+
 struct camss_clock {
 	struct clk *clk;
 	const char *name;
 	u32 *freq;
 	u32 nfreqs;
+	struct camss_clock_vote *vote;
 };
 
 struct parent_dev_ops {
@@ -170,6 +179,10 @@ void camss_add_clock_margin(u64 *rate);
 int camss_enable_clocks(int nclocks, struct camss_clock *clock,
 			struct device *dev);
 void camss_disable_clocks(int nclocks, struct camss_clock *clock);
+int camss_set_clock_rate(struct camss *camss, struct camss_clock *clock,
+			 unsigned long rate);
+void camss_release_clock_rates(struct camss *camss, int nclocks,
+			       struct camss_clock *clock);
 struct media_pad *camss_find_sensor_pad(struct media_entity *entity);
 s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
 			unsigned int lanes);
-- 
2.34.1

