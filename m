Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2281A9FA4
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784218723; cv=none; b=YDiGjbE87hTrr6WspdaXB6xlccbWDH1NxbSO+y4aaUN9WZgxNpyYBrWjm8e65vBDkltCX4vj1DtFtcyN7lifvhIm+sKZFa6CAsyhetiRvfOeNR1nJp8wyOiVW73HZ3ADIbl7/g43JL5HIpvBqgOe3ZAtVc9t3iLl883/xXr7h24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784218723; c=relaxed/simple;
	bh=USfleaUVsPGQXLVUjbre3lqCswipT+fDSdHAw6xnKWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bpPD84EjX0R+rkXuSgSEmrsZKet2JOxvVSvOS4AG3AuM4sm0q/8ZR246oWUvc3WSiICNeX9ISZmXpKNo1Q8G7lqTwBo3VRvzuEpTPCTSIE8gRutwbJSHBm9FGGEcfHdt7R8Bx5noymPK8ZBvCF+OpdcuviIq+zzXTgqv0MnDfF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eF7HNDpK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YC+lqfyR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eF7HNDpK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YC+lqfyR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJtYb3043345
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUSdiqJFqg8hwn97+boIemtGgCjGndnT1ZgagmOIPvM=; b=eF7HNDpKPmRuaZx8
	4/5SO3m/WN8rIxWyJyqRFTfL9lRHETXR3kVhlb8C5ztZX8WFv2SBm/TlzxayYyYZ
	TlfMWnXUpU3HZrgPVsdvRLFQUwkU1xFcdnGbXvP/SfM8ZVAolffTKbtAdcpEvNdQ
	vugk7lwawDpVEjYSSZlZhk4vb0OwXs91STcWn/L1NlrFLDUJI3clQdfeQB8rdj1q
	iSQcFURn8OKp8qPFzVBS9JLjcQiefrQttOxtBpoObeSrOZcjYqEuelyiFNZq+AWH
	QY5OmoHodAV6VF3CnnsqjILym/2UpvhfnReqpJjgSPyUnAxp7+4Hi79vSAiS9XSL
	NHhXUQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetcf2c5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:18:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0e702df8so73410211cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784218715; x=1784823515; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUSdiqJFqg8hwn97+boIemtGgCjGndnT1ZgagmOIPvM=;
        b=YC+lqfyRPr+1/ocKvubWH+dlHQnxyk8QyXOFmYpNZQsYLlrMjFl4GEqEYHOaw8HLRj
         Is6v3g1u25bRb2iin5Iy10VpA53F68i2ydF0GA8PNBJDujE6o0YkyKgavciTj2bCH5Vm
         GYARibBAYW5EIFx7GwuGQ2tWOeEY1CGhwqcxvRwAfWarGtkOq9hnmt4QBQSM3ZUgVIt6
         jKF7YT/D8GPyTZEDLjcszL/bM497C46ypNu+V1wE5M4jD2Vs0JBTSI8DJC9zBs+28Fqr
         qtPZ8m4Xe3NhesWFANhyQtyoKwY4gKtmkD7CCf36KVhFudWK6WeUCw+vvO2k1kj33jK1
         7Dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218715; x=1784823515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUSdiqJFqg8hwn97+boIemtGgCjGndnT1ZgagmOIPvM=;
        b=qc7wkpcWOZNea3SP2UOMhUysl7f79cwCWk1uof3F1XwWvfinpqdDI4rOo7CehLiFRf
         pJ0ndsRaDXAk4/w4m+rxcbKHEWIV5uFOCq2UVBgNN71EAadYmVP4uIH4XgdxEyUTg6Zs
         4bjdEiY0L+3oxs1kMfJPb1DXhBVBFb1w1Bw0ZLJU/CKDEURxrox4gMNffkWR0Hwfor3E
         xcLbBemB1JsbgS/H6cDrDY+xUgZQvaznJnfHrR94ALhmwtFepqZz/0lVAOsZtj9eWOYU
         f/yXoO1Z6JeTZQ3/kRskoqWl+ZbtmBnzrBVivjfMxXWDJ+lUXPDo051dB36H08K3HRGz
         NpYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq9CzSusQve0tkokS+l9VQATrDU9zvDHSXmi6xyZIjauQ4oAJNuvLiNYNF3u+VQv8SoTLksSAKPtG65yKBb@vger.kernel.org
X-Gm-Message-State: AOJu0YzhH3ytvQ2IlW/iUrg2xxkUjWOULY5Gpqoq8HyX6Zec4RC6BJbc
	wY0nbdEhXvwdh0NTRlwllDLny3JDt/AUx0owNKollejitPE7RxMpCPFXX0zv33viecKtErBjo1/
	q6qGgC8+LCrU128WvYVcT2F9Z9FccpVv6naFVbg1uQEv5ELU8fVyCRiSpIiglPyRbZ/cI
X-Gm-Gg: AfdE7cnSHqAA70KcT77uKBWsE0Qx0zb+uYIlHWPa5dMlDhKN+7IAVJxPb41GY6+mYjF
	7yMyN3+LdU8KumOEyr2ghmz6qhAN0rwLVHLhSMA+Tt38La3ykxHyZ3Qpg1tijDHPFr3HmyKga0x
	91uTgL5QRRHNGyYvHiLxkiil+mbaPGODo6PQzUsBykEgg16yr3dg/o3yZroKJUDR/C9JuosaIf/
	EBYdfGqoFtSFBltBxqzNbT6Ews8kTBLzNQneRM2fwU3Pa8JEo4g42iOoK6O4MIHCkkRBKPSxyjK
	nRG+UO8QG4UkOeUevqj1z2YnbFqZ0VBDUxCGAlNeQTsyJzPPvpduLOnRuYE4+cyjCHJsDUimPpA
	yQ3c7KUrk0IZU5dlWHR3GH25UURIPNambfr4n2HtE3ED/knt+9cnFNQzd+BpwzmaotCQeXBIBOo
	flC+wvAydKlkgYQN942U0d8O4d1IpQAGDcxAxaoyxVr16vTjJ7jDU=
X-Received: by 2002:a05:622a:190c:b0:51b:fde4:cd4f with SMTP id d75a77b69052e-51e4237cd7bmr114630611cf.30.1784218714915;
        Thu, 16 Jul 2026 09:18:34 -0700 (PDT)
X-Received: by 2002:a05:622a:190c:b0:51b:fde4:cd4f with SMTP id d75a77b69052e-51e4237cd7bmr114630181cf.30.1784218714223;
        Thu, 16 Jul 2026 09:18:34 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168744bdddsm257262866b.48.2026.07.16.09.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:18:33 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 18:18:23 +0200
Subject: [PATCH v4 06/11] Bluetooth: hci_qca: Set 'bt_en_available' based
 on pwrseq power controllability
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-monza-wireless-v4-6-9b02e6f549d7@oss.qualcomm.com>
References: <20260716-monza-wireless-v4-0-9b02e6f549d7@oss.qualcomm.com>
In-Reply-To: <20260716-monza-wireless-v4-0-9b02e6f549d7@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: b24DgPPofIj7Zr98vGc499i4O01lmOCq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2NiBTYWx0ZWRfXyYqhGU4b/GxH
 r8Dri/o0xSaAQ3JkUjls/csgTZQJEVeGyDsEToLiXmO3n1fexjp33f9L2Fkbgsug6wSTNofEwwT
 cuhWD70Zzyl3Kd3iIsUvOS3k6BaQPezJMglxFMXaGV/nQijUCjyXxj87KJ4fC6OtDVpKvG05o2R
 /qTf+b4+jI9mttNRVlrzs0yRkRlZrO0zGPUkN7r3wvjQTuw7vXQmfxX6W8qK5Tcz7tUP35xxN6s
 Vp0V5qqVd/xzVy61HnDglo0P1OSsZGDMYCEcoVOMUxpNl5WCfRALatUyHy6wr9TsSluYlCaFjWs
 qBmoIJoZWvH6EHGm7+eDXtKih5hKmmPYop3WxSPH5Ddj+gSjK8X0coc89e0dncXGjnaf+3izCMs
 CT1LC4mugaSG2CuI+EBVyYZx8iXN50A53KNxfZavBBL4saMeIYyJnB6en+MYX3bcafvuhAS8IvV
 ITg/nG6BMoyCOgoieKA==
X-Authority-Analysis: v=2.4 cv=f8R4wuyM c=1 sm=1 tr=0 ts=6a59045c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=kStU6zbECEpzgAoP-VAA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: b24DgPPofIj7Zr98vGc499i4O01lmOCq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2NiBTYWx0ZWRfXyL6azVW12pyz
 b8iVv3+TUAo8vYiCoYxXkNwy7Mkx/Hfddazq+9na263yBrJP3qQRc40XlGjLnlTDMIfP1DmYpsI
 ABsB11vmU/DgEejq+5XllR3eNplYgpc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160166

A Bluetooth device only needs the non-persistent setup if the host can
gate its power, so that it is actually reset on the next power-on. When the
power is controlled by a power sequencer, whether the host can gate it
depends on the hardware wiring, e.g. the presence of the BT_EN or
W_DISABLE2# line.

Query the generic pwrseq_is_controllable() helper whenever the BT power
comes from a sequencer, regardless of which provider it is (M2, WCN, ...).
If the power is not controllable, clear 'bt_en_available' so that
HCI_QUIRK_NON_PERSISTENT_SETUP is not set.

This is based on Manivannan's original patch that keyed the decision off
the W_DISABLE2# device tree property, it now uses the generic pwrseq helper
and handles the always-on case.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 17f436484e1e74d1dd690ada22134315abb767c4..41e8c302abc2a820022d1783f1fad76b358ae67c 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2548,7 +2548,18 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			return PTR_ERR(qcadev->susclk);
 		}
 	}
-	
+
+	if (qcadev->bt_power->pwrseq) {
+		bt_en_available = pwrseq_is_controllable(qcadev->bt_power->pwrseq);
+		if (!bt_en_available) {
+			/* The host cannot gate the BT power individually.
+			 * Treat it as always-on and drop the pwrseq handle.
+			 */
+			pwrseq_power_on(qcadev->bt_power->pwrseq);
+			qcadev->bt_power->pwrseq = NULL;
+		}
+	}
+
 	err = hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);
 	if (err) {
 		BT_ERR("serdev registration failed");

-- 
2.34.1

