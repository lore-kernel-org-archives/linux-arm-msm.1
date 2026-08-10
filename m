Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B32A3B5310
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786360101; cv=none; b=tNlIhRukJm1aVQ3yYXvh7GObs3YSsTT1Nr+h+dHHbA4Mu+4Cq+siG+iZcXj8kWskPxYhlwzVUN1K3hUmq+PSxBzMWzwHKFElSkVbZatLDJGUdylthC6JkOG5f2qTOVYE/SM3quei2SY3jBc4Y4c86O4g3HNJ3mQPQeEJBgjNvG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786360101; c=relaxed/simple;
	bh=8L6bJTlzx0bGVJbb/ovIXlP6IJd0N/SlUl0KukXfZ/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D3SW0T6PEu7zpQ4qY6uUPySrgHsLWdjqr0VFSobCo869/c1+EwND1XCbCpvR0v19AWuH+Kyg/naj2P3rhYCoVyiPQqSzIoqg/5Ne63tmbo4fe5ZYQOYDOea2IkeQNG8juLlAFfH+4Z7a3wV1/HNAAfG6HFZyyltILilNBNE/gj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kJfGzK6V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SrNe3HLv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kJfGzK6V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SrNe3HLv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9S0LB1727642
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=23skQEeEBI5
	OaBpjMQT1Kq5avPBud9tEUlUKsYNzTys=; b=kJfGzK6VRRjg1nKDEpMRr5Q5XKx
	3Wf1JqKZJYzZaFpCnmycWtTLdTm1OoZ4grm8xR6PbxL0YKOt6pfxooqQeEdzti7e
	YGKYAKe+zZQzk0HiTRRsI/+07a57luNKT0UCM4v/AoXk/ADhMSzEu5UrRO5W9hub
	w1tnrGTlsk3876SJcodAP6ZsGwvLJPDIyY+so/2ZnS1qQbekHhDiCt+lLsTWgl2J
	2lLaOGXLk5Hz5IlJ/tDg3rUJf3KaUdy5o5EiTttuxHelPg69kU/vZB99kQ/C9LNR
	8F3PeMfgPiPSnNFd/D3HUVxCuAKK2dkqc5c7LVk3zpiKc+A+z1CGouOYvvA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v3s484-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:08:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so39061065ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 04:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786360098; x=1786964898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=23skQEeEBI5OaBpjMQT1Kq5avPBud9tEUlUKsYNzTys=;
        b=SrNe3HLvrn9/e1+17k3wUN3vA/bDXkIdP5HTLV6LW8Oq99DK/Q4t4eUEf2K+LJNtCT
         rIVg2kPrUG4DyvplTP6ELTGZKKPBRMvXRA6PpGg1VPRK6jz8AGe8cZ3XFtBccyrCy3E2
         V/SM7X7wZ0ydx5i9EhiYc8ZMRDrVfH3VAgIP1xJcjvUkJBXnZfeqERttKdFbGBkSWvzz
         CBcs34y9bTvBUiKpxnrHTFwMDEyxb501fdRuBPPhsNDyl5JjzMc98cN73sSDmAKiJ0LE
         VxsVffEOUv0RzZORM8SiYfLXzciVnrrMkWy9dfe3LnYfESp07C98ahro+MSbmHk0fVFO
         20Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786360098; x=1786964898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=23skQEeEBI5OaBpjMQT1Kq5avPBud9tEUlUKsYNzTys=;
        b=SYloRD2uZm/p17iBnCm7RnNcJ8tBfUBUn5zGrWsvJ0XpF7uqmMpeajPlgGIvAxmJ2z
         4ZzWphTiDm0OBONyblFExr52WUftpmd3vtFPTpZww+7THcX7oDZBTn9PNghYyKCF6MUH
         +b2Fiemjm2DtfPqAIq857wQ64//htZMb7GnwEbjHE3p3AfRiV3Wdd000Ln4zRzd67dHi
         merMDMeb17THQxkpxiQTk1VTcyAgBtg03D62YGYFwNRz4j6Z4wrvUjUWfrcoS6JfmwaQ
         0FZfnbHie2SiGZjS2qPaqRjUDOaR/cKP+GTuTDV/Pog29lbwznFy3giTfZVyeEq3LZmC
         W6vw==
X-Forwarded-Encrypted: i=1; AHgh+RrSNaHz/PBWyw/n6Gjms9gJLgVxMI1CyGMZLRBIgf990MSfiXKPoaq9vMiUhMdCAekNBbhvH8sDAU23H7u+@vger.kernel.org
X-Gm-Message-State: AOJu0YxVH+5IndJIZoJ1Gv0a9WkJ/v8xqH39F37RZuXuJvUtzv+m4eDF
	9zH2tabQr7oqdsxanCrJdaqbu1Iczn7y2dsp2y94Gi+X+uqTVpkDqo4L19OXckaKjGmHJUm9Fb2
	imH2uTpu0mHIEBKPfLgkrw9SbR+VhHp5+VFo6Z2ME9Vkw5WpsUkQtkkIX7hOH5mlGirIByTFv7/
	4M624=
X-Gm-Gg: AR+sD13l32BscKwMTDHTWqEzwCXB4ZLXNBdRC671/vc4yT0mNXeiCmNHWPGyG0twi9b
	BzgveLQHuyitStO4vk8mlmpx6tv4onaIy4TSFJBZgAgLE9zfGdtV58HZIPQs6yX/EyBFm4HBN/z
	qXlyDEf+vAKpKkvgSGUUm/1i968uNGdRc7rLub8SHLDYckpgCAsSaOiWOxt8VB0D2j71IEubViE
	VK89FZglxJVP7dJ+gIbJEN02rptcWxTp8Jm0vrcoUo9bNu+/37Bims4pAfLcCqbz/4/Ur6BXeVM
	fd6op4KHZNcdXOlumSAHHtZ7vcqEtCD2ZUvudFVFRT7T4Lz7zNdrFNA0rlkkmMW1RS3GPzU82Gd
	STte6Lf0cf6W0CnZ5XFhZ/iwt9tOn5kYFrk5iWpiSeXiLhnyL0PoyRq2HTSW0
X-Received: by 2002:a17:902:f691:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2d2a8457716mr213656825ad.4.1786360097522;
        Mon, 10 Aug 2026 04:08:17 -0700 (PDT)
X-Received: by 2002:a17:902:f691:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2d2a8457716mr213655985ad.4.1786360096983;
        Mon, 10 Aug 2026 04:08:16 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebde353sm46520198eec.23.2026.08.10.04.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:08:16 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] remoteproc: qcom_q6v5_pas: add HPASS ADSP cluster boot-order and SSR coupling
Date: Mon, 10 Aug 2026 19:07:21 +0800
Message-ID: <20260810110726.775084-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810110726.775084-1-shengchao.guo@oss.qualcomm.com>
References: <20260810110726.775084-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KXepR79DUaSEaWK4N84T3rY3Hj4Bu5oc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA5NyBTYWx0ZWRfX/ygufWzn9rKq
 VNarcHLhB0kOcZ3yyyuCkkgHDGCY1Kp+OrKjVK/iweJ2lTimIM72e9BVMWmzfuATnFaGznVKMdX
 +7q3Fz+Vxq5tjvk3AIiWQvUBgryHCsAuZkNW4/rF5xL/TztzE/6aHfHLEz9mv3Yt8fJe+IWkJ/5
 7CTxC5kK7qpU5G3a6u/wPHJ8bwcxto9cLg/muui0h6pzdarzgTmDLZzadElyqYdPIIbTsUl6nOW
 eE11vV2P/rsiKR31GFQd2u3t1tmXPee6+CoYCRdU2Cup5TwFPVZye9a+itIf4byGtHCuYHW51UE
 +kn5kr18Hbmw56TaaQaShqeg5r+1XuLo0C1fgiGm7URHeMxhXdze3xFSRjRJsXKM0i5QjFM2nhu
 6c2Lv8TSYyOw8achNWHeg9wGPoyE4DojWLS41odOWEOgqDet5wAp3H7fk8AQ9OzvhpAFCGJH9ub
 cXdLnheXbvFBiKiPwRg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA5NyBTYWx0ZWRfX4PiwgBGhpJZy
 JOnwM5Hb/rdgl5LYJDVo/P9bDqOB4H6JWBEryHRu1Ag9itUZG52bqR5lH4s2SzuCLSYFsfhsFVh
 uNC077mZbo/yfcAr7EqWZ8cZICKG+RM=
X-Proofpoint-GUID: KXepR79DUaSEaWK4N84T3rY3Hj4Bu5oc
X-Authority-Analysis: v=2.4 cv=c+mbhx9l c=1 sm=1 tr=0 ts=6a79b122 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=5NhFmEo_CSIvw-HNUjEA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100097

Some Qualcomm SoCs (e.g. Nord's HPASS ADSP0/1/2) group multiple PAS
instances that share clock/reset/NoC resources: one instance (the
"root") must finish booting before its siblings can cold boot, and any
member crashing, or being manually stopped on its own, must bring the
whole group down and back up together - matching the downstream
coupled-SSR ("MDF") group model, which never leaves the group in a
partially up/down state and has no notion of restarting a single
member alone.

Add a shared, kref-managed struct qcom_pas_cluster (mutex, members
list, waitqueue, booted/restart_pending flags), looked up or created
order-independently in qcom_pas_probe() keyed by the cluster root's
device_node (works regardless of which member probes first), and torn
down via kref_put() in qcom_pas_remove().

Non-root members now wait for the root to finish booting before their
own qcom_pas_start()/qcom_pas_attach() proceeds (qcom_pas_wait_for_cluster_root()),
and the root marks the cluster booted once it completes its own boot
(qcom_pas_cluster_mark_booted()).

A new subdev callback, qcom_pas_cluster_stop(), fans a stop event on
any one member out to every other member: a real crash is propagated
via rproc_report_crash() so the whole cluster crashes and automatically
recovers together, while a manual (non-crash) stop instead force-stops
every other member via a deferred rproc_shutdown() (run from a
dedicated work item, since calling it inline would race with the
target's own concurrently running IRQ-driven state machine). A
restart_pending latch ensures only the first member to observe the
stop acts on the rest, and is cleared once the root reboots.

A manual start of a single non-root member is deliberately not turned
into a whole-cluster boot: qcom_pas_wait_for_cluster_root() just waits
out its timeout and fails if the root isn't already up, rejecting the
solo start rather than force-booting the root on the caller's behalf.
---
 drivers/remoteproc/qcom_q6v5_pas.c | 271 +++++++++++++++++++++++++++++
 1 file changed, 271 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 275847e15638..8e99659975c9 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -13,7 +13,10 @@
 #include <linux/interrupt.h>
 #include <linux/iommu.h>
 #include <linux/kernel.h>
+#include <linux/kref.h>
+#include <linux/list.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
@@ -28,6 +31,8 @@
 #include <linux/soc/qcom/mdt_loader.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
+#include <linux/wait.h>
+#include <linux/workqueue.h>
 
 #include "qcom_common.h"
 #include "qcom_pil_info.h"
@@ -35,9 +40,36 @@
 #include "remoteproc_internal.h"
 
 #define QCOM_PAS_DECRYPT_SHUTDOWN_DELAY_MS	100
+#define QCOM_PAS_CLUSTER_BOOT_TIMEOUT_MS	5000
 
 #define MAX_ASSIGN_COUNT 3
 
+/*
+ * Some Qualcomm SoCs (e.g. Nord's HPASS ADSP0/1/2) group multiple PAS
+ * instances into a cluster that shares boot ordering and crash recovery:
+ * one instance (the "root", pointed to by the others' "qcom,depends-on"
+ * phandle) must finish booting before its siblings can cold boot, and any
+ * one member crashing forces the whole cluster to crash and restart
+ * together, matching the downstream coupled-SSR ("MDF") group model.
+ *
+ * qcom_pas_cluster_list/_lock is a registry of these shared cluster
+ * objects, keyed by the root's device_node, used to look up or create the
+ * cluster a newly probed qcom_pas instance belongs to.
+ */
+static LIST_HEAD(qcom_pas_cluster_list);
+static DEFINE_MUTEX(qcom_pas_cluster_list_lock);
+
+struct qcom_pas_cluster {
+	struct kref kref;
+	struct list_head node;
+	struct device_node *root_node;
+	struct mutex lock;
+	struct list_head members;
+	wait_queue_head_t wq;
+	bool booted;
+	bool restart_pending;
+};
+
 struct qcom_pas_data {
 	int crash_reason_smem;
 	const char *firmware_name;
@@ -122,6 +154,11 @@ struct qcom_pas {
 
 	struct qcom_pas_context *pas_ctx;
 	struct qcom_pas_context *dtb_pas_ctx;
+
+	struct qcom_pas_cluster *cluster;
+	struct list_head cluster_node;
+	struct rproc_subdev cluster_subdev;
+	struct work_struct cluster_stop_work;
 };
 
 static void qcom_pas_segment_dump(struct rproc *rproc,
@@ -274,11 +311,146 @@ static int qcom_pas_map_carveout(struct rproc *rproc, phys_addr_t mem_phys, size
 	return ret;
 }
 
+/* Caller must hold qcom_pas_cluster_list_lock. */
+static struct qcom_pas_cluster *qcom_pas_cluster_find_locked(struct device_node *root_node)
+{
+	struct qcom_pas_cluster *cluster;
+
+	list_for_each_entry(cluster, &qcom_pas_cluster_list, node) {
+		if (cluster->root_node == root_node)
+			return cluster;
+	}
+
+	return NULL;
+}
+
+/*
+ * Find or create the cluster rooted at @root_node, returning it with a
+ * reference held. On success, this function takes ownership of @root_node
+ * (either by keeping it as the newly created cluster's key, or by dropping
+ * it because an existing cluster already owns a reference to the same
+ * node). Callers must not touch @root_node again after calling this.
+ */
+static struct qcom_pas_cluster *qcom_pas_cluster_get(struct device_node *root_node)
+{
+	struct qcom_pas_cluster *cluster, *new_cluster;
+
+	mutex_lock(&qcom_pas_cluster_list_lock);
+	cluster = qcom_pas_cluster_find_locked(root_node);
+	if (cluster) {
+		kref_get(&cluster->kref);
+		mutex_unlock(&qcom_pas_cluster_list_lock);
+		of_node_put(root_node);
+		return cluster;
+	}
+	mutex_unlock(&qcom_pas_cluster_list_lock);
+
+	new_cluster = kzalloc(sizeof(*new_cluster), GFP_KERNEL);
+	if (!new_cluster) {
+		of_node_put(root_node);
+		return NULL;
+	}
+
+	kref_init(&new_cluster->kref);
+	new_cluster->root_node = root_node;
+	mutex_init(&new_cluster->lock);
+	INIT_LIST_HEAD(&new_cluster->members);
+	init_waitqueue_head(&new_cluster->wq);
+
+	mutex_lock(&qcom_pas_cluster_list_lock);
+	cluster = qcom_pas_cluster_find_locked(root_node);
+	if (cluster) {
+		kref_get(&cluster->kref);
+		mutex_unlock(&qcom_pas_cluster_list_lock);
+		of_node_put(root_node);
+		kfree(new_cluster);
+		return cluster;
+	}
+	list_add_tail(&new_cluster->node, &qcom_pas_cluster_list);
+	mutex_unlock(&qcom_pas_cluster_list_lock);
+
+	return new_cluster;
+}
+
+static void qcom_pas_cluster_release(struct kref *kref)
+{
+	struct qcom_pas_cluster *cluster = container_of(kref, struct qcom_pas_cluster, kref);
+
+	list_del(&cluster->node);
+	of_node_put(cluster->root_node);
+	kfree(cluster);
+}
+
+static void qcom_pas_cluster_put(struct qcom_pas_cluster *cluster)
+{
+	mutex_lock(&qcom_pas_cluster_list_lock);
+	kref_put(&cluster->kref, qcom_pas_cluster_release);
+	mutex_unlock(&qcom_pas_cluster_list_lock);
+}
+
+/*
+ * Wait for the cluster root to finish booting. Only non-root members
+ * block here; this is a no-op for standalone instances and for the root
+ * itself, since a cluster of one (no "qcom,depends-on" siblings) always
+ * has root_node == our own of_node.
+ *
+ * A manual start of a single non-root member is not turned into a
+ * whole-cluster boot: if the root isn't already up (or on its way up via
+ * a group crash/restart), this simply waits out the timeout below and
+ * fails, effectively rejecting the solo start rather than force-booting
+ * the root on the caller's behalf.
+ */
+static int qcom_pas_wait_for_cluster_root(struct qcom_pas *pas)
+{
+	struct qcom_pas_cluster *cluster = pas->cluster;
+	int ret;
+
+	if (cluster->root_node == pas->dev->of_node)
+		return 0;
+
+	ret = wait_event_interruptible_timeout(cluster->wq, cluster->booted,
+			msecs_to_jiffies(QCOM_PAS_CLUSTER_BOOT_TIMEOUT_MS));
+	if (ret == 0) {
+		dev_err(pas->dev, "timed out waiting for cluster root to boot\n");
+		return -ETIMEDOUT;
+	} else if (ret < 0) {
+		return ret;
+	}
+
+	return 0;
+}
+
+/*
+ * Called on successful boot completion (both qcom_pas_start() and
+ * qcom_pas_attach()). If we're the cluster root, mark the cluster booted
+ * and wake up any siblings waiting on us, and clear restart_pending now
+ * that the group restart (if any) that this boot was part of has
+ * completed.
+ */
+static void qcom_pas_cluster_mark_booted(struct qcom_pas *pas)
+{
+	struct qcom_pas_cluster *cluster = pas->cluster;
+
+	if (cluster->root_node != pas->dev->of_node)
+		return;
+
+	mutex_lock(&cluster->lock);
+	cluster->booted = true;
+	cluster->restart_pending = false;
+	mutex_unlock(&cluster->lock);
+
+	wake_up_interruptible(&cluster->wq);
+}
+
 static int qcom_pas_start(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
 	int ret;
 
+	ret = qcom_pas_wait_for_cluster_root(pas);
+	if (ret)
+		return ret;
+
 	ret = qcom_q6v5_prepare(&pas->q6v5);
 	if (ret)
 		return ret;
@@ -352,6 +524,8 @@ static int qcom_pas_start(struct rproc *rproc)
 	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
 	pas->firmware = NULL;
 
+	qcom_pas_cluster_mark_booted(pas);
+
 	return 0;
 
 unmap_carveout:
@@ -561,6 +735,8 @@ static int qcom_pas_attach(struct rproc *rproc)
 		goto unroll_attach;
 	}
 
+	qcom_pas_cluster_mark_booted(pas);
+
 	return 0;
 
 unroll_attach:
@@ -798,6 +974,73 @@ static void qcom_pas_unassign_memory_region(struct qcom_pas *pas)
 	}
 }
 
+/*
+ * rproc_shutdown() must not be called inline from qcom_pas_cluster_stop():
+ * that runs from inside the initiating member's own rproc_stop() call
+ * chain, and calling straight into another member's rproc_shutdown() from
+ * there races with that member's own concurrently running IRQ-driven state
+ * machine (e.g. its handover-IRQ thread), which isn't serialized against
+ * this. Defer it to process context instead, same as rproc_report_crash()
+ * already does via its own workqueue.
+ */
+static void qcom_pas_cluster_stop_work(struct work_struct *work)
+{
+	struct qcom_pas *pas = container_of(work, struct qcom_pas, cluster_stop_work);
+
+	rproc_shutdown(pas->rproc);
+}
+
+/*
+ * The cluster is never left partially up, matching the downstream
+ * coupled-SSR "MDF" group behaviour where all HPASS instances are always
+ * torn down and brought back as one unit. This is a no-op for cluster-of-one
+ * instances (no other members share the cluster).
+ *
+ * The two triggers are handled differently:
+ * - A real crash on any member is propagated to every *other* member via
+ *   rproc_report_crash(), so the whole cluster crashes and automatically
+ *   recovers together.
+ * - A manual (non-crash) stop of a single member must not bounce the
+ *   cluster back up on its own - the caller asked for it to be stopped, not
+ *   restarted. So instead of reporting a crash, every *other* member is
+ *   force-stopped via a deferred rproc_shutdown(), same as if the user had
+ *   written "stop" to each of them too. They only come back up on an
+ *   explicit subsequent start.
+ *
+ * Only the *first* member to reach here for a given cycle acts on the
+ * rest: every member in the cluster has this same subdev, so once the
+ * group-wide operation is under way, each other member's own stop (as a
+ * side effect of the crash recovery, or of the deferred rproc_shutdown()
+ * below) would otherwise re-trigger this all over again. restart_pending is
+ * the latch that prevents that; it's cleared once the cluster root boots
+ * again (qcom_pas_cluster_mark_booted()).
+ */
+static void qcom_pas_cluster_stop(struct rproc_subdev *subdev, bool crashed)
+{
+	struct qcom_pas *pas = container_of(subdev, struct qcom_pas, cluster_subdev);
+	struct qcom_pas_cluster *cluster = pas->cluster;
+	struct qcom_pas *member;
+
+	mutex_lock(&cluster->lock);
+	if (cluster->restart_pending) {
+		mutex_unlock(&cluster->lock);
+		return;
+	}
+	cluster->restart_pending = true;
+	cluster->booted = false;
+	mutex_unlock(&cluster->lock);
+
+	list_for_each_entry(member, &cluster->members, cluster_node) {
+		if (member == pas)
+			continue;
+
+		if (crashed)
+			rproc_report_crash(member->rproc, RPROC_FATAL_ERROR);
+		else
+			schedule_work(&member->cluster_stop_work);
+	}
+}
+
 static int qcom_pas_probe(struct platform_device *pdev)
 {
 	const struct qcom_pas_data *desc;
@@ -806,6 +1049,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	struct device_node *node;
 	const char *fw_name, *dtb_fw_name = NULL;
 	const struct rproc_ops *ops = &qcom_pas_ops;
+	struct device_node *root_node;
 	int ret;
 
 	desc = of_device_get_match_data(&pdev->dev);
@@ -863,6 +1107,19 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	}
 	platform_set_drvdata(pdev, pas);
 
+	root_node = of_parse_phandle(pdev->dev.of_node, "qcom,depends-on", 0);
+	if (!root_node)
+		root_node = of_node_get(pdev->dev.of_node);
+
+	pas->cluster = qcom_pas_cluster_get(root_node);
+	if (!pas->cluster) {
+		ret = -ENOMEM;
+		goto free_rproc;
+	}
+	pas->cluster_subdev.stop = qcom_pas_cluster_stop;
+	rproc_add_subdev(rproc, &pas->cluster_subdev);
+	INIT_WORK(&pas->cluster_stop_work, qcom_pas_cluster_stop_work);
+
 	ret = device_init_wakeup(pas->dev, true);
 	if (ret)
 		goto free_rproc;
@@ -929,6 +1186,10 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	if (ret)
 		goto remove_ssr_sysmon;
 
+	mutex_lock(&pas->cluster->lock);
+	list_add_tail(&pas->cluster_node, &pas->cluster->members);
+	mutex_unlock(&pas->cluster->lock);
+
 	node = of_get_compatible_child(pdev->dev.of_node, "qcom,bam-dmux");
 	pas->bam_dmux = of_platform_device_create(node, NULL, &pdev->dev);
 	of_node_put(node);
@@ -948,6 +1209,8 @@ static int qcom_pas_probe(struct platform_device *pdev)
 unassign_mem:
 	qcom_pas_unassign_memory_region(pas);
 free_rproc:
+	if (pas->cluster)
+		qcom_pas_cluster_put(pas->cluster);
 	device_init_wakeup(pas->dev, false);
 
 	return ret;
@@ -960,8 +1223,15 @@ static void qcom_pas_remove(struct platform_device *pdev)
 	if (pas->bam_dmux)
 		of_platform_device_destroy(&pas->bam_dmux->dev, NULL);
 
+	mutex_lock(&pas->cluster->lock);
+	list_del(&pas->cluster_node);
+	mutex_unlock(&pas->cluster->lock);
+
+	cancel_work_sync(&pas->cluster_stop_work);
+
 	rproc_del(pas->rproc);
 
+	rproc_remove_subdev(pas->rproc, &pas->cluster_subdev);
 	qcom_q6v5_deinit(&pas->q6v5);
 	qcom_pas_unassign_memory_region(pas);
 	qcom_remove_glink_subdev(pas->rproc, &pas->glink_subdev);
@@ -971,6 +1241,7 @@ static void qcom_pas_remove(struct platform_device *pdev)
 	qcom_remove_ssr_subdev(pas->rproc, &pas->ssr_subdev);
 	qcom_pas_pds_detach(pas, pas->proxy_pds, pas->proxy_pd_count);
 	device_init_wakeup(pas->dev, false);
+	qcom_pas_cluster_put(pas->cluster);
 }
 
 static const struct qcom_pas_data adsp_resource_init = {
-- 
2.43.0

