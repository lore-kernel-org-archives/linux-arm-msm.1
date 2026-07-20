Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A24F3CC7EF
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784534664; cv=none; b=PxpbzFgQRet4e8X8C8xOxc8FuiklRn6pnuGLZ9nx9msgvJaJoI03WJstH7gVDqV/hVqZV/706QVMv836rnzRWbOMXeysgDLLUf7DuMVDmR3Kt4C3ylaJWhloxTBUv4w4AafJx+TMc3v9z8kjJlXX69wSK/MpBHm4mROMMJyH7iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784534664; c=relaxed/simple;
	bh=sBKai7E3Yd6U51Yiq12cr94RwHoduXZSxDW+t2dOViM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i5myPoNN4r3G5WoqCM7K5Zn2Jl2blSfYeJOpW1hUxFPQQj6GE462Pj/3YscpWVPFdfdMYPqp7GO/kd3sbtC6p68w7Gmu/D8WQNeuQ6xXjL8ko6ulmT0mh7DcfBWTxm9wGgZkawn0/HHOz8XTvs2km34KmvrGuBiBNK13DPBfHxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SAdJsA0f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XqoVZd71; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SAdJsA0f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XqoVZd71"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RgF61774830
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jCx7Bmpo4CVRX0C6gLLQG32H6cEbTnOZZEeiJrqNI3I=; b=SAdJsA0fXMRisTX8
	gVuhsMg2w0YDyNaqQFdxPmzW1jq66viAnkO93uoPrM0Y8UTQ09WR9bub79dYGoLh
	XLitIgyuQcKQQIgpWiYZGJ9b1g8uXShmvNu0wE9YWD7eDRExrLqhY8YoVoM3UP7b
	xgZbzWJE4vuvOEJ9OkbPPrk2WqJXfMVBU4cRFCID2DgIdSr/MtHQ3XdyqztecKCh
	9JIr1nW/2IceKShX8NAMj5JAZ7C+5yUiRTcWK41qSs0M1g0xK77ErlbNOOd/+pPs
	Vh/yNKINmNUkituC0alpfbvkP8ikq9KnwIyOgtOXhGdHy9wNz9u1EF/zHst6nLtt
	lXQUDQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2af5368-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:04:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1e6f602cso141321321cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 01:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784534659; x=1785139459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jCx7Bmpo4CVRX0C6gLLQG32H6cEbTnOZZEeiJrqNI3I=;
        b=XqoVZd71deCAMJlT4cnAVgd2FabGJv/Yx3oo7cDqR82VavkfqkUjRnghXTiu5n1eHx
         F9UePf5kDwgzAKViZRn9Q4nt1SJD3nojwLwC+iD3tWla7RsSRhPewMli2RJp7EAqBsIw
         hW5AhtRnBl9C1+kdKPG3PG6hZwOUhKpsS6jAJFU6AeG0BOSWxk2txQt7ixxOdORF2FXC
         BLTgT4SeLakWdIrWQYXHlNG7r4CCPm1ReXZFhXkXzZ4XqSl950Cxtuex+Oaphmycq7y6
         vEDf5eVcMeo2iM60IM28WCQN6gHt8GLRLVa86tmLIGqlPfdnokenyh5TmIdOMpdFJ9Ip
         9TOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784534659; x=1785139459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jCx7Bmpo4CVRX0C6gLLQG32H6cEbTnOZZEeiJrqNI3I=;
        b=GRolk+P9nveQTnStc2+QVvwan6t8Y9J2mD1lfpxYmTmambN+1I+46nnuxbVcjS/ysm
         EgJTfvlVnOHVHXsXg3cpEfugtLEsL01JwqScWJ18yA18FCsousvtjLD9TF5sgy7bt+6E
         fNSuc4+TcxENOb1zxcgv7gleXux5xY+OqHEThyNZ1MolP9x3gXQMEYeotZs0lcLOn7za
         5lINMXgEkYTxxIdHtvR5UIAKsREKEyEQE+Khx/KaaXTzAOle/7C86I3qIgFWslzPN0zh
         aH4z0VRktS7fGcs1XbBg3IsFDqSlA16pcSR+/o6GEMEMMppdfqWO1x0i6egFg4hNQqjZ
         Ql0Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr5Zs9vTc7ibNcDQQeNg3xqT0BF/DBItrmA0wZ+e0TMPp1/+3HxeAJRG33Afo7qonPJezD62ln0BAdVdxww@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjx5XeGKe4OEqx9rPkNV/mB2naVxX6kfZeaSmChIZiqNBUrL3q
	VzWj4UGG91A/VThHi93NxevQbKsHpltYnMSGrOPc6+b1RGiUkaA6VrHm8k1HSIBzrzFeZIjEx+t
	AUy9u/Vh4AAN9Z5WTRYdjzvRri5BryvqUSDlyHmO7Pjn7hDKmmx5+u5sJESqAlKtpA87EyshNyb
	OEXY8=
X-Gm-Gg: AfdE7cl4O42Plz1m1NMOmedRPlFmcFN1z/cBdxdjN/63UgCm5pq1HmSkp3MPZZILSwk
	jbw7bbxXC8TgrvYUZVFt/G/AA0/tihsp1PQ6hk2eOX+Qag2oGztd+w8KMSjHFp/nZsN5GpFeHUs
	dD4T3FPKxpHDVdvUg4LlHr+MnJNoAypHfTW4648FJUNAnZcwPUqNv8m63z+wx8NFaJB6HCPC6Ww
	k+izB2HVVoQVGXpkd0MZrFtp4QsnZijsGSGyuZ0xQL3vd7PXOfZYk0c3yNapqJJayABF+GmyU8t
	sn4eFPV/sWDYLoetg7r0mcdGltYNUvTROCi7d5OOOSo054TWbsvjpuEB7m8KHUkyPcag/Ib+dSX
	VDt6h24cgpzETCYa6CUv6EgAlNFdYz13CxoQhmFQV8mgjVDXR6MG5oheLis9xhEALChCMKJvF/h
	vgT1ha1cWE2Fu/GfGLwi4gFrTZ/OI7X6d7GwdrEnOjFlWWIGiY6aQ=
X-Received: by 2002:a05:622a:302:b0:51c:7b12:120b with SMTP id d75a77b69052e-5213ff50014mr113828151cf.73.1784534659419;
        Mon, 20 Jul 2026 01:04:19 -0700 (PDT)
X-Received: by 2002:a05:622a:302:b0:51c:7b12:120b with SMTP id d75a77b69052e-5213ff50014mr113827921cf.73.1784534658991;
        Mon, 20 Jul 2026 01:04:18 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e7000c3e2sm4256542a12.30.2026.07.20.01.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:04:18 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:04:08 +0200
Subject: [PATCH v5 06/11] Bluetooth: hci_qca: Set 'bt_en_available' based
 on pwrseq power controllability
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-monza-wireless-v5-6-69ec6743543c@oss.qualcomm.com>
References: <20260720-monza-wireless-v5-0-69ec6743543c@oss.qualcomm.com>
In-Reply-To: <20260720-monza-wireless-v5-0-69ec6743543c@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA4OCBTYWx0ZWRfXxDDjOyoFGLNs
 vtnU2g1b3Q3EDxoQ9eQBnVYLIp8jzSQRBBaHTgm0fHjOCXEog1Yic9YOUIsTnP/Hg0PBQdgUZpp
 V5cd1R0/GhMWblC2QoxbVeQU36tAClk=
X-Proofpoint-GUID: Tx6ITgsgilLNPrLil67FmDdVf_W29pqj
X-Proofpoint-ORIG-GUID: Tx6ITgsgilLNPrLil67FmDdVf_W29pqj
X-Authority-Analysis: v=2.4 cv=a+sAM0SF c=1 sm=1 tr=0 ts=6a5dd684 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=kStU6zbECEpzgAoP-VAA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA4OCBTYWx0ZWRfX+SkgEbGHgWg8
 8kWuOYmABz7rzIpnZbpncY1py0tghdZsTASbzDWol6WXuRRJB9vOoY6ZCm3a5Tlkqe0dMyO6/tu
 YobYAIsmuFZXSUqeaCQBYQ5hGFfJGQ/uIZUBiFIlPlsCYp92pqRY5jgy8v/mW9+qeX4aTo92E8W
 2T7WoypD+7Uo7e4tTN0QONCnQcsQwGg44Z/7TbRz9YytMwxY/BH+LtKEdDzrqX9yDIevnQtq/5w
 j1rJzeoygoSEPC3awjK7O04Op9us/xrlouNq0y6L2SSZklmzy7rhDUWT+f/7Uf4GS0nhGvtN2kq
 AkHCMpHHRfjUirnzHafNpKtKq+RI/OAAt/OG9BxXk9Yt59BENvAief34+MUyTKsJFGVbhItF0LB
 t71LL+HBn73fitEiuRFUACi0O+RRc9YQyFsmiOpzJn9ijU3nZ3oDV61v4oD9BWb/GhMvkzgKy6A
 Yto986kBzaYB/0KUMXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200088

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
 drivers/bluetooth/hci_qca.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 17f436484e1e74d1dd690ada22134315abb767c4..81fa41915363ce577ad7c6f25fe1b0a69536d462 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2548,7 +2548,20 @@ static int qca_serdev_probe(struct serdev_device *serdev)
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
+			 * The descriptor itself is still released by devres,
+			 * so dropping the handle here is not a leak.
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

