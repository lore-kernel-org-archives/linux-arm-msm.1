Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793040865;
	b=vF0pwhZt4SUG3GUZ07N5VwIcKcIEvvtnxUd4TsAhXT/dHcH5sd+cyw8D4vcDbMD2OqU2
	 +VzfxCfcxE9AoK77MKg8F+A0tgFnGY0WFVqo3xueVrqDWw8E6J3Rk+4Za69zL6WXxF0CH
	 1oB0zkWdvO3VY+zljLjuAAPlHRznBzaNTGdkqOVihl06tcEXqWdTC2WvPu9tovjOMJTHA
	 WYGIxuva+HHprGbiC+sM42x0Y9tx2BOXNoBADTLEiYU2XlOuUUEIoxoMA6uUdCW3ost+p
	 SmFRoxS66fhbfhkVvHP7256ufFiBcXqW0Z+4taPfwgkfeNsfQQ/senEp6az2CktGKJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793040865;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HSEc/dzCqExMKvSywjeFaaYjo8J856bxXeEPQotT0g8=;
	b=jxn4/ieRsDIZ/sc+nTYUPr1rsPDPs8MFdxSv1FGL9SkNpZAYyFVRoeipbxoeJ+7AoY1H
	 gC6LLtD1h+j/LgbyDHYOU7XKWWlpX5ud37asBNmpsn05i2uDjWGvNn0qfAgds9fuKCwwT
	 fJPcGaVnnrb3pv9X3xcdreh/safvfhp2RWwuar0Is/TpFyMhbU1sNlXmdHF9FIa9YnAL1
	 k1xZF3A7PrGUrqcgTZoGICUSYAzRj2leYU7YObh/z/WZUgP+IgJ4ZmYZVzdhg+yScYPf9
	 Il9UIv1XeuUgTAqP3HJtd5uq6aZm7ySmkFsM41Pi0REp8hX2ZVkMl4RJej8nAEUWGFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IOjPybNh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CPh8qIPB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCCA606A31D
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 18:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BCCA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IOjPybNh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CPh8qIPB
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QIo3Px979645
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 18:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HSEc/dzCqExMKvSywjeFaa
	Yjo8J856bxXeEPQotT0g8=; b=IOjPybNhuBc4sQbAqiIED6B3YAOSkT2RIqfx4z
	QcfbmKjeeZSbm39vkt+Md9/8Np5v5hKm39PWVoz0vlFl9qWyrmskrnefScwneUoV
	s/8VbJlxQFx9acO8y215zFxuIX0//YaEmOadeTFgA3GaDnM9ZAOTaVEoCRkXmWhY
	BOWyZqlqiBrxCYaxABAG2umk1a4sUG4rp+RcDxCpyL4IY4EsKyKpZNDe1uRWfZPa
	5uE3c3YXUMb9I8kYZcqnhJzMZumeqDZNfjlv4HgD1hB31R/BybMDiVn0bVf1ALN7
	7QiU+P6RvRmy8xX0I0hU8D66j8ML4gzWvjVeLF7E2sGb39pg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshpux8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 18:54:23 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-8486941f252so5120074a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793040862; x=1793645662; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HSEc/dzCqExMKvSywjeFaaYjo8J856bxXeEPQotT0g8=;
        b=CPh8qIPBjkIySeunvRmNC04sYp6rK6OdD1zd8c1if3QgfvWpU4GjAQZObua+0ovoyH
         sOrCBOke7Yz00gwirTpP0Wb0DwgwthrKsuRYTjGyrd3W4hwbwflRzR1FyK+PanpEAs36
         dyPXT65ltBFWkqjs262YmDOqwJbRIzwo8Wwptpo0NenfhAOjo9RME0lPmpRM0nUO84mx
         B5oJKizk0vrvCmxMHeRv6EUGvMXO08PtkoFIWi7/dW1/rbNxUovrRRpWA2UN/s+9bIko
         6I1k6LK9r2ZsCnp3zNmG+9UWVvb2T7iMDoGDotEd6b9ujm4443htqFMg9eYNJAX5m+Q4
         IsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793040862; x=1793645662;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HSEc/dzCqExMKvSywjeFaaYjo8J856bxXeEPQotT0g8=;
        b=dzokVrPq1Cs4B09L4CXTp26BIwxA4PMV0631JXRhDPcPrsGKNkILusxp7SZe5XnpDJ
         CV3pbCUtFLe+LcuNGB0JbflAGHdkeo4utrgXPt7PEmgwobEE/fKFchheSu7GFbT8c3ub
         hl2qhh9HgMJBtwiA5BppNiNp//HADHpdG20tRNCcSOt+2+IQSx1TphEzKIslEXsO3Rid
         tUEL2qBAEHWbw5/ww4JwfUI0Kzk7Qtv9Qlolj8WLxo6C7McuKBUAVCUQIYgU1IxxD/gn
         hcypiKHM9PYaiYb+SPJ3YShXaKhFicFHK0t4wHS4HFFpsiuWJUgGWwR4rt85qzci0BDr
         teZA==
X-Gm-Message-State: AFq9FYI/QDqbw4ZRyXdC6kkRLq7fUI4liFiJ+GCJly4bktogjn0/+Ic2
	D56IMuWMEtDEPoGuvaUT49Oe/WCdMfVAA8pq2GYRpm0axTzAzzRl5dE7qw5Z2W4k/CsmTxB1YG/
	iaqb5EDNeQ93PK9VAVLlTGq+LwqbWTnfvpGMskdmk7/m5y2AEz9fsm7jItCZuB2FcqHGK
X-Gm-Gg: AYBFou1OCB727I6o1Ig/4znW9f9kpkPU7TNrkQA/jtOCxaoXIYfbJNe0hGZ4c3JUe/U
	VeXEEZogPZ8X7VX3b9tK2bpgSIgbnMLeNkNwxkxB4Tlh4GOkEVkMLXt4Srmdtz2ae8DEHnMYgvH
	XyDJVCfE0EtMJS+HSTgXNdF6WtFKyUCOlvkTiB73nsgGhnrJC9bHemxOAdWENCYkz1HgCaRfVG3
	v7HQJIcMNUPX5lHzrtD79bYZRt/iGZ90k7wdJ17j8u2wL4N0uET3Gr5noRNq663EbJKxDzR3Arq
	s1+fwqlhOblgMXDX9RxWZ5CZXJyA3AcWj9jGfmgqP+q0h9F5h4fJWukwS/u+p9aTe10AsEZW0AO
	DWYbNZ0RN
X-Received: by 2002:a05:6820:3399:10b0:709:529a:478f with SMTP id 006d021491bc7-70ba0f65abcmr2758873eaf.60.1793040862317;
        Mon, 26 Oct 2026 11:54:22 -0700 (PDT)
X-Received: by 2002:a05:6820:3399:10b0:709:529a:478f with SMTP id 006d021491bc7-70ba0f65abcmr2758860eaf.60.1793040861867;
        Mon, 26 Oct 2026 11:54:21 -0700 (PDT)
Received: from [10.213.99.236] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e163a5dsm7588538eaf.8.2026.10.26.11.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:54:21 -0700 (PDT)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 00:23:32 +0530
Subject: [PATCH v3] misc: fastrpc: map ADSP remote heap into remoteproc
 IOMMU domain
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-fastrpc-kvm-iommu-v3-v3-1-f3cd5c030c78@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKuh32oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIzNDINZNSywuKSpI1s0uy9XNzM/NLdUtM9Y1MUhNSTNPSjM1Sk5VAmotKEp
 Ny6wAGxsdC+EXlyZlpSaXgMxSqq0FAGmKiG54AAAA
X-Change-ID: 20261026-fastrpc-kvm-iommu-v3-40edf7bf52ce
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, amahesh@qti.qualcomm.com,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA3NSBTYWx0ZWRfX4dygplgOr8/l
 f58Hvfon5ZfgFtJNYazl5irrOtf9IvjxB2ACn7ZvTHduQlPxb1w0Taqw5/Q0SDt5J5kgVgWYxGe
 FvVNUoPZfWL6nnfICu62+YxSBcK0YD0=
X-Proofpoint-GUID: w-9Mppo4iVWPM8x2M8xsK3rHCfXn_nS3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA3NSBTYWx0ZWRfX1p7v/Ef7au6N
 aYRsazt+gZJFd9e5AGjvNMHkjnT44WaPt2+3PzkUGcsbVEueSxPfyA71X7hiFq3wlKSP3K8x4qA
 LlKlDbewwquA+m4H2xDaVfFK9OgKJgTyCl1DmJN/wTYzwr4hbSLKPHcylOlW16u+b8/U+B9+sp5
 R9zMfqpRlzcXAmy3znbvkrkMj84QsP3pDlQh63TUQFAPzeUcuDCHVryLSaZliWXkWPcHnC7617y
 4FaGhB50I/pCjV1XidYNea3+zb3wBdSYfFqw7w4gHZV7t7o4EPmUOphValQWbsSz/bZzrzv/UcX
 zDHoC6mMRwuj9gIrk9z9bLkRyCRVzaNdMTbOwpuE/z00rLO2757OD+qlfdKtaIJFxhHYodZR+4T
 +wlsJONqXkl6+sH/Cezzgk/2XFg4KScsE6B3BEWYqXGzfxN7sy1C/NKwUqt+/pBhE4F2U6AGooW
 gdx5LLQw9E4LRW1cCpw==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adfa1df cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bTCLrGycSaRulq-cCbwA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: w-9Mppo4iVWPM8x2M8xsK3rHCfXn_nS3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260075

On Qualcomm platforms without Gunyah/QHEE, the kernel runs at EL2
without a separate hypervisor to manage inter-VM memory access
control.  In this configuration the remoteproc is assigned its own
IOMMU domain, and any memory carveout the DSP must access requires
an explicit mapping into that domain before the DSP can reach it.

The existing code calls qcom_scm_assign_mem() to transfer ownership
of the ADSP remote heap carveout from HLOS to the DSP VM.  This SCM
call is only meaningful when a separate hypervisor (e.g. Gunyah) is
present to enforce inter-VM memory access control.  On platforms
without such a hypervisor, the carveout must instead be mapped into
the remoteproc's IOMMU domain via an identity mapping (IOVA == PA)
using iommu_map().  Without this mapping the DSP triggers an SMMU
translation fault when accessing the remote heap during audio PD
static process creation.

Detect whether the remoteproc has an IOMMU by checking for the
"iommus" property on the remoteproc DT node and store the result in
a new use_iommu_map flag in fastrpc_channel_ctx.  When the flag is
set, map the carveout into the remoteproc's IOMMU domain instead of
calling qcom_scm_assign_mem().  Introduce fastrpc_remote_heap_map()
and fastrpc_remote_heap_unmap() helpers to encapsulate the IOMMU
domain lookup and map/unmap operations, and a shared
fastrpc_remote_heap_release() helper that tears the mapping (or SCM
assignment) back down, used both from fastrpc_rpmsg_remove() and
from fastrpc_rpmsg_probe()'s error path.

Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
---
Changes in v3:
- Rebase onto the current fastrpc-for-next tip.
- Reword the commit message's opening sentence: describe the
  condition as "Qualcomm platforms without Gunyah/QHEE" rather than
  "KVM-based targets".
- Fix #include <linux/iommu.h> ordering to keep the linux/* include
  block alphabetically sorted.
- Extract the heap teardown logic into a new shared
  fastrpc_remote_heap_release() helper and call it from both
  fastrpc_rpmsg_remove() and fastrpc_rpmsg_probe()'s error path, so
  that a probe failure on a Gunyah-based (non-IOMMU) target now also
  reassigns the carveout back to HLOS via qcom_scm_assign_mem()
  instead of leaving it assigned to the DSP VM.
- Link to v2: https://lore.kernel.org/r/20261001-fastrpc-kvm-iommu-v2-v2-1-6c32ad6f662f@oss.qualcomm.com
- Link to v1: https://lore.kernel.org/r/20260618-audio_fix_clean_v3-v1-1-ec1ee66fe455@oss.qualcomm.com
---
 drivers/misc/fastrpc.c | 156 ++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 134 insertions(+), 22 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 5ac7b3e78ba7..398bcd0cfab4 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -8,6 +8,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/dma-resv.h>
 #include <linux/idr.h>
+#include <linux/iommu.h>
 #include <linux/list.h>
 #include <linux/miscdevice.h>
 #include <linux/module.h>
@@ -317,6 +318,8 @@ struct fastrpc_channel_ctx {
 	/* Audio PD reserved remote heap region */
 	phys_addr_t remote_heap_addr;
 	u64 remote_heap_size;
+	/* set when remoteproc has an IOMMU; use iommu_map instead of hyp_assign */
+	bool use_iommu_map;
 	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
 	struct fastrpc_device *secure_fdevice;
 	struct fastrpc_device *fdevice;
@@ -2507,9 +2510,120 @@ static const struct of_device_id fastrpc_poll_supported_machines[] __maybe_unuse
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
+static void fastrpc_remote_heap_release(struct fastrpc_channel_ctx *cctx,
+					 struct rpmsg_device *rpdev)
+{
+	if (!cctx->remote_heap_size)
+		return;
+
+	if (cctx->use_iommu_map) {
+		fastrpc_remote_heap_unmap(rpdev, cctx->remote_heap_addr,
+					  cctx->remote_heap_size);
+	} else if (cctx->vmcount) {
+		u64 src_perms = 0;
+		int err, i;
+		struct qcom_scm_vmperm dst_perms;
+
+		for (i = 0; i < cctx->vmcount; i++)
+			src_perms |= BIT(cctx->vmperms[i].vmid);
+
+		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
+		dst_perms.perm = QCOM_SCM_PERM_RWX;
+
+		err = qcom_scm_assign_mem(cctx->remote_heap_addr,
+					  cctx->remote_heap_size, &src_perms,
+					  &dst_perms, 1);
+		if (err)
+			dev_err(&rpdev->dev,
+				"Failed to assign memory back to HLOS: addr %pa size %#llx err %d\n",
+				&cctx->remote_heap_addr, cctx->remote_heap_size, err);
+	}
+}
+
 static int fastrpc_init_reserved_mem(struct fastrpc_channel_ctx *cctx,
 				     struct device *rdev, u32 domain_id)
 {
+	struct device_node *rproc_node;
 	struct resource res;
 	u64 src_perms;
 	int err;
@@ -2536,6 +2650,19 @@ static int fastrpc_init_reserved_mem(struct fastrpc_channel_ctx *cctx,
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
@@ -2611,7 +2738,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		data->unsigned_support = false;
 		err = fastrpc_device_register(rdev, data, secure_dsp, domain);
 		if (err)
-			goto err_free_data;
+			goto err_unmap_heap;
 		break;
 	case CDSP_DOMAIN_ID:
 	case GDSP_DOMAIN_ID:
@@ -2619,7 +2746,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
 		err = fastrpc_device_register(rdev, data, true, domain);
 		if (err)
-			goto err_free_data;
+			goto err_unmap_heap;
 
 		err = fastrpc_device_register(rdev, data, false, domain);
 		if (err)
@@ -2627,7 +2754,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		break;
 	default:
 		err = -EINVAL;
-		goto err_free_data;
+		goto err_unmap_heap;
 	}
 
 	kref_init(&data->refcount);
@@ -2655,6 +2782,9 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	if (data->secure_fdevice)
 		misc_deregister(&data->secure_fdevice->miscdev);
 
+err_unmap_heap:
+	fastrpc_remote_heap_release(data, rpdev);
+
 err_free_data:
 	kfree(data);
 	return err;
@@ -2695,25 +2825,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
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
-	}
+	fastrpc_remote_heap_release(cctx, rpdev);
 
 	of_platform_depopulate(&rpdev->dev);
 

---
base-commit: ef071c4906eb45d16b60f09154cf0bc6ec8f5435
change-id: 20261026-fastrpc-kvm-iommu-v3-40edf7bf52ce

Best regards,
--  
Anandu Krishnan E <anandu.e@oss.qualcomm.com>

