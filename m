Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550633E8326
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 22:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253599; cv=none; b=PfKa7wF2Hb+gVVCzAj2+LUNz3St6EVUc1hdk70/fVpjOyA2peqkg/ghp7LJXlDSXn3+T0wcEyN7FF0UaAZfa2EsmVWoo3U9p7Iguo5ezhGtS5FvJXz22XlxmDq2Kcrw308U/mGmqlUeDWsASfkky/A9mMqcLreTDUcZy/0n3ziw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253599; c=relaxed/simple;
	bh=rzM7FDp46PONIU3FuZdRnR6emc1m2RW++R52letOKIE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FWiD//bMLW5rmO0swnvamPtLx9tvTsKH2X5JYBxiuV6ndGxq35Mt+BYoIg8WfgG/N6cIVg20gwBRyom5KGIpI6DcJvyn3I5cposYa7ye9s97UzL1d10KokXQsYyoF2cDld2mOf/RKIPQXh6Vk3Azz0foXPdrijrIm0aG1GxS3k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a650BmU+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Coc0jq0C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a650BmU+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Coc0jq0C"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CLnktM2945847
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 22:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=y9biAXn7ssv
	b5YgyKLJsEP0aTZIozodH3BSXfrvWTnw=; b=a650BmU+K9WLJgRcW2DgzwEKaY+
	RfG1z7xTXtfzL6gya+09Led+VFjt37ZE7fjjlAQofCMIAVuKDP6wXwHiVAwQ6fVg
	1n94cDldCb2SEAA62CO4VP5mXzYTJ2X2Pw8khs55aroKyJNOdT9JpKFbBtVPxbDU
	xjG8Wr3kW+CTiPJ9NUPBNE2nz0+cpr70GIvBwNUCEo0+5LH3vKD/mUQzV1gkfi6L
	WXcTvrMsIDNr+B/LHYlSB1qTBdnEAHmp16Rg3bjzv/Sbm8gpWarN7ofUO1z0YYuh
	JWT3LX+afLEAqIJjEoGVHN6sKZGAeIsyOg5eywUKwgf1qJ+G7Cq7VoFB4tA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh1yc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 22:53:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1bbd7d6e6so1619250a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789253593; x=1789858393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y9biAXn7ssvb5YgyKLJsEP0aTZIozodH3BSXfrvWTnw=;
        b=Coc0jq0CgEQO0HH6zi8XZSex9XuZfB6PQ0GntZLeGlVPfgiEKBWkzaaMurhlkKQTz8
         hleQJmbM45IBb2v3YTIeYY3BnNNKVrUA0MrcQwr1wJec2JKIRBteFN8jtxSkjucVD6Ni
         rtKNBkFnfvvaCtxUC/ebHiD+P8s+nDdxLvlI6XnlDZVRYL/1iKiTIGNkXhCLJr7kEnmo
         vOk2jy21laMZ3cqtja6t1DadKFkM5CqVbKtgX6WexDbuZbvMbtlViV4iX2ALsCG8kAj+
         y5a7SWFbWsbFmEnP7F7uH8QAmsORQBAgWMLBwQERMtWXv129dMb2+zAQ0T4FXxgZoF5V
         SfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789253593; x=1789858393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y9biAXn7ssvb5YgyKLJsEP0aTZIozodH3BSXfrvWTnw=;
        b=J98Bjf65VmNZPdVItoYDo5yPNGpeMv2p+z1KlgVBPkSpwLgXAm0r7k30tifj5BFRxQ
         xJO6CnPyx4D/DV9YyuP0SMvoKd56oIrLQLvw9H0bcdvjrqs+zKdt+MNfxn2O9E+eIkL1
         ZVFjK2vRnwpqTveV0zXJwxyg7z+AqRHGmisk//Ci+J/3L5RHCdmg417Zgufk+2Jblfep
         oSq8YzjCehSmgELmC8ivhu6eePZ9/GKgEk1xtJYnPMhto5MHAYZHdJvD5EoxCMjB7Nx5
         zafPLrpOk3cWHc0OpzRY5bTdyJhL2zVTg1oRbkutD+noFaCbfwL/4oQ6oqF3jwmY7yy0
         ox+A==
X-Gm-Message-State: AFuF++m4L0B7M1Nmouxl0BRBuzBzdc/jxGknqcArKKFeMn1iLQ5T/yOU
	m90vl05I4B6y62+HzWvuSjH9FN1D+KfndifBiKKTPhK2uRcynrpRA95yMKpsJWjVjv4SaCXYH25
	xzH37hUFuQEGdnc+jyzVWZ2Jw6yWzOoznrkwFHul/l9jNOg/kBGPQET5P+m6tx3r2KFu3
X-Gm-Gg: AYBFou3oRvArdiwGN5XlJVfABk5rqyO1s2ZjmBkh70NkH6jnKsLqdfw3sk3pJC5iw7e
	4B1+C39ZlEvm5jV1mNKDenAo9QBIYPwf6Pg1wYZWQ/66kh9yaqyq6VZtAYeGO3/FRKYzQAH2cBi
	Q5wUZuwq9lgixyBi0Ok/hTzh3MK7nr2Kh4tpuk0CDL2Wbf1fxSHExCVJWLjIpYYhT1cWERw/D5d
	B/tNqsvY4MwciQe6F4bSITFaaTizADhcuFjIa7sX+PtUs4sK7X40OfF3UsKI7vcal1biyFhIIQE
	Yj0iTbm21+V5zGCVWeVwlAIMIDD8U9lJAV+cWR4x8/sWZ5hfd+lrW4mJqseT2SAg9RQGXnbH1Yo
	kQyHgLJyQoOa80jTyX8Ir4+ZL/lqyGBj+RPuJMztdupMDVwOtFNnybw==
X-Received: by 2002:a17:902:d492:b0:2c8:f34c:82c0 with SMTP id d9443c01a7336-2dd2a1d8c55mr172889575ad.2.1789253593611;
        Sat, 12 Sep 2026 15:53:13 -0700 (PDT)
X-Received: by 2002:a17:902:d492:b0:2c8:f34c:82c0 with SMTP id d9443c01a7336-2dd2a1d8c55mr172889245ad.2.1789253593104;
        Sat, 12 Sep 2026 15:53:13 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f5833fsm19741555eec.23.2026.09.12.15.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 15:53:12 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Peter Chen <peter.chen@kernel.org>
Subject: [PATCH v8 7/8] usb: misc: qcom_eud: fix virtual attach/detach event handling
Date: Sat, 12 Sep 2026 15:53:00 -0700
Message-Id: <20260912225301.3396556-8-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
References: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IpePTsm9_1nkn79j6lHSuawt3ZErujdh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfX4ejTt0QWS5iZ
 t/Ad1sEfbLE+rZ0OKjxVJo3KU+TfMK3F/uBtI1kRDB/C1s2QJ1GfBJurrqdCKlYo8dkDOEJHh68
 S/B7u5/7RtX4wKVC+dPWcnSIYTq4GlCI6bDGPKzoVmoVXyZC3GaBCvg5puGNE3MRVMkL02N1fqD
 9lh/NE8Ooa75tFhMd7pbJj1E4sCX5HYjpTMdUwU0SJ+C2mz5JB/k2gG/tWLM+cF90AJb1bpGV44
 UOi+hnonElWx9MY3TYRosEseeiDv1bo3JBjZG8VvxDELBlHlbSm3pqy9zn7cjDtt8kEn0won1b8
 EL3N4R8FmQIny7gKmTC0hXR//o1+Yx84Wrhdk+Tw3QrXy4oaIZdSqU+lAniQsvoQoq6j9KskN4i
 Dydr+kM3zhl5bzgw2ZYy2oDjlOTPjDVj/Ax+x/TPn72Aen4F2Q/D0PSF3u36AVzuj2+mSWzIHtK
 WYsJsTXPgpXBcPQMlnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfX8m9t18YbOdsX
 6oMi2hYQpd3lOEKVI4LgYS7HXtMKoDO13qI78fyRZdGBtC49S6rg/LMPvovgKqMeU8+DGv/pe/D
 tq3k8rqittyCRUdy+whmL52PRDgd+co=
X-Proofpoint-ORIG-GUID: IpePTsm9_1nkn79j6lHSuawt3ZErujdh
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa5d7da cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=dOwNoGVJVf10FbPJOZQA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120334

EUD provides virtual USB attach/detach events to simulate cable
plug/unplug while maintaining the physical debug connection. However,
the current implementation incorrectly sets the USB role to HOST on
virtual detach, which doesn't represent the disconnected state.

Fix the virtual detach handling by setting the USB role to NONE
instead of HOST, correctly representing the disconnected state.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 353c45dfd328..669e2e00dd7b 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -313,10 +313,26 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	if (!chip->enabled || path->curr_role != USB_ROLE_DEVICE)
 		goto out;
 
+	/*
+	 * EUD virtual attach/detach event handling for low power debugging:
+	 *
+	 * When EUD is enabled in debug mode, the device remains physically
+	 * connected to the PC throughout the debug session, keeping the USB
+	 * controller active. This prevents testing of low power scenarios that
+	 * require USB disconnection.
+	 *
+	 * EUD solves this by providing virtual USB attach/detach events while
+	 * maintaining the physical connection. These events are triggered from
+	 * the Host PC via the enumerated EUD control interface and delivered
+	 * to the EUD driver as interrupts.
+	 *
+	 * These notifications are forwarded to the USB controller through role
+	 * switch framework.
+	 */
 	if (chip->usb_attached)
 		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
 	else
-		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
+		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_NONE);
 	if (ret)
 		dev_err(chip->dev, "failed to set role switch\n");
 
-- 
2.34.1

