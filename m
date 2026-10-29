Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309032;
	b=E4Rhfl8anRrPJKjKNFLoJz5pdaPBmpZFegTyHbQWQ4OLyfyBMJjzB/c8w3vXaMunLNrt
	 UD1WlWs6mL+0YyCiz1WLnTqBK0hM3yS3ntWB/oI8zZhLdegrds7ggHWbGIabIuwDLVG62
	 w/AOAkdRXAW0MDa1ywfsr+7P2tJHEm5pwekpJkI4C5df12MNLYWjHJonF7MkYSrLMWnCg
	 E9VuW0WPWeTiMyM4J7bG+9jGgc28NhsttEKfzeHU/jJqLPRTE/JUys0oU11cOcyvOOPhn
	 M8htqg0VH7ntpn9YTQumCxmQSx2u/wGLxaobmnXUyNhsgdAAB414IcU7vmQkmFEnyKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309032;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TzzXFuNiq+DOToFpekJQ4MBDEjsWCEdNN/aJK57pRJ4=;
	b=iceo84JwyH3s0y+jtfqqz9g1//zEkGzSI4KZakRdhLkla/dieT3cQTdUFr3Rdy6mDN78
	 C0FY6dlfYIy/j55tNfHbKC2gms5VXLIGt/rSPsTsDXVMnsLKPvtc+oyZKFR+7qjm2FGqj
	 qyy/IoAYSYWHR1G4cUD69NYB8buenPwg+Po/iEdMKhDHbJ1oC6DKUI7dt6ls8kpnmw4SO
	 BDBFB1IkKWMbXK5FMj1cbPyLS4vpppYx4CLT9nsAqjI/qpXiMoG4dFuXXw40JgXLkarLu
	 SSVxJ2HYtlUvVK7PjWZvSq/0ELT6JxN0/Q+31wbirqo8MS8j+ztTqHKxDi92BKHcsSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TJCZg4Pz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ALOwedWJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92CF606A320
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 21:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D92CF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TJCZg4Pz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ALOwedWJ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJjb3o1133728
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 21:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TzzXFuNiq+D
	OToFpekJQ4MBDEjsWCEdNN/aJK57pRJ4=; b=TJCZg4Pzwyuj+Fp2/ydS72faFti
	vP3k7bkoejYpzXKZpeGpYDqEV4YMyXzaaKVT86aBPvF35VGulkxcpcMEB5UwKxEg
	v87XtV9m78Vj2ruauEckOTuF4xWrSax0/sG43AyBEhSH6hdlW5xatfGpSnL15t4k
	51m7V5nt9RqDjGSRsoqXZLsFcXDSDgMOPN2JJHtUYK2mY2oy7WqWvjTbckkBcMaK
	sBdhNG7YJkszATsByXuaYbQdH67t1yrhnsyllTN/Rz+6X5TRUql/hUWHnNiNNDeT
	wyks8KMLfBOl8FsI+xy6A/+KVKmPpT2EwZ2XjraoQda5vDmT5469CjodvAA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hmbeas9vg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 21:23:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d5dbso34158a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 14:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793309030; x=1793913830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzzXFuNiq+DOToFpekJQ4MBDEjsWCEdNN/aJK57pRJ4=;
        b=ALOwedWJ49/CaS9GccvgiYciIBz5VUB+E7Hn3qn+0moKNghZYkRsa53hrJNAKNEUOa
         awGCPJibipV028iSVi8w4QGqRh2khM/TUVZjJQFZ4wVx1cXYt9VecdF0yACxIcqnd5ak
         9Ev2/ZVkfqETzc3qOhbKTioFbT5taEwREjDHXKVnb5mKTulQZSn16Z47JVtZS9ZObuPK
         oTR14mIyKRhCvOPp1iFzRFnCZts2Ml5YpuMl49ty9AcRMIyruqqK3YdjA3NoKGRXU87n
         oYFRzN7nkO0EEcY7gX2HZQvZ7LfrDwDV1b6Ypi998e8WW2Y24SL/yv9VNaU6LtbRfnUQ
         LBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309030; x=1793913830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TzzXFuNiq+DOToFpekJQ4MBDEjsWCEdNN/aJK57pRJ4=;
        b=hKppTw5rsRSdijq2TNlAfYtkz8lh6U/Tsd6SITONxgZJRDilj/BDsH2/0bpcz9tfA7
         dAPfM7JyxWaTJ+6Wn5pwHN0SxZAQXcm5cfAlyRiysOh3UNPzXxbeAVh/zHSYqy5LDGOm
         oesSOJCp9SQKLcksaHyV6Ka9rkUzCc0uGZquIJXkbID/NTp8POu7oAQg2wtCHAb0wG9/
         8/H0jfmX0GOoM79aNfdGWa89y+N0GwYuOE24ij3bBKJD7nr04bTLsXE1NpgE04YQZ2A+
         bMa7PsOy057CrOfSxGO8THWujN99IH4ztFvdgdACfmFCPCz5VMaGtW7nW4tUha/TiI12
         /pCA==
X-Forwarded-Encrypted: i=1; AKwUvBzF20C750wCZ+ZD3ASXVHysErJXHjieflg3UWQ5i57Qrq+mkLP0XXzuAJMzM39y+vRbvm37YLDHwe/Mt7W1@vger.kernel.org
X-Gm-Message-State: AFq9FYKdXoUoGYw7/VEb+79ctTlxw8W9pjn54s4rXlMsU8PoM4PYRl7j
	c5BEPxW/NApsra9KdG7VUswsnpv6QSUDehQCMq1hNJnyLYd0mb2SdPQuFe1H+6JWiiwcNep8VER
	iTR7YW4epAVu9w/tNG/I/9CTc1lmmerV02csdwcVBi0meJ9h6RwgcBcSXPDa4ohIzkd54
X-Gm-Gg: AYBFou2yagu0VlHa9CV42nGjkAzWLncHNLJaw8lGkSXwa7WN7p2de77dOUEjkAH8Q7S
	rdso2BGWh88e0GxKoc2RnbFgypKA4o2hSHznw2xnVv3gZuHb+fE7EXCWZWkXG/PVGuPFXN0o+TL
	aKFIkxPWdVubzYA8w0CQv0MnSlpBnPM/RsgsvS8HDnrqSoCLPTzrhTTaEvO1heMQgmpSM1QXqdH
	sD1XeuL27zQle9ClsIown45CI4X5OnzMdD6DgZM16vKjuMIbwyEKDrXO49DKB6cS0Xrwr2ojhb3
	dLE30c4x5xDVUVNQcsbrK3XLDQVM528C5lnK9VSkur3FLmaSFoPSL9JER51EOm5ioSuQTjvAEY3
	Pq8tPLrT3LZs/ZrQFq0ofXD3zk6nqK6EOd7+hNvqtCPUDO+zDSf1jeSzApX539PJHJI5Mc2SaQM
	G8T/7ZHGa+Y8Bkagn8HMGwkQ==
X-Received: by 2002:a17:90b:57cb:b0:3a8:c0cd:57f9 with SMTP id 98e67ed59e1d1-3ae89744ca2mr193126a91.25.1793309029920;
        Thu, 29 Oct 2026 14:23:49 -0700 (PDT)
X-Received: by 2002:a17:90b:57cb:b0:3a8:c0cd:57f9 with SMTP id 98e67ed59e1d1-3ae89744ca2mr193115a91.25.1793309029488;
        Thu, 29 Oct 2026 14:23:49 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845aa27esm1054544a91.11.2026.10.29.14.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:23:49 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: iommu@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] iommu/qcom: Use identity domain for GPU and display
Date: Thu, 29 Oct 2026 14:23:42 -0700
Message-ID: <20261029212344.346069-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029212344.346069-1-robin.clark@oss.qualcomm.com>
References: <20261029212344.346069-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=UejE26SN c=1 sm=1 tr=0 ts=6ae3b966 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=554yuftmPdPD4gaTNL8A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: qOuIy3XHaQzWEDmvncv2km9dKwclCe8j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA4NCBTYWx0ZWRfXwTbGE1QgRoKe
 n4BBB8YtH2jIaZ4jE3IOWiYX4d3r+mXPqD4jKrRFqRbjErxdnwNuG4yYw/adIRjPc6gUksljhAU
 Cf5y8L9mVTnnC74wU6aaHv8gnElkmK+zb0Po+kMSJUM6vZbdlRofg/wG8Ki5hYeo/aL4sck5yUM
 EuVICWT4tHg/AlK+GXoFn0bX9gKe7sIHp4J9zXBWeIoUS53POh38KlbJDecUns6Xx7b+pR7rUuV
 1kB0eu15LzgyN063IE74UxD9tNkowAC7zx8riQMCF+S2eNzyRVyGr5LgV2pKzZhKEuw/fWSp6Pp
 OXYh7fW2tM/uafPpfrbyat4eCRpbeEvGU8EU2R+awG+aKoYvUkk/tRyzikk56eHxYrbVSPcUUV7
 vudqedbhplaBq0hm4MEkZpoBdL6BF/jQ/OzfSfwKcKkWGlkZGvZ7ejb5lmqgHZ+veGn7fy9OFtj
 xs96Et/BePgv+EaATjw==
X-Proofpoint-ORIG-GUID: qOuIy3XHaQzWEDmvncv2km9dKwclCe8j
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA4NCBTYWx0ZWRfX+eHgbBnSS1wv
 sVyQ+8hxtEMmbCJbQJBsH9HiZyg4RH3bFoqoVefWAl4QBv5vjrHU/cDpoeU0I/kpWWCE23k+bI5
 mm8y1JSch9+uUFntp4LaKne24nPB0wQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290084

Similar to commit 0e764a01015d ("iommu/arm-smmu: Allow client devices to
select direct mapping") for arm-smmu-qcom, match GPU and display compat
strings to pick identity domain time.

The drm/msm driver attaches it's own domain, which it manages directly,
so we don't want an iommu managed domain interfering.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 21d18ce67b98..5b10feb419d8 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -22,6 +22,7 @@
 #include <linux/init.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
@@ -589,6 +590,22 @@ static int qcom_iommu_of_xlate(struct device *dev,
 	return iommu_fwspec_add_ids(dev, &asid, 1);
 }
 
+static const struct of_device_id qcom_iommu_client_of_match[] = {
+	{ .compatible = "qcom,adreno" },
+	{ .compatible = "qcom,mdp4" },
+	{ .compatible = "qcom,mdp5" },
+	{ .compatible = "qcom,mdss" },
+	{ }
+};
+
+static int qcom_iommu_def_domain_type(struct device *dev)
+{
+	const struct of_device_id *match =
+		of_match_device(qcom_iommu_client_of_match, dev);
+
+	return match ? IOMMU_DOMAIN_IDENTITY : 0;
+}
+
 static const struct iommu_ops qcom_iommu_ops = {
 	.identity_domain = &qcom_iommu_identity_domain,
 	.capable	= qcom_iommu_capable,
@@ -596,6 +613,7 @@ static const struct iommu_ops qcom_iommu_ops = {
 	.probe_device	= qcom_iommu_probe_device,
 	.device_group	= generic_device_group,
 	.of_xlate	= qcom_iommu_of_xlate,
+	.def_domain_type = qcom_iommu_def_domain_type,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= qcom_iommu_attach_dev,
 		.map_pages	= qcom_iommu_map,
-- 
2.56.0

