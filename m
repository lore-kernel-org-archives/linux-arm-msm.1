Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D4A4AF685
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 19:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378056; cv=none; b=N5iJryxfmzUty9NMjaRMfEFORKuCCetbE5JINWDtshWf0Y59idQXRIHmA2J6/pXkuEDefcn5EM27Wqqa+/WH5opXvEgzoZHv77Gs2z5P2UjQ+s1mDV9d5MpTZjt9C1H1ku39nmRcA/3coT1cao8UV/xMjFDwQO7+y04FkYn2bxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378056; c=relaxed/simple;
	bh=L8/bS4ZeQfNNlInWDRNA9f3NF2qTZmNCt/3/vvmuChQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OxEdYpKjvfQoahdaWCb+7t9u1iL/0+F4zOFfNnKW6OK5mCwf1HK4q0M9qBZYxm/yEf/JQ2W2WL1nlxF4/131ignY8VgyofNKEFUhyoYDProTOmZGfR1zf1z2iLl5tShrWnbrEbUyk09+fdhNBY4BwD2qQoo0hp9lmTsWFIOeLuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SDqjlIYf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PMEUn9Mk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SDqjlIYf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PMEUn9Mk"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqmHW2270340
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 19:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HcBBgWhUa/fey2yq1Yy4HHcqCYRd29uAL6v
	U55hKPm8=; b=SDqjlIYfsZepEy/U2IDe3PsHymz1seGb/9lY7sGIdRXHOfQS1XS
	dOAnPRWPBv6e/A1556MBtCDxnV/9FJckPuLHYsYfzyggFJMyufYjevXR7LsV9GkB
	x1wJulBrYUBxiE+SZZGAk1HgCAs2SCeu39WWme9thm3uaV1GPxT4iieF8L++xhV0
	SMg0geq8s08ck1HocycDfLa6MiK0aS90I1NzEQT2jefV1MBFvYAvIo7KOSFHFyY9
	dCHRrFiRg9qgLdtgT+9kY5yDEV9apgljUZ/RFP9ydc+oTDNQxibSeMDHxmzYFuSY
	LiV3Z9+hw0UPkLR2txlr8otQdbNpxev0g6w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gej2cad4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 19:40:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so2333430a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 12:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378049; x=1788982849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HcBBgWhUa/fey2yq1Yy4HHcqCYRd29uAL6vU55hKPm8=;
        b=PMEUn9MkJYyRw3ft1f/5+giyUviGh3ZR0t3dRsJnjW1a9Wb7NtaacjMzxJUJlhBjSE
         PVtz7G4l729AlCaf5qR1QQ3orGyOWkCkc0FQ7V7G5eabyYv1OjFVsAc6BRyzmZXpqyil
         WqRKojsVrbESZfx5jFtQkz42wW8J8Dmo22vPwSrikFI/HOXIVC/NSuqMSrESaUNMsjFe
         Lkg1JjInPYP7dRg8p4PN/660JAPXuXCrwE2WNIiZweefPbZHYKZ0zI5m4hSoair0DOOh
         lNUE7dkwUhCnm52IOkMmp26uQKi/ij6k82ZG05LMLgNB65HI8bF4gniQidjmIP53JTtx
         H6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378049; x=1788982849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HcBBgWhUa/fey2yq1Yy4HHcqCYRd29uAL6vU55hKPm8=;
        b=ShjApshawetOchqLpfwhM25URu0/DzGLK8FfZu03P4bsUOGtvd8nnMSv2zM9D1L8pd
         i4K9JP0YuA8gXHsOfyKhR/S+ZBU2J1lZmcS3evxWodXTFO0rqTdSewBlLimh395sw60L
         hCLgeb/tIr2Lar7hZq3mHi/TWIBkxVtMOX3o6eCKdO6mWFMLlOzyaLqWPSkml+Gy5kH9
         Du/MbUtjjrrWUT7y02hC6ZGSibo6Zr00s3QEe3GtkGko5P4g8bf9M/R9P/wuxa9yz2We
         Rd2KOutsiThSE+rVTYMB8eGvclf9xAe0kTAp36QkaoEAQ2PfnxEGyhwzstBTVfyAQ+u3
         jglg==
X-Forwarded-Encrypted: i=1; AKwUvBzryGckLDI/RhA3WPeNhrFiYIXMTqo9IRuWlZMioX0lmGUE2N8MDFW2LXQB320rvNm1xGo5mDEETT0nJxF8@vger.kernel.org
X-Gm-Message-State: AFuF++lMTJfs1YxQr01nIvrdqdfNnVbEcTsM2wAogOqUEaxAekgGX2Yn
	KjVlVVz4Edr2l0mIB4tc30v2c3+jYrDOyNfcmMLszpUVQuJGV4kcvDkGQI56jtcIM5EWhkKH9gF
	EBkQe/P3RlZp+Itx0j1w0vO9TAdMPT5G7h1oHh1zWAujs43b3rraHtIKqCbWKdXZHL8yc
X-Gm-Gg: AYBFou1k2mCOn46kn1e8LRrIeMJCr6cmipRfABAQTdFkfRtm2Sudl1Ge3Hd5phCN68S
	aegCe5MeqVp3zQX+Q8Is1Z5pOMsfO84WOCAx6AyCcOVXteAUf99SaeHMa4QPMoc7I31WX5+Qv57
	ghYI/gGcwjYS1ZEaNs8qIpyg/h+g2qXdYqwJaY1fGvyrx1DAh5YfdMAh+K+xtJcDrVSEbxCqkiP
	y893epvPnf0E9koXUWj0ClwXW97T89bSWgXd8HJqaQfhfBgn6dxl4YnktuIHCDgiggVB7ql6WHR
	+VNgaYsp14AeCRiTUpZtsPBXDQ6hN5vMVXmz9wVmZ4Q0q+FzQ8LhpPeYs5HMLcn6xrK9K2Zv1L8
	g9r/ZhSQYWskOlx1bLbxUOakWvT0=
X-Received: by 2002:a17:90b:1a8a:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-39aee0e5de8mr10045290a91.14.1788378048663;
        Wed, 02 Sep 2026 12:40:48 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8a:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-39aee0e5de8mr10045240a91.14.1788378048115;
        Wed, 02 Sep 2026 12:40:48 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14319875cc0sm304877c88.1.2026.09.02.12.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:40:47 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2] misc: fastrpc: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:10:41 +0530
Message-ID: <20260902194041.1999834-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX+MXb3I5D70yO
 2+DuubjF1+hljWnZaWPDDfxo6Gn7h1xOKqyS5SS7/PBkLDet77j6OBAmk86899UK8Osj/96hrnE
 tcU2gHDNQyX6qQSgdsoCNWygtcyElkU=
X-Authority-Analysis: v=2.4 cv=G+ss1dk5 c=1 sm=1 tr=0 ts=6a987bc1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=12ZugxYpoLeGVrRS1ywA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 2Iy84bi06dlnOW0okHk6dSfy16pd3Z0S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfXw0fztvHb8lhd
 sDLEairXW7fI//uoRpU44vkAHVm53hWus04qph2c7uyfJRBwL39VSm4f7u6+SnZYAXkrFUbMAQs
 us6ME4IpKQ+p4zfTwqAHifOMGIFTTIS1kp9Bij9UKKwr3dne7ZOKpi0XA/xhQsXASGBf41d/Wot
 xPyKAiLEUQbHzzf/BEklN64YVn5vh01xeCb5H8/eCUR+7AAf3h3ZwLl/HhZyGCEUB3sgJAlXEqj
 TKWMZaa3iT7PpApzrgR/RXRaL4qZ6tSGAvhu9yasbNRf8oBlmxxusB68YhzWmaPANezOooPUfCH
 422Lju5totSjCxnOnz78CEOusV//pTo4QmYo22bofzp97B0Lvpfq84S/UzEyZOkQhvH48Bj66le
 mN6hoKEGvO9vyVDCvLdvjQzM3tcXOTG9vESMulGfABPJpN3dR8Hd/sLsTf3/IdD1M9L1NCUV5WW
 4ypSLLMSjnvGc+R6yUQ==
X-Proofpoint-ORIG-GUID: 2Iy84bi06dlnOW0okHk6dSfy16pd3Z0S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020173

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing of_reserved_mem_device_release() in fastrpc_rpmsg_remove().

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2: https://lore.kernel.org/lkml/20260703193855.110619-2-mukesh.ojha@oss.qualcomm.com/
 - Carried Reviewed-by tag.
 - rebased it.

 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d4fac2caca86..ad248e12fe97 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2558,7 +2558,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		return -EINVAL;
 	}
 
-	if (of_reserved_mem_device_init_by_idx(rdev, rdev->of_node, 0))
+	if (devm_of_reserved_mem_device_init(rdev))
 		dev_info(rdev, "no reserved DMA memory for FASTRPC\n");
 
 	vmcount = of_property_read_variable_u32_array(rdev->of_node,
-- 
2.55.0

