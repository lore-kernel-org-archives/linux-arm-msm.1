Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CD031197C
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 01:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788399810; cv=none; b=ZciWFVv2Q3LpdiwKVzX9wOPdBOT7MlxblYtqC6E0Bdn4lYFPiFlfctlWIqtP+/4DAOXc2RP+kMs8h+qZs+xxS3L+sjA9bogQzSUlxHpTh4i2DXQAWF1AlG70TrkzIkxCg3HH1iZeIRGnjYpdRvxt030+QRcXCqYM8T8erFWStt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788399810; c=relaxed/simple;
	bh=x4AZkfcgz2Xf7QYqBUp7bWkKioVzjFcAHvO+ZrHvKhs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p0Y9q/k2ZlT1JXPbM1RtgCWjo7hJBT+okSjFF1UQ9wrRjJA+cwDQ2pj+jMNGqXpE0IL2SLVV/y16JQXzOrYgPRC7Uv/QWwmG9hlXczQBXd+l2YtSQDdUIuxTHwzo9GeQ4Y0pCdrQc7YckIN8oxVu7aMgz3+c6ZyUP/bgbTf8N7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KqPI6Tro; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ADPjMkeo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KqPI6Tro";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ADPjMkeo"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682NHf1h2968523
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 01:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pKQxXfHaTjtBlwyrLcQ0E/AskG8G1ulDlz8
	cQFHUtf4=; b=KqPI6TrorsZ8LsykslDOsgC5nJf9v4xNfskRf+4HlJzkaeF8ElQ
	qWWWN7Nr9xJI05E0fulPCsea0OZuCqAXe8lgB6neSCPW3Jzt41C2JOvz1QV/13do
	fkLJtS5LxqnRcpbhhzmt+f7kAJfRA6Dl8RsxOZqtnhJhcXzEHxU8mufbzL5+D2WE
	Slf5OX06ZQzhfzsSkfX2O4QE15/r8j1htGsBqbTCZ6FKho2jLZclXPhlNE3UiZjq
	DYM5tOeV/3jI+VemA8XFgRiPs3Js2HB6GMbOkF5xR6XPO0F75h+ORCj8tTvyiNBR
	GIrlaC8h6hMsJRbJHLtLUg97dx0nQbVLyZA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gej2cbq1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 01:43:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso2653926a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 18:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788399808; x=1789004608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pKQxXfHaTjtBlwyrLcQ0E/AskG8G1ulDlz8cQFHUtf4=;
        b=ADPjMkeoST6t6w9fz/mIl9S+PIOfqCIi3Mfu8xljd0OYcpIpPcJoLGBMpvu44HNjP3
         r2iv/kx7YnkG9t0heLo69rWsLxcBG9qrZe0IwOHt6tPau9lDL8ObEWM8JIoRiU8RKr+d
         OjED87Cnw3Ik4gFYElNx07tvxQW7kLGRQ3uASgpfs1+OEhIItpAeulGkxnDI2BUInrXy
         JqE+ROT6V37K8uaOJ+Jt9a5FZM4k9tRYdJQ0p+vnxWk5QfwsJA8v+GJEfTgny2BK2rIm
         IhHzDfGEEauTcTBOz6CnOXepzlCqOkqIYejZbgGG0G7R8wqeoKQTbAaVn5Cgxbz/GpWu
         6ndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788399808; x=1789004608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pKQxXfHaTjtBlwyrLcQ0E/AskG8G1ulDlz8cQFHUtf4=;
        b=DdroLT/T+xrhrft7HH6ayFQL9Zq/FGwkYZRsuUOCrULNILS6KhbEzNSvwTacXwja4/
         9/bBWgeALxOUZh/YDVC1gfkJUxR8S6M4Up31gTE6uB3OFIrFV/vOH2RmdyFiMlKQwmNF
         8ZxlUhI6GZa9GrXfS+S7hn7QYksS/V85bR1zat1OQzmta7qhEewT0+juXFlrbtI+WW71
         JrUOJ/YhfWY6vhtqvX6baJD4u6C0gFOJqR8qPWeXiLVGFOdNH895q7dLW2KfBD5khZNA
         WHtTm+oZhCWMnm+G41ELEx/n4AdCvEK1oIklporaoPg6MLBWkzX6vOjWHC5AI+57Tbzu
         GEEQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8ZY7BcqdCK/uaQ6afv9aUj1B4ftKF4w+lnG+IFS+iTVGMGwzDJvJDx9LeCIU9BVTIwLH3CLAGscz2pnQu@vger.kernel.org
X-Gm-Message-State: AFuF++l61dOVerU1oo3Nqo12wiGW+Ddr7dKUMZ58cXEf8ZO7bihdzVrX
	KCR3bY+YP24Lrv5PBcgaKpQoS4mbjYR35ifNaYrUlcu/TTwGAHXiaXZeMNEJN6oDKs1GXXtxCUY
	15rTqnO41GkKmS6ymeNl6vsxL7S8A85cgSksfu+R91VMLpR7djE0S6r/KXZ9NMWA7uAk2
X-Gm-Gg: AYBFou0Q5o84ycNYCH76T9Bmc1iqeCcWdqNd/JyZYV9odrg7R2OFh5dCWFA1ZEmx5s9
	uSzbW5nco2tN8xdcaeLwXebV8RYP6ZhhezgNhZT0/5vZHhnQZsyYS/ZcrfdqvZIXXxAGGppaVPA
	/W/QXPpQRtaQEdHc1SdSioig0rTIWyDZpqo/G3cmPHTM8tugzjQPIkfKw82J3SoXn1O6HG/eACm
	Q9e0JOMSMzmxh0VYdXps/T2TzBwP+bBO/o6Xt1oT1Cf4I4Kb3WwqA0jTDgfmdND3I3ZUg82LVyG
	nNUDvH1/wisSELya6OQhwdNL/HnarZDbxfoy7uXXZ8u434SrlKpRYJZ9nlXbaOqYCFmzUkTEEa/
	feoBdAi3IM2GmrBI3vuCiZuciDGQUpfLiobBhsRcqzsv881bwFoUeuoMuyUW8
X-Received: by 2002:a17:90b:4fcb:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-39aedf22274mr14684283a91.7.1788399807729;
        Wed, 02 Sep 2026 18:43:27 -0700 (PDT)
X-Received: by 2002:a17:90b:4fcb:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-39aedf22274mr14684212a91.7.1788399807237;
        Wed, 02 Sep 2026 18:43:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325534cd65sm1996676eec.6.2026.09.02.18.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 18:43:26 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gourav Kumar <gouravk@qti.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] soc: qcom: ubwcg: Add Nord UBWC config
Date: Thu,  3 Sep 2026 09:43:09 +0800
Message-ID: <20260903014309.314962-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDAxMiBTYWx0ZWRfX3QavvH3neEXJ
 UQP5RF24cOXTEcmG1/KhWFLg+C1kpD0wd7YWk5TfbeiLMFe44NpIB6xPCF2n7XGBNfEy0utUdzo
 r083TaVoP32fQL8o2CyXsPI0lxEV3JU=
X-Authority-Analysis: v=2.4 cv=G+ss1dk5 c=1 sm=1 tr=0 ts=6a98d0c0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Dq5x3lUwAqFYTanBhrcA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: tT87w5iTuV2pzDACA9rUwxhA6S24vIiN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDAxMiBTYWx0ZWRfX6E3HGlegoMpj
 SUO1cioi5Js+5eCJ2kmQ56O1rBni0HNIL9+DtaDdEV5ZOPqPhmgqCGc+0KyWfiT52hiD+dY+MNO
 2tPayRG9SjQkmMDqp4NrHPc8kvtIKkXSUdEZbndfFH7QF/TsmQ5oL4vly55Lo5j3oF7JLccF9E3
 A5B5psncrfkFHRF9bwF/RVH8JJZYEzJwkainrZ4Chr1A2Y6BCxsBHjgRB6EGCkCBMfBpHdJdR3G
 ssFsDhvd+Yfk6O43tNu5EXGaYrSYBWbaoTARupjMY9dDhy3r/+HghxZCjygZFHdw/kXlcDfjdPQ
 028ZLtLscjjjaUjMgzWGKGuBOOldZLGJM8Mrxq+J/5SNgMRd6FIhppMXNfghxCacGRLTbQg/Sqw
 S9wwodj6PbxEj6Vt29ctZsx0gpytWbeGkZj/xPiWBlFuHCzh4G7NSusYHzRs13x0snQ75i1D+oQ
 0TRltzJY+vznJC4M7ww==
X-Proofpoint-ORIG-GUID: tT87w5iTuV2pzDACA9rUwxhA6S24vIiN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_06,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030012

From: Gourav Kumar <gouravk@qti.qualcomm.com>

Map qcom,nord to glymur_data in qcom_ubwc_configs[], since Nord shares
Glymur's UBWC capabilities.

Signed-off-by: Gourav Kumar <gouravk@qti.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 23901a4c51f7..0090ce2d4a7f 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -127,6 +127,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,msm8976", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8996", .data = &ubwc_1_0_hbb15 },
 	{ .compatible = "qcom,msm8998", .data = &ubwc_1_0_hbb15 },
+	{ .compatible = "qcom,nord", .data = &glymur_data },
 	{ .compatible = "qcom,qcm2290", .data = &ubwc_0_0_hbb15, },
 	{ .compatible = "qcom,qcm6490", .data = &ubwc_3_1_hbb14, },
 	{ .compatible = "qcom,qcs8300", .data = &ubwc_4_0_hbb16, },
-- 
2.43.0

