Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BF0442119
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785420542; cv=none; b=jZSYCrkHBt3F2IcmVtTz1dz+uLdamGjRbEQfIXFU/0Q5qas/mwifIm4U5rLpY8MufZlCyPhIgQBIfia7vUc7ezeMnFZDtbIucetaYxaSf2E4EJ7GXFIuLaP34QobgsY7Nvdezziq1ER/cM0SQJ3Cq/ehOf+tyHgP484BOnvLTxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785420542; c=relaxed/simple;
	bh=/YRhreB7+8RllpPwMU235VmXR8Hl0KzVLvYw3Tj+GFI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EUKj7qJZVmr/MjnqpPUtI3gME3NYTdzRD62h8ZtGcNsgDZSkwSLl5uqMH7QUsF6jCWop7bqCaxqy5ugNZPnfTBXn1Djl1iPS4fGe0kMOMNuyZrTXv9g8WhWlR50ONZObqww8wDR/6Mh6kTcoktxCP13L2npKaVPaRQDCBjXM+uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=clwoAZe/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UZRWuLxB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="clwoAZe/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UZRWuLxB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDtg0Y1201912
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vWbudVip6tf
	wCXbNl1MoSJC4dGsarPaP6arNMiDp9Rw=; b=clwoAZe/vtpB/JpXzUlm2sYEQR7
	vH0XmOt4ZMUfH34Ls6Wer0be5HioxD+/r3gKvglweMMOTVAjzkS69XaSLg+L+CrD
	d51+++Vkk59OyF1pgIXlTTZ/ekvVAstZyFZwzlMhcSNBtvcLP7Y5voJFXfaw4XLE
	E/fW3lHZPgDCpCCtUGLLCPPox4GT6vkqxI4ufHviGmE6WvjHKuEYezt9w3GSwTuL
	pAdjC7miyul4yUNJdh4c0p8QFl5uk7YnfHBRrvLGUBRprJbOlnRz4O7JZOl+m11P
	r35RXIxSTCcNMEbjTLoHLJr1oWYRjXI1Mhzdh3LvrHKnB48Os/SM01Oga5Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr7x682a4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:08:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8eac2620cb0so22857886d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 07:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785420536; x=1786025336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vWbudVip6tfwCXbNl1MoSJC4dGsarPaP6arNMiDp9Rw=;
        b=UZRWuLxBBXyvXI+C/pmJTZRGcMAktdeW94ogunYlGrSpNd3X+36d4eOVlay+xSorHh
         1vxWvGGcWCIVBQty9ALZA+01AhYK/liMecRnXvpgrurO5RUprDCDIU5HDIaWFMNmw5IP
         6va4UhC+WRL6p3X/LUheh97JB7hQ/6iVSoF+JpmAaWlRL6dkcujyXkS7873//cpuyR9i
         /m5cbdah3WMULH+TknxJZ9noJ4w4ZoM4+Y9O6Xelx6+2GQG2RLAH82VKJ/bOerO9Qczc
         GxF7vwydRgKRdntSgTmYrIXljo8k8GsWKKZA1+9ySKkEMUribrU44XrrTjFmZxwqKAWt
         P07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785420536; x=1786025336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vWbudVip6tfwCXbNl1MoSJC4dGsarPaP6arNMiDp9Rw=;
        b=PDsE1WqiQYSpqvdjg6nu8tT8t+6rdkfqFel64RVCchZIHI4Sj5gsTIHby7tYSA5PP4
         7YN6dI4bmg1IvmHrwlo+PUVxwthrNoTF9s+MnW9PUPvfzSJJaXWXdn2vpo8tjLEW5C6q
         ki8H35dLppLzvmlwADh83jFGvsgVesfJ2U05vNw3UD5C0c4G8K9K+8FVKycj+41QbLzG
         hMFWDebo8qIN8X0V+o4e7iB+1++Bk464JEwxruVNlZESTVHfg+1U48BY3lNEqVzKzpon
         pn1JBPmEmGev6wotJMNwzHhIYPHgbIq9i5e4ukg5NZLH9JYUE6PsgBvUBG/cv6FsxZ/f
         G4kA==
X-Forwarded-Encrypted: i=1; AHgh+RqROw7gUwhBis/Q7pkjDVETa7bLQ1mQM1t7wEQjoBvbe9Aop5hh5LhEfEK49NnNFKd9sUoaBoU+7FCSIA/N@vger.kernel.org
X-Gm-Message-State: AOJu0YxvB7pSS3wOf9xCGwDnHExA4InCMCaC1TSCJ4k/dReaACtZj0qo
	RP5Y5n9SXWrpw+OwApHDyzxr4+TG86gnlHCLBIlZ2JD+eRx7cNwG/p7qEprWr9/eKJnOTQF0IXT
	zhzowqZh7jqDaNjL/L4VCbF0q2yVdVpWu2D/1VXQ0046NqEDyYS8zZ+VFveHaJm6CNqlb
X-Gm-Gg: AR+sD11H+/2oIkhZvzFIVQ49ItudqtALclxQHnbb/Lpcjg/T4OLdIvzIoE+DDZBOvxK
	7mM7gQJEeX+EALmWm5GnvEWQDKL6nFEb+fM1iD3dOS0qA6ceeRp0GU7PR00maxLsCFaI05YieJx
	/r/2uY/H7jCnozaennoXXyDFhaRjuAVin+jJSnUVuq9IgfWB8JeC7YaDJ89ec2zHVKqI6XUPz62
	cqoKQppHwQewzpejYP7elgEC/Nf71GUJo97MFY5ZcsycPGURPgRqNU6mHToF4Igar5vrNcpyTXJ
	T7R27YfTdsjek82clL2m23bWJUidm68DKSNT+awPdncGPl8Ogr/Mzdutln54jYzHL4IP21dyeeT
	T8cp3AAiA77pS4I7QbF2FBBAp2K17N9w=
X-Received: by 2002:a05:6214:3003:b0:8fd:6df3:b37a with SMTP id 6a1803df08f44-90834808b7dmr26856156d6.62.1785420536108;
        Thu, 30 Jul 2026 07:08:56 -0700 (PDT)
X-Received: by 2002:a05:6214:3003:b0:8fd:6df3:b37a with SMTP id 6a1803df08f44-90834808b7dmr26855526d6.62.1785420535609;
        Thu, 30 Jul 2026 07:08:55 -0700 (PDT)
Received: from hu-neersoni-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908325186b7sm18465826d6.43.2026.07.30.07.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:08:54 -0700 (PDT)
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
To: ebiggers@kernel.org, ulf.hansson@linaro.org, adrian.hunter@intel.com
Cc: quic_dmukhopa@quicinc.com, quic_rampraka@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_gaurkash@quicinc.com,
        quic_sartgarg@quicinc.com, ram.gupta@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, neeraj.soni@oss.qualcomm.com
Subject: [PATCH v5 4/4] mmc: mtk-sd: Protect crypto capability with crypto config
Date: Thu, 30 Jul 2026 19:38:22 +0530
Message-Id: <20260730140822.1976635-5-neeraj.soni@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260730140822.1976635-1-neeraj.soni@oss.qualcomm.com>
References: <20260730140822.1976635-1-neeraj.soni@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0mnDAezBfn5QJP85md0cvcPVpNQuhOdB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwNyBTYWx0ZWRfXxuQ0y0a5AQ01
 iqBBpRgdp/UvNi7qerxlj3Y1oBmbVgoOISsMTRH6kXryLUgPFN1bmsbmHX7gITFVPnpmJ+Cy7Ki
 /Kv8pd7HtuqQ6Ihcb2kxUbauSelsH7Z6zRSxfloaHPJFqAKnaNvCVf75AX4XYt/mn6b0wzLA8Fb
 Gj5jDVwnKaE9x7gh3pq0xKGUoM0Ujw2/1yY4WVneak/MHO+qUCgFcQlHr7MEuRW/h+AkuYqAzzr
 31Fa10ES7+EVSmb9AmrmUNnfDS7GF/dz3AzylbmKh3WRmdmPz2yTybWL+bLvCDBmYbthA5twvBi
 23Szxh3yD3EjGXRZ1QvkCTAc88mJvLEuwCoZStWSmr8Y+ewPkFWhONWYbs7PqhDI4+jHsgf43Td
 JKJNuVC0x7pThg2B9b0tt2M7l5sH6c9YNOpbcr9GkoG8SqWrb0TNlE2rTw+hDFlFfFkAYMsEySd
 kQ6M6fSo0/FLri8FacA==
X-Authority-Analysis: v=2.4 cv=cK7QdFeN c=1 sm=1 tr=0 ts=6a6b5af9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=lTvru38uAoNiiYMj3kAA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwNyBTYWx0ZWRfX6mR0FLSeiz5h
 wLXx9ecjI/3qAAd/x6s5OuzcGHsCnjAOfEgQAH95xL+bUnEgNgBs5uXzHSzA3+EBCgwG+1bdjW8
 jTctdYQoHcmxlLGOeRNGASFN2xvKuZU=
X-Proofpoint-ORIG-GUID: 0mnDAezBfn5QJP85md0cvcPVpNQuhOdB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300107

Host crypto capability can not be used if CONFIG_MMC_CRYPTO=n.
So set MMC_CAP2_CRYPTO in mmc->caps2 only if CONFIG_MMC_CRYPTO=y.

Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
---
 drivers/mmc/host/mtk-sd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 01ea3adbdf3b..c415ed97e3c2 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -3031,7 +3031,11 @@ static int msdc_drv_probe(struct platform_device *pdev)
 		if (IS_ERR(host->crypto_clk))
 			return PTR_ERR(host->crypto_clk);
 		else if (host->crypto_clk)
+#ifdef CONFIG_MMC_CRYPTO
 			mmc->caps2 |= MMC_CAP2_CRYPTO;
+#else
+			dev_dbg(host->dev, "Enable necessary crypto config\n");
+#endif
 	}
 
 	host->irq = platform_get_irq(pdev, 0);
-- 
2.34.1

