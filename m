Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093031;
	b=uEZDBrTdhh8Ga/c3i2Ke94Qwdpvw3rBq0sEihgLPwfCGQ6dFAYLYlXteseG+isNX2dj3
	 2XflFuaLqaEJZNe21P90yfMrFrq/OdsNezTdauh0tylXPx43MeOSmXMpRd7VFEadnSGFL
	 To8C8PQ9XdUhwTzqWGMyGPCJbT2rwOMiX0SeLG0rt1lNGB0XO9FSRkStc2KyNzdFF4ab2
	 /xvH7x9TNV4FRTleA3n2duGo98dHZtruuO2V65Ds0a3DVAJNkv/suJltTUC+235YMV428
	 HNIr/gk0+zEIXTyPH8IGQUFFzKVDVjWqBwm52TU+bj/SasNzou3AlexCXpfFwzlVgvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093031;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cK9FQB1eQfoYcGbuRQMgSid2tZEykErFFsoGc4qtmho=;
	b=VkuxHrw2L5GBmQK0kRQCMnOjnn8Uz9SzDaM8wc1OCxBela1V0h6qOEMMriIeWNtqq7E3
	 QUmbkQ4pGVNhuZcfu6a3uNuw0djLQtq7yTomGRTwDGtT/wzMCVXcRUA0J55KdXvUe8KIu
	 OWsS09UfnRb0SO/IFdP8pSjHmShAYkxQ4cedyLn1OYMpLmvaqUtwiWKF0b1ZxkryuAB7H
	 OQRvc6jvl+vhPj0OSeNnXBpi0B8bM627hMqZA0DTNih80TGxKcgnQvAPVYxsV8wF8SJkM
	 0GX6v7z9JsHw+73RM5f3vB+uizmqIl5+kAE4UwcaDSReXBBTsOytLrkpy8fSUdJHAUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m8nRjkNO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=duggvRRJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234E4606A32F
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 12:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 234E4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m8nRjkNO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=duggvRRJ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBju3t1655073
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 12:57:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cK9FQB1eQfoYcGbuRQMgSid2tZEykErFFsoGc4qtmho=; b=m8nRjkNOW3VPr3Db
	nULsFpFVKB4d+oAm1XxQzMs6sU04/hZg25z6kvlIEnVyHGUyIFPeCuOSC1og88QX
	pD/n3jwP2ciTLpHtt4ovUbDQAHsEt1ONIpuWEaKMjQOnLdePpfS8S3A32A8rjVqt
	gGtzhWhC+pE8rPQHUzbCusc6542yrC0hxHr06nMMaC0B6hmld1rPbdzO3C2mJl5m
	ekCm4Dp7oSZhkKDWMTLnLUq6qeq7v6p169cp+FMPbjks8aavxmMhc+0qBNVzpXNk
	8O4jqv6bKsXxeBCRVwJZw7+SE4+IrwqKi+dVNguahul9MjaixLPoCEgYv+hDnG70
	suRBMw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1yghggda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 12:57:06 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-383d1190b49so1111714eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 04:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795093026; x=1795697826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cK9FQB1eQfoYcGbuRQMgSid2tZEykErFFsoGc4qtmho=;
        b=duggvRRJ2lKdCPuEUgWJStfwgCvxJnSiJrNM6cmCH/XjQfk6KVkoYuAZsZcX8FciQz
         RCxovNVr+eCl4QyqPViKZVTn1fF1xbHAkwdZOUGcRU+6eZeYfWHW3PK4ZDAJDTZ+s05X
         cJeFiquOV47wYGux8vRWckMwUP28VF/8HOKC41br6MxSjAhlWggMTAsPx2ZUOKuxUO0R
         DtXa0NBp246g3MtvswP+R/N5eW6VK+YdIeSNKVa3BlK05DDheB5m1PJCJu0mN+Gk6I9g
         KMQZ99K1aTI25uIEBrKpucTCjICjr1GlUHMtIUgMYsWhXwlLimSGT6NQxxKHrae5I2b/
         X52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093026; x=1795697826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cK9FQB1eQfoYcGbuRQMgSid2tZEykErFFsoGc4qtmho=;
        b=Nx2IVbyJzuZ+BPAyHg1WXQxDByMWD7uWH7nOTKsoGZclVNLZ/LPoDqQpQvXk0c3hvP
         +32Vn9WYZJgCjYvGcIlf2qJFLxLrqqy/uyw4cnOOmnIPCtoZ1ZqM3Mwi7f+rhuHVHMqv
         PPkGu2kkWiYKSf7cdPF7Twbugp/Re+EnaHlsqOCPR27H1AmwFpUuUD3FGoJxWVG5BuWP
         Sfmu6u8TNmeQ+byjvi3K13kkr59eYEixXnz04irYWhiH/2PG9Fa3AfZZEK8pV+KujDkD
         uzsh/Dqq2St7aUpVzQQpYbXTwLuON77FO6p//pQDWNn1dLBHoibzVh4NvgefFOcQXX2T
         LaQw==
X-Forwarded-Encrypted: i=1; AL+hErH17A4s8gaP7kwG6BwDs2H3k1KHsQVjhdMJsuqsomOByRXD+OZtM89ye0uIbEAmKlrSGBOJhId0tr36G0gj@vger.kernel.org
X-Gm-Message-State: APuU4Z898gql9Woi22seO18KsRfc4tyYpd1BKE3s3U1WWwKcJNwLwL1T
	dC8aPZDUb6AXJ0AC9+tX+gpp+GOgbz7dSGVjz+ACD9QGWnik9zPkzhdaoykGgMnn5n8eWBNv6n3
	sByrkea8TcuV5U4kzbwZdFyK5acvh/tXNHoPdJJDritVD09So8FcpkAfsi9/1oodZzW9R
X-Gm-Gg: AZFdTZeq6H79HSO/24lUU8bHsVIBEaYNcc/KTt29uI7THnK13+vi9iWweZp9qV48BzN
	VoNc/Kf/2Bltg7q5G52wJdRTENdTeEm9yMjOF+wIZCy6Nfk+KR4xDzHRsg2udbdbB5xAxERoh3P
	JUyDy5T22LopAY5BOF2o9+qZvuG0KSO42SeLXhFTRHqHapZS4JnQ8w9zrl+rbnjShHkE0GFqMz9
	wSyTuDi8oYE86L3//euLfzx8RBifCrDfbLGOCeZWaJafhiXoHFrs4MJ1eVXXlwC6vRNd0V9tHnU
	ogUCjnLpQP3FTRFZg5gb0+9Ad5Bt4YqBlXOb6FZ/fiXvr8ZJyoViSaO3+AhTBVxiwKIMvIxOSkE
	Xtkw49xnFJYXzH1GzcyWRSJ3YGfP+UU7K56X3Z+Ds4LPHszVjP1eGmwOtIBQ8tTzoTedqH1zNmh
	JWMOIju1Jd
X-Received: by 2002:a05:693c:41c2:20b0:35e:2c6:d46c with SMTP id 5a478bee46e88-3828101fdc8mr4842002eec.10.1795093026237;
        Thu, 19 Nov 2026 04:57:06 -0800 (PST)
X-Received: by 2002:a05:693c:41c2:20b0:35e:2c6:d46c with SMTP id 5a478bee46e88-3828101fdc8mr4841978eec.10.1795093025585;
        Thu, 19 Nov 2026 04:57:05 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm18529369eec.28.2026.11.19.04.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:57:05 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 18:26:34 +0530
Subject: [PATCH v6 2/7] PCI: Export pci_set_target_speed()
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261119-bwscale-v6-2-9a9a715fcb46@oss.qualcomm.com>
References: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
In-Reply-To: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795093007; l=808;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=W18AFjHkuzlMzGO5/R1VBtRoQyqAsmAJi1evG/8xi5I=;
 b=AkA+fwfO2ceq8nugH0tjdw+xo2pslyfEUD1FzyiS2YWEXpHinZQOqVDEDsAbZ9lUz+gfkXnIo
 AFXVLo0LYELAglKOVKcuHsbzpeARu2iv9LhZUhJLhRf/a2lkOhivbXW
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX8uKLG/a54s9b
 rwK4eX3EHtvvhI8HywN2/ubieMg4n0eZO8gYpnisPgnrN1EpTnABbcGMtwPqVEYahrhujrUrNT+
 dRjpjLehxQRQzd2X7vvsDZj4IIPgpZ38EumMd+j8kb8olobHcYXvSeVpH3A26K8FYac05FWfDv/
 VurgumMgJrJH09g91glw/8hRtekl6NbDm3OOP2CKEK7w8vWkXR1ciICrB+r9cWVUk2wPfaTiXlZ
 ZfAxMlx42aIaz0B5DfU1jpp9UfpcV17shAALQaDU7EaVpuj/f1E2K2lfHUP0e96L9rNJKw3GC67
 oCvmRhymZdjCb/yZv09llsZ9jPmJLG6i8No4kTiQ16KaKOAV5MJuMT1R/RRAb3GOdm5jFhRyVG0
 ipHdycd4DVVqx56AQ8Oq0TVcyVHNMNbHy8mFeIDvriKlgxszH78vYicxGud9jO39Jb97S0Rbfh8
 MGqbS/LSYcw0Tp5NTZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX0sLZbHTEyZId
 BXpuT9C5rhepzZbuYP7wMcY8Y6DgQM7XBbxubF1CjtIWYj/jNc1bXYPzMFN+aTXz9H1D+XJ+Unh
 sP8c7MYsENNN4kNMDz2L1dUS88X7uow=
X-Authority-Analysis: v=2.4 cv=Vvi2kO2n c=1 sm=1 tr=0 ts=6afef222 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=JOcJ30pghDwnvxMqNTgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: RnTR1FRGVR-mI-6G79mX5i_wCG1orJOX
X-Proofpoint-ORIG-GUID: RnTR1FRGVR-mI-6G79mX5i_wCG1orJOX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190051

Export pci_set_target_speed() so that other kernel drivers can use it
to change the PCIe data rate.

Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pcie/bwctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
index c1e749df5bbe..0512ec62dd5b 100644
--- a/drivers/pci/pcie/bwctrl.c
+++ b/drivers/pci/pcie/bwctrl.c
@@ -219,6 +219,7 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(pcie_set_target_speed);
 
 static void pcie_bwnotif_enable(struct pcie_device *srv)
 {

-- 
2.34.1

