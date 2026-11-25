Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614339;
	b=yAqY4CuK+II4r0+wkkr2cNdnJVbDx5A5Pio9tED1/c4DgyHSgj8+3bSIT0dp4AIktDp5
	 qLVE7v18YRqGW3+EmHeSDwbIRkJ8hgAyeWtcNrcP7AH7GqomIf21eIbHSyRbN25UBeCdM
	 XouKn4NA3cHAaVKmPe+dTuswqzIBf8ha2TrFGNf7sf4BWPhNW6a6xFtST2ijeXz8BlcXu
	 ZoU0qFlWL6jjT0DsvzjBzfjsq9rJj+HXLeRR+ltJHufdlEX8wku+Y88l6bg9bnmE5X4N5
	 tVX1u1E+w8NE7tbHkbvPMEt1seQAaui8ZIz2dmWTA9J7INBG595B+y5T8jFvfeKVWLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614339;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=I5CcyHsjMPRsGo6MKL1jcfK65/L0dFfy3XsV56v5xI0=;
	b=nFYUMtGYVmYdZUjYx4O1I6SYwxTJHq9Oe8PY2obXk87jiIIfZXWGM26dxxEDiC+/5Dkh
	 kScWsaH6WzVn1EvRHb0ZDa6lkeZldmA9K3phlW+adeTLMSXcDQV3VS+hxw/Ruc5GXJjDt
	 mnW+GRdkI4LKdsTDYxILY3lvaVBQCduAp41QIt6rhMl9d85Ewn30j1BbPEOb/vUJXiN51
	 uDM5Y8DTlUqlPdNPUR2lLp/ZK0nEwwBeqquJ34aUhbYOIwhqBR6DrDrcG6DyAIxFRioCY
	 cV7pnh5ETg335NQXZnXH4HNigqKsmhaWmTld9J/Bk0gQPIoiETf67bqIo7bgELgP4Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mgph49aC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pg5A7o1K;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BF6606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61BF6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mgph49aC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pg5A7o1K
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9miSv3642179
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I5CcyHsjMPR
	sGo6MKL1jcfK65/L0dFfy3XsV56v5xI0=; b=Mgph49aCrmkJ6eDtCJLPb1VZwwq
	213BhbodPXryHdS+JDlqE5OPay/ybzN1/8q8Uk7nBVUctMWKncZqyvko2dbKnT1q
	loTgaGadTGCh3T1E1jGzm1cQZ8kg2/+HMsmg7X7dmLypkdHY6C8z5P50OkpwhuMc
	HJp1lbH0tIrMG0og9wDGbthSO3IUqjhXO9jc4KBCODXwgK0Wm7I33zXDnN3M8doP
	EbLfyMNKIKk8o4Lf1/RwwYMLFxfnbGbY6zVKKafSljQiWxk8oRGXUb8UJKAX6v9J
	7RxqjJQH4BefAAZTqsNYC9PRUMgW3fclDU474NI0HrSHnfu3IoR+Fy2cWNg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2b3he-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:45:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3838b531addso552621eec.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795614337; x=1796219137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I5CcyHsjMPRsGo6MKL1jcfK65/L0dFfy3XsV56v5xI0=;
        b=Pg5A7o1KTqAcmdhjI3cCMjkG8sdSrH9bPag9e+eXeIdkFWNKvQh4c07RdPiST7Tqbv
         pK9+1ckevDZgiKmWIi0zvY41odkQVoPVz0xA+J2L/DVQysIfaYUDLqDwQc7GqfSd86i8
         0tu0AbeGsqnPhvj1rQvIqoPBrgmuAnnThvLrTuN4Kgr34SIE+bB2mHFHm1Gsg2RXE1hO
         IENhbcDF7aQawu5Sx4l8N/iLWVuKDvF/oKIOJdb8dXZQUpXZpUfvnegSwAZtP4hLU39x
         wglJ7S0cQB4BHxrdQGAA9bbbycnqZUy0q2bIKvIBd7rQU7QzEuZNPRwK2mQBi7vrgAWp
         DRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614337; x=1796219137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I5CcyHsjMPRsGo6MKL1jcfK65/L0dFfy3XsV56v5xI0=;
        b=rR4HTOUiy/9tWSUy3wygOuHi4urElvACwlrTrj8DAcAMbAn1jVeYa16I78Q6AWYmSx
         OYD1CNqlO0/JUt82/LJ4rv8miWVkacr8vTRzIkCdH262E5xTmiUvJNC2Hy51vIxPfjjI
         rggpiSy8qdK5PQZqTuSYyVZmgi0p79WR0mu1HwBWxuz1zzVP50olh15IDfNMalgia5TB
         MnzRJ90b1DbSri2TJYyY8tQVDmQYIQnEL+ua/xKyWpv0c9YAU3ZLtRxm6yI335PTtgvu
         DQnzvH4nMSLsmCRG8QSK35VSpO+XbrvzOZOCmsoU+0rmuRPx+xtiR05AFuK2SjrnkELO
         ZmYA==
X-Forwarded-Encrypted: i=1; AL+hErFDCRsmT/PTtBg0xtCMyFE+Ql2AM2FzPTZOn3GVz5mexChKG1KMWRRq/02OyENKN2ktLDBvi5JSQgFEw5qK@vger.kernel.org
X-Gm-Message-State: APuU4Z+KOm+6Zg4TUYciDeJzki896bhLUBqJXcsXkGh9qvYPzMwAB9Uy
	Nkd8LtF1eF1D21LtMPD70zhDbhtmWFhJ7EctXZhUrWMBz8YXBATUx75tu8eTaGS054YRIz+FJ75
	jwgNbD3k9QRYk0eCLWusKIJrEdMPM5IsvXbyi/jH6YPTLxhg+vAyC9Vv3f6hptJCSk2lL
X-Gm-Gg: AZFdTZfwGit25UIku+hHXwCUGWhD0iKjqq5+A+h8Rq5zcFuJ8FYyLRTlzd3eu4Ip8Eu
	YjDn7oARt8KCH9CIB4bI3HyKmEmNK9W/vPqnJLcdkzRDdFI2ZC7sZybQS9PEKpSnQVYvN41D0Ab
	cm+8sapfrAudfPH8VuDixSMsh4L3Xrg2gFyvlV22Eo1Uh+AMsbzx2VvXdY17WsUK+8hJ0jZ34UI
	nbHn5EnVVKIXBDenAmAEgMoPrkodg4m3VmAq63fg7tNkhITzptkotXuzL51z4NAN51wqZQFUvIp
	zXF+z/x7PBzKpCZA865DXyisaupcuZe3etbKqGenWmAqy9QLbP7pC06dEwNoi7q1BYlLqPoZEhr
	e3SbeZBtbROS72mATmSssLLAs3mEKmIhxYWFnVjrcb8cZ4V+neO6hg8lw/dzBf/Y72uqRjxZ0fs
	w218fiwLf65qgJ5EEG3VqDRJgFyWsaQKcwQEXPFeIozhV/UEWaKJsvnLJlYL5Rp36jQw==
X-Received: by 2002:a05:701a:cc90:20b0:146:ffa9:2117 with SMTP id a92af1059eb24-1b5697a0445mr18891259c88.1.1795614337138;
        Wed, 25 Nov 2026 05:45:37 -0800 (PST)
X-Received: by 2002:a05:701a:cc90:20b0:146:ffa9:2117 with SMTP id a92af1059eb24-1b5697a0445mr18891175c88.1.1795614336326;
        Wed, 25 Nov 2026 05:45:36 -0800 (PST)
Received: from hu-ninanaik-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm68870217c88.9.2026.11.25.05.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:45:35 -0800 (PST)
From: Ninad Naik <ninad.naik@oss.qualcomm.com>
To: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Pranjal Shrivastava <praan@google.com>,
        Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] iommu/arm-smmu: Use pm_runtime in fault handlers
Date: Wed, 25 Nov 2026 19:15:27 +0530
Message-Id: <20261125134527.2427608-1-ninad.naik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806-smmu-rpm-v4-1-8183d007331c@oss.qualcomm.com>
References: <20260806-smmu-rpm-v4-1-8183d007331c@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06e682 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=zxn-vXfs4R3W1Tx4-PcA:9
 a=ZXulRonScM0A:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: biAGTNndQvPk06SOqY_bP5B_onDP6gDS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1NCBTYWx0ZWRfX7Hlu0i344IGH
 XSsN/I6XSYcWjwo8jLXco0un5dE3hCSp96T+E8KWF3uz+DThVaAyXh4Rtja0Ql+mNbjJZk9Kym0
 CYPbEuprY5FE0GIyuQoBwkleqK5Tza4M95f+DQPiKk+wYSthzO1+az6bB9kVrEdKZbEERsSioas
 TLPb9hk0Lfs6WPqz3N9wLMDm3sebMZHze/SdlY6l9niaRgklbUL5Bkyw0jTkv3MguOW3koDCFBk
 yqph9ZoiHrPLlupaglJgbYZyCB1sudEQ6rAKMGo6/smbQHErdU4izDy39OePe+BQmiILxnM+peC
 M55CL5PqXtat2I+RpMdEgc+Jcg4lkPRxeeAO7ch5qmRs1SnISgZDRImmWzDCDgI403tBJsMhcUe
 UZOtqE13OtwHQQliNGx9s1SHrZPD+8Z+3I7QOv2HLSr6JebdlFahQpanWLChJslkuT+YW+jm1NQ
 abpEGQeFi6pPq6f5iMw==
X-Proofpoint-ORIG-GUID: biAGTNndQvPk06SOqY_bP5B_onDP6gDS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1NCBTYWx0ZWRfX/E3PXhJ8nq5e
 yMu3AL2tOrVdkjmbdq2o6xY53oRpl2YSXdOZ6+hUSzy7qsgryXqRnu1TfuCQ1rcX+t2a5SeVeO5
 Vp1KL8lyKLaG8Zx9g/2UpCVaVlTtNQ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1011 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250054

On Thu, Aug 06, 2026 at 03:52:41PM +0530, Prakash Gupta wrote:
> +static inline int arm_smmu_rpm_get_if_active(struct arm_smmu_device *smmu)

arm_smmu_flush_iotlb_all() needs the same treatment. It's called from
the iommu-dma flush queue timer, so arm_smmu_rpm_get() there can end up
sleeping in softirq context if the SMMU has suspended in the meantime.
With a firmware-managed power domain the resume actually blocks, and
we see an RCU stall:

  rpm_resume+0x18c/0x768
  __pm_runtime_resume+0x50/0x98
  arm_smmu_flush_iotlb_all+0x94/0x118
  fq_flush_iotlb+0x3c/0xa8
  fq_flush_timeout+0x54/0xd0
  run_timer_softirq+0x28/0x50

Skipping the flush when the SMMU isn't active should be fine, since
arm_smmu_device_reset() invalidates the TLBs on resume.

If this looks right, can you fold it in, or would you prefer a
separate patch?

Ninad
