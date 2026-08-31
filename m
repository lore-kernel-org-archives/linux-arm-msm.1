Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61153ABD8F
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 03:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788145317; cv=none; b=MQ2zyhGbjiIhW7JeHGZLw8d4msRw9AU4IIN6hjiu85Am6WsrspaIQQCZzDIBPN9HG9ky4DUWgxsH7X9+HWpqRMxACrA2CE4I7Ouhs65W3bKG2nCJIuumPCXJiIP3ODdrzqA5ChsuFd0g8NCnsygyhhU4EYfHqlQTRLUe+IjB/8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788145317; c=relaxed/simple;
	bh=nAVPYtVkkmUPMPzolZ4GiQCytUZdX/k5v26r2I/PRq8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CFxZ5mk+Pmp9AD/lj82qdHgFYV2pNWjdPi1spgVPylXwP3EOTHJiGMKF2eBztHvW4aOb8bh4dHPbL8zHY4Tk4HKeCAyXm6aeB7tPKeZWSoHOTBrgSUbajBEObWhIBQZHOHzt05n8N0W8wHKYrQ/vIvqnQ9cLPPloCSuWfDddFbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cX6iZ+rG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cM9fi3aK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cX6iZ+rG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cM9fi3aK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bQpB2819887
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 03:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8XJcp3X4Tby
	0WLraLkWLYA7pOP6v/I2LJsWbNkpbmuQ=; b=cX6iZ+rGEUcVwB++UydCp7M+0Zs
	UMHVIDWsgObvKAZ/r2jm7t2Vv5cR0SiFx3V5wHatefqeQR5PVKdwKDrsy3pTq+FS
	fqbtyQFnydbjGDl0h7kG1DesWuFvdrZqAfWeO4PJuqxRhKoJMAV2Djez5ujD0/+b
	JoaZw6dygO1ilT8jhOh6cs26NgdJpSH/0DWmZSafDV2YtcXBAltabDe+lCSwO0M6
	oqO65qXSbW4CJeEWOlqKZCUzbXNWJnCYMUBHGKRqxphoyPY92oHMj/tOcn9P9DBa
	GL7RHn4ORlJ4g2sT+/5BlcKvjNgoQfCFgkm4+9IfjhPUo6DUschzLwFW1BA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqdfma4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 03:01:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso1611887a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 20:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788145314; x=1788750114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8XJcp3X4Tby0WLraLkWLYA7pOP6v/I2LJsWbNkpbmuQ=;
        b=cM9fi3aK1jH95ldNgz2ySPb/ei2yY8cV/tl1cqQLsHUotqd8MZYy454Bp1+fSh0oqw
         YmjiysR784oVMNB+f/+e6yEYWB23243vuPvtmjXY4O1Eh2mBtSiLa6/UxgJ9Uo+iFKGQ
         aFaqi16nrbnz8JLrnbh1zYtuiqkB0Oel55Hr36XH8TxXgB5NrBukaQvVuQy5f6wViLi+
         6F7whlKZaDosGAhO250Tuo2gSQhX987ad+KNiuV88tHEYnHUgVXYE/zq1VQvC2gM+oZl
         LwG03UwM9O+WxXJjvAmQbKSVDOww1eXjfXVazTnrMo9ydkh7y8By1gUTMKti2gm+yd64
         1Fjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788145314; x=1788750114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8XJcp3X4Tby0WLraLkWLYA7pOP6v/I2LJsWbNkpbmuQ=;
        b=EwdMR3Nxzg2AGSG40ekPSDSoTj67OslvRFehajfSTsnDQWR4hPhWSxoTUahtbD9S5u
         tzXXgfKoH8Z1IU99p8D6sMt+6R3A+e7lEa9kAdDyrAGSemsfvysVSQBbBBGpAaoZTo8O
         BQ4MtYOaXMEwOmfzoQKFx3RoGb9AySde/Z1upByAfaFeB9e2Q7Silqe320ll1ECv53/F
         nS/k8UGte3rQdppcTylSsMzKQ+LKhlSdu5sPpmuzL9VY3DmOQoNynoXE+ofBgPAIFYzM
         1ds/IVzP6aAz5ztJHvIDyt3YB46Xz0MBMX1dwTbv1sV+kBYTuGoOY3bpiZ9jakrvjpiv
         G1Tg==
X-Gm-Message-State: AFuF++mxp/7CK4iUHX6X/ACfWkeXfVbpKyv8hkVOSJb4FK2kEzaf35ao
	uQLdsp3qs1RF++9cuWrqYyNLb0rEdMrjbwd/bf0Nq75gDk/ssg1Xv5hoSZ890AGlUAUuFnhBGBL
	URiLxXJLIPsZETYGfvrP6Ylz1yDhRe7ZdELWLXPNWuE0KJxKsVzGto8dUUuJepATYJG99
X-Gm-Gg: AYBFou0t+xS8UzQojuLmfhG162bmWVoKoRoigtDVVes1wn2Hw2hc+LdyelyDPtnIxlJ
	ws6QnZohyTiT8EyOL4pfjBlwcGWDhvzGyWhddoLQtlZDu/yOVrk0k/2M3mOKq2Wf/hvk+zt/qvP
	jnAZueNVYIBHnF87ml0pTwKg2kAgsCOtx5VWOHs8rHhAgyjiFGqdTDYds7xDRAeh8YzXg/W5m/R
	ZDxHNWBfIn0uZyLUaZYYZQhjcDpDOKt3ft9heJvBHv6fBZuqBQxb2WdDjtwSIfesN3Az+qJcq/3
	d9lWyoJ21ckRJGJ/uN58y9AElrR+7am1I5KRYWtchlpKzp77gY9TAQpf+rGrGoplwkt6LpjXn1Q
	5Yt9TbS42hNSlBR1HUEfHUCp9kFQANUzDainxXG7GhIaTZai4UeZO7g==
X-Received: by 2002:a17:90b:2f10:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-398f845feb8mr607840a91.13.1788145314314;
        Sun, 30 Aug 2026 20:01:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2f10:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-398f845feb8mr607780a91.13.1788145313824;
        Sun, 30 Aug 2026 20:01:53 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm30011973eec.9.2026.08.30.20.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:01:53 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Peter Chen <peter.chen@kernel.org>
Subject: [PATCH v7 5/8] usb: misc: qcom_eud: improve enable_store API
Date: Sun, 30 Aug 2026 20:01:44 -0700
Message-Id: <20260831030147.1500616-6-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
References: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfX6EjTRAN6KDEU
 vuW88fuPJldgpfxr7TbN+20PoMujgN/4+VKaWdgLkVFakmU5F0rE2crYbPYEH4riSX23m5wxYjb
 SB/Gk9ikAIPoBRT3VT3hWJKYPen8rjs2K0sYgma+p2HydWVmLSpZVnFMgWBe65yDJHPKuLArK3p
 yPSocy6JPsojGSKwM/P5sjAOGrFnPONK9PdWaiCEjJtX/T9GPQqEgWhTKCeYct+4gA41mz8ehyd
 4XQ+wZompvzKgkJFirl7pDt53WUgY/zmeyFOy6TAr9xh04pkmTpmO6EH2Nux1deKh4s/ngfLB9r
 ll1PsIh/eoit197E3UMxOTKfH212EJsfxbXK24/p89s1lElgfnYWDktiYHXaLnVSAUclCjv9CBL
 73eAh9Zka9jGHkPYQ3YK8Yl53FgmM1zcjxFa8McRvpFcsGJU6Mgjx+FG525hWDaJ9aJ8J1YIIVM
 ECZXxmTLs4DDxXCJaKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfX38xPl0WUCy0V
 yOz1Ivjc/vdHftSXg0Kj9pyG73l66REQ8lNWomGBRDtYkHaY+piFN+FKz9ARUHLJe8w4copGOl3
 0wYPkmwR4LZAoReiI8TMbAhMuk40HZY=
X-Authority-Analysis: v=2.4 cv=B7eJFutM c=1 sm=1 tr=0 ts=6a94eea2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=iEam2xx7WbKG8qDqzoQA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: UOxAMyyYHJh2_tB5AyxQ-U0fxtr6rJ0n
X-Proofpoint-ORIG-GUID: UOxAMyyYHJh2_tB5AyxQ-U0fxtr6rJ0n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310024

Currently enable_store() allows operations irrespective of the EUD state,
which can result in redundant operations. Avoid this by adding duplicate
state checks to skip requests when EUD is already in the desired state.
Additionally, improve error handling with explicit logging to provide
better feedback.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 45c90d9f3b1f..07522225a8f8 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -162,18 +162,27 @@ static ssize_t enable_store(struct device *dev,
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	/* Skip operation if already in desired state */
+	if (chip->enabled == enable)
+		return count;
+
 	if (enable) {
 		ret = enable_eud(chip);
-		if (!ret)
-			chip->enabled = enable;
-		else
-			disable_eud(chip);
-
+		if (ret) {
+			dev_err(chip->dev, "failed to enable eud\n");
+			return ret;
+		}
 	} else {
 		ret = disable_eud(chip);
+		if (ret) {
+			dev_err(chip->dev, "failed to disable eud\n");
+			return ret;
+		}
 	}
 
-	return ret < 0 ? ret : count;
+	chip->enabled = enable;
+
+	return count;
 }
 
 static DEVICE_ATTR_RW(enable);
-- 
2.34.1

