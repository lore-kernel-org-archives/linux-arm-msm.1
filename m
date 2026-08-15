Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CB53B813C
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 13:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786800360; cv=none; b=XWoyK/yuRnJe2Ip8cJmTVW5UCHCbbkHdSv5+P7XORwnvF4egTic9lfun4IX1XuWyXiAlKqHahliyVi7tTSuwUGskOmE3gcNealLVLlIeFvIOZi+10CwDfUWP2JuaBhDneS7MncTa353FJKofIzoyPywuvWeq6DA6OPY2iE+8apg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786800360; c=relaxed/simple;
	bh=3GznvKQYOhzSKPXdcqHPxtsLzm97LoEPV6uvmbuw/Sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p5UG7Lu9b6yVpl2UJcNRIodj7aXwq/f2ENoyW066Oi8IXFQODQ9KEetTFhiy0EdjXvgv734ejEkZyHd1TrgSchgQ8Aul5kL2qPB2ZUDOredr4Ge12orpX0iyBX4U5W9kUn05rzIrTxgtinVMiUfKRjjZvjgPK2t+JRDAK7JplWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oCYVLGvU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hFYdtmr/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oCYVLGvU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hFYdtmr/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67FDN4dE1170171
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 13:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jUpVNSst2CU
	IlrfPT6QW+pK70blfmc9k+1OenQhK2Bc=; b=oCYVLGvUdy6xqJRGZVEulv3wAiQ
	khnG5hCIaocCDtMPe+xVfCu0S0RdOCOhU3aFs7+9g7dhsGrp+hx8NJaYEScfSooA
	/rndfiPYjLZHG19NdStQ+sHg+ZL+G70BCcjk9fYa5hWd7GSJnFSKN1td39a0GvUA
	5a1Via9FNsqE3s30gzx2yb67pV3xIsbV3ou9ptfkwJVOiH4OagonhnDpQyE82vde
	5Q0jcH7HONfb+bsoVkGz47aUihgkHupOIW0rqtVwQzsUqucUS1CHKUZAu7SUuVjg
	6b5cz+llabhwQniwjhqQ1a2UpmXsT9bqSSUCjix74WMMvL+Eo37+iMJzVUw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghwh10w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 13:25:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbee8d434b8so1347671a12.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 06:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786800358; x=1787405158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUpVNSst2CUIlrfPT6QW+pK70blfmc9k+1OenQhK2Bc=;
        b=hFYdtmr/0Qt7qt1IRSeVwrRZM9cuvRY9sMURCR3iuBistyMImDzbps1S1l8sdx4gDs
         kqDCS7NFDOgMQsSspcnsdEmiJwTwe6b/v4Ur07wTa4Ddezn8D0vGBz+9hIqFJ0iYL24H
         3umoioXMcncbrI604PpVABFBoU2VCbBOxu5EHv27guG0piIMCjhsgBjS9JwT9SKsHXa0
         IDhrSPdZ8CDMG2HlHjNsFc13J4uC4SYaLAUHLChQdwAUYtqlhECe4SHrsW9xSEcfm+gd
         6vx4mATyCgpMzcwFVMEwAqKbwhgJbn+lqX2+AgCt29UDVzur3HE3Meb3gQyaQLENS+eY
         SIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786800358; x=1787405158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jUpVNSst2CUIlrfPT6QW+pK70blfmc9k+1OenQhK2Bc=;
        b=aHO2oMIItXwLRAv/yvXxyQDdqlOxv2umkfdYmXf0bVJrirh5+W2I6CtbphAUcj573N
         gHp+YeIpm63FAJzOJEOV9Se+sF65d1RM2AcnIUwm4RzxCIFT3B9oXSQUIrIp9oBbYZqj
         X2qgC61bme7pi5icd5/eYDplhySSQCQ4R8dADEyCLTZnnkjLOyKvtbTaO5qpH2/IIW2c
         hpdjQuT0tTDuQ6Qsf7PQtYC4VQjLjUBZgIszCcFFWv2coYySbm4whSTo9EFeEeXD9B10
         trl24ahrLC+onvT27XdAXhWDmreaOENCjbgqfOBd7/ml/tHbGp6rpa6peZknL7GhdqCs
         36Iw==
X-Forwarded-Encrypted: i=1; AHgh+RrBeAzxQlFbrJibQSuu7sWC4PO9z+IiDJosH3chwF8OY1gouvAb5iTnG0qdLGf3w8yZ7IXk+yJHUMGHgjj3@vger.kernel.org
X-Gm-Message-State: AOJu0YyAVx2BKMChcUhDYJKGlpfKIw3zU4dnfEXIOKdaVo+PXhsWWqOz
	aj/axiMiBSiHs74KrrQwBfQnhhV205u1/+nXJQ75XlYdRA9c9FmUfIITpsTAqwcWGzGDsJZWDd/
	atFGfdixeCskmNTlTc1t1lBKAd9z3S9OlC3qWFEGJoKIoNU92XSSCAuW8cmAhJG0et16i
X-Gm-Gg: AR+sD11CqEyjpL9rJYO5q6fx5RPG5sp6UevUWoBXFwo+1toOE/rpp5OrwgQ4a1LZTcQ
	wVla1yhXSTpWvTD3BSEhlO3uB5SyaQmy87EBLTgZy/oAdCBODtTVns3Aw9r2oS+MWccaeyy6Xbd
	ItOjzwVX8ebxzrkbV3DF5huVQ312Z89aAVtqALqX9I5L8M89CyaozfzfdY+VbXAHMwhWPcXcsni
	vHf9whkpwFdVqPOPme4jRfLFN/BG6YKJRnRNLJj9PY/t+oHg3AAovDVkBRypwHMh1hKzHNpt4gx
	e6z2I+Rvo5u6/We4rrhRCOjC7D5VgFH74Kx+t8p5rzUrKR6SC8BT3YS+rEmcFBE8vrxg6nXdOjI
	yDSi8MsvbwfrdeGhxDHn8Nw3wDxTaQ0lqGUsXeVaFJ25YtIreRY91cd0kmZVr
X-Received: by 2002:a17:90b:288f:b0:380:86d8:8162 with SMTP id 98e67ed59e1d1-3931f5f5fffmr17005634a91.18.1786800358296;
        Sat, 15 Aug 2026 06:25:58 -0700 (PDT)
X-Received: by 2002:a17:90b:288f:b0:380:86d8:8162 with SMTP id 98e67ed59e1d1-3931f5f5fffmr17005593a91.18.1786800357774;
        Sat, 15 Aug 2026 06:25:57 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141386a039asm19313374c88.0.2026.08.15.06.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 06:25:57 -0700 (PDT)
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
Subject: [PATCH 2/8] remoteproc: Add cluster field to struct rproc
Date: Sat, 15 Aug 2026 21:25:35 +0800
Message-ID: <20260815132541.1575121-3-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: xd-sqwwbIx0xjXnvhMVS3O8Oqpeo-TfP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfX5MG/MaH4+bye
 fH+u0hGPn2gZ8pqOKqFZE9gvvytSPH0Spk9BM216uHdA0jaCVe01taBRXmXr84SwIXHOGfTRNsW
 IxWZ4l37NAOzg9msuM4lzNkLCO9gxwu9gllmUimYxKLKDICIBK8Oynmn6Tr1SGROjThjyzmF53+
 SZW5R3cKYte62byYQELeo+O+f15W8iNAbpa5Njj9Vim+tauwK2DHPmlQQ1HM4iKZ6keC7I7rdnQ
 7KOE//UdrvCtQcu0IrZvrMvFRcwbak/NHBvdlcVxA+GR7a0JSUedCbLWTGpdn/q1RP1dCIVvWLz
 efoNO9Vd8P3cP/hHg1tfT4rZDWHtIQm3CnVXh4WzQxzv2JmVagM3oO2IwSPF5XoV30mcnEVItnK
 26wBZwiid7ukmtIUSPMN82B8iJIxbPZyNDPuTYc9Y5cAltuntjveaCNNhGZ0WJz9/l3M5qBmMQZ
 /ALZZNtMHnoDvtlvAMQ==
X-Proofpoint-GUID: xd-sqwwbIx0xjXnvhMVS3O8Oqpeo-TfP
X-Authority-Analysis: v=2.4 cv=DdknbPtW c=1 sm=1 tr=0 ts=6a8068e7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=wfuvY1oYJVSYwsIiQWQA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfX+13H9+he7ogQ
 4ODzgYN/QBlbAiph0OyQPBPR4iZmdb4wYqAixAQrDCsFRDEhji7DfZdgfDVSOcSXY33RtU94wya
 rNg1Ea+9KTlupdLRmDuYoAJB/0yGjYo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608150096

Some Qualcomm SoCs group multiple remote processors into a cluster
(e.g. Nord's ADSP0/1/2, which share HPASS-domain PLLs, AG_NOC, RSCp
and other resources owned by ADSP0). Firmware on these clusters cannot
tolerate the peer-shutdown notifications that qcom_sysmon and
qcom_glink_ssr send between independently started/stopped remote
processors.

Add an opaque cluster identifier to struct rproc so that those
notification paths, which live in different subsystems (remoteproc
and rpmsg), can recognize siblings in the same cluster and suppress
notifications between them, without introducing a module dependency
between the two subsystems.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 include/linux/remoteproc.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index a44368737b39..53e56d53641e 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -254,6 +254,8 @@ enum rproc_features {
  * @cdev: character device of the rproc
  * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
  * @features: indicate remoteproc features
+ * @cluster: opaque identifier shared by remoteprocs whose SSR notifications
+ *	     should be coalesced (set by the owning rproc driver), or NULL
  */
 struct rproc {
 	struct list_head node;
@@ -299,6 +301,7 @@ struct rproc {
 	struct cdev cdev;
 	bool cdev_put_on_release;
 	DECLARE_BITMAP(features, RPROC_MAX_FEATURES);
+	void *cluster;
 };
 
 /**
-- 
2.43.0

