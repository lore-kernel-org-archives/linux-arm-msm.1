Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5B1526AB3
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 15:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866865; cv=none; b=bAISgtY4PNPMPP0F4tkI5HEJxF2SQIfXEA1l47lAgNNOYUOWQ1MqQxknedLBKGWsCr5j3bUg/J3KkpX2f6a3nPE4ragQBTYkweZTybiBRhWDWNnTQbdic8gAeXHhwVKExYepbWv9Am+UuUosAFuYwBFYVp3qzkuSQaEXK8NvLB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866865; c=relaxed/simple;
	bh=sXpuH20fyOsY4luYBrH4B4yDXtYJ0SXMp/0xlGA88MA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Mmm8Vyfb5LDI7cbY4KItjrVAZvel0e9OeHU5lwzHFEvlSwlV0Y/97qxp0k8iXGhxH3ZssB8yK8q9xPqon6D7CIzCTHeWHvtwTjgrpyka2Y/viblRbdm9CDKP5krNaAL3r/7lViRlVDxv/Z5sYwfuNFR+i18guVPl3HHhg0+LRcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kf6rJcWY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f6VmYKwH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kf6rJcWY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f6VmYKwH"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DjJrR2403922
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 15:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5bAcYGIy8jeI69YAlNTN0l
	uYORkRy+CXm8QV/D8mVoQ=; b=Kf6rJcWYegaDp3jf1LFrlEekIm8E3HGo4HFZD9
	rFDaOuewIJHuP0ht4l3tOWqs60ZsMZIrKD9pKJNymlvt4OT46mWm5YwYObpL5qyS
	ODOTUoRxfZurjBvRUa8gZ84R9pEsqJX21/XvdKD9qN9/+jlK4Zr5kE0pTjt4mfX5
	NXLaAI+DAlGxbpwPmu55xILYVcNQo1gSZV+QMyasWMFS2lymZXZktyXkmtqvCnmz
	a74ZZHVBkG1lVkUKfXFC1btAXPHrtsTMlX0sDsRUvPzIp1yMIxGyU1CKN/Sg+bLM
	3pDs81pC7AjbfxzzHU1hhh/FbrGET9Gc6XM9Id1kmf+kB1IA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188svb24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 15:01:01 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-45e83fd0663so7647465fac.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 08:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790866861; x=1791471661; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5bAcYGIy8jeI69YAlNTN0luYORkRy+CXm8QV/D8mVoQ=;
        b=f6VmYKwHwVFHmm1LNTqkNMBc3K6JiOO1Z6hmm9tfKUi/3zVJCNJLijvE8HEyCA1lIm
         r0bxiMEES4z5Rl4emuqtVn+MKrE3xD+TDx6PvUWCzpeBtlIcVWYfsTPACNQxaJi4NN4o
         WdCIPZpbMphszwqtvihAftsDMHpyeMvAxyHaigsThhEQEZsP9M5dUNjqddTubpv2jxwP
         scFCfMdnjS+6d32jibFvzJ1baErZVAKVcE2ZSss4GqEsm7ZJkGCo5EEz4rMNY5DAxmh2
         IdkYsWt9mi1hCBqTRAjymjvcUM2GO+2VuPWTyPB0G6zUvIDKvbG4D91H5cSWnNz2BQ1z
         pHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790866861; x=1791471661;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5bAcYGIy8jeI69YAlNTN0luYORkRy+CXm8QV/D8mVoQ=;
        b=bKFuN3vsg+gwx8VTx50FYna+Z90CsusSLj+OSPHrfNfshfAOehHzpcgdRsrexzKtIK
         dbQTOjseS5GWyp5QNAcAzDNmFLNPMEQNoNmGR78595gn+fL1tkCyiQKxikrqPOs1rZFu
         NtIplkEoGZNFg3QrRYwe28BxZ/KCpCUjrt2CUzgUMaZmJfcNS4d8Y6d9JzzAelH/mGtx
         S2exgFOz0OwR1GtuAQ8Z7nwt/0BkZvLzgSBSbCEchZhG6JklNa/X2eEYOy5IoFANHKHa
         AWKWyVw8zc0HYyVHGOg2kSwDt6pqEVwu0NJDQrqqIAfnfDC1bNFwxMmhwnBrqv8BFlFI
         DmKA==
X-Gm-Message-State: AFuF++mBfS+DsswXzqKz00Bh1le4aui8rooXnenDDxCJSW2eKNqCesG9
	9n7QRwHYMFe0KCudAHcZoq7GK0axseFVs4Y8T4GkdXFrUGZ8A6FcLwcXKTtHHhYbXcAjwiHO0mq
	gkrFZtvSenX6ZI742jeIu5FUqD8CZDyBOpeKpND2udN5q4V+WJ8t1bfnYxap7R895NxOj
X-Gm-Gg: AYBFou0Vmzax8wIyOsLPqUWOlk2k8ctkDrwSImI24ziTs2h4Co8B5yCA3+sVFNoqIIg
	X67nvdkoc+NFQu2NeNlEghgLo3YpP+N0+5DLcC7QIGOPre9WrmDvY3nepquiFIi4Bfu+GZ45c3v
	KLoHDQs23jYArNDz+7YLHDyv+7nC/Ry0oJyg6JOtigsFuQKqg/EbnCWKrg8azVEmOJI+NXNO7nB
	CSmCK9IUMnRQxtHN23cceE3a4NrZ9Aeo90blBgC7RQ1w1gv2n+nia8gZR+EqZDBmHL5eqwRff6K
	c9ypjUbJA4zhI2jqHkouEIGn71xzT6JEdYiv6u5zuC22HlppszSWhWl2TChmg4Xa18SMiZdN5gU
	eongJOXMM3w==
X-Received: by 2002:a05:6820:1501:b0:6d7:a325:35f7 with SMTP id 006d021491bc7-6dcf68163a3mr5166244eaf.81.1790866860336;
        Thu, 01 Oct 2026 08:01:00 -0700 (PDT)
X-Received: by 2002:a05:6820:1501:b0:6d7:a325:35f7 with SMTP id 006d021491bc7-6dcf68163a3mr5166181eaf.81.1790866859513;
        Thu, 01 Oct 2026 08:00:59 -0700 (PDT)
Received: from [10.213.99.236] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6dd982ed764sm2590712eaf.11.2026.10.01.08.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:00:59 -0700 (PDT)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 20:30:49 +0530
Subject: [PATCH v2] misc: fastrpc: map ADSP remote heap into remoteproc
 IOMMU domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-fastrpc-kvm-iommu-v2-v2-1-6c32ad6f662f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKF1vmoC/yXMQQ6CMBBA0auQWTtJnRpEr2Jc1HaQ0RRIBxoTw
 t2psHyL/xdQTsIK92qBxFlUhr6AThX4zvVvRgnFQIZqc7MGW6dTGj1+c0QZYpwxE57dNdiL5dA
 YgpKOiVv57dvH87DOrw/76f+Cdd0A9/+rPXgAAAA=
X-Change-ID: 20260930-fastrpc-kvm-iommu-v2-1a7d343ed802
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1OSBTYWx0ZWRfX52slvQpnkt2J
 yzRDLgIjk/htUhoNFGLsOZygHos3/an5o2x59X4imXamvQGd1T6+J9AGiNWNobQHnFxZrVaKUBe
 jExrREDb8Ukj4PKFRzez6D8obb111qA=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abe75ad cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ag1SF4gXAAAA:8 a=e5mUnYsNAAAA:8
 a=COk6AnOGAAAA:8 a=Mo4pmYlT2hf4TzH739EA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: CtUEZwscbqeBVcZcmM6Bo7L72DB0OVt7
X-Proofpoint-GUID: CtUEZwscbqeBVcZcmM6Bo7L72DB0OVt7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1OSBTYWx0ZWRfXwxUP2SewSDQT
 6BOuGyZ4GeUCV8pgbbh86RlV9IJBvG8kuZJAFSks+Ey1xszrAJSFu5ownwbdpUbesoRJZpxgJjT
 wf6Nqei3lZNmPbVX2GMtQIRabHH3tBJaf1H2ZAJkymzsBS+J97kvunr9OTyBzJHaXudV4T3mdXW
 yt+XwXaXegrSmIbOfQ332ImO6do0beUfmssMcNN6ju6yjIoh/sZc7OyCqgdmm+AkfO7FvR8H2DZ
 +lSyxnJhGtdcgZXEqrc6ACzIZ5QQ2jzK1Ig/mU6vOzFOhjNwRxsyL8qJOS7JuSGpQNAgcJnU9O1
 /v8ESzyyLwwasg6MKijEyPrQ/hrh0zagtWv7Wa0QLvZc7WjYbZZdysauF/Bwx4O7rfa/L3g5ftZ
 U+U66ZUUbV2yQdW1krfjEcCkHLjOip++WcjEN2CD1J+ga2kupC/wn8upYZ5+Dzt1OZ0nqQBhqPp
 LebIVijTLhlAh/OwhJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010059

On KVM-based targets the kernel runs at EL2 without a separate
hypervisor to manage inter-VM memory access control.  In this
configuration the remoteproc is assigned its own IOMMU domain, and
any memory carveout the DSP must access requires an explicit mapping
into that domain before the DSP can reach it.

The existing code calls qcom_scm_assign_mem() to transfer ownership
of the ADSP remote heap carveout from HLOS to the DSP VM.  This SCM
call is only meaningful when a separate hypervisor (e.g. Gunyah) is
present to enforce inter-VM memory access control.  On KVM-based
targets no such hypervisor exists, so the carveout must instead be
mapped into the remoteproc's IOMMU domain via an identity mapping
(IOVA == PA) using iommu_map().  Without this mapping the DSP
triggers an SMMU translation fault when accessing the remote heap
during audio PD static process creation.

Detect whether the remoteproc has an IOMMU by checking for the
"iommus" property on the remoteproc DT node and store the result in
a new use_iommu_map flag in fastrpc_channel_ctx.  When the flag is
set, map the carveout into the remoteproc's IOMMU domain instead of
calling qcom_scm_assign_mem().  Introduce fastrpc_remote_heap_map()
and fastrpc_remote_heap_unmap() helpers to encapsulate the IOMMU
domain lookup and map/unmap operations.

Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
To: Amol Maheshwari <amahesh@qti.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: ekansh.gupta@oss.qualcomm.com
Cc: quic_bkumar@quicinc.com
Cc: quic_chennak@quicinc.com
---
Changes in v2:
- Rebase onto the fastrpc-for-next tree, which now has the remote
  heap allocation and reserved-memory handling changes.
- Rename has_iommu to use_iommu_map for clarity.
- In fastrpc_rpmsg_remove(), the IOMMU unmap path now mirrors the
  qcom_scm_assign_mem() path exactly, so the two are handled
  consistently instead of leaving the IOMMU case with different
  cleanup semantics.
- Add fastrpc_get_rproc_node() to fix a device_node refcount leak:
  the previous of_get_parent(of_get_parent(node)) pattern never put
  the intermediate parent node.
- Unmap the remote heap from the remoteproc's IOMMU domain if probe
  fails after the mapping succeeds, instead of leaking the mapping
  and causing -EEXIST on every subsequent probe attempt.
- Log a warning in fastrpc_remote_heap_unmap() on each failure path
  (remoteproc node/platform device/IOMMU domain not found, or a
  partial iommu_unmap()), instead of silently leaving the mapping in
  place with no diagnostic.

Link to v1: https://lore.kernel.org/r/20260618-audio_fix_clean_v3-v1-1-ec1ee66fe455@oss.qualcomm.com
---
 drivers/misc/fastrpc.c | 149 ++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 128 insertions(+), 21 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 5ac7b3e78ba7..89f4a80ad9be 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -21,6 +21,7 @@
 #include <linux/slab.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <uapi/misc/fastrpc.h>
+#include <linux/iommu.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
@@ -317,6 +318,8 @@ struct fastrpc_channel_ctx {
 	/* Audio PD reserved remote heap region */
 	phys_addr_t remote_heap_addr;
 	u64 remote_heap_size;
+	/* set when remoteproc has an IOMMU; use iommu_map instead of hyp_assign */
+	bool use_iommu_map;
 	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
 	struct fastrpc_device *secure_fdevice;
 	struct fastrpc_device *fdevice;
@@ -2507,9 +2510,90 @@ static const struct of_device_id fastrpc_poll_supported_machines[] __maybe_unuse
 	{},
 };
 
+static struct device_node *fastrpc_get_rproc_node(struct device_node *node)
+{
+	struct device_node *parent, *rproc_node;
+
+	parent = of_get_parent(node);
+	if (!parent)
+		return NULL;
+
+	rproc_node = of_get_parent(parent);
+	of_node_put(parent);
+
+	return rproc_node;
+}
+
+static int fastrpc_remote_heap_map(struct device *rdev,
+				   struct device_node *rproc_node,
+				   phys_addr_t addr, u64 size)
+{
+	struct platform_device *rproc_pdev;
+	struct iommu_domain *domain;
+	int ret;
+
+	rproc_pdev = of_find_device_by_node(rproc_node);
+	if (!rproc_pdev) {
+		dev_err(rdev, "failed to find remoteproc platform device\n");
+		return -ENODEV;
+	}
+
+	domain = iommu_get_domain_for_dev(&rproc_pdev->dev);
+	if (!domain) {
+		put_device(&rproc_pdev->dev);
+		dev_err(rdev, "no IOMMU domain for remoteproc\n");
+		return -ENODEV;
+	}
+
+	ret = iommu_map(domain, addr, addr, size, IOMMU_READ | IOMMU_WRITE, GFP_KERNEL);
+	if (ret)
+		dev_err(rdev, "failed to map remote heap phys=0x%llx size=0x%llx err=%d\n",
+			(u64)addr, size, ret);
+
+	put_device(&rproc_pdev->dev);
+	return ret;
+}
+
+static void fastrpc_remote_heap_unmap(struct rpmsg_device *rpdev,
+				      phys_addr_t addr, u64 size)
+{
+	struct device_node *rproc_node;
+	struct platform_device *rproc_pdev;
+	struct iommu_domain *domain;
+	size_t unmapped;
+
+	rproc_node = fastrpc_get_rproc_node(rpdev->dev.of_node);
+	if (!rproc_node) {
+		dev_warn(&rpdev->dev, "failed to find remoteproc node for heap unmap\n");
+		return;
+	}
+
+	rproc_pdev = of_find_device_by_node(rproc_node);
+	of_node_put(rproc_node);
+	if (!rproc_pdev) {
+		dev_warn(&rpdev->dev, "failed to find remoteproc platform device for heap unmap\n");
+		return;
+	}
+
+	domain = iommu_get_domain_for_dev(&rproc_pdev->dev);
+	if (!domain) {
+		dev_warn(&rpdev->dev, "no IOMMU domain for remoteproc during heap unmap\n");
+		put_device(&rproc_pdev->dev);
+		return;
+	}
+
+	unmapped = iommu_unmap(domain, addr, size);
+	if (unmapped != size)
+		dev_warn(&rpdev->dev, "partial/failed heap unmap: requested=0x%llx unmapped=0x%zx\n",
+			 size, unmapped);
+
+	put_device(&rproc_pdev->dev);
+}
+
 static int fastrpc_init_reserved_mem(struct fastrpc_channel_ctx *cctx,
 				     struct device *rdev, u32 domain_id)
 {
+	struct device_node *rproc_node;
 	struct resource res;
 	u64 src_perms;
 	int err;
@@ -2536,6 +2620,19 @@ static int fastrpc_init_reserved_mem(struct fastrpc_channel_ctx *cctx,
 	if (domain_id == ADSP_DOMAIN_ID) {
 		cctx->remote_heap_addr = res.start;
 		cctx->remote_heap_size = resource_size(&res);
+
+		rproc_node = fastrpc_get_rproc_node(rdev->of_node);
+		if (rproc_node)
+			cctx->use_iommu_map = of_property_present(rproc_node, "iommus");
+
+		if (cctx->use_iommu_map) {
+			err = fastrpc_remote_heap_map(rdev, rproc_node, res.start,
+						      resource_size(&res));
+			of_node_put(rproc_node);
+			return err;
+		}
+
+		of_node_put(rproc_node);
 	}
 
 	if (!cctx->vmcount)
@@ -2611,7 +2708,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		data->unsigned_support = false;
 		err = fastrpc_device_register(rdev, data, secure_dsp, domain);
 		if (err)
-			goto err_free_data;
+			goto err_unmap_heap;
 		break;
 	case CDSP_DOMAIN_ID:
 	case GDSP_DOMAIN_ID:
@@ -2619,7 +2716,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
 		err = fastrpc_device_register(rdev, data, true, domain);
 		if (err)
-			goto err_free_data;
+			goto err_unmap_heap;
 
 		err = fastrpc_device_register(rdev, data, false, domain);
 		if (err)
@@ -2627,7 +2724,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		break;
 	default:
 		err = -EINVAL;
-		goto err_free_data;
+		goto err_unmap_heap;
 	}
 
 	kref_init(&data->refcount);
@@ -2655,6 +2752,11 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	if (data->secure_fdevice)
 		misc_deregister(&data->secure_fdevice->miscdev);
 
+err_unmap_heap:
+	if (data->use_iommu_map && data->remote_heap_size)
+		fastrpc_remote_heap_unmap(rpdev, data->remote_heap_addr,
+					  data->remote_heap_size);
+
 err_free_data:
 	kfree(data);
 	return err;
@@ -2695,24 +2797,29 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
 		list_del(&buf->node);
 
-	if (cctx->remote_heap_size && cctx->vmcount) {
-		u64 src_perms = 0;
-		int err, i;
-		struct qcom_scm_vmperm dst_perms;
-
-		for (i = 0; i < cctx->vmcount; i++)
-			src_perms |= BIT(cctx->vmperms[i].vmid);
-
-		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
-		dst_perms.perm = QCOM_SCM_PERM_RWX;
-
-		err = qcom_scm_assign_mem(cctx->remote_heap_addr,
-					  cctx->remote_heap_size, &src_perms,
-					  &dst_perms, 1);
-		if (err)
-			dev_err(&rpdev->dev,
-				"Failed to assign memory back to HLOS: addr %pa size %#llx err %d\n",
-				&cctx->remote_heap_addr, cctx->remote_heap_size, err);
+	if (cctx->remote_heap_size) {
+		if (cctx->use_iommu_map) {
+			fastrpc_remote_heap_unmap(rpdev, cctx->remote_heap_addr,
+						  cctx->remote_heap_size);
+		} else if (cctx->vmcount) {
+			u64 src_perms = 0;
+			int err, i;
+			struct qcom_scm_vmperm dst_perms;
+
+			for (i = 0; i < cctx->vmcount; i++)
+				src_perms |= BIT(cctx->vmperms[i].vmid);
+
+			dst_perms.vmid = QCOM_SCM_VMID_HLOS;
+			dst_perms.perm = QCOM_SCM_PERM_RWX;
+
+			err = qcom_scm_assign_mem(cctx->remote_heap_addr,
+						  cctx->remote_heap_size, &src_perms,
+						  &dst_perms, 1);
+			if (err)
+				dev_err(&rpdev->dev,
+					"Failed to assign memory back to HLOS: addr %pa size %#llx err %d\n",
+					&cctx->remote_heap_addr, cctx->remote_heap_size, err);
+		}
 	}
 
 	of_platform_depopulate(&rpdev->dev);

---
base-commit: ef071c4906eb45d16b60f09154cf0bc6ec8f5435
change-id: 20260930-fastrpc-kvm-iommu-v2-1a7d343ed802

Best regards,
--  
Anandu Krishnan E <anandu.e@oss.qualcomm.com>

