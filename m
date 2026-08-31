Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE003B0AC7
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 03:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788145319; cv=none; b=n5AumOlVTwf6cVivH4w/RlqN0DriFHD4BhkE4ObcQJ5w8VmrgnmO0MrrVXfRhZgGF32VV4mkVWbAnhMbQTOHelKzQSwVUxvmiWyAw1WvJDCFXirqgiLuvdXKnp7QHhBljf2bH/8i5socBLN0gmZOlKM1JhmdfA4Eko1U3VXQC3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788145319; c=relaxed/simple;
	bh=Msj1DOVWipO41oW51gTwfsyr27KLZriNHjyoIbm6njM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dSCHO2uwULSTt2w+bPHfryNvrfWLwIxl8dr6WwMJHe8l7ko5YK78I13MXQslSeGuiMiaen8Srg4dPl4xG/eHOJpeRIqPJ/kqSR7TBMIY5E80aeUdBdOc47z13jvmXQTCqLTbJKUZR1UdUYU4fhzx/MsYcBzucy/XozvLBxiw+Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Imt6HGc0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iwzn0Jb8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Imt6HGc0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iwzn0Jb8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bPsU2179555
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 03:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oEsuGii2+Ra
	6CMzyXnbZHPQh8RNg3JuatHxegyg2aPI=; b=Imt6HGc0AG/UqhSQQCuDFCb+NGD
	HBD0cwRhzfBgGiXJxy3XorwadI/1p7vQgC/Re4ZIF/Om3++JVL11Ss2D5A2XurE4
	pGjyZaX1cB2vVZL3GCCQfs+E16dP1wkJO3IjVu6JRfK4fNwl5p/vggKuVpwqgCbr
	FqInYKZG1juGu8kd1qLu/KUwb504ApKNaheWivhX4zcrH6ixWfx6lQoOMJwjdBK7
	8nJlUxWQr0Fm/yaAQQBPplmG3Af4PsTgsIeZmJwK/qMOSfOyWZiX9P1AlckSgyC/
	WnlrdjJbdxEvNkIszYulVUMcQz3VRJTnbTV28B9SV+K8x1pgDnuk76JB41Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqn2m9k8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 03:01:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3950b1371a7so4709875a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 20:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788145316; x=1788750116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oEsuGii2+Ra6CMzyXnbZHPQh8RNg3JuatHxegyg2aPI=;
        b=iwzn0Jb8Px2K9rqul8CJHlGHfrS5zZ77FTUfLhfUEJBo1Gqw5tfnUj1Ygw7KEO1md3
         Unx3VpCGLOFp1UVdiXvC8n5ty1uRCd+vcxxxtqNYkt8K4dGwzVv1dNf11bXnZKo4eJ2l
         0xkY3rXs1XzPi+OUU9UV37jpk2WrXrxfhtR4txK4gKhFiz4evqGs2nK3+eAmlnluXouR
         ZZ0HcYZAUF207WVpfEwTc7nHQfoZGxG2s/Wd/cQh43NoYahPqfdW9L0wWge+N1tUcfPC
         PtucdCLzc1Hm4sbZTO3Wpy8Ay+Gp5WSM4gBGWu31TqVvcEwLJdu6gHGO6n9PSj02lg8P
         VGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788145316; x=1788750116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oEsuGii2+Ra6CMzyXnbZHPQh8RNg3JuatHxegyg2aPI=;
        b=Dt6Hru5o3A+9fMBNIhP6keO3TGy84w1gugoTYfBoJE44Jez1KoA+QMPCejFDwwQGLB
         fq8k/ZuKV0mYnaGVAY4ZCxPSMY5/kc0lSm0fcVS/5w0IW7KCukeGBhqTimmL8TQD5dV1
         RXwW0i0uq2YOEiWEg3LB+bAKFM5KVJSN7W7vYGo7nKXbO1iDKSasRehMAqh3pKGI1fcL
         M/sr9i7Z7yjnK7q/2F2ixuv7hsPKmToHNJtpRDqCqyVo3uSpZuXimEofdFCq6c4/XgfM
         kEV+KtSD8Yr4fhtjWiuxoB3idWr8M2NF2OM8EhqF+9/1Kj4nsyEkErUTzhUqOReBLHUQ
         U3dw==
X-Gm-Message-State: AFuF++lBjwp4Z8gSk3spBHWHLd9VOgD8QqJd4TcIAOvOjWf53WQ8Gq2U
	UpCIuGd25XuCbam2puV3v+xxQhpLamnmEa64UYqO3VwBZFuYZlR1JpznVd9D7Vj6PqD0dXPtOkN
	e4Wr7pGupUGUlOtvUd3FjPUUcu/Z1VN0XrnPGGVRo2aPxBpqGVXG/4MvHH/7NHtjjB/rn
X-Gm-Gg: AYBFou16zc58popukWZC/yDFDao1ueZw3kSpOmXImnSinRcvQoyQt1G44lqJZJ4fj1O
	Tb671e6nJDIUXEFppzko910JtvS5BG2Qr/aq2EkbG5uNWseES0bh9wcSIQAaNkHYRKvSubZw+HP
	YWpBE7tZtPVrE7FRUIP3a9OLZl9ITs11j5Lf3SVq2p5KFZxB5HqTFiWtIKAtyeLWZ7tztkkVGgJ
	GwJK/lO2/lkLze+OMBTiG5TWYoEAWqnYUXka9ET0J6lIDx1sySJqc1q2TtaK8gMItdrKbgeAbpc
	aatowYJWq399eocavJx7D6RCC+McCuKS7o5OXqJZVJ1dUypcN0Ju37ucRyKRua+dJLd328fXH42
	sY9aSOkIdmSdzH9CvFzTqwonxY0EkiPxiQfSmzvcswAu9RKFnK60+rA==
X-Received: by 2002:a17:90b:4c4c:b0:396:635a:9b10 with SMTP id 98e67ed59e1d1-396d0ebfb0amr33823028a91.11.1788145316469;
        Sun, 30 Aug 2026 20:01:56 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4c:b0:396:635a:9b10 with SMTP id 98e67ed59e1d1-396d0ebfb0amr33822975a91.11.1788145315996;
        Sun, 30 Aug 2026 20:01:55 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm30011973eec.9.2026.08.30.20.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:01:55 -0700 (PDT)
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
Subject: [PATCH v7 7/8] usb: misc: qcom_eud: fix virtual attach/detach event handling
Date: Sun, 30 Aug 2026 20:01:46 -0700
Message-Id: <20260831030147.1500616-8-elson.serrao@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: -cWRReiSy6gaJz0ghOZ6dnZmCRnil0JD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfX8AL3cqAb/s6X
 kVYr4yrTZiFAPDj02wZLE4uu6KSuco7MWsSVU+ThOV/tOUJkC33GSdWuMr6izD0OFi/4ylTUrLC
 7ut5zb85V0mxQXnyv341NxP3Zd3njL+YoNr7o+Ha9jIdwG5ZQJ/ev50E90TejJvg9nwDNqvPzGF
 klBBlDR2zsxLDyZe040vweBF2sOsMvhU3y/Za3xN0hCjXTCYgQ69i55FSNIh7m6BWWbBoWbz+Ol
 fMsLqCbg6qBJHf+vLjXLOmYV/Qp2P30Kx/CL7pbwbKqtcBMnnhoG1mpVVdEMi45pUr/G9hYcRv0
 8TMPhgaHFXYCOwPa8ZjIE2h3vkntArkvF8vZO8GRNeaFYqSuRjJbL2Cq/aVAAW1irdIo4qCsnA9
 Ta4vmgNN97ne4PH9c3phcOEw4TLPZaSiS+pKF5O4rD9E1ncwTssyI4d/lyRcnNUbBuXS8iH+asx
 jHENwEHHSU314UJRI+g==
X-Proofpoint-GUID: -cWRReiSy6gaJz0ghOZ6dnZmCRnil0JD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfX9gZcl71ry4IU
 Zg5IeKpFgdnqgQS3vUfwqSkvdBAouP1vVPx9u0UE4NT4buKB3Ub+YFWWbC3PPC6/FHIlyUNvQiy
 vHHB352Vk9Y+tuy3Bm3PZK5WHkNPx1Q=
X-Authority-Analysis: v=2.4 cv=a5kAM0SF c=1 sm=1 tr=0 ts=6a94eea5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=oDIJ3hVRoRHbvujwG_AA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310024

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
index 549c0d852bbb..605f675ec7dd 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -306,10 +306,26 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 
 	path = chip->paths[chip->port_idx];
 
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

