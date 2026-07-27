Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2148842DA53
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785173620; cv=none; b=ikzPckee2oTOcyaqZg4cIP55GbYi8+/tE15JjIK+LVWBN/tWtWPc5wd3Drx30VjpQQMWNEsX8SE19F/ShGR69Vf0dRdUUkxAGN5QLk3HOqc1z5JpKoDelVCklabxKeH1kvZCMSn916qju4gELPkIjtYrxdlciL4jFxLIWfppP9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785173620; c=relaxed/simple;
	bh=iU29jtzSRnK0tODDEQUble2UhmbnimSlpXrJyOPLnWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FN9PdAtmdusFfZs3/d6L58m4LILDoVtAY0pqh8OvVOruNWUldcsGKFjsEXmYrBoeeGUEhXkXhaIpWa755FqFCAAZVtsheSG1blCkr8L19iEMp4OM+Wl6jRIm63lZf7GWJ7rBxvtdP3Gqdsfms3XFQicIpeK2XbSKkQuHFLx8XSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gkYgJHu2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M1eVvceM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gkYgJHu2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M1eVvceM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlhW2033222
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:33:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EKOeCgzPYWc
	ztlbpyGWazJMpqT0ardtdTx2QvaXnCR4=; b=gkYgJHu2yowir1PMzn/DC3f0RWg
	I+ejAFQwqWypdVixe9My8Ek0KqCnQ6Zf7O4zYnfaCmHlEVxdg0Gp/ORnrK9M26Im
	CTUQNoaSDoHlxy/DfwFzlNft0tTq1jRnxV2wLjKwLq0baz8rFLMAgB05lDvgLu4Q
	QzFVb7AloE4ZqMG5c7JzEnRvZqhnuMdOsveRWmUOgLJAhzxIiqJtL58JOGlvFcL4
	aRvVEb1OhBjEqQ2mkKtTylV75oA631CeB/IveBxoh40JH+WDPGCBzSaDUUXq5RFK
	LENJ93XO3k5u7qP29J3+jcP5fKi2SA+yby1xPUo3khEmZ8sAJhFfXu42Neg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4c62682-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:33:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f08560ea44so40862506d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 10:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785173617; x=1785778417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EKOeCgzPYWcztlbpyGWazJMpqT0ardtdTx2QvaXnCR4=;
        b=M1eVvceMN00I+boTYCStp49O7H00Abj4+iOpeguZ8rq6m5py7IS9lxK4UnkwjRbLo+
         UdJyhDMWqUCPrvSGwWMT9tzH0yK74j/jbNYx87IYHJoyn4KZTTykCkvVOZ6BDx7FM/NA
         O29i6wwDz09+pc63Lhrp3zzcUYS7ZHfst9ksS3mdjTOiqgtHZ8tcpimeaDXgp4FZ5TGn
         WymLORuVLvGO1ePSH7791X2GOUoPgkhG2n7fKsX/acOseTWyqdEkJG9fb60c0c6opKBD
         kFFv7sSb/LmtFN7zukT2cEkWU7L766uY2/0Eo9e8f2bxRax+RqVO1a4q8YDGV/jr/k/w
         cFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785173617; x=1785778417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EKOeCgzPYWcztlbpyGWazJMpqT0ardtdTx2QvaXnCR4=;
        b=SJXpA1GNX7Wu6hfF7fj9r+Y+DpY/Q4Ap6UkMKh7iquOXh6a2MKb/unnjCvIpqriN/Y
         s3t8IMHZjWh/KVUA3ojUL9TdPGGR7bDDNUoyVTkjtiq4WwnD2I0155KQn4f5N8Ebm5OA
         Qds4d1Ng0ORquSCZkTVNVDzV7iZQsXDFKSlvH7NNb/xWkUtcZ3WZUvYMsVYfGsZC239F
         enXF0YnX90CHRIuPsVR1V8JRgH1v6eCe/CBwX3Froyk6jh/Xs8PXzr/8It3J2mNR1Epg
         /w+/FMTWPO5jHy3WQSdQTy7+hlDW9SQonjWcEc+2haXHXw1x+EC7DjDxNp7TjWhxOoz5
         sqrQ==
X-Forwarded-Encrypted: i=1; AHgh+RqUusQEsAhANm+ae2Y/V/KLTxek9vxbPeZsmEGNKVwLpcJIYZQSQ1+8QjYEwlDpZ7BeUTwWgOeC/vfukldd@vger.kernel.org
X-Gm-Message-State: AOJu0YyG3gBvjfSOzl3Js8pxTKWzas5Pz7nuKbI7Aup4iX5luLDVZB4x
	09CIjfzkJZ0NJ490MbbikIX5sdoL1+atmZN5G+bGoqhEfxaNAjNGF6CnamE8PtyOLSS3XZDJv8o
	XvHNRRtIIU4UtClG/Rf9EEKyO2oiT9TtDTxXyn7xQ+8MjUAFX1qfIkcOq/wbAoEzi+NE4
X-Gm-Gg: AR+sD131zyqslKA5zA6MBscXEwOlOH/kpYGKHoSqIHqJx+fu+j2ORwyDWzC3vgxsrNY
	Kb+Fr/Phu0UFQA3GIgF8+2aD+f5NpoBuYyeyyMrEKWsCEq0lz8ACCUQuSPv6BRwnaO51nPoaVGr
	fQal1PSZwHVJByL4oH5sp6lT3Mixp9SvkdychwZVLJazLwbx5iOK+Q973MmZZCfwMI/bVxgDgs/
	F3qgCdP8XZlZrYMW4yzJUyYavx9awU5tPKrfRNKDAK0Hd4bLCAv2mOq9dHizzEk2UxE25VPeZks
	gX7csPbfHYWUjmJFPfqpo7GfAUHeeEmnxAHS5lfpEdYgxffstHF3pIxpDNp6jNesm57f7ZLEkbh
	zwU4vrLqXJmt0LzlRFbf/4oNT3E/RGrrybLulEJnR
X-Received: by 2002:a05:622a:13cd:b0:527:2b06:2bd0 with SMTP id d75a77b69052e-529a872c55amr96205791cf.83.1785173617257;
        Mon, 27 Jul 2026 10:33:37 -0700 (PDT)
X-Received: by 2002:a05:622a:13cd:b0:527:2b06:2bd0 with SMTP id d75a77b69052e-529a872c55amr96205441cf.83.1785173616879;
        Mon, 27 Jul 2026 10:33:36 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb5543370sm2945391a12.15.2026.07.27.10.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 10:33:35 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] accel/qaic: Add <linux/device-id/mhi.h> to qaic_debugfs.c
Date: Mon, 27 Jul 2026 19:33:24 +0200
Message-ID: <20260727173326.2219191-4-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727173326.2219191-1-youssef.abdulrahman@oss.qualcomm.com>
References: <20260727173326.2219191-1-youssef.abdulrahman@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eYQNubEH c=1 sm=1 tr=0 ts=6a679672 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=tZkrDhJDKE0PsY8Pgt4A:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE2MiBTYWx0ZWRfXwz3zJU04HVvK
 eg+ueev1cLPXHmxt7ERMy83Pb0lOXfIEQTPEGpaPI8cPtZlH+6iCPb0kWnNToNn+2zU+gKtMOyr
 LKvXD0LlbNNLDyWGMPS+RPv7qxxM5CQ=
X-Proofpoint-ORIG-GUID: j-50xhSB8iiX_cGQ3w-EbWzfAOnv77Jk
X-Proofpoint-GUID: j-50xhSB8iiX_cGQ3w-EbWzfAOnv77Jk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE2MiBTYWx0ZWRfXzUPRrTenMfSG
 Jb4iOftaYaEyE/fZWG3luIjGrxo2NX7uSt+WB8vBSALtiOFpmbnRqxGLT0zmcvOWCcUA8lknBl8
 RcouxhCVQKSL1/Kurzli/cf4q/iY2dmTDEGMM3VDUJa7yZxrUn+X07LMOaLKPMp50IeRskPS87T
 GYc/Sp4y6PopbiV7e3ZRcDfAmiHOSNSc0o5xGuSoq5HeusOpuSYEBumV1EgHFapIC36BhsmZAYf
 TCoqKZxrLjbdw+SRIAwQs1gOMbmEe3O9lFlN6xrjJ5TzqMh5zcIHmHnYvJczhR5LBCa9H2mpRvL
 QMPAbk/Pmi0UoWWgwCp9ER/hDTqEUx1bYcDzDp0X/NjLH2stJ6h1bN3ywWl7LKBQV81rUHv3DE8
 YS/xMmBkgWqbuYmQPuAXycMFGBaiakA5F0zCGshrk5JXwg94zJ3qkTWp31arAz9S/5XgZ/JPIly
 42jZTw/0zAAkjp4uVVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270162

qaic_debugfs.c uses mhi_device_id implicitly. Include
<linux/device-id/mhi.h>.

Fixes: 5f8df5c6def6 ("accel/qaic: Add bootlog debugfs")
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/qaic/qaic_debugfs.c b/drivers/accel/qaic/qaic_debugfs.c
index 95c78e12dd61..909a4d774d90 100644
--- a/drivers/accel/qaic/qaic_debugfs.c
+++ b/drivers/accel/qaic/qaic_debugfs.c
@@ -5,6 +5,7 @@
 
 #include <linux/debugfs.h>
 #include <linux/device.h>
+#include <linux/device-id/mhi.h>
 #include <linux/fs.h>
 #include <linux/list.h>
 #include <linux/mhi.h>
-- 
2.43.0

