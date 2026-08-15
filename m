Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E324741D22D
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 13:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786800377; cv=none; b=Ops25fFR1LRobAu8Qg/4KvTJusFJxhyUA7OuvNvmNrjQqUNLS7Funk26HPv4vuwNWTm1lQ1CGd29Y6+H1lzmApN5skws1fVVGGNdm07ru1Ff9v7yviB9Wld6qNn+ufYOczkRxAGkgTPhGNoYZ+37yuGvKZ3O706HkZXsWumWt+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786800377; c=relaxed/simple;
	bh=V0xJ5rGoDj5iR1dMadfapVH8RgSP9jryHFE8W+hoDXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=avtOP1Kgcg7LULaz7kv9MEaqu+ltxVcMMqWZvOHDuqMVcF/1dyHjSKWvKQz8mLaZb/b8s+tH/DjOZ687tTsz1tXK/Z6tda/kn1oM6PVFITKeNHf2q6hOgUfkL35QCf9V9cwYP7c+kfmhB3sTx4/0H1cBWVzVph+UmgxyYBv3TQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dob8upJI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bW2M26/M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dob8upJI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bW2M26/M"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67FDNEnB569581
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 13:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yR1lFmAjTJo
	UnDiSDduEbpWfWkdC6wgUbDXk1v75sWU=; b=Dob8upJI1SVnHglxdW3XAWBnKQ3
	RUSIpoe/icMPvoc6zCUk3tfLVwNmcaZrDWeiydOaycmO+N6sKGn5qgDnGn5Skn2/
	71oUFLgvM5mHZFU/0mJeWu/rDZBdV/rm9/H//9I3Lvoj2fwDEgTqjMEW6k8wVKrY
	P2hqjA9/xlDJsb6KsD18uYKs2gf8xH0L+dfmkw1l4UOi0Kb1e4fVAe2Y01LuV/Ah
	+chIg5fbgv5QXvdZ8GguroN3a2DDe1PeAD3ndLgANSnMoOGkt3eWgptayWD6gXxt
	JODvwTfkZg9+UDkiZKqMHb418EF3P2QfP/5kjNELjy42xBo3fz1nyjHQDFw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghf12jr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 13:26:14 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb467e56aaso1338788a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 06:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786800373; x=1787405173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yR1lFmAjTJoUnDiSDduEbpWfWkdC6wgUbDXk1v75sWU=;
        b=bW2M26/Msw8xwVA2y7HBA1yoED8CfeRT/UTEHkT4QEOFCz1YocH6WQgI9vHaPTznNR
         XNAVqz0sJBmW165JdmIzfHBPcNaWLu32BMUOJxUT7frueFRrAA1isfchfzDqDAEj6Mlh
         myRf6hVRIBpENaaNsAlakUYEIS78dG+w+EYOZfQuxCjfKfXPIjVf43FOkATkNh9bmdYy
         6q9ebjpktoiBPzojveVP++vXg2CIaNaAP3RK8R7S52dfVCnsFzHSGVwqeoF/MYMk2oxj
         vbtYxWpecP9oni/ocvnYZmalVHuBOCCeGnfXFR2HAjEJe1WIUXzUwWTeMDhnwu914QpQ
         ts6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786800373; x=1787405173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yR1lFmAjTJoUnDiSDduEbpWfWkdC6wgUbDXk1v75sWU=;
        b=lSzmA0CC6T0rjVS/lXepqn/LA6ack9DLLsZaN+30+P2Vl0iBvPLc9p3kFMFF3OCO+A
         T4PC6DWE5SJxhJwA8lPLl6LHQMBkRQvgCCm7d1AqoTr/qwzNht+jQciFPUo4F/0oVlXd
         asVW5hTZCqrULLFH3jslwzd5lnb3fKHSyKTOWTrw/sFSqrll9QPYrxgLTm04phSFjvg5
         GxHxIPAYSPwe7a0RYTJtUNA5VN/NdsB/yOgznhV3KEmu42Q75OPnX+WEAhqJ4PCs0GLZ
         iAu0PtESetTOF8gsqR1ZPRDUn4xGk9zQYmlwjfSUVixColERcc8y+JvThE5+qw/BWyrY
         iIMQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqmscz35o9TR+rwkm1g28BP5zUlF/pvB6/CjxQXvfAdBUxzpo/XGl8Z0/0QeYwyweOhPiei6pUsBSEW/qYu@vger.kernel.org
X-Gm-Message-State: AOJu0YyJHPuKUfAjuF1I7V0d7fbNnfcnwxRAeXe1WdjAJhUHqG60D8cM
	gbEPmZyEfywLaLPJ8UWTKhx685+q+Fg/RMei6T+91NZA5g7TpduWTD2VrXuWEaz7YKwsmGk0Mm1
	Y3m3YromyoLdsa320lwkRcG7Y/W378fJ+49iPeVAY5XbM5tM4lnvhMjU6eP9I3vidv7JY
X-Gm-Gg: AR+sD13oq5BQX7WpjWm/jigrzxnVS1ADfJObcH9YO3pHavmdtEbg+l5WI0rsHFGdGR+
	7ko909i9Zz1qJIkrc/RgyiLtO+yuZitc8dlQs3s68es2ManHbb2xoij9hIkx7qGBecNCOKnnCA8
	twvQMbiLyE7tiBBma1XFSwDLGUDyXB/M9EakPIFKszOKq5IJxw1CNg6ZRKTiawNbHuj00r++LbM
	lx8bG/Ug3BLP+nIwepgzwfp+1yGncDVpsvc2DAPkjmgS078/a4Y+6fXd3EYqISFI92zQ8PxQ7m9
	GfETfrmMsfN40amMvKJPzSFlKusk4UpLNg0AAtSOfq3NXB8Ct+9dWAHty/WNfOSZVyB1w0XsJGm
	W4HV6YcdjXrLGhFowjvvmjmpbDGbfSkfUNDdWbGHrKHKc7lZ2rE/8cCQZEg2h
X-Received: by 2002:a17:90b:3889:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-3933b8ace11mr13189671a91.14.1786800373322;
        Sat, 15 Aug 2026 06:26:13 -0700 (PDT)
X-Received: by 2002:a17:90b:3889:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-3933b8ace11mr13189639a91.14.1786800372740;
        Sat, 15 Aug 2026 06:26:12 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141386a039asm19313374c88.0.2026.08.15.06.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 06:26:12 -0700 (PDT)
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
Subject: [PATCH 6/8] remoteproc: qcom: pas: Sequence HPASS ADSP cluster boot root-first
Date: Sat, 15 Aug 2026 21:25:39 +0800
Message-ID: <20260815132541.1575121-7-shengchao.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=QsVuG1yd c=1 sm=1 tr=0 ts=6a8068f6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=NQtoXHyzFVGnf705VfcA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: Nma-r2WimnWjpuH_N_QnHXctgy82umTH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfXxsOBkFsC15n6
 o3vc70RXKlcXPhd0bqaqgOOMbIw8MDMwMiN7a5oC9q5vZzqhPJ8m728OsI78O9jnCNfzejBYW9b
 e6SksUX3F0G5UwDA/Fv1QiKdbtRN25SIZyWlCEfALqeIf1T5ZJjY4ZKI6EnaWnn+lPILtgiW/se
 J+ySZ24OGBGOsZChW4sMsXvDBp0IPBC87t7paivla+u1FGgcKZlwIdR5ppZiSvayhjM6eSm30Cq
 Su4HOm4RVJ2n2/+VQVJ0y4gN4wNvdXoJi4NKdG5njnUMU6Fr/cq1cQ7+oTHi324DdviccKLLSrh
 rLT/aMDQzAXpwkzKHsBrl/BFMWi7SKLPZ3KRttySo7Ei+rZgYCbzFPTE0OHfX7x2N6iYbyUYqsG
 CZNRQBQ/gKJclRzhgB2VATM3/Y7ToojrrzO/uodCE46cgDuHn+DdWWfDKGCoeMDGShN/i89ShEc
 pa0xmZl17lB+GEOgPEA==
X-Proofpoint-ORIG-GUID: Nma-r2WimnWjpuH_N_QnHXctgy82umTH
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfX8gESwZwYhXNi
 4K8fm9HLrjoMbRLiyJkBsEo3GCua+W8QRsRVEpKgWWghYEXcbTugolPMINX2Lsfh9KCYLunFHlp
 9W7wi6QXuJ1N3qzVZfP96LDvm+KogdQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608150096

The cluster root owns the HPASS resources shared with its siblings and
initializes them as part of its own boot, so ADSP1/ADSP2 can only cold
boot once ADSP0 is up. Booting a dependent member first leaves it
without the clocks, resets and NoC configuration it needs.

Gate a dependent member's qcom_pas_start() on the root having started.
The root being enabled in DT does not imply it has already bound, as
probe order between the two is not guaranteed, so fail the boot if the
root has not bound rather than dereferencing it. If the root has bound
but is not running yet, wait briefly on a completion the root signals
from its own qcom_pas_start(), so that a member racing the root through
a restart does not fail outright.

The completion starts out signaled, since a member may be attached to
already-running firmware at probe, and is only cleared once the root
actually goes down. A dependent member's boot racing the root's stop can
therefore still observe a stale completion, in which case it falls back
to failing on the root's state.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 76 ++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index c8e4230bcf2c..8231f811c568 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -138,6 +138,7 @@ struct qcom_pas {
  * @lock:	protects @members and @root
  * @members:	list of struct qcom_pas, linked via cluster_node
  * @root:	the member whose "qcom,cluster-root" points at itself
+ * @root_booted: signaled once @root has started, cleared when it goes down
  * @refcount:	number of members currently attached to this cluster
  *
  * PAS instances whose "qcom,cluster-root" phandle points at the same node
@@ -150,10 +151,18 @@ struct qcom_pas_cluster {
 	struct mutex lock;
 	struct list_head members;
 	struct qcom_pas *root;
+	struct completion root_booted;
 
 	int refcount;
 };
 
+/*
+ * How long a dependent member waits for its root to finish booting before
+ * giving up, e.g. when it is racing the root through the crash-restart
+ * cascade.
+ */
+#define QCOM_PAS_CLUSTER_ROOT_BOOT_TIMEOUT	(1 * HZ)
+
 static LIST_HEAD(qcom_pas_cluster_list);
 static DEFINE_MUTEX(qcom_pas_cluster_list_lock);
 
@@ -177,6 +186,13 @@ static struct qcom_pas_cluster *qcom_pas_cluster_get(struct device_node *node)
 	cluster->node = of_node_get(node);
 	mutex_init(&cluster->lock);
 	INIT_LIST_HEAD(&cluster->members);
+	init_completion(&cluster->root_booted);
+	/*
+	 * Cluster members may be attached to already-running firmware at
+	 * probe, so the root is presumed up until its own qcom_pas_stop()
+	 * reinit_completion()s this the first time it actually goes down.
+	 */
+	complete_all(&cluster->root_booted);
 	cluster->refcount = 1;
 	list_add_tail(&cluster->list, &qcom_pas_cluster_list);
 
@@ -267,6 +283,51 @@ static void qcom_pas_cluster_exit(struct qcom_pas *pas)
 	pas->cluster = NULL;
 }
 
+/**
+ * qcom_pas_cluster_wait_for_root() - gate a dependent member's boot on its root
+ * @pas:	the non-root cluster member being started
+ *
+ * The cluster root owns the resources its siblings need, and initializes them
+ * as part of its own boot, so a dependent member can only be started once the
+ * root is up.
+ *
+ * Return: 0 if the root is up, negative errno otherwise.
+ */
+static int qcom_pas_cluster_wait_for_root(struct qcom_pas *pas)
+{
+	struct qcom_pas_cluster *cluster = pas->cluster;
+	struct rproc *root;
+
+	/*
+	 * The root's PAS instance is enabled in DT (checked in
+	 * qcom_pas_cluster_init()) but has not necessarily bound yet, and may
+	 * have unbound again. Without it there is nothing to sequence this
+	 * member's boot against.
+	 *
+	 * Note that nothing refcounts members across unbind, so a root freed
+	 * under a concurrent sibling boot remains unhandled.
+	 */
+	mutex_lock(&cluster->lock);
+	root = cluster->root ? cluster->root->rproc : NULL;
+	mutex_unlock(&cluster->lock);
+
+	if (!root) {
+		dev_err(pas->dev, "cluster root not bound\n");
+		return -ENODEV;
+	}
+
+	if (root->state == RPROC_RUNNING || root->state == RPROC_ATTACHED)
+		return 0;
+
+	if (!wait_for_completion_timeout(&cluster->root_booted,
+					 QCOM_PAS_CLUSTER_ROOT_BOOT_TIMEOUT)) {
+		dev_err(pas->dev, "cluster root not started\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
 static void qcom_pas_segment_dump(struct rproc *rproc,
 				  struct rproc_dump_segment *segment,
 				  void *dest, size_t offset, size_t size)
@@ -424,6 +485,12 @@ static int qcom_pas_start(struct rproc *rproc)
 	struct qcom_pas *pas = rproc->priv;
 	int ret;
 
+	if (pas->cluster && !pas->is_cluster_root) {
+		ret = qcom_pas_cluster_wait_for_root(pas);
+		if (ret)
+			return ret;
+	}
+
 	ret = qcom_q6v5_prepare(&pas->q6v5);
 	if (ret)
 		return ret;
@@ -494,6 +561,9 @@ static int qcom_pas_start(struct rproc *rproc)
 	if (pas->dtb_pas_id)
 		qcom_pas_metadata_release(pas->dtb_pas_ctx);
 
+	if (pas->cluster && pas->is_cluster_root)
+		complete_all(&pas->cluster->root_booted);
+
 	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
 	pas->firmware = NULL;
 
@@ -549,6 +619,12 @@ static int qcom_pas_stop(struct rproc *rproc)
 	int handover;
 	int ret;
 
+	if (pas->cluster && pas->is_cluster_root) {
+		mutex_lock(&pas->cluster->lock);
+		reinit_completion(&pas->cluster->root_booted);
+		mutex_unlock(&pas->cluster->lock);
+	}
+
 	ret = qcom_q6v5_request_stop(&pas->q6v5, pas->sysmon);
 	if (ret == -ETIMEDOUT)
 		dev_err(pas->dev, "timed out on wait\n");
-- 
2.43.0

