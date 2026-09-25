Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481214E50D8
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 15:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351936; cv=none; b=C5E7uTKG6JxMsZNuFZkrPm52gu91qcXf3uRVu3cS9EYnqz5ACbiwBwa/F5lkyclTuu3Gdm7farQMrNurhSllCXam9h2b/JpEQO3choXnlYo4NKZ+K8Th39Be8f85yXJY8+YsPUj/arULPKKJ/AF/YlR+DkW7ZiIXWVaz4brsMaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351936; c=relaxed/simple;
	bh=qesl20FztYwHUaqVY6JUi+5z94vsQZzkuaYhHZfbkm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QpJahiEjFI6krw3wcTpM06GRISvszGTI0rPzP2FN2vrP5MtZ58mKYSd2xi9CwYIVphu9f+oUWyhkPjN7wHcqE7Mp0YpaqF6aWTcOXR5hshXaWQWoy8hR9m5SW5XaxBWAHpPLc/HupcA+O3scUJd6V4EzuOhIW0FHMge1y5/pYF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oC07C3/h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TD0alMQj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oC07C3/h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TD0alMQj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PDvoYV756811
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 15:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Re9X7fDOvky
	ZZ3WP/+UOZyExDqbDkyq0JV0CPbSwk4Q=; b=oC07C3/hiKVobgyyQIg7t959R6f
	YHcd6DGucgx6/9UpFntG6CVahsQTYbX9NStEygY0rqWNqzM9lktgwqw6h7BiZ5WQ
	4E23Qs7gfOsO/Blg36FLPBkfrqHgb0O7qKomekwLlF23B+f/HBi/lF4wBzIKRKd3
	zkRdSw+dIv0NIChmVGxtD8pShQR4kpxErNLGo/Yzu3JQjCIivC+kORcWIuUlKeZj
	Zg7jSRwWX79atchpE8gm896O7EmQMftWdmNGVG2xRGo7OQQ9rG7xY86AE0fO1oKW
	JaoK4iObBAaPykeRkFwndawxq6BxjfqRfn/ZQRDWFzAdwgyl4WhFm65/j1Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq0a3mt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 15:58:52 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc72777faa2so624370a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 08:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351932; x=1790956732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Re9X7fDOvkyZZ3WP/+UOZyExDqbDkyq0JV0CPbSwk4Q=;
        b=TD0alMQjotioNfd6x+9NKd3f4EoCSa3scrLp4cEEPoXmqFr0pvSwlUvZOke9d1AKbV
         +1NNNCgH/bvv1Bu9mJX1DuatMR73VANfekW+N4xOO9KMJPPLGVYMM2UzVJ3gBW13u6DM
         0v5Q1Iyio8BRvY6bdNv4AVeaWILNta7O0jCx4ltYzgBmNLPtgAMVvAaV/p6XazTrjD3i
         nxp9TcbMJXOdUbf1AuqE3aU86EuLzg+VkpJe2WazO3XtkJqlKcxDOf2uhX+8/2jk1qQJ
         jqg8raL4cIs8hMsifn1crKfr53sRpg6iquhTA7QcJmXZa8/f4XxVrnKEFnYRPlU/eyl/
         z+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351932; x=1790956732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Re9X7fDOvkyZZ3WP/+UOZyExDqbDkyq0JV0CPbSwk4Q=;
        b=xSa8lpEMyKIYhhhNehGNnpdQgLX62u7xtzZHYlBibXiKs2wwnWd/NcG9lqkLBeU5h+
         1TxtxwnG1G3G7M5sYApnuaJla1g9e1ZvWTME5al6CWzhAiR1gz5xJz72GZPDMJsNs9cB
         rqPukmf3L2LnbSboO4wouERpW9GeZzOx2I8n8CiW1qSgTnaNOeCQkFlR4fAHJGOapULN
         zmrCIFjbcQlFSYAeKvuM4WDsK8D/kasL/Ef9De8OIdxRHHB26gHEzMUL8PHNMS3/tbwb
         seFKn59ymweycTvaRZOmiQBAm4IrrjnogQzBRrDhpvuJglSQQJTTJZVQozAYRJPMXMPN
         n2JQ==
X-Forwarded-Encrypted: i=1; AKwUvByb61G3FANivJWAVClt35WvSDav3HoD/ECHpuPQNFL5iAEjFbg6o4T78qPkcPn6v2BCzRPWBlT9ryfJP40B@vger.kernel.org
X-Gm-Message-State: AFuF++mZBu+Aj3s7FGfa4IVrn/ND4ENii561gNkkCVtjX7yXnSqguH6F
	2nR9vM8FvcWvSlerNcNVDOP8CRx5kVEqprF2L93oqaHfMWvWpCGgWWA8NIF15tdMaek3M5XgWVy
	yCqtX4zKZGspJnuglhJ8rdd/UPSALg8cO+PWt3b3KzlyMVrXm4bvMnTF/UA/+5Lr0LlT+
X-Gm-Gg: AYBFou1r/HObvGd3iHfi8/cWjqPhFrQww6RQvjI4juUfjmVYiC4noq1RR7PtiUx6bG0
	HGwJ6KZ96ThRhyZH9hRC2vkvocl5jDvGpwWMDWX7EByOA67joxYMT0i6K24E7sBXVnWBu/89aEC
	Gxn1AHeFM13nHxwJ8sG2XnLZAh2M1vKQtymVIk9ykEkqMje87gSWxixhgxF0VlN6mvBoCaJKCDr
	ep+vCldS2ZefWWZoV+2Zvk59LWydWYqnubqSwcLftgJz17xqZfSr/zEuXzGRX3BO6hKdtnykXAR
	jMbmGXC5+7wIpgUSzgSrwnvbyLH/tTisMKtAZwG+eKI9dIIPDrNzAPOSgY08dE+MXLl8a0v/79s
	7aTRdqSZoD6F3X/PncXAPE0T4RdM=
X-Received: by 2002:a05:6a00:ab86:b0:874:708d:b633 with SMTP id d2e1a72fcca58-87e9d8da7a5mr5033691b3a.31.1790351931480;
        Fri, 25 Sep 2026 08:58:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:ab86:b0:874:708d:b633 with SMTP id d2e1a72fcca58-87e9d8da7a5mr5033680b3a.31.1790351930939;
        Fri, 25 Sep 2026 08:58:50 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87ff354d854sm1361299b3a.2.2026.09.25.08.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:58:50 -0700 (PDT)
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
Subject: [PATCH 5/8] net: ipa: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Fri, 25 Sep 2026 21:27:34 +0530
Message-ID: <20260925155737.4161358-6-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX2vs/MXqnY0Ss
 i2+b7Z05Nake9PP2gwNMPSdqkRtf/+CiVRsSWG1DIQavw3Jne0jFTg3AL5UUZEHHHm330ppal3g
 Qi3LAF7Z1tkTy6xd5F98F9uctRCQZpU=
X-Proofpoint-GUID: IukSEsM8ynT7CTnXomrG52AkCw3bdiyR
X-Proofpoint-ORIG-GUID: IukSEsM8ynT7CTnXomrG52AkCw3bdiyR
X-Authority-Analysis: v=2.4 cv=LNPz05W9 c=1 sm=1 tr=0 ts=6ab69a3c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=P8P2WCEqvqb6tQ3B-mUA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX+IyNS4nL8CtY
 4QRPVFfBrwu3vryl8KuzUZOQO41NzINII7RgTdCQ8OnkMjeth8WIdRDmkjA/uVvpG0G1lDZtOXL
 rCaBjYiAVqU5S19lgNJiiuM+qryuzgmt3gCOMxcP3yq4lJStpPba4sENd6201/anntPASP6TCuW
 URB244wc9dfndu/jVozE/ZG+lnDP6xbb+ungI1HfpKfaDBraBK4J8HkhLj9/VD/sRh1KCb8ew65
 gdFy10vJHpCQUkxu3bNFEb0y5zwyRDSh1ti50cI/6VzcHxJwu/9239AP4cU9SjsYkm4f9A5yEM9
 gUdBLXJVh70w/KrFFQEnZwvEUnUSXUnxeCBMVKlh+R5eD392C0ctoHCf3SrSeYQd0K5Y9B61qxG
 5OIhS6EvubGqeISO0STQNSiz9BY7TopmlavB8lNBoJRGg1/AzloWdj7N+cuRWi9Y7Y5nTdfhkVE
 /nevJxv+vSE/ovLilLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250063

ipa_firmware_load() calls qcom_mdt_load() which bundles metadata init,
memory setup, and segment loading with no PAS context, then calls
qcom_pas_auth_and_reset() which skips the shmbridge prepare step required
before TrustZone authentication.

Replace the open-coded memremap()/qcom_mdt_load()/memunmap() sequence
with devm_qcom_pas_context_alloc() and qcom_mdt_pas_load(), then pass
the same context to qcom_pas_prepare_and_auth_reset().

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/net/ipa/ipa_main.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 14ac2d2faf7c..6964395caedd 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -585,12 +585,11 @@ static void ipa_deconfig(struct ipa *ipa)
 
 static int ipa_firmware_load(struct device *dev)
 {
+	struct qcom_pas_context *ctx;
 	const struct firmware *fw;
 	struct resource res;
 	phys_addr_t phys;
 	const char *path;
-	ssize_t size;
-	void *virt;
 	int ret;
 
 	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
@@ -615,24 +614,23 @@ static int ipa_firmware_load(struct device *dev)
 	}
 
 	phys = res.start;
-	size = (size_t)resource_size(&res);
-	virt = memremap(phys, size, MEMREMAP_WC);
-	if (!virt) {
-		dev_err(dev, "unable to remap firmware memory\n");
-		ret = -ENOMEM;
+	ctx = devm_qcom_pas_context_alloc(dev, IPA_PAS_ID, phys,
+					  resource_size(&res));
+	if (IS_ERR(ctx)) {
+		ret = PTR_ERR(ctx);
 		goto out_release_firmware;
 	}
 
-	ret = qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL);
+	ret = qcom_mdt_pas_load(ctx, fw, path, NULL);
 	if (ret) {
 		dev_err(dev, "error %d loading \"%s\"\n", ret, path);
-	} else {
-		ret = qcom_pas_auth_and_reset(IPA_PAS_ID);
-		if (ret)
-			dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
+		goto out_release_firmware;
 	}
 
-	memunmap(virt);
+	ret = qcom_pas_prepare_and_auth_reset(ctx);
+	if (ret)
+		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
+
 out_release_firmware:
 	release_firmware(fw);
 
-- 
2.55.0

