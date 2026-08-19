Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5E23ABD8F
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787146000; cv=none; b=bSdh3UlDJtfI8rQ/M41bmOpJo6TVLqfPwILwKJd11y8Nq33LtOQG+aZYdzOHXuVFkzHGpMZQzR3tjgIEKdmfDgjOw+wimnVsAGM8KYfZ2Eiouc1nwsr7+g20OoTnwEcehf/7u+/5qlRFqbhQDlbOHn1pCEG1bo1X/ooY7BeQhHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787146000; c=relaxed/simple;
	bh=WyEzptVv7uRVS+fTWzoU6Xos6GT52swB3MLhrEXcDEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gv1kLVaQkJ8PDo5ZoO3L+EoHS5fi+nXzmUTrI1ti0SAzU2lDGB26X4mngFhedxJ/evRywmLh9lWV39Fr8u8tBDv1G4IMTbpsv95cLRv3RUbgvsVsg2I3rCUdVopfyvTLjOHZxpKNWUaz+R6dAkpN9ArRA/LKa8+K9gqHsuozbGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o/OiSXex; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cyL+VYD+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o/OiSXex";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cyL+VYD+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0a4S3600651
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GA7vzClWeSwWPtSLmTimBFoLovSegooKkc2VbhIOLI4=; b=o/OiSXexN8V1G/qJ
	gWfaMRTTi5zuo3GeCBei+dNNHGcXWkq0R/MUJHYxoAhrN03eGN+Jp3kh3qF/zcox
	vL0l4Cz40c+Ii+79dFKJaoH7efydHgAv4BWPgLZ4yuYZjk6S+Nq9Np8M5aVhsKhw
	cQp5JAeB0SJrrTWTpU9cghboyHUnTgOI/fjXVklnMZ+Y9mnpJZiHL7KV4mxl+z1M
	lzQLtlsFn/KXYcEhYHCA7bAK4jlXgwUoyTTJcFU7XG+vXrm8NIFTg5Ts7DAujsO7
	KY6sgbhELpDqErttvjV8NxGfuAb4sUObP9ePsNE0vZSoONBpko29SadPBXsY8mqo
	qZ0iLw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm3db5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:26:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f0fe57470so2383465a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 06:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787145991; x=1787750791; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GA7vzClWeSwWPtSLmTimBFoLovSegooKkc2VbhIOLI4=;
        b=cyL+VYD+/9kxQB5/Tnphn6AodwamIyuTX6y5CIkeHSOKvgcQQXPBTtI8H/VuTzwoAY
         jmTLcV8mkMuiB1AS8Pvg7W5AV5u4BThAFPYeCwTMijVWaBTAWVOIVrWk6xkGGWLVY9UI
         NAFKX9opJisnz/99gpXOqSeJbnQuhi1W5QqIYXOu6xtW5BJxAxNkhJvor2BiwupmsFlV
         i3V01kVt0Ib7iNP7tqqeo7nqNw9FmBH3RBZNhnz7fEUr79YBkMYVjkyVVDiHZO4nkkx9
         8Duw7F5oUB8ptM5FZEVor/M6a+j1gWgleWwsr+jxJTeoAtttTaIEWEPVybEu/FlTVDwr
         E89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787145991; x=1787750791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GA7vzClWeSwWPtSLmTimBFoLovSegooKkc2VbhIOLI4=;
        b=GsYCVFwmXsw8NBhNw55F0V41C9VqH5VWwC0c2t0Mv8kdaATJXS9rMyDvUBWAGd5pxM
         pmg+8SNts0Ra2WhOiSZE48XScGxB8DASXKFquxuJbFKRduYkRBoHNMXuxwo5UvUn1vWP
         qRpyg1DBHo8qrgrZzx1twB8ryyvAlF4qvjIWzK0Rs7S39FcuXxeqHa/c7Zam8i3B+2HQ
         yEuxmWaMBZb8rUBqOvspngL9l/F+0Mde9VVOj5B7kN7XHQhue7QFdSizRM7IIan3vH01
         w9AKnaL3+Tsivn2orS9ecEciLMMew8Gray+aSKQTpPare6ceuyf4Ual5SFCOUFltdVfv
         mG+Q==
X-Forwarded-Encrypted: i=1; AHgh+RoMAzhInocF52xjvP/rXoMyk7iVn4sbDxFO7gxn/jZfjgxdpPnibAMdhf2r2HD5iPL7xtjTZWmNFSnHHwWv@vger.kernel.org
X-Gm-Message-State: AFuF++n1xhMuKHF3K3d4ThWvZoMm9FzOtTd2/B+0UOdgg2xpjYopvvfZ
	JeD+/IGYQ5TsEUPU+tl46BuZfNfZbfMFEFXfRvUyxo+3WxUQfGO05s5L1Row3PbJU+YxDxv4Cu5
	GuWLvWlp/iO53vXeiuHnJnzKyDL+XV6EI7fnrp+yf661MfvTUz2ttFD2vfRRGifiRluCU
X-Gm-Gg: AR+sD133SP2bJQbD7iMkKJItpV1d9eCfP7MK1l+Bxk7mhJJ38i4xhg+p6TS91IvxKCW
	/sxhEBE7eHNR3Md4ruuGbrtf58NIRtUF2mT7kLyro6Z5OYoo/vtbxu/oeOKLWgx/y/5S19F31og
	3tHup0bV/U5AaOY7pqL2eG9Ud2yu/cQT2FC2EO9kCescSv9FMO/851wN+Qn2EuN+fJABJV7oCwR
	s5HJsBqKlqChXbr3bTmVyaRUL7w4i0cVF3Z4ECQuMrlgrQf5e0j17hUS6dtc64VuJPxrgCqBOHK
	HaYE3qyBBEn0x1HZt4CAWZP6Hu7RgNBgUERarMNv+shmfrFU/4Eps8mwzhrqtnB1H9eqpgSy7od
	fg+qxQS2zBBKfzJ+ShssKUtZa1YT5E6mHiFQ=
X-Received: by 2002:a17:90a:ec83:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-3957f86d960mr7218178a91.4.1787145990558;
        Wed, 19 Aug 2026 06:26:30 -0700 (PDT)
X-Received: by 2002:a17:90a:ec83:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-3957f86d960mr7218129a91.4.1787145990140;
        Wed, 19 Aug 2026 06:26:30 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327c2a92406sm6126465eec.11.2026.08.19.06.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 06:26:29 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:55:53 +0530
Subject: [PATCH v5 2/6] PCI: Export pci_set_target_speed()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260819-bwscale-v5-2-6dea79786b37@oss.qualcomm.com>
References: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
In-Reply-To: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787145973; l=734;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=WyEzptVv7uRVS+fTWzoU6Xos6GT52swB3MLhrEXcDEg=;
 b=Ck/CEbFLWH7VTG9uktRjIhO+x0ADX2v3SpS1gJJH7UzHym4rKnJTUhEfeNLXMl2jzTD885c9j
 O0ztEcXozknDPDijfAx6Myn/TJhPpQpE+bnqryQw6/AfJURhBkxpzdQ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: BGg7u9P8dpsOH7fr6fLdMrp8PbJ-LoQW
X-Authority-Analysis: v=2.4 cv=bth8wkai c=1 sm=1 tr=0 ts=6a85af07 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=5E3R6_0bZ0f_H1kkCjQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: BGg7u9P8dpsOH7fr6fLdMrp8PbJ-LoQW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfX2VDhlkD2GDgE
 2Oyq/YHCwJGmWl/sVa6MYJYIKZCjvhv5y8XI46zePbIqNeHxbEPm2G4BK2bKh1LspBwgkad2n4O
 mgBP42/KnUu+XJmBfKDsGNEzBBW87qzDx3XsBx7QUcQvbOZRYDs3WkKwWcfG9IrnLcpv0PotQ/7
 6NHNsdEPJ9K5gP1AJDPSXxJd4cC0+kqZOLAay05ajrmqnqVDPstcEahHEHx6R7fvkGWPs4MtfbD
 Dzyj7/3OgHuHcQH46udYLB+9Ucov6X/OQKwJgw/wQiXkPH1cbwtbM7K++GmMKA+r7kAFbh83kV3
 efOgLfSGleAx1DcQdM/sPlybHJTih7XRwPwyMzrOJFlam/I5C1GCVkd7I/N27kh96XkvLR+NvoP
 xwzzgPLOjWbuOG6US3SimyWYBpnN0CCFv71MSjcDdZd4h+OL44jFWRG4Wg5IcXC1pASmRyZG/a7
 waHQCgPFtapEbh3/TUQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfXxncSOiwfe8Yr
 Q2q+n0ygll2S+mDB+Em5LPQAL6Q0rKCb0sO71y2ZrJK5uSHZZ4g3tQuKaio1UZopSQMtqZhLmNJ
 uDVRRMHROL8Dd61dQvKmxGYSV3JOxYU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190104

Export pci_set_target_speed() so that other kernel drivers can use it
to change the PCIe data rate.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pcie/bwctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
index 6fa1522c47db..a337f166465e 100644
--- a/drivers/pci/pcie/bwctrl.c
+++ b/drivers/pci/pcie/bwctrl.c
@@ -239,6 +239,7 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(pcie_set_target_speed);
 
 static void pcie_bwnotif_enable(struct pcie_device *srv)
 {

-- 
2.34.1

