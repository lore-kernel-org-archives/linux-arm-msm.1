Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D9E50B8CB
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 21:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790717729; cv=none; b=dWUikN+QEieOo++SwUKsYIJAGIni/Az5k6n0LFR1jleEJI1aG4/jslsNyXPjlY+xfl6l+mGJ6+jJg94veuDmw2TB4CWTGq3ZSzfEACiUxupXecBkYJ5PHTQ6FJPaO3EVVu90S/qqK0zcrROItv7m1YwvcX3e4oIzfkyLR0G6oFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790717729; c=relaxed/simple;
	bh=DfUyGXAigUOuE5hAQY8vlBtickimUxiN0dtZr1aGGUg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ve1tiQV6H2e1wPuG/4hcfzh80neEeg5YZReRmw26x23K5MnddIV3CMY9XWZaJtn7GF1fIezLPzaRRgWYTqnjg32Hw+MF+MMo0awqEX6ToWpq7ugpb7OsEkhVpz2D53IZ9/CYptGnNvfsVtsRGrjXIGerVhZcmy0fy5zsFORHlfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l1J9L1ZA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E2004fv5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l1J9L1ZA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E2004fv5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TKWkCZ2609073
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 21:35:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rNWQbn5BoFz
	a8fHCsTIRq2Yt6o/OubhO/LVi7rDZ/Jc=; b=l1J9L1ZAExmknpE9xfQcdyPpLvc
	pf2BO9KDSOTP99Ujb4g91HCHQg1O1qNtPLZLgzsQbcVjBTmtrg3MjyKqb5/ZUk9N
	+MJI972VCVy5i1C2QxPOspYBq8EFaODpxYiwyqio0tEc9E3+GXZdWrEyma6xmVPf
	vhKvISlP5eAWcqb7zNTJXk6cLwxv4kW6+S4wh8RjKrNYyM5SWEKTY9f2DCjxkmON
	THxTOTE/y5I0+FGy7mqKMU0HwKmj2O6VSjZaYTgrkPdBcEo779a+VIHCvZzg+RAo
	pEPmHxcgwA2xlcXZzJceylKYfSyQgS0LI3l2J7I1u6Yy0+uK/BTF6wlrkvA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0mfa86ds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 21:35:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1466894eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 14:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790717725; x=1791322525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNWQbn5BoFza8fHCsTIRq2Yt6o/OubhO/LVi7rDZ/Jc=;
        b=E2004fv50zBJ4XupDmeEniCGDRy+om1FgJFuZ/xrQ41B9p4ZEBJx2JVkIGYOAVgaUx
         yKIcHO/qJTsytmQF1R6Mo/32t8d8S7ZeUk1z5CgeQwDGsrp6hIpT8RjG8GPWbBXzM+/W
         Fg7T4ippONjds0ZNq3SqdE3ocem6RRQsuYlvrNjDQOYTofTmi2ZmU454bNLz3ETSg4vw
         G79LojAfcYREePsqbYSlfj+jvPfOJU3xT/kyC0rh/r2vCyXyj7oI2Es2I8wpKEaiHKcj
         Sg8ecW9Hn5UGYztn+e6ree6YuuVuHPu4zez6LoincMm09iTZO2JgJsfjz/LiTNAdPTJb
         WyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790717725; x=1791322525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rNWQbn5BoFza8fHCsTIRq2Yt6o/OubhO/LVi7rDZ/Jc=;
        b=MUnWV056XqToF5H4MUPVnzkMcmkEzBmmg0avsWUM7uHXQgemVUvRdN9v/7NbhqDWwp
         8Iq3VfTOv7LiDaKjz5jOFNVn58XkiwR2rRl7ZBJ69VPCgOCCoJgICAozeMIokEwTvwcJ
         4mZqiEPuiatQ0WF7c77Hs0zCV56Foq9S/AZ/vf6aMZcvvpVE4VMqWSfNb1AnsKUKL8bK
         o4Dg1GkaHTxJBZU3PSRK1qc2SshWHonx5xupsTC+0p8uIeDfUMUEUoRr/CtWHoFR/lKN
         WQkY6j4ohPzxtd+rvvdLRjQyFvIVg66gNDUNYYqA52T1CfJ+iZonVD7mF0S5a/ZnwHiG
         tvvw==
X-Gm-Message-State: AFq9FYKNpGZ2XDnwAcaUMYcZkXXUtSH97zOd5e91ltW2L97wbp6Gv/L9
	83BO7nJu71QQreBO5K4DdfP59jEA7hiYSpjs2FqxOJ+9r4gtNqikzRY+IlL3S/0CKtRBgxeYbqm
	wRtW/C+id4ayvFjgNUjgyVDZv55DOEHjmlxJTtjMfyobNEugWK6pKb3k3seLf4z9cOFAD
X-Gm-Gg: AYBFou2l4v8yWHUpwkXXx/lv3x3TY6WR58u5XhLB4nnFEipMAyou+qh3kaRLmsBMTU0
	rWQqp62du33u5vj9LPxbemK/G4my//erop9VL9FPapraQRgke9lgU1N0cPmL41cNs/wYVUrmq/T
	l2Df/g+X2hKdi6ftcEsMnJg5reLgomkrdP8386pcP/6EWe35ecsq98HGWo6BunnKqiKWgQkMbHS
	1LPFiU0Z8rtoIAvIyyGMHnVlqd0sBly/M+00uzWSWsnfecXSB45+0aIxwCGQCyvCK4yQjOzgnag
	Jg/AETeuenSj75omuw2PU9Wr4BKGaUG+hlzgHYcOXKzQxv2QcNi7OnpLUeuCXTwRruWqEXAcB7H
	9Il1d+zFP7BXto4Dav71WAIL2gicyfURFCEfFtzbmLNryVWX6eGul
X-Received: by 2002:a05:7300:e9c7:10b0:342:78aa:51f7 with SMTP id 5a478bee46e88-34c675c97bbmr708995eec.38.1790717725009;
        Tue, 29 Sep 2026 14:35:25 -0700 (PDT)
X-Received: by 2002:a05:7300:e9c7:10b0:342:78aa:51f7 with SMTP id 5a478bee46e88-34c675c97bbmr708947eec.38.1790717724278;
        Tue, 29 Sep 2026 14:35:24 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c391e25e1sm1512570eec.30.2026.09.29.14.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:35:23 -0700 (PDT)
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
Subject: [PATCH v9 7/8] usb: misc: qcom_eud: fix virtual attach/detach event handling
Date: Tue, 29 Sep 2026 14:35:12 -0700
Message-Id: <20260929213513.2401005-8-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfX5EhpUd44WY9Q
 GUiiwn/08ydckDYGoaaJxDqCuCfvHD0PHyII7Fe7ibmUPIYATIPhbX/HXqXSFe6M9TMqBLWOjz0
 TwRz9F0xUrz/pAm+qVVN2M4DlM8qekKscBslyZ5FR8hkkA3ycOVnxuKYWmlMYEv8o4aQsYc+/vr
 7799pLoHWPYtjPNMzmLfdHi9VZITE4jopjzJNgOg/T82dB51/BKDDy6N0W5DrIvJC6HbFVPhFa4
 fqUovMWu8BgcXNntXVL5o5W9h+hpFfaku7a+vCl+5GwrWRUGvltr1BOXMhsbvAF87Q+7qN12gC9
 XaIlzZbtZhpT+891l2gyZqxXfL7LZ/5E+rqemTrJoLCdxsw3C+fR7RWjn4onp2zDYeExLFls8IQ
 kARhT+6kFcPd1je9fcIIREcXFFyOQnpzS/LwEuJxwIX2EiiRqnMO03axPbnPKqrrimSCbS+3Hhr
 xz5L3KzgmrMqVdZOm3g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfX5psyvgqrYyg3
 PKKwtj6Yq+m4GnCZM//DHoot88Uzd74T7cLglBCXmPUqiqM4FMMj1Z8cl7is1WCtC47dOiNx+QK
 Q4Pz5cdI1B45M4HsdqHD3x1vt6h8RZY=
X-Authority-Analysis: v=2.4 cv=RZEFmFtv c=1 sm=1 tr=0 ts=6abc2f1d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=dOwNoGVJVf10FbPJOZQA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: jHbQqC3I6bqckpPpSUXW7KWNAJxodsBl
X-Proofpoint-ORIG-GUID: jHbQqC3I6bqckpPpSUXW7KWNAJxodsBl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290086

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
index 5a21a2dd0b0c..f6a5c2ff03bf 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -313,10 +313,26 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	path = chip->paths[chip->port_idx];
 
 	if (chip->enabled && path->curr_role == USB_ROLE_DEVICE) {
+		/*
+		 * EUD virtual attach/detach event handling for low power debugging:
+		 *
+		 * When EUD is enabled in debug mode, the device remains physically
+		 * connected to the PC throughout the debug session, keeping the USB
+		 * controller active. This prevents testing of low power scenarios that
+		 * require USB disconnection.
+		 *
+		 * EUD solves this by providing virtual USB attach/detach events while
+		 * maintaining the physical connection. These events are triggered from
+		 * the Host PC via the enumerated EUD control interface and delivered
+		 * to the EUD driver as interrupts.
+		 *
+		 * These notifications are forwarded to the USB controller through role
+		 * switch framework.
+		 */
 		if (chip->usb_attached)
 			ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
 		else
-			ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
+			ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_NONE);
 		if (ret)
 			dev_err(chip->dev, "failed to set role switch\n");
 	}
-- 
2.34.1

