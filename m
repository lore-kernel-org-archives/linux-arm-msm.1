Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0191B453A54
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 12:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788437284; cv=none; b=YjWMHUT+JuaUFd6tTqWg9uqa1EsJrwA4NVrnGmo+XYxMkz3H0QQBCFAQGLeWb4Oyn6UL4hp/sJbOrUWtOpInshFFjFFm+91Ls/Zr2pfbZDZVCPEQ6iWOXjdrPWJQR/Q9lyV+N78LjYNL8igmgveW9pQURoIX/jRR/ZEDMHAKFAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788437284; c=relaxed/simple;
	bh=JvjgTsJZJ52y4kyW1nFUJTEfAu0hNknPq7wSNqID1I4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O8bautZNYDBMFIEaaPhP+lnaothOfBqZNOMfzVzOEQ7vx1tMVfJOR16RMhNAKGn+9bEsu36O/mumakNbYdWGNqASz+4f5vw8ZZZVh8YmGeVLDcZa4zmSR7usv8Z2WcDtElvZMIcLujfKOGJA5sGJkzYEHwJePSevOIQoV7NmmJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bw21I/T9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=acH7eEbl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bw21I/T9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="acH7eEbl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AH44o935013
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 12:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dDZqAY+ezXfJh7xukUn90z48pHmek8RAP97eAMAhVww=; b=bw21I/T9Rm7I7Z6x
	1j5DgDvyHuveaea1+wsbKgS65DZiPloXZp8gX1r/AmL6LRPpKF1QkorIs+QeNpJH
	cWKFAgt3fKSTt4sgBpassSrrKritpenEqUuYZkeC2xzjZLkJwG55cZXneG/Mb0Us
	+mLz9kMctYjQ5nd42SLYVTykIGOHCIAM1NGjzsSmW1zzLjx5f0rxQ5zlHvrdp08o
	9Hmxdc9IMxg2n3/KYTohFPG2XukMCYbHa9lG/gkndZcQDX5Hj0WHuF/UFGqSK5Tl
	+QidJ6uDpVzDmjwO9L7t+NLqOhmzKeE/JMNV50JkFT1YJ8NDGh5XT1QQn2BSIvWs
	jia1Rw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdnc6ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 12:07:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93903982af1so585878585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 05:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788437278; x=1789042078; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dDZqAY+ezXfJh7xukUn90z48pHmek8RAP97eAMAhVww=;
        b=acH7eEblVqlvSN1nvPyw6nC3WYBqlhEELjOUPgXtkSrf/YAZJQfec+BWxL5RMxptjR
         UIxoaGiLJURSglYdkviDXVv4OLJptD/TJJDSEXyZq8KpluTerKtKK790TiAi389/ku6d
         ns0CM//ZUOuU8bxlb++sRz8zi5k5SpH9JoNSYQf+pEQZdtR7bCPagNS1y4TmBoR481kE
         jPzlRUxoAhWCFiH+S4gr2Jz5a9GxaZpS/3h+HI9wXjdIq4eL68Ob+yrZEwPDZNQewiko
         dKHkMl4mDYy1h6UMP5Sh79s2UPnao8eouJliX8qxyp4zS29UBUS3CWIm0RXHXr97Glum
         TYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788437278; x=1789042078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dDZqAY+ezXfJh7xukUn90z48pHmek8RAP97eAMAhVww=;
        b=HiNND0uKvV4Nxv6MAAjyY81rklk4mNOryRNEnNBGoAskfNTult9oOB0Oz0b1waJe6w
         YJ9axzLN6jE1a/N8O7V00Dmd2dZDnh6IxhGuaIxUCq6fTBngZwmz3rDyOZItQGxOCRls
         XEJiT4WxurvH+usRvGTd6kTouw3F6dl7SeybldRAAXiLoYyie/tIp3mm6X4VOM9h5njk
         biVDjAaxCYorD0fhg8cAuZTABL7D07WsZhLZD1cG+Ay3EaiphlRkYXfbcJsHWlf0pGYB
         Sd+7O3pZPnseXVXYUcaQMSxQVcZukaeTbFYq0UEkLw8yqDkzVuV+0HdruJanm9Si5u+N
         ya/A==
X-Gm-Message-State: AFuF++njMVa7ddwC2Evi+QH0GY0RwH6qgW4KxhznqRH48rgrjh9O4LO4
	dEZggxSYDX+ZFfQCiVhoNawpd8wna14lGrdUOvBCxKDqQjaTaJs1NaL03iRL6iJk2m0G5iiPRVr
	qyJ3GuiA6WczKC8hURCziXgq5N0o2axJO+PkPTQzkWLSS2FGA1omK9ceHNEpaQfauVFva0RClPX
	vg
X-Gm-Gg: AYBFou0ANL+n+SZMuLlVSptW+SqZwDhLIC9XHe2onPCuNG26w4vQZrIWkUFJEzQ/D7D
	SYAp/7AdsNrkC85QLfTVO+3hbntkxz4Hi9qIdbEAeeOLi7+GVp2DnD1oxy6jA8e2Yh+OvuyVAfR
	FcRSo/nKEM0aJzB1kdcuUg4gbbSgRbrdU/KX1w7HjxuiO2q+boUUw0MDxackEmayMpRF4ipbMuO
	oI88zYuz07nKuArULZ5tEjmXcbUoPH6Kaz8BS+/+3e+WdGlEsrgjVNsCt1Q1iSOZJ05NOvOWYV6
	IdkZ7qfacd23mp10wu5mlwlQ1etoBgBWqPxOamxUNFoy7+yqIcpFiq3Bv+8Ql3i1oj5K2t0IU1/
	V789ysqCwMs8gJYBxi8ociztk56iE
X-Received: by 2002:a05:620a:6187:b0:939:6df3:d7f6 with SMTP id af79cd13be357-9396df3de25mr697156585a.49.1788437277640;
        Thu, 03 Sep 2026 05:07:57 -0700 (PDT)
X-Received: by 2002:a05:620a:6187:b0:939:6df3:d7f6 with SMTP id af79cd13be357-9396df3de25mr697140885a.49.1788437276736;
        Thu, 03 Sep 2026 05:07:56 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:1c7d:412b:f9d3:3bfc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d587csm72143115e9.4.2026.09.03.05.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:07:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 14:07:42 +0200
Subject: [PATCH v3 1/4] firmware: qcom: tzmem: guard against IS_ERR() in
 the cleanup handler
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-qcom-scm-code-shrink-v3-1-8237f3a654e1@oss.qualcomm.com>
References: <20260903-qcom-scm-code-shrink-v3-0-8237f3a654e1@oss.qualcomm.com>
In-Reply-To: <20260903-qcom-scm-code-shrink-v3-0-8237f3a654e1@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JvjgTsJZJ52y4kyW1nFUJTEfAu0hNknPq7wSNqID1I4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqmWMUrMFILDlEffZuTArHusuP3GlPVcDQI2UzL
 bpeQlMEv5uJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCapljFAAKCRAFnS7L/zaE
 w+KED/49DJpAzsHZorDqRzPFVsR9qZ7WTtBdJ6o9gn2g6/0sCUk0dGRtonXJOXlfnH1dEVrfufm
 fjdvH/7gHxiTVxtAxoxYp4RWQbVOSyOqlP1Siqz/lJIyhrLdQJxmm7uK5vq4gugNvN2BThTy4BX
 NcZXq/STTpvrr/7Dj2Bdlc3YuDtwyWp28XZmCzSGtsRdXEgC/d83FGfxbWk+RS6Mf3/bLlDbrbL
 VQZgmZ8Biju9MBKRXZFfKvYE3NHh2hAMQUoT1IATVJLaszl00EowfEHu34K5CdmkTJZUiw7SQhb
 lZVvG7LEzmANBlJUxtBTtgSo6fJ2DEPatPQE09WrbRycvau2btzfffIQKbvpBqNoY+/x1kdQ0xs
 NdXAvfJfSuoDwhLMQ1YReTOyrpVnwKngl1W16zPmxqje5d5WUyRykzxrsVKS5oJGdmac33zFoX8
 HyZ3APTDuM7qlC945gCaL2GJ3cRzgR2Bz0XaBJQrWgBca4VmQrn8TKRqgD7sEiJEf5Xcf0MyCdg
 ThnONUZzx3RFy9fAqvAB+vbTKd+VTer7cfZyfsoEvLu6rrdybuZsOtUQq/4Kn2Pe8dYxE7T0ew7
 LjmNzhuKA1QX8mdVwZsMzYC+AVgeoqhFkMj+dmn1NjXXfFQEwQUYjZJKk2FVLtPEtMOvTXGWAPG
 jpEvaIxQapLlWIQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a99631e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=PGwebHSm6yYtckILb5AA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwNSBTYWx0ZWRfX09AQGR0Rot5g
 7n3x1WJZFGMZqAatGTB1LJSCTekSuhIOnfWeG0ar9e2OmOnjQWkRAlaLp4gyKtCA4IyJjKTaXFI
 UjiODiI56sXO+nnxPW4aFRGD3zdTC5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwNSBTYWx0ZWRfX1hpQg7wXw9l3
 or5dBTLT5PHObadWGv8pjv9CyToJQWKTgQ7dmpQ6pwU92yNiEm+h1nnnUu8S264w4TT+WoSzhml
 5xZqV8sqvOkQZJSHG63F+CagBnd7+IGrNYMn5FHTtm7j8Jg1d1VGCr5WIkqS+myrWwMVDe+aU4W
 K4llC37b0Ebn5HeueRjqGQVxflTEcOs2ibztEK8BQJe7tdgyiqJ2uf2FwaOyvA7MjNnIGGtF0z2
 QwY/RvqlHjfe5V0MPpsqo7AEBLt9yowDZ/iZbxVLVsoDnTfnuHkYk2+G/y3AawcrSUMyexpnEb5
 0jKF2c6NVsPlrbS9KhEz1CZplCQgj/FGIx20sy7rxTtYLvYVI3QrkvQYKvJKdMw9EYxLrhs4xhi
 AOgJEc9WWTiYoFmqcKcytk6e0j5K8ZW8uEIEAwS9AYuIj+NdsVaVwwEz2km92QJ0MFYJinb1l4R
 IEw6oipdcGqctXgPymA==
X-Proofpoint-GUID: i9z-6-x18SEi1iVkjWSQqDE_RdHQFq0D
X-Proofpoint-ORIG-GUID: i9z-6-x18SEi1iVkjWSQqDE_RdHQFq0D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030105

We currently only silently skip NULL-pointers in the cleanup handler for
tzmem. It's possible that we get passed a pointer holding an ERR_PTR()
value so skip it too.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/firmware/qcom/qcom_tzmem.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/firmware/qcom/qcom_tzmem.h b/include/linux/firmware/qcom/qcom_tzmem.h
index 23173e0c3dddd154dd56dc3dcb56bd20ada0520a..b5520178bf6f53b86b530571a3be9f302225f022 100644
--- a/include/linux/firmware/qcom/qcom_tzmem.h
+++ b/include/linux/firmware/qcom/qcom_tzmem.h
@@ -58,7 +58,7 @@ devm_qcom_tzmem_pool_new(struct device *dev,
 void *qcom_tzmem_alloc(struct qcom_tzmem_pool *pool, size_t size, gfp_t gfp);
 void qcom_tzmem_free(void *ptr);
 
-DEFINE_FREE(qcom_tzmem, void *, if (_T) qcom_tzmem_free(_T))
+DEFINE_FREE(qcom_tzmem, void *, if (!IS_ERR_OR_NULL(_T)) qcom_tzmem_free(_T))
 
 phys_addr_t qcom_tzmem_to_phys(void *ptr);
 

-- 
2.47.3

