Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA0F360EFA
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 03:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784778771; cv=none; b=G57HZzp6WTZJZHIORoBOO2Pt91U76JUytWo2X5Vx0U65RDW2DZACYLabg4ddQgFUhz5DPxWIijaE6HDqgUi/pPInmokBOaEIT+lZT8gVBg4FWVfTr8/y4Yhpx64fD7v1tA4qU7pvsVnJiVnxynj5BhOX3Uo7twcZXN0YFAU7ov4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784778771; c=relaxed/simple;
	bh=pwMxl4llW1/mlAOue/QMpARpxTropptCg8LeYp2N+k8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T4t7zOfesc2GFwaI9QJXqBVlrwkLGdLBM8RAPkTuh8kuB23ENq8nAoa7rXLIEStytkTlG3f+MW5slhTSDgs4xiz3iFzxldefD76zkeAOVVmDBG41DQ8Hbkaxyyr+NPjQI88JPXZvL0b926kqABUNELdq2D0fGsBodOA5Rs76WI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZoiqDsVc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ts0b8nn7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZoiqDsVc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ts0b8nn7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0WsQH2477582
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 03:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rgykcy6Hc2CX22fNjmd0CTN8zd4sRXFgA/FqOczh40g=; b=ZoiqDsVcFXLi0Zoy
	dpanq19udGWYQDayj8NixRjf+Gcie7W64h3BFFC8MKhHNlz6qnYCvmsmcxLBVb9X
	X9blgO5VBLXf0rBKUpzAr+TUiHjIxReJEAJxRZHTueWE4rLrfejCYKZz1CLPKqey
	pcqI/H51RiQiggcXrj7rZW84JoP4iRnq/z6xjrHjDFrXQ2O+dXn+4LhCg+O9EpSR
	oKi3q7TqMB7U5lYl7Nq3v+mPLIg/aXEm+cxJtpT67WThOu1KkoeUU3ToKZEUUP5j
	4orMX7w6/yeeFIuMXl4kYxa50y0J+HTiOmNRr0OBv2rDl1OT85aOUqtbOyItcYs6
	QQxq1A==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjuu7bxwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 03:52:47 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6a31c08023cso18213eaf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 20:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784778767; x=1785383567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rgykcy6Hc2CX22fNjmd0CTN8zd4sRXFgA/FqOczh40g=;
        b=Ts0b8nn7gj3o0Q31K3Ux8kkCmke5ruYm2KXH3AyU9sBZHKAaXgFXANJByKZ11js9Lm
         TIDsEEdO6jdXfq58wOqrQQHICv6hb/BlGSZHclY1sByHd/8l94gjCTac2smBUPc55rwf
         riav+hoQv10lO4VqDD79CdNwRmj/Xu7CUvbxaeg4EiX6eq2WpfctSE/2C131vxb+lsbQ
         zd+bMb0Q1bNIKOelcp4NUhwEIruT0+PLdzC7Ij9v9UgW3Bd0UH5AnB0wbCxLs+Q95pjc
         XmILGQ7NFi3CPF2sZuKVVEwocmJPm26kKLspnYn1DZ2g0wn7Kd6Ijwv3T1B7NJhjO/gP
         1uIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784778767; x=1785383567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rgykcy6Hc2CX22fNjmd0CTN8zd4sRXFgA/FqOczh40g=;
        b=i3VopEB2esqly/Yo1N1zHZn1aIlhReIb8clEXcAELDRzguWJ9t/zvWfJ6FvS7f2rTq
         yBnetAYwSGH1A9Prq529fuCUUwHc3iXz47Lkf0mdBKlgWETw5IPxJ+KxSKnTkrsKLmQh
         1qqwt93J0grA2mH05fmWT8tG1h1Ap1uH3UxzfagNS8pUvxs3tDGG9Y5AjAgTQKTEMF4e
         0dodg/KCpZFjHPYCaoQ5dmDkhUZHUiK3cl81eToVOfaoCfxFgB9bVg4J5qoK2GX3D+nT
         vyjeXVQ0BqZKNsf6Myqw6Md5YF9qR/506UR+T6i+oX1jojeg3aAEE08FUQ1WySiewGO2
         FwWw==
X-Gm-Message-State: AOJu0YxiMn/qtv3JFxQBNtPNgw7pscLkn+4nk3d+6QSF3J+hs10imBLn
	y861L6SjjtLLEfZ1nGcJx3dWe+kCPSlJK8NzK+usynxQEjR17ejG/d+2pe+5sHCPcrF0xmI1jxR
	MsmeUnlml+IjKW+h0NqFLwOJn3k63rO+4sas45UiUOXC+AtsX76oBJ3c2m0ibgBhPnf25GprDIq
	dk
X-Gm-Gg: AR+sD13A1MOOBpqcpyLbp/9Va8ARlClg21wZ82Jne45vaSAqJyDkrYFqXTAMkHE3wsn
	6/OmWkR8diIYewHHZTes5shJck0G9PkexqUwBwMpJGsUSJPcir9xwuIU1ZwaZ4fYvyiUPhoJnQt
	TbShx090OeZrtl4FC8B9rsCfY07pfdLELQ593D9aHwVIkrvlQCFBy4SF53/W39xcM4ndhJhjzGO
	4FpciBd+GtLozGLzeXU9P4zWTrll54oLP78yk0KqpZON1D05LvhOy1Ea0NPju+VY6PPvEoHEUrC
	B8ht2p2RKhLEfC7TLmisVqLtmvMOeOVi/QQFP7lzjdRTZW1SBNHZVbmd7aaMAUb0OU1+xu2E9x9
	ZlNOJze5nX6rIRpjodio=
X-Received: by 2002:a05:6820:4d03:b0:69d:7fdb:3416 with SMTP id 006d021491bc7-6aad4f94077mr476829eaf.21.1784778767070;
        Wed, 22 Jul 2026 20:52:47 -0700 (PDT)
X-Received: by 2002:a05:6820:4d03:b0:69d:7fdb:3416 with SMTP id 006d021491bc7-6aad4f94077mr476822eaf.21.1784778766715;
        Wed, 22 Jul 2026 20:52:46 -0700 (PDT)
Received: from [172.17.0.2] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45766f238b0sm3302323fac.8.2026.07.22.20.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 20:52:45 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 03:52:27 +0000
Subject: [PATCH 1/3] remoteproc: Allow shutdown of crashed processors
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-rproc-rmmod-not-crashing-v1-1-546dfd5de0e6@oss.qualcomm.com>
References: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
In-Reply-To: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Fernando Guzman Lugo <fernando.lugo@ti.com>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=pwMxl4llW1/mlAOue/QMpARpxTropptCg8LeYp2N+k8=;
 b=owEBfAKD/ZANAwAKAQsfOT8Nma3FAcsmYgBqYZALuNEvaMqMuJklvHLIFqUCE+M0izJ/lakts
 +J1nvWj9AuJAkIEAAEKACwWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCamGQCw4cYmpvcm5Aa3J5
 by5zZQAKCRALHzk/DZmtxZbbD/wKH9vAp3wW6aKPXk4JQuMqXiJD6AREiizeAWE9SVp4cX65TGg
 XLlQit5LgUuRooVxX+G12KF9GlSf6cZU5ZwdOdq9u8yOGNCzZorurYj5lr77ISxj7z5kq7JQTog
 sQ0ETFWKSPni8e/3BxH1DyHiODEdt5rtaidKajSeF+lJyyT/ImsbvNjSkFIBGSRcDNqxkxdCRXE
 +bmAH7mSUL4RgvfwqhbhGVLes8BORpljHzVz2IWaSvh5gVtwXeF7TG+l3QgUhfW2N54xEuglwLm
 KCnbFL0K8UqyiSTZFSNyr1j2AcDk4eDjtjFIxGdVtVAYNl9cL+MTXwHBs7R/LXv/zJ/es/FsPRJ
 5JSlBAGBRXzBPZYHdCkVF8MU1f4G68dwAzrPrEZUOxlUUSYHmXH95EEGFyVVsbMRk9bbOHiMIi5
 jMK87hZkTUQ5Bh+3VKm9kWX2bht/qRLq7AflOY1qwL4jZwdqzfnm2bL+MtxAYN4navKpgL2DTFF
 02rtXUDPyDyrMfpU/hcMjFCxyWEsKWby26Jbxf2MdbZG+FfB0J3uLj5asWK0X+ogBEgD6g3Bhtc
 Zq+kfA7xpP9YwnhOc4kSOR6hqL0NeimZDtYPt+VXN36I9FAnXjtcctdL7VWO9K69x5lBqvVePCj
 KAtPu5y0ntJH+gF/oydRMHTtqeiSoTPMNqA==
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: Ez4uS1goui_0pTn-8Ne89THg5Mc1TheA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAzNSBTYWx0ZWRfXwFdGi6qj0nW4
 6fm3rSGVLtdxVLaz9jYX2Wmpd2/ua1xae9qXHIKvZIpAAYprystI/4K2Q+OuvKS7vY5CCdYR5Y0
 73UdaI8hcLVtSFDcrQFoh8aEraOmiLI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAzNSBTYWx0ZWRfX+htSn/BgRXPx
 TaR6lv36qqJFlxv9Y2DK1hZSrn600gA+BJ7DwyjMZisciHSszN8uK2xxZpcix4E7oX9LMn4i2Qn
 LV7aCBrpEKj+0/dVf1lEpnTzBz0+ygMrNDAjReIWkcA6pjN56VHQkG0CbTiYbDc9MPCFj7wjjVK
 h9t79nrWAWUbPLw4kldBvNfhBG/GEt3/3GVqp1umr6Nd1bqjyN9u5QS9LEMJjLP1gwQVF/Y5yDP
 4TIxBbwsYpnpAFUAOHX4ymRdg5SjRkc3+LPISXnbkasaBWeUmayQQiHp50aTI6JuNDJFDFMNGcs
 ZPYqXDKnn2PBw2CVpy/uXoaScA956UOsxG/sHrnEBLETn9Kivkd267kYc4d+ZaL1GkKZhV/FkCQ
 ICd0LA0ijN2fNyeYe7JLTlTCfJ0WMfmt6tTORxpi03qmStTkj/20fajpkZ80cizkqdTUBpVXd3Z
 GFIKzn1k0G2ITKV1gBg==
X-Proofpoint-GUID: Ez4uS1goui_0pTn-8Ne89THg5Mc1TheA
X-Authority-Analysis: v=2.4 cv=JuTBas4C c=1 sm=1 tr=0 ts=6a61900f cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=BSaFMngucRZOfh4nmS4A:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230035

rproc_shutdown() rejects a remoteproc in RPROC_CRASHED state, and
rproc_del() ignores that error. The result of these two decisions is
that a user cannot stop a remoteproc that with recovery disabled that
has entered a crash state, and removal of an associated remoteproc
driver will release resources without first stopping the remoteproc.

Allow rproc_shutdown() to stop crashed processors. Propagate the crash
state to subdevice teardown, to allow subdevices to dismantle things
appropriately.

Assisted-by: OpenCode:GPT-5.5
Fixes: 5e6a0e05270e ("remoteproc: core: Move state checking to remoteproc_core")
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/remoteproc/remoteproc_core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 0583d3a56212..3cd4570513c2 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2002,6 +2002,7 @@ EXPORT_SYMBOL(rproc_boot);
 int rproc_shutdown(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
+	bool crashed;
 	int ret;
 
 	ret = mutex_lock_interruptible(&rproc->lock);
@@ -2011,16 +2012,18 @@ int rproc_shutdown(struct rproc *rproc)
 	}
 
 	if (rproc->state != RPROC_RUNNING &&
-	    rproc->state != RPROC_ATTACHED) {
+	    rproc->state != RPROC_ATTACHED &&
+	    rproc->state != RPROC_CRASHED) {
 		ret = -EINVAL;
 		goto out;
 	}
+	crashed = rproc->state == RPROC_CRASHED;
 
 	/* if the remote proc is still needed, bail out */
 	if (!atomic_dec_and_test(&rproc->power))
 		goto out;
 
-	ret = rproc_stop(rproc, false);
+	ret = rproc_stop(rproc, crashed);
 	if (ret) {
 		atomic_inc(&rproc->power);
 		goto out;

-- 
2.53.0

