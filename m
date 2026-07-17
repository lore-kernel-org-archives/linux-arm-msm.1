Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F1E3FB7DE
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784298029; cv=none; b=Pe2TNmddapyRvYBOeWA4/eu2+O1lgXjVWvNQfC3h19VpTWBb0DgLJa1I2KOO17tFL4T2yCRy3V2rsG31MAikyKRD1NI5Jh918ibB11A6BYzYVXNytfqFDAnKww5OshjD4V5/XchN5DLaYJghOwVZyXriaupOzrcgj1Dgql+mEZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784298029; c=relaxed/simple;
	bh=7LLEImUmKPo7SrHc26UeJn3JRceGlHaMvwT2HiiujVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JX6YC9GJQcd/HM+11VWKH0zmMX7rfAV+hHwOp18ak91fUyLu1qu4RAirNDMXs9sZmOrJBPYURZdewoHDY1IZMcAFuzGnVlo25Vvf5PmKxC/0KdTCwXoFu5Vd/xAPHufXZDW94PZ0h2NaDBXGO2T0vG64A7qdnKYJWsQuPkPabNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LQqz+zEN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h9M651Wf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LQqz+zEN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h9M651Wf"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE8Ed61676855
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c04Q9myq+d/MYa7ft3VRmwYFh54ZKESQ0C1fHms6BKU=; b=LQqz+zEN9Mu0LN6M
	j+oZ4ymN9I145FJgcg3C9bf44RcQLM1wJuVVvQIVxEAeZqbp5HhUHxgUa4BreMf1
	8KaJ06eHycqFNNy/XuHWidbcRAmFGOgnSVcnzk8qpIsydreaw2cpjiX5yEAqmXNJ
	1/lRbBGfxx6EawlYsT+YD2NTb6ZhEzFNH+fG2UsUPJglsb0n1pAaCMrVH2T7m07i
	MVJHYPOsxuQm5KXVRnI1ODym7vR+myB1WYOiQvNLQ/Cb/p/JkTxOt6pOw+1vaqmX
	Ig2Jff5QYZ0Iux5E6ZTBPTusTJZTPmQ8nssbf/PqnNBJsvsRj7n68qlgFDNzx8+2
	I+yyeQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffj78rwmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:20:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ec3146553so174819685a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784298026; x=1784902826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c04Q9myq+d/MYa7ft3VRmwYFh54ZKESQ0C1fHms6BKU=;
        b=h9M651WfVk5wY51ZeNeQFzcQ0JU9D/hZaq4VSD8L8Tu+Yh5YDv1FJMCF/dy3GCaKG7
         Ji0gqYPZfD96VE/N0V9eHzdMbleF/KQ+gU5Io0+5NTmvY9WsylJ6GRX0HzU+qb4ehvlp
         B4HceXVm9RLrfJOv88EwTPC1qeEOX/UEqE9LobLKB4UQZYejZAgcyqOK4lGiDZfS9wGG
         Kx4TQFbdFEi8t2BgoKQ/mBh+uH1F9dwYJctsC54U+pQ2WM+aPZrJXGE1TkpAM5GS/v+F
         qtmKVolx9Y/utpzhpEWXrujIgaA0EWCfO64bC7n+XMcNseORl6DXPvWcTYsqwe/5txsx
         0asg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784298026; x=1784902826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c04Q9myq+d/MYa7ft3VRmwYFh54ZKESQ0C1fHms6BKU=;
        b=o2s9xR7EAlYl9MkbWsWj4hcV8CwUTnzMi+kDK/BXK7n1dAigR/YKB+2iugyBQYiVTi
         xbfG1e1JVxIdOcR6wrEdBFWoV2J2G7YEU2bByXD/rO1Jl/wd9imUeLCP4cUnBdXFSZ0U
         /nCwZxrCKaXvUgVxxKvJOpoF9+P3krdNnZKPGX17Lsow/MHKMh97oqOoFBmocuE/gkyi
         LDw0VZB4Z5atx/PACTsFV/0Po9rOsXW79yxAUZYsXmdvrZ2hZRUZKAE9capC8V/p3xQv
         UD7rd0HDmcW4LLF9oqdgg1l8i8e3C5XQYLAgfyaQLJJynBjUKJckJanRYcvV8CJj8UWj
         WpOg==
X-Forwarded-Encrypted: i=1; AHgh+RqZ9MHzlpVPyWKRSs5FyCK6kNrIkkq6tkjrPqoaQzbQhWTKNOdVuRpP5HVTo+oT2OYReWcI8+WjKc/eELXw@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa671JwHznWvFEl/fX/dOSgJxMpE5g3/AEwYGfR1KpTBbxYgNQ
	pMTLh3gm73oiq79mZDmGeq5I3Lkxfddf9tIl7mPMPKUbDa68vEVlbSxDQWVBRze6a5d/SIXUste
	36o23sPROpd6ZBtQPTspOj0fpKs+MgXzwycgrkI3YLQ8NY4jhvym/nwtGv2LaEXnFGuXumHRZao
	CuEYc=
X-Gm-Gg: AfdE7cn5xX4x9AdeoFgR16E3JvoJzsmg++f5YbcgXXPBJJkyxaxDeeJyyGgukVmM5XO
	g8kXZZWS/nuXpcm607unq9eokDv3ktJN8eOAOOxUV3QW5i9Xyi/wZYbSJOjW5cwdFwr/Pui0DIU
	eHwgMG+9xZbOUGjIr9/tdgg4XzzxmmoBQH4DmdNRAeM2RYkvblupqV+JbzybDYCXxuPjvZphsTe
	8p8kezgWkRjEZHo4ydkoWz+hsYXRtpg6nhFQCuoxOMW0S1zSunVpTEEvJleIdbS9CVoBJIEYD9G
	Gz+6wx3wVMS/DpyF8j42GYgfJQxTTKVRWqoK4yTxJ+o+5FKneMjYH38sGWU3wzq5JoHXL1b/Qib
	RvEPsnh6qy3f7Wo/M2ZOCNU+aHumeZGaJ4Xaw71xpg0hCPZ/DfbtspVp/ps04TrF7JLoqCVORDO
	uFupVUXYjcoB4DmJ4Xbc8r97FywAPZoCgGbmmhVw2eIcx6/xb9LFQ=
X-Received: by 2002:ac8:5e46:0:b0:51c:217f:518 with SMTP id d75a77b69052e-5213a38435amr27878381cf.6.1784298025807;
        Fri, 17 Jul 2026 07:20:25 -0700 (PDT)
X-Received: by 2002:ac8:5e46:0:b0:51c:217f:518 with SMTP id d75a77b69052e-5213a38435amr27877851cf.6.1784298025251;
        Fri, 17 Jul 2026 07:20:25 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1740bf91bdsm79085966b.63.2026.07.17.07.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:20:24 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 16:20:20 +0200
Subject: [PATCH 1/4] media: qcom: camss: Add PM clock support and integrate
 with runtime PM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-camss-version-v1-1-7ed71fea95e8@oss.qualcomm.com>
References: <20260717-camss-version-v1-0-7ed71fea95e8@oss.qualcomm.com>
In-Reply-To: <20260717-camss-version-v1-0-7ed71fea95e8@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE0NiBTYWx0ZWRfXyfzt5XJfoSuQ
 PUpz2Pqyibv8XWctUTZbjIReH+FQbH5kHBkG6Jaxl4zwm0k9AXMBI1RBdZenUc4XMdGozhvqu2P
 euJPBa+9uRJjEW40QY5hekhuon81mIVL/IL+62aeZfFsYYEYtlkndWSqCEZMuJM52qfxKGsiGdB
 ughQg3y0nmorcPFwBt5HaoNd2Pps8sgnoggFOQVdzXDpIP4B3slffNkBR5So1+uPy6ikVvS/gAg
 NSrYFbiGXJXGEJV+DNqoo7gVO0w/IsO24/NGJvGeuqq9FagSfhaRxb96NIoOwIoZmcIDtcVhCid
 qQZK8irqOnIhDjBCYD8DK++fCiSnjfeTLV0fhNjHdTvkjb+W8dfy9NwJL8OeSRehb/xmfqws4SA
 7hp+ILAQrS8x1ljau/I6p+TL9SVpM3Hh21icqwbYx0eF9Z8IIOfDJos50FBCJJPag7zu/nuxKIh
 pvVBcmSBCzUnY6yzS/Q==
X-Proofpoint-ORIG-GUID: vSMB3DZKCw9cXX3PajZ1mfAzJZX5Iu8b
X-Authority-Analysis: v=2.4 cv=U9Ciy+ru c=1 sm=1 tr=0 ts=6a5a3a2a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=BAJ2-saCjKdBVCgQpPYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: vSMB3DZKCw9cXX3PajZ1mfAzJZX5Iu8b
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE0NiBTYWx0ZWRfX13fQugOa60NN
 Skyp59sW7X7Z+jlthTdw79gfpRD6NfAifXK+kLiCCNazu7WoIciOm461a7fLOLfrvrqzo2zQ2SA
 oaXbFNwxzeRTLv7wyYBtmucps50yWkw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170146

Add optional PM clock support to the CAMSS driver using the PM clock
framework. This allows CAMSS clocks to be registered once and
automatically managed during runtime suspend and resume.

This is especially useful for global CAMSS clocks that are shared across
multiple CAMSS subblocks.

This avoids the need for each subblock to reference and manage the
shared clocks individually. A typical example is the set of clocks in
the top_group, which may be used by CSID, PHY, CCI, and other CAMSS
blocks.

Introduce a small PM clock descriptor table in the CAMSS resources
structure to describe clocks and their optional rates. Initialize
these clocks at probe time and delegate clock ownership to the PM
core.

Hook PM clock handling into the runtime PM callbacks to ensure clocks
are properly suspended and resumed alongside power domains and ICC
paths.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 40 ++++++++++++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d7eafe669efd6b033e22d8eb5cf79..6a2bf3373e8755805c8cd0f8fe5037b788d68fa2 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -18,6 +18,7 @@
 #include <linux/of_graph.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
+#include <linux/pm_clock.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
 
@@ -5346,6 +5347,35 @@ static void camss_genpd_cleanup(struct camss *camss)
 	dev_pm_domain_detach(camss->genpd, true);
 }
 
+/*
+ * camss_init_pm_clks - register shared CAMSS clocks with the PM clock framework
+ *
+ * Clocks listed in res->pm_clks are shared across all CAMSS sub-devices (e.g.
+ * top_ahb, axi). They are managed automatically by the PM framework.
+ */
+static int camss_init_pm_clks(struct camss *camss)
+{
+	struct device *dev = camss->dev;
+	unsigned int i;
+	int ret;
+
+	if (!camss->res->pm_clks[0])
+		return 0;
+
+	ret = devm_pm_clk_create(dev);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < CAMSS_RES_MAX && camss->res->pm_clks[i]; i++) {
+		ret = pm_clk_add(dev, camss->res->pm_clks[i]);
+		if (ret)
+			dev_warn(dev, "failed to add pm_clk %s: %d\n",
+				 camss->res->pm_clks[i], ret);
+	}
+
+	return 0;
+}
+
 /*
  * camss_probe - Probe CAMSS platform device
  * @pdev: Pointer to CAMSS platform device
@@ -5434,6 +5464,10 @@ static int camss_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
+	ret = camss_init_pm_clks(camss);
+	if (ret)
+		goto err_v4l2_device_unregister;
+
 	ret = camss_parse_ports(camss);
 	if (ret < 0)
 		goto err_v4l2_device_unregister;
@@ -5775,7 +5809,7 @@ static int __maybe_unused camss_runtime_suspend(struct device *dev)
 			return ret;
 	}
 
-	return 0;
+	return pm_clk_suspend(dev);
 }
 
 static int __maybe_unused camss_runtime_resume(struct device *dev)
@@ -5785,6 +5819,10 @@ static int __maybe_unused camss_runtime_resume(struct device *dev)
 	int i;
 	int ret;
 
+	ret = pm_clk_resume(dev);
+	if (ret)
+		return ret;
+
 	for (i = 0; i < camss->res->icc_path_num; i++) {
 		ret = icc_set_bw(camss->icc_path[i],
 				 icc_res[i].icc_bw_tbl.avg,
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 93d691c8ac63b2a47dbb234856b627d8911a1851..fe5fe25d5f18d8a3ce35b48077a975f1453c341f 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -107,6 +107,7 @@ enum icc_count {
 struct camss_resources {
 	enum camss_version version;
 	const char *pd_name;
+	const char *pm_clks[CAMSS_RES_MAX];
 	const struct camss_subdev_resources *csiphy_res;
 	const struct camss_subdev_resources *tpg_res;
 	const struct camss_subdev_resources *csid_res;

-- 
2.34.1

