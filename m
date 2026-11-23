Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430919;
	b=iqzI4qtyY4sIkEjhtu6Kp1OHOWRzPpeQnsl3kzNqPSc61W8NOHAx/Lg/YYJJmfivkvMc
	 lwX8wQcA2Pt5ry834pCCyJ30kodPtfqgaRV6Nvvo4lHgwXDdZ9ydCoEvcjwEeUurjXfYd
	 3W11GCLw1h6H5qfk6GCz9cqTz8iItbaRM2AFZs+ybFI4j9bts8bOPebEb4LRRtxhdOc7G
	 9YtuyHhFRl5bIuRIrCuDDLnhpRB7xdmNNIf4Y/UiX6OiVdWzaYr7YPZ2Sa4d4swV/djbm
	 QdujFmc+5P7mYtdDN0+to777gs19Y9QvEc8fqYvvQDchfIYm+/mgPgCxKaPK13y+smQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430919;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9DuQUkmVsC2nbsYQKE93igh6iDE3a7mvoD13FupPHR0=;
	b=wK+bKfK5vg7JuwFpYBFXcMRdjTQT0v+1McGwvOai/C/adPNajpGWKpZeUkUEhvTTpkD/
	 LYRWQUjEokcB9ivuh0QLXhRsIDglVR4cHhLYiMHRTyF5jl2thuhHAmk1VaAd46igE/iZG
	 GXgLBLkVBmT+B0HiSi+ruhIfPE+OZXjbwlH7cWo28jCs1frCv1AXmsffNEHJ1saTzhsyk
	 iuRi68MQ0gT8BsAl5cZv780UJdkrzfw4rV+Uhefa7gnBcLg+VqZyURlnKdXeIUjbtB+KO
	 /8Rj8w5oaVKo3IFMQI4Pn+6T9jLrPzxGAb7OWtNRAe4XoWiwaDAYxIx1PdXNezWi9sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aixyfQAA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IisZDukj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10225606A6A0
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10225606A6A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aixyfQAA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IisZDukj
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9Fnf72785428
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9DuQUkmVsC2
	nbsYQKE93igh6iDE3a7mvoD13FupPHR0=; b=aixyfQAAzTnHzCSpYwJUdInAifh
	b2IADcOH3PSgNZSUx7AasPdz54I6rkfwVfngJTrXwqFyaDqOboApeP9SDebMpPL1
	XxTQBmWkh0UR72NQxnER+Yt4ACfDMZ8Mft9qfMxRcyS69lBXiYWrwzNRSO3RamZs
	F2ndQoYFG36HjOqV1q60IbOz6W/BjN/peiesUUhbA9VGd+8E5hYUvxEzM9u8utUo
	oVOcDX/SjuGB3boCD3zvpFIFxypBbvtHtKAISIMVvn7SJvYnOacY60FAh+r7Dmi8
	uuHbsm1jIdTpt0mEbCkLfNeipz7kvaRgO8qgOlxdWFwe4RR0t+AxSFajrJQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd115q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:48:38 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so1934488a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 02:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430918; x=1796035718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9DuQUkmVsC2nbsYQKE93igh6iDE3a7mvoD13FupPHR0=;
        b=IisZDukjgMdkwfp86ri11ABle3ubHCz3FAZ3ADC20Hm9v8onFzDT+xBveZqHy1RKwS
         51+9wVTm5WZdcwHU2+YTpT0PkyA6g54jHM3rj60plaFeHaLOeg4+yJvHCGrzTNOqkyDB
         PU1gTqizZYD8P/RtDhF69ZFBhtJA1Nd5M+w7wH9RLUEQHho9ESsDPxLgiesmzsm2N4B7
         inlGQurb6NSaOq3ufVlLQFd7puA5VWNtVAjIdb4ApkF2ykIFgd9lUTYDi52DVk5nHZWo
         cM72XS9iP1zO+Z3ph/1Xk5qYY5/zcVDilIYxyr5fzuhQQ3OiH9UE7usoyYalExnwEzjQ
         JExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430918; x=1796035718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9DuQUkmVsC2nbsYQKE93igh6iDE3a7mvoD13FupPHR0=;
        b=xOj9ixE5xXTyVw7Mw14HtH3ecpIRuGPg5+aSFIsWIw0UTRyJdLbeHdkrZAufuUkVlT
         Vl0bsyUJ0NWuQ4eAtTnOfd6m0K7mR0K4tr2Xz3M1YwKKJxub6VLa0ZRBJtNmzbUbTlGb
         obK2HYrA/hmlYRATotiFaGLkuM5nmEmZMK2x2QHVZz4DzpMFu+xDMSepv2+q+65txTRt
         Krom6VNvLUiUFZDPxKAlwCgC3TH/WWqMtYnio1yPwP8subDqoolF4VF19dDmbeldpBXL
         E66Xv3UZTQPCOhvw9Z9CSRkx7NSvRtue86YOD7J0SNNYe4+jCQjUtI6lipS/+JWA4+qI
         Mfrw==
X-Forwarded-Encrypted: i=1; AL+hErHhQRSNXb+d55UyoOMGkBgvkLB+e76+nD+MxNjsC2hk0kBeC3yJH9yuNri3d/jsTbxpG0bCn9M4bgcicZj5@vger.kernel.org
X-Gm-Message-State: APuU4Z/8g3Eyv3Y5m5KdT1kJIKHAK9LtoCfgaTD07iz+7YheQf1gvi2Y
	CmlnRiFR+6wrPUrZEFu0rKEU0fpdowfk4eDvXW3Pe7+mGucANZ0HJnQfKd9byYsg4BuydDtBL88
	iUQEczBecFxVmJ5ZHKJhFgUDl2a3wN9C+RZkw3jmbOraUyoD1IfwEsjs6jRQx1rkx2F9V
X-Gm-Gg: AZFdTZf+2nAvgnGsyDju+HBAPWeIppxMENXi57p2k2UPb7DLUA1bLMboOVR71+dnqfq
	0H6ponZ83Fa5QcNQf/WV4YHZ9F4VZ4glTosqiYlKQSr4Kvq8hUv+4qDGEafb5Ay8uOQl1objQ96
	ozy4kY5C8oM8/MN1rAwNI14XBgVbsN1XjRBnccgD9raTQJFfHj5mox6IWIpZPyGQUsi1vnNsc9E
	uaFXKooHS4Gisk9Ng1V9lEv2oqG/00ewHC6vhJp1jCeCdPq/jI/fIIgggW05q2bmywpkAtP91eF
	ZRbkKucV+7mLSJsxsnoPDklwuVWpbPQW/CMBmk4dS+sNy2l4TAk5Kt+QXXifVyB3vV+pqBH8ELh
	wspn9xFFQCg355Quii5Myk270tKrVzU0+oVD0GhZ0dqG9G/ezMU2MVB2yf/zbdfEao8t6EztQ6l
	krfp1TAw==
X-Received: by 2002:a05:6300:8095:b0:3e2:83d5:191b with SMTP id adf61e73a8af0-4014c25610dmr9462420637.63.1795430917726;
        Mon, 23 Nov 2026 02:48:37 -0800 (PST)
X-Received: by 2002:a05:6300:8095:b0:3e2:83d5:191b with SMTP id adf61e73a8af0-4014c25610dmr9462402637.63.1795430917261;
        Mon, 23 Nov 2026 02:48:37 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:48:36 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: [PATCH v5 11/11] usb: dwc3: qcom: Enable VBUS override at probe for default peripheral role
Date: Mon, 23 Nov 2026 16:17:26 +0530
Message-Id: <20261123104727.1539149-12-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5ovsnZPwgJVfZzQ5S-gnZ5MmkcFHjU3f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX4+XkhnmG3Z2X
 3FTGjKTt8v6zSnIkl+ctUFQXyZ3mjCDdrqM1yyx2NjYUu018t7SnjMyw+7KgZF1/Iqj5cKtOSEb
 SwKMe6WG06ZIcv6Prj7gxaqZoTeGpRXpQGmzBALd8UY/OqXQInJfDOXdThNEJ0gDIfNfTQSjsYU
 UGokjPbknlKNPKXoGKU2YOQ3H6kuEyPhhkETdZaWmaccuQ9UolAAZVPa/viM0QjDlpyPbvFIhMh
 WwMyEkdi/17xGxeyVD0LhCvIGorMtTuZauo5wuhtj8pVyO5Tc3sRBtexZGie289hbXhuFI9LiZ6
 USFCdjscN7tDGD5g6wrrkW2NFs757s+74jH1XEiXbh53+7Pb1C1eDvtsFfCe85iFBG6azy71aVa
 4zGWvEq8cP8nf0RBvk0hAUapGFHkmjTcI9aM2VGEmuxMVTwknSaTNFFVBpXDDFqu3wSiGuDp8qJ
 qNh/GtUoN0FPUZQ/nTw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfXzLxmpIS2V5DI
 u77cs9VAIuE0HHoNhSOiJ39/dHi9A71gGhfB116V2rBsA3oHn/F4gyWsIwoPY/ufa8ANSmsQpyX
 7NTQUdmud6MIPfwnfpgTjKWZBUMRIhA=
X-Proofpoint-GUID: 5ovsnZPwgJVfZzQ5S-gnZ5MmkcFHjU3f
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b041a06 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=6vjEpHyq_EskaYpSVAcA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230042

When the controller is in OTG mode with usb-role-switch and
role-switch-default-mode set to peripheral, the role notifier never sees
a transition at probe, so the QSCRATCH VBUS override is not programmed
and the device never gets a session-valid indication.

Enable the VBUS override once at probe, after the initial role has been
determined, whenever that role is USB_ROLE_DEVICE. This also covers the
dr_mode = "peripheral" case, which previously programmed the override on
its own.

Validated on SA8255P with an HS host attached: 20 unbind/bind and 20
suspend/resume iterations completed with no failures.

Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 559de5172e61..22b6c7ca0297 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -964,7 +964,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		qcom->current_role = USB_ROLE_HOST;
 	} else if (qcom->mode == USB_DR_MODE_PERIPHERAL) {
 		qcom->current_role = USB_ROLE_DEVICE;
-		dwc3_qcom_vbus_override_enable(qcom, true);
 	} else {
 		if ((device_property_read_bool(dev, "usb-role-switch")) &&
 		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
@@ -973,6 +972,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 			qcom->current_role = USB_ROLE_DEVICE;
 	}
 
+	/* Force the VBUS valid indication to the PHYs in device mode */
+	if (qcom->current_role == USB_ROLE_DEVICE)
+		dwc3_qcom_vbus_override_enable(qcom, true);
+
 	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
 
 	qcom->dwc.dev = dev;
-- 
2.34.1

