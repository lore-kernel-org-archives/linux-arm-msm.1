Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60859423EB9
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 14:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124687; cv=none; b=b/Y2p1o+M9Xz0na7oUp+JWtWj0fb82ZVPVe+dxLI4CxzyMUYqMuR2PhVIRpL6SpBgcB7n2tchay6C/3z5uD1M+6a6mcCkRDWaIBLvtVaNKOhP0LKzgXLUDYcfulOcT/zD1M/dowonSVH1NbG2RAUxPETMFJjsyifeyxpzNWF0ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124687; c=relaxed/simple;
	bh=Os8dAYcamOJnzmJwoFzvqrtNqrNmAEwuEyi9dkHQWvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qg2/3ZmgRQVN+x8baz5c9+rpQsalvY5+XgHsU4B7yqTcsdb2o7AHy/AalEFvp+9q/xamrFmY7oHoI9NRl/m1iF81+EXW/SJ2YdCqJOPsXlxQHUKssYFHyF48WfeG4svOQbOMgZGqnGSIv0sqBMqZt19MUHdvHyWq7maOAtbRTaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XR4554go; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QQJ7KHkg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XR4554go";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QQJ7KHkg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FE3eec3664398
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 14:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XEG8f3Kfr2qhIFwiOsUL7RgFXaPXEOjds0oQ+2XH17o=; b=XR4554gozXNl4XXk
	0h60A5r8VAJ9hknUhtKQVwaY0r4thiDXypH+ok0OXpm/+RlCkphTBJLdu7N/hAf4
	ZDfk4awK3vwNBErdsGXRJJX192OahlGUyrUgCaUi7FlyRHayrpBPh6IY7jpLWX43
	Nq13s2PE5ZmR0RIRbV8smpOFqc4Eq3mrR3BJktCmuor6xK8wrHDLKOvI/6Uufyb6
	ZRLPjn9pSek6eR+u/gBiFDvEGBggqEI06u8wYEvbYXV1hcMItrGEWy6AawmiEc7E
	j8MUcigUPr/sGOzE2lnoWdkohxf5OeopJzEy7f4BB1QOXaE3rTXb8EFSsbqDmaQQ
	lYL6tA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9mm271-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 14:11:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c7f385887bso131934005ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784124684; x=1784729484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XEG8f3Kfr2qhIFwiOsUL7RgFXaPXEOjds0oQ+2XH17o=;
        b=QQJ7KHkgT9Y9iyVvM28RP4Q1dsDEw2m3s+1RNoJzo+FC5p6XL4iSpjMhL3/Zu/5cmQ
         mKu7b/q9pljfsA2MXgKYQlNo12qPI7nY3cM3k05K9CVtgKXBdmFgCg6ufCI4nQS3spxH
         mTxahFHz4EFl0p0PPFWy2lx30l/R6rZqHCRCRofGUjwwYdf4zM8D/ZLen1VSD1GjVv97
         5RTJ8IyLKYX1DMTPDaJIVHawsrsfv55T5/k22grQO894q2pnrBovGFEIp8Hl5x7D0LMJ
         yMj/yp/IVBHWQQ/Mj6nW/5PjfEx2vwdJUCK2/fFUNv0MwwNWm+jwjlZGXbrcCDDDbT8C
         h3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124684; x=1784729484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XEG8f3Kfr2qhIFwiOsUL7RgFXaPXEOjds0oQ+2XH17o=;
        b=TyiQuD4aXw+lGVnV21vmrZBUCQZ6WrZUOoaQcuCNENoKDEU9KyooUCLf27sCd18EIP
         MyiDmeZ1ByVLcg19fZGCpjGoaDUTgg/k5YkylAXbWn41Cp9hImS0bGW77ZXwh6H9zYjb
         4ZyW0EH6EvBcq3QQvhGicIHlTkdUFVNLjwenVOUIl2aNkZHw9nEDXtWoP7cnpMD6HElh
         g5HxWrFRWZNhx5ExH4RzreQc6Ix8o6S7LN5HBQxiujEVNg3vYpBjT6mekfoob23zodUb
         wsd0lQ3fXyKOoNX52T2Vk9nIMYUgZFM9Nnftp7AepTJnic4Ani6964qIuHVX88vYPQG6
         CHRw==
X-Forwarded-Encrypted: i=1; AHgh+RpFKy9D5jNSCc39R/yjfQxA9tr01e9INv/XNPKRzqoGT5Rr/fZatGXG+Rd9F6ESHgxZBln0naYqNAllXi5V@vger.kernel.org
X-Gm-Message-State: AOJu0YxUb+PieJdTPVKqqB4QqR3++5C4phnX4YeBszXzHO6GblestVzf
	o4XXIa2ynFiclGjf8LKdb8w5uadHfg8qMM5HQ4quHDRgYuHnepTzjE5nIoK2ss+XGe4V5Nksfkz
	oH24f3ciY0crwDR/gX7V0EMtfTzgAsjfNIzbcvXhphhgEQqK7AyhXq+EIx/5MBwSXjy3o
X-Gm-Gg: AfdE7cnh0olTfOj7Guinjtj/sIIh1uOhKb88YFkN+ay1mqyd21j6XR4Ty6pnh3hgOVu
	nLaDepXjqM/qHKCPGDJxV2fRRGQM6uDLI08WkeuhzuPwtIZhIlhyHDnLHDe25f26zjXKLTV478r
	qY01VL7bFfJijRSMUaSLP9tEG/gKrBje5hC2IaWfHHpFpODx5k6K6W3ynwM8uY5jxeORimPnDMr
	pF1LEtY46bd7+pH2BnH8QDL53xHTb7TPMy9t+IIk6ozlJoBFi2pmK2wBbrQ6xDT4H7EjDBe1YsO
	C+JKecOBPVfwtMDUUvDbswTNlvzgTRUKZODNQgT8hz8M3Q/3nCFlsp3scc1GsFY32ybH1toum3q
	bCOHJKZhOR+Uk1fKbFeHZkCIq0JPEbXRL1IJObjp7KMif
X-Received: by 2002:a17:903:32c8:b0:2cc:9179:325 with SMTP id d9443c01a7336-2cf03c10898mr26403485ad.13.1784124683997;
        Wed, 15 Jul 2026 07:11:23 -0700 (PDT)
X-Received: by 2002:a17:903:32c8:b0:2cc:9179:325 with SMTP id d9443c01a7336-2cf03c10898mr26403205ad.13.1784124683532;
        Wed, 15 Jul 2026 07:11:23 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1070b68dsm2913215ad.79.2026.07.15.07.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:11:23 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 19:40:05 +0530
Subject: [PATCH v9 11/14] media: iris: Add hooks for pixel and non-pixel
 context banks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-glymur-v9-11-8cf2cbe12a07@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784124602; l=2481;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=eGnX+6v9T5zpKul/tvLceKVXAucGjQ/Ox0wKkhH16hE=;
 b=XTUm0A5+WBQQvrJ7bH3a7F4TVZFJ1E+maaDXdHezHIWQ8ibMU6bR/hhxP9jrLE6Vv74l9t2oQ
 1tAzf8XbjHrCLajDgBrdQEjQDPrTzAVmlzxoiPx2PFNIOZfVNEss1iS
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfX/GK4FPLo1U/R
 NLP5W6x9y6rUp7TCd5Qh+icFETU2epjpFfVvCZsoz9GNusLhAtpC3m4eewx0Iuz2j5EpWk9uSOo
 pFGNjHJxau5F5Gtd053x9zo7Hpy2bP1fuTjK86uxX8muYglK+pV6ybicvn7m2Q7cfW4N29hL7+Q
 Ib6d5aZ3dPPdwQIA0rCRndJx1NpV2ozN61QMBzDyfLAoQauQu2Uyao2z3HtM6Rdm4xpg5v5sSZQ
 xCKGJ9qg4R2OxGi61pbDkHqx3w9rkQNAVtfBH70nCzpEQ+Vg9HqZNbAEKpSlSMG4NoPD/hA/ShB
 2/1+clpZS8FMlaQs9DlocM0tphx53hsAVbPGZMOQpYC4h3nDsYAtHaZyTtfwH75+tRfcyt5k0V/
 Oj7hLamNJPP9aTMzdsJN36F4V/SPUfyQVVB5XhtjImbFqer9ldyu6ipuEbwU/+dB+EZzdHnMUEo
 yVTfXfwaUvxwzrDKI+w==
X-Proofpoint-ORIG-GUID: rNyoK4kQYZOaV32Nc2RgYbkC2MYrLpwI
X-Proofpoint-GUID: rNyoK4kQYZOaV32Nc2RgYbkC2MYrLpwI
X-Authority-Analysis: v=2.4 cv=E+79Y6dl c=1 sm=1 tr=0 ts=6a57950c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=Ysd7Cdeu6pd1DDnCSN4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfX+Z7Kkc/FYCSe
 lPihw+daLxHsOBHamt9wievZ33dKvdr1vuy9NrcTbrNxke1XBDFPXlKx2HdI+D47NOS+sAMHMel
 X6MuYQnmWpdJQqncDjoJpXkMh9nn/fs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150141

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Iris platforms use separate context-bank devices for the pixel, non-pixel
firmware domains. Add platform hooks to create and destroy those
subdevices, and wire them up for the affected platforms.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c | 48 +++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 97563bf89939..7d9d67baf22a 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -399,6 +399,52 @@ static u64 iris_vpu36_get_required_freq(struct iris_inst *inst)
 	return max(vcodec0_freq, vcodec1_freq);
 }
 
+static int iris_vpu3x_init_cb_devs(struct iris_core *core)
+{
+	struct device *dev;
+
+	dev = iris_create_cb_dev(core, "non-pixel");
+	if (IS_ERR(dev))
+		return PTR_ERR(dev);
+
+	core->np_dev = dev;
+
+	dev = iris_create_cb_dev(core, "pixel");
+	if (IS_ERR(dev))
+		goto unreg_np_dev;
+
+	core->p_dev = dev;
+
+	dev = iris_create_cb_dev(core, "firmware");
+	if (IS_ERR(dev))
+		goto unreg_p_dev;
+
+	core->fw_dev = dev;
+
+	return 0;
+
+unreg_p_dev:
+	if (core->p_dev)
+		platform_device_unregister(to_platform_device(core->p_dev));
+	core->p_dev = NULL;
+unreg_np_dev:
+	if (core->np_dev)
+		platform_device_unregister(to_platform_device(core->np_dev));
+	core->np_dev = NULL;
+
+	return PTR_ERR(dev);
+}
+
+static void iris_vpu3x_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->fw_dev)
+		platform_device_unregister(to_platform_device(core->fw_dev));
+	if (core->p_dev)
+		platform_device_unregister(to_platform_device(core->p_dev));
+	if (core->np_dev)
+		platform_device_unregister(to_platform_device(core->np_dev));
+}
+
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
 	.power_on_hw = iris_vpu_power_on_hw,
@@ -437,4 +483,6 @@ const struct vpu_ops iris_vpu36_ops = {
 	.set_hwmode = iris_vpu36_set_hwmode,
 	.check_core_load = iris_vpu36_check_core_load,
 	.get_required_freq = iris_vpu36_get_required_freq,
+	.init_cb_devs = iris_vpu3x_init_cb_devs,
+	.deinit_cb_devs = iris_vpu3x_deinit_cb_devs,
 };

-- 
2.34.1

