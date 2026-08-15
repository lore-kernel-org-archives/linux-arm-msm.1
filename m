Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5849441D11A
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 13:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786800372; cv=none; b=ZmN4ps1Dv+R91myJsSGb9kONzV/+gvITNs4wzIwJ8hRHWytdl+c5bfBsXkU6kuOlES0UxnwKq7uUEniEaPFmpMxG4FD0LoeeC7H8aSJo8mN5ja/nchmSu075zv7fc2cHGm5GnUvkReVibDRtdS0b8E1vwqyGjwAvq4cyJ0XBWRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786800372; c=relaxed/simple;
	bh=y7ar12FG8BENdZ3ityGYZ36lZ87KzzyCCpI/by79cdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PnnODtNqPt3vFK8cuu5UnKM8rB2CLgsLbqdMGX6oqBs0fIXz+/IjptQZLB7J0//VhVhn2BtZWG8jtVWe2/Szrp0LAlFAYJneTcTjicVUl99m2khkFO04YNig+IoX6dkbYOwfQYcO3bM9W9oKYiu9D7K/yaj58J2qfQOPyLnb89M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MkteGfss; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y8Sh98gr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MkteGfss";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y8Sh98gr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67FDMwNu1169656
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 13:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zOFtAZ+E2b5
	BkVLywK82W0fnJDTIl5z2YkSwRx/DLF0=; b=MkteGfssnE62uvp8ajwUd7R2Una
	Bm3gGBTlVPrQYjGaKyMgrapFRb02w8mNtSSM3oHrCh1ChhbPtXSXbiWZdcZ3WPrj
	uF+cDDqOGGFNDj5exIZVcSMEvYPdRihk2gK66+3IvvP/JqHBWwqslj9uVOrTGhdR
	A7tBSQB1h/kammS/if/330DL5ZWbdWpkqUdwt4nudHTKg31G82lor7NgMKZBWZC7
	T85/9oumqaL1XASNl9J9CNI04LEkzNn+bOshrbqWY5zx2b8wDxHuKJMcx0KjnuuP
	WoeOSUQM8Mc3C6BKunRtAOhESeyWUaFveiFi55N1RvOAJV5ehVHafgBSzrw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghwh11p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 13:26:10 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so1324738a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 06:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786800370; x=1787405170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zOFtAZ+E2b5BkVLywK82W0fnJDTIl5z2YkSwRx/DLF0=;
        b=Y8Sh98gr6GpnPw6OhwyY89CgIgs9X9/S0utDaeoRBDQjr4DV44zoXmlJ22ZASyTg0y
         uClt3c3srJn7llFlYmPnyWu4LUCEwC9Bncks2FIX/2X4KVjuE3j2RY6zQcuyLq9+AM2N
         jbcQcD+0pfLTDZB0ewLoadfss4v836aT1K91cdlSdnzRvpcepAQq4xlHrPqRI8TA1/Ed
         gotzV/fHh1oO78K4GW9FltlJRQOuizlwkPIJ5wQ55sRV1qf1AErHOmBn0hCK//3TnYLr
         5gSAhI70osx7NZ+q31y/IPnkOsviIlwFD6Ciii+bvdiRByXTRSWSmUT4TggyOgqQzg1H
         gwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786800370; x=1787405170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zOFtAZ+E2b5BkVLywK82W0fnJDTIl5z2YkSwRx/DLF0=;
        b=hC2kgL/uSL/QIFe7/j+W3q2ShKEfkMDFMH4jvUBlswBnQQIwyMeddy4dzP+0MXr/8k
         gzwTBK5pEsArwBF3hPJrCR1OVvKk/y/w9ADwkgUBlAT+GL8LEmJobL1R+n20jTXaPF8C
         D5UnbhQZu2VKGUeF9eeJOJ0VRp2kZLkkryQDeKEALMTnQf1g8iqzr/aCkiZvBmCqIMeg
         Cf19QOdhhvvk2Ne2I/C7Psc3jAHYHHJuBy8bR8nKm6wKnCsIpNVlt2d3+cya6wHj5uvV
         LAy1++fjFZOpMdVdFD7/hPX/CP2Sh+8LkufxL2EAWiBi0d5WdXpZ+5W2OimLuIyc4bcb
         H08g==
X-Forwarded-Encrypted: i=1; AHgh+RpIoSbseV5DPrcqnBtR8b9/sr/hFd30lEhMRe9LLfqRPU9q+AwnA+1PeCJ4wuLeDd14crp6DaHYNdQ3tqaX@vger.kernel.org
X-Gm-Message-State: AOJu0YxHBT7VkR80CaCTXyBmxFmSfclEl5wR9IB9x3G0zUudKOoPkTR5
	o2B5GfPZHtuaBWCmAVNxl+p3YiBTYWMM8+340c/JW2TFc/6CrcCVsOyjr2lU2mkaKE7HzVkhhNQ
	qpfgg8X/xtc7k+i13IBnIiVU9SwE6ZJWwOl8flM7S6GUl10XhEoqY2eYbOvY6kq7GgBu2
X-Gm-Gg: AR+sD10hg/iCtNUKJJT1OG2sZDpGETuM+FqgBtlGmwJNkXr1Fy9yLvlEgez8ACUgEpR
	J/beIps4qeJw66V7JbfqN84gBSg+f30uEyBy65FUK9S8QC0J4Uv7JpWzCJMu9a10lAFxTYDJ4Pi
	YItyexCmqyJqZCC2+yanEElDKbk1iLDol/CYFhR3ysTtj4ITAG2LSktt2mIH0fMBDSBumx9Sh6b
	iSfN4ZhGV1KSo9npOiqaqR2abVvEmFkZz5vKxYXLfHs4Clh560eEaX1ym7CqcbW+RJ7Sq+Vp7m4
	O0WTISoNNriz/qCDhuYm2aJ4AAH0CC/w/3xxyvuscKto+ti7MykwGGiOq8wlk+PAAh6wmOiCNyq
	UCaBLhLdMA7l2zhnX0KIEhXsDNaHpwnZx9wAbpzHKVR/Ux6/OXx4revdalYE2
X-Received: by 2002:a17:90b:1806:b0:381:26f:8f05 with SMTP id 98e67ed59e1d1-3933bd0f310mr14071503a91.3.1786800369593;
        Sat, 15 Aug 2026 06:26:09 -0700 (PDT)
X-Received: by 2002:a17:90b:1806:b0:381:26f:8f05 with SMTP id 98e67ed59e1d1-3933bd0f310mr14071440a91.3.1786800369057;
        Sat, 15 Aug 2026 06:26:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141386a039asm19313374c88.0.2026.08.15.06.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 06:26:08 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 5/8] remoteproc: qcom: pas: Track HPASS ADSP cluster membership
Date: Sat, 15 Aug 2026 21:25:38 +0800
Message-ID: <20260815132541.1575121-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
References: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mN98sIyLqjH_yU5ZIJKs-Nc65ZTbTS29
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfX3lW+ocDFgMMv
 7RWvDEF86ZYqJ4zdHI8wGGGSswB2VPm6dHhSv/7O4XVpBUa9ZspjA6NTL6uV1sH6rzBbQp9GOqk
 X3+uajCMU5oC/rWG1FaLdEahdP7fe0D+FtC9Hc3AD5iPs2WUy3lVZPHESWvAFFsc42YQxjq++rW
 7yahkTSzKHvlvuyLodWj7oOyAoh5TYIw+2JI2MaOnly+T+Z5KIsSQ2gkKMxQluoe2nhmJRCKPey
 TzaodM9+WG8qxrDMAIzKLA6aUsUFQYV9vb6NRld2QJSkrExy8nn4AyTOwMMMWjkqRYQsaDe0P7b
 vg2yPxt3Tc+Gmg0JVVPIOsaXVnzUTi1/rJrO3Vh21+ewG7VcAtOuVDJLujFMXDOf+a/z3k1yviU
 rOMCDRX+5s7Gkjndms3bx5PSGGHlLUb6tntrPL8GCG+rdzTCxPc1Bh7p1oVgjX7/gPDDTe2JJKB
 BoUgA/BhyEtGW19tGcw==
X-Proofpoint-GUID: mN98sIyLqjH_yU5ZIJKs-Nc65ZTbTS29
X-Authority-Analysis: v=2.4 cv=DdknbPtW c=1 sm=1 tr=0 ts=6a8068f2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=tpIsOtObft-OYHULcT0A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfXwvkTXSS6S52N
 qIvV7C5nMuj4co1pjhLS81AhgqNmqTGj1qnfPapDb+2u+6Pa6+GwCi/x3f+JMdsc+JSzecMETPl
 iRuH55mzA1MQxyW59f09rPJ3i5UyTI0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608150096

On Nord, ADSP0/1/2 share HPASS-domain resources (PLLs, AG_NOC, RSCp,
CESTA, THROTTLE, QTMR) owned by ADSP0, and their firmware cannot
tolerate one member being started or stopped independently of the
others. Modeling that requires each PAS instance to know which other
instances it is grouped with.

Add a small registry of clusters, keyed by the device_node every member's
"qcom,cluster-root" phandle points at, and join it at probe. Membership
is answerable from the node being probed alone: every member carries the
property, and the one referencing itself is the root, so there is no need
to search the device tree for nodes referencing a given instance.

A dependent member is rejected at probe if its root is disabled in DT,
since its boot could never be sequenced after a root that will not bind.

Publish the cluster in rproc->cluster, which is all sysmon and
glink_ssr need to stop notifying siblings of each other's SSR events.
The cluster is left only after rproc_del() has stopped this member, so
that the suppression is still in effect for that stop, and is unwound on
every probe error path, since a member freed while still linked into the
cluster would be walked by its siblings.

Instances without "qcom,cluster-root" are completely unaffected:
qcom_pas.cluster stays NULL for them.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 152 +++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 8cff0684fe2f..c8e4230bcf2c 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -66,6 +66,8 @@ struct qcom_pas_data {
 	bool needs_tzmem;
 };
 
+struct qcom_pas_cluster;
+
 struct qcom_pas {
 	struct device *dev;
 	struct rproc *rproc;
@@ -123,8 +125,148 @@ struct qcom_pas {
 
 	struct qcom_pas_context *pas_ctx;
 	struct qcom_pas_context *dtb_pas_ctx;
+
+	struct qcom_pas_cluster *cluster;
+	struct list_head cluster_node;
+	bool is_cluster_root;
+};
+
+/**
+ * struct qcom_pas_cluster - state shared by clustered PAS instances
+ * @node:	device_node of the cluster root, the key into the global list
+ * @list:	linkage in qcom_pas_cluster_list
+ * @lock:	protects @members and @root
+ * @members:	list of struct qcom_pas, linked via cluster_node
+ * @root:	the member whose "qcom,cluster-root" points at itself
+ * @refcount:	number of members currently attached to this cluster
+ *
+ * PAS instances whose "qcom,cluster-root" phandle points at the same node
+ * share one of these.
+ */
+struct qcom_pas_cluster {
+	struct device_node *node;
+	struct list_head list;
+
+	struct mutex lock;
+	struct list_head members;
+	struct qcom_pas *root;
+
+	int refcount;
 };
 
+static LIST_HEAD(qcom_pas_cluster_list);
+static DEFINE_MUTEX(qcom_pas_cluster_list_lock);
+
+static struct qcom_pas_cluster *qcom_pas_cluster_get(struct device_node *node)
+{
+	struct qcom_pas_cluster *cluster;
+
+	mutex_lock(&qcom_pas_cluster_list_lock);
+
+	list_for_each_entry(cluster, &qcom_pas_cluster_list, list) {
+		if (cluster->node == node) {
+			cluster->refcount++;
+			goto out;
+		}
+	}
+
+	cluster = kzalloc(sizeof(*cluster), GFP_KERNEL);
+	if (!cluster)
+		goto out;
+
+	cluster->node = of_node_get(node);
+	mutex_init(&cluster->lock);
+	INIT_LIST_HEAD(&cluster->members);
+	cluster->refcount = 1;
+	list_add_tail(&cluster->list, &qcom_pas_cluster_list);
+
+out:
+	mutex_unlock(&qcom_pas_cluster_list_lock);
+	return cluster;
+}
+
+static void qcom_pas_cluster_put(struct qcom_pas_cluster *cluster)
+{
+	mutex_lock(&qcom_pas_cluster_list_lock);
+	if (--cluster->refcount == 0) {
+		list_del(&cluster->list);
+		mutex_unlock(&qcom_pas_cluster_list_lock);
+		of_node_put(cluster->node);
+		kfree(cluster);
+		return;
+	}
+	mutex_unlock(&qcom_pas_cluster_list_lock);
+}
+
+/**
+ * qcom_pas_cluster_init() - join the cluster referenced by @np, if any
+ * @pas:	PAS instance being probed
+ * @np:		of_node of @pas's platform device
+ *
+ * Devices without a "qcom,cluster-root" property are not part of a cluster;
+ * @pas->cluster is left NULL and this is a no-op (e.g. cdsp0-3). Cluster
+ * members all carry the property, the root included, whose phandle points
+ * back at itself.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int qcom_pas_cluster_init(struct qcom_pas *pas, struct device_node *np)
+{
+	struct device_node *root_node;
+	bool is_root;
+
+	root_node = of_parse_phandle(np, "qcom,cluster-root", 0);
+	if (!root_node)
+		return 0;
+
+	is_root = root_node == np;
+
+	/*
+	 * A non-root member is useless without its root: it can never be
+	 * booted, since its boot has to be sequenced after the root's. Reject
+	 * it here rather than at first boot, so that a DT enabling a dependent
+	 * DSP but not the one owning the shared resources fails loudly and
+	 * early.
+	 */
+	if (!is_root && !of_device_is_available(root_node)) {
+		dev_err(pas->dev, "cluster root %pOF is not enabled\n", root_node);
+		of_node_put(root_node);
+		return -ENODEV;
+	}
+
+	pas->cluster = qcom_pas_cluster_get(root_node);
+	of_node_put(root_node);
+	if (!pas->cluster)
+		return -ENOMEM;
+
+	pas->is_cluster_root = is_root;
+
+	mutex_lock(&pas->cluster->lock);
+	list_add_tail(&pas->cluster_node, &pas->cluster->members);
+	if (is_root)
+		pas->cluster->root = pas;
+	mutex_unlock(&pas->cluster->lock);
+
+	return 0;
+}
+
+static void qcom_pas_cluster_exit(struct qcom_pas *pas)
+{
+	struct qcom_pas_cluster *cluster = pas->cluster;
+
+	if (!cluster)
+		return;
+
+	mutex_lock(&cluster->lock);
+	list_del(&pas->cluster_node);
+	if (cluster->root == pas)
+		cluster->root = NULL;
+	mutex_unlock(&cluster->lock);
+
+	qcom_pas_cluster_put(cluster);
+	pas->cluster = NULL;
+}
+
 static void qcom_pas_segment_dump(struct rproc *rproc,
 				  struct rproc_dump_segment *segment,
 				  void *dest, size_t offset, size_t size)
@@ -862,6 +1004,12 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	pas = rproc->priv;
 	pas->dev = &pdev->dev;
 	pas->rproc = rproc;
+
+	ret = qcom_pas_cluster_init(pas, pdev->dev.of_node);
+	if (ret)
+		return ret;
+	rproc->cluster = pas->cluster;
+
 	pas->minidump_id = desc->minidump_id;
 	pas->pas_id = desc->pas_id;
 	pas->lite_pas_id = desc->lite_pas_id;
@@ -951,6 +1099,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	qcom_pas_unassign_memory_region(pas);
 free_rproc:
 	device_init_wakeup(pas->dev, false);
+	qcom_pas_cluster_exit(pas);
 
 	return ret;
 }
@@ -964,6 +1113,9 @@ static void qcom_pas_remove(struct platform_device *pdev)
 
 	rproc_del(pas->rproc);
 
+	pas->rproc->cluster = NULL;
+	qcom_pas_cluster_exit(pas);
+
 	qcom_q6v5_deinit(&pas->q6v5);
 	qcom_pas_unassign_memory_region(pas);
 	qcom_remove_glink_subdev(pas->rproc, &pas->glink_subdev);
-- 
2.43.0

