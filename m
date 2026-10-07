Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B82845FFA8
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 11:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373135; cv=none; b=VYmzaqLDKc8ASk9+6HHdOMbDz8PO3eVxzwAgmrao37X5n8NHRrZh01MQDtLqJWjkAhOw/2Y8iQWotSaiD8ROqp+GRO5JZX1oWVkBj7qcmcidM8lyasIvrP3kJTy33U6kgl6aYe+k0ZRBj0MuSWCQX2JGQhU9bmWhUlK+wc6au/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373135; c=relaxed/simple;
	bh=afuy3gcJG6X0tcLVajc4e83VvGe2ro49y2oZvp2SD88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QKSOIdvs1HLrpD/Ii0B4Y1lFyqakGo9cL35QVHXKtLyUIjP+qdbqHvKbwLc6RZdvFaPb0EaX60XDH7hnW4M5sae74cNeN38GoypPBMhS2zNJgaANhOSkCLfam1UveEEIM/EjVZHn2Zc9w/TH4KcKM5RdFYlOc0J0QHQlz4umsuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DHe6B8YK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UvcHV/H8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DHe6B8YK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UvcHV/H8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BVQf8110378
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 11:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3FrnDcSaNRyROaC289Oqmi/Hqql0JDCxDd21OUiOnXQ=; b=DHe6B8YKImhJyVcZ
	vAKEaRF7m6OHR9HpbfqoQ8RrMx5bDIBATGI2k5xJGPBHKS5LmKjiu9P/jo2TSKQZ
	+7ATPhZYsFH+0ptv8H4qmTevn5StVuJH34Uk0Vn5bG7FG4Aj72JS63WqgsnAq03I
	9p5jK4kS+WRfYWoE3ge7wKr4TaizphVwPgQAPIIFV0Y88lk3iCHFyms6Wng7o5Cz
	rueyengCs7vD02fp+3ZEuN6Pe8ody1+7ghnjGDwy+TYYs7L88Ft+26ZGEF+iVJPO
	FN7xdhXXAONXwekqB0+V6hX2BUWlV7JqYVDQLw71Ic4HOSYy61i7w9tmAM1wTLBF
	kZBhOg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5gvrs0an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 11:38:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a4f7eb79f2so4020332a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 04:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791373103; x=1791977903; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3FrnDcSaNRyROaC289Oqmi/Hqql0JDCxDd21OUiOnXQ=;
        b=UvcHV/H8DR208VtX571xebDMEaAAab64b4WzdlaHPAtQF3n1x/A591S1iVdMjkEH0c
         xg4JmxDuj1oUvb/sKnTcqW0LDQ69lkcARsjs55gJSaY3IvxkMgAgHVYsfwQwwdSldsrQ
         fSze+reNNHMIbGaoNolwAAgRAhTocVp6tO1OoNcMds/9l3dNy2+sA8l81VZ2s28R8OzU
         OVhXGmVUUns4IgB5LC+EHV19WjYTTnDkz0U72gVpp7JzsurXhzWY4GO2/Vwh85ziQnLZ
         V5iXpJLJuXhU4xeoDnME02MNDsB+fJ1IwiUW7BQv2kBieziS8oESUqoaWWAm1pPq6Ofl
         sQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373103; x=1791977903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3FrnDcSaNRyROaC289Oqmi/Hqql0JDCxDd21OUiOnXQ=;
        b=H2xd7XbHo39BycSnn7yOABQ28VXgzB0fdSFAuCTIc1ojzCTvp/eZy4ttBVFgB2QbH2
         LWbZkYdzJGmZGSq0QW5gonamo7TJ8k9TxNHkZnRzYbeRJFpPNam7mjXXyCRN25Wj1xuR
         56bLkLVVDQYQMskqUgY3nZvwBG/9yDMcz8EkeFdziFMOa+eXJmDLfbEzTqCocbeFZIn1
         mVVKDky5JBCixtAcn7BZgp2UzAhjKL/CWbdRhgvqxUorhlODqeMZFRZ54qSfBgYpj5fa
         5R0yk5ZjsnoXEaCjH9uYCQldvNO4XojBQqTTdLaTwrqt+Scn2h6w5fzm7PjXyN3eIIWr
         Z2hg==
X-Forwarded-Encrypted: i=1; AKwUvBzqoXmg6LDWncK5k+Q1HcqlybxqOGkmvKdxs9O+NXJ+p6ASeVg3ueuoFDRBF5Pd8CXRNfehhnNd76gPnZ8G@vger.kernel.org
X-Gm-Message-State: AFq9FYJBTR0G2jcNdtE6soGaOql3kPAnqeBABpDdEqDcV95z8qmYfEJN
	307gLsQ46TcrrxJysX9AmmBHkJsm5fY4zMqHawDolg3tY593gGChltx0U35nNzIiii/pUQTmI40
	Bn0wsgW8n1E1+41BBJy17tQ//GlRMLPo4dWSvdcH0U0rxW1nPL3euj8BeDfzrlq12zVGv
X-Gm-Gg: AYBFou2MG0uSY1d/aYGptkGLYqzl546uobCj92cFJ/PFUcAQpL5mV0at9LrFElH0zg3
	GnVguRnM6NVMXzRcjwWZ2UroRECujKiIEl+NuFMB2bIDDAJitklKZKgphcF0GnL5OHN28OLKa2J
	PyRfbOYz8AxEatFnQgAQ/s7gaW/NNi6v2nrmusKEftPbWAe7W9j0OUIKDVDlgsjTPIAlWK5aj97
	Hh5j+3A43M67hU6MN8iBNzoS6M29PTWxlsd9HxG/FyPQJ3427Oz7wFsXrJiNFardpdycNwXgiP6
	/i7srSD7HQhUYrNmn98JQQ145CPtubV8skjutVdgoyYiN8Sn+wlFrrTBLCi39NlHUqBKwxJYDsZ
	5yChkgaTltMnBVRhTozkgYib9ZrjIiBrq
X-Received: by 2002:a17:90b:2e46:b0:3a6:582e:5e17 with SMTP id 98e67ed59e1d1-3a8a11c886cmr1203102a91.48.1791373102754;
        Wed, 07 Oct 2026 04:38:22 -0700 (PDT)
X-Received: by 2002:a17:90b:2e46:b0:3a6:582e:5e17 with SMTP id 98e67ed59e1d1-3a8a11c886cmr1203088a91.48.1791373102242;
        Wed, 07 Oct 2026 04:38:22 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a5e0eeb6sm1454001a91.2.2026.10.07.04.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:38:21 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 17:07:50 +0530
Subject: [PATCH v2 3/4] misc: fastrpc: add extended context bank support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-extended-mapping-v2-3-5dca3aa2c2d3@oss.qualcomm.com>
References: <20261007-extended-mapping-v2-0-5dca3aa2c2d3@oss.qualcomm.com>
In-Reply-To: <20261007-extended-mapping-v2-0-5dca3aa2c2d3@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791373080; l=3139;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=afuy3gcJG6X0tcLVajc4e83VvGe2ro49y2oZvp2SD88=;
 b=SW0+U9QGKo98uatXv0VcoeV5PqwBiNnwxs+rI8CLa5KpJj3AyqGUm521Zqk56NWTlvjE8IhSn
 Oqru44pRNe1A9safRUCqkNPZsTSXyE1qlj8tECZAXz9atJuFddzAUnS
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Authority-Analysis: v=2.4 cv=W66txhWk c=1 sm=1 tr=0 ts=6ac62f2f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=x2TTKIeUeEtxnJ4G98YA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: OuPATykC12YAVKu1X40zfvrkKydz72Qq
X-Proofpoint-GUID: OuPATykC12YAVKu1X40zfvrkKydz72Qq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NiBTYWx0ZWRfX7dBvRA8cmKK0
 HKQTJVKxojLSTiLgxgSBRNI8qHv51gIL1zvRI9NSvP0SfPA17SapvhTIF5tQzdP8r4ysRZCkw+4
 3f9jxUeh05YbS4hejZcqhY2/26cCqUkR0s7zzdAGWBmwkwTl87ClwjYxLv2Dbrp1LyqCcebG90z
 gAdsMdCnzM741voZhR4d4TPP9DkS6+AP9p7mzjzxsYj8MGPtzf6azSO8CNIOWk5jYTRRY0kByYQ
 dph4jfrEjJuiYUYEeHN6pugG2V6KLHQTuHvwWeS1DodMt1VodJ6LXIZ1kaMkl5Z7BtDRzxXabi4
 CVmszQT+qQAcmh9Hu8ub73BSy7pSyZ5JhStFUXGGu1bNtJ4KwSS4yjx0QkCdYmVFMZXfD//MsU1
 PnQvC1IJ3rKZZpCz8DtJ4GGGYL2UOJsypxJtLiO4zpTSj1rdAtirhgqI2eQ1ZiHdxiAYFUKoDS+
 YwbOm0Ss5zJlCFdkwbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NiBTYWx0ZWRfX9/Wi5q1PJgQd
 /PgIfRp0TnzflkqQI+MNNWx3j1zgrePXbD1NrQjc5Att4fn/FTsb5icjJoX/tN+sZ+BOFzEAti2
 H+adnkcA/xiEiNpyivqBJMlGDYxxcy0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070046

Detect extended context banks by the presence of iommu-ranges on the
context bank node. Register them in a separate ext_cb array so the
mapping layer can direct large allocations into the wider IOVA window.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 5c7bb56cf46d..d40cdcd5dec3 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -307,6 +307,8 @@ struct fastrpc_channel_ctx {
 	struct qcom_scm_vmperm vmperms[FASTRPC_MAX_VMIDS];
 	struct rpmsg_device *rpdev;
 	struct fastrpc_session_ctx session[FASTRPC_MAX_SESSIONS];
+	struct fastrpc_session_ctx **ext_cb;
+	int ext_cb_count;
 	spinlock_t lock;
 	struct idr ctx_idr;
 	struct list_head users;
@@ -538,9 +540,13 @@ static int fastrpc_remote_heap_alloc(struct fastrpc_user *fl, struct device *dev
 static void fastrpc_channel_ctx_free(struct kref *ref)
 {
 	struct fastrpc_channel_ctx *cctx;
+	int i;
 
 	cctx = container_of(ref, struct fastrpc_channel_ctx, refcount);
 
+	for (i = 0; i < cctx->ext_cb_count; i++)
+		kfree(cctx->ext_cb[i]);
+	kfree(cctx->ext_cb);
 	idr_destroy(&cctx->ctx_idr);
 	kfree(cctx);
 }
@@ -2343,6 +2349,7 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	u32 dma_bits;
 	u32 sid = 0;
 	int rc;
+	bool is_extended_cb = false;
 
 	cctx = dev_get_drvdata(dev->parent);
 	if (!cctx)
@@ -2352,6 +2359,43 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 				       of_n_addr_cells(dev->of_node) - 1, &sid))
 		dev_info(dev, "FastRPC Session ID not specified in DT\n");
 
+	if (of_property_present(dev->of_node, "iommu-ranges"))
+		is_extended_cb = true;
+
+	if (is_extended_cb) {
+		struct fastrpc_session_ctx **new_ext;
+
+		sess = kzalloc_obj(*sess);
+		if (!sess)
+			return -ENOMEM;
+
+		rc = dma_set_mask(dev, DMA_BIT_MASK(40));
+		if (rc) {
+			dev_err(dev, "40-bit DMA enable failed\n");
+			kfree(sess);
+			return rc;
+		}
+
+		new_ext = krealloc(cctx->ext_cb,
+				   (cctx->ext_cb_count + 1) * sizeof(*cctx->ext_cb),
+				   GFP_KERNEL);
+		if (!new_ext) {
+			kfree(sess);
+			return -ENOMEM;
+		}
+
+		spin_lock_irqsave(&cctx->lock, flags);
+		cctx->ext_cb = new_ext;
+		sess->valid = true;
+		sess->dev = dev;
+		sess->sid = sid;
+		dev_set_drvdata(dev, sess);
+		cctx->ext_cb[cctx->ext_cb_count++] = sess;
+		spin_unlock_irqrestore(&cctx->lock, flags);
+
+		return 0;
+	}
+
 	spin_lock_irqsave(&cctx->lock, flags);
 	if (cctx->sesscount >= FASTRPC_MAX_SESSIONS) {
 		spin_unlock_irqrestore(&cctx->lock, flags);
@@ -2391,6 +2435,8 @@ static void fastrpc_cb_devices_destroy(struct rpmsg_device *rpdev)
 	spin_lock_irqsave(&cctx->lock, flags);
 	for (i = 0; i < cctx->sesscount; i++)
 		cctx->session[i].valid = false;
+	for (i = 0; i < cctx->ext_cb_count; i++)
+		cctx->ext_cb[i]->valid = false;
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	for_each_available_child_of_node(rdev->of_node, np) {

-- 
2.34.1

