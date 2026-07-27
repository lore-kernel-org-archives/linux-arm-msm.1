Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1988363B9
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 05:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785128567; cv=none; b=cuMku5XZcEVAc5uz4lw2nmyD1ed90AsTs7cPVmBUXKe5V8vieat0NrWK6cXRqc4EjsmQLxiERQA6MUIMUJRwkHp6dRnnwq7wsmyPS9TLwbpsYrf+Ve1g3aGZP9MtI6GjULMuDRSgxrpa9Iq0xZGIH+ZrQvLXRtMewhPiM9cBJk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785128567; c=relaxed/simple;
	bh=V9tMQVbMCtIYLKOpkLXrvG9bRZcVtvHErVoo+n6KAcE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A7CsxPpGpDxsNxXw2WSRECXUV+qcuIqHyIWyxdHEeJRdoq2VzNbxcu14efcZh2firmM9Tf0DFQgcKtNqzIfvTyqzg9eRlEIkw5XXEB8xSyn3/8l3X5y1OnswXyDl+0uxHtMyMHO/tVExy99S9dA8zVt9uqRCi9GBV7b1PLEssLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S34S3Pp1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dHJdIl8z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S34S3Pp1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dHJdIl8z"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1gNlZ1769331
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 05:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2/nAfIufpfakPMsHd7Qhn4nFBPQGPmmAblG
	cC5CXTUk=; b=S34S3Pp1d8HAqvEtDhRrRDV0kpYPA8arhDsgt9gmEbzIsY8Vuso
	dzDHUJB1u0N56d4vq4robmi8/9Yld5bPff1rIhxK2WpbNDh8YsPOdcV9eApF8h/F
	waI8505oyiacAYjn+iX5d1JqeJL8Md0UVHS2dAu2II7t4xe1/BgdjqlmVFjI1xun
	qsciStIk2jGnXOdvEOUxo7AuT9KC+JeJnEEsnTL308JDt4tL6nUZ2KPH//kDzKUY
	s2MQIMxRW8XUg/LYJ4QVc3Gs1bTyKpYn/kbwmlVXagQu3JBp5pbHXNae2UP8+jKt
	5iQo5M4mu6zimj0kmnemCDk4gZ1nB81WI4Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmpajmb07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 05:02:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc88e22f92so55999065ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 22:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785128565; x=1785733365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2/nAfIufpfakPMsHd7Qhn4nFBPQGPmmAblGcC5CXTUk=;
        b=dHJdIl8z+By9l2yXgT4/Is+zI0aUR13VFWkx52TQExh7IgAwoUeA7S54w3n/gj4ZPg
         SFW9YTSnt02f/+3hDa5ilESssPK2xUWpkmg7rWc/jVuGXzWoDmlFjbHDkApNduKdLLGS
         12oVQYleF+dckyjnnojk404juJOt7a3mZpeo2SFCNGP6uKjz6+/haFEOxT4hVEKosJv6
         coPPn0uGmvSn4XE1pIGpBTsRO9oBr13zdX8Wc/Vf+n59sIVfl0Sn4uqlWPXO6se5aGc5
         8/K8Pt8KQEqdtRHgyQQHeE6HakB2DjTNvkv6yv8+uEMCe7Om1kiaVDUtjYL/G0j7cAVN
         VRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785128565; x=1785733365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2/nAfIufpfakPMsHd7Qhn4nFBPQGPmmAblGcC5CXTUk=;
        b=Sm4wLrK2BQqlWHlW4SjsItwMEidmw+mmiEZkh84eABIFk7ORJELrJeoUXhB9dFpvE1
         ba1pAUyVCa4IZ6bnGS2SLSocUd/z1qPOZlK3jowQgDnj0JqnM/pYc80zRgjkLPcqnHWs
         DVcl92/HsiJU3fO8PQ/R7+OLR5bH5xpx1ss7wxKjYfFeLhFuZa/0WJCLx9wRunnOVrIS
         UVC+fjSciNX4E+cymLbOUFHGKZGc4HHwqw8j3YyXr0vVjvM89zIg5QbPiW3SO2WqLu8h
         26vp3aFMcmPyW4Y/+XMqhDSEe02V33V8fzuQRln7b7C2qFMgkZ6GLqKpJGIr4N0BZpp4
         Iv4g==
X-Forwarded-Encrypted: i=1; AHgh+RobbYyOObApiS4m6tNqAfMpZ9vy4/wfXuTa4pBx22SVtMHDlb6WGNTUMWAbFnvqEuiCGDIEf4LrOGuBPyKs@vger.kernel.org
X-Gm-Message-State: AOJu0YxjP2rorsnCOOWDezOwp3m8nkxb2vZ3yPuyHjOcbwTim7EV8idj
	dZJ0i3AuJ071+XWxIOrDC3QoFcyURmD22GV4t9h4tiBpD3aVQpyLeix/EndRI4oPDFpSoib1I40
	DFoEbVkcSGttYjj826hFz3PGikTQB52lhR7HqwDMfwpPjCildiqdbUUSnEZTKchr+mras
X-Gm-Gg: AR+sD13aSAeeut6Ixx6f3xTD44UMjxXPTn6HCUk0NoSO0MykjQr8k5GbvleKfnQHtOJ
	FaHCMoNAzhan0c373BP5jpR4Ic69fnLsjBgqi73RoiZZMSjJzbbIdafLtXyHxz2tmBwUDUNPSQR
	DW26iZNvMhIIUgL+YJfV2umFDiUJB+A5H5knsWhF4BWUxpZ9xb2YyXaMYnv43sRlPcnv/RgCjcu
	xlr4DqAdR3qsojVWFDudVL4xNNe0TEhBtHxyU9MifwK5Dorda4eRTr6/zyxXmsCFEDGQMdk30ET
	V+S50LL0vY4NntrrEeJDmUdkD2njuGblGACQrFRCWkkMJ+zYlgmtCMNdkh6LUcMqPLwYKcIDz4r
	L2LErb5Jkd2aJ1JezQFwxF1DwvEzNUcn7
X-Received: by 2002:a17:903:2ec4:b0:2c2:bd0d:3cf0 with SMTP id d9443c01a7336-2cfde866ab6mr66731475ad.25.1785128564451;
        Sun, 26 Jul 2026 22:02:44 -0700 (PDT)
X-Received: by 2002:a17:903:2ec4:b0:2c2:bd0d:3cf0 with SMTP id d9443c01a7336-2cfde866ab6mr66731275ad.25.1785128564044;
        Sun, 26 Jul 2026 22:02:44 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bbdc2sm28572445ad.42.2026.07.26.22.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 22:02:43 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, broonie@kernel.org,
        stable@kernel.org
Subject: [PATCH v1] misc: fastrpc: Add missing <linux/bitfield.h> include
Date: Mon, 27 Jul 2026 10:32:38 +0530
Message-Id: <20260727050238.323039-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vB9A6QI1EkMM3YAwL2shHjhEWmhV0y0x
X-Authority-Analysis: v=2.4 cv=A8Bc+aWG c=1 sm=1 tr=0 ts=6a66e675 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=E021neyfJTmQ4KsP4ZYA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: vB9A6QI1EkMM3YAwL2shHjhEWmhV0y0x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA0NyBTYWx0ZWRfX+4xZwVWoqNtp
 klokSeuBMP4igweAPlePkaU6ldPBa9QNmWzDRabs5f/a3SY5FkbBemCCohUXGmC48Iy9NHESR7M
 3N9N1zo/ZICj+UP6UAYTI2N9cXHEzD3nOCekkgBA06K3FSqCu/4+C5sActBkmYISDYS3wG1f0xs
 0e/wQfJ/WIQ/Ki9kBN1uDVAeJHQB5qZgpFjozHmlaB2eBhw11vexK5+t29RJQ+mExhiw6O4es/w
 /3iaEUEXTbl7hC89QOQ0/AuXpkdNjLkGN6M6yiIGhKSa4lQxHayoHtIwdsZcSvxhBsKIe+izRzZ
 ntSBbnBsJLb8BhrEBRwKpevsOstDvdFr6B7AjlAu4n0ekeKUK0TrPT+VVD9jYIKu51kil0Wowpy
 fQsEsJZiafR0CtTWkQ86tp1zjoIBrljk79tEYZ0+OEmvpakTfWH3lk+6pcwXi/+2s5dRu1jL5AW
 BbTu8TOz198/pTZ7inA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA0NyBTYWx0ZWRfXysBwu9P0OSyp
 8O8UWG4wvYlhu9ZWr+Irs00TvqsGuCJ1EPaSFV5cUXBz+AxmDGWWLQsLuijAPaWCCdIpnHCuT2i
 1f/mkqzr7DBtWbYJYvmy8KNlw6eirUE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270047

Commit 10555ba6126ed ("misc: fastrpc: Replace hardcoded ctxid mask with
GENMASK") introduced uses of FIELD_GET() and FIELD_PREP() but omitted
the header that defines them.  This causes build failures on x86_64
allmodconfig:

  drivers/misc/fastrpc.c: error: call to undeclared function 'FIELD_GET'
  drivers/misc/fastrpc.c: error: call to undeclared function 'FIELD_PREP'

The missing declaration also causes a secondary -Wformat error because
the compiler treats the implicit FIELD_GET() as returning int, which
mismatches the %llx format specifier used in the dev_dbg() call.

Fix by adding #include <linux/bitfield.h>.

Fixes: 10555ba6126ed ("misc: fastrpc: Replace hardcoded ctxid mask with GENMASK")
Cc: stable@kernel.org
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 94681394c1a0..017334ea4f34 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -22,6 +22,7 @@
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <uapi/misc/fastrpc.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/bitops.h>
 #include <linux/compiler.h>
-- 
2.34.1

