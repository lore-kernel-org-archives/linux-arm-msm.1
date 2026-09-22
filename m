Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9802954DAC1
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 12:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081895; cv=none; b=jJpKIR1zIiPOkWJ2oCAlcJ8LwRPNV7AGEHOKiJUGEAR3xSBppvyb1qgf9j+JAbMHN8R0WhQIAwFye3Bx/KB/+cfS+zUmL9rs1JSsDz7/3jICkfMu637RrVzyowUV0l+k1h3hS+GUk4TrC4V50/H4Lhgpkj27DwIIPzU7fpIXfOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081895; c=relaxed/simple;
	bh=OONR82+SOL/pvmQQ8fCClk/rQeXHbpvPa9nD7auDntc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N5k7O3U9iU8tvGQ7WlFIYl+86tT78+qbf3BdY5k+xwzfbUizSB6E4VqmKUQTndsMizLaSLnELPcfU+nqe9m+po9e7LzoxC3+dSMnPOd218geT6G/vhBlAOFGca7W4dwW8UW1r/uw2z1N9AZhKUzdO3AoHGowzCHCOF8a6H1ajco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=imjodOCp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F/HpFLa4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="imjodOCp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F/HpFLa4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPaeo2869459
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 12:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ExRYRpHD1u5DXOU+rn+njvT7N53U5V0zMU/VcDkIX+Y=; b=imjodOCpU3ZL0tCY
	ABBUU0j7B63ds1f3/1jPcNFiY9j/ILFCT5RdsJAWq9KUPTF8v28rJDd4bzC8ulUK
	vZT1vyGqyE+0ACgjKil5MbXn56JjmZbGE5FtvMOvpyMQyIujvE1+R3ppLP3X+wdM
	dZxYPjcv8JUTY7wzO1RmDgRAf0JLEB6RQvb62BxBL+/fi2Tp0b4SNRbA9ulxsJS3
	UaJlWn9lBzIVcalPC/zlrKnTzLXfny6YhwjY51rq/EJ9UBmLdcT6GbZkksdY6bX4
	VXOy5SdZiT9qKezhlZ6vlC1qkgS7fd+UfpXU58u9+HoehPiO+OYkX7kpo5K5AaVL
	UkG4rw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj112345-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 12:58:08 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c683ca769dso1189012e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 05:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081887; x=1790686687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ExRYRpHD1u5DXOU+rn+njvT7N53U5V0zMU/VcDkIX+Y=;
        b=F/HpFLa4ARiYgGS+tq1qPclSzI6LvKw+PDChNdF8lwnZpxkbNGP5rgYJqawlwBc1mN
         QhY6N4Qc1Fc46Hs0xcKken5Xqq46kyRtsL7epz0HRXW1hSd1H+y8lJhfUFtDsxo5E9K+
         l+0jquMX6Byx/5yztIhvkH7N0Ez+V97WwEJd57gmnu75TYAmnVufGndndGwoyea9j4QK
         BmxsImBSM1dzEUa2MnR8VytO1pQ2BqceubtY3sohJ/aP3u7f2pQsF0efzpLpXGRSwuHu
         FohfEJ5xR1C1xzCLGw2uHv2xb9wQdVv4KMInVCSFuFceN1j9Flkc6qKKMm2OQV6JUJc6
         N/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081887; x=1790686687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ExRYRpHD1u5DXOU+rn+njvT7N53U5V0zMU/VcDkIX+Y=;
        b=soPPEJrC6uamq/HeCAAWc45pCBiQCogpT4yWvWgsA/rjx38GaqE/TBWqLpuIDPg9pL
         KVjpTOk38u1wei2G9+5kpbj5b/imbtOYnl6HAmPm7cdFapqdQFinpdyHueBVwfjAP9V9
         CYfeT20n7wPseWrd1VdLFCHi9sBRSa7SrY0ANWNZb6AgjW22DXvdH9MZTOHrd39z63l6
         LsLLnkfT6VqC9nY+fDLr7/Q2o86qc6E9HaZ/Nfp8kljfz1Ss9EJWJHC6pTBxLCBizBbt
         DJxvd0TPktA7LRSuRBIMfM70KqrwdWqYgqXm5HP5r51nm03wwT1JETbesw6VAmYm+miB
         C2Fw==
X-Forwarded-Encrypted: i=1; AKwUvBzgvok4JsEilDr8/Hu8kr99JvMwzWy6TA8y6S2RLK8sZ+AI3p+/Mi7vX8eEebVZXa12Uw4dDOMP1n8n7GB9@vger.kernel.org
X-Gm-Message-State: AFuF++mBueRW8GnxRAw8muBDuwYA7LtT+oWJMruXaVjNUmp0rpuM7YtC
	TAAIIuxKqcL5oqo2UJvaysAe6OQ5gnUsQ2Eo5VfvW3Rh8EEfwrN/ROoMZ0XkF0VxIP+Rt50R/3k
	vKeOAWoz0Wsp2QdPUaAnreZszxdv+pOcvvTr5VaGj1CkQWMNW/lZKkIse8qRitO+g6Sqo
X-Gm-Gg: AYBFou0+o1R+PAlRwGd0EQqtOOoUtaBjE2QPqdw4YIRLRL7RrNcQfjMEPsOf/g2yFUO
	IZIFrT66Mr8Wkdub/eHz0FdTEVkcgXz63sequJmYWZGplP8ixP7axOLwuhoD1k5/TDXsQRnKRQQ
	qaovOjbGTQDdJNlXSeg+4XgfgElqqtDgN5KaFMXHNPsFP7ci9OSVoH8XpEz8UaOomDp99SGTW/I
	qhYpqbznAU43fCgEtOHaGdu44q3xIbiM3D9jVnSAdzTNxVKtT6I+hAvvhW/rEO4btQYVKlm91J2
	zQkn5zSGiiGX8NXtLXQR62SaTHOpiqY7pskI/rEkQ7R95FiMJ3xWhen5zhggQg1aIr6YnKnhFM9
	QSc+x4T3+6/O02RFrICY9lgj8fgQ=
X-Received: by 2002:a05:6122:e469:b0:5c9:a60d:327c with SMTP id 71dfb90a1353d-5c9b59d03dcmr8273219e0c.16.1790081887375;
        Tue, 22 Sep 2026 05:58:07 -0700 (PDT)
X-Received: by 2002:a05:6122:e469:b0:5c9:a60d:327c with SMTP id 71dfb90a1353d-5c9b59d03dcmr8273176e0c.16.1790081886875;
        Tue, 22 Sep 2026 05:58:06 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa4537b5dsm1097669a12.30.2026.09.22.05.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:58:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:57:24 +0200
Subject: [PATCH v9 09/14] crypto: qce - Only register algos if the user
 really wants it
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-qce-fix-self-tests-v9-9-b1aa742e79af@oss.qualcomm.com>
References: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
In-Reply-To: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1924;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OONR82+SOL/pvmQQ8fCClk/rQeXHbpvPa9nD7auDntc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsns+Jn9LOydwcM4CQoOQWJBlbAD5RhyrMWVVT
 Lw9g3EbryqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarJ7PgAKCRAFnS7L/zaE
 w6NDD/9+OnKDBRr8GX6+fdaUuDfZSNtFgYmmVPzjMwA3VfL8hARj08E5EP9nfQPqwxaFforsz9R
 wkn8ot5FQy0BTnhJVdDdXu9Y4btFaS2KFIn4w3Pm7nTN1QzXMuHi7wCJRh3OaXP90eguBImde2P
 HxEMWRJgCKGCY5b3zUPVBNXBXpW+DFoOOF9d4IRQt9/4C2rZF3aX7i4nzuBPPAWRgSznTT0hWhQ
 g++GaMhja6TziHwkTu+JHecWoxnML75DC8vjozQOwXfRgHuiNUaaBbC5zht+iDp53aSD9rpnBDa
 naWjYjp3EVz+gpZL3o95mHT6qWwCvE43c37DCJFL3ZTWZvc+zpJ3MNyQwyaYiS0Qfn3M0rIop8d
 YHhl+18yissDcX0Z/CSoJLF2bVVNLPNW04W0ST9+Cp7+uBr2OwtWd/4F5+fXIOlXhoHqMdcD2OB
 8bQgBT3SUvXvR/bF2IfThMCRE3jCb5N1RKfMvdx8IS+4WEYr920gg4VG54zRBuHaYoSXqmd98HI
 3Lck2utJVZA+xGKmSrLAGVyJnji026sz5Axr2iaiONEdF7gW65EfOUOckxsWAb4HAsRx8Ic+h6E
 UtdYovwgqrnW8+QsH45ueSEudY7gFOzwUGfXTAbHkXwgmYuuQp5LnaGJRAWY/VOBLpB1ENAa4zb
 zhCsOHy8yR5iR6w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: xnpBt5PktVkH9JlwEfmsVWHy05YoJ7eU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX5dta9LuaI+oF
 VJRkgSpBoH2o+UzxfzuU9utzuIedyhF27Aa0ymgTTTuFu0ltm0CFvbJPKpohR0gq1DFSXN0wpD8
 NDjldwG7e7R9oWz5cYsduaOgMfFCAXo=
X-Proofpoint-ORIG-GUID: xnpBt5PktVkH9JlwEfmsVWHy05YoJ7eU
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab27b60 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=s_o0qblw2luIdUq6tZ4A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX2SLfH5x92m19
 jVIbic336yl/yDc6qtsVGtrUP2SBdkF8tE5Z+QfIGn4vCyKZCmG+j/O0a44SXxlOGh9KeW0vu0m
 PI19vPnQScWAMWUgFFb2ftXHC+37s1z7WIMVS0c3nd9pYmKb+x7op/gaD/dGH/VqT2VTEhLBGtN
 4IKkGgMDDpNLZMJjackOL3V//sUTrbRP3ejyd/4+NJ672YI+CT8npfEelYBA1Ks8vl4DP/sXnfL
 I7efxc3dc5ykgk7chQFKxV6AzCZ5wu9DhLWUmtLzM8HJSFYzlEcqhzZSzytZ2oOlEOV7F48+z9Z
 4bFLAYO3IQY59/BGQsvOaCghTa6zNy/UIP7kVGH4gKSB87X+BSw0jdzrtdG6ELY1My1EUQ3UTMO
 Vf1+HN6+fUXXUg9zgk8dOFhqx2VsTo0BVK8EVLYPYF5N8v6j6Sm2xfQRgPfCRMcXwaw/iVbWw9N
 fxlWC2/DH6xVkyAXHGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220187

This driver's crypto algorithms still have a few issues that need
addressing which don't currently trigger any self-test failures. For
that reason: don't register the algorithms unless the user really wants
it.

Add a module parameter to the QCE driver that by default causes the
driver to *not* register the crypto algorithms. It will only be one if
the user explicitly passes the do_register_algos argument as true.

The power-management part of the driver is kept as is to allow scaling
down of interconnects gating of clocks by runtime PM.

Cc: stable@vger.kernel.org
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index bf3c1bc3ba7bde5e5d08e06071c67ba77af95695..5b1bf7a50f88c890da1f0820fb9e070b3d3f4708 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -10,6 +10,7 @@
 #include <linux/interconnect.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
@@ -22,6 +23,9 @@
 #include "sha.h"
 #include "aead.h"
 
+static bool do_register_algos;
+module_param(do_register_algos, bool, 0444);
+
 #define QCE_QUEUE_LENGTH	1
 
 #define QCE_DEFAULT_MEM_BANDWIDTH	393600
@@ -259,9 +263,11 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
-	ret = devm_qce_register_algs(qce);
-	if (ret)
-		return ret;
+	if (do_register_algos) {
+		ret = devm_qce_register_algs(qce);
+		if (ret)
+			return ret;
+	}
 
 	/* Configure autosuspend after successful init */
 	pm_runtime_set_autosuspend_delay(dev, 100);

-- 
2.47.3

