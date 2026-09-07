Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ECC448CF3
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 09:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773367; cv=none; b=NiYKrgs+HTEjw9/mkZF7ZDdJ0OCl9GeXHylGXYzcJi39TQlqC0g05QBeK0Ay+zqX+M2j5cYFrvjEiDrQwSX+5s3GlBPAuqEh9IgImjyJueTI+osJbcw++sNFsAIOYlC9yB7Lg3l/09kplyGb6ln8acTF6DlFdxGEwc0mCmFMv6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773367; c=relaxed/simple;
	bh=LslZmHiFw4eXcjoqHRbytzcKNjsZS+rKv5x/W1EAPV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UEkgKXL9TydPqU49X7CIf33FlBwoxDV++kd6q4iD2tV4Ut4SIWOzt1qLWQbfPT///je263D7ParCnVFxnnO2SEsYLixwo9NB2UVOE4BUV+/mDJYj916bXL+Y+TXBuQQtRxLuwEtLij/jfFkGaED9J4E0AwVvRxWuNKS9t+vqhvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sxg5vOaX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cUiMfAXQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sxg5vOaX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cUiMfAXQ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6877osx63657422
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 09:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/7NO8TOpBC2qx2KaYdX3mrHnbEjM6bfcjdRZslwa4oc=; b=Sxg5vOaXl4yHp9ak
	QkMnja+2wsqotlO3dDUwkra4vczbz7Ev/CcqAbm40LVbKYlgKsTHwvb8z6C0/o7h
	eB7QwackLvWoiC646JLlvZ84ZdmHg2ex8+OkpQzNJlHShG/ekV79LZuoNyUBlxs7
	634PQuHtDLyYCiQ645RPx3FNQKb1eYexavNg1hGf0Aa63gQ5FZCzjLnj+nu0NhYA
	1IuszZGSDf/ptWYBo1sI6TErjRsCgNrwVsDT7aY/XfHDA2LqJm/vU6DMZEGDGewq
	w0oHdv0jfrs2DOoqYb2T1grGGzi+ZHajUq4rQrilRkUMQa+lTXqs7LEfKpvGPsXq
	5v78cQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghs86rf16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 09:29:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d9336581a2so55283735ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 02:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788773361; x=1789378161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/7NO8TOpBC2qx2KaYdX3mrHnbEjM6bfcjdRZslwa4oc=;
        b=cUiMfAXQV55SFMow8ekhaqCMvBalLqc680Jpuxv7lq6W7ZkVMM9WlovRnSdpjzyN8L
         kDo23k8ixEu49ZGdhtTf49wgdZU25QXAB0XRy15rG80OLDbAvqBwG9BT3Ui/ZhPoSkGU
         5o40TNTIWCnYGeI6nOg3szMY7ecWrZbM7SNJ6ifLCAdpFh1ygzFA20SK0xRoQb8gSsK5
         b4eEnPrLgvGmEIDY2S835Qs74g2gO8O1dXaEzqHIc3uwSgcSZIbAlI4aIjrGasZvFodB
         cYu0hgRDaCdU974bvxvbcrRz5IV9jmUI6rZK4ACMA8mivfi3VTh4OXAH6y7FhM48zsjw
         Vdeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788773361; x=1789378161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/7NO8TOpBC2qx2KaYdX3mrHnbEjM6bfcjdRZslwa4oc=;
        b=jRJzqCS6hP3PBQAgSeaDmJKW5tc6gVQ0Li80IKa/m+zraFEt2E1A98KqSdczgL2Nm4
         cMYIXrG6jzYHriXPoWjFWEMkhKyvu/gtisTxNMLic74BFP1ASR9FnKVXVIYbw567k1CN
         Amz8nEkrHatTiHwEOmjNCayrVoRzezWj4BH9HlsMJvL9lfbwBetUZuK07UgeQC8XLx1o
         2ZGPXNcXA7mGeWkrhr68Sp6dx20uC6GoHJOTnUQ2n/GuQhGg4TE+V5hsJuhhKMYL6W1K
         L00YIGgvxdyIoHPkjtXW1v+VNMEBZG36Z7PBUKtjDJ+X1K15MS2c9rvzm8c6nBRIMqZJ
         x9GQ==
X-Gm-Message-State: AFuF++mCQBbWOVnPhvFd9+MS71H5GvFG4/xhdPxgBMi1DBZ4MAZfgfcJ
	3ZX0Xcc1l3RHhqf/4/ITDJw1C47CBDTvUj8xzlWC2g4H2e5JK8Jamud2FJWF9QRnxEJnG0MRmim
	fGqOaXdkDB3/4MOfhYiXEhKZuYWjvTFJ83D8wGYhQO7bD9yP53+x2v2yvlAQ7qOJTQDKT
X-Gm-Gg: AYBFou0Gu//Rd5X8l+rumtOs6UDc4t2+RFSvWUaWcerkZ5ocPshsYbS0ksbc54MHvOM
	Dxc0zAzOvWgJ5XJ1Rj3mJPIfSDz8Mcj9ugy2AODdDw5vQ4NBUVjl71HsYPnj4345rG6UweNV7Rm
	ASkm90lisw3EG77OHwTnH33R+TGoIvJ5UHGcJp/GZmKc1ogEAOEruE6Yx/SM0wOCFMuign+wYgx
	IHQ9IR/MgsuRi+Xdfgm6YB0tmQ1CUD6NJS4VLaRnuOR+daudnyMktmT9sTnJfUF1WHaopHeS4Ph
	+O0ztPIfQWgpg/wCIi22ka5XKd/SJiM3RnSo6t+OWb+64tDZKcVs07mwuLWYqfQS70kjObrUdT+
	YB7DF9XhaYKOFQOgr3C6zFF/Md7q2+j4LxQ==
X-Received: by 2002:a17:90a:d644:b0:398:9c00:29ec with SMTP id 98e67ed59e1d1-39b26245cfcmr34204111a91.20.1788773361348;
        Mon, 07 Sep 2026 02:29:21 -0700 (PDT)
X-Received: by 2002:a17:90a:d644:b0:398:9c00:29ec with SMTP id 98e67ed59e1d1-39b26245cfcmr34204062a91.20.1788773360958;
        Mon, 07 Sep 2026 02:29:20 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338778fb926sm1627830eec.31.2026.09.07.02.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:29:20 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 14:58:43 +0530
Subject: [PATCH v2 3/3] MAINTAINERS: Add Qualcomm TPM driver entry
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-tpm_qcom_driver-v2-3-71a6b1752da8@oss.qualcomm.com>
References: <20260907-tpm_qcom_driver-v2-0-71a6b1752da8@oss.qualcomm.com>
In-Reply-To: <20260907-tpm_qcom_driver-v2-0-71a6b1752da8@oss.qualcomm.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: egRlvkIVqrq3RtDXvKuocnYVLgyvsbzd
X-Proofpoint-ORIG-GUID: egRlvkIVqrq3RtDXvKuocnYVLgyvsbzd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEwMyBTYWx0ZWRfX9ICYRYIN20Gf
 Onw9vN5RtFpwezp8iIYe7KEn+d4D4hDk5tHiUBNeBxR4xfOZZWVGlTp/TPrTTiJUNnkCgoIyxTR
 2run1rNNOHIjgqVgfKUWS639vNQ2hVA=
X-Authority-Analysis: v=2.4 cv=LseiDHdc c=1 sm=1 tr=0 ts=6a9e83f2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=sADh3fXFaV6XPm21ZS4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEwMyBTYWx0ZWRfXxvs0zgCLlrdh
 zQ02EDIfTXGEgPORpMXDj9QUZYMNi1eDjRivibNvdS2ERGPS5I/S8dNWO+Dk5vFSokh62g9z7bZ
 lA3KzBqZiNfgTAAToW0c9ijaZWS1pF1ByoxqSzlZ9sVu2/EVALi+n1yT9HmXYsw/G2Eh2pjSIey
 SB4oYU9yPZ0UjJCz1x35PYvICsBVpOUFSVcbrZFOzJofJdU0hHqrqe/AbEmBz406WGoudU7p4nr
 VdXdyGLbZP/Ezv00/5gKxBN28d+Bbyq/a9IX3J8g5QHLCaiH/LZvJZqsRxgKMAVCKTpQHtKzyT7
 hZEgy6kHoa6WJWmDlHaTLxBAssQFrQYcZrHwS4ITbrrWMS36Pn7Pd+GlJQL1fi1+O5vbG4MUYnq
 uyi8kTBkQzqaySQyTv8xxyFk+cehH+Q0QASz93TkGZvy3oh3rJQdOZ/NTinXkd75rZvZzW4JSg8
 2w2IRkeR0Kue2LffGqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070103

Add a dedicated MAINTAINERS entry for the Qualcomm TPM driver, which
uses the Qualcomm TEE interface (qcomtee) to communicate with a TPM
Trusted Application running in TrustZone.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 47b04968e79a..cfa5b66823c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22636,6 +22636,13 @@ S:	Maintained
 F:	Documentation/tee/qtee.rst
 F:	drivers/tee/qcomtee/
 
+QUALCOMM TPM DRIVER
+M:	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	drivers/char/tpm/tpm_qcom.c
+F:	drivers/char/tpm/tpm_qcom.h
+
 QUALCOMM TRUST ZONE MEMORY ALLOCATOR
 M:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-arm-msm@vger.kernel.org

-- 
2.34.1

