Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFBF49E5DA
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789995544; cv=none; b=BMITndcDdm6VgSvyqxFPrXC5xruVI3BGXv2eS+M5nalQs2hzxeqiU6JyLGBf883Ifk6Tnq5iBqQS+hUO7vGLQTVeBIaVM5jHxVhwdRqilaBu6vnSwhqWwhkFfzFi9WT0KsXhfe14856AlPC6QT2Miv/dimtDicua90CzE92eaLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789995544; c=relaxed/simple;
	bh=OONR82+SOL/pvmQQ8fCClk/rQeXHbpvPa9nD7auDntc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WU9w39aS5hCjdlKLqbhfmFKTMtN54e1Z+BywwU+rQxP+C2NNrv8jVKJpf8AqududSIf/etKZYCrlB8/jviF+WxZzVGKt+lUdvqFbc9ZF99W2fKmiXb32nTBlHJn61OYIhrNnczYeH36D/Kpb60GxEKJlB/9Vh7bgQW3Nr8XT0Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SBrsLKw4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S0gEPMiu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SBrsLKw4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S0gEPMiu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LB4iED1129525
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:59:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ExRYRpHD1u5DXOU+rn+njvT7N53U5V0zMU/VcDkIX+Y=; b=SBrsLKw4ASNIX/mj
	+tM3xywiFEptoK1tTTiP6LLHZ2a0tudVZLo02+/zRt0W5a3GAjF+W2loiFuw0hz4
	6UnAYYlfHbMc/xmiKet5ikf/0FYfbdH1tq4bncXaWLwbniEjG/bLr3Oor9Z0t8OX
	B227Cp+vl8oGxeHnB9E34R1mzcne1+knouIy/gwcdiR6T8QiOi3EE6pcaLQ00qJR
	nkmPFybsNjka9H/FJTC5VCtAcN5Oc4tUNWOSoF38J4eLMHwnRnnwcxppkJcvXy/N
	Z7c2/3jZWsmn4l6Ld6mS2+Z4ocROodKf1hA17fCaQRoxKihsEJgB6ygxVBa5v6UD
	jsz5bQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu3csgdkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:59:00 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9806535f8ffso3211644241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789995540; x=1790600340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ExRYRpHD1u5DXOU+rn+njvT7N53U5V0zMU/VcDkIX+Y=;
        b=S0gEPMiu3ZnA1b8tJcw7aeA0LUB8Tpq2bwLEisTCUbdNQUIn6pzhA1VmNL24zuL3wx
         9HMlBSgrnORRNvXbLDDoRbweqCGPrgV+FSMunC/U/mzi58IRNXgks/Ll/ugn3vu947X4
         4UMDRovXMyfgs3pOW8yWdVXYhC1PKHQtqfn+7/FZhKo/2F9oO4Dj3u1HqM7yYAl+Wnh5
         nsowkj6rCFcWEIegh9mj9BU4HvXUcouJ7glZSYy1gGv6mZThsnbIZV2h2yaZJC3WpVTN
         yeOM2BJHYhlpJnqxRS4D1cBwqB8WCs0kZvQU0LF/vD1FsRGs/6MDt8dUMOlF9GuWsiaS
         Haug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789995540; x=1790600340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ExRYRpHD1u5DXOU+rn+njvT7N53U5V0zMU/VcDkIX+Y=;
        b=b9jgfaiuOR/CTbUtGqRmVLZ+borVCnk6W0L1If8Ppir2yTCsv/ooW6jz+LFyGqaXu8
         e952F7emLJk56iccne5PSXSeZcFAMaNZ21nKt7St5xuslzLgfHjvsRp5CLETVl+230Gg
         YvEKR4XKH4VofUZ+UjHOYqnCq8dJIrOhdC71Zff20eQTzVEUvl5ec2nNpui+9NKcP8ty
         1YwIvCfV6AtvIwVryqRrIjwzV8VK8z4R+3WDauj3bGyCNK6XlRbaq2lKRL9JygC3Y7qF
         j35ELi5/w7IgwTE5pr1EyJgcl+rNsqPGP4tOXhWAtJaZ76XR+naQvfzjEiSt6xFb/hg9
         vO8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxOj7erhyQyIHKvS30hbKru6edQEA9NXlIj3rjq9aLwNcZvisNn193vl3kwqihGOoiXpO/cXc6g7UC2mHV2@vger.kernel.org
X-Gm-Message-State: AFuF++nJIi6ghv+gSc9PvoHrEBslcsXyRQ8k5WlJXqe3/eGlKu4TW3jB
	g+12956OyvU0fAS/k/EhaI5i/PLp3IlO8tY98UwcqzXfwjYDsOGOkbuTXXBjvYSH3tUEl5LXR1U
	HnFGYFox0m+7uNthUVtlB6HFWTMMK/oYvxRdn426bCt/n1P4hZG1Da389et6/Wd2iCDIp
X-Gm-Gg: AYBFou0WzjHQh40VJ1/1Ih9zQHz4NPTOXBjMfunIWIyI2aqBa+YHmt0sSMEaXHMJy0l
	9CRMvKeV6Qu3fg3l5cEREih03nM8xrKPe00YMLRinUQRFF+D+BRm8jC+VnSwKvTFxeiPQ5rpFCt
	pXfqcPVNfuv44TjpVATrP1UjqyHApjBjuKb5KNnhdTmmFisS27tEt/dEbPlMgDR7TamfJF1vNJ3
	Nor1SjuIayMHChNPudVJroJPkJrkXcC/PmefEPJMpdWqHLTYFlKiGH5b1EzTRinFjQAsGVgktXa
	38TQGnVe6Nx4Zir3arvDqwyF2/hnNdcahQvebAbtCyio3G2yYup4jUlCn3l78/lKVuCcrlF+vlt
	VxuYNc6Dee8e+fuCmtdX5tjvRBgs=
X-Received: by 2002:a05:6102:464e:b0:7a1:f2b5:6469 with SMTP id ada2fe7eead31-7a1f2b56540mr3242010137.38.1789995539752;
        Mon, 21 Sep 2026 05:58:59 -0700 (PDT)
X-Received: by 2002:a05:6102:464e:b0:7a1:f2b5:6469 with SMTP id ada2fe7eead31-7a1f2b56540mr3241993137.38.1789995539360;
        Mon, 21 Sep 2026 05:58:59 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a359037aasm320278766b.63.2026.09.21.05.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:58:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:58:18 +0200
Subject: [PATCH v8 09/14] crypto: qce - Only register algos if the user
 really wants it
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-qce-fix-self-tests-v8-9-107537869a72@oss.qualcomm.com>
References: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
In-Reply-To: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsSnxe6yVWDsKagQxZekUU7x5OLdHaAqEOhNwy
 NZzfhuiXtuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarEp8QAKCRAFnS7L/zaE
 w8bpD/9cBfj1WlEMGJPPYV4jTYLXwfOH0h0C1Lo7lGZjUmbSvnHlzE8xTAz8cj19M2PiYojSGZ+
 al/OTOisucdPDknDb3a26AigD3kTN+YIUqxDtB5yrZACpI89iTZYZh0nMlu57wo+eUhXwaP1dpt
 wNfgO5AJB6zhzV6TVngYyEKdLFpGxWatQGvXJjF47h2a34jsSZ4JNYQTiw2zCGOY5FT+tipC4Tk
 1o6HchiLCmuLIQY4JMPfs0fkAwsh2RJfvsc1iTKGzt2oAgBebCXh4bgYgMW4BbOCZ+MYsjiG+VF
 +eP7KMn0dMm5vYKuDf7RQorJASqkWGFv9StXJ5tMOmf3rNaStIIawVNzjdfrw9i+bBfPSt5d7z2
 3wDlvoLlcpfxcjzfCbe/Iq9kf+rLE64YOloz8prYBe0UPQdbjHYZxMZp1qiwl0Hc8oi33J89yvt
 78W+qxKjWRdTVv6cy4rqXT2AMoeAPGl7p/kdPpM+yr57CH7xA9zRNWbxge5/2Wy4SmL0Yo/T7+6
 dTsVTIcOMVkqOASf7gJPEtw0qiNeUM5o2FkqmnGtDp+YRNXeTHn2Gj/ie30cAUZVe3TrEVRilaY
 FEEDh73xdMeQq1q18HSKz6kzyPN61r3bPqdlnB2kYzO1RRpukSAMq4cNJAeK/uJFQyZqRB0S8/x
 pBFN3k5mHsxOBkw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfXyyfWVKs8k07n
 ACMMKlS82fEQ+O0wvpVGRrp9qdRTx9VaMlcAdBNvG3Rg0OyjgsAFBQPOg5v2ASus0vbtuYmy91p
 Y8TcGuHpYIOAm0Jdz8zqCMaGMfwfdDg=
X-Proofpoint-GUID: 6U0yskStypJUi6WB5dQVglSVWavSbmlv
X-Authority-Analysis: v=2.4 cv=QovLTlyd c=1 sm=1 tr=0 ts=6ab12a14 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=s_o0qblw2luIdUq6tZ4A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfX4fDlDOrxUUOv
 kC9kKVZsnibzSNJXObRpXQXLUSE0v+n4DSEVug4T4P8uUv+VwWRmA48t180+TvlbMLqAwXmwciy
 ww/47iwQjtQGPF/8EOJN7BE9gzj22IwBqR3Zn65a6vzu9HXpoMGlc+y9WlBthd/Ufi29z2oL4wg
 /Cc4JY2Ptf0CWZCU6jLGzoaLRJRJ3hn4V6n8xt/qYz7gMQCJmu9QrjUNRzj8L2h7WCq0v3vBb+s
 8aFpuaXhnCXt5or/TtR6Yq1qQ8fLsbykMBj0R8w89LYGNfHUXJWbfSe2Zh6FZd1SdWUdkBBIG60
 6C6O2xBF0TK+crCMOkgO2MIYoJl/Z1aqxxaurn7386NR6K1IAkbShovymRzgq+Fe3VmeG6QeOvY
 FTVFXL8DwGlTWp4YcGDC8FS7wgRakJ4l+IW9JMsABJIN/5fo6lD0zZokUay6zDuGdDlr7ecyuBb
 3NN6xwk666AG4vXwrzQ==
X-Proofpoint-ORIG-GUID: 6U0yskStypJUi6WB5dQVglSVWavSbmlv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210187

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

