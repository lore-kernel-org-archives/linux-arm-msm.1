Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7617E449EA4
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 18:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917760; cv=none; b=Pyt6dkl0sQe/2YjNkyEIjTwff+vkkIL0d4xABvcX2Lfb/oH/5S+YW7DCmBVhaY8Sr0xptdfeQiwJ1VgijAFSjhu4UzlxXaIpxPJxJo9JG6J2gIZoSfvXxu3tj9PIpOwS3yMlCyPjbosUKRR5L3NmFWP7tKZHbC9Tc8e4UpBJOGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917760; c=relaxed/simple;
	bh=DY8VFqJjyMky+pruQfRM5PAcQO10FyR8Wx2ZfO+d6cM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cSXIz/SQU4v/aYfyGM1lUmZCll0nJsvcGeZHGZ85Jm7Rycc2P8bawy7VaCcXMsNNYMG4yaPvjHc9utdPp7J/WrohjojfvfDZE0EvJE5ILNE3Tl0fOJUiJ7ujjELGDMRxbDyHHGjyGpz8yzarJy4OiASpMVkACqviA0F4zicoltw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bTxgvFX8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CM+QubMH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bTxgvFX8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CM+QubMH"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGqR0i3153831
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 18:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j5emzuRgACX
	9a1cgqepsrcMt9zKe22Qqa2hBXKHbruc=; b=bTxgvFX8NKX5eDXxqIaBpXp0ciQ
	BGc0fryJenJH5LAVyBAQEyawLfJou8zs+DYflyC4RDR1qDT1WKcA5i7MI1AMhEMU
	lYLYlua6JYvBA47wCavq3zv2G3jMh+brLKlg6Wm1HMz5RW3MqFkCWRPhnmjaqZj3
	/Wjs3F1bU5EffYZCTIwDAYxazOH9OegI6T2WTzs9yvpHgQ3p/Pc01VMgvG/2sWKG
	TUKYb4FShIpFL+3fS8Hn8h6banQ+qQAAe1TTsVbUTXHC1c8QVUSrPOg7oGiLzcq4
	BQekU7Yqhw/NGAJeht+Xk1ulY0jjf3LHuicMgzp2kkq57Ns+azzrlqshzAA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cgh7kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 18:29:17 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso929336a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784917757; x=1785522557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j5emzuRgACX9a1cgqepsrcMt9zKe22Qqa2hBXKHbruc=;
        b=CM+QubMH5EImzK79Riq/9SyQdbiN1t27mW5tRtMwh54dI3WgK5t9TMRTRyzZuDMRrM
         geceWOrWU2idZeJh/hp2xKefJIt+ZDivlimmblOlDJy4xmLQcCc+9sXIO0QpAGaDU+aw
         N2UrR5NHBowQ6wOEDMrHQZ7TisXxuMjGLkfAIVErqGL4yIn34l0PKlF3rMmAMDpt9TYV
         36sx/ZdQcBFmbpEEmqrJqLsTFxaaLlG8mNbf9rsSdArRmAFJ2t2FqS2888kD1cubVgma
         PEnCj3dJLUyT7iZQTnEQSpiT5nFHuFmQs2F7BdqHXK++DTq/YM96k91qM7grBISRzxsw
         mhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784917757; x=1785522557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j5emzuRgACX9a1cgqepsrcMt9zKe22Qqa2hBXKHbruc=;
        b=BB994d0cOLKEc85IVUrFrHu5wNLyVvR0BDLrToKE2s4xxTaItYqXMLJ3XOUoi1jHGd
         GPGv59b8rtAdsunh7LO7GERkj5fqNAbS5Jpc6Ff9x9lvZKRPMvHV8VPCYPErA/2X2JSP
         zG5s+poUk3zNnTMut3tjygqKHdRu2IZqKOy0zb/sskRa8J0ipQZ2AL4j1FRADb+mR71y
         y5r0Dwh/8LrLzbs0//e5B9Ve+d3fKHbX5FkCYPCD0AvV6t0UIi0fZhlFzWc6MEsRkv/y
         fnNpf+bSCSnrdnxqO2U5TWjE4U/d9TGoMBiKlUoa3gEbzLIyuoqJDeU+lXqZF6xEvQfX
         wtoQ==
X-Gm-Message-State: AOJu0YykMnkEga//Xe7fizW/A5iKvoesxVNsxmJ6yEKmEGlqAwAyByuI
	kVLLkm5D8ccCa3hA0TIX7NFeEgKBB1uCal53BiTu9OfYmvDQSGH6/v0mBTiyfomjWVRJ0bQsjmJ
	EX0IrlHl6meSpk/IRxWrqhrqBgpkXHDZ+HPIzhAqdNeOZTRBNKiJIF8+fe0NGJxZepeaS
X-Gm-Gg: AR+sD10/zb/p7hJfR/lEswLvvVlB2liZljSjSFnsTX50q51t26tTwEXLHEt2Mr5Ceg1
	ro4eAIc7Eqsq/A5gnN55aDyGQH7cfTYFjiKSx5ylVS8TJbjdFr69GhyCjwRNJ8Rbxh4viB6lsDE
	duitMLD1IuZeDi1EYQ+8lf6/TyAbzkjeR+vnCiQ0H7s+QIKTotYFWyNfZm5grKe0npmIznURBkA
	sOn66K3GIhzAwzNtEGX47+7n421ATC5HKOYSao+qnI7ourVzUpxFgTjwLVevtq3+Qu0KqF4bj30
	7ELB/F1b0bHBPlki+JRQZ9FNh2DDL9RvhqKsXMx1wyL7vq1EBHe1+vaaJd6YeJDBet5UkfVRNYq
	hRxDLPsndFlQg6FtJgAFCtg/gTpA=
X-Received: by 2002:a05:6a21:a347:b0:3c0:9c1a:8941 with SMTP id adf61e73a8af0-3c44b2c1b51mr8939959637.73.1784917756887;
        Fri, 24 Jul 2026 11:29:16 -0700 (PDT)
X-Received: by 2002:a05:6a21:a347:b0:3c0:9c1a:8941 with SMTP id adf61e73a8af0-3c44b2c1b51mr8939936637.73.1784917756355;
        Fri, 24 Jul 2026 11:29:16 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5c53f3sm1341510eec.30.2026.07.24.11.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:29:15 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 2/6] remoteproc: qcom: pas: Guard dtb metadata release with dtb_pas_id check
Date: Fri, 24 Jul 2026 23:58:54 +0530
Message-ID: <20260724182858.1868271-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724182858.1868271-1-mukesh.ojha@oss.qualcomm.com>
References: <20260724182858.1868271-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JOMLdcKb c=1 sm=1 tr=0 ts=6a63aefd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Td1J0TjYGYW-NjyS66IA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: jocE6KBkzfp7eINRnDiAUdW3R-MfRUFX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE2NiBTYWx0ZWRfX8D/0InOmqfoS
 mGLHjwAPYFmlHYJaemVYS8zV8XiVUJXQqGEkh/e9X1AmdXUwJ7JT6+j4GAdClHaR7AG13vx1Vg5
 u1RRuYl9hi/Zwkx/0/0Bxw8plD4BOfc=
X-Proofpoint-GUID: jocE6KBkzfp7eINRnDiAUdW3R-MfRUFX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE2NiBTYWx0ZWRfX5V0eC0ARBPoK
 8mqAd4UJctYsTmsirT9j6wf+QIXLk09v9WwgKLZKD5vmEaW7rpyiqdLybaoPWq6kr39NjS/XWWQ
 wIQVtwE9taZa+u4tMp2BxoFitbrCSqlEymBUDvge5gEn6LCacS7hf9eyUa8EuTEjPtza7gXjOMD
 rFQWbCpFRUXQSPtVfpHC32HX6Ti+AZLKw9F4KDqV16RyeUjHO+CdlePzvbOCHR97xcGJ3C9FslP
 sc4tIyuHZhqa2IY2IWK/fJH6N9YpA8mq9eG4uruEhLtIQeWFZEfs9yK2x4397qKD0oYQuaHAdij
 7XubI6P8x8tUEObubvcfJ/8uQyp3G0uzcGyftP6qYuJXHCboTUJDL/NXZ1dnbX9ZwLVSvwcWIwB
 e6An+nqaIDsVOSlrys+mYk/OaiFz/KBEBjnNEqEzgyxNiqzrjV1UOZmeEtQ9n49+M2es+MlZVXH
 ReRhnxfE/4IjKIV6/MA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240166

All other call sites of qcom_scm_pas_metadata_release() for the DTB
context are guarded by a check on pas->dtb_pas_id, but the call inside
qcom_pas_load() was not. Fix this by moving the call to the guarded
block.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Fixes: 29814986b82e ("remoteproc: qcom_q6v5_pas: add support for dtb co-firmware loading")
Cc: stable@vger.kernel.org
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 9076c82ac878..f70836cc382d 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -245,17 +245,14 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
 					pas->dtb_firmware_name, (__force void *)pas->dtb_mem_region,
 					&pas->dtb_mem_reloc);
-		if (ret)
-			goto release_dtb_metadata;
+		if (ret) {
+			qcom_pas_metadata_release(pas->dtb_pas_ctx);
+			release_firmware(pas->dtb_firmware);
+			return ret;
+		}
 	}
 
 	return 0;
-
-release_dtb_metadata:
-	qcom_pas_metadata_release(pas->dtb_pas_ctx);
-	release_firmware(pas->dtb_firmware);
-
-	return ret;
 }
 
 static void qcom_pas_unmap_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t size)
-- 
2.53.0

