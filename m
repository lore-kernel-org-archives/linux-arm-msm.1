Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F50C4E80D7
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 15:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449940; cv=none; b=bjoFTVKHCjyhlE9CzPqzWgpBGJAz8ZyKpx4kRpvzcEdkZjQH2cvFzAtjVdkK7ocj8psOyTJ0fv5yXv1r45/h2hMNhAL4oHOwBi+rdfjPPkjtuGFCb+mixWVha40ScJB5uj7lMjzVwFr2uhoUR9vf1SPR0QE6Q+s5guEThpd99FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449940; c=relaxed/simple;
	bh=AjrT+2a1V/dFdE8w4G6xJN78eEUrW3q4ENCnkqhARGk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fTzgu4uki3peVU33jfX6tVoUXIhmG5uNFT74N8MCXxqRIe0T0nG5sXLlPoMwGHViTI4abm2jaL7QW4n/J584SKrElUS0F3hIM3atnqpAxYJgjOHnDbT+vlNY91YD03T3alqKszQvQZiHr/P/AY12U0xEDC4KwmjP02XWt1/PkKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CHQoWt93; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bZyDFoOX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CHQoWt93";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bZyDFoOX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DANlh1314609
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 15:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=h4izH85dY8s
	43dZbZGemk1SbK5CBZ3ueMd7xLjwebE4=; b=CHQoWt93bSf5i1CuMopCg+AtkSZ
	np0nNaMAjZq9Lhyf01UtWo+mkipkhjbvnO+Yi3vcbncBI65hCWZFIBQR0cuPtCN1
	L+zSChXLIx92RG45YnSRq5Qaj11YMMj0bkvQeJzN4ERaeIiIczrEbOb6OrbyAJIX
	hFDWYHQwtyCK7DZVY5haz/Mw3Go9ePnkYG71zSfb+pLPQKxmqYXgfn6zo5QbORsg
	YykpkywNktjDXsX3LUPXbU1uXsMe/b1pBFOniruSsGpAvIjLJe8kTkESQe+sjlz5
	mi/gPbU4eqMp0Wd0FmRcSRuCno79XaIS5umo+P9Oh7yxtofDTfAnAwRz3wg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdnd35g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 15:38:57 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-85722fc5a21so3632873b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 08:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788449936; x=1789054736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h4izH85dY8s43dZbZGemk1SbK5CBZ3ueMd7xLjwebE4=;
        b=bZyDFoOXL5Jdw04dFMqt/tujrzIpjkXVmYagFihDUhxrJ6NDnX5A0QmfXiqMxPR5Gp
         FfBDlu3nq7zggOtkOm0OOQW+dRpEBsajFyiQIFXfH5V0OaFt1Z6IcYqwKF7aFy0ajOYq
         3yEOZMsLqUXZW3NJoQiQ50ErapM5ozv0hs2t3UjLv9MlwrwpEJN4Tw2S25jfyJgYGkb2
         pq+Q40zOjLQS6y3fbvYjGjISdFgFXngIa7LgXRD6YxUHr+VBH+vU5ozZPE72nkBNE3Jj
         BGTdhzK8wSEHowM4SqrHREkwf65qe1rWnUhvVorlDlpstFRBf3PGdYqsywWbnAcXWnJE
         yq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449936; x=1789054736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h4izH85dY8s43dZbZGemk1SbK5CBZ3ueMd7xLjwebE4=;
        b=QOKZIAtkz9bwt6LuWFiHVrCl+GceeETxqqYjOtqENjXv7n4eCI8ZZKp8Z79eOQXLtS
         1z/H8BOSQdC2g/lFeuDbn0y8rUgNvvMBbLRcQIahltlYMEK4MHAokomf+Xs2qCLlXJZ3
         r2J1qGF0BDH5qycZsoqjCKP6xWneB2+ySIN3mXrUjOUhgaWetdUC0RcRdLoy7c+ELIph
         3LI7XQn7GxR2Nodi+j3Fykk80LtiWdBChtYfx6v8Xv8BHP9S2Rh+AxAcdqEdkROHWYCn
         L3THzhrS8kHvNwDvT5oMMzi0KMXUCmhrrMLnCx0iyou6n/kfQqLZmW/2NDOMaXZ6iRlI
         bKgA==
X-Forwarded-Encrypted: i=1; AKwUvBwGw/uiiWL16xnWJLUqmp0wSQVnvOCIWo/xYHFhUNBt9U8BHcIZaL0iseHDCUgzy+h5ateTrPrXdW1O+0ny@vger.kernel.org
X-Gm-Message-State: AFuF++kSBta+uXn4lOcOiU3b9/PVLMeTaUzlJ9JUNghAp0ckj2fBylbY
	1EhWCBksU+hgEkUyZ5OdfTvNqU7MLlMXqIUEvkzTrHvrFmGQSP7sb5ATnOeQGdFplppXky7cIjI
	BGpIT0B17UWu4LttdHCUu6YmFoPF1lV082fswk/IlKyOILFhfimZ9cExXEOUseylMUiAC
X-Gm-Gg: AYBFou1mPi62beJ9vS7NnmxuPljXWXqCkm3R7CclYAoYVH7Xefu+a7fmUO9VC4i21dc
	iF3EyVxXGFU23+gqjleOnq5150GsEPCkVpRvC8eD4vly3LzCHoEjZNA0nKDr80wDzHSFSss4Lkl
	1cwQnGMu754bjm+Mk/wkRqW3QnpfgrvRQtHFNndyoycb7cd0KmJRuiQZ3VnysauFOgIYV9Gfk/Y
	H3Uug8Qc4BpHRglmryLJAE72Qlr+whzN16HQLYslfOoxtUq+X6yFR2tyQplUK0V0rc+xi9YGYtM
	0cnaEelxauESnNpDVM2aM0L9z6PWQODgNsDjsVfZ+h6SWNbK5J1Mi6Hdu3oA8Clh7tDDDUgNCF/
	LrZQKzA4sVwHUcqI2gy9m4Z1+IkUV2feR
X-Received: by 2002:a05:6a00:27a4:b0:855:eb7b:5804 with SMTP id d2e1a72fcca58-85ed5ccc11fmr18834176b3a.4.1788449936515;
        Thu, 03 Sep 2026 08:38:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:27a4:b0:855:eb7b:5804 with SMTP id d2e1a72fcca58-85ed5ccc11fmr18834103b3a.4.1788449935994;
        Thu, 03 Sep 2026 08:38:55 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153027951sm81069b3a.40.2026.09.03.08.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:38:55 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] usb: host: xhci-plat: Support XHCI_RESET_ON_RESUME via device property
Date: Thu,  3 Sep 2026 21:08:24 +0530
Message-Id: <20260903153827.3463313-5-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
References: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a999491 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=A6Vjp3zFaTA1NjdqV2IA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfXyzC3bsUV2OCR
 SKNsGssIIaqQ9n1I4mHy81rXzLumIGcz7ijOkOclTMRS1brPau1rVtIIfYJuHrqVRkVAM3e6irp
 p7oYVrH0gfGks0n4PavqY6zI52iYxqA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfXx17yPNGQ2tkV
 tBg0auAwa/mt1zw126Dz1qF1aRVtyBlkMVvhhdBFjym3BC6h4CNqHAONx9tUQwHY9L0wGPZhDPH
 5yW9EIOl0j062uQzZ5iy5U1ZIbjsydo5y37nG+2X5Yi1V7QPnBPLujVwN+ee+AYLA8KZhGpn1HK
 bUGdOWD9394NsZxABiDkFoDVLoHPFa5BTBT7VfnpULGO45ryBvY+vdPKLifYsNMgOjaXGeX4IW1
 SoxlsIeglrCyarkiyU0xh1I1OWgDeLJ1U73VqFOqzwC0aGZdo+ez8ziwHIpFMQ2uMaFx7UQ2K28
 FhjlrbZDGNn047TJNgBzIXFTZrcFpdccJIushrLDLjNi4RcuyyltwRJPpQa+rj7Sv7BSaE9Dz6s
 5RMf5uh6k0Z1+I90Oi+p+xXa0fuyh+6iQxDE3JcpAKeDdVpJCaKgoG827qqD/G+tKMgfSl1Jjit
 YFWwTrW18nEsuA9FLCQ==
X-Proofpoint-GUID: aPNltra4DwyBeZYKvG7PKHDjq4SZN68J
X-Proofpoint-ORIG-GUID: aPNltra4DwyBeZYKvG7PKHDjq4SZN68J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030136

When the USB controller loses power during PM suspend (as occurs
on targets like SA8255P that fully power off the controller),
it generates a Host Controller Error (HCE) on resume requiring
full reinitialization. This is handled by the XHCI_RESET_ON_RESUME
quirk (introduced upstream in 8b328f8002bc).

Read the "xhci-reset-on-resume-quirk" device property to set
XHCI_RESET_ON_RESUME. This allows parent drivers (e.g., dwc3)
to enable the quirk via software nodes.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/host/xhci-plat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 074d9c731639..7df2947d13dc 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -277,6 +277,9 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 		if (device_property_read_bool(tmpdev, "xhci-skip-phy-init-quirk"))
 			xhci->quirks |= XHCI_SKIP_PHY_INIT;
 
+		if (device_property_read_bool(tmpdev, "xhci-reset-on-resume-quirk"))
+			xhci->quirks |= XHCI_RESET_ON_RESUME;
+
 		device_property_read_u32(tmpdev, "imod-interval-ns",
 					 &xhci->imod_interval);
 		device_property_read_u16(tmpdev, "num-hc-interrupters",
-- 
2.34.1

