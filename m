Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67044DE70A
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 15:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351958; cv=none; b=UwHoOfTFva3jv0HAMPlJgtWkNgZkKE/6Mn8wNOwFDiFPDDEmxvvHpTlBIxErQe2HDffJOyy0sknW5h5HQyKCMLVFNoZUatOo3uWG4dbemhY8xE8QLB2gLIRzR5bdqZ2kteQSTJO4NMRzVR7CSHm7rklK4UdneGpWINwFwCkfZdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351958; c=relaxed/simple;
	bh=TWS0Yx87NBHxxrxYWO6SXYvIYxpyWIRZf+bhCzU+Trs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ETYUtPvuTLpdZfm/orah7R6jmk10fQLLWGBT7CBMW7EWuCfWMyN1J1FspdDmhqOoGQQLqvjN/ongzdg+0hiBPnrdu+0BXiM2X28mBboKbeB8y809yyfLuZRUT9MIRZMdSfCpVUS0UPhYcp6VzNiKbg8IHElwAM59VoO58zMP5Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CNeisGAd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZxhOjfYF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CNeisGAd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZxhOjfYF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PDuZZn600490
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 15:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i3tD8eNypyv
	tY1j258u6wRodTx6BDbTX1sIc4pY1tDU=; b=CNeisGAdoyvIOSATXZdYhJKtatb
	kX0BKeNK74VUYi1svbbWgIjtQSK2zhIdhrtxgZLmTy25fiQo3r5t9UkyVc8tpdew
	+7px2QosmNDjruUtBU6VIsGHQv9yQLDSWacEKOhax4eVT9J3UQ2WXuqvdw5B/pXl
	+i5HvQ+WQQ3fXMYACHsLIeqOA031S7DOGySn1zKl8pe5gKftvPbKHXlKXazTFQBP
	WTkYcqKVCT+Im6X1UodRM8D0MlFaPtuodGZcrBX08JkqT1lsfdQYQu34TvRpjtcV
	MJjfczCgiJ+f3YFwJAbt7cu8RPP1KOJRDh7Mi4yP4LXcUscPb56syZm+DDw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvt2dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 15:59:14 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-880e099bba5so331588b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 08:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351953; x=1790956753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i3tD8eNypyvtY1j258u6wRodTx6BDbTX1sIc4pY1tDU=;
        b=ZxhOjfYFF4DceWcWNqPBuD/e6vynvFsTAYzuPeAGOjpqw3RTJpfYmgO2FK/cV2azaW
         cAmdQ1Zr5H05X/0IWAUiRhhsRvrBtsiiSsvvOYDYvk/D8m4mPdyV8kueUTtsyJzIPvOK
         a0rJ6T4jtQIkYlLzQeXmBG1aP1EnWsDuxBeXWq2hOgOTfFvRWD9TUxmKaYP5L1/CwN9J
         A338wCynCwcmAv6vhdasKO0Fhj46+T3d0ZV/oABfZh4dtfz2vDOy7MWi/7g3xo29zcvP
         Vy/tJ0X2/mPEAUMjXRUmqwbyxoiyahc+EQ10c/YkFIYmPBciKLzxDW5QrIP6JxQsVdo0
         3luA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351953; x=1790956753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i3tD8eNypyvtY1j258u6wRodTx6BDbTX1sIc4pY1tDU=;
        b=VPIfPoa6Ydzdd+DCFCWLhNJ0CuxyVXZRVwa/DJEBgbyHAKA55qjVIj51U5aUNxq/rN
         Ly3ilKI1xv1m+GCpf4prx4pryjmLJjggiA29VRS3uBtB+LxyrpDJ6BCEPq566tF0cX7s
         USTrcyrpqqt3bopqJRHVvZbSj3Ps0m+PMvwALl3YIIDSHLUggziIYMh1nCVq/nJ7huth
         3Ba+SA0iGCuB8g/Qv1EIZRbAByr91xDAcL1FlHF5MEJ134npww9N2qAGntl1u/LfIzai
         IvknjgVDtCCIU4tsZrc8uPawNiE3WenmU7ACfmNW4z4xDmsUtoY/EaMhdcB7yIPVS+dM
         MyVg==
X-Forwarded-Encrypted: i=1; AKwUvBxdufOvbZ4laqCWOcCb5yeNv0WbM4C/Vb1D5UCY2k1YumEBXqZoaRx/CMg+o14hulKTb9AAaJbLpwJyYRWI@vger.kernel.org
X-Gm-Message-State: AFuF++mmJkCER6pj6F7d5jacwpc6H0/C/XmSfLm7ZgTyyjK2iOr9pxrO
	1tgu7K7A8hQrl4ROwY/lWeJgJmAIIjt81hdIOWuGp1d280ElZRoQu3HnaM20RRQjCcTen0hlp0u
	066PhfiE3UcwpRyhXNNj8NNcCLhcCuG8CSR2PnJES4M6e2HzXazNhbIMX9RxkQZ9cT1c1
X-Gm-Gg: AYBFou0P3/DnLGZr7R2W7zKHQq2FUaNQeqvohwXTAfHrEGXUldkP1RNRZMYY0z7G6rB
	3ZuNkpcrnfj04tnINbddzMubABDx6pJF1JX+ZZ/VpsThZEh4yagxqQXalQsSj/5WBeOCnyDMTw+
	+LTT6fPo+GjyFg3gGNK/uyiudDGeKe7D1VGIJRlK6nEzO29jsnUUlxKTitbf5G7CvOwQCaA0Y5k
	Cz+6G6Fs5PFqkWjypzzYaBizkleiKJNRIl3ic90TD7vL1WiwTD8Ed5kzh4QoSayjUQCK7eILTdv
	eG+TsOlby1TTLyCh15MbkeVAQsoIKPxtxVNehuTCcbrRZRwOKvTR86OdjJTHC9Ck1JUMWRD8Eyi
	7UTWFaOYdcpwL6tsfFq9zbhDcoXU=
X-Received: by 2002:a05:6a00:44cb:b0:857:7337:5db4 with SMTP id d2e1a72fcca58-8802a0bd308mr1996691b3a.18.1790351952542;
        Fri, 25 Sep 2026 08:59:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:44cb:b0:857:7337:5db4 with SMTP id d2e1a72fcca58-8802a0bd308mr1996641b3a.18.1790351951930;
        Fri, 25 Sep 2026 08:59:11 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87ff354d854sm1361299b3a.2.2026.09.25.08.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:59:10 -0700 (PDT)
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
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
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
Subject: [PATCH 7/8] soc: qcom: mdt_loader: remove qcom_mdt_load()
Date: Fri, 25 Sep 2026 21:27:36 +0530
Message-ID: <20260925155737.4161358-8-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: o2oHmFXv2kI265yT_2wyLFmiP--5rwXM
X-Proofpoint-ORIG-GUID: o2oHmFXv2kI265yT_2wyLFmiP--5rwXM
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab69a52 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ZW49mn9jNiMhmSsDLfIA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX9+ZRTR0NlbJP
 4S3fYWfKQcgW7KvcmX/csthiSE1LoGDEDC+5+JpvklKr/JaHW/f2bg2MFU761r4+HSJvGxcApZc
 /72toSZFcPdotFIoxca0ZAWl/EcMupk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX2KW9H555QvKG
 ejaDc0QoO9N3J0J4z6wZ98ujd7e32/88xZP1dyn5X+bud+aDEitdYuxdO2uEsnxaeXa/YQ2wp5X
 kWmaa5KP+pK2XT+xdQv330ClsFg0hUK/HlkBqnF8iKTBaHreJEAY+348IUevU8vfDtggXFPb7ak
 cmEj+uc4t9qxYEdsvI0ik8ZlS3hLY4se/CwADE20d85T/A7+P+Er5rUO4MMJHiHEwYy7l9kYXY3
 G6rSuE+aIxDDVKxjh6/YDO0Je5O6iYD8quCmjfzQjEx3Xs4xVP+obnhFco+xMiAPZRjyOqaKG6W
 Tuq1p54lrsf/mD76y3zqGyjuAlx7xUMRLKvlfosvykrYVp0zIinM76UaBYaLbhU/Y/0Esb7WrRZ
 pCBzGX7jbuNmhQorLPYpO7Ig3VN2VVxEqquLIHJqq23BKTtjNbHHnO3++//AcploIAxCXVo3rod
 r8F6ZTHQZmKfjHzqXbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250063

All callers have been migrated to qcom_mdt_pas_load(), which takes an
explicit qcom_pas_context instead of a raw pas_id and delegates memory
setup to the context.  Remove the now-unused qcom_mdt_load() wrapper
along with its EXPORT_SYMBOL_GPL and header declaration.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c       | 59 ++++++++++-------------------
 include/linux/soc/qcom/mdt_loader.h | 12 ------
 2 files changed, 19 insertions(+), 52 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 002100fe2d32..1c7b5906f6ae 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -326,7 +326,8 @@ static bool qcom_mdt_bins_are_split(const struct firmware *fw)
  * @dev:	device handle to associate resources with
  * @fw:		firmware object for the mdt file
  * @fw_name:	name of the firmware, for construction of segment file names
- * @mem_region:	allocated memory region to load firmware into
+ * @mem_region:	virtual address of the memory region to load firmware into,
+ *		or NULL to have the region mapped internally with ioremap_wc()
  * @mem_phys:	physical address of allocated memory region
  * @mem_size:	size of the allocated memory region
  * @reloc_base:	adjusted physical address after relocation
@@ -341,6 +342,7 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
 	const struct elf32_hdr *ehdr;
+	void __iomem *mapped = NULL;
 	phys_addr_t mem_reloc;
 	phys_addr_t min_addr = PHYS_ADDR_MAX;
 	ssize_t offset;
@@ -350,12 +352,22 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 	int ret = 0;
 	int i;
 
-	if (!fw || !mem_region || !mem_phys || !mem_size)
+	if (!fw || !mem_phys || !mem_size)
 		return -EINVAL;
 
 	if (!mdt_header_valid(fw))
 		return -EINVAL;
 
+	if (!mem_region) {
+		mapped = ioremap_wc(mem_phys, mem_size);
+		if (!mapped) {
+			dev_err(dev, "unable to map memory region: %pa+%zx\n",
+				&mem_phys, mem_size);
+			return -ENOMEM;
+		}
+		mem_region = (__force void *)mapped;
+	}
+
 	is_split = qcom_mdt_bins_are_split(fw);
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
@@ -434,39 +446,13 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 	if (reloc_base)
 		*reloc_base = mem_reloc;
 
+	if (mapped)
+		iounmap(mapped);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
 
-/**
- * qcom_mdt_load() - load the firmware which header is loaded as fw
- * @dev:	device handle to associate resources with
- * @fw:		firmware object for the mdt file
- * @fw_name:	name of the firmware, for construction of segment file names
- * @pas_id:	PAS identifier
- * @mem_region:	allocated memory region to load firmware into
- * @mem_phys:	physical address of allocated memory region
- * @mem_size:	size of the allocated memory region
- * @reloc_base:	adjusted physical address after relocation
- *
- * Returns 0 on success, negative errno otherwise.
- */
-int qcom_mdt_load(struct device *dev, const struct firmware *fw,
-		  const char *fw_name, int pas_id, void *mem_region,
-		  phys_addr_t mem_phys, size_t mem_size,
-		  phys_addr_t *reloc_base)
-{
-	int ret;
-
-	ret = __qcom_mdt_pas_init(dev, fw, fw_name, pas_id, mem_phys, NULL);
-	if (ret)
-		return ret;
-
-	return qcom_mdt_load_no_init(dev, fw, fw_name, mem_region, mem_phys,
-				     mem_size, reloc_base);
-}
-EXPORT_SYMBOL_GPL(qcom_mdt_load);
-
 /**
  * qcom_mdt_pas_load - Loads and authenticates the metadata of the firmware
  * (typically contained in the .mdt file), followed by loading the actual
@@ -486,21 +472,14 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
 int qcom_mdt_pas_load(struct qcom_pas_context *ctx, const struct firmware *fw,
 		      const char *firmware, phys_addr_t *reloc_base)
 {
-	void __iomem *mem_region;
 	int ret;
 
 	ret = __qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id, ctx->mem_phys, ctx);
 	if (ret)
 		return ret;
 
-	mem_region = qcom_pas_ctx_map(ctx);
-	if (!mem_region)
-		return -ENOMEM;
-
-	ret = qcom_mdt_load_no_init(ctx->dev, fw, firmware, (__force void *)mem_region,
-				    ctx->mem_phys, ctx->mem_size, reloc_base);
-	iounmap(mem_region);
-	return ret;
+	return qcom_mdt_load_no_init(ctx->dev, fw, firmware, NULL,
+				     ctx->mem_phys, ctx->mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_pas_load);
 
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 74886f772d46..f49de7b388bc 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -15,10 +15,6 @@ struct qcom_pas_context;
 #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
 
 ssize_t qcom_mdt_get_size(const struct firmware *fw);
-int qcom_mdt_load(struct device *dev, const struct firmware *fw,
-		  const char *fw_name, int pas_id, void *mem_region,
-		  phys_addr_t mem_phys, size_t mem_size,
-		  phys_addr_t *reloc_base);
 
 int qcom_mdt_pas_load(struct qcom_pas_context *ctx, const struct firmware *fw,
 		      const char *firmware, phys_addr_t *reloc_base);
@@ -37,14 +33,6 @@ static inline ssize_t qcom_mdt_get_size(const struct firmware *fw)
 	return -ENODEV;
 }
 
-static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
-				const char *fw_name, int pas_id,
-				void *mem_region, phys_addr_t mem_phys,
-				size_t mem_size, phys_addr_t *reloc_base)
-{
-	return -ENODEV;
-}
-
 static inline int qcom_mdt_pas_load(struct qcom_pas_context *ctx,
 				    const struct firmware *fw, const char *firmware,
 				    phys_addr_t *reloc_base)
-- 
2.55.0

