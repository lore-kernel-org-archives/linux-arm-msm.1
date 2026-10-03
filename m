Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DC26FC5
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 00:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790985790; cv=none; b=BXoTq/jowh8JySx+AzuhTgvuOivAAHs+csmgyGEfGLH0Bc+OaqDfa2SpjN9CNMngTU5fxR0pZ2KxRoOEeHV5JTX8rna0MEL/EM1ERF136GdZ8OR/wah451IHBlSk16XV2cXOz/ekNxfKM7clFN2bLsfAJAmHcJRa7qpCi3fJb/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790985790; c=relaxed/simple;
	bh=2l3PQo2eShkqZe/3T8M+sGU7B8FyT9nkOEpNVRVu5Rw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iuoETzUj+EgGhSzgOiTURCmC1UscyjPvfx/8l+ED+KjNgHkC3bM5LS+4Ne84COXYCV7n4QxZnb/rpwX9t/Ce0tL6jvi8VVgns4AqPbpa/tCkOr8GHLdGKRVaW4gVMNAs3hsYejuCnKvi2OYgXFHT2oY6lO/aZM2wNilVG3BVBis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C0K4rj7c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WUI29wcD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C0K4rj7c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WUI29wcD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NeAp32104826
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 00:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VyK0jJ9gcM0BdaaalrnnAAq4uZXo0yp3EptmyJF9IeI=; b=C0K4rj7c3yk/9m0Q
	whwlBeuvYuxmwuFzLoQ/RXDn11nrKRD1xQF7sJeUKNcDWOoAKAL9idWqa9SO+4gJ
	Q8N155BX1leEVofxidc255HePNPtCoQ6mPDJBTTHH/9wPa2qYKHtaX50xPpwH7Mn
	mYtarRolXaXkAMeL4wdNwXVVXH719+dlgc2GHbliJt3NfaeJmH65vU0FswIzYQcC
	q3hBfnL0E5lN7iG0ExBdyoPKpTAWtVEId08nTTyLYIpI6nEn4aGjuVoODSaz0Ehk
	e+3YAwQV7etggW+Xc6XFO4XsibMutoreivwFdZHp9+moivMyS05IewJJCMaUcJ1B
	lie3uA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2dxdja9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 00:03:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e46c120dfso8690985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 17:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790985787; x=1791590587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VyK0jJ9gcM0BdaaalrnnAAq4uZXo0yp3EptmyJF9IeI=;
        b=WUI29wcDJ31PCwyaXcwEsjSVpeyCsy4yML5pj4t8tYV8hVeMHGvBuDGIpyG6njAzO3
         DgPian6L2cS9C2mRm8pg8xZeUcFcEEAV+vJzkICN8BHTeWxik8f31v1K60rJer2xSSsh
         41T9pXZfCW7JNW/J4Qy3w/cIa9e6iZ/QUqTsWXBGZb6qY38Jaz3HWTP6QAVE+VWKR5dF
         TAkr6ykTaYFL2+JSPARZGtth5+9yxVEnScmqoPT4TJ9Sgd0nywxGzy2lVQtMwYRnlMWj
         SDSTM6xVQ6qT+44sZ+Ji4vOeWhz3/9c/0+T9lBlSnXBFtl3cop7dnHVKpeVDR8O6HBj6
         R9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790985787; x=1791590587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VyK0jJ9gcM0BdaaalrnnAAq4uZXo0yp3EptmyJF9IeI=;
        b=ED5Dav9chkUd3mkqxCE+9+hGdvnUpRfQ6IcMyA6C9l28b7tYUC9f24lvkbTxzKjWDR
         9dzkhdPbMjZTBvAtY8MxBEwCkoUSAy+SVrwMEsjHwU7DpOqQrY/GB8nPW7jcyJ+rjP15
         D7tkHL4T0NEr4vsGUJPImtF2uRsg0+Ut/rbRon2czJye0dELBvpywMxkCJcsdlPxD5Yn
         3wtrsi/PSnlDaSWD+g9FwvrOQzuRigzcdKI50JEGOwbEgo3uIfdNTebY9IZzMkZJKAQ+
         QIUekuFRan8VK8mo3OUgTf74Q1wjOjcCJdormNGwSEjFfE70mYBXpEDyEPrcgeZquBte
         sJgg==
X-Gm-Message-State: AFuF++mUqPCQIjjL4CR/OzD/vMZ6k5BW40SPT27bQ/Cqe6/NkOAcHD6Y
	XNuVI7YaXJ6XsJmw3lqRBGbAg7o/WYzRjP3OoaOAhvwoxw/aJ1gqR8XxGhqhirfNFitt8ivjyvY
	N7ftfcr8jUohHG4cgSbjE27L9wpIMRwRjUPR1jOtKhum3zzbUiZAceqCGhAdQIBHrGQslfoopI5
	Jc
X-Gm-Gg: AYBFou1eXxim9HGZGK11b4No5rsp2U5ENFUXmI75Unv2T4q2fU6Z3JKXAxCIDvJnR+J
	mG8FdLLFteU1mxcDxnQLPy3lK0ZI3YNuorx00hHEOSLSgPBPCFd0liIi014QBj43wGQeu8gJjeQ
	GzDhotQyITnpFgTI4t6UREyL+yMUVtLvdpsVIiLa5VenymE7ZWZQ12870yJesxbRYprgI/mWyQR
	mIc8notjEXMrPIGwTvW0nA/+HNLfM5dg8noNIuu1Mkh+tWGBiuSEetvsyzFUeGkp5BTAzw7EHgK
	fKcl8HjOxlpVUP0hIy0ss4NWlNcJ8DCxJ2cNs4Kz+1GBHf2bibt9NUsC9JfMiw4aPzv1ut4BDYL
	oM3P7BPckgRaILfok6qrvJtvwLrHuIk1gPUJ9k86kWcEoe1U9wuYwWhAOaCskz+Xa1mkDw1xukf
	B8Fr37sh0aCpTs
X-Received: by 2002:a05:620a:459e:b0:93c:ba88:cd65 with SMTP id af79cd13be357-93e50e4a8e1mr195371385a.7.1790985787356;
        Fri, 02 Oct 2026 17:03:07 -0700 (PDT)
X-Received: by 2002:a05:620a:459e:b0:93c:ba88:cd65 with SMTP id af79cd13be357-93e50e4a8e1mr195363585a.7.1790985786772;
        Fri, 02 Oct 2026 17:03:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e2f7b4esm14234531fa.14.2026.10.02.17.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:03:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:03:01 +0300
Subject: [PATCH 3/5] drm/msm/dpu: assign the mixers to the CTLs per
 interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-dpu-quad-pipe-fixed-v1-3-6a6a00917b71@oss.qualcomm.com>
References: <20261003-dpu-quad-pipe-fixed-v1-0-6a6a00917b71@oss.qualcomm.com>
In-Reply-To: <20261003-dpu-quad-pipe-fixed-v1-0-6a6a00917b71@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jun Nie <jun.nie@linaro.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vinod Polimera <quic_vpolimer@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1494;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2l3PQo2eShkqZe/3T8M+sGU7B8FyT9nkOEpNVRVu5Rw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEY079w/wHb9RhpVVW3RfbfHnFHNQ0fcCjDPp
 NDk9k1ceW6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBGNAAKCRCLPIo+Aiko
 1bE+B/9e/2Lri4CStNavGIBcLvzw6LYy9zVBZyF5O4q+8tnrC2FoTEYB4CmQv5h4gZrQK0I5Dn6
 zNHsXOHnAxSqsgZYBIyVsOQNfeWUMq2p4fWq10Pjr+hxbo9DpK8UKJYNMLoKDpoDIkvb6FTUz/H
 91gQj1maMQq6c72dd8LLsGE17SebG2MxoGfj+vaGswvZietDNyEhBLs+9I6ksMVwaWoEHduGR5f
 +Rr6M7wIvW5xV3CoU9P9OOhqp+jqSuxCojQwlNPnJsIcDg37qOCLznOUaEXgZl7aUBh7bMHPB4j
 BSDmdy59NIdTsZcplZkrUtbJ4Z3j4W+PwKw1L+YbTYoJundB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA5NSBTYWx0ZWRfX+u8O4wDEN+rl
 FqerMhd2/IY7W6sSQ6RpMhWvEvbabpt43n5vRuJPCXxABrESWVZgJrg22rnbSmyg1iIlXQtY2A3
 5SulvxRkZbuvztnZgMcKQBxdSBAnt/Y=
X-Authority-Analysis: v=2.4 cv=Ko/YSmWN c=1 sm=1 tr=0 ts=6ac0463c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=vcdmnXjnQzLUmDnc4OUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: VYRczW8LWUFv4XqGarMrC8wPrwd3balf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA5NSBTYWx0ZWRfXwP5G5OWLUah+
 nzjDKwXhWC0LmXLauJoLJWGLZi6PXGfIdXqllGRd/o1vfQPPs38czQ9byehkBRyJFmq2yyheYhc
 nxQGvMEEQqeMAzsUU9fl6sn9aaHgqc7ZyTSHzOvEPg2TyK1/QDUbFniH5knaMnW64KDT7U1jXvJ
 qaLLUMbp0MYe5obILAUKmU2Ec7ekiBBKWYD8HrLMHiuPPvw+wOt9VYlx6GnyH5rRFn+rspnJ239
 zlsnAq8kfuNRgTtJuyNQLPPe8NpkDDhLoD/re8i8hK49OU5BcNsGeSrJ7KUhOmTn7/02XfzCdfR
 coIDcoi6cn3r0Gh/8ZdYwgLa9CnVNuc7kprcV1j7xQ5jv3W4sxXDJtY+dKOucUlKdIaDdb2+k+D
 Gsg/5JLgjMQHtdtlxYn1UH+FlS+CJf8RVOSyP0JF9h+yckDNRPOm9gGPK8I+B/tXCjahzpPKia4
 yQTE/nNf9PxUy7TAdCQ==
X-Proofpoint-GUID: VYRczW8LWUFv4XqGarMrC8wPrwd3balf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020095

On DPU < 5.0 each interface is driven by its own CTL, which has to
control all the mixers feeding that interface. However
dpu_crtc_assign_resources() gives a single mixer to each of the CTLs
but the last one, which gets all the remaining mixers. This works while
there is at most one mixer per interface, but it breaks with four mixers
driving two interfaces: the first CTL would get LM_0 only, while LM_1
would be programmed through the CTL of the second interface together
with LM_2 and LM_5, leaving the first interface with a half of its
picture.

Split the mixers evenly, so that each CTL gets the mixers of its
interface. Nothing changes for the existing topologies.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 828187f46eae..57f50a3cd9cf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1469,7 +1469,7 @@ static int dpu_crtc_assign_resources(struct drm_crtc *crtc,
 						 ARRAY_SIZE(hw_dspp));
 
 	for (i = 0; i < num_lm; i++) {
-		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
+		int ctl_idx = i * num_ctl / num_lm;
 
 		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
 		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);

-- 
2.47.3

